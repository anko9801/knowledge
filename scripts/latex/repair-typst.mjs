/**
 * pandoc が出した Typst を、Typst 0.15 が受け付ける形に直す。
 *
 * pandoc の Typst ライタは少し古い綴りを出すうえ、LaTeX 側で解決していた参照が
 * 宙に浮くことがある。ここはその後始末に徹する。
 */

/**
 * Typst 0.15 で名前が変わった記号。
 *
 * 語境界 \b は使えない。angle.r_S のように直後が `_` だと \b が成立せず、
 * 添字付きの記号を取りこぼす。後ろに英数字と `.` が続かないことで判定する。
 */
const boundary = (name) => new RegExp(`\\b${name.replace(/\./g, '\\.')}(?![a-zA-Z0-9.])`, 'g')

const SYMBOL_FIXUPS = [
  // ħ は 0.15 で planck 単体になった。
  [boundary('planck.reduce'), 'planck'],
  // 角括弧は chevron 系へ。angle は現在「∠」を指す別物。
  [boundary('angle.l.double'), 'chevron.l.double'],
  [boundary('angle.r.double'), 'chevron.r.double'],
  [boundary('angle.l'), 'chevron.l'],
  [boundary('angle.r'), 'chevron.r'],
  // 丸囲み演算子は <演算子>.o の形に統一された。
  [boundary('times.circle'), 'times.o'],
  [boundary('plus.circle'), 'plus.o'],
  [boundary('minus.circle'), 'minus.o'],
  [boundary('dot.circle'), 'dot.o'],
  [boundary('slash.circle'), 'slash.o'],
  // 共通部分。
  [boundary('sect.big'), 'inter.big'],
  [boundary('sect'), 'inter'],
]

/**
 * mat() の区切り指定。pandoc は Vmatrix に対して "||" を出すが、
 * Typst は 1 文字か記号しか受け付けない。
 */
const DELIMITER_FIXUPS = [
  [/delim:\s*"\|\|"/g, 'delim: bar.double'],
  [/delim:\s*"\(\("/g, 'delim: "("'],
]

/**
 * pandoc がエスケープした括弧の中のセミコロンを逃がす。
 *
 * Typst の数式では `;` が配列（行列の行）の区切りなので、
 * f(r, s; t) のような引数区切りがあると frac(...) が配列と解釈されて落ちる。
 * mat(1,2;3,4) の行区切りを壊さないよう、\( ... \) の内側だけを対象にする。
 */
const escapeArgumentSemicolons = (source) => {
  let out = ''
  let cursor = 0

  while (cursor < source.length) {
    const open = source.indexOf('\\(', cursor)
    if (open === -1) break

    // 対応する \) を、内側の括弧の深さを数えながら探す。
    // bold(r) のような入れ子があるので、単純な正規表現では届かない。
    let depth = 0
    let i = open + 2
    let close = -1

    while (i < source.length) {
      if (source.startsWith('\\(', i)) { depth += 1; i += 2; continue }
      if (source.startsWith('\\)', i)) {
        if (depth === 0) { close = i; break }
        depth -= 1
        i += 2
        continue
      }
      if (source[i] === '(') depth += 1
      else if (source[i] === ')') depth -= 1
      i += 1
    }

    // 対応が取れないものは諦めて次へ。ここで break すると、
    // 以降のセミコロンが丸ごと未処理のまま残る。
    if (close === -1) {
      out += source.slice(cursor, open + 2)
      cursor = open + 2
      continue
    }

    const inner = source.slice(open + 2, close)
    out += source.slice(cursor, open + 2)
    out += inner.replace(/(?<!\\);/g, '\\;')
    cursor = close
  }

  return out + source.slice(cursor)
}

/**
 * 数式の中の和文を立体テキストにまとめる。
 *
 * 元の LaTeX は align の中に説明文を直接書いている（\text{} で囲っていない）。
 * そのままだと 1 文字ずつ数式変数として組まれ、「波 を 特 徴 付 け る」のように
 * 字間が開いて読めなくなる。Typst の数式では引用符で囲むと立体テキストになる。
 */
const CJK = '\\u3040-\\u30FF\\u4E00-\\u9FFF\\u3005\\u30FC'

/**
 * 数式の中で 1 文字ずつバラされた和文を、立体テキストにまとめ直す。
 *
 * 元の LaTeX は align の中に説明文を直接書いている（\text{} で囲っていない）。
 * pandoc はそれを数式の変数列として出すため「波 を 特 徴 付 け る」と字間が開く。
 *
 * 判定に $ の対応付けは使わない。数式の内外を取り違えると本文まで引用符で包んで
 * しまうため。代わりに「和文が空白で区切られている」ことを手掛かりにする。
 * これは pandoc が数式内でだけ作る形で、通常の本文には現れない。
 */
const SPACED_CJK_RUN = new RegExp(`[${CJK}](?:[ \\t]+[${CJK}])+`, 'g')

const groupJapaneseInMath = (source) => {
  let grouped = 0

  const text = source.replace(SPACED_CJK_RUN, (run) => {
    grouped += 1
    return `"${run.replace(/[ \t]+/g, '')}"`
  })

  return { text, grouped }
}

/**
 * 制御文字を落とす。
 *
 * 元の .tex に紛れ込んだ U+0007 などがそのまま運ばれる。PDF は通るが
 * HTML export は「cannot be encoded in HTML」で止まるので、ここで除く。
 */
const stripControlCharacters = (source) =>
  // eslint-disable-next-line no-control-regex
  source.replace(/[\u0000-\u0008\u000B\u000C\u000E-\u001F\u007F]/g, '')

/** 空セルに対して pandoc が置く #none。mat の中では構文エラーになる。 */
const stripStrayNone = (source) => source.replace(/;\s*#none\s*\)/g, ')')

/**
 * 画像参照をサイト側に配置した実体へ向ける。
 *
 * 実体が無い参照は元リポジトリの時点で壊れている。ビルドを止めても直らないので、
 * 画像を落として説明文だけ残す。
 */
export const rewriteImages = (source, group, available) => {
  const missing = []

  const point = (name) => `/public/notes/${group}/assets/${name}`

  const text = source.replace(
    /#?(?:box|figure)?\(?image\("([^"]+)"([^)]*)\)/g,
    (whole, src) => {
      const name = src.replace(/^.*\//, '')
      if (available && !available.has(name)) {
        missing.push(name)
        return '#text(fill: gray)[（画像なし）]'
      }
      return whole.replace(`"${src}"`, `"${point(name)}"`)
    },
  )

  return { text, missing }
}

/**
 * 文書内で定義済みのラベルを集める。
 *
 * `#link(<foo>)` の中の <foo> は参照であって定義ではない。直前が `(` のものを
 * 除かないと、参照を定義と数えてしまい錨が張られない。
 */
const definedLabels = (source) => {
  const labels = new Set()
  for (const match of source.matchAll(/(?<!\()<([^<>\s][^<>]*)>/g)) labels.add(match[1])
  for (const match of source.matchAll(/(?<!\()#label\("([^"]+)"\)/g)) labels.add(match[1])
  return labels
}

/** 参照されているラベルを集める。 */
const referencedLabels = (source) => {
  const labels = new Set()
  for (const match of source.matchAll(/#(?:ref|link)\(label\("([^"]+)"\)\)/g)) {
    labels.add(match[1])
  }
  for (const match of source.matchAll(/#(?:ref|link)\(<([^<>]+)>\)/g)) labels.add(match[1])
  for (const match of source.matchAll(/(?:^|[^\w@])@([A-Za-z][\w:.-]*)/g)) labels.add(match[1])
  return labels
}

/**
 * 宙に浮いた参照に、見えない錨を用意する。
 *
 * LaTeX 側で \label が付いていた環境を pandoc が落とすと参照だけが残り、
 * 「label does not exist」でコンパイルが止まる。参照側の本文を削ると
 * 入れ子の括弧を壊しやすいので、足りないラベルの方を文末に足す。
 */
export const anchorDanglingLabels = (source) => {
  const defined = definedLabels(source)
  const dangling = [...referencedLabels(source)].filter((name) => !defined.has(name))

  if (dangling.length === 0) return { text: source, anchored: 0 }

  const anchors = dangling
    .map((name) =>
      /^[A-Za-z][\w:.-]*$/.test(name)
        ? `#metadata(none)<${name}>`
        : `#metadata(none)#label(${JSON.stringify(name)})`,
    )
    .join('\n')

  return {
    text: `${source}\n\n// 変換時に定義が失われた参照先。リンクを生かすための錨。\n${anchors}\n`,
    anchored: dangling.length,
  }
}

/**
 * 同じラベルが 2 回定義されているものを 1 回に減らす。
 *
 * 元の LaTeX が同じ \label を使い回していると、Typst では
 * 「occurs multiple times」で止まる。最初の 1 つを残す。
 */
export const dedupeLabels = (source) => {
  const seen = new Set()
  let removed = 0

  const text = source.replace(
    /(?<!\()(?:<([^<>\s][^<>]*)>|#label\("([^"]+)"\))/g,
    (whole, angle, quoted) => {
      const name = angle ?? quoted
      if (!seen.has(name)) {
        seen.add(name)
        return whole
      }
      removed += 1
      return ''
    },
  )

  return { text, removed }
}

/**
 * #ref は図表や数式しか参照できない。定義が別種のブロックだと
 * 「cannot reference block」で止まるので、汎用の #link に寄せる。
 */
const preferLinks = (source) =>
  source
    .replace(/#ref\(label\("([^"]+)"\)\)/g, (_, name) => `#link(label(${JSON.stringify(name)}))[${name}]`)
    .replace(/#ref\(<([^<>]+)>\)/g, (_, name) => `#link(<${name}>)[${name}]`)
    .replace(
      /(^|[^\w@])@([A-Za-z][\w:.-]*)/g,
      (_, lead, name) => `${lead}#link(<${name}>)[${name}]`,
    )

export const repairTypst = (source, { group, available }) => {
  const symbols = SYMBOL_FIXUPS.reduce(
    (text, [pattern, to]) => text.replace(pattern, to),
    stripControlCharacters(source),
  )
  const delimiters = DELIMITER_FIXUPS.reduce(
    (text, [pattern, to]) => text.replace(pattern, to),
    symbols,
  )
  const cleaned = escapeArgumentSemicolons(stripStrayNone(delimiters))
  const japanese = groupJapaneseInMath(cleaned)
  const images = rewriteImages(japanese.text, group, available)
  const deduped = dedupeLabels(images.text)
  const linked = preferLinks(deduped.text)
  const anchored = anchorDanglingLabels(linked)

  return {
    text: anchored.text,
    anchored: anchored.anchored,
    deduped: deduped.removed,
    japanese: japanese.grouped,
    missingImages: images.missing,
  }
}
