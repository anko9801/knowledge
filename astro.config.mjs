import { defineConfig } from 'astro/config'

// GitHub Pages はリポジトリ名がパスに入る（anko9801.github.io/knowledge）。
// 独自ドメインを当てるか Cloudflare へ移すときは base を外すだけでよい。
const site = process.env.SITE_URL ?? 'https://anko9801.github.io'
const base = process.env.SITE_BASE ?? '/knowledge'

export default defineConfig({
  site,
  base,
  // 完全な静的出力。ランタイム JS はゼロで、転送されるのは HTML / CSS / 数学フォントのみ。
  output: 'static',

  build: {
    // .html を掘らずに posts/foo.html を素直に出す。
    format: 'file',

    // 既定の 'auto' は 4kB 未満の CSS を各ページにインライン展開してしまう。
    // MathML 用 CSS を head から 1 度だけ抜き出して共有配布した意味が消えるので、
    // 必ず外部ファイルにする。リクエストが 1 本増える代わりに全ページで使い回る。
    inlineStylesheets: 'never',
  },

  markdown: {
    // 本文は .typ 側で組むので、Markdown 経路のシンタックスハイライトは要らない。
    syntaxHighlight: false,
  },
})
