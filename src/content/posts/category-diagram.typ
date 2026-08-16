#import "/src/typst/template.typ": post
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#show: post.with(
  title: "可換図式は描けるか",
  date: "2026-08-16",
  tags: ("typst", "html", "圏論"),
  summary: "fletcher の図は SVG 島になる。MathML と違って中身はテキストではない。",
)

= 数式は MathML、図は SVG

同じ文書の中でも、Typst は出力先を使い分ける。数式は MathML として出るので
テキストのままだが、図は SVG に焼かれる。

インラインの $f: X -> Y$ や、別行立ての次の式は MathML。

$ h = g compose f $

いっぽう可換図式は `html.frame()` で囲って SVG 島にする。囲わないと
cetz が使う `layout()` が HTML export で無視され、図が丸ごと消える。

#html.frame(diagram(
  spacing: (20mm, 14mm),
  node((0, 0), $X$),
  node((1, 0), $Y$),
  node((1, 1), $Z$),
  edge((0, 0), (1, 0), $f$, "->"),
  edge((0, 0), (1, 1), $h$, "->", label-side: right),
  edge((1, 0), (1, 1), $g$, "->"),
))

引き戻しのような、もう少し込み入った図も同じように出せる。

#html.frame(diagram(
  spacing: (20mm, 14mm),
  node((0, 0), $P$),
  node((1, 0), $X$),
  node((0, 1), $Y$),
  node((1, 1), $Z$),
  edge((0, 0), (1, 0), $p_1$, "->"),
  edge((0, 0), (0, 1), $p_2$, "->"),
  edge((1, 0), (1, 1), $f$, "->"),
  edge((0, 1), (1, 1), $g$, "->"),
))

= 代償

SVG 島の中身はテキストではない。グリフはパスに変換されるので、図のラベルは
選択もコピーも検索もできず、スクリーンリーダーも読まない。MathML で得られる
利点が、図の中だけ失われる。

配置と色も焼き付く。線の色は `#000000` で固定されるため、CSS 側で
`currentColor` に読み替えないとダークモードで消える。
