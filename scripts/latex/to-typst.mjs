#!/usr/bin/env node
/**
 * lecture-notes の .tex を Typst に変換する（一度きりの移行用）。
 *
 * 前処理でマクロを素の LaTeX に均してから pandoc に渡し、出てきた .typ を
 * typst で試しにコンパイルして、何本が通るかを数える。
 *
 * 変換の質を測るための道具であって、これだけで移行が完了するわけではない。
 * 通らなかったものは手直しが要る。
 */
import { execFile } from 'node:child_process'
import { promisify } from 'node:util'
import { cp, mkdir, readdir, readFile, rm, writeFile } from 'node:fs/promises'
import { basename, dirname, extname, join, relative, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'

import { preprocess, selfDefined } from './preprocess.mjs'
import { repairTypst } from './repair-typst.mjs'

const run = promisify(execFile)

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), '../..')
const SOURCE = process.env.NOTES_SRC ?? resolve(ROOT, '../lecture-notes')
// 中間生成物（前処理済み .tex とコンパイル確認用 PDF）
const OUT = join(ROOT, '.cache/typst-notes')
// 変換結果の置き場。ここが移行後の原本になる。
const DEST = join(ROOT, 'src/content/notes')

const PANDOC = process.env.PANDOC_BIN ?? 'pandoc'
const TYPST = process.env.TYPST_BIN ?? 'typst'

const SKIP = new Set(['preamble.tex', 'template.tex'])


const listTexFiles = async (dir) => {
  const found = []

  const walk = async (current) => {
    for (const entry of await readdir(current, { withFileTypes: true })) {
      if (entry.name === '.git') continue
      const path = join(current, entry.name)
      if (entry.isDirectory()) await walk(path)
      else if (extname(entry.name) === '.tex' && !SKIP.has(entry.name)) found.push(path)
    }
  }

  await walk(dir)
  return found.sort()
}

/** \title{...} を取り出す。無ければファイル名で代用する。 */
const titleOf = (source, fallback) => {
  const match = source.match(/\\title\{((?:[^{}]|\{[^{}]*\})*)\}/)
  if (!match) return fallback
  return match[1]
    .replace(/\\\\/g, ' ')
    .replace(/\$([^$]*)\$/g, '$1')
    .replace(/\\[a-zA-Z]+\s*/g, '')
    .replace(/[{}]/g, '')
    .replace(/\s+/g, ' ')
    .trim() || fallback
}

/** 既存の .typ 経路に載せるための front matter を付ける。 */
const withFrontMatter = (body, { title, group, source }) => `#import "/src/typst/template.typ": post

#show: post.with(
  title: ${JSON.stringify(title)},
  date: ${JSON.stringify(new Date().toISOString().slice(0, 10))},
  tags: (${JSON.stringify(group)},),
  summary: ${JSON.stringify(`${source} から変換`)},
)

${body}`

/**
 * corpus 全体から \newcommand の定義を集める。
 *
 * 同じマクロを別のファイルでは定義しているのに、使う側では定義し忘れている
 * ことがある（\kk や \rr など）。本人の定義を流用して補えば、
 * こちらが意味を推測せずに済む。
 */
const collectDefinitions = async (files) => {
  const table = new Map()

  for (const file of files) {
    const source = await readFile(file, 'utf8')
    for (const match of source.matchAll(
      /\\newcommand\s*(?:\{\\([a-zA-Z@]+)\}|\\([a-zA-Z@]+))\s*(\[[0-9]\])?\s*(\{(?:[^{}]|\{[^{}]*\})*\})/g,
    )) {
      const name = match[1] ?? match[2]
      if (table.has(name)) continue
      table.set(name, { arity: match[3] ?? '', body: match[4] })
    }
  }

  return table
}

/**
 * 前処理側が自前で展開するマクロ。ここに定義を足すと、
 * 展開結果と定義が二重にかかって壊れる（\providecommand{\nabla^{2}} など）。
 */
const HANDLED = new Set([
  'ab', 'qty', 'mqty', 'pmqty', 'vmqty', 'smqty',
  'vb', 'va', 'vu', 'dd', 'dv', 'pdv', 'diff', 'diffp', 'dl', 'difsp',
  'laplacian', 'grad', 'curl', 'div', 'vdot', 'cross',
  'ket', 'bra', 'braket', 'ketbra', 'ev', 'abs', 'norm', 'ce',
])

/** そのファイルが使っていて定義していないマクロを補う \providecommand を作る。 */
const fallbacksFor = (source, table) => {
  const defined = selfDefined(source)
  const lines = []

  for (const [name, { arity, body }] of table) {
    if (defined.has(name) || HANDLED.has(name)) continue
    if (!new RegExp(`\\\\${name}(?![a-zA-Z@])`).test(source)) continue
    lines.push(`\\providecommand{\\${name}}${arity}${body}`)
  }

  return lines.length > 0 ? `\n${lines.join('\n')}\n` : ''
}

/** 各グループで実在する画像ファイル名を集める。 */
const availableAssets = async (group) => {
  const dir = join(SOURCE, group, 'assets')
  const found = await readdir(dir).catch(() => [])
  return new Set(found)
}

/**
 * 画像を public/notes 以下に配置する。
 * 変換後の .typ は /public/notes/<group>/assets/... を参照するので、
 * この複製が無いとコンパイルが通らない。
 */
const copyAssets = async () => {
  const publicDir = join(ROOT, 'public/notes')
  await rm(publicDir, { recursive: true, force: true })

  let copied = 0
  for (const entry of await readdir(SOURCE, { withFileTypes: true })) {
    if (!entry.isDirectory() || entry.name === '.git') continue

    const assets = join(SOURCE, entry.name, 'assets')
    const found = await readdir(assets).catch(() => null)
    if (!found) continue

    const target = join(publicDir, entry.name, 'assets')
    await mkdir(dirname(target), { recursive: true })
    await cp(assets, target, { recursive: true })
    copied += found.length
  }

  return copied
}

const convertOne = async (file, assets, definitions) => {
  const id = relative(SOURCE, file).replace(/\.tex$/, '').replace(/\//g, '--')
  const prepared = join(OUT, `${id}.pre.tex`)
  const target = join(DEST, `${id}.typ`)

  const source = await readFile(file, 'utf8')
  const pre = preprocess(source, { extraDefinitions: fallbacksFor(source, definitions) })
  await writeFile(prepared, pre.text, 'utf8')

  let warnings = 0
  try {
    const { stderr } = await run(
      PANDOC,
      ['--from', 'latex', '--to', 'typst', prepared, '-o', target],
      { maxBuffer: 64 * 1024 * 1024, cwd: dirname(file) },
    )
    warnings = (stderr.match(/\[WARNING\]/g) ?? []).length
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    return { id, stage: 'pandoc', ok: false, error: detail.split('\n')[0] }
  }

  const converted = await readFile(target, 'utf8')
  const group = relative(SOURCE, file).split('/')[0]
  const { text: repaired, missingImages } = repairTypst(converted, {
    group,
    available: assets.get(group),
  })
  await writeFile(
    target,
    withFrontMatter(repaired, {
      title: titleOf(source, basename(file, '.tex')),
      group: group === 'physics_report' ? 'レポート' : 'ノート',
      source: relative(SOURCE, file),
    }),
    'utf8',
  )

  // PDF と HTML の両方で通ることを確認する。HTML export の方が制約が強く、
  // PDF だけ見ていると制御文字などを取りこぼす。
  try {
    await run(TYPST, ['compile', '--root', ROOT, target, join(OUT, `${id}.pdf`)], {
      maxBuffer: 32 * 1024 * 1024,
    })
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    const first = detail.split('\n').find((line) => line.startsWith('error:')) ?? ''
    return { id, stage: 'pdf', ok: false, warnings, missingImages, error: first.slice(0, 90) }
  }

  try {
    await run(
      TYPST,
      ['compile', '--root', ROOT, target, '--format', 'html', '--features', 'html', '-'],
      { maxBuffer: 64 * 1024 * 1024 },
    )
    return { id, ok: true, warnings, missingImages }
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    const first = detail.split('\n').find((line) => line.startsWith('error:')) ?? ''
    return { id, stage: 'html', ok: false, warnings, missingImages, error: first.slice(0, 90) }
  }
}

const mapLimit = async (items, limit, worker) => {
  const results = new Array(items.length)
  let next = 0
  const runners = Array.from({ length: Math.min(limit, items.length) }, async () => {
    while (next < items.length) {
      const index = next
      next += 1
      results[index] = await worker(items[index])
    }
  })
  await Promise.all(runners)
  return results
}

const main = async () => {
  await mkdir(OUT, { recursive: true })
  await mkdir(DEST, { recursive: true })

  const copied = await copyAssets()
  process.stdout.write(`画像            : ${copied} 点を public/notes に配置\n`)

  const files = await listTexFiles(SOURCE)

  const groups = [...new Set(files.map((f) => relative(SOURCE, f).split('/')[0]))]
  const assets = new Map(
    await Promise.all(groups.map(async (g) => [g, await availableAssets(g)])),
  )

  const definitions = await collectDefinitions(files)
  process.stdout.write(`共通マクロ      : ${definitions.size} 個を corpus から収集\n`)

  const results = await mapLimit(files, 6, (file) => convertOne(file, assets, definitions))

  const ok = results.filter((r) => r.ok)
  const failed = results.filter((r) => !r.ok)

  process.stdout.write(`対象 ${results.length} 本\n`)
  process.stdout.write(`typst が通った  : ${ok.length}\n`)
  process.stdout.write(`通らなかった    : ${failed.length}\n`)

  const warnings = results.reduce((sum, r) => sum + (r.warnings ?? 0), 0)
  process.stdout.write(`pandoc の警告   : ${warnings}\n`)
  process.stdout.write(`出力先          : src/content/notes\n`)

  const missing = [...new Set(results.flatMap((r) => r.missingImages ?? []))]
  if (missing.length > 0) {
    process.stdout.write(`実体の無い画像  : ${missing.length} 点（元リポジトリに無い）\n`)
  }

  if (failed.length > 0) {
    process.stdout.write('\n通らなかったもの:\n')
    for (const item of failed.slice(0, 20)) {
      process.stdout.write(`  [${item.stage}] ${item.id}: ${item.error}\n`)
    }
  }

  const reasons = {}
  for (const item of failed) {
    const key = (item.error ?? '').replace(/[0-9]+/g, 'N').slice(0, 60)
    reasons[key] = (reasons[key] ?? 0) + 1
  }
  const grouped = Object.entries(reasons).sort((a, b) => b[1] - a[1])
  if (grouped.length > 0) {
    process.stdout.write('\n原因別:\n')
    for (const [reason, count] of grouped.slice(0, 10)) {
      process.stdout.write(`  ${count}x  ${reason}\n`)
    }
  }
}

await main()
