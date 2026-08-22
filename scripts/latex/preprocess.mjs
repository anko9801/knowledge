/**
 * LaTeXML に食わせる前に .tex を整える。
 *
 * physics2 の \ab は「次に来る区切り記号を自動で伸縮させる」マクロで、
 * 引数が波括弧で囲まれていない。LaTeXML の束縛では引数境界を決められないため、
 * ここで対応する閉じ記号まで走査して \left ... \right に開いておく。
 *
 * 特に \ab<x> は期待値 ⟨x⟩ を意味する。素通しすると不等号になって意味が変わるので、
 * この変換は見た目の問題ではなく正しさの問題。
 */

/** \ab の直後に来る開き記号と、その相方。 */
const DELIMITERS = [
  { open: '(', close: ')', left: '\\left(', right: '\\right)' },
  { open: '[', close: ']', left: '\\left[', right: '\\right]' },
  { open: '\\{', close: '\\}', left: '\\left\\{', right: '\\right\\}' },
  { open: '<', close: '>', left: '\\left\\langle ', right: '\\right\\rangle ' },
  { open: '|', close: '|', left: '\\left\\lvert ', right: '\\right\\rvert ' },
  { open: '\\|', close: '\\|', left: '\\left\\lVert ', right: '\\right\\rVert ' },
  // 名前付きの区切り記号。\ab\lbrace ... \rbrace の形が使われている。
  { open: '\\lbrace', close: '\\rbrace', left: '\\left\\{', right: '\\right\\}' },
  { open: '\\langle', close: '\\rangle', left: '\\left\\langle ', right: '\\right\\rangle ' },
  { open: '\\lvert', close: '\\rvert', left: '\\left\\lvert ', right: '\\right\\rvert ' },
  { open: '\\lVert', close: '\\rVert', left: '\\left\\lVert ', right: '\\right\\rVert ' },
  { open: '\\lceil', close: '\\rceil', left: '\\left\\lceil ', right: '\\right\\rceil ' },
  { open: '\\lfloor', close: '\\rfloor', left: '\\left\\lfloor ', right: '\\right\\rfloor ' },
  { open: '\\lbrack', close: '\\rbrack', left: '\\left[', right: '\\right]' },
]

const isEscaped = (source, index) => {
  let backslashes = 0
  for (let i = index - 1; i >= 0 && source[i] === '\\'; i -= 1) backslashes += 1
  return backslashes % 2 === 1
}

/** index から始まる開き記号を探す。見つからなければ null。 */
const matchOpen = (source, index) => {
  for (const delimiter of DELIMITERS) {
    if (source.startsWith(delimiter.open, index)) return delimiter
  }
  return null
}

/**
 * 開き記号の直後から、対応する閉じ記号の位置を返す。
 *
 * 波括弧のネストと、同種の区切り記号のネストを数える。
 * `|` のように開きと閉じが同じ記号のものはネストできないので、最初の一致で閉じる。
 */
const CONTROL_SEQUENCE = /^\\([a-zA-Z@]+|.)/

const findClose = (source, start, delimiter) => {
  const symmetric = delimiter.open === delimiter.close
  let braces = 0
  let depth = 0
  let i = start

  while (i < source.length) {
    // 区切り記号の判定を制御綴の読み飛ばしより先に行う。
    // そうしないと \} や \| が「ただの制御綴」として素通りしてしまう。
    if (braces === 0 && source.startsWith(delimiter.close, i)) {
      if (depth === 0) return i
      depth -= 1
      i += delimiter.close.length
      continue
    }

    // `|` のように開きと閉じが同じ記号のものはネストを数えない。
    if (braces === 0 && !symmetric && source.startsWith(delimiter.open, i)) {
      depth += 1
      i += delimiter.open.length
      continue
    }

    if (source[i] === '\\') {
      const control = CONTROL_SEQUENCE.exec(source.slice(i))
      i += control ? control[0].length : 1
      continue
    }

    if (source[i] === '{') braces += 1
    else if (source[i] === '}') braces -= 1

    i += 1
  }

  return -1
}

/**
 * \ab を \left ... \right に展開する。
 * 対応が取れなかった箇所は書き換えずに残し、件数を返す。
 */
/**
 * 自動伸縮括弧のマクロ。physics2 の \ab と physics(v1) の \qty は
 * 引数の取り方が同じなので同じ処理でよい。
 */
const AUTO_BRACKET_MACROS = ['ab', 'qty']

export const expandAutoBrackets = (source, macro = 'ab') => {
  const token = `\\${macro}`
  let out = ''
  let cursor = 0
  let expanded = 0
  let unmatched = 0

  while (cursor < source.length) {
    const hit = source.indexOf(token, cursor)
    if (hit === -1) break

    // \abs のような別マクロを巻き込まない。
    const after = source[hit + token.length]
    if (after !== undefined && /[a-zA-Z@]/.test(after)) {
      out += source.slice(cursor, hit + token.length)
      cursor = hit + token.length
      continue
    }

    if (isEscaped(source, hit)) {
      out += source.slice(cursor, hit + token.length)
      cursor = hit + token.length
      continue
    }

    let probe = hit + token.length
    while (probe < source.length && /\s/.test(source[probe])) probe += 1

    // 波括弧形式（\qty{x}）は中括弧そのものを表す。グループとして読む。
    if (source[probe] === '{') {
      const group = readGroup(source, probe)
      if (group) {
        const inner = expandAutoBrackets(group.text, macro)
        out += source.slice(cursor, hit)
        out += `\\left\\{${inner.text}\\right\\}`
        cursor = group.end
        expanded += 1 + inner.expanded
        unmatched += inner.unmatched
        continue
      }
    }

    const delimiter = matchOpen(source, probe)
    if (!delimiter) {
      out += source.slice(cursor, hit + token.length)
      cursor = hit + token.length
      continue
    }

    const bodyStart = probe + delimiter.open.length
    const closeAt = findClose(source, bodyStart, delimiter)
    if (closeAt === -1) {
      unmatched += 1
      out += source.slice(cursor, hit + token.length)
      cursor = hit + token.length
      continue
    }

    // 中身にも同じマクロが入りうるので再帰する。
    const inner = expandAutoBrackets(source.slice(bodyStart, closeAt), macro)

    out += source.slice(cursor, hit)
    out += delimiter.left
    out += inner.text
    out += delimiter.right
    cursor = closeAt + delimiter.close.length
    expanded += 1 + inner.expanded
    unmatched += inner.unmatched
  }

  out += source.slice(cursor)
  return { text: out, expanded, unmatched }
}

/**
 * LaTeXML が扱えないプリアンブル命令を落とす。
 * 本文には影響しないが、残すと出力にエラーマーカーが混ざる。
 */
// 行頭に無いこともある（\usepackage{tikz}\usetikzlibrary{cd} のように続けて書かれる）ので
// 行アンカーは付けない。
const PREAMBLE_NOISE = [
  /\\usetikzlibrary\{[^}]*\}/g,
  /\\lstlanguagefiles\{[^}]*\}/g,
  /\\tcbuselibrary\{[^}]*\}/g,
  /\\lstset\{(?:[^{}]|\{[^{}]*\})*\}/g,
  // xy は 28 ファイルが読み込むが xymatrix の使用は 0 件。読み込むだけで
  // LaTeXML の内部束縛がエラーを出すので、使っていない以上落とす。
  /\\usepackage\{xy\}/g,
]

/**
 * pandoc が知らない環境・命令を、意味の同じ標準的なものに置き換える。
 *
 * dcases は mathtools の display 版 cases。1 箇所でも残ると
 * その数式ブロックごと生の TeX になるため、160 箇所の影響は大きい。
 */
/** \label / \ref の中の空白とドットは pandoc が受け付けない。 */
/**
 * 数式環境の中の \ref を素の記号にする。
 *
 * pandoc の数式パーサは \ref を受け付けない。1 箇所あるとブロックごと
 * 生の TeX になるので、参照としては諦めて見た目だけ残す。
 */
const MATH_ENVIRONMENTS = /\\begin\{(align\*?|aligned|alignat\*?|equation\*?|gather\*?|cases|dcases|multline\*?)\}([\s\S]*?)\\end\{\1\}/g

/** \text / \textrm などの本文群。 */
// 長い名前から並べる。text を先に置くと textrm の rm が取り残される。
const TEXT_GROUP = /\\(?:textrm|textbf|textit|textsf|textnormal|mbox|text)\s*\{(?:[^{}]|\{[^{}]*\})*\}/g

/**
 * テキスト群の中の裸の数式マクロを $ で囲む。
 * \textrm{... \bm{L} ...} のように書かれていると pandoc が解釈できない。
 */
const wrapMathInText = (group) =>
  group.replace(
    /\\([a-zA-Z]{2,})((?:\{(?:[^{}]|\{[^{}]*\})*\})?)/g,
    (whole, name, arg, offset) =>
      // 群そのものの名前は囲まない。
      offset === 0 ? whole : `$\\${name}${arg}$`,
  )

export const stripReferencesInMath = (source) => {
  let stripped = 0
  const text = source.replace(MATH_ENVIRONMENTS, (_whole, env, body) => {
    const parked = []
    const guarded = body.replace(TEXT_GROUP, (group) => {
      parked.push(wrapMathInText(group))
      return `\uE400${parked.length - 1}\uE401`
    })

    const cleaned = guarded
      .replace(/\\(?:eq)?ref\{([^{}]*)\}/g, (_, name) => {
        stripped += 1
        return `\\mathrm{${name}}`
      })
      // 数式環境の中の $ の扱いは 2 通りに分かれる。
      //
      //   array の中の $\in$   -> $ を外す。中身はもともと数式なのでそのまま通る。
      //   \textrm{... \bm{L} ...} -> 逆に $ で囲む。テキスト群の中では数式マクロが
      //                              裸だと pandoc が解釈できない。
      //
      // まずテキスト群を退避してから $ を外し、退避した中で数式マクロを囲む。
      .replace(/\$/g, () => {
        stripped += 1
        return ''
      })
    const restored = cleaned.replace(
      /\uE400(\d+)\uE401/g,
      (_, index) => parked[Number(index)],
    )

    return `\\begin{${env}}${restored}\\end{${env}}`
  })

  return { text, stripped }
}

/**
 * ラベル名を Typst の <...> に収まる形にする。
 *
 * 元の LaTeX には「Q17-3. iii 1」「Q21-1(i)」のような名前があり、
 * 空白・ドット・括弧が混ざる。そのままだと Typst のラベル構文が閉じられない。
 */
const sanitizeLabel = (name) =>
  name
    .replace(/[^A-Za-z0-9_:-]+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
    .replace(/^(?![A-Za-z])/, 'L-') || 'label'

export const normalizeLabels = (source) =>
  source.replace(
    /\\(label|ref|eqref|autoref)\{([^{}]*)\}/g,
    (_, command, name) => `\\${command}{${sanitizeLabel(name)}}`,
  )

const EQUIVALENTS = [
  [/\\begin\{dcases\}/g, '\\begin{cases}'],
  [/\\end\{dcases\}/g, '\\end{cases}'],
  [/\\begin\{drcases\}/g, '\\begin{cases}'],
  [/\\end\{drcases\}/g, '\\end{cases}'],
  [/\\begin\{rcases\}/g, '\\begin{cases}'],
  [/\\end\{rcases\}/g, '\\end{cases}'],
  // 標準にない大きさ。1 段階小さいものへ。
  [/\\Biggg(?![a-zA-Z@])/g, '\\Bigg'],
  [/\\biggg(?![a-zA-Z@])/g, '\\bigg'],
  [/\\eqref(?![a-zA-Z@])/g, '\\ref'],
  // 度記号は文字そのものにする。^\\circ にすると \\textrm{} の中で壊れる。
  [/\\textdegree(?![a-zA-Z@])/g, '°'],
  [/\\begin\{cases\*\}/g, '\\begin{cases}'],
  [/\\end\{cases\*\}/g, '\\end{cases}'],
  // 数式内の回転は写せない。中身だけ残す。
  [/\\rotatebox\{[^{}]*\}\{((?:[^{}]|\{[^{}]*\})*)\}/g, '$1'],
  [/\\kern\s*-?[\d.]+\s*(?:pt|em|ex|mm|cm|in)/g, ''],
  // 証明終わりの位置指定。証明環境ごと作り直すので不要。
  [/\\qedhere(?![a-zA-Z@])/g, ''],
  [/\\qed(?![a-zA-Z@])/g, ''],
  // TeX の原始命令。数式の意味には関わらないので落とす。
  [/\\raise\s*-?[\d.]+\s*(?:pt|em|ex|mm|cm|in)\s*\\hbox/g, ''],
  [/\\raise\s*-?[\d.]+\s*(?:pt|em|ex|mm|cm|in)/g, ''],
  // diffcoeff の「〜で評価」記法。棒は落として本体だけ残す。
  [/\\diffp\s*\.\|\.\s*/g, '\\diffp'],
  [/\\diff\s*\.\|\.\s*/g, '\\diff'],
  [/\\pxmat(\[[^\]]*\])?/g, '\\mqty'],
]

export const normalizeEquivalents = (source) => {
  let replaced = 0

  // 後方参照つきの置換もあるので、関数置換の中で自前で展開する。
  // 単に文字列を返すと $1 がそのまま残る。
  const text = EQUIVALENTS.reduce((acc, [pattern, to]) => {
    return acc.replace(pattern, (...args) => {
      replaced += 1
      return to.replace(/\$(\d)/g, (_, index) => args[Number(index)] ?? '')
    })
  }, source)

  return { text, replaced }
}

export const stripPreambleNoise = (source) =>
  PREAMBLE_NOISE.reduce((text, pattern) => text.replace(pattern, ''), source)

/**
 * physics2 の ab.braket モジュールは、波括弧ではなく区切り記号で引数を取る。
 *
 *   \ket|psi>      ->  |psi⟩
 *   \bra<psi|      ->  ⟨psi|
 *   \braket<a|b>   ->  ⟨a|b⟩
 *
 * LaTeXML が持つ physics(v1) の束縛は \ket{psi} 形式を期待するので、
 * このままだと引数の取り方がずれて環境の対応まで崩れる。
 * 名前の長い順に見ないと \braket が \bra として食われる。
 */
const BRAKETS = [
  {
    name: 'braket',
    open: '<',
    close: '>',
    left: '\\left\\langle ',
    right: '\\right\\rangle ',
    separated: true,
  },
  { name: 'ketbra', open: '|', close: '|', left: '\\left\\lvert ', right: '\\right\\rvert ' },
  { name: 'ket', open: '|', close: '>', left: '\\left\\lvert ', right: '\\right\\rangle ' },
  { name: 'bra', open: '<', close: '|', left: '\\left\\langle ', right: '\\right\\rvert ' },
]

/**
 * 区切り記号は入れ子にならないので、波括弧の外に出てくる最初の閉じ記号で切る。
 * \bra<f|V\ket|i> が \bra<f| で正しく切れるのはこの規則による。
 */
const findBraketClose = (source, start, close) => {
  let braces = 0
  let i = start

  while (i < source.length) {
    if (braces === 0 && source[i] === close) return i

    if (source[i] === '\\') {
      const control = CONTROL_SEQUENCE.exec(source.slice(i))
      i += control ? control[0].length : 1
      continue
    }

    if (source[i] === '{') braces += 1
    else if (source[i] === '}') braces -= 1

    i += 1
  }

  return -1
}

/** ⟨a|b⟩ の中の縦棒だけを仕切りに変える。波括弧の中のものは触らない。 */
const markSeparator = (body) => {
  let braces = 0
  let out = ''

  for (let i = 0; i < body.length; i += 1) {
    if (body[i] === '\\') {
      const control = CONTROL_SEQUENCE.exec(body.slice(i))
      const length = control ? control[0].length : 1
      out += body.slice(i, i + length)
      i += length - 1
      continue
    }

    if (body[i] === '{') braces += 1
    else if (body[i] === '}') braces -= 1

    out += braces === 0 && body[i] === '|' ? '\\middle\\vert ' : body[i]
  }

  return out
}

export const expandBrakets = (source) => {
  let out = ''
  let cursor = 0
  let expanded = 0
  let unmatched = 0

  while (cursor < source.length) {
    let best = null

    for (const kind of BRAKETS) {
      const token = `\\${kind.name}`
      const at = source.indexOf(token, cursor)
      if (at === -1) continue

      // \bra が \braket を食わないように、直後が英字なら別マクロとみなす。
      const after = source[at + token.length]
      if (after !== undefined && /[a-zA-Z@]/.test(after)) continue
      if (isEscaped(source, at)) continue
      if (source[at + token.length] !== kind.open) continue
      if (!best || at < best.at) best = { at, kind }
    }

    if (!best) break

    const { at, kind } = best
    const bodyStart = at + kind.name.length + 2
    const closeAt = findBraketClose(source, bodyStart, kind.close)

    if (closeAt === -1) {
      unmatched += 1
      out += source.slice(cursor, bodyStart)
      cursor = bodyStart
      continue
    }

    const body = source.slice(bodyStart, closeAt)
    out += source.slice(cursor, at)
    out += kind.left
    out += kind.separated ? markSeparator(body) : body
    out += kind.right
    cursor = closeAt + 1
    expanded += 1
  }

  out += source.slice(cursor)
  return { text: out, expanded, unmatched }
}

/**
 * diffcoeff の微分マクロを素の LaTeX に展開する。
 *
 *   \diff[n]{f}{x}  ->  \frac{\mathrm{d}^{n} f}{\mathrm{d} x^{n}}
 *   \diffp[n]{f}{x} ->  \frac{\partial^{n} f}{\partial x^{n}}
 *   \dl[n]{x}       ->  \mathrm{d}^{n} x
 *
 * LaTeXML 向けだけなら束縛で足りるが、pandoc 経由で Typst に変換する経路では
 * 束縛が効かない。素の LaTeX に均しておけば、どちらの下流でも同じ結果になる。
 */
const DERIVATIVES = [
  { name: 'diffp', d: '\\partial' },
  { name: 'diff', d: '\\mathrm{d}' },
  // physics(v1) 側。綴りが違うだけで意味は同じ。
  { name: 'pdv', d: '\\partial' },
  { name: 'dv', d: '\\mathrm{d}' },
]

/** { から始まる引数を 1 つ読む。 */
const readGroup = (source, start) => {
  if (source[start] !== '{') return null
  let braces = 1
  let i = start + 1

  while (i < source.length && braces > 0) {
    if (source[i] === '\\') { i += 2; continue }
    if (source[i] === '{') braces += 1
    else if (source[i] === '}') braces -= 1
    i += 1
  }

  return braces === 0 ? { text: source.slice(start + 1, i - 1), end: i } : null
}

/** [n] の形の任意引数を読む。無ければ null。 */
const readOptional = (source, start) => {
  if (source[start] !== '[') return null
  const close = source.indexOf(']', start)
  return close === -1 ? null : { text: source.slice(start + 1, close), end: close + 1 }
}

export const expandDerivatives = (source, skip = new Set()) => {
  let text = source
  let expanded = 0

  for (const { name, d } of DERIVATIVES) {
    if (skip.has(name)) continue
    const token = `\\${name}`
    let out = ''
    let cursor = 0

    while (cursor < text.length) {
      const hit = text.indexOf(token, cursor)
      if (hit === -1) break

      const after = text[hit + token.length]
      if (after !== undefined && /[a-zA-Z@]/.test(after)) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      const optional = readOptional(text, hit + token.length)
      const first = readGroup(text, optional ? optional.end : hit + token.length)
      const second = first ? readGroup(text, first.end) : null

      if (!first) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      // \dv{f}{x} は df/dx、\dv{x} は演算子としての d/dx。
      // 引数が 1 つのときは分子を空にする。
      const numerator = second ? first.text : ''
      const variable = second ? second.text : first.text
      const end = second ? second.end : first.end

      const order = optional && optional.text ? `^{${optional.text}}` : ''
      out += text.slice(cursor, hit)
      out += `\\frac{${d}${order} ${numerator}}{${d} ${variable}${order}}`
      cursor = end
      expanded += 1
    }

    text = out + text.slice(cursor)
  }

  // \dl[n]{x} は分数ではなく微分要素。
  let out = ''
  let cursor = 0
  while (cursor < text.length) {
    const hit = text.indexOf('\\dl', cursor)
    if (hit === -1) break

    const after = text[hit + 3]
    if (after !== undefined && /[a-zA-Z@]/.test(after)) {
      out += text.slice(cursor, hit + 3)
      cursor = hit + 3
      continue
    }

    const optional = readOptional(text, hit + 3)
    const start = optional ? optional.end : hit + 3
    let argument = readGroup(text, start)

    // \dl V のように波括弧を使わない形もある。次の 1 トークンを引数とみなす。
    if (!argument) {
      const bare = /^\s*(\\[a-zA-Z@]+|[A-Za-z0-9])/.exec(text.slice(start))
      if (bare) argument = { text: bare[1], end: start + bare[0].length }
    }

    if (!argument) {
      out += text.slice(cursor, hit + 3)
      cursor = hit + 3
      continue
    }

    const order = optional && optional.text ? `^{${optional.text}}` : ''
    out += text.slice(cursor, hit)
    // 引数を波括弧で残す。\dl{\omega}g(...) が \mathrm{d}\omegag(...) と
    // 繋がって存在しないマクロ名になるため。
    //
    // 直前に細空きを入れる。積分の微分要素は LaTeX でも \, を挟むのが慣習で、
    // 入れないと ρ(r,t)dr のように直前へ貼り付いて読みにくい。
    out += `\\,\\mathrm{d}${order}{${argument.text}}`
    cursor = argument.end
    expanded += 1
  }

  return { text: out + text.slice(cursor), expanded }
}

/**
 * mhchem の \ce{...} を素の数式に落とす。
 *
 * LaTeXML に mhchem の束縛が無く、化学式がまるごとエラーになる。
 * 完全な mhchem 構文は解釈せず、講義ノートに出てくる範囲だけ扱う:
 * 元素記号の後ろの数字を下付きに、電荷を上付きに、矢印を記号に置き換える。
 */
const ARROWS = [
  ['<->', '\\rightleftharpoons '],
  ['->', '\\rightarrow '],
  ['<-', '\\leftarrow '],
]

const chemistry = (formula) => {
  // 矢印と既存の制御綴を退避する。先に \mathrm を掛けると
  // \rightarrow の綴りまで元素記号として包んでしまう。
  const parked = []
  const park = (text) => {
    parked.push(text)
    return ` ${parked.length - 1} `
  }

  let work = formula
  for (const [symbol, replacement] of ARROWS) {
    work = work.split(symbol).join(park(replacement))
  }
  work = work.replace(/\\[a-zA-Z]+/g, (control) => park(control))

  work = work
    // H2O の 2 のように、元素記号や閉じ括弧の直後に来る数字は下付き。
    .replace(/([A-Za-z)\]])(\d+)/g, '$1_{$2}')
    // ^2+ / ^- のような電荷。
    .replace(/\^(\d*[+-])/g, '^{$1}')
    .replace(/([A-Za-z]+)/g, '\\mathrm{$1}')

  return work.replace(/ (\d+) /g, (_, index) => parked[Number(index)])
}

/**
 * physics(v1) のベクトル解析マクロ。単純な置換で足りる。
 * \div は素の LaTeX では除算記号だが、この講義ノートは physics を読み込んでおり
 * 発散の意味で使っている。
 */
const VECTOR_OPERATORS = [
  [/\\laplacian(?![a-zA-Z@])/g, '\\nabla^{2}', 'laplacian'],
  [/\\grad(?![a-zA-Z@])/g, '\\nabla', 'grad'],
  [/\\curl(?![a-zA-Z@])/g, '\\nabla\\times', 'curl'],
  [/\\div(?![a-zA-Z@])/g, '\\nabla\\cdot', 'div'],
  [/\\vdot(?![a-zA-Z@])/g, '\\cdot', 'vdot'],
  [/\\cross(?![a-zA-Z@])/g, '\\times', 'cross'],
]

/**
 * マクロ定義の名前部分。ここを置換すると
 * \renewcommand{\nabla\cdot}{...} のような壊れた定義ができる。
 */
/**
 * マクロ定義の「頭」。名前部分を書き換えると
 * \newcommand\begin{bmatrix}1\end{bmatrix}{...} のような壊れた定義ができる。
 *
 * 波括弧を付ける形と付けない形の両方がソースに現れるので、両方を拾う。
 * ここを取りこぼすと展開器が定義名を破壊し、pandoc が文書ごと読めなくなる。
 */
const DEFINITION_HEAD =
  /\\(?:re|provide)?newcommand\s*(?:\{\\[a-zA-Z@]+\}|\\[a-zA-Z@]+)|\\DeclareMathOperator\*?\s*\{\\[a-zA-Z@]+\}|\\def\s*\\[a-zA-Z@]+/g

/** 定義の頭を退避する。展開器はこの置き換え後の文字列を触る。 */
export const parkDefinitions = (source) => {
  const parked = []
  const text = source.replace(DEFINITION_HEAD, (match) => {
    parked.push(match)
    return `\uE200${parked.length - 1}\uE201`
  })
  return { text, parked }
}

export const unparkDefinitions = (source, parked) =>
  source.replace(/\uE200(\d+)\uE201/g, (_, index) => parked[Number(index)])

/** ファイル自身が定義しているマクロ名を集める。 */
export const selfDefined = (source) => {
  const names = new Set()
  for (const match of source.matchAll(
    /\\(?:re|provide)?newcommand\s*(?:\{\\([a-zA-Z@]+)\}|\\([a-zA-Z@]+))|\\DeclareMathOperator\*?\s*\{\\([a-zA-Z@]+)\}|\\def\s*\\([a-zA-Z@]+)/g,
  )) {
    names.add(match[1] ?? match[2] ?? match[3] ?? match[4])
  }
  return names
}

export const expandVectorOperators = (source, skip = new Set()) => {
  let expanded = 0
  const applicable = VECTOR_OPERATORS.filter(([, , name]) => !skip.has(name))
  const text = applicable.reduce((acc, [pattern, replacement]) => {
    return acc.replace(pattern, () => {
      expanded += 1
      return replacement
    })
  }, source)

  return { text, expanded }
}

/**
 * アクセントや装飾マクロの引数を波括弧で囲む。
 *
 *   \dot\bm{r}  ->  \dot{\bm{r}}
 *   \bar\alpha  ->  \bar{\alpha}
 *
 * TeX は制御綴 1 つを引数として受け取れるが、pandoc は波括弧を要求する。
 * 1 箇所でも残ると aligned ブロックごと変換を諦めて生の TeX が残るため、
 * 影響が箇所数より大きい。
 */
const ACCENT_MACROS = [
  'dot', 'ddot', 'dddot', 'hat', 'widehat', 'tilde', 'widetilde',
  'bar', 'overline', 'underline', 'vec', 'check', 'breve', 'acute',
  'grave', 'mathring', 'bm', 'boldsymbol', 'mathbf', 'mathrm',
  'mathcal', 'mathfrak', 'mathbb', 'mathit', 'mathsf', 'text',
]

export const braceControlArguments = (source) => {
  let text = source
  let braced = 0

  for (const macro of ACCENT_MACROS) {
    const token = `\\${macro}`
    let out = ''
    let cursor = 0

    while (cursor < text.length) {
      const hit = text.indexOf(token, cursor)
      if (hit === -1) break

      let probe = hit + token.length
      // \dotted のような別マクロを巻き込まない。
      if (probe < text.length && /[a-zA-Z@]/.test(text[probe])) {
        out += text.slice(cursor, probe)
        cursor = probe
        continue
      }

      while (probe < text.length && /[ \t]/.test(text[probe])) probe += 1

      // 引数が制御綴のときだけ手を入れる。波括弧付きはそのままでよい。
      if (text[probe] !== '\\') {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      const inner = /^\\([a-zA-Z@]+|.)/.exec(text.slice(probe))
      if (!inner) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      let end = probe + inner[0].length
      // 内側のマクロが引数を取るなら、それも含めて包む（\bm{r} など）。
      const group = readGroup(text, end)
      if (group) end = group.end

      out += text.slice(cursor, hit)
      out += `${token}{${text.slice(probe, end)}}`
      cursor = end
      braced += 1
    }

    text = out + text.slice(cursor)
  }

  return { text, braced }
}

/**
 * physics(v1) の行列マクロ。区切り記号で行列の種類が決まる。
 *
 *   \mqty(...)  -> pmatrix     \mqty[...] -> bmatrix
 *   \mqty|...|  -> vmatrix     \mqty{...} -> matrix
 *
 * pandoc はこれを知らず、含まれる数式ブロックごと生 TeX で残す。
 * 講義ノートでは 295 箇所あり、生 TeX 残りの主因のひとつ。
 */
const MATRIX_DELIMITERS = [
  { open: '(', close: ')', env: 'pmatrix' },
  { open: '[', close: ']', env: 'bmatrix' },
  { open: '|', close: '|', env: 'vmatrix' },
  { open: '{', close: '}', env: 'matrix' },
]

const MATRIX_MACROS = [
  { name: 'vmqty', fallback: 'vmatrix' },
  { name: 'pmqty', fallback: 'pmatrix' },
  { name: 'smqty', fallback: 'matrix' },
  { name: 'mqty', fallback: 'pmatrix' },
]

export const expandMatrices = (source, skip = new Set()) => {
  let text = source
  let expanded = 0

  for (const macro of MATRIX_MACROS) {
    if (skip.has(macro.name)) continue
    const token = `\\${macro.name}`
    let out = ''
    let cursor = 0

    while (cursor < text.length) {
      const hit = text.indexOf(token, cursor)
      if (hit === -1) break

      const after = text[hit + token.length]
      if (after !== undefined && /[a-zA-Z@]/.test(after)) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      let probe = hit + token.length
      while (probe < text.length && /\s/.test(text[probe])) probe += 1

      const delimiter = MATRIX_DELIMITERS.find((d) => text[probe] === d.open)
      if (!delimiter) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      // 波括弧のときは通常のグループ走査、それ以外は区切り記号走査。
      const bodyStart = probe + 1
      const closeAt =
        delimiter.open === '{'
          ? (readGroup(text, probe)?.end ?? 0) - 1
          : findClose(text, bodyStart, {
              open: delimiter.open,
              close: delimiter.close,
            })

      if (closeAt <= 0) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      // \vmqty[...] のように綴りで種類が決まるものは、そちらを優先する。
      const env = macro.name === 'mqty' ? delimiter.env : macro.fallback

      out += text.slice(cursor, hit)
      out += `\\begin{${env}}${text.slice(bodyStart, closeAt)}\\end{${env}}`
      cursor = closeAt + 1
      expanded += 1
    }

    text = out + text.slice(cursor)
  }

  return { text, expanded }
}

/**
 * 引数を 1 つ取る physics(v1) のマクロ。
 * \vb{r} は太字ベクトル、\dd{x} は微分要素。
 */
const SINGLE_ARG_MACROS = [
  { name: 'vb', wrap: (arg) => `\\bm{${arg}}` },
  { name: 'va', wrap: (arg) => `\\vec{${arg}}` },
  { name: 'vu', wrap: (arg) => `\\hat{${arg}}` },
  // 引数を波括弧で残す。\dd{\omega}g(...) が \mathrm{d}\omegag(...) と
  // 繋がって別のマクロ名になってしまうため。
  // 積分の微分要素。直前に細空きを入れるのは LaTeX の慣習に合わせるため。
  { name: 'dd', wrap: (arg) => `\\,\\mathrm{d}{${arg}}` },
  // physics(v1) の波括弧形式。区切り記号形式と混在している。
  { name: 'ket', wrap: (arg) => `\\left\\lvert ${arg}\\right\\rangle ` },
  { name: 'bra', wrap: (arg) => `\\left\\langle ${arg}\\right\\rvert ` },
  { name: 'braket', wrap: (arg) => `\\left\\langle ${arg}\\right\\rangle ` },
  { name: 'ev', wrap: (arg) => `\\left\\langle ${arg}\\right\\rangle ` },
  { name: 'abs', wrap: (arg) => `\\left\\lvert ${arg}\\right\\rvert ` },
  { name: 'norm', wrap: (arg) => `\\left\\lVert ${arg}\\right\\rVert ` },
]

export const expandSingleArgMacros = (source, skip = new Set()) => {
  let text = source
  let expanded = 0

  for (const macro of SINGLE_ARG_MACROS) {
    if (skip.has(macro.name)) continue
    const token = `\\${macro.name}`
    let out = ''
    let cursor = 0

    while (cursor < text.length) {
      const hit = text.indexOf(token, cursor)
      if (hit === -1) break

      let probe = hit + token.length
      const after = text[probe]

      // \vb* は斜体太字。太字だけで足りるので星は読み飛ばす。
      if (after === '*') probe += 1
      else if (after !== undefined && /[a-zA-Z@]/.test(after)) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      const argument = readGroup(text, probe)
      if (!argument) {
        out += text.slice(cursor, hit + token.length)
        cursor = hit + token.length
        continue
      }

      // 引数の中に同種のマクロが入ることがある
      // （\ev{(\hat{r} - \ev{\hat{r}})^2} など）。素通しすると内側が残る。
      const inner = expandSingleArgMacros(argument.text, skip)

      out += text.slice(cursor, hit)
      out += macro.wrap(inner.text)
      cursor = argument.end
      expanded += 1 + inner.expanded
    }

    text = out + text.slice(cursor)
  }

  return { text, expanded }
}

export const expandChemistry = (source) => {
  let out = ''
  let cursor = 0
  let expanded = 0

  while (cursor < source.length) {
    const hit = source.indexOf('\\ce{', cursor)
    if (hit === -1) break

    let braces = 1
    let i = hit + 4
    while (i < source.length && braces > 0) {
      if (source[i] === '\\') { i += 2; continue }
      if (source[i] === '{') braces += 1
      else if (source[i] === '}') braces -= 1
      i += 1
    }

    if (braces !== 0) break

    out += source.slice(cursor, hit)
    out += chemistry(source.slice(hit + 4, i - 1))
    cursor = i
    expanded += 1
  }

  out += source.slice(cursor)
  return { text: out, expanded }
}

/**
 * ソース側で定義し忘れているマクロの保険。
 *
 * \providecommand なので、既に \newcommand で定義済みのファイルでは何も起きない。
 * \begin{document} の直前に差し込むのが肝で、先頭に置くと相手の \newcommand が
 * 「二重定義」で落ちる。
 */
const FALLBACKS = String.raw`
\providecommand{\vnabla}{\boldsymbol{\nabla}}
\providecommand{\sgn}{\operatorname{sgn}}
\providecommand{\lcm}{\operatorname{lcm}}
\providecommand{\propag}{\mathcal{G}}
\providecommand{\ii}{\mathrm{i}}
\providecommand{\ee}{\mathrm{e}}
\providecommand{\Res}{\operatorname{Res}}
\providecommand{\real}{\operatorname{Re}}
\providecommand{\imag}{\operatorname{Im}}
\providecommand{\varinjlim}{\operatorname*{\underrightarrow{\lim}}}
\providecommand{\varprojlim}{\operatorname*{\underleftarrow{\lim}}}
`

export const injectFallbacks = (source, extra = '') => {
  const marker = source.indexOf('\\begin{document}')
  if (marker === -1) return source

  return `${source.slice(0, marker)}${FALLBACKS}${extra}\n${source.slice(marker)}`
}

/**
 * braket を先に開く。順序が逆だと \ab|\braket<f|i>|^2 のような式で
 * \ab| の閉じ位置を braket 内部の縦棒と取り違える。
 */
/**
 * \end{document} を書き忘れているソースがある。
 * pandoc は文書全体を読めずに失敗するので、閉じておく。
 */
const closeDocument = (source) =>
  source.includes('\\begin{document}') && !source.includes('\\end{document}')
    ? `${source}\n\\end{document}\n`
    : source


/**
 * 定理・定義・証明の環境に、種類と題名を持ち回るための印を差し込む。
 *
 * pandoc は theorem 系の環境を #block[...] に落とすだけで、種類も題名も落とす。
 * 特に星付き（無番号）の環境では見出しが丸ごと消え、\begin{axiom}[ド・ブロイの
 * 関係式] の題名が出力に残らない。
 *
 * そこで本文の先頭に印を置いて pandoc を通し、repair-typst 側で
 * #theorem("題名")[...] のような呼び出しに組み替える。
 * 題名は日本語や括弧を含むので、pandoc が触らないよう 16 進で運ぶ。
 */
const STATEMENT_ENVIRONMENTS = new Map([
  ['theorem', 'theorem'],
  ['theorem*', 'theorem'],
  ['sctheorem*', 'theorem'],
  ['thm', 'theorem'],
  ['definition', 'definition'],
  ['dfn', 'definition'],
  ['axiom', 'axiom'],
  ['lemma', 'lemma'],
  ['lem', 'lemma'],
  ['proposition', 'proposition'],
  ['prop', 'proposition'],
  ['corollary', 'corollary'],
  ['cor', 'corollary'],
  ['example', 'example'],
  ['fact', 'remark'],
  ['rem', 'remark'],
  ['proof', 'proof'],
])

const toHex = (text) =>
  [...Buffer.from(text, 'utf8')].map((b) => b.toString(16).padStart(2, '0')).join('')

export const markStatements = (source) => {
  let marked = 0

  const text = source.replace(
    /\\begin\{([a-zA-Z]+\*?)\}[ \t]*(\[(?:[^\[\]]|\[[^\[\]]*\])*\])?/g,
    (whole, env, optional) => {
      const variant = STATEMENT_ENVIRONMENTS.get(env)
      if (!variant) return whole

      const title = optional ? optional.slice(1, -1) : ''
      marked += 1

      // 題名は印で運ぶので、環境の任意引数は落とす。
      // 残すと pandoc が「(題名).」として本文に出してしまう。
      return `\\begin{${env}}ZZSTMTZZ${variant}ZZ${toHex(title)}ZZ `
    },
  )

  // 終端にも印を打つ。pandoc は環境によって #block[...] で囲んだり囲まなかったり
  // するので、始まりだけでは主張の範囲が決められない。
  const closed = text.replace(/\\end\{([a-zA-Z]+\*?)\}/g, (whole, env) => {
    const variant = STATEMENT_ENVIRONMENTS.get(env)
    return variant ? ` ZZENDZZ${variant}ZZ\\end{${env}}` : whole
  })

  return { text: closed, marked }
}

export const preprocess = (source, { extraDefinitions = '' } = {}) => {
  const stripped = stripPreambleNoise(closeDocument(source))
  const withFallbacks = injectFallbacks(stripped, extraDefinitions)

  // ソース自身が定義しているマクロは触らない。pandoc / LaTeXML が
  // その定義をそのまま展開するので、こちらが上書きすると意味が変わる。
  const defined = selfDefined(withFallbacks)

  // 定義の頭を退避してから展開する。ここを守らないと展開器が定義名を
  // 書き換えてしまい、文書全体が読めなくなる。
  const { text: guarded, parked } = parkDefinitions(withFallbacks)

  const statements = markStatements(guarded)
  const references = stripReferencesInMath(statements.text)
  const equivalents = normalizeEquivalents(normalizeLabels(references.text))
  const bracedArgs = braceControlArguments(equivalents.text)
  const matrices = expandMatrices(bracedArgs.text, defined)
  const single = expandSingleArgMacros(matrices.text, defined)
  const derivs = expandDerivatives(single.text, defined)
  const vectors = expandVectorOperators(derivs.text, defined)
  const chem = expandChemistry(vectors.text)
  const brakets = expandBrakets(chem.text)

  // \ab と \qty を順に開く。どちらも同じ区切り記号構文。
  let brackets = { text: brakets.text, expanded: 0, unmatched: 0 }
  for (const macro of AUTO_BRACKET_MACROS) {
    if (defined.has(macro)) continue
    const step = expandAutoBrackets(brackets.text, macro)
    brackets = {
      text: step.text,
      expanded: brackets.expanded + step.expanded,
      unmatched: brackets.unmatched + step.unmatched,
    }
  }

  return {
    text: unparkDefinitions(brackets.text, parked),
    expanded: brakets.expanded + brackets.expanded,
    unmatched: brakets.unmatched + brackets.unmatched,
    brakets: brakets.expanded,
    brackets: brackets.expanded,
    chemistry: chem.expanded,
    derivatives: derivs.expanded,
    vectors: vectors.expanded,
    matrices: matrices.expanded,
    singleArg: single.expanded,
    braced: bracedArgs.braced,
    equivalents: equivalents.replaced,
    statements: statements.marked,
  }
}
