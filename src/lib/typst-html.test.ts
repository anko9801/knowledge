import { ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { wrapBlockEquations } from './typst-html.ts'

const block = (attrs = '') => `<math${attrs} display="block"><mi>x</mi></math>`

test('別行立て数式はラッパーで包まれる', () => {
  const out = wrapBlockEquations(block())
  ok(out.startsWith('<div class="equation">'))
  ok(out.includes('display="block"'))
})

test('指されていない式には番号を出さない', () => {
  // 実測で 3136 個中 3059 個がこれ。参照されない採番は体裁を足すだけになる。
  strictEqual(wrapBlockEquations(block()).includes('equation-tagged'), false)
})

test('id を持つ式にだけ、番号を出す印が付く', () => {
  const out = wrapBlockEquations(block(' id="Ampere"'))
  ok(out.includes('class="equation equation-tagged"'))
  // id は元の要素に残す。ラッパーへ移すとリンク先がずれる。
  ok(out.includes('<math id="Ampere"'))
})

test('行中の数式には触らない', () => {
  const inline = '<math><mi>x</mi></math>'
  strictEqual(wrapBlockEquations(inline), inline)
})

test('同じページに複数あっても、それぞれ包まれる', () => {
  const out = wrapBlockEquations(block() + block(' id="a"'))
  strictEqual(out.split('class="equation').length - 1, 2)
  strictEqual(out.split('equation-tagged').length - 1, 1)
})
