/**
 * 概念の名前に書いた `^` と `_` を、上付き・下付きに起こす。
 *
 * 概念の `label` と `gist` は HTML に出るので LaTeX を書けない。数式を組む経路は
 * Typst 側にしかなく、ここを通らない。そこで添字と冪は `_` と `^` で書く約束にしてある
 * （`L^p 空間`、`Λ^(n-k)`）。
 *
 * 約束のままだと `L^p 空間` と表示される。連載の一覧や題名の下のように、
 * **名前だけが並ぶ場所**では、これが目に付く。表示のときだけ起こす。
 *
 * 括弧つき（`Λ^(n-k)`）は中身をそのまま、括弧なしは英数字がひと続き分だけ拾う。
 * 前の文字が英数字でないときは触らない（`f(x) = x^2` のような式は元から書かない
 * 約束だが、`^` が単独で出てきたときに壊さないため）。
 */

export type Part = { readonly kind: 'text' | 'sup' | 'sub'; readonly text: string }

/**
 * 直前が「肩に乗せられるもの」であること。
 *
 * 実際に出てくるのは英数字とギリシャ文字のほか、`)`（`(f g)^k`）、
 * `*`（`H^*_dR` のように上付きのあとへ下付きが続く）、そして `∂ ∇ ∫ ≤` である。
 * 数えるより、**和文と空白でないこと**を条件にするほうが漏れない。
 */
// 否定先読みだと行頭でも通ってしまう（前に何も無ければ条件を満たす）。
// 「その位置に、和文でも空白でもない文字が 1 つある」を要求する。
const AFTER = '(?<=[^\\s\\u3000-\\u303F\\u3040-\\u30FF\\u4E00-\\u9FFF\\uFF00-\\uFFEF])'

/** 肩に乗るもの。`Λ^(n-k)` のように括ってあれば中身をそのまま取る。 */
const BODY = '(?:\\(([^)]*)\\)|([0-9A-Za-zΑ-Ωα-ω*†∞∂+\\-]+))'

const MARK = new RegExp(`${AFTER}([\\^_])${BODY}`, 'g')

/**
 * 表示用の断片に割る。HTML を組み立てないのは、Astro 側で要素として置きたいから。
 * 文字列連結で `<sup>` を作ると、エスケープの責任がこちらへ移ってしまう。
 */
export const supSub = (label: string): readonly Part[] => {
  const parts: Part[] = []
  let last = 0

  for (const m of label.matchAll(MARK)) {
    const at = m.index
    if (at > last) parts.push({ kind: 'text', text: label.slice(last, at) })
    parts.push({
      kind: m[1] === '^' ? 'sup' : 'sub',
      text: (m[2] ?? m[3]) as string,
    })
    last = at + m[0].length
  }

  if (last < label.length) parts.push({ kind: 'text', text: label.slice(last) })
  return parts.length > 0 ? parts : [{ kind: 'text', text: label }]
}

/** 読み上げと `title` 属性用に、記号を落とした素の文字列へ戻す。 */
export const plain = (label: string): string =>
  supSub(label)
    .map((part) => part.text)
    .join('')
