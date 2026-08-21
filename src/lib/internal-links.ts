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

export const brokenLinks = (
  sources: readonly { readonly path: string; readonly text: string }[],
  known: Known,
): readonly Broken[] =>
  sources.flatMap((source) =>
    internalHrefs(source.text)
      .filter((href) => !isKnown(href, known))
      .map((href) => ({ source: source.path, href })),
  )
