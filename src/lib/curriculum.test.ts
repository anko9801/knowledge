import assert from 'node:assert/strict'
import { test } from 'node:test'

import { danglingConcepts, findCycles, planFor, type Node } from './curriculum.ts'

const node = (id: string, provides: string[], requires: string[] = [], uses: string[] = []): Node =>
  ({ id, title: id, cost: 1, provides, requires, uses })

const sample: Node[] = [
  node('a', ['vector-space']),
  node('b', ['dual-space'], ['vector-space']),
  node('c', ['tensor'], ['dual-space']),
  node('d', ['wedge'], ['tensor'], ['index-notation']),
  node('n', ['index-notation'], ['vector-space']),
]

test('目標の前提だけをたどる', () => {
  const plan = planFor(sample, ['dual-space'])
  assert.deepEqual(
    plan.order.map((n) => n.id),
    ['a', 'b'],
  )
  assert.equal(plan.cost, 2)
})

test('前提が先に来る', () => {
  const plan = planFor(sample, ['wedge'])
  assert.deepEqual(
    plan.order.map((n) => n.id),
    ['a', 'b', 'c', 'd'],
  )
})

test('記法の依存は既定でたどらない', () => {
  const plan = planFor(sample, ['wedge'])
  assert.ok(!plan.order.some((n) => n.id === 'n'))
  assert.deepEqual(plan.deferred, ['index-notation'])
})

test('includeNotation を立てると記法もたどる', () => {
  const plan = planFor(sample, ['wedge'], { includeNotation: true })
  assert.ok(plan.order.some((n) => n.id === 'n'))
  assert.deepEqual(plan.deferred, [])
})

test('既知の概念は計画から外れる', () => {
  const plan = planFor(sample, ['wedge'], { known: ['tensor'] })
  assert.deepEqual(
    plan.order.map((n) => n.id),
    ['d'],
  )
})

test('provider の無い概念は missing に出る', () => {
  const orphan = [node('x', ['goal'], ['nowhere'])]
  const plan = planFor(orphan, ['goal'])
  assert.deepEqual(plan.missing, ['nowhere'])
  // 穴があっても、たどれるぶんは返す。
  assert.deepEqual(
    plan.order.map((n) => n.id),
    ['x'],
  )
})

test('目標そのものに provider が無ければ missing だけ返る', () => {
  const plan = planFor(sample, ['quantum-field-theory'])
  assert.deepEqual(plan.order, [])
  assert.deepEqual(plan.missing, ['quantum-field-theory'])
})

test('複数の目標をまとめて満たす', () => {
  const plan = planFor(sample, ['dual-space', 'index-notation'])
  assert.deepEqual(
    plan.order.map((n) => n.id),
    ['a', 'b', 'n'],
  )
})

test('provider が複数あるとき、コストの安いほうを選ぶ', () => {
  const cheap: Node = { ...node('cheap', ['goal']), cost: 1 }
  const heavy: Node = { ...node('heavy', ['goal', 'extra']), cost: 10 }
  const plan = planFor([cheap, heavy], ['goal'])
  assert.deepEqual(
    plan.order.map((n) => n.id),
    ['cheap'],
  )
})

test('循環を見つける', () => {
  const looped = [node('p', ['x'], ['y']), node('q', ['y'], ['x'])]
  assert.equal(findCycles(looped).length > 0, true)
  // 循環していても記事は落とさない。
  const plan = planFor(looped, ['x'])
  assert.equal(plan.order.length, 2)
})

test('循環が無ければ空', () => {
  assert.deepEqual(findCycles(sample), [])
})

test('穴の一覧を出す', () => {
  const withHole = [...sample, node('z', ['goal'], ['calculus'])]
  assert.deepEqual(danglingConcepts(withHole), ['calculus'])
})
