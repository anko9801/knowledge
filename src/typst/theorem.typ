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

#let axiom = _make("axiom", [公理])
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
      html.elem("span", attrs: (class: "proof-head"), [証明．])
      body
      html.elem("span", attrs: (class: "proof-end"), sym.square.stroked)
    })
  } else {
    block(width: 100%, inset: (y: 0.4em), {
      emph[証明．]
      body
      h(1fr)
      sym.square.stroked
    })
  }
}

/// 主張の figure をどう描くかを決める show rule。テンプレート側から適用する。
#let statement-rules(body) = {
  show figure.where(kind: _kind): it => context {
    let (variant, title, body) = it.body.value
    let number = it.counter.display(it.numbering)

    let head = {
      it.supplement
      [ ]
      number
      if title != none [ (#title)]
    }

    if target() == "html" {
      html.elem("div", attrs: (class: "statement statement-" + variant), {
        html.elem("p", attrs: (class: "statement-head"), head)
        body
      })
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
