import { deepStrictEqual, strictEqual } from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { test } from 'node:test'

import { typstInMarkdown } from './typst-in-markdown.ts'

const lines = (text: string) => typstInMarkdown(text).map((f) => f.line)

test('Typst の関数呼び出しを見つける', () => {
  deepStrictEqual(lines('ふつうの行\n本文が#strong[対比している]節\nまた本文'), [2])
})

test('数式の中の Typst 綴りを見つける', () => {
  deepStrictEqual(lines('$g approx 0.32$ である'), [1])
  deepStrictEqual(lines('$sigma$ 加法族'), [1])
  deepStrictEqual(lines('$bold(+0.33)$'), [1])
})

test('LaTeX は通す', () => {
  deepStrictEqual(lines('$\\mathbb{R}^3$ の話'), [])
  deepStrictEqual(lines('$A \\le_p B$ が成り立つ'), [])
  deepStrictEqual(lines('$g = 0.50$、$d = -0.40$'), [])
})

test('囲みコードの中は見ない（そこに Typst を書くのは正しい）', () => {
  const md = ['前置き', '```typst', '#check[問い][答え]', '$g approx 1$', '```', '後書き'].join('\n')
  deepStrictEqual(lines(md), [])
})

test('インラインコードの中も見ない', () => {
  deepStrictEqual(lines('`#check[問い][答え]` と書く'), [])
  deepStrictEqual(lines('`$sigma$ 加法族` ではなく `σ 加法族`'), [])
})

test('囲みが閉じたら、また見るようになる', () => {
  const md = ['```', '#strong[中]', '```', '#strong[外]'].join('\n')
  deepStrictEqual(lines(md), [4])
})

test('1 行に複数あっても 1 件にまとめる', () => {
  strictEqual(typstInMarkdown('$sigma$ と $omega$').length, 1)
})

// 実ファイルに当てる。ここが本番で、上は仕掛けの確認でしかない。
for (const path of [
  'README.md',
  'docs/build.md',
  'docs/reader.md',
  'docs/decisions.md',
  'CLAUDE.md',
]) {
  test(`${path} に Typst 記法が混ざっていない`, () => {
    const found = typstInMarkdown(readFileSync(path, 'utf8'))
    const report = found.map((f) => `  ${path}:${f.line}  ${f.text.slice(0, 70)}`).join('\n')
    strictEqual(found.length, 0, `Markdown に Typst の記法が混ざっている\n${report}`)
  })
}
