/**
 * 本文の用語に、ひとことの説明と索引への道を付ける。
 *
 * 記事は連載として順に読まれる建て付けだが、実際には検索から 1 本だけ来る読者がいる。
 * その人は本文の「σ 加法族」や「主束」を引く先を持っていない。概念のページは
 * 420 件あるのに、**本文からそこへ行く道が無かった**。
 *
 * 添える中身は `gist` の一行だけである。解説はしない（概念ページ自体がそうなっている、
 * `docs/reader.md`「概念から引く」）。仕掛けは `peek.ts` と同じで **JS は増えない**。
 *
 * ## 機械で拾わない
 *
 * 全 420 件を本文に照合すると 1998 か所に当たる。1 本あたり 23 語で、
 * リンクが多いほど負荷が上がる（DeStefano & LeFevre）という話の反対側へ行く。
 *
 * さらに短い名前が壊滅的に誤爆する。「体」は全体・物体に、「束」は接束・収束・束縛に、
 * 「向き」は日常語に当たる。2 字以下の名前は 26 件あった。
 *
 * だから**書き手が `#term[...]` で置く**。初出だけに絞った実測の中央値は 6 語で、
 * その密度なら成立する。
 */

import { peekMark } from './peek.ts'

/** 添えられる概念。`concepts.ts` から作る。 */
export type Term = {
  readonly id: string
  /** 表示名。`#term[...]` の中身と突き合わせる。 */
  readonly label: string
  /** ひとこと。これだけを添える。 */
  readonly gist: string
}

const escape = (text: string): string =>
  text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')

/** 中身から印を剥がす。名前と突き合わせるのはタグの無い文字列のほう。 */
const plain = (html: string): string => html.replace(/<[^>]+>/g, '').trim()

export type Unknown = { readonly text: string; readonly id?: string }

/**
 * `#term[...]` に説明を添える。
 *
 * 引けなかったものは `unknown` に集めて返す。**黙って素通しにしない。**
 * 名前を書き換えたときに印だけが残る、という壊れ方をここで止める。
 */
export const attachTerms = (
  html: string,
  terms: readonly Term[],
  base = '',
): { readonly html: string; readonly unknown: readonly Unknown[] } => {
  const byId = new Map(terms.map((t) => [t.id, t]))
  const byLabel = new Map(terms.map((t) => [t.label, t]))
  const unknown: Unknown[] = []

  // base は `/knowledge/` の形で来る（`rewriteInternalLinks` がその前提で書いてある）。
  // そのまま繋ぐと `/knowledge//concepts/…` になる。実際に一度出した。
  const root = base.replace(/\/+$/, '')

  let nth = 0

  const out = html.replace(
    /<span class="term"(?: data-id="([^"]*)")?>([\s\S]*?)<\/span>/g,
    (whole, id: string | undefined, body: string) => {
      const text = plain(body)
      const found = id === undefined ? byLabel.get(text) : byId.get(id)

      if (found === undefined) {
        unknown.push(id === undefined ? { text } : { text, id })
        return body
      }

      nth += 1
      // 取っ手の id は peek.ts の `pk` とも page-peek.ts の `pp` とも分ける。
      // 同じページに三種類が出るので、揃えると別のものが開く。
      return peekMark(
        `tm${nth}`,
        `${root}/concepts/${found.id}`,
        body,
        `<span class="peek-p"><strong>${escape(found.label)}</strong></span>` +
          `<span class="peek-p">${escape(found.gist)}</span>`,
        ' peek-term',
      )
    },
  )

  return { html: out, unknown }
}
