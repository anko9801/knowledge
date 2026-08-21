import { ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { attachPagePeeks, type Page } from './page-peek.ts'

const pages: readonly Page[] = [
  {
    href: '/k/math/foundations/4',
    where: '土台 第 4 回',
    title: '穴が空いていないこと',
    summary: '完備性とは何か。',
  },
  { href: '/k/math/logic/3', where: '数理論理学 第 3 回', title: '同じ一行が、真にも偽にもなる' },
]

test('記事へのリンクに、行き先の中身が添う', () => {
  const html = '<p><a href="/k/math/foundations/4">土台 第 4 回</a>で見た。</p>'
  const out = attachPagePeeks(html, pages)

  ok(out.includes('<a href="/k/math/foundations/4" class="peek-link">土台 第 4 回</a>'))
  ok(out.includes('<strong>土台 第 4 回</strong>'))
  ok(out.includes('穴が空いていないこと'))
  ok(out.includes('完備性とは何か。'))
})

test('要約が無ければ、その行は出ない', () => {
  // 「peek-page」に部分一致しないよう、閉じ引用符まで含めて数える。
  const out = attachPagePeeks('<a href="/k/math/logic/3">位相</a>', pages)
  strictEqual(out.split('class="peek-p"').length - 1, 1)
})

test('末尾スラッシュと .html の揺れを吸う', () => {
  for (const href of ['/k/math/logic/3/', '/k/math/logic/3.html']) {
    ok(attachPagePeeks(`<a href="${href}">x</a>`, pages).includes('peek-link'), href)
  }
})

test('知らない行き先は素通しする', () => {
  const html = '<a href="/k/math/measure/9">まだ無い回</a>'
  strictEqual(attachPagePeeks(html, pages), html)
})

test('fragment 付きのリンクには触らない（主張を指しているため）', () => {
  const html = '<a href="#loc-3">定義 3</a>'
  strictEqual(attachPagePeeks(html, pages), html)
})

test('主張を添えた塊の中のリンクは、二重に包まない', () => {
  // peek.ts が先に走っている。その中身にも記事へのリンクが入っている。
  const html =
    '<p><span class="peek"><a href="#loc-1" class="peek-link">定義 2</a>' +
    '<span class="peek-body" aria-hidden="true">' +
    '<span class="peek-p">詳しくは<a href="/k/math/foundations/4">土台 第 4 回</a></span>' +
    '</span></span>より</p>'
  const out = attachPagePeeks(html, pages)

  // 入れ子のパネルが増えていない。
  strictEqual(out.split('class="peek"').length - 1, 1)
  strictEqual(out.split('peek-body').length - 1, 1)
  // 伏せた塊はそのまま戻っている。
  ok(out.includes('<a href="/k/math/foundations/4">土台 第 4 回</a>'))
})

test('伏せた塊が複数あっても、順番どおりに戻る', () => {
  const veiled = (n: number) =>
    `<span class="peek"><a href="#loc-${n}" class="peek-link">定義 ${n}</a>` +
    `<span class="peek-body" aria-hidden="true"><span class="peek-p">中身 ${n}</span></span></span>`
  const html = `<p>${veiled(1)}と${veiled(2)}と<a href="/k/math/logic/3">論理</a></p>`
  const out = attachPagePeeks(html, pages)

  ok(out.includes('中身 1'))
  ok(out.includes('中身 2'))
  strictEqual(out.indexOf('中身 1') < out.indexOf('中身 2'), true)
  ok(out.includes('数理論理学 第 3 回'))
})

test('行き先が無ければ何も変わらない', () => {
  const html = '<a href="/k/math/foundations/4">x</a>'
  strictEqual(attachPagePeeks(html, []), html)
})
