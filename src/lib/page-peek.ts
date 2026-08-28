/**
 * 記事をまたぐリンクに、行き先の中身を添える。
 *
 * `peek.ts` が添えられるのは**同じ記事の中の主張**だけである。
 * `@def:measure` は Typst が `<a href="#loc-5">` として出すので、指す先が特定できる。
 *
 * ところが記事をまたぐリンクは `#link("/math/analysis/2")[解析 第 2 回]` と書く。
 * **指しているのは記事であって、定理ではない。** だから主張は添えられない。
 * 添えられるのは記事のほうの中身——連載名、第何回、題名、要約——になる。
 *
 * これで足りる、と判断した理由は Wikipedia の Page Previews である。
 * 同じ形（リンクに記事の冒頭を添える）を大規模に配って、ページビューが 3.0〜4.7%
 * 落ち、切った人は 0.02〜0.03% だった。**飛ばずに済ませた分**である。
 *
 * 定理単位まで届かせるには、参照側が定理を名指しする必要があり
 * （`#link("/math/analysis/2#def:completeness")`）、記事側の作業が数百リンク分
 * 出る。そこは別の判断になる。
 */

import { peekMark } from './peek.ts'

/** 添えられる記事。 */
export type Page = {
  /** リンクの href とそのまま突き合わせる。 */
  readonly href: string
  /** 「解析 第 2 回」。 */
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

// 取っ手の id は peek.ts の `pk` と別にする。同じページに両方出るので、
// 揃えると触る端末で別の参照が開く。
const wrap = (nth: number, href: string, label: string, inner: string, extra = ''): string =>
  peekMark(`pp${nth}`, href, label, inner, ` peek-page${extra}`)

/**
 * `pages` は記事の一覧、`statements` は「`記事の href` + `#錨`」から主張の中身へ。
 *
 * 錨を付けて書いた（`#link("/math/analysis/2#def-completeness")`）リンクには
 * **主張のほう**が添う。付けなければ記事のほうが添う。書き換えは 1 本ずつでよく、
 * 全部を直すまで待つ必要がない。
 */
export const attachPagePeeks = (
  html: string,
  pages: readonly Page[],
  statements: ReadonlyMap<string, string> = new Map(),
): string => {
  const byHref = new Map(pages.map((page) => [key(page.href), page]))
  if (byHref.size === 0) return html

  const { text, parts } = veil(html)

  let nth = 0

  const linked = text.replace(
    /<a href="([^"]+)">([\s\S]*?)<\/a>/g,
    (whole, href: string, label: string) => {
      const [path, anchor] = href.split('#')
      // ページ内の参照（#loc-5）は peek.ts が済ませている。
      if (path === undefined || path === '') return whole

      const page = byHref.get(key(path))
      if (page === undefined) return whole

      if (anchor !== undefined) {
        const statement = statements.get(`${key(path)}#${anchor}`)
        if (statement === undefined) return whole
        nth += 1
        return wrap(
          nth,
          href,
          label,
          `<span class="peek-p peek-from">${escape(page.where)}</span>${statement}`,
        )
      }

      const summary = page.summary ? `<span class="peek-p">${escape(page.summary)}</span>` : ''
      nth += 1
      return wrap(
        nth,
        href,
        label,
        `<span class="peek-p"><strong>${escape(page.where)}</strong>` +
          `　${escape(page.title)}</span>${summary}`,
      )
    },
  )

  return unveil(linked, parts)
}
