import { deepStrictEqual, rejects, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { mapWithLimit } from './pool.ts'

test('結果は入力の並び順で返る', async () => {
  const items = [30, 10, 20, 0]
  const result = await mapWithLimit(items, 2, async (item) => {
    await new Promise((resolve) => setTimeout(resolve, item))
    return item * 2
  })

  deepStrictEqual(result, [60, 20, 40, 0])
})

test('同時に走る数が上限を超えない', async () => {
  let running = 0
  let peak = 0

  await mapWithLimit(Array.from({ length: 20 }, (_, index) => index), 3, async () => {
    running += 1
    peak = Math.max(peak, running)
    await new Promise((resolve) => setTimeout(resolve, 1))
    running -= 1
  })

  strictEqual(peak, 3)
})

test('空の入力でも止まらない', async () => {
  deepStrictEqual(await mapWithLimit([], 4, async () => 1), [])
})

test('1 本の失敗はそのまま投げる', async () => {
  await rejects(
    mapWithLimit([1, 2, 3], 2, async (item) => {
      if (item === 2) throw new Error('だめ')
      return item
    }),
    /だめ/,
  )
})
