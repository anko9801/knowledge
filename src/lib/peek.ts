/**
 * 参照の先を、その場に出す。
 *
 * `@def:measure` は Typst が `<a href="#loc-1">定義 5</a>` として出す。押すと
 * その定義まで飛ぶが、読者は読んでいた場所を失い、スクロールで戻ることになる。
 * 定義を思い出すたびに往復が入り、作業記憶がそこに食われる（分割注意）。
 *
 * そこで参照点に、指す先の中身をそのまま添える。ホバーと :focus-visible で
 * 開くので **JS は要らない**。触るだけの端末には、その代わりに取っ手を置く
 * （`peekMark`）。
 *
 * 中身は参照のたびに複製される。生の HTML は 1 ページ 25〜38% 増えるが、
 * 同じ塊の繰り返しなので gzip 後は 3〜6%（実測、最大 0.5 KB）に収まる。
 */

/** 添えられる主張。id は Typst が参照されたラベルにだけ振る。 */
type Statement = {
  readonly id: string
  readonly inner: string
  /** 本体の置かれている範囲。参照との隔たりを測るのに使う。 */
  readonly start: number
  readonly end: number
}

/**
 * これより近い参照には添えない（本文の文字数で測る）。
 *
 * 添える理由は往復コスト（分割注意）なので、**すぐそこにあるものには理由が無い**。
 * 613 件の参照のうち 61 件は、直前の主張をその場で受けているだけだった。
 *
 *   @def:matrix を読むと、行列の掛け算があの定義である理由も出てくる  ← 2 行上
 *
 * **HTML の文字数では測れない。** MathML は画面では小さいのに生の HTML では
 * 巨大なので、数式を一つ挟んだだけで「遠い」と誤判定する。実測でも
 * `.typ` の 14 行差が 74 文字、5 行差が 407 文字と、順序が入れ替わっていた。
 *
 * 本文だけで測ると分離する。100 字で切ると、直後を受けている 61 件のうち 54 件が
 * 落ちる。残る 7 件は間に段落が挟まっているので、添えてよい側である。
 */
const NEAR = 100

/**
 * `<div ...>` の開始位置から、対応する `</div>` の直後までを返す。
 *
 * 主張の中には `<div class="proof">` や `<details>` が入りうるので、
 * 最初の `</div>` で切ると途中で千切れる。
 */
const blockEnd = (html: string, start: number): number => {
  const tag = /<\/?div\b/g
  tag.lastIndex = start
  let depth = 0

  for (let m = tag.exec(html); m !== null; m = tag.exec(html)) {
    if (html[m.index + 1] === '/') {
      depth -= 1
      if (depth === 0) return html.indexOf('>', m.index) + 1
    } else {
      depth += 1
    }
  }

  return html.length
}

/**
 * ブロック要素を span に均す。
 *
 * 参照はたいてい `<p>` の中にある。そこへ `<p>` や `<ol>` を差し込むと、HTML
 * パーサが外側の `<p>` を**そこで閉じてしまう**。DOM が本文の途中で切れるので、
 * 崩れ方が派手なわりに HTML を目で読んでも気づけない。
 *
 * span にしておけば phrasing content として通る。段組みは CSS の display で戻す。
 */
const BLOCK = /<(\/?)(?:p|div|ol|ul|li)\b([^>]*)>/g

const asSpans = (html: string): string =>
  html.replace(BLOCK, (whole, close: string, attrs: string) => {
    if (close) return '</span>'
    const tag = /^<(\w+)/.exec(whole)?.[1] ?? 'div'
    // .equation は counter-increment を持つ。複製すると本文の式番号がずれるので、
    // 番号を持たない別のクラスに移す。
    const held = (/class="([^"]*)"/.exec(attrs)?.[1] ?? '').replace(/\bequation\b/, '')
    return `<span class="peek-${tag}${held.trim() ? ` ${held.trim()}` : ''}">`
  })

/**
 * 添えるための中身に均す。
 *
 * - 外枠の div を外す。添える先は本文の途中なので、主張の箱ごとは要らない
 * - id を落とす。同じ id が文書に何度も出ると、リンク先が定まらなくなる
 * - `<details>` を落とす。想起の問いを参照したときに答えが漏れる
 */
const asPeek = (block: string): string =>
  asSpans(
    block
      .replace(/^<div[^>]*>/, '')
      .replace(/<\/div>$/, '')
      .replace(/ id="[^"]*"/g, '')
      .replace(/<details\b[\s\S]*?<\/details>/g, ''),
  )

/**
 * ラベル由来の錨から、その主張の中身を引く。
 *
 * 記事をまたいで主張を添えるのに使う（`page-peek.ts`）。錨は `theorem.typ` が
 * `<def:measure>` から出す `<span id="def-measure">` で、Typst の `loc-N` と違って
 * **位置に依らない**。だから別のページから安全に指せる。
 */
export const statementsByAnchor = (html: string): ReadonlyMap<string, string> => {
  // ページ内から参照されている主張には Typst が id="loc-N" を挿す。
  // それを見込まないと、**参照されているものだけ索引から落ちる**（拾えるのが
  // 誰も指していない主張だけになり、いちばん要るものが無い）。
  const opening =
    /<div(?: id="[^"]*")? class="statement\b[^"]*"><p class="statement-head"><span id="([^"]+)"/g
  const found = new Map<string, string>()

  for (let m = opening.exec(html); m !== null; m = opening.exec(html)) {
    found.set(m[1] as string, asPeek(html.slice(m.index, blockEnd(html, m.index))))
  }

  return found
}

/** 参照される主張を id で引けるようにする。 */
const collect = (html: string): ReadonlyMap<string, Statement> => {
  const opening = /<div id="([^"]+)" class="statement\b/g
  const found = new Map<string, Statement>()

  for (let m = opening.exec(html); m !== null; m = opening.exec(html)) {
    const end = blockEnd(html, m.index)
    found.set(m[1] as string, {
      id: m[1] as string,
      inner: asPeek(html.slice(m.index, end)),
      start: m.index,
      end,
    })
  }

  return found
}

/**
 * 読者から見た隔たり。**タグと数式を落として、本文だけを数える。**
 *
 * `<math>` は中身ごと落とす。画面では 1 個の記号でも、MathML の生の長さは
 * 数千文字になりうるので、数えると隔たりが実際の何倍にも見える。
 */
const readingLength = (fragment: string): number =>
  fragment
    .replace(/<math\b[\s\S]*?<\/math>/g, '')
    .replace(/<[^>]+>/g, '')
    .replace(/\s+/g, '').length

/**
 * 参照と本体の隔たり。本体の中は数えないので、長い定理でも公平に測れる。
 *
 * 前方参照（「次の定理」）もありうるので、本体より手前なら開始位置から測る。
 */
const gapTo = (html: string, at: number, target: Statement): number =>
  at > target.end
    ? readingLength(html.slice(target.end, at))
    : readingLength(html.slice(at, target.start))

/**
 * 参照ひとつ分を組む。
 *
 * ホバーできる端末には、これで足りていた。触るだけの端末には届いていない。
 * 押す = リンクをたどる、なので開いた瞬間に画面が変わり、添えた中身を読む機会が
 * 無い。読者の大半がそちらにいる。
 *
 * そこで参照の後ろに小さな取っ手を置き、checkbox で開く。**JS は増やさない**
 * （骨格の開閉と同じ手）。ホバーできる端末では取っ手を出さないので、
 * あちらの見た目と手数は変わらない（`global.css`）。
 *
 * リンクは**そのまま残す**。取っ手が増えるだけなので、読み上げにも、
 * 主張まで飛ぶ従来の道にも影響しない。
 */
export const peekMark = (
  toggle: string,
  href: string,
  label: string,
  body: string,
  bodyClass = '',
): string =>
  `<span class="peek">` +
  `<input type="checkbox" id="${toggle}" class="peek-toggle" tabindex="-1" aria-hidden="true">` +
  `<a href="${href}" class="peek-link">${label}</a>` +
  `<label for="${toggle}" class="peek-tap" aria-hidden="true"></label>` +
  // aria-hidden は読み上げに、data-pagefind-ignore は検索に、同じことを言う。
  // 同じ主張がページ内で 5 回参照されると、索引にも 5 回入って重みが狂う
  // （実測で索引の 19% が複製だった）。実体は同じページにあるので、
  // 落としても引けなくなるものは無い。
  `<span class="peek-body${bodyClass}" aria-hidden="true" data-pagefind-ignore>${body}</span>` +
  `</span>`

/**
 * 参照に、指す先の中身を添える。
 *
 * 添えないものが二つある。
 *
 * - **主張を指していない参照**（式番号や見出し）。添えても「式 3」が「式 3」に
 *   見えるだけで、往復の手間が減らない
 * - **すぐそこを指している参照**（`NEAR` 以内）。読んだばかりのものを複製しても、
 *   減らす往復が無い
 */
export const attachPeeks = (html: string): string => {
  const statements = collect(html)
  if (statements.size === 0) return html

  let nth = 0

  // 置換文字列は走査し直されないので、添えた中身の中のリンクは素のまま残る。
  return html.replace(
    /<a href="#([^"]+)">([\s\S]*?)<\/a>/g,
    (whole, id: string, label: string, at: number) => {
      const target = statements.get(id)
      if (target === undefined) return whole
      if (gapTo(html, at, target) < NEAR) return whole

      nth += 1
      // 錨ではなく通し番号にする。同じ主張が何度も参照されるので、
      // 錨から作ると id が重複して、取っ手がどれも最初の一つを開く。
      return peekMark(`pk${nth}`, `#${id}`, label, target.inner)
    },
  )
}
