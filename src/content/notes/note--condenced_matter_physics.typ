#import "/src/typst/template.typ": post

#show: post.with(
  title: "condenced_matter_physics",
  date: "2026-08-17",
  tags: ("ノート",),
  summary: "note/condenced_matter_physics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

#strong[電子] \
群速度 $bold(v)_e = frac(partial omega, partial bold(k))$, エネルギー
$bold(cal(E)) \( bold(k) \) = planck omega \( bold(k) \)$, 外力
$frac(upright(d) bold(k), upright(d) t) = bold(F) / planck$,
$bold(k) \( t \) = bold(F) / planck t + bold(k) \( 0 \)$ 有効質量
$frac(upright(d) bold(v)_e, upright(d) t) = frac(upright(d), upright(d) t) (frac(partial, partial k) bold(cal(E)) / planck) = 1 / planck frac(partial bold(cal(E)), partial k_i \, k_j) frac(upright(d) k, upright(d) t) = 1 / planck^2 frac(partial bold(cal(E)), partial k_i \, k_j) bold(F) = (bold(F) / m^(\*))_(i j)$
$bold(cal(E))$-$k$ グラフで曲率高い方が軽くて速い。 3 p D
