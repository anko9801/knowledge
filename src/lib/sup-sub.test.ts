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

test('前が英数字でなければ触らない', () => {
  // 単独の ^ で壊れないこと。約物のあとに来ることはない約束だが、保険。
  deepStrictEqual(supSub('^p'), [{ kind: 'text', text: '^p' }])
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
