#!/usr/bin/env node
/**
 * mathlib の依存グラフを取ってくる。
 *
 *   node scripts/mathlib-graph.mjs Geometry [出力先]
 *
 * mathlib は Lean で書かれた形式化された数学のライブラリで、
 * モジュール間の依存が `import` として明示されている。
 * 人が付けた注釈ではなく、コンパイラが検証している依存である。
 *
 * ここで取るのはモジュール単位の依存で、定理単位ではない。
 * 定理単位のグラフは doc-gen4 の生成物か、ローカルに Lean を入れて
 * `#print axioms` を回す必要がある。モジュール単位でも
 * 「粒度を畳めば教材の依存グラフになるか」を試すには足りる。
 *
 * 取得は GitHub の raw から 1 モジュール 1 リクエスト。
 * 全 8000 本を取ると重いので、接頭辞で絞る前提にしてある。
 */

import { writeFileSync } from 'node:fs'

const RAW = 'https://raw.githubusercontent.com/leanprover-community/mathlib4/master'
const CONCURRENCY = 12

const prefix = process.argv[2]
const out = process.argv[3] ?? `mathlib-${(prefix ?? 'all').toLowerCase()}.json`
if (!prefix) {
  console.error('使い方: node scripts/mathlib-graph.mjs <接頭辞> [出力先]')
  console.error('例:     node scripts/mathlib-graph.mjs Geometry')
  process.exit(1)
}

const fetchText = async (path) => {
  const res = await fetch(`${RAW}/${path}`)
  if (!res.ok) throw new Error(`${res.status} ${path}`)
  return res.text()
}

/** `import A.B.C` の行を拾う。`public import` と `import` の両方に対応する。 */
const importsOf = (src) =>
  [...src.matchAll(/^\s*(?:public\s+)?import\s+([\w.]+)/gm)].map((m) => m[1])

const modulePath = (name) => `${name.replaceAll('.', '/')}.lean`

console.error(`Mathlib.lean を取得中…`)
const root = await fetchText('Mathlib.lean')
const modules = importsOf(root).filter((m) => m.startsWith(`Mathlib.${prefix}`))
console.error(`${prefix} 配下のモジュール: ${modules.length}`)

const edges = []
const failed = []
let done = 0

const worker = async (queue) => {
  for (;;) {
    const name = queue.pop()
    if (name === undefined) return
    try {
      const src = await fetchText(modulePath(name))
      for (const dep of importsOf(src)) {
        if (dep.startsWith('Mathlib.')) edges.push([name, dep])
      }
    } catch (err) {
      failed.push(`${name}: ${err.message}`)
    }
    done += 1
    if (done % 25 === 0) console.error(`  ${done}/${modules.length}`)
  }
}

const queue = [...modules]
await Promise.all(Array.from({ length: CONCURRENCY }, () => worker(queue)))

// 依存先が接頭辞の外に出るぶんは、そのまま「外部への依存」として残す。
// どの分野に寄りかかっているかが、ここに出る。
const external = new Map()
for (const [, dep] of edges) {
  if (!dep.startsWith(`Mathlib.${prefix}`)) {
    const area = dep.split('.').slice(0, 2).join('.')
    external.set(area, (external.get(area) ?? 0) + 1)
  }
}

const graph = {
  prefix,
  modules: modules.length,
  edges: edges.length,
  internalEdges: edges.filter(([, d]) => d.startsWith(`Mathlib.${prefix}`)).length,
  externalByArea: Object.fromEntries([...external].sort((a, b) => b[1] - a[1])),
  edgeList: edges,
  failed,
}

writeFileSync(out, JSON.stringify(graph, null, 2))
console.error(`\nモジュール ${graph.modules} / 辺 ${graph.edges}（内部 ${graph.internalEdges}）`)
console.error(`外部への依存が多い順:`)
for (const [area, n] of Object.entries(graph.externalByArea).slice(0, 10)) {
  console.error(`  ${String(n).padStart(5)}  ${area}`)
}
if (failed.length > 0) console.error(`取得できなかったもの: ${failed.length}`)
console.error(`\n→ ${out}`)
