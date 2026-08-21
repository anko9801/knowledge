import { deepStrictEqual, ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { highlightCode } from './shiki.ts'

const block = (lang: string, body: string) =>
  `<pre><code data-lang="${lang}">${body}</code></pre>`

/**
 * 出力から素の文字列を取り出す。
 *
 * 逃がし方は Shiki の都合で決まる（`<` は `&#x3C;`、`>` は素のまま）ので、
 * 形ではなく往復した中身を見る。本体と同じ理由で、置換は一度で済ませる。
 */
const plain = (html: string): string =>
  html
    .replace(/<[^>]*>/g, '')
    .replace(
      /&(?:#x([0-9a-fA-F]+)|#(\d+)|(lt|gt|quot|amp));/g,
      (whole, hex?: string, dec?: string, name?: string) => {
        if (hex !== undefined) return String.fromCodePoint(parseInt(hex, 16))
        if (dec !== undefined) return String.fromCodePoint(Number(dec))
        return { lt: '<', gt: '>', quot: '"', amp: '&' }[name as string] ?? whole
      },
    )

test('Typst の色を捨てて、Shiki の変数に置き換える', async () => {
  const { html } = await highlightCode(
    block('c', '<span style="color: #d73948">static</span> int x;'),
  )

  // 焼き込まれた色は残さない。載るのは明暗の対だけ。
  strictEqual(html.includes('#d73948'), false)
  ok(html.includes('--shiki-light:'))
  ok(html.includes('--shiki-dark:'))
})

test('実体参照を戻してから渡す', async () => {
  const { html } = await highlightCode(block('c', 'a &lt; b &amp;&amp; c &gt; d'))

  // 戻し損ねると、画面に &lt; がそのまま出る。
  strictEqual(plain(html), 'a < b && c > d')
})

test('& は最後に戻す', async () => {
  const { html } = await highlightCode(block('c', 'x = &amp;lt;'))

  // 元の文字列は `x = &lt;`。先に & を戻すと置換が二重に効いて `x = <` になる。
  strictEqual(plain(html), 'x = &lt;')
})

test('言語の指定が無くても通す', async () => {
  const { html, unknown } = await highlightCode('<pre><code>ただの文字列</code></pre>')

  ok(html.includes('ただの文字列'))
  deepStrictEqual(unknown, [])
})

test('知らない文法は素通しして、名前を返す', async () => {
  const { html, unknown } = await highlightCode(block('brainfuck-2000', '+++'))

  ok(html.includes('+++'))
  deepStrictEqual(unknown, ['brainfuck-2000'])
})

test('コードが無ければ何も変わらない', async () => {
  const html = '<p>本文だけ</p>'
  strictEqual((await highlightCode(html)).html, html)
})

test('塊が複数あっても、前後の本文が崩れない', async () => {
  const html = `<p>前</p>${block('c', 'int a;')}<p>中</p>${block('c', 'int b;')}<p>後</p>`
  const out = (await highlightCode(html)).html

  ok(out.startsWith('<p>前</p>'))
  ok(out.includes('</pre><p>中</p><pre'))
  ok(out.endsWith('<p>後</p>'))
  strictEqual(out.split('<pre').length - 1, 2)
})
