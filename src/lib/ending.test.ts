/**
 * 終わりが、見出しの言い直しや連載の挨拶で閉じていないか。
 *
 * 書き出しは `opening.test.ts` が止めている。こちらは終わりのほう。
 *
 * 終わりは、**自分の主張が効かない場所**を置く場所である（`docs/writing.md`
 * 「まとめで終わらない」）。読者はそこで対照を手に入れて、主張の輪郭が見える。
 * 見出しを言い直した表は、その場所を潰している。
 *
 * **「次回は〜」は止めない。** 禁じているのはまとめの表であって前振りではない。
 * 行き先が正しいかは `internal-links.test.ts` が別に見ている。
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

/** `= 見出し` を順に。 */
export const headings = (source: string): string[] =>
  [...source.matchAll(/^= (.+)$/gm)].map((m) => (m[1] as string).trim())

/** 最後の見出しが、本文の言い直しを置く枠になっていないか。 */
export const closesOnSummary = (source: string): boolean =>
  /^(まとめ|ここまでのまとめ|要約|結論)$/.test(headings(source).at(-1) ?? '')

/** サイトの都合で閉じていないか。記事の結びではない。 */
const FAREWELL = /この連載(は|を)(ここで|これで)|連載を閉じ|連載はここまで|以上で(この)?連載/

/**
 * 末尾の 12 行と、**見出しの全部**を見る。
 *
 * 最初は末尾の行だけを見ていて、`= 連載を閉じる` という見出しを取り逃がした。
 * 見出しの下に連載全体を並べ直した表があり、そのあとまだ本文が続いていたので、
 * 末尾 12 行には入っていなかった。**いちばん露骨な形が、いちばん漏れていた。**
 */
export const closesOnFarewell = (source: string): boolean =>
  FAREWELL.test(source.split('\n').slice(-12).join('\n')) ||
  headings(source).some((h) => FAREWELL.test(h))

/** 「応用：」「補足：」。ラベルであって主張が無い。 */
export const labelHeadings = (source: string): string[] =>
  headings(source).filter((h) => /^(応用|補足|例|準備|導入|注意|余談)[:：]/.test(h))

test('見出しを言い直した表で閉じていない', () => {
  const bad = typFiles(ARTICLES).filter((path) => closesOnSummary(readFileSync(path, 'utf8')))
  strictEqual(
    bad.join('\n'),
    '',
    `まとめで閉じている:\n${bad.join('\n')}\n` +
      '終わりは、自分の主張が効かない場所を置く場所である（docs/writing.md）',
  )
})

test('連載を閉じる挨拶で終わっていない', () => {
  const bad = typFiles(ARTICLES).filter((path) => closesOnFarewell(readFileSync(path, 'utf8')))
  strictEqual(bad.join('\n'), '', `サイトの都合で閉じている:\n${bad.join('\n')}`)
})

test('ラベルだけの見出しを使っていない', () => {
  const bad = typFiles(ARTICLES).flatMap((path) =>
    labelHeadings(readFileSync(path, 'utf8')).map((h) => `${path}  = ${h}`),
  )
  strictEqual(bad.join('\n'), '', `ラベルであって主張が無い:\n${bad.join('\n')}`)
})
