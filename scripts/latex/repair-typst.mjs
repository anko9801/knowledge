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
/*
 * 前後が和文でないことも条件に入れる。これが無いと「損失 陽子」のような
 * 通常の分かち書きで「失 陽」を拾い、語の途中に引用符が入る。
 * 数式内でバラされた和文は 1 文字ずつ独立しているので、この条件を満たす。
 */
const SPACED_CJK_RUN = new RegExp(
  `(?<![${CJK}])[${CJK}](?:[ \\t]+[${CJK}])+(?![${CJK}])`,
  'g',
)

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

/**
 * 証明環境の QED 記号の残骸。単独行の「0◻」として残り、本文に紛れる。
 * 証明の終わりは theorem.typ 側が描くので、ここでは落とす。
 */
const stripQedResidue = (source) =>
  source
    // 単独行のもの
    .replace(/^[ \t]*0?◻[ \t]*$/gm, '')
    // 数式ブロックに取り込まれたものは記号だけ落とす。
    // $ ごと消すと数式の対応が崩れる。
    .replace(/0?◻/g, '')

/**
 * 定理などに題名が付いていないとき、pandoc は空の括弧を残す。
 *
 *   #strong[定理 2] ().   ->   #strong[定理 2].
 *
 * 括弧だけが浮いて壊れて見えるので畳む。
 */
const dropEmptyTitles = (source) =>
  source.replace(/(#strong\[[^\]]*\])\s*\(\)\s*(\.?)/g, '$1$2')

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
      // HTML では <img> を出したい。image() のままだと base64 で埋め込まれ、
      // 写真のあるページが 10MB を超える。
      return whole
        .replace(`"${src}"`, `"${point(name)}"`)
        .replace(/\bimage\(/, 'web-image(')
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
 * 参照の書き方を、参照先の種類に応じて決める。
 *
 * Typst の @label は数式・図表・見出しにしか使えない。pandoc は定理などを
 * #block[...] に落とすので、そこへの @label は「cannot reference block」で
 * 止まる。一方で数式への参照は @label のままにしないと採番が出ず、
 * ラベル名がそのまま本文に出てしまう（tilde-E のように読めない文字列になる）。
 *
 * そこでラベルの直前を見て、参照可能なものは @ のまま、それ以外は #link、
 * 定義が無いものは素のテキストにする。
 */
const referenceableLabels = (source) => {
  const labels = new Set()

  // $ ... $<name> は数式。= 見出し の直後の <name> は見出し。
  for (const match of source.matchAll(/\$\s*<([^<>\s]+)>/g)) labels.add(match[1])
  for (const match of source.matchAll(/^=+ .*\n<([^<>\s]+)>/gm)) labels.add(match[1])
  for (const match of source.matchAll(/#figure\([\s\S]*?\)\s*<([^<>\s]+)>/g)) {
    labels.add(match[1])
  }
  // 主張（theorem.typ の figure）に付いたラベルは statementLabels が返す。
  // ここで正規表現から推測すると、直前に主張があるだけの無関係なラベルまで
  // 参照可能とみなしてしまい「cannot reference block」で落ちる。

  return labels
}

const preferLinks = (source, extraReferenceable = new Set()) => {
  const defined = definedLabels(source)
  const referenceable = new Set([...referenceableLabels(source), ...extraReferenceable])

  const render = (name, body) => {
    if (referenceable.has(name)) return `@${name}`
    if (defined.has(name)) return `#link(<${name}>)[${body ?? name}]`
    // 参照先が失われたものは、ラベル名を晒さず本文だけ残す。
    return body ?? ''
  }

  return source
    .replace(/#ref\(label\("([^"]+)"\)\)/g, (_, name) => render(name))
    .replace(/#ref\(<([^<>]+)>\)/g, (_, name) => render(name))
    .replace(/#link\(label\("([^"]+)"\)\)\[([^\]]*)\]/g, (_, name, body) => render(name, body))
    .replace(/(^|[^\w@])@([A-Za-z][\w:.-]*)/g, (_, lead, name) => `${lead}${render(name)}`)
}

/**
 * pandoc が変換を諦めて残した生の TeX を、読める体裁に包む。
 *
 * 残るのは可換図式や Feynman 図で、数式ではないため自動変換の手段がない。
 * 素のまま出すと $$\\begin{tikzcd} が本文に露出するので、
 * 「変換できなかった」と明示したうえで元の LaTeX を併記する。
 */
export const wrapUnconvertedTex = (source) => {
  let wrapped = 0

  const text = source.replace(/\\\$\\\$([\s\S]*?)\\\$\\\$/g, (_whole, body) => {
    wrapped += 1

    const tex = body
      .replace(/\\([\\$&%#_{}~^[\]"])/g, '$1')
      .replace(/\r/g, '')
      .trim()

    // 素で置くと 20 行の \feynmandiagram が本文の途中に居座る。
    // theorem.typ の #unconverted が畳んで、取りに行った人にだけ開く。
    return `#unconverted(${JSON.stringify(tex)})`
  })

  return { text, wrapped }
}

/**
 * preprocess が付けた印をもとに、pandoc の #block[...] を
 * テンプレートの主張関数（#theorem など）に組み替える。
 *
 * これで採番と相互参照が Typst 側の責任になる。pandoc が本文に焼き付けた
 * 「定理 1」という文字列は捨てる。番号は figure の counter が振る。
 */
const fromHex = (hex) =>
  hex.length === 0
    ? ''
    : Buffer.from(hex.match(/../g).map((b) => parseInt(b, 16))).toString('utf8')

/**
 * pandoc が本文の頭に置く見出し。
 * 「#strong[定理 1] (題名). \」のような形で、番号まで文字列で入っている。
 */
const PANDOC_HEAD = /^\s*#strong\[[^\]]*\]\s*(?:\([^)]*\))?\s*\.?\s*(?:\\)?\s*/

const START_MARK = /ZZSTMTZZ([a-z]+)ZZ([0-9a-f]*)ZZ/
const END_MARK = /ZZENDZZ([a-z]+)ZZ/

/**
 * 主張の呼び出しの直後に置かれたラベルを集める。
 *
 * 主張は figure なので @label で参照できる。呼び出しの閉じ括弧を数えて、
 * その直後にあるものだけを拾う。位置を数えずに正規表現で近似すると、
 * 無関係なラベルまで参照可能とみなして「cannot reference block」で落ちる。
 */
export const statementLabels = (source) => {
  const labels = new Set()
  const call =
    /#(?:axiom|corollary|definition|example|lemma|proof|proposition|remark|theorem)(?:\([^)]*\))?\[/g

  for (const match of source.matchAll(call)) {
    const open = match.index + match[0].length - 1
    let depth = 0
    let i = open

    for (; i < source.length; i += 1) {
      if (source[i] === '\\') { i += 1; continue }
      if (source[i] === '[') depth += 1
      else if (source[i] === ']') {
        depth -= 1
        if (depth === 0) break
      }
    }

    const after = source.slice(i + 1).match(/^\s*<([^<>\s]+)>/)
    if (after) labels.add(after[1])
  }

  return labels
}

export const rebuildStatements = (source) => {
  let text = source
  let rebuilt = 0

  // 内側から畳む。証明が定理の中に入ることがあるため、
  // 始まりの印に最も近い終わりの印を相方とみなす。
  for (;;) {
    const start = text.search(START_MARK)
    if (start === -1) break

    const head = text.slice(start).match(START_MARK)
    const bodyStart = start + head[0].length

    const rest = text.slice(bodyStart)
    const tail = rest.match(END_MARK)
    if (!tail) {
      // 相方が無い印は消すだけにして、次へ進む。
      text = text.slice(0, start) + rest
      continue
    }

    const variant = head[1]
    const title = fromHex(head[2])
    const inner = rest.slice(0, tail.index).replace(PANDOC_HEAD, '').trim()
    const after = rest.slice(tail.index + tail[0].length)

    const call =
      variant === 'proof'
        ? `#proof[\n${inner}\n]`
        : title
          ? `#${variant}(${JSON.stringify(title)})[\n${inner}\n]`
          : `#${variant}[\n${inner}\n]`

    text = `${text.slice(0, start)}${call}${after}`
    rebuilt += 1
  }

  return { text, rebuilt }
}

/**
 * pandoc が主張の周りに残した #block[...] を外す。
 * 中身が主張の呼び出しひとつだけなら、二重の入れ物になるので畳む。
 */
const STATEMENT_CALL =
  '#(?:axiom|corollary|definition|example|lemma|proof|proposition|remark|theorem)(?:\\([^)]*\\))?\\[[\\s\\S]*?\\n\\]'

// pandoc は見出しを印より前、#block[ の内側に置く。
// 「#block[ #strong[定理 1]. \ #theorem(...)[...] ]」という形になるので、
// 囲みを外すときに見出しも一緒に落とす。番号は figure の counter が振り直す。
/**
 * 主張の呼び出しの直前に残った pandoc の見出しを落とす。
 *
 * 「#strong[定理 8]. \」のように番号が文字列で焼き付いている。番号は
 * figure の counter が振り直すので、ここに残っていると二重に出る。
 * #block[ の閉じ位置は一定でないため、囲みの構造には依存しない。
 */
const dropBakedHeadings = (source) =>
  source.replace(
    new RegExp(
      `#strong\\[[^\\]]*\\]\\s*(?:\\([^)]*\\))?\\s*\\.?\\s*(?:\\\\)?\\s*(?=#(?:axiom|corollary|definition|example|lemma|proof|proposition|remark|theorem)[\\[(])`,
      'g',
    ),
    '',
  )

const unwrapStatementBlocks = (source) =>
  source.replace(
    new RegExp(
      `#block\\[\\s*(?:#strong\\[[^\\]]*\\]\\s*(?:\\([^)]*\\))?\\s*\\.?\\s*(?:\\\\)?\\s*)?(${STATEMENT_CALL})\\s*\\]`,
      'g',
    ),
    '$1',
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
  const cleaned = dropEmptyTitles(
    stripQedResidue(escapeArgumentSemicolons(stripStrayNone(delimiters))),
  )
  const japanese = groupJapaneseInMath(cleaned)
  const images = rewriteImages(japanese.text, group, available)
  const deduped = dedupeLabels(images.text)

  // 主張を先に組み替える。#block[...] のままだと参照可能かどうかを
  // 判定できず、定理へのリンクがラベル名のまま本文に出る。
  const statements = rebuildStatements(deduped.text)
  statements.text = unwrapStatementBlocks(dropBakedHeadings(statements.text))

  const linked = preferLinks(statements.text, statementLabels(statements.text))
  const anchored = anchorDanglingLabels(linked)
  const unconverted = wrapUnconvertedTex(anchored.text)

  return {
    text: unconverted.text,
    statements: statements.rebuilt,
    unconverted: unconverted.wrapped,
    anchored: anchored.anchored,
    deduped: deduped.removed,
    japanese: japanese.grouped,
    missingImages: images.missing,
  }
}
