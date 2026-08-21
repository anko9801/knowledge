/**
 * 本文に書いたサイト内リンクの行き先が、実在するか。
 *
 * `#link("/cs/crypto/1")[公開鍵暗号]` のように、**まだ書いていない回**へ張ってしまう
 * ことがある。連載の予定は `taxonomy.ts` にあるので書ける気がするし、typst も
 * Astro も何も言わない。押した読者が 404 に落ちて初めて分かる。
 *
 * 前提リンク（概念グラフ由来）のほうは、記事が無ければ「未執筆」と出して
 * リンクにしない仕掛けがある。**本文に手で書いたリンクだけ**が素通りしていた。
 *
 * ここは判定だけの純関数。file を読むのはテスト側。
 */

/** 記事 1 本ぶんの座標。`taxonomy.ts` ではなく実在するファイルから作る。 */
export type Known = {
  /** `cs/complexity/1` の形。 */
  readonly articles: ReadonlySet<string>
  /** 分野の slug。 */
  readonly fields: ReadonlySet<string>
  /** 概念 id。 */
  readonly concepts: ReadonlySet<string>
}

export type Broken = { readonly source: string; readonly href: string }

/** `#link("/...")` の行き先だけを拾う。外部 URL と錨は見ない。 */
export const internalHrefs = (typ: string): readonly string[] =>
  [...typ.matchAll(/#link\("(\/[^"]*)"/g)].map((m) => (m[1] as string).split('#')[0] as string)

/**
 * 行き先が実在するか。
 *
 * 判定できない形（`/notes/...` など）は通す。分かるものだけを止めるほうが、
 * 検査そのものが邪魔になりにくい。
 */
export const isKnown = (href: string, known: Known): boolean => {
  const path = href.replace(/^\/+|\/+$/g, '')
  if (path === '') return true

  const parts = path.split('/')

  if (parts[0] === 'concepts') return parts.length === 1 || known.concepts.has(parts[1] as string)
  if (parts[0] === 'notes') return true

  // 分野の目次。
  if (parts.length === 1) return known.fields.has(parts[0] as string)

  // 記事。`/field/series/order`
  if (parts.length === 3) return known.articles.has(path)

  return true
}

/**
 * 「前回」「次回」と書いたリンクが、同じ連載の隣を指しているか。
 *
 * 別の連載へのリンクに「前回」と書いてしまうことがある。書いている側は
 * 直前に読み返した回のつもりでも、読者にとっては**まったく違う連載**である
 * （実測 1 件。分子の対称性 第 1 回から、群と表現 第 2 回へ「前回」と張っていた）。
 *
 * 「前回、〜」で始めない、という規則とは別の話。あちらは書き出しの位置の話で、
 * こちらは指し先が合っているかの話。
 */
export type Neighbour = {
  readonly path: string
  /** `cs/programs/1` の形。 */
  readonly key: string
  readonly text: string
}

const WORDS: readonly (readonly [string, number])[] = [
  ['前々回', -2],
  ['前回', -1],
  ['次回', 1],
]

export const misplacedNeighbours = (sources: readonly Neighbour[]): readonly Broken[] =>
  sources.flatMap((source) => {
    const [field, series, order] = source.key.split('/')
    const self = Number.parseInt(order as string, 10)

    return [...source.text.matchAll(/#link\("(\/[^"#]+)[^"]*"\)\[(前々回|前回|次回)\]/g)].flatMap(
      (m) => {
        const href = m[1] as string
        const word = m[2] as string
        const step = WORDS.find(([w]) => w === word)?.[1] as number
        const parts = href.replace(/^\/+|\/+$/g, '').split('/')

        if (parts.length !== 3) return [{ source: source.path, href }]
        if (parts[0] !== field || parts[1] !== series) return [{ source: source.path, href }]
        if (Number.parseInt(parts[2] as string, 10) !== self + step) {
          return [{ source: source.path, href }]
        }
        return []
      },
    )
  })

export const brokenLinks = (
  sources: readonly { readonly path: string; readonly text: string }[],
  known: Known,
): readonly Broken[] =>
  sources.flatMap((source) =>
    internalHrefs(source.text)
      .filter((href) => !isKnown(href, known))
      .map((href) => ({ source: source.path, href })),
  )
