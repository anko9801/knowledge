/**
 * サイドバーに出す道案内を組み立てる。
 *
 * 分野・シリーズ・記事の関係は taxonomy.ts と front matter が持っているので、
 * ここはそれを「見出しとリンクの木」に均すだけ。Sidebar.astro は木を描くだけにする。
 */

import { getCollection } from 'astro:content'

import { fields, seriesOf } from './taxonomy.ts'

export type NavLink = {
  readonly href: string
  readonly label: string
  /** 連載の第何回か。番号列として揃えて出す。 */
  readonly order?: number
}

export type NavGroup = {
  readonly title: string
  /**
   * シリーズ自体のページは無い（一覧は分野ページが持つ）ので、これはリンク先ではなく
   * 「今いるページがこの群の下か」を判定するための接頭辞。
   */
  readonly prefix?: string
  readonly links: readonly NavLink[]
}

export type NavSection = {
  readonly title: string
  readonly href?: string
  readonly groups: readonly NavGroup[]
  /**
   * 既定で畳んでおく。講義ノートは 44 本あって、開いたままだと
   * 他の節が画面から押し出される。
   */
  readonly collapsed?: boolean
}

/** サイトが載るパス。末尾スラッシュの有無が環境で揺れるので揃える。 */
export const base = import.meta.env.BASE_URL.replace(/\/?$/, '/')

export const withBase = (path: string): string => `${base}${path.replace(/^\//, '')}`

/**
 * 今いるページかどうか。
 *
 * build.format が 'file' なので出力は `math/set-theory/1.html` だが、
 * 参照する側は拡張子なしで書く。末尾スラッシュも環境で揺れるため、両方落として比べる。
 */
const normalize = (path: string): string => path.replace(/\.html$/, '').replace(/\/+$/, '')

export const isCurrent = (pathname: string, href: string): boolean =>
  normalize(pathname) === normalize(href)

/** その節の下に今いるページがあるか。畳んである節を開いておくのに使う。 */
export const contains = (pathname: string, href: string): boolean => {
  const here = normalize(pathname)
  const root = normalize(href)

  return here === root || here.startsWith(`${root}/`)
}

/**
 * サイト全体の木を作る。全ページのサイドバーが同じものを出す。
 *
 * 記事が 0 本のシリーズも枠だけ残す。何を書く気なのかが見えるほうがいい。
 */
export const buildNav = async (): Promise<readonly NavSection[]> => {
  const articles = await getCollection('articles', ({ data }) => !data.draft)
  const posts = await getCollection('posts', ({ data }) => !data.draft)
  const notes = await getCollection('notes')

  const fieldSections: readonly NavSection[] = fields.map((field) => ({
    title: field.title,
    href: withBase(field.slug),
    groups: seriesOf(field.slug).map((series) => ({
      title: series.title,
      prefix: withBase(`${field.slug}/${series.slug}`),
      links: articles
        .filter((entry) => entry.data.field === field.slug && entry.data.series === series.slug)
        .sort((a, b) => a.data.order - b.data.order)
        .map((entry) => ({
          href: withBase(`${field.slug}/${series.slug}/${entry.data.order}`),
          label: entry.data.title,
          order: entry.data.order,
        })),
    })),
  }))

  const postSection: NavSection = {
    title: 'サイトについて',
    groups: [
      {
        title: '',
        links: [...posts]
          .sort((a, b) => b.data.date.getTime() - a.data.date.getTime())
          .map((post) => ({ href: withBase(`posts/${post.id}`), label: post.data.title })),
      },
    ],
  }

  // 同じ題名のノートが複数ある（統計力学が 3 本など）。見分けが付かないと選べないので、
  // 重複するものだけ元ファイル名を添える。/notes の一覧と同じ扱い。
  const titles = new Map<string, number>()
  for (const note of notes) {
    titles.set(note.data.title, (titles.get(note.data.title) ?? 0) + 1)
  }

  // タグの 1 つ目が「ノート」か「レポート」。to-typst.mjs が付ける。
  const groups = new Map<string, NavLink[]>()
  for (const note of [...notes].sort((a, b) => a.data.title.localeCompare(b.data.title, 'ja'))) {
    const group = note.data.tags[0] ?? 'ノート'
    const links = groups.get(group) ?? []
    const label =
      (titles.get(note.data.title) ?? 0) > 1
        ? `${note.data.title}（${note.id}）`
        : note.data.title

    groups.set(group, [...links, { href: withBase(`notes/${note.id}`), label }])
  }

  const noteSection: NavSection = {
    title: `講義ノート (${notes.length})`,
    href: withBase('notes'),
    collapsed: true,
    groups: [...groups.entries()].map(([title, links]) => ({ title, links })),
  }

  return [...fieldSections, postSection, noteSection]
}
