/**
 * 参照の先を、その場に出す。
 *
 * `@def:measure` は Typst が `<a href="#loc-1">定義 5</a>` として出す。押すと
 * その定義まで飛ぶが、読者は読んでいた場所を失い、スクロールで戻ることになる。
 * 定義を思い出すたびに往復が入り、作業記憶がそこに食われる（分割注意）。
 *
 * そこで参照点に、指す先の中身をそのまま添える。ホバーと :focus-visible で
 * 開くので **JS は要らない**。触るだけの端末では従来どおりリンクとして飛ぶ。
 *
 * 中身は参照のたびに複製される。生の HTML は 1 ページ 25〜38% 増えるが、
 * 同じ塊の繰り返しなので gzip 後は 3〜6%（実測、最大 0.5 KB）に収まる。
 */

/** 添えられる主張。id は Typst が参照されたラベルにだけ振る。 */
type Statement = {
  readonly id: string
  readonly inner: string
}

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

/** 参照される主張を id で引けるようにする。 */
const collect = (html: string): ReadonlyMap<string, Statement> => {
  const opening = /<div id="([^"]+)" class="statement\b/g
  const found = new Map<string, Statement>()

  for (let m = opening.exec(html); m !== null; m = opening.exec(html)) {
    const block = html.slice(m.index, blockEnd(html, m.index))
    found.set(m[1] as string, { id: m[1] as string, inner: asPeek(block) })
  }

  return found
}

/**
 * 参照に、指す先の中身を添える。
 *
 * 主張を指していない参照（式番号や見出し）はそのまま通す。添えても
 * 「式 3」が「式 3」に見えるだけで、往復の手間が減らないからである。
 */
export const attachPeeks = (html: string): string => {
  const statements = collect(html)
  if (statements.size === 0) return html

  // 置換文字列は走査し直されないので、添えた中身の中のリンクは素のまま残る。
  return html.replace(
    /<a href="#([^"]+)">([\s\S]*?)<\/a>/g,
    (whole, id: string, label: string) => {
      const target = statements.get(id)
      if (target === undefined) return whole

      return (
        `<span class="peek"><a href="#${id}" class="peek-link">${label}</a>` +
        `<span class="peek-body" aria-hidden="true">${target.inner}</span></span>`
      )
    },
  )
}
