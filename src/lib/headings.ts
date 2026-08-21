/**
 * 本文の見出しに id を振り、目次に使う一覧を取り出す。
 *
 * Typst の HTML export は見出しに id を付けない（`<h2>公理</h2>` としか出ない）ので、
 * 目次からリンクする先がそもそも無い。ここでビルド時に振っておく。
 *
 * 一覧は Astro の `render()` が返す `headings` に載せる。Markdown 経路と同じ形
 * （`{ depth, slug, text }`）にしてあるので、ページ側は Markdown と同じ書き方で読める。
 */

export type Heading = {
  /** h2 なら 2。Typst の `=` は h2 から始まる（docs/build.md の 5 を参照）。 */
  readonly depth: number
  /** 見出しの id。目次のリンク先。 */
  readonly slug: string
  /** タグを剥がした見出し文。 */
  readonly text: string
}

export type HeadingResult = {
  readonly html: string
  readonly headings: readonly Heading[]
}

/**
 * 目次に出す見出しだけを残す。
 *
 * 既定は h3（Typst の `==`）まで。1 つしか無いときは空にする。
 * 見出しが 1 つの文書に「目次」を付けても、行き先が本文の頭しかない。
 */
export const tocHeadings = <T extends { readonly depth: number }>(
  headings: readonly T[],
  depth = 3,
): readonly T[] => {
  const items = headings.filter((heading) => heading.depth <= depth)

  return items.length >= 2 ? items : []
}

const ENTITIES: ReadonlyMap<string, string> = new Map([
  ['&amp;', '&'],
  ['&lt;', '<'],
  ['&gt;', '>'],
  ['&quot;', '"'],
  ['&#39;', "'"],
  ['&apos;', "'"],
  ['&nbsp;', ' '],
])

/** 見出しの中身からタグを落として、目次に出す文字列にする。 */
const textOf = (html: string): string =>
  html
    .replace(/<[^>]*>/g, '')
    .replace(/&(?:amp|lt|gt|quot|#39|apos|nbsp);/g, (entity) => ENTITIES.get(entity) ?? entity)
    .replace(/\s+/g, ' ')
    .trim()

/**
 * 見出し文を id にする。
 *
 * 和文の見出しがほとんどなので、GitHub と同じく文字はそのまま残して
 * 約物と空白だけ落とす。`#公理の一覧` のような読める URL になり、
 * 章番号を振る方式と違って節を差し込んでもリンクが死なない。
 */
export const slugify = (text: string): string =>
  text
    .normalize('NFKC')
    .toLowerCase()
    .replace(/[^\p{Letter}\p{Number}\p{Mark}\s_-]/gu, '')
    .trim()
    .replace(/\s+/g, '-')

/** 同じ見出し文が 2 度出てきたときに id が衝突しないようにする。 */
const unique = (slug: string, used: Map<string, number>): string => {
  const base = slug === '' ? 'section' : slug
  const seen = used.get(base) ?? 0

  used.set(base, seen + 1)
  return seen === 0 ? base : `${base}-${seen + 1}`
}

const HEADING = /<h([2-6])\b([^>]*)>([\s\S]*?)<\/h\1>/g
const ID = /\bid="([^"]*)"/

/**
 * 見出しに id と自己リンクを差し込み、目次用の一覧を返す。
 *
 * すでに id があるもの（Typst のラベル）は尊重して、そのまま目次に載せる。
 */
export const collectHeadings = (html: string): HeadingResult => {
  const headings: Heading[] = []
  const used = new Map<string, number>()

  const rewritten = html.replace(HEADING, (whole, level: string, attributes: string, body: string) => {
    const text = textOf(body)

    // 文字の無い見出しには手を出さない。id を振っても指す先が見えないし、
    // 目次に載せると本文の無いリンクになって読み上げが行き止まりになる。
    // 変換した講義ノートに `= ` だけの行が残っていて、実際にそうなっていた。
    if (text === '') return whole

    const existing = attributes.match(ID)
    const slug = existing ? existing[1] : unique(slugify(text), used)

    headings.push({ depth: Number(level), slug, text })

    // 見出し自身へのリンク。節を指して共有できるようにする。
    // data-pagefind-ignore が無いと、この # が検索の抜粋に紛れ込む。
    const anchor =
      `<a class="heading-anchor" href="#${slug}" aria-label="この節へのリンク"` +
      ` data-pagefind-ignore>#</a>`

    return existing
      ? `<h${level}${attributes}>${body}${anchor}</h${level}>`
      : `<h${level} id="${slug}"${attributes}>${body}${anchor}</h${level}>`
  })

  return { html: rewritten, headings }
}
