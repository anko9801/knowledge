/**
 * sitemap.xml と robots.txt を dist へ置く。
 *
 * このサイトの読者には**検索から 1 本だけ来る人**が混じっている、というのが
 * 設計の前提になっている（`docs/reader.md`）。ところが機械の側に、
 * どこに何があるかを渡していなかった。
 *
 * 連載は前後リンクで繋がっているので辿れるが、概念のページ 300 枚あまりは
 * 索引からしか辿れず、深いところにある。sitemap があれば 1 往復で全部渡る。
 *
 * 依存は足さない。`postbuild` で dist を歩いて書き出すだけで済む。
 */

import { readdir, stat, writeFile } from 'node:fs/promises'
import { join } from 'node:path'

const OUT = 'dist'
const SITE = (process.env.SITE_URL ?? 'https://anko9801.github.io').replace(/\/$/, '')
const BASE = (process.env.SITE_BASE ?? '/knowledge').replace(/\/$/, '')

const htmlFiles = async (dir) => {
  const found = []
  for (const name of await readdir(dir)) {
    const path = join(dir, name)
    if ((await stat(path)).isDirectory()) found.push(...(await htmlFiles(path)))
    else if (name.endsWith('.html')) found.push(path)
  }
  return found
}

const pages = (await htmlFiles(OUT))
  .map((path) => path.slice(OUT.length).replace(/\\/g, '/'))
  // pagefind が置く道具のページは読み物ではない。
  .filter((path) => !path.startsWith('/pagefind/'))
  .sort()

const url = (path) => `${SITE}${BASE}${path}`

const body = pages.map((path) => `  <url><loc>${url(path)}</loc></url>`).join('\n')

await writeFile(
  join(OUT, 'sitemap.xml'),
  `<?xml version="1.0" encoding="UTF-8"?>\n` +
    `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${body}\n</urlset>\n`,
)

// PDF は sitemap に入れない。同じ中身が HTML 側にあるので、
// 検索結果に二つ並べても読者の選択肢が増えるわけではない。
await writeFile(
  join(OUT, 'robots.txt'),
  `User-agent: *\nAllow: /\n\nSitemap: ${SITE}${BASE}/sitemap.xml\n`,
)

console.log(`sitemap.xml に ${pages.length} ページを並べた`)
