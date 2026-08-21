import { deepStrictEqual, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { neighborsOf, prerequisites, type Article, type Concept } from './neighbors.ts'

const concept = (id: string, requires: readonly string[] = []): Concept => ({
  id,
  label: id,
  gist: `${id} の一行`,
  requires,
})

/** 連載の並びは taxonomy.ts の宣言順に対応する。素朴なものほど小さい。 */
const ranks: Record<string, number> = { 'set-theory': 0, measure: 1, 'vector-analysis': 2, forms: 3 }

const article = (order: number, provides: readonly string[], series = 'measure'): Article => ({
  key: `math/${series}/${order}`,
  title: `第 ${order} 回`,
  href: `/math/${series}/${order}`,
  series,
  rank: ranks[series] ?? 0,
  order,
  provides,
})

const concepts: readonly Concept[] = [
  concept('zfc'),
  concept('sigma-algebra', ['zfc']),
  concept('measure', ['sigma-algebra']),
  concept('integral', ['measure']),
  concept('probability-space', ['measure']),
  concept('conditional-expectation', ['probability-space', 'integral']),
  concept('unwritten', ['measure']),
]

const first = article(1, ['sigma-algebra', 'measure'])
const second = article(2, ['integral'])
const third = article(3, ['probability-space', 'conditional-expectation'])
const zero = article(1, ['zfc'], 'set-theory')
const articles = [zero, first, second, third]

const labels = (links: readonly { concepts: readonly Concept[] }[]) =>
  links.flatMap((link) => link.concepts.map((c) => c.id))

test('前提は直接の requires だけを見る', () => {
  const { requires } = neighborsOf(concepts, articles, first)
  deepStrictEqual(
    requires.map((link) => link.article.key),
    ['math/set-theory/1'],
  )
  deepStrictEqual(labels(requires), ['zfc'])
})

test('その回で扱う概念を、宣言順のまま返す', () => {
  // 題名は異常を出す形なので、何を学ぶ回かが題名から読めない。そこを埋める。
  const { covers } = neighborsOf(concepts, articles, first)
  deepStrictEqual(
    covers.map((c) => c.id),
    ['sigma-algebra', 'measure'],
  )
})

test('グラフに無い概念を名乗っていても、扱う概念は落ちるだけ', () => {
  const stray = article(9, ['measure', 'not-in-graph'])
  const { covers } = neighborsOf(concepts, [...articles, stray], stray)
  deepStrictEqual(
    covers.map((c) => c.id),
    ['measure'],
  )
})

test('自分が供給する概念は前提にも下流にも出ない', () => {
  // sigma-algebra は measure の前提だが、同じ回で片が付いている。
  const { requires, unlocks } = neighborsOf(concepts, articles, first)
  strictEqual(labels(requires).includes('sigma-algebra'), false)
  strictEqual(labels(unlocks).includes('measure'), false)
})

test('同じ記事は 1 行に畳んで、理由の概念を並べる', () => {
  const { unlocks } = neighborsOf(concepts, articles, first)
  const third_ = unlocks.find((link) => link.article.key === 'math/measure/3')
  deepStrictEqual(third_?.concepts.map((c) => c.id), ['probability-space'])
  strictEqual(unlocks.filter((link) => link.article.key === 'math/measure/3').length, 1)
})

test('記事の無い前提は gaps に落ちる', () => {
  const orphan = article(9, ['integral'], 'other')
  const withGap = neighborsOf(
    [...concepts, concept('integral', ['measure', 'ghost']), concept('ghost')],
    [orphan],
    orphan,
  )
  deepStrictEqual(withGap.gaps.map((gap) => gap.concept.id), ['measure', 'ghost'])
  deepStrictEqual(withGap.requires, [])
})

test('下流に記事の無い概念は出さない', () => {
  // unwritten は measure を要求するが、どの記事も名乗っていない。
  const { unlocks } = neighborsOf(concepts, articles, first)
  strictEqual(labels(unlocks).includes('unwritten'), false)
})

test('exclude に挙げた記事は落ちる（連載の前後ナビとの重複を避ける）', () => {
  const { unlocks } = neighborsOf(concepts, articles, first, ['math/measure/2'])
  deepStrictEqual(
    unlocks.map((link) => link.article.key),
    ['math/measure/3'],
  )
})

test('家が複数あるときは、読者の連載にいちばん近いものへ送る', () => {
  // stokes はベクトル解析（素朴）と微分形式（一般）の両方にある。
  const graph = [...concepts, concept('stokes'), concept('curvature', ['stokes'])]
  const naive = article(3, ['stokes'], 'vector-analysis')
  const general = article(6, ['stokes'], 'forms')
  const reader = article(7, ['curvature'], 'forms')
  const shelf = [naive, general, reader]

  // 同じ連載に家があれば、そちらへ。
  deepStrictEqual(
    neighborsOf(graph, shelf, reader).requires.map((link) => link.article.key),
    ['math/forms/6'],
  )
  // 手前にしか家が無ければ、いちばん近い手前へ。
  const early = article(4, ['curvature'], 'vector-analysis')
  deepStrictEqual(
    neighborsOf(graph, [naive, early], early).requires.map((link) => link.article.key),
    ['math/vector-analysis/3'],
  )
})

test('手前に家が一つも無ければ、先の連載へ送る', () => {
  const graph = [...concepts, concept('stokes'), concept('curvature', ['stokes'])]
  const general = article(6, ['stokes'], 'forms')
  const reader = article(1, ['curvature'], 'set-theory')
  deepStrictEqual(
    neighborsOf(graph, [general, reader], reader).requires.map((link) => link.article.key),
    ['math/forms/6'],
  )
})

test('prerequisites は判定用なので、前後ナビと重なるものも落とさない', () => {
  const map = prerequisites(concepts, articles)

  // 第 2 回の前提は第 1 回。表示側では前ナビと重なるので落ちるが、判定では要る。
  deepStrictEqual(map.get('math/measure/2'), ['math/measure/1'])
  deepStrictEqual(map.get('math/measure/1'), ['math/set-theory/1'])
  deepStrictEqual(map.get('math/set-theory/1'), [])
})

test('prerequisites は全記事を引ける', () => {
  const map = prerequisites(concepts, articles)
  strictEqual(map.size, articles.length)
  for (const article of articles) strictEqual(Array.isArray(map.get(article.key)), true)
})

test('前提が無ければ空で返る', () => {
  const { requires, gaps } = neighborsOf(concepts, articles, zero)
  deepStrictEqual(requires, [])
  deepStrictEqual(gaps, [])
})
