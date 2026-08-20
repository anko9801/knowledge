/**
 * 記事の URL と、概念グラフで記事を指す鍵。
 *
 * ページの frontmatter に書くと `getStaticPaths` から見えない。Astro は
 * getStaticPaths をモジュール直下へ巻き上げるので、コンポーネント本体に
 * 置いた関数はそこからスコープ外になる（`key is not defined` で落ちる）。
 */

export type Place = {
  readonly field: string
  readonly series: string
  readonly order: number
}

/** GitHub Pages ではサイトがリポジトリ名の下に載る。末尾スラッシュの揺れをここで吸う。 */
export const siteBase = (baseUrl: string): string => baseUrl.replace(/\/?$/, '/')

export const articleKey = (place: Place): string =>
  `${place.field}/${place.series}/${place.order}`

export const articleHref = (base: string, place: Place): string => `${base}${articleKey(place)}`
