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

test('記事に、見出しが一つはある', () => {
  const headless = typFiles(ARTICLES).filter(
    (path) => firstLine(readFileSync(path, 'utf8')) === undefined,
  )

  strictEqual(headless.join('\n'), '')
})
