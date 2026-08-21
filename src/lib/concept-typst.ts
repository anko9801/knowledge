/**
 * 概念の名前と説明を、Typst で組む。
 *
 * `src/data/concepts.ts` は TypeScript なので、これまで Typst の外にあった。
 * だから数式が書けず、`H^*_dR` のような書き方を決めて、表示のときに正規表現で
 * 肩へ乗せていた。engine が二つある状態で、`H^*` は組めても分数は組めない。
 *
 * **Typst に通せば済む。** 概念の文字列を 1 枚の文書へ並べて 1 度だけ compile し、
 * 出てきた MathML を id で引き戻す。記事と同じ font、同じ組版になる。
 *
 * ここは組み立てと切り分けだけの純関数。typst の起動は `concept-math.ts`。
 */

/** 組む対象。`$...$` を含むものだけ通せばよい。 */
export type Piece = { readonly key: string; readonly text: string }

/** 数式が入っているか。入っていなければ Typst を通す必要がない。 */
export const hasMath = (text: string): boolean => text.includes('$')

/**
 * Typst の綴りを Unicode へ均した、素の文字列。
 *
 * **表示には使わない。** 使うのは HTML を置けない場所——名前順に並べるときの鍵、
 * `title`、読み上げ用の `aria-label`——だけである。表示は MathML のほうを出す。
 *
 * 揃えるのは実際に書いてあるものだけにする。網羅しようとすると Typst の記号表を
 * 写すことになり、しかも本体と食い違ったときに気づけない。
 */
// 綴りは長いものから当てる（`arrow.r.bar` を `arrow` より先に）。
// `\b` は使えない。`_` が単語文字なので `partial_t` の `partial` に当たらなくなる。
const SPELLED: readonly (readonly [string, string])[] = [
  ['arrow.r.bar', '↦'],
  ['tilde.equiv', '≅'],
  ['dots.c', '⋯'],
  ['infinity', '∞'],
  ['integral', '∫'],
  ['epsilon', 'ε'],
  ['partial', '∂'],
  ['without', '∖'],
  ['dagger', '†'],
  ['Lambda', 'Λ'],
  ['alpha', 'α'],
  ['delta', 'δ'],
  ['nabla', '∇'],
  ['Omega', 'Ω'],
  ['omega', 'ω'],
  ['arrow', '→'],
  ['iota', 'ι'],
  ['chi', 'χ'],
  ['sum', 'Σ'],
  ['and', '∧'],
  ['dif', 'd'],
  ['mu', 'μ'],
  ['nu', 'ν'],
  ['RR', 'ℝ'],
]

const spell = (text: string): string =>
  SPELLED.reduce(
    (held, [from, to]) =>
      held.replace(new RegExp(`(?<![A-Za-z.])${from}(?![A-Za-z])`, 'g'), to),
    text,
  )

export const plainMath = (text: string): string => {
  if (!hasMath(text)) return text

  return spell(
    text
      .replace(/upright\("([^"]*)"\)/g, '$1')
      .replace(/abs\(([^)]*)\)/g, '|$1|'),
  )
    .replace(/<=/g, '≤')
    .replace(/\$/g, '')
    .replace(/"/g, '')
    .replace(/\^\(([^)]*)\)/g, '^$1')
    .replace(/_\(([^)]*)\)/g, '_$1')
    .replace(/\s+/g, ' ')
    .trim()
}

/**
 * Typst の content block は括弧の対応で閉じるので、`[` `]` が釣り合っていないと
 * そこで切れて、以降の概念が全部ひとつの塊になる。**壊れ方が静かなので**、
 * 組む前に弾く。
 */
export const unbalanced = (text: string): boolean => {
  let depth = 0
  for (const ch of text) {
    if (ch === '[') depth += 1
    else if (ch === ']') depth -= 1
    if (depth < 0) return true
  }
  return depth !== 0
}

/** 1 枚の .typ にまとめる。id を振った div で包んで、あとで切り出せるようにする。 */
export const buildSource = (pieces: readonly Piece[]): string => {
  const bad = pieces.filter((piece) => unbalanced(piece.text))
  if (bad.length > 0) {
    throw new Error(
      `概念の文字列で [ ] が釣り合っていません:\n${bad.map((p) => `  ${p.key}: ${p.text}`).join('\n')}`,
    )
  }

  const body = pieces
    .map((piece, i) => `#html.elem("div", attrs: (id: "cm-${i}"))[${piece.text}]`)
    .join('\n')

  // template.typ は front matter を要求するので通さない。要るのは lang と font だけ。
  return `#set text(lang: "ja")\n${body}\n`
}

/**
 * compile した HTML から、id ごとの中身を引き戻す。
 *
 * 入れ子の div は入らない（数式と地の文しか置いていない）ので、
 * 対応する閉じタグまでを素直に取ればよい。
 */
export const splitOutput = (html: string, pieces: readonly Piece[]): ReadonlyMap<string, string> => {
  const found = new Map<string, string>()

  pieces.forEach((piece, i) => {
    const open = `<div id="cm-${i}">`
    const start = html.indexOf(open)
    if (start < 0) return
    const from = start + open.length
    const end = html.indexOf('</div>', from)
    if (end < 0) return
    found.set(piece.key, html.slice(from, end))
  })

  return found
}
