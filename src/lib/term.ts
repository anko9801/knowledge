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

/* ------------------------------------------------------------------ *
 * 自動で拾うほう
 * ------------------------------------------------------------------ */

/**
 * 手で置くと、書くたびに「どの語に付けたか」を思い出す作業が要る。
 * それが毎回では続かないので、拾えるものは拾う。
 *
 * 測ったうえでの線引きが三つある。
 *
 * - **3 字以上だけ。** 2 字以下の概念が 26 件あって、「体」は全体・物体に、
 *   「束」は接束・収束・束縛に、「向き」は日常語に当たる。ここは `#term` で手動
 * - **長い名前から当てる。** 他の名前の一部になっている名前が 58 件ある
 *   （「線形写像」⊂「多重線形写像」、「接空間」⊂「余接空間」）。短いほうから
 *   当てると、内側だけが切り取られて別の概念に化ける
 * - **分野は見ない。** 分野をまたぐ当たりが 67 件あるが、中身を見ると全部正しい。
 *   cs の記事に出る「大数の法則」は math の概念で、それがこのサイトの主題である
 *
 * 1 本につき初出だけに絞ると、実測で 1 本あたり 6.2 語になる。
 */

/** 中を触らない場所。数式・コード・既にリンクになっているところ・見出し。 */
const GUARDED =
  /<math\b[\s\S]*?<\/math>|<(code|pre|a|h[1-6])\b[\s\S]*?<\/\1>|<span class="peek"[\s\S]*?<\/span><\/span>|<span class="term"[\s\S]*?<\/span>/g

// 本文に出てこない制御文字を目印にする。エスケープで書く（見えない文字を置かない）。
const MASK = '\u0002'

export type Linked = {
  readonly html: string
  /** 実際に印を付けた概念 id。出た順。 */
  readonly linked: readonly string[]
}

/**
 * 同じ語で別の概念を指してしまうもの。自動では拾わない。
 *
 * 名前の重複は 0 件なので、概念どうしがぶつかることは無い。ぶつかるのは
 * **概念になっていないほうの意味**である。実際に配ってしまった三つを挙げる。
 *
 * - `parallel-transport`（平行移動）── 測度と集合論では Vitali の
 *   「平行移動しても長さは変わらない」で、Riemann 幾何の平行移動ではない
 * - `independence-probabilistic`（独立性）── 集合論と論理では $upright("CH")$ の独立性、
 *   線形代数では一次独立。確率的独立はそのうちの一つでしかない
 * - `diagonalization`（対角化）── 計算量と論理では対角線論法を指していて、
 *   行列の対角化ではない
 *
 * **足すのは、誤爆を見つけたときだけにする。** 予防で足すと、
 * 正しく拾えたはずのものが黙って消える。指したいところには `#term` を置けばよい。
 */
const AMBIGUOUS: ReadonlySet<string> = new Set([
  'parallel-transport',
  'independence-probabilistic',
  'diagonalization',
])

/** 差し込んだ印の置き場。番号で戻す。 */
const SLOT = (n: number): string => `\u0003${n}\u0003`

export const linkTerms = (
  html: string,
  terms: readonly Term[],
  options: { readonly base?: string; readonly exclude?: ReadonlySet<string> } = {},
): Linked => {
  const { base = '', exclude = new Set<string>() } = options
  const root = base.replace(/\/+$/, '')

  // 触らない場所を伏せる。伏せたまま探し、最後に戻す。
  const held: string[] = []
  let out = html.replace(GUARDED, (whole) => {
    held.push(whole)
    return MASK
  })

  // 長い名前から当てる。短いほうを先にすると「多重線形写像」の内側が切り取られる。
  const targets = terms
    .filter(
      (t) =>
        !exclude.has(t.id) &&
        !AMBIGUOUS.has(t.id) &&
        !t.label.includes('$') &&
        [...t.label].length >= 3,
    )
    .sort((a, b) => b.label.length - a.label.length)

  const marks: string[] = []
  const linked: string[] = []

  for (const t of targets) {
    const at = out.indexOf(t.label)
    if (at < 0) continue

    // タグの中（属性値）に当たっていたら見送る。
    if (out.lastIndexOf('<', at) > out.lastIndexOf('>', at)) continue

    // 差し込んだ印そのものを、あとから来る短い名前が食う。
    // 中身を置かずに番号だけ入れて、最後に戻す。
    const mark = peekMark(
      `ta${marks.length + 1}`,
      `${root}/concepts/${t.id}`,
      t.label,
      `<span class="peek-p"><strong>${escape(t.label)}</strong></span>` +
        `<span class="peek-p">${escape(t.gist)}</span>`,
      ' peek-term',
    )
    out = out.slice(0, at) + SLOT(marks.length) + out.slice(at + t.label.length)
    marks.push(mark)
    linked.push(t.id)
  }

  // 印を戻してから、伏せた場所を戻す。伏せたぶんの並びは崩れていない。
  const withMarks = out.replace(/\u0003(\d+)\u0003/g, (_, n: string) => marks[Number(n)] as string)
  let index = 0
  return {
    html: withMarks.replace(new RegExp(MASK, 'g'), () => held[index++] as string),
    linked,
  }
}
