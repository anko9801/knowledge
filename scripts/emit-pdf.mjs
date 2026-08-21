/**
 * 記事を PDF にして dist へ置く。
 *
 * `.typ` は最初から二つの出力を持つように書いてある（`template.typ` が `target()` で
 * 分岐する）。HTML 側だけ使って PDF を捨てているのは、書いた仕組みの半分を
 * 使っていないことになる。紙で読む、印刷する、書き込む、手元に置く——
 * どれも「47 秒の初回訪問」とは別の読み方で、そこに応えるものが無かった。
 *
 * URL は HTML と揃える。`/math/measure/2.html` の隣に `/math/measure/2.pdf` が出る。
 *
 * typst の起動は CPU 数まで並べる。1 本 0.2 秒ほどなので、86 本で数秒に収まる。
 */

import { execFile } from 'node:child_process'
import { cpus } from 'node:os'
import { mkdir, readdir, readFile, stat } from 'node:fs/promises'
import { dirname, join } from 'node:path'
import { promisify } from 'node:util'

const run = promisify(execFile)

const BIN = process.env.TYPST_BIN ?? 'typst'
const ROOT = process.cwd()

// 和文フォントを system の fc-list に任せると、環境によって和文が豆腐になったまま
// 86 本が出てしまう。しかも PDF なので、開くまで気づけない。devShell が
// PDF_FONT_PATH を渡すので、あれば明示的に typst へ食わせる。
const FONT_PATH = process.env.PDF_FONT_PATH
const fontArgs = FONT_PATH ? ['--font-path', FONT_PATH] : []
const ARTICLES = 'src/content/articles'
const OUT = 'dist'

/** front matter から出力先を決める。HTML と同じ URL の並びにする。 */
const destination = (source) => {
  const [field, series, file] = source.slice(`${ARTICLES}/`.length).split('/')
  const order = Number.parseInt(file, 10)

  return join(OUT, field, series, `${order}.pdf`)
}

const typFiles = async (dir) => {
  const found = []
  for (const name of await readdir(dir)) {
    const path = join(dir, name)
    if ((await stat(path)).isDirectory()) found.push(...(await typFiles(path)))
    else if (name.endsWith('.typ')) found.push(path)
  }
  return found
}

/** 同時に走らせる数を絞る。typst は 1 本ずつが速いので、並べるだけでよい。 */
const inPools = async (items, limit, work) => {
  const queue = [...items]
  const workers = Array.from({ length: Math.min(limit, queue.length) }, async () => {
    for (let item = queue.shift(); item !== undefined; item = queue.shift()) await work(item)
  })
  await Promise.all(workers)
}

const sources = (await typFiles(ARTICLES)).sort()

// draft は HTML にも出ていないので、PDF も出さない。
const published = []
for (const source of sources) {
  if (!/draft:\s*true/.test(await readFile(source, 'utf8'))) published.push(source)
}

let made = 0
const failed = []

await inPools(published, Math.max(1, cpus().length - 1), async (source) => {
  const out = destination(source)
  try {
    await mkdir(dirname(out), { recursive: true })
    await run(BIN, ['compile', source, '--root', ROOT, ...fontArgs, out], {
      maxBuffer: 16 * 1024 * 1024,
    })
    made += 1
  } catch (error) {
    failed.push(`${source}: ${error instanceof Error ? error.message.split('\n')[0] : error}`)
  }
})

console.log(`PDF ${made} 本を dist へ置いた`)

// PDF が 1 本落ちても HTML の公開は止めない。読めなくなるわけではないので、
// 記録だけ残して先へ進む。
if (failed.length > 0) {
  console.warn(`PDF にできなかったもの ${failed.length} 本:`)
  for (const line of failed) console.warn(`  ${line}`)
}
