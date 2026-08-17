#import "/src/typst/template.typ": post

#show: post.with(
  title: "化学物理学",
  date: "2026-08-17",
  tags: ("ノート",),
  summary: "note/chemistory_physics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 化学
<化学>
