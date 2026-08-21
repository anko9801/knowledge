import { deepStrictEqual, strictEqual } from 'node:assert/strict'
import { readFileSync, readdirSync, statSync } from 'node:fs'
import { join } from 'node:path'
import { test } from 'node:test'

import {
  brokenLinks,
  internalHrefs,
  isKnown,
  misplacedNeighbours,
  type Known,
} from './internal-links.ts'

const known: Known = {
  articles: new Set(['math/measure/1', 'cs/complexity/1']),
  fields: new Set(['math', 'cs']),
  concepts: new Set(['sigma-algebra']),
}

test('サイト内リンクの行き先だけを拾う', () => {
  const typ = '#link("https://example.com")[外]と#link("/math/measure/1")[中]と#link("/math/measure/1#def-x")[錨]'
  deepStrictEqual(internalHrefs(typ), ['/math/measure/1', '/math/measure/1'])
})

test('実在する行き先を通す', () => {
  strictEqual(isKnown('/math/measure/1', known), true)
  strictEqual(isKnown('/math', known), true)
  strictEqual(isKnown('/concepts/sigma-algebra', known), true)
  strictEqual(isKnown('/', known), true)
})

test('まだ書いていない回を止める', () => {
  // taxonomy に予定として載っていると、書ける気がしてしまう。
  strictEqual(isKnown('/cs/crypto/1', known), false)
  strictEqual(isKnown('/math/measure/9', known), false)
  strictEqual(isKnown('/physics', known), false)
  strictEqual(isKnown('/concepts/not-a-concept', known), false)
})

test('判定できない形は通す', () => {
  // 止めるのは分かるものだけにする。検査そのものが邪魔になっては困る。
  strictEqual(isKnown('/notes/note--set_theory', known), true)
  strictEqual(isKnown('/a/b/c/d', known), true)
})

test('「前回」が同じ連載の一つ前を指していれば通す', () => {
  const ok = [
    { path: 'a', key: 'math/measure/3', text: '#link("/math/measure/2")[前回]' },
    { path: 'b', key: 'math/measure/3', text: '#link("/math/measure/4")[次回]' },
    { path: 'c', key: 'math/measure/3', text: '#link("/math/measure/1")[前々回]' },
    { path: 'd', key: 'math/measure/3', text: '#link("/math/measure/2#def-x")[前回]' },
  ]
  deepStrictEqual(misplacedNeighbours(ok), [])
})

test('ほかの連載に「前回」と書いていたら止める', () => {
  // 書いている側は直前に読み返した回のつもりでも、読者には別の連載である。
  const bad = [{ path: 'x', key: 'chemistry/symmetry/1', text: '#link("/math/groups/2")[前回]' }]
  deepStrictEqual(misplacedNeighbours(bad), [{ source: 'x', href: '/math/groups/2' }])
})

test('番号が隣でなければ止める', () => {
  const bad = [{ path: 'y', key: 'math/measure/3', text: '#link("/math/measure/1")[前回]' }]
  strictEqual(misplacedNeighbours(bad).length, 1)
})

// --- 実ファイルに当てる。ここが本番 ---

const typFiles = (dir: string): string[] =>
  readdirSync(dir).flatMap((name) => {
    const path = join(dir, name)
    if (statSync(path).isDirectory()) return typFiles(path)
    return name.endsWith('.typ') ? [path] : []
  })

test('本文のサイト内リンクが、全部実在する回を指している', () => {
  const articles = typFiles('src/content/articles')

  const real: Known = {
    articles: new Set(
      articles.map((path) => {
        const [, , , field, series, file] = path.split('/')
        return `${field}/${series}/${Number.parseInt(file as string, 10)}`
      }),
    ),
    fields: new Set(articles.map((path) => path.split('/')[3] as string)),
    concepts: new Set(
      [...readFileSync('src/data/concepts.ts', 'utf8').matchAll(/\bc\('([^']+)'/g)].map(
        (m) => m[1] as string,
      ),
    ),
  }

  const broken = brokenLinks(
    articles.map((path) => ({ path, text: readFileSync(path, 'utf8') })),
    real,
  )

  strictEqual(broken.map((b) => `${b.source} -> ${b.href}`).join('\n'), '')
})

test('本文の「前回」「次回」が、同じ連載の隣を指している', () => {
  const misplaced = misplacedNeighbours(
    typFiles('src/content/articles').map((path) => {
      const [, , , field, series, file] = path.split('/')
      return {
        path,
        key: `${field}/${series}/${Number.parseInt(file as string, 10)}`,
        text: readFileSync(path, 'utf8'),
      }
    }),
  )

  strictEqual(misplaced.map((b) => `${b.source} -> ${b.href}`).join('\n'), '')
})
