/**
 * サイドバーに渡す道案内を集める。
 *
 * ここは Content Collection から素材を取ってくるだけ。
 * 「今この人に何を見せるか」の判断は nav-scope.ts が持つ（純関数なのでテストできる）。
 */

import { noteLabels } from './note-label.ts'
import { getCollection } from 'astro:content'

import { fields, seriesOf, startSeries } from './taxonomy.ts'
import { scopeNav, type NavBlock, type NavData, type NavEntry, type NavGroup } from './nav-scope.ts'

export { contains, isCurrent } from './nav-scope.ts'
export type { NavBlock, NavEntry, NavSection } from './nav-scope.ts'

/** サイトが載るパス。末尾スラッシュの有無が環境で揺れるので揃える。 */
export const base = import.meta.env.BASE_URL.replace(/\/?$/, '/')

export const withBase = (path: string): string => `${base}${path.replace(/^\//, '')}`

const gatherData = async (): Promise<NavData> => {
  const articles = await getCollection('articles', ({ data }) => !data.draft)
  const posts = await getCollection('posts', ({ data }) => !data.draft)
  const notes = await getCollection('notes')

  const series = fields.flatMap((field) =>
    seriesOf(field.slug).map((entry) => ({
      slug: entry.slug,
      field: field.slug,
      title: entry.title,
      prefix: withBase(`${field.slug}/${entry.slug}`),
      entries: articles
        .filter((article) => article.data.field === field.slug && article.data.series === entry.slug)
        .sort((a, b) => a.data.order - b.data.order)
        .map((article) => ({
          href: withBase(`${field.slug}/${entry.slug}/${article.data.order}`),
          label: article.data.title,
          order: article.data.order,
        })),
    })),
  )

  const counted = fields.map((field) => {
    const count = articles.filter((article) => article.data.field === field.slug).length

    return {
      slug: field.slug,
      title: field.title,
      href: withBase(field.slug),
      note: count > 0 ? `${count} 本` : '準備中',
    }
  })

  // 連載の入口。まだ何も読んでいない人には、この 1 本だけを示す。
  const start = series.find((entry) => {
    const declared = startSeries()

    return declared !== undefined && entry.field === declared.field && entry.slug === declared.slug
  })

  return {
    home: base,
    fields: counted,
    series,
    posts: [...posts]
      .sort((a, b) => b.data.date.getTime() - a.data.date.getTime())
      .map((post) => ({ href: withBase(`posts/${post.id}`), label: post.data.title })),
    notes: groupNotes(notes),
    notesHref: withBase('notes'),
    notesNote: `${notes.length} 本`,
    conceptsHref: withBase('concepts'),
    // 記事のある概念だけが索引に並ぶ（src/lib/concept-page.ts）。
    conceptsNote: `${new Set(articles.flatMap((a) => a.data.provides)).size} 語`,
    start:
      start && start.entries.length > 0
        ? { href: start.entries[0].href, label: `${start.title} 第 1 回`, note: '入口' }
        : undefined,
  }
}

type NoteEntry = Awaited<ReturnType<typeof getCollection<'notes'>>>[number]

/** タグの 1 つ目が「ノート」か「レポート」。to-typst.mjs が付ける。 */
const groupNotes = (notes: readonly NoteEntry[]): readonly NavGroup[] => {
  // 同じ題名のノートが複数ある（統計力学が 3 本など）。見分けが付かないと選べないので、
  // 重複するものにだけ手掛かりを添える。判断は note-label.ts（純関数、テストあり）。
  const labels = noteLabels(
    notes.map((note) => ({
      id: note.id,
      title: note.data.title,
      group: note.data.tags[0] ?? 'ノート',
    })),
  )

  const groups = new Map<string, NavEntry[]>()
  for (const note of [...notes].sort((a, b) => a.data.title.localeCompare(b.data.title, 'ja'))) {
    const group = note.data.tags[0] ?? 'ノート'
    const entries = groups.get(group) ?? []

    groups.set(group, [
      ...entries,
      { href: withBase(`notes/${note.id}`), label: labels.get(note.id) ?? note.data.title },
    ])
  }

  return [...groups.entries()].map(([title, entries]) => ({ title, entries }))
}

/** そのページに出す道案内。今どこにいるかで見せる範囲が変わる。 */
export const buildNav = async (pathname: string): Promise<readonly NavBlock[]> =>
  scopeNav(await gatherData(), pathname)
