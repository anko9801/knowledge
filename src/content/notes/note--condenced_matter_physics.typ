#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "物性物理学",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/condenced_matter_physics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

#strong[電子] \
群速度 $display(bold(v)_e = frac(partial omega, partial bold(k)))$, エネルギー
$bold(cal(E)) \( bold(k) \) = planck omega \( bold(k) \)$, 外力
$display(frac(upright(d) bold(k), upright(d) t) = bold(F) / planck)$,
$display(bold(k) \( t \) = bold(F) / planck t + bold(k) \( 0 \))$ 有効質量
$display(frac(upright(d) bold(v)_e, upright(d) t) = frac(upright(d), upright(d) t) (frac(partial, partial k) bold(cal(E)) / planck) = 1 / planck frac(partial bold(cal(E)), partial k_i \, k_j) frac(upright(d) k, upright(d) t) = 1 / planck^2 frac(partial bold(cal(E)), partial k_i \, k_j) bold(F) = (bold(F) / m^(\*))_(i j))$
$bold(cal(E))$-$k$ グラフで曲率高い方が軽くて速い。 3 p D
