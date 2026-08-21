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
#let _statement(variant, supplement, title, body) = figure(
  kind: _kind,
  supplement: supplement,
  numbering: "1",
  caption: none,
  // figure の中身に variant と題名を持たせて、show rule 側で取り出す。
  metadata((variant: variant, title: title, body: body)),
)

/// `#theorem[...]` と `#theorem("Cantor")[...]` の両方を受ける。
#let _make(variant, supplement) = (..args) => {
  let pos = args.pos()
  if pos.len() == 1 {
    _statement(variant, supplement, none, pos.at(0))
  } else if pos.len() == 2 {
    _statement(variant, supplement, pos.at(0), pos.at(1))
  } else {
    panic("主張は 本文 だけ、または (題名, 本文) を取ります")
  }
}

/// 想起の問い。答えは畳んで置く。
///
/// 定着するのは読んだ瞬間ではなく取り出そうとした瞬間なので、答えを見る前に
/// 一度考える機会を作る。もう一つの狙いは読者の較正で、一度答えてみると
/// 自分の理解度の見積もりが当たるようになる（docs/build.md「想起の問い」）。
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
#let example = _make("example", [例])
#let remark = _make("remark", [注意])

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

    // 番号を持たないもの（想起の問い）は、題名があればそれだけを見出しにする。
    // 「問 1」のような採番は、参照されないかぎりドリルの体裁を足すだけになる。
    let head = if it.numbering == none {
      if title != none { title } else { it.supplement }
    } else {
      it.supplement
      [ ]
      it.counter.display(it.numbering)
      if title != none [ (#title)]
    }

    // ラベルから、位置に依らない錨を出す。
    //
    // Typst が振る id は `loc-1`、`loc-2` と**出てきた順**なので、上に主張を
    // 一つ足すと全部ずれる。外から張ったリンクやブックマークが、黙って
    // 別の主張を指すようになる。`<def:measure>` と書いた側は動かないので、
    // そちらを錨にする。ページ内の `@` 参照は Typst の id のままでよい。
    let tag = it.at("label", default: none)
    let anchor = if tag == none { none } else { str(tag).replace(":", "-") }

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
