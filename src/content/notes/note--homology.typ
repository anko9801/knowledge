#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem

#show: post.with(
  title: "ホモロジー代数",
  date: "2026-08-17",
  tags: ("ノート",),
  summary: "note/homology.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

#theorem("蛇の補題")[

]
