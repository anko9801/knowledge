import { deepStrictEqual, ok, strictEqual, throws } from 'node:assert/strict'
import { test } from 'node:test'

import {
  buildSource,
  hasMath,
  plainMath,
  splitOutput,
  unbalanced,
  type Piece,
} from './concept-typst.ts'

const pieces: readonly Piece[] = [
  { key: 'a', text: '$L^p$ 空間' },
  { key: 'b', text: '$b_k = dim H^k$。穴の個数' },
]

test('数式を含むかどうかで振り分ける', () => {
  strictEqual(hasMath('$L^p$ 空間'), true)
  strictEqual(hasMath('完備なノルム空間'), false)
})

test('括弧の釣り合いを見る', () => {
  strictEqual(unbalanced('ふつうの説明'), false)
  strictEqual(unbalanced('$[a, b]$ の長さ'), false)
  strictEqual(unbalanced('閉じ忘れ ['), true)
  strictEqual(unbalanced('] が先'), true)
})

test('釣り合っていなければ組む前に落とす', () => {
  // 通すと content block がそこで閉じ、以降の概念が全部ひとつの塊になる。
  throws(() => buildSource([{ key: 'x', text: '壊れ [' }]), /釣り合っていません/)
})

test('1 枚にまとめて、id を振る', () => {
  const source = buildSource(pieces)
  ok(source.includes('#set text(lang: "ja")'))
  ok(source.includes('attrs: (id: "cm-0"))[$L^p$ 空間]'))
  ok(source.includes('attrs: (id: "cm-1"))'))
})

test('出力を id で引き戻す', () => {
  const html = '<body><div id="cm-0"><math>L</math> 空間</div><div id="cm-1">中身</div></body>'
  const found = splitOutput(html, pieces)
  deepStrictEqual([...found.keys()], ['a', 'b'])
  strictEqual(found.get('a'), '<math>L</math> 空間')
  strictEqual(found.get('b'), '中身')
})

test('綴りを Unicode へ均す', () => {
  // 名前順に並べる鍵と、読み上げに使う。表示には MathML のほうを出す。
  strictEqual(plainMath('$L^p$ 空間'), 'L^p 空間')
  strictEqual(plainMath('$RR^n$ の領域上の積分'), 'ℝ^n の領域上の積分')
  strictEqual(plainMath('$A arrow.r.bar P^(-1) A P$'), 'A ↦ P^-1 A P')
  strictEqual(plainMath('$Lambda^k tilde.equiv Lambda^(n-k)$。計量が要る'), 'Λ^k ≅ Λ^n-k。計量が要る')
  strictEqual(plainMath('$abs(X) < abs(2^X)$'), '|X| < |2^X|')
  strictEqual(plainMath('$partial_t g = -2 upright("Ric")$ で均す'), '∂_t g = -2 Ric で均す')
})

test('数式が無ければ、そのまま返す', () => {
  strictEqual(plainMath('完備なノルム空間'), '完備なノルム空間')
})

test('名前順の鍵が、$ で崩れない', () => {
  // 生の文字列で並べると $ で始まるものが先頭へ固まる。
  const raw = ['$L^p$ 空間', 'Banach 空間', '$RR^n$ の領域上の積分']
  const sorted = [...raw].sort((a, b) => plainMath(a).localeCompare(plainMath(b), 'ja'))
  deepStrictEqual(sorted, ['Banach 空間', '$L^p$ 空間', '$RR^n$ の領域上の積分'])
})

test('出て来なかったものは、ただ落ちる', () => {
  // typst が何かを飲み込んでも、他の概念まで巻き添えにしない。
  const found = splitOutput('<div id="cm-1">後ろだけ</div>', pieces)
  strictEqual(found.has('a'), false)
  strictEqual(found.get('b'), '後ろだけ')
})
