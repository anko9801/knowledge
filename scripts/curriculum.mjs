#!/usr/bin/env node
/**
 * 概念グラフの上で執筆計画を立てる。
 *
 * 一次データは src/data/concepts.ts。記事はそこへの被覆でしかない。
 * だから、まだ書いていない領域も同じグラフに乗る。
 *
 *   node scripts/curriculum.mjs stats                グラフの実測値と被覆率
 *   node scripts/curriculum.mjs goals                到達目標と、そこまでの残り
 *   node scripts/curriculum.mjs plan <goal|concept>  依存順。記事の有無つき
 *   node scripts/curriculum.mjs next [n]             次に書くべき記事
 *   node scripts/curriculum.mjs gaps                 記事の無い概念だけ
 *   node scripts/curriculum.mjs dump                 JSON
 *
 * 記事側の front matter は provides しか見ない。前提は概念グラフが持つ。
 */

import { readdirSync, readFileSync, statSync } from 'node:fs'
import { join, relative } from 'node:path'

import { concepts, goals } from '../src/data/concepts.ts'
import {
  backlog,
  danglingConcepts,
  drift,
  findCycles,
  planFor,
} from '../src/lib/curriculum.ts'

const ROOT = new URL('..', import.meta.url).pathname
const ARTICLES = join(ROOT, 'src/content/articles')

const walk = (dir) =>
  readdirSync(dir).flatMap((name) => {
    const path = join(dir, name)
    return statSync(path).isDirectory() ? walk(path) : path.endsWith('.typ') ? [path] : []
  })

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

const articles = walk(ARTICLES)
  .map((path) => {
    const src = readFileSync(path, 'utf8')
    const field = readScalar(src, 'field')
    const series = readScalar(src, 'series')
    const order = readScalar(src, 'order')
    if (!field || !series || !order) return undefined
    return {
      id: `${field}/${series}/${order}`,
      title: readScalar(src, 'title') ?? relative(ROOT, path),
      provides: readList(src, 'provides'),
    }
  })
  .filter((a) => a !== undefined && a.provides.length > 0)
  .sort((a, b) => (a.id < b.id ? -1 : 1))

const [command = 'stats', ...rest] = process.argv.slice(2)

const mark = (step) => (step.article ? '✓' : '·')

const showPlan = (plan) => {
  for (const step of plan.steps) {
    const where = step.article ? `/${step.article.id}` : '— 未執筆'
    console.log(`${mark(step)} ${step.concept.label.padEnd(28)} ${where}`)
    if (!step.article) console.log(`  ${' '.repeat(29)}${step.concept.gist}`)
  }
  console.log(
    `\n概念 ${plan.steps.length} / 記事あり ${plan.covered} / 未執筆 ${plan.missing.length}`,
  )
  if (plan.unknown.length > 0) console.log(`未定義の id: ${plan.unknown.join(', ')}`)
}

if (command === 'stats') {
  const covered = new Set(articles.flatMap((a) => a.provides))
  const inGraph = concepts.filter((c) => covered.has(c.id)).length
  const cycles = findCycles(concepts)
  const stray = drift(concepts, articles)
  const dangling = danglingConcepts(concepts)
  const edges = concepts.reduce((sum, c) => sum + c.requires.length, 0)
  console.log(`概念           ${concepts.length}`)
  console.log(`依存の辺       ${edges}`)
  console.log(`記事           ${articles.length} 本`)
  console.log(`被覆           ${inGraph} / ${concepts.length} 概念 (${Math.round((inGraph / concepts.length) * 100)}%)`)
  console.log(`未執筆         ${concepts.length - inGraph}`)
  console.log(`目標           ${goals.length}`)
  console.log(`循環           ${cycles.length}`)
  for (const cycle of cycles) console.log(`  ${cycle.join(' -> ')}`)
  if (dangling.length > 0) console.log(`未定義の前提   ${dangling.join(', ')}`)
  if (stray.length > 0) console.log(`グラフに無い概念を記事が名乗っている: ${stray.join(', ')}`)
} else if (command === 'goals') {
  for (const goal of goals) {
    const plan = planFor(concepts, articles, goal.needs)
    const rest = plan.missing.length
    console.log(
      `${rest === 0 ? '達成' : `残り ${String(rest).padStart(2)} 本`}  ${goal.id.padEnd(20)} ${goal.label}`,
    )
  }
} else if (command === 'plan') {
  const [target] = rest
  if (!target) {
    console.error('目標の id か概念の id を指定してください。一覧は `goals`。')
    process.exit(1)
  }
  const goal = goals.find((g) => g.id === target)
  showPlan(planFor(concepts, articles, goal ? goal.needs : [target]))
} else if (command === 'next') {
  const limit = Number(rest[0] ?? 10)
  const queue = backlog(concepts, articles)
  console.log('すぐ書けるもの（前提がすべて記事になっている）\n')
  let shown = 0
  for (const item of queue) {
    if (!item.ready) continue
    if (shown >= limit) break
    console.log(`  ${String(item.unlocks).padStart(3)} 下流  ${item.concept.label}`)
    console.log(`            ${item.concept.gist}`)
    shown += 1
  }
  const blocked = queue.filter((i) => !i.ready).length
  console.log(`\n前提がまだ揃わないもの: ${blocked}`)
} else if (command === 'gaps') {
  for (const item of backlog(concepts, articles)) {
    console.log(
      `${item.ready ? '書ける' : '待ち  '} ${String(item.unlocks).padStart(3)} ${item.concept.id.padEnd(38)} ${item.concept.label}`,
    )
  }
} else if (command === 'dump') {
  console.log(JSON.stringify({ concepts, goals, articles }, null, 2))
} else {
  console.error(`unknown command: ${command}`)
  process.exit(1)
}
