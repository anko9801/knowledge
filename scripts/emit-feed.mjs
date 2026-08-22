/**
 * Atom フィードを dist へ置く。
 *
 * 設計の目標は「47 秒の初回訪問を生き延び、**再訪に報いる**こと」だった
 * （`docs/reader.md`）。ところが再訪の手段が、覚えて自分で来ることしか無い。
 * 入口に「最近書いたもの」を出してはいるが、それは来た人にしか見えない。
 *
 * 依存は足さない。front matter を `.typ` から直接読んで組み立てる。
 * front matter は `#show: post.with(...)` の中にあり、必要なのは 5 つだけなので
 * Typst を起動せずに拾える（起動すると 88 本ぶんの時間がかかる）。
 */

import { readdir, readFile, stat, writeFile } from 'node:fs/promises'
import { join } from 'node:path'

const OUT = 'dist'
const ARTICLES = 'src/content/articles'
const SITE = (process.env.SITE_URL ?? 'https://anko9801.github.io').replace(/\/$/, '')
const BASE = (process.env.SITE_BASE ?? '/knowledge').replace(/\/$/, '')
const KEEP = 20

const typFiles = async (dir) => {
  const found = []
  for (const name of await readdir(dir)) {
    const path = join(dir, name)
    if ((await stat(path)).isDirectory()) found.push(...(await typFiles(path)))
    else if (name.endsWith('.typ')) found.push(path)
  }
  return found
}

const field = (source, key) => (new RegExp(`${key}: "([^"]*)"`).exec(source) ?? [])[1]

const escape = (text) =>
  text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')

const entries = []
for (const path of await typFiles(ARTICLES)) {
  const source = await readFile(path, 'utf8')
  if (/draft:\s*true/.test(source)) continue

  const [, , , dir, series, file] = path.split('/')
  const order = Number.parseInt(file, 10)
  const title = field(source, 'title')
  const date = field(source, 'date')
  if (!title || !date) continue

  entries.push({
    title,
    date,
    summary: field(source, 'summary') ?? '',
    url: `${SITE}${BASE}/${dir}/${series}/${order}.html`,
  })
}

// 同じ日付が並ぶので、日付が同じときは URL で決める。
// 決めておかないと、内容が変わっていないのに毎回並びが動く。
entries.sort((a, b) => (b.date === a.date ? b.url.localeCompare(a.url) : b.date < a.date ? -1 : 1))

const recent = entries.slice(0, KEEP)
const updated = `${recent[0]?.date ?? '1970-01-01'}T00:00:00Z`

const body = recent
  .map((entry) =>
    [
      '  <entry>',
      `    <title>${escape(entry.title)}</title>`,
      `    <link href="${entry.url}"/>`,
      `    <id>${entry.url}</id>`,
      `    <updated>${entry.date}T00:00:00Z</updated>`,
      `    <summary>${escape(entry.summary)}</summary>`,
      '  </entry>',
    ].join('\n'),
  )
  .join('\n')

await writeFile(
  join(OUT, 'feed.xml'),
  `<?xml version="1.0" encoding="UTF-8"?>\n` +
    `<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="ja">\n` +
    `  <title>knowledge</title>\n` +
    `  <link href="${SITE}${BASE}/"/>\n` +
    `  <link rel="self" href="${SITE}${BASE}/feed.xml"/>\n` +
    `  <id>${SITE}${BASE}/</id>\n` +
    `  <updated>${updated}</updated>\n` +
    `${body}\n</feed>\n`,
)

console.log(`feed.xml に ${recent.length} 本を並べた`)
