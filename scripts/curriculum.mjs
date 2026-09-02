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
 *   node scripts/curriculum.mjs order                前提が後ろにある箇所
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
  inversions,
  planFor,
} from '../src/lib/curriculum.ts'
import { findSeries, seriesRank } from '../src/lib/taxonomy.ts'

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
      at: [seriesRank(field, series), Number.parseInt(order, 10)],
    }
  })
  .filter((a) => a !== undefined && a.provides.length > 0)
  .sort((a, b) => (a.id < b.id ? -1 : 1))

const [command = 'stats', ...rest] = process.argv.slice(2)

const mark = (step) => (step.article ? '✓' : step.viaEmpirical ? '~' : '·')

const showPlan = (plan) => {
  for (const step of plan.steps) {
    const where = step.article ? `/${step.article.id}` : '— 未執筆'
    const tag = step.viaEmpirical ? '（経験的）' : ''
    console.log(`${mark(step)} ${step.concept.label.padEnd(28)} ${where}${tag}`)
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
  const includeEmpirical = rest.includes('--empirical')
  const [target] = rest.filter((a) => a !== '--empirical')
  if (!target) {
    console.error('目標の id か概念の id を指定してください。一覧は `goals`。')
    process.exit(1)
  }
  const goal = goals.find((g) => g.id === target)
  showPlan(planFor(concepts, articles, goal ? goal.needs : [target], { includeEmpirical }))
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
} else if (command === 'order') {
  const found = inversions(concepts, articles)
  for (const item of found) {
    console.log(
      `${item.article}  が「${item.concept}」を置くのに、` +
        `前提の「${item.missing}」は ${item.home} にある`,
    )
  }
  console.log(`\n前提が後ろにある箇所: ${found.length}`)
} else if (command === 'brief') {
  // 1 本書くのに要る事実を、一度で出す。
  // agent がこれを grep で拾い直していたので、まとめた。
  const [field, slug, order] = rest
  if (!field || !slug) {
    console.error('使い方: brief <field> <series> [order]')
    process.exit(1)
  }
  const entry = findSeries(field, slug)
  if (!entry) {
    console.error(`知らない連載: ${field}/${slug}`)
    process.exit(1)
  }

  console.log(`# ${entry.title}  (${field}/${slug})\n`)
  console.log(`${entry.blurb}\n`)

  const mine = articles.filter((a) => a.id.startsWith(`${field}/${slug}/`))
  console.log('## この連載にある回\n')
  for (const a of mine.sort((x, y) => x.at[1] - y.at[1])) {
    const here = String(a.at[1]) === String(order)
    console.log(`${here ? '→' : ' '} ${String(a.at[1]).padStart(2)}  ${a.title}`)
    console.log(`      ${a.provides.join(', ')}`)
  }
  const n = Number.parseInt(order ?? '', 10)
  if (order && !mine.some((a) => a.at[1] === n)) {
    console.log(`→ ${String(n).padStart(2)}  （これから書く回。まだ無い）`)
  }

  if (order) {
    console.log('\n## 隣の回の分量（目安）\n')
    for (const a of mine) {
      if (Math.abs(a.at[1] - n) > 2 || a.at[1] === n) continue
      const path = walk(ARTICLES).find((p) =>
        readFileSync(p, 'utf8').includes(`series: "${slug}"`) &&
        readScalar(readFileSync(p, 'utf8'), 'order') === String(a.at[1]),
      )
      if (path) {
        const src = readFileSync(path, 'utf8')
        console.log(`  第 ${a.at[1]} 回  ${src.split('\n').length} 行  ${src.length} 字`)
      }
    }
  }

  console.log('\n## この回が名乗る概念の前提\n')
  const target = mine.find((a) => a.at[1] === n)
  const ids = target ? target.provides : []
  if (ids.length === 0) {
    console.log('  （まだ無い回なので、仕様の provides を見ること）')
  } else {
    const byId = new Map(concepts.map((c) => [c.id, c]))
    for (const id of ids) {
      const c = byId.get(id)
      if (!c) {
        console.log(`  ${id}  ← グラフに無い`)
        continue
      }
      console.log(`  ${c.label}  (${id})`)
      for (const req of c.requires) {
        const owner = articles.find((a) => a.provides.includes(req))
        const where = owner ? `/${owner.id}` : '未執筆'
        console.log(`      ← ${byId.get(req)?.label ?? req}  ${where}`)
      }
    }
  }

  console.log('\n## 前提が後ろにある箇所\n')
  const bad = inversions(concepts, articles).filter((i) => i.article.includes(slug))
  if (bad.length === 0) console.log('  無し')
  for (const i of bad) console.log(`  ${i.article}: ${i.concept} ← ${i.missing} は ${i.home}`)
} else if (command === 'dump') {
  console.log(JSON.stringify({ concepts, goals, articles }, null, 2))
} else {
  console.error(`unknown command: ${command}`)
  process.exit(1)
}
