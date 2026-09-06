/**
 * 概念グラフの、人手では保てなくなる性質を機械で止める。
 *
 * 591 概念のとき、分野をまたぐ重複を人手で 4 件見つけた。教科書の水準まで
 * 広げると 5,000 になり、そこでは目で追えない。
 *
 * 似ているだけの対は落とさない（`scripts/duplicates.mjs` が一覧を出す）。
 * ここで落とすのは、同じものを二度置いたと断定できる場合だけ。
 */

import assert from 'node:assert/strict'
import { existsSync, readFileSync, readdirSync, statSync } from 'node:fs'
import { join } from 'node:path'
import { test } from 'node:test'

import { concepts, derivations, limits } from '../data/concepts/index.ts'

const norm = (s: string): string => s.toLowerCase().replace(/[（）()「」『』、。,.\-–—・\s]/g, '')

test('id が重複していない', () => {
  const seen = new Set<string>()
  const dup: string[] = []
  for (const concept of concepts) {
    if (seen.has(concept.id)) dup.push(concept.id)
    seen.add(concept.id)
  }
  assert.deepEqual(dup, [])
})

test('同じ名前の概念を二つ置いていない', () => {
  // 分野をまたぐ重複は、まず名前が一致する形で出る。
  // 実際に二つ要るなら、名前のほうを分野が分かるように書き分けること。
  const byLabel = new Map<string, string[]>()
  for (const concept of concepts) {
    const key = norm(concept.label)
    byLabel.set(key, [...(byLabel.get(key) ?? []), `${concept.id} (${concept.field})`])
  }
  const clashes = [...byLabel.entries()].filter(([, ids]) => ids.length > 1)
  assert.deepEqual(clashes, [])
})

test('別名が、他の概念の名前と衝突していない', () => {
  // 畳んだ側の名前は `aka` に残す。あとから同じ名前で概念を立てたら、それは重複である。
  // 名前どうしの一致（上のテスト）では、言い換えられた側が捕まらない。
  const labels = new Map(concepts.map((concept) => [norm(concept.label), concept.id]))
  const clashes = concepts.flatMap((concept) =>
    (concept.aka ?? [])
      .map((name) => ({ name, owner: labels.get(norm(name)) }))
      .filter((hit) => hit.owner !== undefined && hit.owner !== concept.id)
      .map((hit) => `${concept.id} の別名「${hit.name}」が ${hit.owner} の名前と同じ`),
  )
  assert.deepEqual(clashes, [])
})

test('同じ別名を二つの概念が名乗っていない', () => {
  const byAka = new Map<string, string[]>()
  for (const concept of concepts) {
    for (const name of concept.aka ?? []) {
      const key = norm(name)
      byAka.set(key, [...(byAka.get(key) ?? []), concept.id])
    }
  }
  assert.deepEqual(
    [...byAka.entries()].filter(([, ids]) => ids.length > 1),
    [],
  )
})

test('仮定と、それを出す定理が、どちらも概念として在る', () => {
  const ids = new Set(concepts.map((concept) => concept.id))
  const missing = derivations.flatMap((d) =>
    [d.assumed, d.derived].filter((id) => !ids.has(id)),
  )
  assert.deepEqual(missing, [])
})

test('仮定を出す定理を、依存の辺にも書いていない', () => {
  // 両方に書くと、仮定が自分を導く定理を前提にすることになり、順序が逆さになる。
  const byId = new Map(concepts.map((concept) => [concept.id, concept]))
  const wrong = derivations.filter((d) => {
    const assumed = byId.get(d.assumed)
    return assumed?.requires.includes(d.derived) === true
  })
  assert.deepEqual(
    wrong.map((d) => `${d.assumed} requires ${d.derived}`),
    [],
  )
})

test('仮定と定理が同じ概念になっていない', () => {
  assert.deepEqual(
    derivations.filter((d) => d.assumed === d.derived).map((d) => d.assumed),
    [],
  )
})

test('記事が被覆している概念は、その連載の名前のファイルに在る', () => {
  // 1 ファイルを割ったとき、元の区切りをそのまま引き継いだせいで
  // 電磁気・くりこみ・ゲージ理論・標準模型の 51 概念が
  // `quantum-field-theory.ts` に紛れていた。並列で広げるために割ったのに、
  // いちばん割れていないといけない所が割れていなかった。
  //
  // どこに置くかは記事のデータが決める。ファイル名は連載の slug と揃える。
  const walk = (dir: string): string[] =>
    readdirSync(dir).flatMap((name) => {
      const path = join(dir, name)
      return statSync(path).isDirectory() ? walk(path) : path.endsWith('.typ') ? [path] : []
    })

  const seriesOf = new Map<string, string>()
  for (const path of walk('src/content/articles')) {
    const src = readFileSync(path, 'utf8')
    const series = src.match(/\n\s*series:\s*"([^"]+)"/)?.[1]
    const head = src.match(/\n\s*provides:\s*\(/)
    if (!series || !head) continue
    let i = (head.index ?? 0) + head[0].length
    let depth = 1
    while (i < src.length && depth > 0) {
      if (src[i] === '(') depth += 1
      else if (src[i] === ')') depth -= 1
      i += 1
    }
    const inner = src.slice((head.index ?? 0) + head[0].length, i - 1)
    for (const m of inner.matchAll(/"([^"]+)"/g)) if (!seriesOf.has(m[1])) seriesOf.set(m[1], series)
  }

  const stray: string[] = []
  for (const file of readdirSync('src/data/concepts')) {
    if (!file.endsWith('.ts') || ['types.ts', 'index.ts', 'derivations.ts'].includes(file)) continue
    const slug = file.replace(/\.ts$/, '')
    const src = readFileSync(join('src/data/concepts', file), 'utf8')
    for (const m of src.matchAll(/^\s*c\('([a-z0-9-]+)'/gm)) {
      const home = seriesOf.get(m[1])
      // その連載のファイルが在るときだけ言う。無ければ、まだ割る番が来ていない。
      if (home && home !== slug && existsSync(join('src/data/concepts', `${home}.ts`))) {
        stray.push(`${m[1]} は ${file} に在るが、${home} が被覆している`)
      }
    }
  }
  assert.deepEqual(stray, [])
})

test('概念の文字列に Typst の記法が混ざっていない', () => {
  // `--` は Typst では en ダッシュになる。**概念の名前は Typst を通らない**
  // （`concept-math.ts` は `$...$` を含む文字列だけ組み、残りは素で出す）ので、
  // そのまま二つのハイフンとして表示されていた。19 箇所あった。
  //
  // CLAUDE.md の「記法を混ぜない」の三度目。`.typ` と `.ts` を行き来すると漏れる。
  // 数式の中（`$...$`）は Typst が組むので、そちらは見ない。
  const outsideMath = (text: string): string => text.replace(/\$[^$]*\$/g, '')
  const found: string[] = []
  for (const concept of concepts) {
    for (const [what, text] of [
      ['label', concept.label],
      ['gist', concept.gist],
      ...(concept.aka ?? []).map((a) => ['aka', a] as const),
    ] as const) {
      const bare = outsideMath(text)
      if (bare.includes('--')) found.push(`${concept.id}.${what}: ${text}`)
      if (/#[a-z]+\[/.test(bare)) found.push(`${concept.id}.${what}: Typst の関数呼び出し`)
    }
  }
  assert.deepEqual(found, [])
})

test('成り立たなくなる場所の両端が、どちらも概念として在る', () => {
  const ids = new Set(concepts.map((concept) => concept.id))
  assert.deepEqual(
    limits.flatMap((l) => [l.holds, l.fails].filter((id) => !ids.has(id))),
    [],
  )
})

test('成り立たなくなる関係を、依存の辺にも仮定→定理にも書いていない', () => {
  // 三つは別の関係である。二重に書くと、どれが効いているのか読めなくなる。
  const byId = new Map(concepts.map((concept) => [concept.id, concept]))
  const wrong = limits.flatMap((l) => {
    const bad: string[] = []
    if (byId.get(l.holds)?.requires.includes(l.fails) === true)
      bad.push(`${l.holds} requires ${l.fails}`)
    if (derivations.some((d) => d.assumed === l.holds && d.derived === l.fails))
      bad.push(`${l.holds} -> ${l.fails} が derivations にもある`)
    if (l.holds === l.fails) bad.push(`${l.holds} が自分自身`)
    return bad
  })
  assert.deepEqual(wrong, [])
})
