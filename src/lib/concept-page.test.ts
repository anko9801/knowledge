import { deepStrictEqual, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { conceptPages, type Concept, type Home } from './concept-page.ts'

const c = (id: string, label: string, requires: readonly string[] = []): Concept => ({
  id,
  label,
  gist: `${label} の一行`,
  kind: 'definition',
  field: 'math',
  requires,
})

const concepts = [
  c('zfc', 'ZFC'),
  c('sigma-algebra', 'σ 加法族', ['zfc']),
  c('measure', '測度', ['sigma-algebra']),
  c('integral', '積分', ['measure']),
  c('unwritten', '未執筆の何か', ['measure']),
]

const home = (n: number): Home => ({
  href: `/k/math/measure/${n}`,
  where: `測度と確率 第 ${n} 回`,
  title: `第 ${n} 回`,
})

const homes = new Map<string, Home>([
  ['zfc', home(0)],
  ['sigma-algebra', home(1)],
  ['measure', home(1)],
  ['integral', home(2)],
])

test('記事のある概念だけがページになる', () => {
  const pages = conceptPages(concepts, homes)
  deepStrictEqual(
    pages.map((page) => page.concept.id),
    ['zfc', 'sigma-algebra', 'measure', 'integral'],
  )
})

test('前提と、それを使うものが両方出る', () => {
  const page = conceptPages(concepts, homes).find((p) => p.concept.id === 'measure')

  deepStrictEqual(page?.requires.map((n) => n.concept.id), ['sigma-algebra'])
  // 未執筆のものも「使うもの」には出す。ただし href は持たない。
  deepStrictEqual(page?.usedBy.map((n) => n.concept.id).sort(), ['integral', 'unwritten'])
})

test('記事の無い隣は href を持たない', () => {
  const page = conceptPages(concepts, homes).find((p) => p.concept.id === 'measure')
  const unwritten = page?.usedBy.find((n) => n.concept.id === 'unwritten')

  strictEqual(unwritten?.href, undefined)
  strictEqual(page?.usedBy.find((n) => n.concept.id === 'integral')?.href, '/k/math/measure/2')
})

test('グラフに無い id は落とす（参照の書き間違い）', () => {
  const broken = [...concepts, c('ghost-user', '幽霊', ['no-such-concept'])]
  const pages = conceptPages(broken, new Map([...homes, ['ghost-user', home(9)]]))
  const page = pages.find((p) => p.concept.id === 'ghost-user')

  deepStrictEqual(page?.requires, [])
})

test('前提も使い先も無ければ、空で返る', () => {
  const page = conceptPages(concepts, homes).find((p) => p.concept.id === 'integral')
  deepStrictEqual(page?.usedBy, [])
  deepStrictEqual(page?.requires.map((n) => n.concept.id), ['measure'])
})
