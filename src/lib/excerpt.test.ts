import assert from 'node:assert/strict'
import { test } from 'node:test'

import { excerpt } from './excerpt.ts'

test('タグを外して地の文だけを返す', () => {
  assert.equal(
    excerpt('<p>前層とは、位相空間の各開集合に加群を対応させる仕組みのことである。</p>'),
    '前層とは、位相空間の各開集合に加群を対応させる仕組みのことである。',
  )
})

test('数式は落とす', () => {
  const html = '<p>ここで<math><mi>x</mi></math>を実数とし、次の主張を証明していくことにする。</p>'
  assert.equal(excerpt(html), 'ここで を実数とし、次の主張を証明していくことにする。')
})

test('見出しのアンカーを拾わない', () => {
  const html =
    '<h2>環論<a class="heading-anchor" href="#a">#</a></h2><p>' +
    '集合が二つの二項演算をもつとき、これを環と呼ぶことにする。ここから始める。</p>'
  assert.ok(!excerpt(html)?.includes('#'))
})

test('短すぎるときは null', () => {
  assert.equal(excerpt('<h2>化学</h2>'), null)
})

test('長いときは句点で切る', () => {
  const html = `<p>${'あ'.repeat(60)}。${'い'.repeat(60)}。</p>`
  const got = excerpt(html)
  assert.ok(got !== null && got.endsWith('。'))
  assert.ok(got.length <= 110)
})

test('句点が来ないときは字数で切って … を付ける', () => {
  assert.equal(excerpt(`<p>${'あ'.repeat(200)}</p>`)?.endsWith('…'), true)
})
