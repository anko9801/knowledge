#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem

#show: post.with(
  title: "微分幾何学",
  date: "2026-08-17",
  tags: ("ノート",),
  summary: "note/differential_geometry.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 微分積分学
<微分積分学>
== 測度
<測度>
測度とはある範囲の集合に非負の実数あるいは $oo$
を対応させる集合関数である。

#definition("加法族")[
集合 $X$ の部分集合の族
$bold(B)$ が次の条件を満たすとき、$X$ 上の加法族と呼ぶ。

+ $nothing in bold(B)$

+ $A in bold(B)$ ならば $A^c in bold(B)$

+ $A_n in bold(B)$ ならば $union.big_(n = 1)^oo A_n in bold(B)$
]
#definition("測度")[
$bold(B)$ を $X$ 上の加法族とするとき
$mu$ が $\( X \, bold(B) \)$ 上の測度であるとは

+ $A in bold(B)$ に対し $0 lt.eq mu \( A \) lt.eq oo$
  $mu \( nothing \) = 0$

+ $A_n$
]
= 微分幾何学
<微分幾何学>
== 多様体
<多様体>
接ベクトル 接ベクトル束

== 微分形式
<微分形式>
#definition("微分形式")[
$and :$
$ u and v := u times.o v - v times.o u $ $0$-形式 \
$k$-形式$omega_(mu_1 dots.h.c mu_k) in C^oo \( U \)$
$ omega = frac(1, k !) omega_(mu_1 dots.h.c mu_k) d x^(mu_1) and dots.h.c and d x^(mu_k) $
]
#definition("外微分")[
外微分 (exterior derivative)
$d : Omega^k \( M \) arrow.r Omega^(k + 1) \( M \)$
を次のように定義する。
$ d omega & := d (frac(1, k !) omega_(mu_1 dots.h.c mu_k)) and d x^(mu_1) and dots.h.c and d x^(mu_k)\
 & = frac(1, k !) frac(partial omega_(mu_1 dots.h.c mu_k), partial x^nu) d x^nu and d x^(mu_1) and dots.h.c and d x^(mu_k) $
]
$ d x and d y & = d \( r cos theta \) and d \( r sin theta \)\
 & = \( d r cos theta - r sin theta d theta \) and \( d r sin theta + r cos theta d theta \)\
 & = \( cos theta sin theta \) d r and d r + \( r cos^2 theta \) d r and d theta - \( r sin^2 theta \) d theta and d r - \( r^2 sin theta cos theta \) d theta and d theta\
 & = r d r and d theta $

#block[
#definition("1 の分割 (partition of unity)")[

]

]
#theorem("ストークスの定理")[

]
#definition("ド・ラームコホモロジー")[

]
