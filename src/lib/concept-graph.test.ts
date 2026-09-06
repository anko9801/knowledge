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
import { test } from 'node:test'

import { concepts, derivations } from '../data/concepts/index.ts'

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
