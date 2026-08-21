/**
 * コードの強調を Shiki で組み直す。
 *
 * Typst の raw も強調はするが、語彙が粗い。予約語・関数・文字列・数・注釈・
 * 約物の 6 種しか区別しないので、型と変数、宣言と呼び出し、前処理と本体が
 * 全部同じ色になる。C を読ませる記事で、そこが潰れているのは損である。
 *
 * Shiki は VS Code と同じ TextMate 文法を**ビルド時に**走らせる。
 * 読み手に配るのは色の付いた HTML だけなので、JS は 1 バイトも増えない。
 *
 * 明暗の二枚を同時に焼く（defaultColor: false）。各 span には
 * `--shiki-light` と `--shiki-dark` のふたつだけが載り、どちらを使うかは
 * global.css の @media が決める。JS で切り替えないので、
 * prefers-color-scheme の変更に即座に追随する。
 */

import type { BundledLanguage, Highlighter } from 'shiki'

/** 明暗の対。地の色はサイト側（--code-paper）を使うので、ここでは拾わない。 */
const THEMES = { light: 'vitesse-light', dark: 'vitesse-dark' } as const

/** Typst が出す 1 塊。lang は `data-lang` から来る。 */
const BLOCK = /<pre><code(?: data-lang="([^"]*)")?>([\s\S]*?)<\/code><\/pre>/g

/**
 * 実体参照を戻す。
 *
 * **一度で読むこと。** 置換を並べると、数値参照が作った `&` を後段が
 * もう一度食う。`&#x26;lt;`（＝文字列 `&lt;`）が `<` に化ける。
 * 「& を最後に回す」では直らない——作られる側が後から現れるためである。
 */
const ENTITY = /&(?:#x([0-9a-fA-F]+)|#(\d+)|(lt|gt|quot|apos|amp));/g

const NAMED: Readonly<Record<string, string>> = {
  lt: '<',
  gt: '>',
  quot: '"',
  apos: "'",
  amp: '&',
}

const decode = (html: string): string =>
  html
    .replace(/<[^>]*>/g, '')
    .replace(ENTITY, (whole, hex?: string, dec?: string, name?: string) => {
      if (hex !== undefined) return String.fromCodePoint(parseInt(hex, 16))
      if (dec !== undefined) return String.fromCodePoint(Number(dec))
      return NAMED[name as string] ?? whole
    })

let shared: Promise<Highlighter> | undefined

const highlighter = async (): Promise<Highlighter> => {
  if (!shared) {
    const { createHighlighter } = await import('shiki')
    shared = createHighlighter({ themes: [THEMES.light, THEMES.dark], langs: [] })
  }
  return shared
}

/** 文法は使うものだけ読む。全部載せると起動が数秒かかる。 */
const loaded = new Set<string>()

const ensureLang = async (hl: Highlighter, lang: string): Promise<string> => {
  if (lang === '' || lang === 'text') return 'text'
  if (loaded.has(lang)) return lang

  try {
    await hl.loadLanguage(lang as BundledLanguage)
    loaded.add(lang)
    return lang
  } catch {
    // 知らない文法は素通し。強調が付かないだけで、中身は読める。
    loaded.add(lang)
    return 'text'
  }
}

export type Highlighted = {
  readonly html: string
  /** 文法が見つからず素通しにした言語。呼び出し側が警告できる。 */
  readonly unknown: readonly string[]
}

/**
 * `<pre><code>` を Shiki の出力に差し替える。
 *
 * Typst が既に付けた色は捨てる。元の文字列だけが要るので、
 * タグを落として実体参照を戻してから渡し直す。
 */
export const highlightCode = async (html: string): Promise<Highlighted> => {
  const blocks = [...html.matchAll(BLOCK)]
  if (blocks.length === 0) return { html, unknown: [] }

  const hl = await highlighter()
  const unknown = new Set<string>()
  const out: string[] = []

  for (const block of blocks) {
    const requested = block[1] ?? ''
    const lang = await ensureLang(hl, requested)
    if (requested !== '' && lang === 'text' && requested !== 'text') unknown.add(requested)

    out.push(
      hl.codeToHtml(decode(block[2] as string), {
        lang,
        themes: THEMES,
        // 既定色をインラインに焼かない。載るのは CSS 変数だけになる。
        defaultColor: false,
      }),
    )
  }

  let at = 0
  const parts: string[] = []
  blocks.forEach((block, i) => {
    parts.push(html.slice(at, block.index), out[i] as string)
    at = (block.index as number) + block[0].length
  })
  parts.push(html.slice(at))

  return { html: parts.join(''), unknown: [...unknown] }
}
