import assert from 'node:assert/strict'
import { readFileSync, readdirSync, statSync } from 'node:fs'
import { join } from 'node:path'
import { test } from 'node:test'

import { concepts } from '../data/concepts.ts'
import {
  backlog,
  closure,
  danglingConcepts,
  drift,
  findCycles,
  inversions,
  planFor,
  type Concept,
  type Coverage,
  type Placed,
} from './curriculum.ts'

const c = (id: string, requires: string[] = [], empirical: string[] = []): Concept => ({
  id,
  label: id,
  gist: '',
  kind: 'definition',
  field: 'math',
  requires,
  empirical,
})

const graph: Concept[] = [
  c('vector-space'),
  c('dual-space', ['vector-space']),
  c('tensor', ['dual-space']),
  c('wedge', ['tensor']),
  c('determinant', ['wedge']),
]

const written: Coverage[] = [
  { id: 'a/1', title: '記事 1', provides: ['vector-space', 'dual-space'] },
  { id: 'a/2', title: '記事 2', provides: ['tensor'] },
]

test('目標から前提をすべて遡る', () => {
  const { ids } = closure(graph, ['wedge'])
  assert.deepEqual(ids.sort(), ['dual-space', 'tensor', 'vector-space', 'wedge'])
})

test('前提が先に来る', () => {
  const plan = planFor(graph, written, ['wedge'])
  assert.deepEqual(
    plan.steps.map((s) => s.concept.id),
    ['vector-space', 'dual-space', 'tensor', 'wedge'],
  )
})

test('記事のある概念とない概念を分ける', () => {
  const plan = planFor(graph, written, ['wedge'])
  assert.equal(plan.covered, 3)
  assert.deepEqual(
    plan.missing.map((m) => m.id),
    ['wedge'],
  )
})

test('記事が無くても計画は立つ（ここが要点）', () => {
  // determinant はどの記事も扱っていないが、計画には現れる。
  const plan = planFor(graph, [], ['determinant'])
  assert.equal(plan.steps.length, 5)
  assert.equal(plan.covered, 0)
  assert.equal(plan.missing.length, 5)
})

test('既知の概念で閉包が止まる', () => {
  // tensor を知っているなら、その先祖（dual-space, vector-space）は読む必要が無い。
  const plan = planFor(graph, written, ['wedge'], { known: ['tensor'] })
  assert.deepEqual(
    plan.steps.map((s) => s.concept.id),
    ['wedge'],
  )
})

test('概念グラフに無い id は unknown に出る', () => {
  const plan = planFor(graph, written, ['quantum-gravity'])
  assert.deepEqual(plan.unknown, ['quantum-gravity'])
  assert.deepEqual(plan.steps, [])
})

test('執筆キューは、すぐ書けるものを先に出す', () => {
  const queue = backlog(graph, written)
  // wedge は前提（tensor）が記事になっているのですぐ書ける。
  // determinant は前提（wedge）がまだ無いので後ろ。
  assert.equal(queue[0].concept.id, 'wedge')
  assert.equal(queue[0].ready, true)
  assert.equal(queue[1].concept.id, 'determinant')
  assert.equal(queue[1].ready, false)
})

test('下流の多い概念を優先する', () => {
  const wide: Concept[] = [c('root'), c('x', ['root']), c('y', ['root']), c('z', ['root']), c('lonely')]
  const queue = backlog(wide, [])
  assert.equal(queue[0].concept.id, 'root')
  assert.equal(queue[0].unlocks, 3)
})

test('記事が名乗る概念がグラフに無ければ drift に出る', () => {
  const stray: Coverage[] = [{ id: 'a/9', title: '記事 9', provides: ['made-up'] }]
  assert.deepEqual(drift(graph, stray), ['made-up'])
})

test('循環を見つける', () => {
  const looped = [c('p', ['q']), c('q', ['p'])]
  assert.equal(findCycles(looped).length > 0, true)
  // 循環していても概念は落とさない。
  assert.equal(planFor(looped, [], ['p']).steps.length, 2)
})

test('循環が無ければ空', () => {
  assert.deepEqual(findCycles(graph), [])
})

test('定義されていない前提を検出する', () => {
  const hole = [...graph, c('goal', ['calculus'])]
  assert.deepEqual(danglingConcepts(hole), ['calculus'])
})

// --- 経験的な辺 ---------------------------------------------------------
// 論理的な依存と混ぜると、数学側の最短経路まで慣習で汚染される。
// 既定ではたどらないこと、たどったときは印が付くことを確かめる。

const clinical: Concept[] = [
  c('anatomy'),
  c('physiology', [], ['anatomy']),
  c('pharmacology', [], ['physiology']),
]

test('経験的な辺は既定でたどらない', () => {
  const plan = planFor(clinical, [], ['pharmacology'])
  assert.deepEqual(
    plan.steps.map((s) => s.concept.id),
    ['pharmacology'],
  )
})

test('明示すれば経験的な辺もたどる', () => {
  const plan = planFor(clinical, [], ['pharmacology'], { includeEmpirical: true })
  assert.deepEqual(
    plan.steps.map((s) => s.concept.id),
    ['anatomy', 'physiology', 'pharmacology'],
  )
})

test('経験的にだけ入ってきた概念には印が付く', () => {
  const plan = planFor(clinical, [], ['pharmacology'], { includeEmpirical: true })
  const marked = plan.steps.filter((s) => s.viaEmpirical).map((s) => s.concept.id)
  assert.deepEqual(marked.sort(), ['anatomy', 'physiology'])
})

test('経験的な辺は数学側の経路を汚染しない', () => {
  // 経験的な前提を足しても、論理だけの計画は変わらない。
  const mixed = [...graph, c('wedge-applied', ['wedge'], ['anatomy'])]
  const before = planFor(graph, written, ['wedge']).steps.map((s) => s.concept.id)
  const after = planFor(mixed, written, ['wedge']).steps.map((s) => s.concept.id)
  assert.deepEqual(after, before)
})

test('論理と経験の両方で届く概念には、経験の印を付けない', () => {
  const both = [c('base'), c('x', ['base'], []), c('y', ['base'], ['base'])]
  const plan = planFor(both, [], ['x', 'y'], { includeEmpirical: true })
  const base = plan.steps.find((s) => s.concept.id === 'base')
  assert.equal(base?.viaEmpirical, false)
})

test('論理的な前提を持たない概念は empiricalOnly になる', () => {
  const queue = backlog(clinical, [])
  const pharm = queue.find((i) => i.concept.id === 'pharmacology')
  assert.equal(pharm?.empiricalOnly, true)
  const anat = queue.find((i) => i.concept.id === 'anatomy')
  assert.equal(anat?.empiricalOnly, false)
})

const placed = (id: string, at: [number, number], provides: string[]): Placed => ({
  id,
  title: id,
  provides,
  at,
})

test('同じ連載の中で前提が後ろにあれば見つける', () => {
  const found = inversions(graph, [
    placed('a/1', [0, 1], ['tensor']),
    placed('a/2', [0, 2], ['dual-space']),
  ])
  deepEqualish(found, [{ article: 'a/1', missing: 'dual-space', home: 'a/2' }])
})

test('連載をまたぐ順序は見ない', () => {
  // seriesRank は「素朴→一般」の順で、依存順ではない。またいで判定すると
  // physics/quantum が線形代数を要求していることまで拾ってしまう。
  const found = inversions(graph, [
    placed('a/1', [0, 1], ['tensor']),
    placed('b/1', [1, 1], ['dual-space']),
  ])
  assert.equal(found.length, 0)
})

test('同じ回の中で閉じていれば何も出ない', () => {
  const found = inversions(graph, [placed('a/1', [0, 1], ['dual-space', 'tensor'])])
  assert.equal(found.length, 0)
})

function deepEqualish(
  found: readonly { article: string; missing: string; home: string }[],
  want: readonly { article: string; missing: string; home: string }[],
): void {
  assert.deepEqual(
    found.map((f) => ({ article: f.article, missing: f.missing, home: f.home })),
    want,
  )
}

// --- 実データに当てる。ここが本番 ---
//
// 上の三つ（循環・宙に浮いた前提・記事とグラフのずれ）は、これまで純関数
// としてしか試していなかった。本物の `concepts.ts` に当たるのは
// `npm run curriculum` を手で走らせたときだけで、**走らせなければ黙っている。**
//
// 2026-08-28 に、場の量子論の概念を足したとき Poincaré 群への辺を書き忘れた。
// 「この回は相対論を要求する」という事実がグラフのどこにも無いので、
// `curriculum plan` に聞いても出てこない。頭の中にしか無かった。
// **辺を書き忘れても誰も何も言わないなら、グラフは当てにならない。**

const typFiles = (dir: string): string[] =>
  readdirSync(dir).flatMap((name) => {
    const path = join(dir, name)
    if (statSync(path).isDirectory()) return typFiles(path)
    return name.endsWith('.typ') ? [path] : []
  })

/** front matter の `provides: (...)` だけを拾う。scripts/curriculum.mjs と同じ読み方。 */
const providesOf = (src: string): string[] => {
  const head = src.match(/\n\s*provides:\s*\(/)
  if (!head || head.index === undefined) return []
  const start = head.index + head[0].length
  let depth = 1
  let i = start
  while (i < src.length && depth > 0) {
    if (src[i] === '(') depth += 1
    else if (src[i] === ')') depth -= 1
    i += 1
  }
  return [...src.slice(start, i - 1).matchAll(/"([^"]+)"/g)].map((m) => m[1] as string)
}

const realArticles: Coverage[] = typFiles('src/content/articles').map((path) => ({
  id: path,
  title: path,
  provides: providesOf(readFileSync(path, 'utf8')),
}))

test('概念グラフに循環が無い', () => {
  const cycles = findCycles(concepts as readonly Concept[])
  assert.equal(cycles.map((cycle) => cycle.join(' -> ')).join('\n'), '')
})

test('前提に挙げた概念が、すべて定義されている', () => {
  assert.equal(danglingConcepts(concepts as readonly Concept[]).join('\n'), '')
})

test('記事が名乗る概念が、すべてグラフにある', () => {
  assert.equal(drift(concepts as readonly Concept[], realArticles).join('\n'), '')
})
