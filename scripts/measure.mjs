/**
 * docs に書いてある「実測」を、その場で測り直す。
 *
 * 数を書くと古びる。実際 `docs` の実測値は、記事が増えたぶんだけずれていた
 * （前提の平均 2.6→2.3、錨 827→1157、添えた主張 328→598）。
 * 書いた時点では正しいので、読んだ側は疑いようがない。
 *
 * **測り直す手を一つ置いておく。** `npm run measure` で全部出る。
 * docs を直すときは、まずこれを走らせる。
 *
 * `dist` を見る項目があるので、`npm run build` のあとに走らせること。
 */

import { readdir, readFile, stat } from 'node:fs/promises'
import { gzipSync } from 'node:zlib'
import { join } from 'node:path'

const walk = async (dir, ext) => {
  const found = []
  for (const name of await readdir(dir)) {
    const path = join(dir, name)
    if ((await stat(path)).isDirectory()) found.push(...(await walk(path, ext)))
    else if (name.endsWith(ext)) found.push(path)
  }
  return found
}

const count = (text, re) => (text.match(re) ?? []).length

const articles = await walk('src/content/articles', '.typ')
const notes = await walk('src/content/notes', '.typ')

let checks = 0
let withCheck = 0
for (const path of articles) {
  const n = count(await readFile(path, 'utf8'), /#check/g)
  checks += n
  if (n > 0) withCheck += 1
}

console.log('# 書くもの')
console.log(`  記事                    ${articles.length} 本`)
console.log(`  講義ノート               ${notes.length} 本`)
console.log(`  想起の問い               ${checks} 問（記事 ${withCheck} 本に置いてある）`)

let html = []
try {
  html = await walk('dist', '.html')
} catch {
  console.log('\n（dist が無い。npm run build のあとに走らせると、残りも出る）')
  process.exit(0)
}

let anchors = 0
let peekStatement = 0
let peekPage = 0
let equations = 0
let numbered = 0
for (const path of html) {
  const s = await readFile(path, 'utf8')
  anchors += count(s, /class="anchor"/g)
  peekStatement += count(s, /<span class="peek-body" aria-hidden/g)
  peekPage += count(s, /class="peek-body peek-page/g)
  equations += count(s, /class="equation[" ]/g)
  numbered += count(s, /equation-tagged/g)
}

console.log('\n# 出すもの')
console.log(`  ページ                  ${html.length}`)
console.log(`  主張の錨                ${anchors}`)
console.log(`  参照に添えた主張         ${peekStatement} か所`)
console.log(`  参照に添えた記事         ${peekPage} か所`)
console.log(`  別行立て数式             ${equations}（番号を出すもの ${numbered}）`)

// 添えたぶんの重さ。中身を落とした版と比べる。
const strip = (s) =>
  s.replace(/<span class="peek-body[^"]*" aria-hidden="true">[\s\S]*?<\/span><\/span>/g, '</span>')

const samples = []
for (const path of html) {
  const s = await readFile(path, 'utf8')
  const bare = strip(s)
  if (bare.length === s.length) continue
  samples.push({
    path: path.slice('dist/'.length),
    raw: (s.length / bare.length - 1) * 100,
    gz: (gzipSync(s).length / gzipSync(bare).length - 1) * 100,
  })
}
samples.sort((a, b) => a.gz - b.gz)

const edge = (list) => `${list[0].gz.toFixed(1)}〜${list[list.length - 1].gz.toFixed(1)}%`
console.log(`\n  添えたぶん  生 ${samples[0].raw.toFixed(1)}〜${samples[samples.length - 1].raw.toFixed(1)}%`)
console.log(`             gzip ${edge(samples)}（上端 ${samples[samples.length - 1].path}）`)
