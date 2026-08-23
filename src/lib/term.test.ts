import { deepStrictEqual, ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { attachTerms, linkTerms, type Term } from './term.ts'

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

/* ---------- 自動で拾うほう ---------- */

const AUTO: readonly Term[] = [
  { id: 'linear-map', label: '線形写像', gist: '和とスカラー倍を保つ写像' },
  { id: 'multilinear-map', label: '多重線形写像', gist: '各引数について線形' },
  { id: 'field', label: '体', gist: '四則ができる' },
  { id: 'manifold', label: '多様体', gist: '局所的にユークリッド' },
]

test('長い名前から当てる', () => {
  // 「線形写像」を先に当てると「多重線形写像」の内側が切り取られ、別の概念に化ける。
  const { html, linked } = linkTerms('<p>多重線形写像を考える</p>', AUTO)

  ok(html.includes('href="/concepts/multilinear-map"'))
  strictEqual(html.includes('href="/concepts/linear-map"'), false)
  deepStrictEqual(linked, ['multilinear-map'])
})

test('差し込んだ印の中身を、あとから来る短い名前が食わない', () => {
  // 「多重線形写像」に印を付けると、その中身に「線形写像」が二度現れる。
  // 素朴に置換すると、そこに入れ子の印ができる。
  const { html } = linkTerms('<p>多重線形写像だけがある</p>', AUTO)

  strictEqual((html.match(/class="peek"/g) ?? []).length, 1)
})

test('初出だけに付ける', () => {
  const { html } = linkTerms('<p>多様体。もう一度いう、多様体。</p>', AUTO)

  strictEqual((html.match(/class="peek"/g) ?? []).length, 1)
})

test('2 字以下は拾わない', () => {
  // 「体」は全体・物体に当たる。ここは #term で手動。
  const { html, linked } = linkTerms('<p>全体として、物体の運動</p>', AUTO)

  strictEqual(linked.includes('field'), false)
  strictEqual(html.includes('peek'), false)
})

test('数式・コード・見出し・既存のリンクの中は触らない', () => {
  for (const html of [
    '<math><mi>多様体</mi></math>',
    '<code>多様体</code>',
    '<h2>多様体</h2>',
    '<a href="/x">多様体</a>',
    '<span class="term">多様体</span>',
  ]) {
    strictEqual(linkTerms(html, AUTO).html, html, html)
  }
})

test('伏せた場所が、元のまま戻る', () => {
  const html = '<p>まず<math><mi>x</mi></math>を置く。多様体を考える。<code>f(x)</code>も。</p>'
  const out = linkTerms(html, AUTO).html

  ok(out.includes('<math><mi>x</mi></math>'))
  ok(out.includes('<code>f(x)</code>'))
  ok(out.includes('href="/concepts/manifold"'))
})

test('その記事が説明している概念には付けない', () => {
  const { linked } = linkTerms('<p>多様体を定義する</p>', AUTO, {
    exclude: new Set(['manifold']),
  })

  deepStrictEqual(linked, [])
})

test('取っ手は手で置いたものと別の番号になる', () => {
  const { html } = linkTerms('<p>多様体と線形写像</p>', AUTO)

  // attachTerms は tm、page-peek は pp、peek は pk。
  ok(html.includes('id="ta1"'))
  ok(html.includes('id="ta2"'))
  strictEqual(html.includes('id="tm'), false)
})

test('多義語は自動では拾わない', () => {
  // 「平行移動」は測度では Vitali の平行移動不変性で、Riemann 幾何の平行移動ではない。
  // 実際に一度、測度と確率 第 2 回に誤って配った。
  const AMB: readonly Term[] = [
    { id: 'parallel-transport', label: '平行移動', gist: '接ベクトルを曲線に沿って運ぶ' },
  ]
  const { html, linked } = linkTerms('<p>平行移動しても長さは変わらない</p>', AMB)

  deepStrictEqual(linked, [])
  strictEqual(html.includes('peek'), false)
})

test('多義語でも、手で置けば付く', () => {
  const AMB: readonly Term[] = [
    { id: 'parallel-transport', label: '平行移動', gist: '接ベクトルを曲線に沿って運ぶ' },
  ]
  const out = attachTerms('<span class="term">平行移動</span>', AMB).html

  ok(out.includes('href="/concepts/parallel-transport"'))
})
