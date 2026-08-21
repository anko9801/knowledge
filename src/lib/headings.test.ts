import { deepStrictEqual, ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { collectHeadings, slugify, tocHeadings } from './headings.ts'

test('和文の見出しはそのまま id になる（約物だけ落ちる）', () => {
  strictEqual(slugify('集合とは何ですか、と聞かれると困る'), '集合とは何ですかと聞かれると困る')
  strictEqual(slugify('ZF の公理を一つずつ'), 'zf-の公理を一つずつ')
  strictEqual(slugify('  外延性：集合を決めるのは要素だけ  '), '外延性集合を決めるのは要素だけ')
})

test('見出しに id と自己リンクが付く', () => {
  const { html, headings } = collectHeadings('<h2>基礎</h2><p>本文</p><h3>順序</h3>')

  deepStrictEqual(headings, [
    { depth: 2, slug: '基礎', text: '基礎' },
    { depth: 3, slug: '順序', text: '順序' },
  ])
  ok(html.includes('<h2 id="基礎">基礎<a class="heading-anchor" href="#基礎"'))
  ok(html.includes('data-pagefind-ignore'))
  ok(html.includes('<h3 id="順序">'))
})

test('同じ見出しが 2 度出ても id が衝突しない', () => {
  const { headings } = collectHeadings('<h2>補題</h2><h2>補題</h2><h2>補題</h2>')

  deepStrictEqual(
    headings.map((heading) => heading.slug),
    ['補題', '補題-2', '補題-3'],
  )
})

test('見出しの中のタグは落として文字だけ拾う', () => {
  const { headings } = collectHeadings(
    '<h2>写像 <math><mi>f</mi></math> の<strong>像</strong></h2>',
  )

  strictEqual(headings[0].text, '写像 f の像')
})

test('すでに id があるものは尊重する（Typst のラベル）', () => {
  const { html, headings } = collectHeadings('<h2 id="loc-3">正則性</h2>')

  strictEqual(headings[0].slug, 'loc-3')
  ok(html.includes('<h2 id="loc-3">正則性<a class="heading-anchor" href="#loc-3"'))
  ok(!html.includes('id="正則性"'))
})

test('id にできる文字が無ければ section に落とす', () => {
  const { headings } = collectHeadings('<h2>…</h2><h2>！？</h2>')

  deepStrictEqual(
    headings.map((heading) => heading.slug),
    ['section', 'section-2'],
  )
})

test('目次は深さで切り、1 つしか無ければ出さない', () => {
  const headings = [
    { depth: 2, slug: 'a', text: 'a' },
    { depth: 3, slug: 'b', text: 'b' },
    { depth: 4, slug: 'c', text: 'c' },
  ]

  deepStrictEqual(tocHeadings(headings).map((heading) => heading.slug), ['a', 'b'])
  deepStrictEqual(tocHeadings(headings, 4).map((heading) => heading.slug), ['a', 'b', 'c'])
  deepStrictEqual(tocHeadings([{ depth: 2, slug: 'a', text: 'a' }]), [])
})

test('文字の無い見出しは目次にも載せず、リンクも付けない', () => {
  const { html, headings } = collectHeadings('<h2></h2><h2>公理</h2>')

  strictEqual(headings.length, 1)
  ok(!html.includes('href="#section"'))
})
