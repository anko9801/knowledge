import { deepStrictEqual, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { plain, supSub } from './sup-sub.ts'

test('冪を上付きに割る', () => {
  deepStrictEqual(supSub('L^p 空間'), [
    { kind: 'text', text: 'L' },
    { kind: 'sup', text: 'p' },
    { kind: 'text', text: ' 空間' },
  ])
})

test('括弧つきは中身をそのまま取る', () => {
  deepStrictEqual(supSub('Λ^(n-k)'), [
    { kind: 'text', text: 'Λ' },
    { kind: 'sup', text: 'n-k' },
  ])
})

test('添字は下付きになる', () => {
  deepStrictEqual(supSub('x_i の族'), [
    { kind: 'text', text: 'x' },
    { kind: 'sub', text: 'i' },
    { kind: 'text', text: ' の族' },
  ])
})

test('記号が無ければ 1 つの断片で返る', () => {
  deepStrictEqual(supSub('σ 加法族'), [{ kind: 'text', text: 'σ 加法族' }])
})

test('前が空白か和文なら触らない', () => {
  // 単独の ^ で壊れないこと。約物のあとに来ることはない約束だが、保険。
  deepStrictEqual(supSub('^p'), [{ kind: 'text', text: '^p' }])
  deepStrictEqual(supSub('穴 ^k'), [{ kind: 'text', text: '穴 ^k' }])
  deepStrictEqual(supSub('穴^k'), [{ kind: 'text', text: '穴^k' }])
})

test('上付きのあとに下付きが続く形が割れる', () => {
  // 概念の説明に実際に出てくる。H^*_dR、x^i_1、δ^i_j。
  deepStrictEqual(supSub('H^*_dR'), [
    { kind: 'text', text: 'H' },
    { kind: 'sup', text: '*' },
    { kind: 'sub', text: 'dR' },
  ])
})

test('記号のあとでも肩に乗る', () => {
  // ∂_t、∫_Ω、∇^μ、≤_p、(f g)^k。数えるより和文でないことで判定する。
  for (const [input, head, kind, body] of [
    ['∂_t', '∂', 'sub', 't'],
    ['∫_∂Ω', '∫', 'sub', '∂Ω'],
    ['∇^μ', '∇', 'sup', 'μ'],
    ['≤_p', '≤', 'sub', 'p'],
    [')^k', ')', 'sup', 'k'],
  ] as const) {
    deepStrictEqual(
      supSub(input),
      [
        { kind: 'text', text: head },
        { kind, text: body },
      ],
      input,
    )
  }
})

test('肩に乗らない文字で止まる', () => {
  // 「C^∞、解析的」の読点や、「2^X|」の縦棒で切れること。
  deepStrictEqual(supSub('C^∞、解析的'), [
    { kind: 'text', text: 'C' },
    { kind: 'sup', text: '∞' },
    { kind: 'text', text: '、解析的' },
  ])
})

test('1 つのラベルに複数あっても割れる', () => {
  deepStrictEqual(supSub('H^k と b_1'), [
    { kind: 'text', text: 'H' },
    { kind: 'sup', text: 'k' },
    { kind: 'text', text: ' と b' },
    { kind: 'sub', text: '1' },
  ])
})

test('plain は記号を落とした読みを返す', () => {
  strictEqual(plain('L^p 空間'), 'Lp 空間')
  strictEqual(plain('R^n の領域上の積分'), 'Rn の領域上の積分')
})
