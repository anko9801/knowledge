import { deepStrictEqual, ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { attachTerms, type Term } from './term.ts'

const TERMS: readonly Term[] = [
  { id: 'manifold', label: '多様体', gist: '局所的に $RR^n$ と同じ空間' },
  { id: 'sigma-algebra', label: 'σ 加法族', gist: '測る対象を決める族' },
]

test('用語に、ひとことと索引への道が付く', () => {
  const out = attachTerms('<p><span class="term">多様体</span>の上で</p>', TERMS).html

  ok(out.includes('<a href="/concepts/manifold" class="peek-link">多様体</a>'))
  ok(out.includes('局所的に $RR^n$ と同じ空間'))
  // 名前も添える。索引のページでも見出しになっている。
  ok(out.includes('<strong>多様体</strong>'))
})

test('base が付く', () => {
  const out = attachTerms('<span class="term">多様体</span>', TERMS, '/knowledge').html

  ok(out.includes('href="/knowledge/concepts/manifold"'))
})

test('base の末尾のスラッシュで二重にならない', () => {
  // Astro が渡す base は `/knowledge/` の形。素で繋ぐと `//concepts/` が出る。
  for (const base of ['/knowledge/', '/knowledge', '/']) {
    const out = attachTerms('<span class="term">多様体</span>', TERMS, base).html
    strictEqual(out.includes('//concepts/'), false, base)
    ok(out.includes('/concepts/manifold'))
  }
})

test('語形が違うときは id で引く', () => {
  const html = '<span class="term" data-id="manifold">多様体の上</span>'
  const out = attachTerms(html, TERMS).html

  ok(out.includes('href="/concepts/manifold"'))
  // 表示は本文のままで、名前のほうは添えた中に出る。
  ok(out.includes('class="peek-link">多様体の上</a>'))
})

test('引けなかったものは、黙って通さない', () => {
  const html = '<p><span class="term">存在しない語</span></p>'
  const { html: out, unknown } = attachTerms(html, TERMS)

  deepStrictEqual(unknown, [{ text: '存在しない語' }])
  // 印は剥がして、本文は壊さない。
  strictEqual(out, '<p>存在しない語</p>')
})

test('id で引けなかったときは、id も報せる', () => {
  const { unknown } = attachTerms('<span class="term" data-id="nope">語</span>', TERMS)

  deepStrictEqual(unknown, [{ text: '語', id: 'nope' }])
})

test('取っ手は peek とも page-peek とも別の番号になる', () => {
  const html = '<span class="term">多様体</span>と<span class="term">σ 加法族</span>'
  const out = attachTerms(html, TERMS).html

  // pk（同じ記事の主張）や pp（記事をまたぐリンク）と混ざると、
  // 触る端末で別のものが開く。
  ok(out.includes('id="tm1"'))
  ok(out.includes('id="tm2"'))
  strictEqual(out.includes('id="pk'), false)
})

test('中身に印が入っていても、名前で引ける', () => {
  // 強調した用語。`#strong[#term[多様体]]` のような書き方をしても引ける。
  const html = '<span class="term"><strong>多様体</strong></span>'
  const out = attachTerms(html, TERMS).html

  ok(out.includes('href="/concepts/manifold"'))
  // 表示のほうは強調を保つ。
  ok(out.includes('class="peek-link"><strong>多様体</strong></a>'))
})

test('用語が無ければ何も変わらない', () => {
  const html = '<p>ふつうの本文</p>'
  strictEqual(attachTerms(html, TERMS).html, html)
})
