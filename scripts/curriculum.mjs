#!/usr/bin/env node
/**
 * 記事の front matter から依存グラフを組み、目標から読む順序を逆算する。
 *
 *   node scripts/curriculum.mjs stats                    グラフの実測値
 *   node scripts/curriculum.mjs holes                    provider の無い概念
 *   node scripts/curriculum.mjs concepts                 概念の一覧
 *   node scripts/curriculum.mjs path <concept>...        読む順序
 *   node scripts/curriculum.mjs path --known a,b <c>     既知を差し引く
 *   node scripts/curriculum.mjs path --notation <c>      記法の依存もたどる
 *   node scripts/curriculum.mjs dump                     グラフを JSON で出す
 *
 * front matter は typst を起動せず、`#show: post.with(...)` を直接読む。
 * 記事 1 本につき typst を 2 回起動するビルドと違い、ここは一瞬で終わる。
 * 形が崩れていれば黙って無視せず、その旨を出す。
 */

import { readdirSync, readFileSync, statSync } from 'node:fs'
import { join, relative } from 'node:path'

import { danglingConcepts, findCycles, planFor } from '../src/lib/curriculum.ts'

const ROOT = new URL('..', import.meta.url).pathname
const ARTICLES = join(ROOT, 'src/content/articles')

const walk = (dir) =>
  readdirSync(dir).flatMap((name) => {
    const path = join(dir, name)
    return statSync(path).isDirectory() ? walk(path) : path.endsWith('.typ') ? [path] : []
  })

/** `name: ("a", "b",)` の中身を配列で返す。無ければ空配列。 */
const readList = (src, name) => {
  const head = src.match(new RegExp(`\\n\\s*${name}:\\s*\\(`))
  if (!head) return []
  const start = head.index + head[0].length
  let depth = 1
  let i = start
  while (i < src.length && depth > 0) {
    if (src[i] === '(') depth += 1
    else if (src[i] === ')') depth -= 1
    i += 1
  }
  return [...src.slice(start, i - 1).matchAll(/"([^"]+)"/g)].map((m) => m[1])
}

const readScalar = (src, name) => {
  const m = src.match(new RegExp(`\\n\\s*${name}:\\s*"?([^",\\n]+)"?,`))
  return m ? m[1].trim() : undefined
}

const load = () => {
  const nodes = []
  const skipped = []
  for (const path of walk(ARTICLES)) {
    const src = readFileSync(path, 'utf8')
    const field = readScalar(src, 'field')
    const series = readScalar(src, 'series')
    const order = readScalar(src, 'order')
    const title = readScalar(src, 'title')
    if (!field || !series || !order) {
      skipped.push(relative(ROOT, path))
      continue
    }
    const provides = readList(src, 'provides')
    const requires = readList(src, 'requires')
    const uses = readList(src, 'uses')
    nodes.push({
      id: `${field}/${series}/${order}`,
      title: title ?? path,
      // 読む手間の目安。本文の長さをそのまま使う（千文字を 1 とする）。
      cost: Math.max(1, Math.round(src.length / 1000)),
      provides,
      requires,
      uses,
      source: relative(ROOT, path),
      annotated: provides.length > 0,
    })
  }
  return { nodes: nodes.sort((a, b) => (a.id < b.id ? -1 : 1)), skipped }
}

const { nodes, skipped } = load()
const annotated = nodes.filter((n) => n.annotated)

const [command = 'stats', ...rest] = process.argv.slice(2)

const parseOptions = (args) => {
  const options = {}
  const targets = []
  for (let i = 0; i < args.length; i += 1) {
    if (args[i] === '--known') {
      options.known = (args[i + 1] ?? '').split(',').filter(Boolean)
      i += 1
    } else if (args[i] === '--notation') {
      options.includeNotation = true
    } else {
      targets.push(args[i])
    }
  }
  return { options, targets }
}

const show = (plan) => {
  if (plan.order.length === 0 && plan.missing.length === 0) {
    console.log('（読むものはありません）')
  }
  plan.order.forEach((node, i) => {
    console.log(`${String(i + 1).padStart(2)}. ${node.title}`)
    console.log(`    /${node.id}  (${node.cost})`)
  })
  console.log(`\n合計 ${plan.order.length} 本 / コスト ${plan.cost}`)
  if (plan.missing.length > 0) {
    console.log(`\n穴（このサイトに記事が無い）: ${plan.missing.join(', ')}`)
  }
  if (plan.deferred.length > 0) {
    console.log(`後回しにした記法: ${plan.deferred.join(', ')}`)
  }
}

if (command === 'stats') {
  const concepts = new Set(annotated.flatMap((n) => n.provides))
  const hard = annotated.reduce((sum, n) => sum + n.requires.length, 0)
  const soft = annotated.reduce((sum, n) => sum + n.uses.length, 0)
  const cycles = findCycles(annotated)
  console.log(`記事           ${nodes.length} 本（注釈済み ${annotated.length}）`)
  console.log(`概念           ${concepts.size}`)
  console.log(`論理の辺       ${hard}`)
  console.log(`記法の辺       ${soft}`)
  console.log(`穴             ${danglingConcepts(annotated).length}`)
  console.log(`循環           ${cycles.length}`)
  if (cycles.length > 0) for (const cycle of cycles) console.log(`  ${cycle.join(' -> ')}`)
  if (skipped.length > 0) console.log(`\nfront matter を読めなかった: ${skipped.length} 本`)
} else if (command === 'holes') {
  for (const concept of danglingConcepts(annotated)) console.log(concept)
} else if (command === 'concepts') {
  const index = new Map()
  for (const node of annotated) {
    for (const concept of node.provides) {
      index.set(concept, [...(index.get(concept) ?? []), node.id])
    }
  }
  for (const concept of [...index.keys()].sort()) {
    console.log(`${concept.padEnd(38)} ${index.get(concept).join(', ')}`)
  }
} else if (command === 'path') {
  const { options, targets } = parseOptions(rest)
  if (targets.length === 0) {
    console.error('目標の概念を指定してください。一覧は `concepts`。')
    process.exit(1)
  }
  show(planFor(annotated, targets, options))
} else if (command === 'dump') {
  console.log(JSON.stringify(annotated, null, 2))
} else {
  console.error(`unknown command: ${command}`)
  process.exit(1)
}
