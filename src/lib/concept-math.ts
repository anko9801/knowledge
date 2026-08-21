/**
 * 概念の文字列を Typst で組んで、id から HTML を引ける表にする。
 *
 * 組み立てと切り分けは `concept-typst.ts`（純関数）。ここは typst の起動と、
 * **1 ビルドで 1 回に束ねること**だけを持つ。
 *
 * Astro は各ページを並べて組むので、素直に書くとページ数だけ typst が立ち上がる。
 * module は ESM の singleton なので、promise をここに置いておけば 1 回で済む。
 */

import { spawn } from 'node:child_process'

import { buildSource, hasMath, splitOutput, type Piece } from './concept-typst.ts'
import { significantStderr } from './typst-cli.ts'

/** 標準入力から .typ を流して、HTML を受け取る。中間ファイルを作らない。 */
const compileStdin = (source: string, bin: string, root: string): Promise<string> =>
  new Promise((resolve, reject) => {
    const child = spawn(
      bin,
      ['compile', '-', '--format', 'html', '--features', 'html', '--root', root, '-'],
      { stdio: ['pipe', 'pipe', 'pipe'] },
    )

    let out = ''
    let err = ''
    child.stdout.on('data', (chunk) => (out += chunk))
    child.stderr.on('data', (chunk) => (err += chunk))
    child.on('error', reject)
    child.on('close', () => {
      const problems = significantStderr(err)
      if (problems) reject(new Error(`概念の組版に失敗しました:\n${problems}`))
      else resolve(out)
    })

    child.stdin.end(source)
  })

let cached: Promise<ReadonlyMap<string, string>> | undefined

/**
 * `$...$` を含む文字列だけを組む。
 *
 * 引くときは `conceptHtml()` を使う。組まなかったものは表に載らないので、
 * 呼び出し側は素の文字列へ落ちる。
 */
export const conceptMath = (pieces: readonly Piece[]): Promise<ReadonlyMap<string, string>> => {
  cached ??= (async () => {
    const targets = pieces.filter((piece) => hasMath(piece.text))
    if (targets.length === 0) return new Map<string, string>()

    const html = await compileStdin(
      buildSource(targets),
      process.env.TYPST_BIN ?? 'typst',
      process.cwd(),
    )

    return splitOutput(html, targets)
  })()

  return cached
}
