/**
 * Typst の HTML 出力を Astro に流せる部品に切り分ける。
 *
 * 出力は機械生成なので構造は安定しているが、HTML export 自体が experimental で
 * 形が変わりうる。想定外の形を黙って通すと壊れたページが出るので、
 * ここでは必ず例外を投げて気づけるようにしている。
 */

export type TypstDocument = {
  /** <body> の中身。そのまま set:html に渡す。 */
  readonly body: string
  /** <head> の中身。MathML 用 stylesheet が入る。 */
  readonly head: string
  /** <html lang="..."> の値。#set text(lang: ...) が反映される。 */
  readonly lang: string
}

const HTML_TAG = /<html\b[^>]*\blang="([^"]*)"/
const HEAD = /<head\b[^>]*>([\s\S]*?)<\/head>/
const BODY = /<body\b[^>]*>([\s\S]*)<\/body>/

export const splitDocument = (html: string, source: string): TypstDocument => {
  const body = html.match(BODY)
  if (!body) {
    throw new Error(
      `Typst の出力に <body> が見つかりません (${source}). ` +
        `HTML export の出力形式が変わった可能性があります。`,
    )
  }

  const head = html.match(HEAD)
  const lang = html.match(HTML_TAG)

  return {
    body: body[1],
    head: head ? head[1] : '',
    // lang 属性の既定は "en"。和文で text-spacing-trim や word-break: auto-phrase を
    // 効かせるには "ja" が要るので、欠けていることを検出できる形で返す。
    lang: lang ? lang[1] : '',
  }
}

/**
 * <head> から <style> の中身だけを連結して返す。
 *
 * Typst 0.15 は MathML 用の CSS を全ページの <head> に丸ごと重ねて出す（約 1.6KB）。
 * body だけ抜き出すとこれが落ちて数式の組版が崩れるため、1 度だけ回収して
 * 共有 CSS として配るのがこのパイプラインの前提になっている。
 */
export const extractStyles = (head: string): string => {
  const styles = [...head.matchAll(/<style\b[^>]*>([\s\S]*?)<\/style>/g)]

  return styles.map((match) => match[1].trim()).join('\n\n')
}

/**
 * アクセント記号を合成用から独立字形に置き換える。
 *
 * Typst は $dot(q)$ を <mo>U+0307 COMBINING DOT ABOVE</mo> として出す。
 * 合成用の文字は送り幅が 0 なので、ブラウザが <mover> の中心を送り幅から
 * 計算すると点が基底文字の左端に乗る。実際 Chromium では q̇ の点が
 * 左肩にずれる（フォントの MATH テーブルは正しく載っているのに、である）。
 *
 * 独立字形（U+02D9 DOT ABOVE など）は送り幅を持つので、素直に中央へ来る。
 * ベクトルの U+20D7 も同じ理由でずれるうえ、矢印が小さい。
 * 通常の矢印に置き換えると基底文字の幅に合わせて伸びる。
 *
 * 置換は <mo> の中に単独で入っている場合だけに限る。本文に出てくる
 * ダイアクリティカル（Gödel のような合字前の表記）を巻き込まないため。
 */
const SPACING_ACCENTS: ReadonlyMap<string, string> = new Map([
  ['̀', 'ˋ'], // グレイヴ
  ['́', '´'], // アキュート
  ['̂', 'ˆ'], // ハット
  ['̃', '˜'], // チルダ
  ['̄', '¯'], // マクロン（バー）
  ['̆', '˘'], // ブレーヴェ
  ['̇', '˙'], // ドット
  ['̈', '¨'], // ダブルドット
  ['̊', '˚'], // リング
  ['̌', 'ˇ'], // キャロン
  ['⃖', '←'], // 左向きベクトル
  ['⃗', '→'], // ベクトル
])

export const useSpacingAccents = (html: string): string =>
  html.replace(/<mo\b([^>]*)>([^<]+)<\/mo>/g, (whole, attributes: string, body: string) => {
    const replaced = SPACING_ACCENTS.get(body)

    return replaced === undefined ? whole : `<mo${attributes}>${replaced}</mo>`
  })

/**
 * 別行立て数式を採番用のラッパーで包む。
 *
 * Typst の HTML export は式番号を出力しない。参照側だけが「式 1」と表示され、
 * どの式か分からなくなるので、CSS カウンタで番号を振れるようにする。
 * <math> 自身には疑似要素が効かない（MathML の描画規則）ため、外側が要る。
 *
 * ラベル（id）は数式に付いているので、ラッパーではなく元の要素に残す。
 */
export const wrapBlockEquations = (html: string): string =>
  html.replace(
    /<math\b([^>]*\bdisplay="block"[^>]*)>([\s\S]*?)<\/math>/g,
    (_, attributes, body) =>
      `<div class="equation"><math${attributes}>${body}</math></div>`,
  )

/**
 * 本文に書かれたサイト内リンクへ base を前置きする。
 *
 * 記事は `#link("/math/set-theory/6")` のようにサイトのルート起点で書く。
 * base はビルド設定（GitHub Pages ならリポジトリ名）なので本文には焼き込まず、
 * ここで補う。外部リンクと、既に base が付いているものは触らない。
 */
export const rewriteInternalLinks = (html: string, base: string): string => {
  if (base === '/' || base === '') return html

  return html.replace(
    /\b(href|src)="(\/[^"]*)"/g,
    (whole, attribute, url) =>
      url.startsWith(base) || url.startsWith('//')
        ? whole
        : `${attribute}="${base}${url.slice(1)}"`,
  )
}

/**
 * 二項演算子が前置扱いになっているのを直す。
 *
 * Typst は `∇^2 + V` のように演算子扱いの記号の後に来る +/− を単項と判定し、
 * <mo form="prefix"> を出す。すると MathML の既定で前後の空きが消え、
 * 「∇²+V(r)」のように詰まって読みにくくなる。x^2 + V なら正しく infix になる
 * ので、記号の分類に引きずられた判定と思われる。
 *
 * 閉じた被演算子（</msup> や </mi> など）の直後に来る +/− は必ず二項なので、
 * そこだけ form を外してブラウザ既定の間隔に戻す。単項マイナス（= -b など）は
 * 直前が <mo> なので触らない。
 */
const OPERAND_END =
  /(<\/(?:msup|msub|msubsup|mi|mn|mrow|mfrac|msqrt|mroot|mover|munder|munderover|mtext)>)(\s*)<mo form="prefix">([+\u2212-])<\/mo>/g

export const repairBinaryOperators = (html: string): string =>
  html.replace(OPERAND_END, (_, close, space, operator) => `${close}${space}<mo>${operator}</mo>`)

/**
 * 伸ばす必要のない括弧の伸縮を止める。
 *
 * Chrome の MathML では、伸縮する括弧の送り幅が中身に関係なく
 * 最大の異体字のものになる。Computer Modern 系の ( なら 0.875em で、
 * 実際に描かれる 0.389em の 2.25 倍。差の 0.486em が前後に散って、
 * S(q) の括弧の周りに 0.32em ずつの空きができる。maxsize では止まらない。
 * 元フォントでもサブセットでも同じなので、サブセットの副作用ではない。
 *
 * 負のマージンでは直らない。余分な送りは箱の内側にも入っているため、
 * 外側を引いても ( と中身の間が 0.33em のまま残り、かえって不揃いになる。
 * stretchy="false" にすると外 0.073em / 内 0.094em まで落ちる。
 *
 * ただし分数や根号を囲む括弧は伸びてもらわないと困る。中身を見て、
 * 背の高くなる要素を含まないものだけ止める。
 * Typst がすでに stretchy="false" を付けているものは触らない。
 */
const FENCE_OPEN = '([⟨⟦⌈⌊'
const FENCE_CLOSE = ')]⟩⟧⌉⌋'

/** 中にあると括弧を伸ばす必要が出る要素。 */
const TALL = /<(mfrac|msqrt|mroot|mtable|munder|mover|munderover|msubsup)\b/

/** <mrow> の入れ子を数えて、開き括弧に対応する </mrow> の位置を返す。 */
const findGroupEnd = (html: string, from: number): number => {
  const token = /<(\/?)mrow\b[^>]*>/g
  token.lastIndex = from
  let depth = 1

  for (let m = token.exec(html); m !== null; m = token.exec(html)) {
    depth += m[1] === '/' ? -1 : 1
    if (depth === 0) return m.index
  }

  return -1
}

export const freezeShortFences = (html: string): string => {
  // Typst は括弧を必ず <mrow><mo>(</mo> … <mo>)</mo></mrow> の形で包む。
  const cls = (chars: string) => chars.replace(/[\]\\^-]/g, '\\$&')
  const opener = new RegExp(`<mrow>(<mo([^>]*)>([${cls(FENCE_OPEN)}])</mo>)`, 'g')
  const edits: { at: number; length: number; text: string }[] = []

  for (let m = opener.exec(html); m !== null; m = opener.exec(html)) {
    const [, tag, attributes] = m
    if (attributes.includes('stretchy=')) continue

    const contentStart = m.index + m[0].length
    const end = findGroupEnd(html, contentStart)
    if (end < 0) continue

    const content = html.slice(contentStart, end)
    if (TALL.test(content)) continue

    // 閉じ括弧も同じ <mrow> の末尾にある。両方まとめて止める。
    const closer = new RegExp(`<mo([^>]*)>([${cls(FENCE_CLOSE)}])</mo>\\s*$`)
    const tail = content.match(closer)
    if (!tail) continue

    edits.push({ at: m.index + '<mrow>'.length, length: tag.length, text: tag.replace('<mo', '<mo stretchy="false"') })
    edits.push({
      at: contentStart + (tail.index ?? 0),
      length: tail[0].length,
      text: tail[0].replace('<mo', '<mo stretchy="false"'),
    })
  }

  let out = html
  for (const edit of edits.sort((a, b) => b.at - a.at)) {
    out = out.slice(0, edit.at) + edit.text + out.slice(edit.at + edit.length)
  }

  return out
}
