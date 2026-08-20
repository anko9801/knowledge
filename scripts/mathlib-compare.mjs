#!/usr/bin/env node
/**
 * mathlib のモジュール名と、手で書いた概念グラフを突き合わせる。
 *
 *   node scripts/mathlib-compare.mjs <mathlib-*.json>...
 *
 * 問いは二つある。
 *
 *   1. mathlib の粒度（モジュール）を、教材の粒度（概念）へ畳めるか
 *   2. 畳めないとしても、手書きグラフの穴を検出できるか
 *
 * 名前の一致だけで対応を付ける。意味を見ないので取りこぼすが、
 * 「そもそも名前で対応が付く分野かどうか」は、これで分かる。
 */

import { readFileSync } from 'node:fs'

import { concepts } from '../src/data/concepts.ts'

const files = process.argv.slice(2)
if (files.length === 0) {
  console.error('使い方: node scripts/mathlib-compare.mjs <mathlib-*.json>...')
  process.exit(1)
}

/** `Mathlib.LinearAlgebra.Dual.Basic` → ['linear', 'algebra', 'dual', 'basic'] */
const tokensOfModule = (name) =>
  name
    .replace(/^Mathlib\./, '')
    .split('.')
    .flatMap((part) => part.replace(/([a-z0-9])([A-Z])/g, '$1 $2').toLowerCase().split(/[\s_]+/))
    .filter((t) => t.length > 2 && !STOP.has(t))

/** `dual-space` → ['dual', 'space'] */
const tokensOfConcept = (id) => id.split('-').filter((t) => t.length > 2 && !STOP.has(t))

// mathlib のモジュール名に頻出するが、意味を持たない語。
const STOP = new Set([
  'basic', 'defs', 'lemmas', 'order', 'data', 'tactic', 'util', 'aux',
  'constructions', 'instances', 'algebra', 'analysis', 'topology', 'theory',
])

const modules = new Set()
for (const file of files) {
  const graph = JSON.parse(readFileSync(file, 'utf8'))
  for (const [from, to] of graph.edgeList) {
    modules.add(from)
    if (to.startsWith('Mathlib.')) modules.add(to)
  }
}

const moduleTokens = new Map()
for (const m of modules) moduleTokens.set(m, new Set(tokensOfModule(m)))

/** 概念のトークンが、あるモジュールのトークンに全部含まれるか。 */
const matchesFor = (concept) => {
  const want = tokensOfConcept(concept.id)
  if (want.length === 0) return []
  const hits = []
  for (const [m, have] of moduleTokens) {
    if (want.every((t) => have.has(t))) hits.push(m)
  }
  return hits
}

const matched = []
const unmatched = []
for (const concept of concepts) {
  const hits = matchesFor(concept)
  if (hits.length > 0) matched.push({ concept, hits })
  else unmatched.push(concept)
}

const byKind = (list) => {
  const counts = new Map()
  for (const c of list) counts.set(c.kind, (counts.get(c.kind) ?? 0) + 1)
  return [...counts].sort((a, b) => b[1] - a[1])
}

const byField = (list) => {
  const counts = new Map()
  for (const c of list) counts.set(c.field, (counts.get(c.field) ?? 0) + 1)
  return [...counts].sort((a, b) => b[1] - a[1])
}

console.log(`mathlib のモジュール   ${modules.size}`)
console.log(`概念                   ${concepts.length}`)
console.log(`名前で対応が付いた     ${matched.length}`)
console.log(`付かなかった           ${unmatched.length}`)

// 数学の概念だけに絞って見る。他分野は mathlib に無くて当然である。
const mathConcepts = concepts.filter((c) => c.field === 'math')
const mathMatched = matched.filter((m) => m.concept.field === 'math')
console.log(
  `\n数学の概念だけ         ${mathMatched.length} / ${mathConcepts.length} ` +
    `(${Math.round((mathMatched.length / mathConcepts.length) * 100)}%)`,
)

console.log(`\n対応が付かなかった概念の種類`)
for (const [kind, n] of byKind(unmatched.filter((c) => c.field === 'math'))) {
  console.log(`  ${String(n).padStart(4)}  ${kind}`)
}
console.log(`\n対応が付いた概念の種類`)
for (const [kind, n] of byKind(mathMatched.map((m) => m.concept))) {
  console.log(`  ${String(n).padStart(4)}  ${kind}`)
}

console.log(`\n分野別（対応が付かなかったもの）`)
for (const [field, n] of byField(unmatched)) console.log(`  ${String(n).padStart(4)}  ${field}`)

console.log(`\n対応の例（概念 → mathlib モジュール数）`)
for (const { concept, hits } of mathMatched.slice(0, 12)) {
  console.log(`  ${concept.id.padEnd(30)} ${String(hits.length).padStart(4)} 本  例: ${hits[0]}`)
}

console.log(`\n対応が付かなかった数学の概念`)
for (const c of unmatched.filter((x) => x.field === 'math').slice(0, 25)) {
  console.log(`  ${c.kind.padEnd(11)} ${c.id.padEnd(32)} ${c.label}`)
}

// 逆向き。mathlib にあって、こちらに無い塊を探す。
// 第 3 階層（Mathlib.Analysis.Calculus など）でまとめて数える。
const claimed = new Set(matched.flatMap((m) => m.hits))
const clusters = new Map()
for (const m of modules) {
  const key = m.split('.').slice(0, 3).join('.')
  const entry = clusters.get(key) ?? { total: 0, hit: 0 }
  entry.total += 1
  if (claimed.has(m)) entry.hit += 1
  clusters.set(key, entry)
}

console.log(`\nmathlib にあって、こちらの概念が一つも触れていない塊`)
const untouched = [...clusters]
  .filter(([, e]) => e.hit === 0 && e.total >= 8)
  .sort((a, b) => b[1].total - a[1].total)
for (const [key, e] of untouched.slice(0, 18)) {
  console.log(`  ${String(e.total).padStart(4)} 本  ${key}`)
}
console.log(`  （${untouched.length} 塊、計 ${untouched.reduce((s, [, e]) => s + e.total, 0)} 本）`)
