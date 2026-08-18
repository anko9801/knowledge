/**
 * サイドバーに「今この人に要るぶんだけ」を出すための絞り込み。
 *
 * 全分野・全連載・講義ノート 44 本を常に開いておくと、目に入る項目が 80 を超える。
 * 読み手は自分がどこにいるのか分からなくなり、まだ読んでいない量に圧倒される。
 * そこで段階的開示（progressive disclosure）に倣い、
 *
 *   1. 今いる連載だけを開く
 *   2. 同じ分野のほかの連載は 1 行に畳む
 *   3. ほかの分野と講義ノートは 1 行のリンクにする
 *
 * とする。畳んだものは 1 クリックで開けるので、選択肢は減っていない
 * （選べる道を実際に取り上げると、自分で進み方を決めたい読み手の意欲を削ぐ）。
 *
 * 進捗の表示は「今いる連載」だけに出す。まだ手を付けていない連載に 0 %
 * のバーを並べると、未読の一覧が借金の一覧に見えて逆効果になる。
 *
 * ここは astro:content に触らない純関数だけを置く（テストできるように）。
 */

export type NavEntry = {
  readonly href: string
  readonly label: string
  /** 連載の第何回か。番号列として揃えて出す。 */
  readonly order?: number
  /** 行の右に小さく添える補足。「12 回」「44 本」など。 */
  readonly note?: string
}

export type NavSeries = {
  readonly slug: string
  readonly field: string
  readonly title: string
  /** 今この連載を読んでいるかの判定に使う接頭辞。 */
  readonly prefix: string
  readonly entries: readonly NavEntry[]
}

export type NavField = {
  readonly slug: string
  readonly title: string
  readonly href: string
  readonly note?: string
}

export type NavGroup = {
  readonly title: string
  readonly entries: readonly NavEntry[]
}

export type NavData = {
  readonly home: string
  readonly fields: readonly NavField[]
  readonly series: readonly NavSeries[]
  readonly posts: readonly NavEntry[]
  readonly notes: readonly NavGroup[]
  readonly notesHref: string
  readonly notesNote: string
  /** 何も読んでいない人に見せる入口。連載の第 1 回。 */
  readonly start?: NavEntry
}

export type NavSection = {
  readonly key: string
  /** current: 開いて出す / collapsed: 畳む / links: 1 行のリンクを並べる */
  readonly kind: 'current' | 'collapsed' | 'links'
  readonly title?: string
  /** 見出しの上に添える所属。「数学」など。 */
  readonly caption?: string
  readonly captionHref?: string
  readonly note?: string
  readonly entries: readonly NavEntry[]
  /** 今どこにいるか。第 3 回なら 3。 */
  readonly position?: number
  readonly total?: number
  /** 畳んだ節を最初から開けておく。畳めることに気づいてもらうため 1 つだけ。 */
  readonly open?: boolean
}

export type NavBlock = {
  readonly heading?: string
  readonly sections: readonly NavSection[]
}

/**
 * 今いるページかどうか。
 *
 * build.format が 'file' なので出力は `math/set-theory/1.html` だが、
 * 参照する側は拡張子なしで書く。末尾スラッシュも環境で揺れるため、両方落として比べる。
 */
const normalize = (path: string): string => path.replace(/\.html$/, '').replace(/\/+$/, '')

export const isCurrent = (pathname: string, href: string): boolean =>
  normalize(pathname) === normalize(href)

/** その下にいるか。連載や講義ノートの現在地判定に使う。 */
export const contains = (pathname: string, prefix: string): boolean => {
  const here = normalize(pathname)
  const root = normalize(prefix)

  return here === root || here.startsWith(`${root}/`)
}

const seriesSection = (series: NavSeries, fields: readonly NavField[], position?: number): NavSection => {
  const field = fields.find((entry) => entry.slug === series.field)

  return {
    key: `series:${series.field}/${series.slug}`,
    kind: 'current',
    title: series.title,
    caption: field?.title,
    captionHref: field?.href,
    entries: series.entries,
    position,
    total: series.entries.length,
  }
}

const collapsedSeries = (series: NavSeries, open = false): NavSection => ({
  key: `series:${series.field}/${series.slug}`,
  kind: 'collapsed',
  title: series.title,
  note: series.entries.length > 0 ? `${series.entries.length} 回` : '準備中',
  entries: series.entries,
  open,
})

const fieldLinks = (fields: readonly NavField[], except?: string): NavBlock[] => {
  const others = fields.filter((field) => field.slug !== except)

  if (others.length === 0) return []

  return [
    {
      heading: except === undefined ? '分野' : 'ほかの分野',
      sections: [
        {
          key: 'fields',
          kind: 'links',
          entries: others.map((field) => ({
            href: field.href,
            label: field.title,
            note: field.note,
          })),
        },
      ],
    },
  ]
}

/** 末尾に置く「そのほか」。講義ノートとサイトについて。 */
const tail = (data: NavData, options: { readonly notes?: boolean; readonly posts?: boolean } = {}): NavBlock[] => {
  const { notes = true, posts = true } = options
  const sections: NavSection[] = []

  if (notes) {
    sections.push({
      key: 'notes',
      kind: 'links',
      entries: [{ href: data.notesHref, label: '講義ノート', note: data.notesNote }],
    })
  }

  if (posts && data.posts.length > 0) {
    sections.push({
      key: 'posts',
      kind: 'collapsed',
      title: 'サイトについて',
      entries: data.posts,
    })
  }

  return sections.length > 0 ? [{ heading: 'そのほか', sections }] : []
}

/** 連載を読んでいるとき。今いる連載だけを開き、残りは畳む。 */
const articleView = (data: NavData, pathname: string, series: NavSeries): NavBlock[] => {
  const index = series.entries.findIndex((entry) => isCurrent(pathname, entry.href))
  const field = data.fields.find((entry) => entry.slug === series.field)

  const siblings = data.series.filter(
    (other) => other.field === series.field && other.slug !== series.slug,
  )

  return [
    { sections: [seriesSection(series, data.fields, index >= 0 ? index + 1 : undefined)] },
    ...(siblings.length > 0
      ? [
          {
            heading: field ? `${field.title}のほかの連載` : 'ほかの連載',
            sections: siblings.map((other) => collapsedSeries(other)),
          },
        ]
      : []),
    ...fieldLinks(data.fields, series.field),
    ...tail(data),
  ]
}

/** 分野の目次にいるとき。その分野の連載を並べ、先頭だけ開いておく。 */
const fieldView = (data: NavData, field: NavField): NavBlock[] => {
  const owned = data.series.filter((series) => series.field === field.slug)

  return [
    {
      heading: field.title,
      sections: owned.map((series, index) => collapsedSeries(series, index === 0)),
    },
    ...fieldLinks(data.fields, field.slug),
    ...tail(data),
  ]
}

/** 講義ノートを読んでいるとき。同じ群だけ開く（ノートとレポートは別物）。 */
const noteView = (data: NavData, group: NavGroup): NavBlock[] => [
  {
    sections: [
      {
        key: `notes:${group.title}`,
        kind: 'current',
        title: `講義ノート（${group.title}）`,
        caption: '素材',
        captionHref: data.notesHref,
        entries: group.entries,
      },
    ],
  },
  {
    heading: 'ほかの素材',
    sections: data.notes
      .filter((other) => other.title !== group.title)
      .map((other) => ({
        key: `notes:${other.title}`,
        kind: 'collapsed' as const,
        title: other.title,
        note: `${other.entries.length} 本`,
        entries: other.entries,
      })),
  },
  ...fieldLinks(data.fields),
  ...tail(data, { notes: false }),
]

/** 講義ノートの一覧にいるとき。本文が一覧なので、柱では畳んでおく。 */
const notesIndexView = (data: NavData): NavBlock[] => [
  {
    heading: '講義ノート',
    sections: data.notes.map((group, index) => ({
      key: `notes:${group.title}`,
      kind: 'collapsed' as const,
      title: group.title,
      note: `${group.entries.length} 本`,
      entries: group.entries,
      open: index === 0,
    })),
  },
  ...fieldLinks(data.fields),
  ...tail(data, { notes: false }),
]

/** サイトについての記事を読んでいるとき。 */
const postView = (data: NavData): NavBlock[] => [
  {
    sections: [
      {
        key: 'posts',
        kind: 'current',
        title: 'サイトについて',
        entries: data.posts,
      },
    ],
  },
  ...fieldLinks(data.fields),
  ...tail(data, { posts: false }),
]

/** 入口。まだどこにも入っていない人には、道を 1 本だけ示す。 */
const homeView = (data: NavData): NavBlock[] => [
  ...(data.start
    ? [{ heading: 'はじめて読むなら', sections: [{ key: 'start', kind: 'links' as const, entries: [data.start] }] }]
    : []),
  ...fieldLinks(data.fields),
  ...tail(data),
]

export const scopeNav = (data: NavData, pathname: string): readonly NavBlock[] => {
  const series = data.series.find((entry) => contains(pathname, entry.prefix))
  if (series) return articleView(data, pathname, series)

  const group = data.notes.find((entry) =>
    entry.entries.some((note) => isCurrent(pathname, note.href)),
  )
  if (group) return noteView(data, group)

  if (isCurrent(pathname, data.notesHref)) return notesIndexView(data)

  const field = data.fields.find((entry) => isCurrent(pathname, entry.href))
  if (field) return fieldView(data, field)

  if (data.posts.some((entry) => isCurrent(pathname, entry.href))) return postView(data)

  return homeView(data)
}
