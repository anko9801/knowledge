import { deepStrictEqual, strictEqual } from 'node:assert/strict'
import { readFileSync, readdirSync, statSync } from 'node:fs'
import { join } from 'node:path'
import { test } from 'node:test'

import { brokenLinks, internalHrefs, isKnown, type Known } from './internal-links.ts'

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
