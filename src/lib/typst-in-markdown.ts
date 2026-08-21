/**
 * Markdown に混ざった Typst 記法を見つける。
 *
 * `.typ` と `.md` を行き来して書いていると、記法が漏れる。二度踏んだ。
 *
 *   docs に `$g approx 0.32$` と書いた   → Markdown では描画されない
 *   docs に `#strong[...]` と書いた      → そのまま文字として出る
 *
 * どちらも生成物を見ないと気づけないので、機械で止める。`npm test` から
 * 実ファイルにも当てている（`typst-in-markdown.test.ts`）。
 *
 * 囲みコードとインラインコードは除く。あそこに Typst を書くのは正しい。
 */

export type Finding = {
  /** 1 始まり。 */
  readonly line: number
  readonly text: string
}

/** Typst の関数呼び出し。`#name[` か `#name(`。 */
const CALL = /#(strong|emph|link|text|let|import|show|set|check|definition|theorem|lemma|proposition|corollary|example|remark|proof|diagram|layer|table|figure|grid|place|box)\s*[[(]/

/**
 * 数式の中で Typst にしか無い綴り。
 *
 * LaTeX なら `\sigma`、`\approx` とバックスラッシュが付く。裸で出たら Typst である。
 */
const MATH = new RegExp(
  '\\b(?:approx|equiv|arrow|times\\.o|in\\.not|subset\\.eq|thin|dif|bold|upright|frac|' +
    'alpha|beta|gamma|delta|epsilon|zeta|eta|theta|iota|kappa|lambda|mu|nu|xi|' +
    'pi|rho|sigma|tau|phi|chi|psi|omega|Gamma|Delta|Theta|Lambda|Sigma|Phi|Psi|Omega)\\b',
)

/** 囲みコードとインラインコードを、行数を保ったまま伏せる。 */
const veil = (text: string): readonly string[] => {
  const lines = text.split('\n')
  let fenced = false

  return lines.map((line) => {
    if (/^\s*```/.test(line)) {
      fenced = !fenced
      return ''
    }
    if (fenced) return ''
    return line.replace(/`[^`]*`/g, '')
  })
}

export const typstInMarkdown = (text: string): readonly Finding[] => {
  const found: Finding[] = []

  veil(text).forEach((line, index) => {
    if (CALL.test(line)) {
      found.push({ line: index + 1, text: line.trim() })
      return
    }
    for (const math of line.matchAll(/\$([^$]+)\$/g)) {
      if (MATH.test(math[1] as string)) {
        found.push({ line: index + 1, text: line.trim() })
        return
      }
    }
  })

  return found
}
