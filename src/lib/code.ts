/**
 * コードの色を、焼き付けられた 16 進からクラスへ移す。
 *
 * Typst の raw は強調を `style="color: #d73948"` の形で**インラインに焼き込む**。
 * 図の SVG と同じ問題で（global.css の svg [stroke='#000000'] を参照）、
 * そのままだと二つ困る。
 *
 * - サイトの配色から外れる。地は紙、字は墨、差し色は 1 本という組みの中に、
 *   赤・青・緑・紫が同時に出る
 * - ダークモードで濃さが合わない。インライン style は外部 CSS より強いので、
 *   !important を撒かないと上書きできない
 *
 * そこでクラスへ移して、見た目は global.css に任せる。出力も小さくなる。
 *
 * 色は Typst 0.15 の既定テーマのもの。テーマや版が変われば増減するので、
 * 拾えなかった色は UNMAPPED に出す（呼び出し側が警告できる）。
 */

/** Typst 0.15 既定テーマの色と、意味の対応。 */
const TOKEN_CLASS: Readonly<Record<string, string>> = {
  '#74747c': 'tok-comment',
  '#d73948': 'tok-keyword',
  '#4b69c6': 'tok-fn',
  '#198810': 'tok-string',
  '#b60157': 'tok-num',
  '#1d6c76': 'tok-punct',
}

const COLORED_SPAN = /<span style="color: (#[0-9a-f]{6})">/g

export type MappedCode = {
  readonly html: string
  /** 対応の無かった色。Typst を上げたときに増える。 */
  readonly unmapped: readonly string[]
}

/**
 * `<span style="color: #xxxxxx">` をクラス付きの span に置き換える。
 * 対応の無い色はそのまま残す——消すと強調が失われ、気づけなくなる。
 */
export const mapCodeColors = (html: string): MappedCode => {
  const unmapped = new Set<string>()

  const mapped = html.replace(COLORED_SPAN, (whole, color: string) => {
    const cls = TOKEN_CLASS[color]
    if (cls === undefined) {
      unmapped.add(color)
      return whole
    }
    return `<span class="${cls}">`
  })

  return { html: mapped, unmapped: [...unmapped] }
}
