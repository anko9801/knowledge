import { ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { attachPeeks, statementsByAnchor } from './peek.ts'

const statement = (id: string, body: string) =>
  `<div id="${id}" class="statement statement-definition">` +
  `<p class="statement-head">定義 2</p><p>${body}</p></div>`

test('参照に、指す先の中身が添う', () => {
  const html = `${statement('loc-1', '可算合併で閉じる族')}<p><a href="#loc-1">定義 2</a>より</p>`
  const out = attachPeeks(html)

  ok(out.includes('<span class="peek">'))
  ok(out.includes('<a href="#loc-1" class="peek-link">定義 2</a>'))
  // 中身は参照点にも複製される（本体と合わせて 2 回）。
  strictEqual(out.split('可算合併で閉じる族').length - 1, 2)
})

test('添えた中身にブロック要素は残らない', () => {
  const html =
    '<div id="loc-1" class="statement statement-definition"><p>族が</p>' +
    '<ol><li>補集合</li><li>可算合併</li></ol></div><p><a href="#loc-1">定義 2</a>より</p>'
  const peek = attachPeeks(html).split('<span class="peek-body" aria-hidden="true">')[1] as string
  const body = peek.slice(0, peek.indexOf('</span></span>'))

  // <p> の中に <p> や <ol> を差し込むと、パーサが外側の <p> をそこで閉じる。
  strictEqual(/<(p|div|ol|ul|li)\b/.test(body), false)
  ok(body.includes('<span class="peek-ol">'))
  ok(body.includes('<span class="peek-li">補集合</span>'))
})

test('複製した数式は式番号の counter を持たない', () => {
  const html =
    '<div id="loc-1" class="statement statement-theorem"><p>主張</p>' +
    '<div class="equation"><math display="block"></math></div></div><a href="#loc-1">定理 1</a>'
  const out = attachPeeks(html)

  // .equation は counter-increment を持つ。複製すると本文の式番号がずれる。
  strictEqual(out.split('class="equation"').length - 1, 1)
  ok(out.includes('<span class="peek-div">'))
})

test('添えた中身から id が落ちる', () => {
  const html = `${statement('loc-1', 'x')}<a href="#loc-1">定義 2</a>`
  const out = attachPeeks(html)

  // 文書に残る id は本体の 1 つだけ。複製が同じ id を名乗るとリンク先が定まらない。
  strictEqual(out.split('id="loc-1"').length - 1, 1)
})

test('答えは添えない（想起の問いを参照したとき）', () => {
  const html =
    '<div id="loc-9" class="statement statement-check"><p class="statement-head">問 4</p>' +
    '<p>なぜ可算か</p><details class="check-answer"><summary>答え</summary>' +
    '<p>一点集合から作れてしまう</p></details></div><a href="#loc-9">問 4</a>'
  const out = attachPeeks(html)

  ok(out.includes('<span class="peek">'))
  // 本体のほうには残っている。添えたほうには出ない。
  strictEqual(out.split('一点集合から作れてしまう').length - 1, 1)
})

test('主張を指していない参照はそのまま通る', () => {
  const html = '<span id="loc-3" class="equation">式</span><a href="#loc-3">式 1</a>'
  strictEqual(attachPeeks(html), html)
})

test('入れ子の div があっても千切れない', () => {
  const html =
    '<div id="loc-1" class="statement statement-theorem"><p>主張</p>' +
    '<div class="proof">証明</div></div><a href="#loc-1">定理 1</a>'
  const out = attachPeeks(html)

  ok(
    out.includes(
      '<span class="peek-body" aria-hidden="true">' +
        '<span class="peek-p">主張</span><span class="peek-div proof">証明</span></span>',
    ),
  )
})

test('錨の索引は、参照されている主張も落とさない', () => {
  // 参照されている主張には Typst が id="loc-N" を挿す。ここを見込まないと、
  // 誰も指していない主張だけが索引に残る。
  const html =
    '<div id="loc-1" class="statement statement-definition">' +
    '<p class="statement-head"><span id="def-topology" class="anchor"></span>定義 1</p>' +
    '<p>開集合の族</p></div>' +
    '<div class="statement statement-theorem">' +
    '<p class="statement-head"><span id="thm-compact" class="anchor"></span>定理 2</p>' +
    '<p>有界閉</p></div>'
  const found = statementsByAnchor(html)

  strictEqual(found.size, 2)
  ok(found.get('def-topology')?.includes('開集合の族'))
  ok(found.get('thm-compact')?.includes('有界閉'))
  // 添える中身から id は落ちている。
  strictEqual(found.get('def-topology')?.includes('id='), false)
})

test('触る端末用の取っ手が付き、リンクは残る', () => {
  const html = `${statement('loc-1', '可算合併で閉じる族')}<p><a href="#loc-1">定義 2</a>より</p>`
  const out = attachPeeks(html)

  // 開く役目は label が持つ。リンクは主張へ飛ぶ道として残す
  // （読み上げと、ホバーできる端末の従来の手数を変えないため）。
  ok(out.includes('<input type="checkbox" id="pk1" class="peek-toggle"'))
  ok(out.includes('<label for="pk1" class="peek-tap"'))
  ok(out.includes('<a href="#loc-1" class="peek-link">定義 2</a>'))
})

test('同じ主張を二度指しても、取っ手は別になる', () => {
  const html =
    `${statement('loc-1', '可算合併で閉じる族')}` +
    '<p><a href="#loc-1">定義 2</a>と<a href="#loc-1">定義 2</a></p>'
  const out = attachPeeks(html)

  // 錨から id を作ると重複し、どちらを押しても最初の一つが開く。
  ok(out.includes('id="pk1"'))
  ok(out.includes('id="pk2"'))
  strictEqual(out.split('class="peek-toggle"').length - 1, 2)
})

test('参照が無ければ何も変わらない', () => {
  const html = statement('loc-1', 'x')
  strictEqual(attachPeeks(html), html)
})

test('主張が無ければ何も変わらない', () => {
  const html = '<p><a href="#loc-1">定義 2</a></p>'
  strictEqual(attachPeeks(html), html)
})
