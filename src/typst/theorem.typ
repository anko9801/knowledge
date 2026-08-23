// 定義・定理・証明の枠。
//
// テンプレートと同じ方針で、html target には構造と意味だけ（figure + class）を出し、
// 見た目は global.css に任せる。paged target のときだけ紙面用の装飾をかける。
//
// 中身は figure なので、参照は Typst 標準の @label がそのまま使える。
//   #theorem[...]<thm:cantor>  →  @thm:cantor  →  「定理 4」へのリンク
//
// 番号は種類をまたいだ通し番号にする（kind をすべて "statement" で揃える）。
// 「定義 3 の次が定理 4」になるので、本文で番号だけ見ても指す先が一意に決まる。

#let _kind = "statement"

/// 主張の枠をひとつ組む。variant は CSS のクラス名と紙面の見た目に効く。
#let _statement(variant, supplement, numbering, title, body) = figure(
  kind: _kind,
  supplement: supplement,
  numbering: numbering,
  caption: none,
  // figure の中身に variant と題名を持たせて、show rule 側で取り出す。
  metadata((variant: variant, title: title, body: body)),
)

/// `#theorem[...]` と `#theorem("Cantor")[...]` の両方を受ける。
#let _make(variant, supplement, numbering: "1") = (..args) => {
  let pos = args.pos()
  if pos.len() == 1 {
    _statement(variant, supplement, numbering, none, pos.at(0))
  } else if pos.len() == 2 {
    _statement(variant, supplement, numbering, pos.at(0), pos.at(1))
  } else {
    panic("主張は 本文 だけ、または (題名, 本文) を取ります")
  }
}

/// 想起の問い。答えは畳んで置く。
///
/// 定着するのは読んだ瞬間ではなく取り出そうとした瞬間なので、答えを見る前に
/// 一度考える機会を作る。もう一つの狙いは読者の較正で、一度答えてみると
/// 自分の理解度の見積もりが当たるようになる（docs/reader.md「想起の問い」）。
///
/// 採点も記録もしない。問いは軽くしない——説明を組ませる形のほうが転移する。
///
/// 番号は振らない。参照されないものに番号を振ると、ドリルの体裁になるうえ、
/// 定義と定理の通し番号に穴が空いたように見えるだけ損をする。
///
///   #check[問い][答え]                      見出しは「問」
///   #check("前回のふりかえり")[問い][答え]     見出しは題名のほう
#let check(..args) = {
  let pos = args.pos()
  let (title, question, answer) = if pos.len() == 3 {
    (pos.at(0), pos.at(1), pos.at(2))
  } else if pos.len() == 2 {
    (none, pos.at(0), pos.at(1))
  } else {
    panic("check は (問い, 答え) か (題名, 問い, 答え) を取ります")
  }

  figure(
    kind: _kind,
    supplement: [問],
    numbering: none,
    caption: none,
    metadata((variant: "check", title: title, body: question, answer: answer)),
  )
}

#let axiom = _make("axiom", [公理])
/// 選べない前提。公理と分けてある。
///
/// 公理は選ぶもので、別のものを選べば別の理論になる。こちらは選べない。
/// 測って確かめられるし、外れていれば導いたものが崩れる。同じ枠で書くと、
/// 「選んだのだから正しい」に見えてしまうので、名前を変えている。
#let given = _make("given", [前提])
#let definition = _make("definition", [定義])
#let theorem = _make("theorem", [定理])
#let lemma = _make("lemma", [補題])
#let proposition = _make("proposition", [命題])
#let corollary = _make("corollary", [系])
/// 例と注意には番号を振らない。
///
/// 312 個あるが、`@ex:` も `@rem:` も本文に一つも無い。誰も指さない番号は、
/// 「例 5」と書かれた側が指す先を探しに戻る手間だけを作る。
/// 定義と定理の番号は指されるので残す（`docs/build.md`「参照されない採番」）。
#let example = _make("example", [例], numbering: none)
#let remark = _make("remark", [注意], numbering: none)

/// 変換できなかった図。元の LaTeX を畳んで置く。
///
/// tikz と Feynman 図は Typst へ写せない（`repair-typst.mjs`）。落としてしまうと
/// 本文が「上の図より」と言いながら何も無い状態になるので、元のソースを残してある。
///
/// ただし**素で置くと 20 行の `\feynmandiagram` が本文の途中に居座る**。
/// 読者にとっては雑音でしかないので畳む。取りに行きたい人だけが開く形は、
/// 想起の問いと同じ（`docs/reader.md`「手助けはすべて任意にする」）。
///
/// `<details>` なので JS は要らない。紙面では開いた状態で並ぶ。
#let unconverted(tex) = context {
  let label = [図は変換できていません（元の LaTeX）]

  if target() == "html" {
    html.elem("details", attrs: (class: "unconverted"), {
      html.elem("summary", label)
      raw(tex, lang: "latex", block: true)
    })
  } else {
    block(inset: (left: 0.9em), stroke: (left: 2pt + luma(80%)), {
      text(size: 0.85em, fill: luma(45%), label)
      raw(tex, lang: "latex", block: true)
    })
  }
}

/// 元の図が残っていない図版。
///
/// 変換で落ちた図のうち、元の LaTeX すら手元に無いものがある（tikz を
/// 中間で捨てた回）。`#figure([], caption: [...])` のまま置くと、
/// **説明だけがあって中身が無い**枠が並ぶ。読者は何かを見落としたと思う。
///
/// 中身が無いことを書いておけば、探しに戻らずに済む。
/// 元の LaTeX が残っているなら `#unconverted` のほうを使う。
/// context は figure の中に入れる。外に出すと figure ではなく context に
/// ラベルが付き、@fig:… が「cannot reference context」で落ちる。
#let lost-figure(caption) = figure(
  context {
    let note = [（図は変換の途中で失われています）]

    if target() == "html" {
      // text() の色も大きさも HTML export では落ちるので、印を付けて CSS に渡す。
      html.elem("p", attrs: (class: "lost-figure"), note)
    } else {
      text(fill: luma(45%), size: 0.85em, note)
    }
  },
  caption: caption,
)

/// 証明。終わりの □ まで込みで 1 つの塊にする。
#let proof(body) = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "proof"), {
      html.elem("span", attrs: (class: "proof-head"), [Proof.])
      body
      html.elem("span", attrs: (class: "proof-end"), sym.square.stroked)
    })
  } else {
    block(width: 100%, inset: (y: 0.4em), {
      emph[Proof.]
      body
      h(1fr)
      sym.square.stroked
    })
  }
}

/// 主張の figure をどう描くかを決める show rule。テンプレート側から適用する。
#let statement-rules(body) = {
  show figure.where(kind: _kind): it => context {
    // 分割代入だと check の answer で鍵の数が合わなくなるので、名前で取る。
    let value = it.body.value
    let variant = value.variant
    let title = value.title
    let body = value.body
    let answer = value.at("answer", default: none)

    // 「問 1」のような採番は、参照されないかぎりドリルの体裁を足すだけになる。
    //
    // 想起の問いだけは、題名があれば種別も落とす。「問 (前回のふりかえり)」と
    // 書く用事が無い。例と注意は種別を残す——例なのか注意なのかは読む前に要る。
    let head = if it.numbering == none and variant == "check" and title != none {
      title
    } else {
      it.supplement
      if it.numbering != none {
        [ ]
        it.counter.display(it.numbering)
      }
      if title != none [ (#title)]
    }

    // ラベルから、位置に依らない錨を出す。
    //
    // Typst が振る id は `loc-1`、`loc-2` と**出てきた順**なので、上に主張を
    // 一つ足すと全部ずれる。外から張ったリンクやブックマークが、黙って
    // 別の主張を指すようになる。`<def:measure>` と書いた側は動かないので、
    // そちらを錨にする。ページ内の `@` 参照は Typst の id のままでよい。
    //
    // ただし**コロンを含むラベルのときだけ**にする。`<def:measure>` は `:` が
    // id に使いにくいので Typst が `loc-N` を振り、錨のほうが唯一の名前になる。
    // 講義ノート由来の `<hilbert-corespondence>` はそのまま id になるので、
    // 同じものを二度置くと **1 ページに同じ id が二つ**並び、
    // どちらへ飛ぶかがブラウザ任せになる（実測 2 ページ、4 件）。
    let tag = it.at("label", default: none)
    let named = tag != none and str(tag).contains(":")
    let anchor = if named { str(tag).replace(":", "-") } else { none }

    if target() == "html" {
      html.elem("div", attrs: (class: "statement statement-" + variant), {
        // 錨は見出しの中に入れる。独立して置くと Typst が <p> で包むので、
        // 空の段落が主張の先頭に増え、上に余白が入る。
        html.elem("p", attrs: (class: "statement-head"), {
          if anchor != none {
            html.elem("span", attrs: (id: anchor, class: "anchor"), [])
          }
          head
        })
        body
        // details なので JS が要らない。CSS が落ちても、開いた状態で読める。
        if answer != none {
          html.elem("details", attrs: (class: "check-answer"), {
            html.elem("summary", [答え])
            answer
          })
        }
      })
    } else if answer != none {
      // figure は既定で中央寄せになる。show rule で中身を差し替えても
      // その寄せは効いたままで、**紙面では主張の中の段落が全部中央に寄る**
      // （PDF を見るまで気づけない。画面側は CSS が持つので無事だった）。
      set align(left)
      block(
        width: 100%,
        inset: (left: 0.9em, y: 0.5em),
        stroke: (left: 1.5pt + luma(160)),
        {
          text(weight: "bold", head)
          parbreak()
          body
          parbreak()
          text(weight: "bold")[答え．]
          answer
        },
      )
    } else {
      set align(left)
      block(
        width: 100%,
        inset: (left: 0.9em, y: 0.5em),
        stroke: (left: 1.5pt + luma(160)),
        {
          text(weight: "bold", head)
          parbreak()
          body
        },
      )
    }
  }

  body
}

/// 概念の索引につなぐ語。押すとその概念のページへ行き、
/// ホバー（触る端末では取っ手）でひとことの説明がその場に出る。
///
/// **どこに付けるかは書き手が決める。** 機械で拾おうとすると
/// 「体」が全体・物体に、「束」が接束・収束に、「向き」が日常語に当たって
/// 全部誤爆する。1 本あたり数語で足りる（実測で、初出だけに絞ると中央値 6）。
///
/// 中身が概念の名前と同じなら、それだけでよい。
///
///   #term[多様体]
///
/// 語形が違うときや、名前に数式が入っているときは id を渡す。
///
///   #term("manifold")[多様体の上]
///
/// 名前も id も `src/data/concepts.ts` に無ければ、ビルドが止まる。
#let term(..args) = {
  let pos = args.pos()
  let (id, body) = if pos.len() == 2 {
    (pos.at(0), pos.at(1))
  } else if pos.len() == 1 {
    (none, pos.at(0))
  } else {
    panic("term は 語 だけ、または (概念 id, 語) を取ります")
  }

  context {
    if target() == "html" {
      html.elem(
        "span",
        attrs: if id == none { (class: "term") } else { (class: "term", "data-id": id) },
        body,
      )
    } else {
      // 紙面に索引は無い。印だけ残す。
      underline(offset: 2pt, stroke: (thickness: 0.4pt, dash: "dotted"), body)
    }
  }
}
