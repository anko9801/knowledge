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

export const closesOnFarewell = (source: string): boolean =>
  FAREWELL.test(source.split('\n').slice(-12).join('\n'))

/** 「応用：」「補足：」。ラベルであって主張が無い。 */
export const labelHeadings = (source: string): string[] =>
  headings(source).filter((h) => /^(応用|補足|例|準備|導入|注意|余談)[:：]/.test(h))

/**
 * 書き直し待ち。**増やさないこと。減らすだけ。**
 *
 * 終わりを書き直すのは一本ずつ考える作業なので、先に検査だけ置いてある。
 * ここに載っている間は落ちないが、**新しく増えたものは落ちる。**
 *
 * 直したのに一覧へ残しておくこともできない。下に「一覧が古くなっていない」を
 * 見るテストがあるので、直したら消さないと落ちる。
 */
const KNOWN_SUMMARY = [
  'src/content/articles/chemistry/symmetry/01-point-group.typ',
  'src/content/articles/cs/complexity/01-turing.typ',
  'src/content/articles/cs/complexity/02-reduction.typ',
  'src/content/articles/cs/programs/02-numbers.typ',
  'src/content/articles/math/algebra/01-algebra.typ',
  'src/content/articles/math/analysis/01-calculus.typ',
  'src/content/articles/math/analysis/03-smoothness.typ',
  'src/content/articles/math/differential-forms/02-pullback.typ',
  'src/content/articles/math/groups/01-lie-group.typ',
  'src/content/articles/math/groups/02-representation.typ',
  'src/content/articles/math/groups/03-bundle.typ',
  'src/content/articles/math/measure/02-integral.typ',
  'src/content/articles/math/measure/03-probability.typ',
  'src/content/articles/math/riemannian-geometry/04-geodesic.typ',
  'src/content/articles/math/riemannian-geometry/06-ricci.typ',
  'src/content/articles/math/riemannian-geometry/08-comparison.typ',
  'src/content/articles/math/topology/01-topology.typ',
  'src/content/articles/physics/mechanics/05-reach.typ',
  'src/content/articles/physics/quantum/01-hilbert-space.typ',
  'src/content/articles/physics/quantum/02-observable.typ',
]

const KNOWN_LABEL = [
  'src/content/articles/math/riemannian-geometry/06-ricci.typ',
  'src/content/articles/physics/mechanics/03-symmetry.typ',
]

test('新しく「まとめ」で閉じた記事が増えていない', () => {
  const bad = typFiles(ARTICLES).filter((path) => closesOnSummary(readFileSync(path, 'utf8')))
  const added = bad.filter((path) => !KNOWN_SUMMARY.includes(path))
  strictEqual(
    added.join('\n'),
    '',
    `見出しを言い直した表で閉じている:\n${added.join('\n')}\n` +
      '終わりは、自分の主張が効かない場所を置く場所である（docs/writing.md）',
  )
})

test('連載を閉じる挨拶で終わっていない', () => {
  const bad = typFiles(ARTICLES).filter((path) => closesOnFarewell(readFileSync(path, 'utf8')))
  strictEqual(bad.join('\n'), '', `サイトの都合で閉じている:\n${bad.join('\n')}`)
})

test('新しいラベル見出しが増えていない', () => {
  const bad = typFiles(ARTICLES).filter((path) => labelHeadings(readFileSync(path, 'utf8')).length > 0)
  const added = bad.filter((path) => !KNOWN_LABEL.includes(path))
  strictEqual(added.join('\n'), '', `ラベルであって主張が無い:\n${added.join('\n')}`)
})

test('直した記事が、一覧に残っていない', () => {
  // 一覧が減らないまま残ると、そのうち誰も見なくなる。
  const summary = new Set(typFiles(ARTICLES).filter((p) => closesOnSummary(readFileSync(p, 'utf8'))))
  const label = new Set(
    typFiles(ARTICLES).filter((p) => labelHeadings(readFileSync(p, 'utf8')).length > 0),
  )
  const stale = [
    ...KNOWN_SUMMARY.filter((p) => !summary.has(p)),
    ...KNOWN_LABEL.filter((p) => !label.has(p)),
  ]
  strictEqual(stale.join('\n'), '', `直っているので一覧から消すこと:\n${stale.join('\n')}`)
})
