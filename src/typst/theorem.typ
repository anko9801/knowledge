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
//
// ただし#strong[番号を振るのは、参照される種類だけ]にする。注意と例と問は
// 振らない。番号は @label で指すためにあるのに、この 3 つは一度も指されない
// （実測で 注意 120・例 119・問 13 に対し、参照 0 件）。通し番号に混ぜると
// 「定義 1 の次が定義 4」になり、2 と 3 が抜けたように見えるだけ損をする。

#let _kind = "statement"

/// 主張の枠をひとつ組む。variant は CSS のクラス名と紙面の見た目に効く。
/// numbered: false のものは番号を消費しないので、定義と定理の連番が途切れない。
#let _statement(variant, supplement, title, body, numbered) = figure(
  kind: _kind,
  supplement: supplement,
  numbering: if numbered { "1" } else { none },
  caption: none,
  // figure の中身に variant と題名を持たせて、show rule 側で取り出す。
  metadata((variant: variant, title: title, body: body)),
)

/// `#theorem[...]` と `#theorem("Cantor")[...]` の両方を受ける。
#let _make(variant, supplement, numbered: true) = (..args) => {
  let pos = args.pos()
  if pos.len() == 1 {
    _statement(variant, supplement, none, pos.at(0), numbered)
  } else if pos.len() == 2 {
    _statement(variant, supplement, pos.at(0), pos.at(1), numbered)
  } else {
    panic("主張は 本文 だけ、または (題名, 本文) を取ります")
  }
}

/// 想起の問い。答えは畳んで置く。
///
/// 読んで分かった感覚は、取り出せることとほとんど相関しない。取り出そうとした
/// 瞬間に定着するので、答えを見る前に一度考える機会を作る。採点も記録もしない。
/// その場で読んで終わるものなので、番号は振らない。
#let check(question, answer) = figure(
  kind: _kind,
  supplement: [問],
  numbering: none,
  caption: none,
  metadata((variant: "check", title: none, body: question, answer: answer)),
)

// 参照される側。通し番号を振る。
#let axiom = _make("axiom", [公理])
#let definition = _make("definition", [定義])
#let theorem = _make("theorem", [定理])
#let lemma = _make("lemma", [補題])
#let proposition = _make("proposition", [命題])
#let corollary = _make("corollary", [系])

// 添えるだけの側。番号は振らない。
#let example = _make("example", [例], numbered: false)
#let remark = _make("remark", [注意], numbered: false)

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

    let head = {
      it.supplement
      if it.numbering != none {
        [ ]
        it.counter.display(it.numbering)
      }
      if title != none [ (#title)]
    }

    if target() == "html" {
      html.elem("div", attrs: (class: "statement statement-" + variant), {
        html.elem("p", attrs: (class: "statement-head"), head)
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
