#!/usr/bin/env node
/**
 * 分野をまたいで、同じことを二度定義していないかを見る。
 *
 * 591 概念のとき、人手で 4 件見つかった。教科書の水準まで広げると 5,000 になり、
 * そこでは人手で気づけない。機械で挙げる。
 *
 *   node scripts/duplicates.mjs        分野をまたぐ疑い
 *   node scripts/duplicates.mjs --all  同じ分野の中も見る
 */

import { concepts } from '../src/data/concepts/index.ts'

const norm = (s) =>
  s
    .toLowerCase()
    .replace(/[（）()「」『』、。,.\-–—・\s]/g, '')
    .replace(/[ぁ-ん]/g, '')

const tokens = (s) => {
  const latin = s.toLowerCase().match(/[a-z]{3,}/g) ?? []
  // 日本語は 2 文字の重なりで見る。分かち書きが無いので n-gram にする。
  const kanji = s.replace(/[^一-龥ァ-ヴー]/g, ' ')
  const grams = []
  for (const run of kanji.split(/\s+/)) {
    for (let i = 0; i + 2 <= run.length; i += 1) grams.push(run.slice(i, i + 2))
  }
  return new Set([...latin, ...grams])
}

const jaccard = (a, b) => {
  if (a.size === 0 || b.size === 0) return 0
  let hit = 0
  for (const t of a) if (b.has(t)) hit += 1
  return hit / (a.size + b.size - hit)
}

const all = process.argv.includes('--all')

// 別名も名前として扱う。畳んだ側の名前で新しく概念を立てるのが、いちばん出やすい重複。
const prepared = concepts.map((c) => ({
  concept: c,
  names: new Set([c.label, ...(c.aka ?? [])].map(norm)),
  bag: tokens([c.label, ...(c.aka ?? []), c.gist].join(' ')),
}))

const hits = []
for (let i = 0; i < prepared.length; i += 1) {
  for (let j = i + 1; j < prepared.length; j += 1) {
    const a = prepared[i]
    const b = prepared[j]
    if (!all && a.concept.field === b.concept.field) continue
    const sameLabel = [...a.names].some((n) => b.names.has(n))
    const score = jaccard(a.bag, b.bag)
    if (!sameLabel && score < 0.34) continue
    hits.push({ a: a.concept, b: b.concept, sameLabel, score })
  }
}

hits.sort((x, y) => (x.sameLabel !== y.sameLabel ? (x.sameLabel ? -1 : 1) : y.score - x.score))

for (const hit of hits) {
  const tag = hit.sameLabel ? '同じ名前' : `似  ${hit.score.toFixed(2)}`
  console.log(`${tag}  ${hit.a.id} (${hit.a.field})  ×  ${hit.b.id} (${hit.b.field})`)
  console.log(`          ${hit.a.label} — ${hit.a.gist}`)
  console.log(`          ${hit.b.label} — ${hit.b.gist}`)
}
console.log(`\n${hits.length} 件 / ${concepts.length} 概念`)
