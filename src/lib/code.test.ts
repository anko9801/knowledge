import { deepStrictEqual, ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { mapCodeColors } from './code.ts'

test('焼き付けられた色がクラスになる', () => {
  const { html } = mapCodeColors(
    '<pre><code><span style="color: #d73948">static</span> ' +
      '<span style="color: #4b69c6">f</span></code></pre>',
  )

  ok(html.includes('<span class="tok-keyword">static</span>'))
  ok(html.includes('<span class="tok-fn">f</span>'))
  strictEqual(html.includes('style="color:'), false)
})

test('既定テーマの色すべてに行き先がある', () => {
  const colors = ['#74747c', '#d73948', '#4b69c6', '#198810', '#b60157', '#1d6c76']
  const { html, unmapped } = mapCodeColors(
    colors.map((c) => `<span style="color: ${c}">x</span>`).join(''),
  )

  deepStrictEqual(unmapped, [])
  strictEqual(html.split('class="tok-').length - 1, colors.length)
})

test('知らない色は残し、報告する', () => {
  const { html, unmapped } = mapCodeColors('<span style="color: #123456">x</span>')

  // 消すと強調が失われる。気づけるように、そのまま残して名前だけ返す。
  ok(html.includes('style="color: #123456"'))
  deepStrictEqual(unmapped, ['#123456'])
})

test('同じ色が何度出ても、報告は一度だけ', () => {
  const { unmapped } = mapCodeColors(
    '<span style="color: #abcdef">a</span><span style="color: #abcdef">b</span>',
  )

  deepStrictEqual(unmapped, ['#abcdef'])
})

test('本文の色は触らない', () => {
  const html = '<p style="color: #d73948">本文</p>'

  // 拾うのは span だけ。段落や図に付いた色は Typst 側の意図なので残す。
  strictEqual(mapCodeColors(html).html, html)
})
