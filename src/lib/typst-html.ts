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
