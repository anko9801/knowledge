/**
 * 書き出しが、続きものの段取りから始まっていないか。
 *
 * 隙間を開けるいちばん確実な形は、ありえないことを先に見せることである
 * （`docs/reader.md`「書き出しの型」）。ところが「前回、〜」で始めると、
 * 途中から入った読者は 2/10 の状態に置かれ、隙間が大きすぎて好奇心が立たない。
 *
 * かつて 17 本がこの形だった。直すのは手作業だが、**戻るのは一瞬**なので、
 * ここで止める。前回の話は、異常を出したあとで持ち出せばよい。
 */

import { strictEqual } from 'node:assert/strict'
import { readFileSync, readdirSync, statSync } from 'node:fs'
import { join } from 'node:path'
import { test } from 'node:test'

const ARTICLES = 'src/content/articles'

const typFiles = (dir: string): string[] =>
  readdirSync(dir).flatMap((name) => {
    const path = join(dir, name)
    if (statSync(path).isDirectory()) return typFiles(path)
    return name.endsWith('.typ') ? [path] : []
  })

/** 最初の `= 見出し` の直後の 1 行。 */
const firstLine = (source: string): string | undefined => {
  const heading = /^= .*$/m.exec(source)
  if (heading === null) return undefined
  return source.slice(heading.index + heading[0].length).trim().split('\n')[0]
}

// 「さて」まで拾う。段取りから入る言い回しは、だいたいこの形をしている。
const STAGING = /^\s*(#link\([^)]*\)\[前回\]|前回|前々回|ここまで|これまで|道具は|さて)/

test('記事が、続きものの段取りから始まっていない', () => {
  const staged = typFiles(ARTICLES).filter((path) => {
    const line = firstLine(readFileSync(path, 'utf8'))
    return line !== undefined && STAGING.test(line)
  })

  strictEqual(staged.join('\n'), '', `書き出しが段取りになっている:\n${staged.join('\n')}`)
})

test('Markdown の強調が、.typ に漏れていない', () => {
  // Typst の強調は `*text*` か `#strong[text]`。`**text**` と書くと
  // **空の強調が二つ**に読まれて、囲んだはずの文字が地の文に落ちる。
  // typst は warning を出すが `compile` は成功するので、読まないと気づけない。
  const leaked = typFiles(ARTICLES)
    .concat(typFiles('src/content/notes'))
    .flatMap((path) => {
      const lines = readFileSync(path, 'utf8').split('\n')
      return lines.flatMap((line, i) =>
        /\*\*[^*\n]+\*\*/.test(line) ? [`${path}:${i + 1}  ${line.trim().slice(0, 60)}`] : [],
      )
    })

  strictEqual(leaked.join('\n'), '')
})

test('変換の傷が、講義ノートに残っていない', () => {
  // pandoc 経由の変換で二つ残る。生の LaTeX 命令と、行き先を失った (ref)。
  // どちらも読者にそのまま見えるが、typst は何も言わない。
  //
  // 図の LaTeX は #unconverted(...) の中に畳んであるので、そこは外して数える。
  const scars = typFiles('src/content/notes').flatMap((path) => {
    const source = readFileSync(path, 'utf8').replace(/#unconverted\("(?:[^"\\]|\\.)*"\)/g, '')
    const found = [
      ...[...source.matchAll(/\\\\[a-zA-Z]+/g)].map((m) => m[0]),
      ...[...source.matchAll(/\(ref\)/g)].map((m) => m[0]),
    ]
    return found.length > 0 ? [`${path}: ${[...new Set(found)].slice(0, 5).join(' ')}`] : []
  })

  strictEqual(scars.join('\n'), '')
})

test('講義ノートの題名が、ファイル名のままになっていない', () => {
  // .tex から題名を拾えないと、変換器はファイル名を入れる。
  // 一覧に condenced_matter_physics と並ぶ。
  const untitled = typFiles('src/content/notes').flatMap((path) => {
    const title = /title: "([^"]*)"/.exec(readFileSync(path, 'utf8'))?.[1] ?? ''
    return /[぀-ヿ一-鿿]/.test(title) ? [] : [`${path}: ${title}`]
  })

  strictEqual(untitled.join('\n'), '')
})

test('記事に、見出しが一つはある', () => {
  const headless = typFiles(ARTICLES).filter(
    (path) => firstLine(readFileSync(path, 'utf8')) === undefined,
  )

  strictEqual(headless.join('\n'), '')
})
