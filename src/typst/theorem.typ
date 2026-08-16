// 定義・定理・証明の枠。
//
// テンプレートと同じ方針で、html target には構造と意味だけを出し（div + class）、
// 見た目は global.css に任せる。paged target のときだけ紙面用の装飾をかける。
//
// 番号は種類をまたいで通し番号にする。「定義 3 の次が 定理 4」になるので、
// 本文中で番号だけを見ても、どこを指しているか一意に決まる。

#let thm-counter = counter("statement")

#let _supplements = (
  axiom: "公理",
  definition: "定義",
  theorem: "定理",
  lemma: "補題",
  proposition: "命題",
  corollary: "系",
  example: "例",
  remark: "注意",
)

/// 見出し行「定理 12 (Cantor)」を組む。
#let _head(kind, number, title) = {
  let label = _supplements.at(kind)
  let head = [#label #number]
  if title != none {
    head = [#head (#title)]
  }
  head
}

/// 主張の枠をひとつ組む。kind は _supplements のキー。
///
/// 直後にラベルを置けば `thmref` から番号で参照できる。
///   #theorem[...]<thm:cantor>
///   @thm:cantor ではなく #thmref(<thm:cantor>) を使う（ref は figure 専用のため）。
#let _statement(kind, title, body) = {
  thm-counter.step()

  context {
    let number = thm-counter.display()

    if target() == "html" {
      html.elem(
        "div",
        attrs: (class: "statement statement-" + kind),
        {
          html.elem("p", attrs: (class: "statement-head"), _head(kind, number, title))
          body
        },
      )
    } else {
      block(
        width: 100%,
        inset: (left: 0.9em, y: 0.6em),
        stroke: (left: 1.5pt + luma(150)),
        {
          text(weight: "bold")[#_head(kind, number, title)]
          parbreak()
          body
        },
      )
    }
  }
}

/// `#theorem[...]` と `#theorem("Cantor")[...]` の両方を受ける。
#let _make(kind) = (..args) => {
  let pos = args.pos()
  if pos.len() == 1 {
    _statement(kind, none, pos.at(0))
  } else if pos.len() == 2 {
    _statement(kind, pos.at(0), pos.at(1))
  } else {
    panic("statement は本文だけ、または (題名, 本文) を取ります")
  }
}

#let axiom = _make("axiom")
#let definition = _make("definition")
#let theorem = _make("theorem")
#let lemma = _make("lemma")
#let proposition = _make("proposition")
#let corollary = _make("corollary")
#let example = _make("example")
#let remark = _make("remark")

/// 証明。終わりの □ まで込みで 1 つの塊にする。
#let proof(body) = {
  let inner = {
    body
    h(1fr)
    sym.square.stroked
  }

  context {
    if target() == "html" {
      html.elem("div", attrs: (class: "proof"), {
        html.elem("span", attrs: (class: "proof-head"), [証明．])
        body
        html.elem("span", attrs: (class: "proof-end"), sym.square.stroked)
      })
    } else {
      block(width: 100%, inset: (y: 0.4em), {
        emph[証明．]
        inner
      })
    }
  }
}

/// ラベルを付けた主張への参照。「定理 12」というリンクになる。
#let thmref(label, kind: none) = context {
  let number = thm-counter.at(label).first()
  let text = if kind == none { [#number] } else { [#_supplements.at(kind) #number] }
  link(label, text)
}
