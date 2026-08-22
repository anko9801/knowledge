// 同じ .typ から HTML と PDF の両方を出すための共有テンプレート。
// target() で分岐するのがこの経路の一番の旨みなので、記事側は本文だけ書く。

#import "theorem.typ": statement-rules

/// front matter。`typst eval 'query(<fm>).first().value'` がこれを拾う。
/// HTML 出力には現れない（metadata は不可視要素）。
///
/// field / series / order は解説記事だけが使う。ここが URL を決めるので、
/// ファイルを別ディレクトリに移してもリンクは切れない。
///
/// provides / requires / uses は依存グラフの辺になる（src/lib/curriculum.ts）。
/// requires は論理的な依存——それが無いと定義も証明も書けないもの。
/// uses は記法として借りているだけで、別の書き方をすれば要らないもの。
/// 「この順で教わるのが普通だから」という慣習は、辺として書かない。
#let frontmatter(
  title: "",
  date: "",
  tags: (),
  summary: none,
  draft: false,
  field: none,
  series: none,
  order: none,
  provides: (),
  requires: (),
  uses: (),
) = [
  #metadata((
    title: title,
    date: date,
    tags: tags,
    summary: summary,
    draft: draft,
    field: field,
    series: series,
    order: order,
    provides: provides,
    requires: requires,
    uses: uses,
  ))<fm>
]

/// 記事本体を包む。
///
/// - html target: 紙面設定を一切かけない。見た目は CSS 側の担当なので、
///   Typst には構造と意味だけ出させる。
/// - paged target: A4 の紙面設定とタイトルを足して、そのまま PDF にする。
#let post(
  title: "",
  date: "",
  tags: (),
  summary: none,
  draft: false,
  field: none,
  series: none,
  order: none,
  provides: (),
  requires: (),
  uses: (),
  body,
) = {
  set text(lang: "ja")
  set document(title: title)

  frontmatter(
    title: title,
    date: date,
    tags: tags,
    summary: summary,
    draft: draft,
    field: field,
    series: series,
    order: order,
    provides: provides,
    requires: requires,
    uses: uses,
  )

  show: content => context {
    if target() == "paged" {
      set page(paper: "a4", margin: 2.4cm, numbering: "1")
      set text(font: ("Noto Serif CJK JP", "Noto Serif"), size: 10.5pt)
      set par(justify: true, leading: 0.9em)
      // 図の説明は既定で中央寄せになる。1 行なら収まるが、3 行あると
      // 行ごとに始まりが違う塊になって読みにくい。左に揃える。
      show figure.caption: it => align(left, it)

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
