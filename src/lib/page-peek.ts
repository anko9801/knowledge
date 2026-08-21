/**
 * 記事をまたぐリンクに、行き先の中身を添える。
 *
 * `peek.ts` が添えられるのは**同じ記事の中の主張**だけである。
 * `@def:measure` は Typst が `<a href="#loc-5">` として出すので、指す先が特定できる。
 *
 * ところが記事をまたぐリンクは `#link("/math/foundations/4")[土台 第 4 回]` と書く。
 * **指しているのは記事であって、定理ではない。** だから主張は添えられない。
 * 添えられるのは記事のほうの中身——連載名、第何回、題名、要約——になる。
 *
 * これで足りる、と判断した理由は Wikipedia の Page Previews である。
 * 同じ形（リンクに記事の冒頭を添える）を大規模に配って、ページビューが 3.0〜4.7%
 * 落ち、切った人は 0.02〜0.03% だった。**飛ばずに済ませた分**である。
 *
 * 定理単位まで届かせるには、参照側が定理を名指しする必要があり
 * （`#link("/math/foundations/4#def:completeness")`）、記事側の作業が数百リンク分
 * 出る。そこは別の判断になる。
 */

/** 添えられる記事。 */
export type Page = {
  /** リンクの href とそのまま突き合わせる。 */
  readonly href: string
  /** 「土台 第 4 回」。 */
  readonly where: string
  readonly title: string
  readonly summary?: string
}

const escape = (text: string): string =>
  text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')

/** 末尾スラッシュと拡張子の揺れを吸う。本文の #link とページの URL で食い違う。 */
const key = (href: string): string => href.replace(/\.html$/, '').replace(/\/+$/, '')

/**
 * 主張を添えた塊（`peek.ts` の結果）を、いったん伏せる。
 *
 * 伏せずに書き換えると、添えた中身の中のリンクにさらに中身が添い、
 * `.peek` が入れ子になる。開いたパネルの中にパネルが出ることになる。
 */
// 本文には出てこない制御文字を目印にする。エスケープで書く（見えない文字を置かない）。
const HIDDEN = '\u0001'

const veil = (html: string): { text: string; parts: string[] } => {
  const parts: string[] = []
  const text = html.replace(/<span class="peek-body"[\s\S]*?<\/span><\/span>/g, (whole) => {
    parts.push(whole)
    return HIDDEN
  })
  return { text, parts }
}

const unveil = (text: string, parts: readonly string[]): string => {
  let index = 0
  return text.replace(new RegExp(HIDDEN, 'g'), () => parts[index++] as string)
}

export const attachPagePeeks = (html: string, pages: readonly Page[]): string => {
  const byHref = new Map(pages.map((page) => [key(page.href), page]))
  if (byHref.size === 0) return html

  const { text, parts } = veil(html)

  const linked = text.replace(
    /<a href="([^"#]+)">([\s\S]*?)<\/a>/g,
    (whole, href: string, label: string) => {
      const page = byHref.get(key(href))
      if (page === undefined) return whole

      const summary = page.summary
        ? `<span class="peek-p">${escape(page.summary)}</span>`
        : ''

      return (
        `<span class="peek"><a href="${href}" class="peek-link">${label}</a>` +
        `<span class="peek-body peek-page" aria-hidden="true">` +
        `<span class="peek-p"><strong>${escape(page.where)}</strong>` +
        `　${escape(page.title)}</span>${summary}</span></span>`
      )
    },
  )

  return unveil(linked, parts)
}
