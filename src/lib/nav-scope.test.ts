import { deepStrictEqual, ok, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { contains, isCurrent, scopeNav, type NavBlock, type NavData } from './nav-scope.ts'

const entries = (prefix: string, count: number) =>
  Array.from({ length: count }, (_, index) => ({
    href: `${prefix}/${index + 1}`,
    label: `第 ${index + 1} 回`,
    order: index + 1,
  }))

const data: NavData = {
  home: '/k/',
  fields: [
    { slug: 'math', title: '数学', href: '/k/math', note: '22 本' },
    { slug: 'physics', title: '物理', href: '/k/physics', note: '3 本' },
    { slug: 'cs', title: '計算機', href: '/k/cs', note: '準備中' },
  ],
  series: [
    {
      slug: 'logic',
      field: 'math',
      title: '数理論理学',
      prefix: '/k/math/logic',
      entries: entries('/k/math/logic', 10),
    },
    {
      slug: 'set-theory',
      field: 'math',
      title: '集合論',
      prefix: '/k/math/set-theory',
      entries: entries('/k/math/set-theory', 12),
    },
    {
      slug: 'mechanics',
      field: 'physics',
      title: '解析力学',
      prefix: '/k/physics/mechanics',
      entries: entries('/k/physics/mechanics', 3),
    },
  ],
  posts: [{ href: '/k/posts/about', label: 'このサイトについて' }],
  notes: [
    { title: 'ノート', entries: [{ href: '/k/notes/quantum', label: '量子力学' }] },
    { title: 'レポート', entries: [{ href: '/k/notes/debye', label: 'デバイ模型' }] },
  ],
  notesHref: '/k/notes',
  notesNote: '44 本',
  start: { href: '/k/math/set-theory/1', label: '集合論 第 1 回', note: '入口' },
}

const flat = (blocks: readonly NavBlock[]) => blocks.flatMap((block) => block.sections)
const visible = (blocks: readonly NavBlock[]) =>
  flat(blocks)
    .filter((section) => section.kind === 'current' || section.open === true)
    .flatMap((section) => section.entries).length

test('現在地の判定は拡張子と末尾スラッシュを無視する', () => {
  ok(isCurrent('/k/math/set-theory/3.html', '/k/math/set-theory/3'))
  ok(isCurrent('/k/notes/', '/k/notes'))
  ok(!isCurrent('/k/notes', '/k/note'))
  ok(contains('/k/math/set-theory/3', '/k/math/set-theory'))
  ok(!contains('/k/math/set-theory-2/3', '/k/math/set-theory'))
})

test('連載を読んでいるときは、その連載だけが開く', () => {
  const blocks = scopeNav(data, '/k/math/set-theory/3')
  const [current] = flat(blocks)

  strictEqual(current.kind, 'current')
  strictEqual(current.title, '集合論')
  strictEqual(current.caption, '数学')
  strictEqual(current.entries.length, 12)

  // 同じ分野のほかの連載は畳まれている
  const logic = flat(blocks).find((section) => section.title === '数理論理学')
  strictEqual(logic?.kind, 'collapsed')
  strictEqual(logic?.open, false)

  // 開いて見えるのは今の連載の 12 本だけ。全記事 25 本を並べない。
  strictEqual(visible(blocks), 12)
})

test('現在地は「第 3 回 / 全 12 回」として出る', () => {
  const [current] = flat(scopeNav(data, '/k/math/set-theory/3'))

  strictEqual(current.position, 3)
  strictEqual(current.total, 12)
})

test('ほかの分野は 1 行のリンクだけになる', () => {
  const blocks = scopeNav(data, '/k/math/set-theory/3')
  const links = flat(blocks).find((section) => section.key === 'fields')

  deepStrictEqual(
    links?.entries.map((entry) => entry.label),
    ['物理', '計算機'],
  )
  strictEqual(links?.kind, 'links')
})

test('講義ノート 44 本は連載を読んでいる間は 1 行に留まる', () => {
  const blocks = scopeNav(data, '/k/math/set-theory/3')
  const notes = flat(blocks).find((section) => section.key === 'notes')

  strictEqual(notes?.kind, 'links')
  deepStrictEqual(notes?.entries, [{ href: '/k/notes', label: '講義ノート', note: '44 本' }])
})

test('ノートを読んでいるときは、その群だけが開く', () => {
  const blocks = scopeNav(data, '/k/notes/quantum')
  const [current] = flat(blocks)

  strictEqual(current.kind, 'current')
  ok(current.title?.includes('ノート'))
  strictEqual(current.entries[0].href, '/k/notes/quantum')

  const report = flat(blocks).find((section) => section.title === 'レポート')
  strictEqual(report?.kind, 'collapsed')
})

test('分野の目次では、その分野の連載が畳んで並び、先頭だけ開く', () => {
  const blocks = scopeNav(data, '/k/math')
  const sections = flat(blocks).filter((section) => section.key.startsWith('series:'))

  deepStrictEqual(
    sections.map((section) => [section.title, section.open]),
    [
      ['数理論理学', true],
      ['集合論', false],
    ],
  )
  strictEqual(visible(blocks), 10)
})

test('入口では道を 1 本だけ示す', () => {
  const blocks = scopeNav(data, '/k/')
  const start = flat(blocks).find((section) => section.key === 'start')

  deepStrictEqual(start?.entries, [
    { href: '/k/math/set-theory/1', label: '集合論 第 1 回', note: '入口' },
  ])
  // 入口では記事の一覧を 1 本も開かない。道は入口の 1 行だけ。
  strictEqual(visible(blocks), 0)
})

test('入口を宣言していなければ、その枠は出ない', () => {
  const blocks = scopeNav({ ...data, start: undefined }, '/k/')

  strictEqual(
    flat(blocks).find((section) => section.key === 'start'),
    undefined,
  )
})
