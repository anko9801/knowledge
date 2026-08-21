/**
 * 本文の HTML から meta description 用の一行を作る。
 *
 * 講義ノートは機械変換した素材なので、front matter の summary が
 * 「note/xxx.tex から変換」のままで、説明になっていない。かといって
 * 44 本に手で書くのも続かないので、本文の冒頭から拾う。
 *
 * 数式は落とす。MathML の文字を並べても意味のある文にならないし、
 * 検索結果に記号の羅列が出るだけになる。
 */

/** 数式・スクリプト・見出しアンカーを落として、地の文だけにする。 */
const toPlainText = (html: string): string =>
  html
    .replace(/<math[\s\S]*?<\/math>/g, ' ')
    .replace(/<(script|style)\b[\s\S]*?<\/\1>/g, ' ')
    .replace(/<a\b[^>]*class="heading-anchor"[^>]*>[\s\S]*?<\/a>/g, ' ')
    .replace(/<[^>]+>/g, ' ')
    .replace(/&(?:nbsp|#160);/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#(\d+);/g, (_, code: string) => String.fromCodePoint(Number(code)))
    .replace(/\s+/g, ' ')
    .trim()

/**
 * 句点で切って `limit` 文字に収める。1 文目が長すぎるときは字数で切る。
 * 途中で切ったことが分かるように、そのときだけ … を足す。
 */
const clamp = (text: string, limit: number): string => {
  if (text.length <= limit) return text

  const head = text.slice(0, limit)
  const stop = head.lastIndexOf('。')

  return stop >= limit / 3 ? head.slice(0, stop + 1) : `${head.trimEnd()}…`
}

/**
 * 本文から description を作る。拾えたものが短すぎるときは null を返す。
 * 下限を 24 字にしてあるのは和文の密度に合わせたもので、「化学」だけの
 * ページを弾き、一文ぶんは通す線である。
 * 呼ぶ側で題や分類から組み立て直すこと。断片だけの description は、
 * 無いより検索結果の見え方が悪くなる。
 */
export const excerpt = (html: string, limit = 110, minimum = 24): string | null => {
  const text = toPlainText(html)

  return text.length < minimum ? null : clamp(text, limit)
}
