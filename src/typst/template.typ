// 同じ .typ から HTML と PDF の両方を出すための共有テンプレート。
// target() で分岐するのがこの経路の一番の旨みなので、記事側は本文だけ書く。

#import "theorem.typ": statement-rules

/// front matter。`typst eval 'query(<fm>).first().value'` がこれを拾う。
/// HTML 出力には現れない（metadata は不可視要素）。
#let frontmatter(title: "", date: "", tags: (), summary: none, draft: false) = [
  #metadata((
    title: title,
    date: date,
    tags: tags,
    summary: summary,
    draft: draft,
  ))<fm>
]

/// 記事本体を包む。
///
/// - html target: 紙面設定を一切かけない。見た目は CSS 側の担当なので、
///   Typst には構造と意味だけ出させる。
/// - paged target: A4 の紙面設定とタイトルを足して、そのまま PDF にする。
#let post(title: "", date: "", tags: (), summary: none, draft: false, body) = {
  set text(lang: "ja")
  set document(title: title)

  frontmatter(
    title: title,
    date: date,
    tags: tags,
    summary: summary,
    draft: draft,
  )

  show: content => context {
    if target() == "paged" {
      set page(paper: "a4", margin: 2.4cm, numbering: "1")
      set text(font: ("Noto Serif CJK JP", "Noto Serif"), size: 10.5pt)
      set par(justify: true, leading: 0.9em)

      align(center)[
        #text(size: 17pt, weight: "bold")[#title]
        #v(0.3em)
        #text(size: 9pt, fill: luma(90))[#date]
      ]
      v(1.5em)
      content
    } else {
      content
    }
  }

  // 定義・定理・証明の枠。使っていない記事には何も起きない
  // （kind: "statement" の figure だけを拾う show rule なので）。
  show: statement-rules

  body
}
