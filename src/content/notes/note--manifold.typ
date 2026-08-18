#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "多様体",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/manifold.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= ユークリッド空間
<ユークリッド空間>
ユークリッド空間 $bb(R)^n$
はすべての多様体の原型となるもの。すべての多様体は局所的に $bb(R)^n$
のように見える。 実ベクトル空間 $V \, W$
$ "Hom" \( V \, W \) in.rev f : V arrow.r W\
alpha^i : sum v^i e_i mapsto v^i\
f : & A & arrow.r & B\
 & in &  & in\
 & x & mapsto & f \( x \) $

座標関数 $alpha^i$

曲面の接平面上にあるベクトルを接ベクトルという。

$bb(R)^n$ の点 $p$ における接空間 $T_p \( bb(R)^n \) \, T_p bb(R)^n$
の元を接ベクトルという。

= 
<section>
#definition("線形写像")[
$ L \( u + v \) & = L \( u \) + L \( v \)\
L \( r v \) & = r L \( v \) $
]
#definition("コベクトル")[
ベクトル空間上の
$k$ 変数交代多重線形関数は次数 $k$ の多重コベクトル
]
$ V = "span" { e_i }\
T_p \( bb(R)^n \) = "span" {frac(partial, partial x^i) \[ p \]} $

余接空間 $ T_p^(\*) \( bb(R)^n \) \, T_p^(\*) bb(R)^n $

#definition("テンソル積")[
$ \( f times.o g \) \( v_1 \, dots.h \, v_(k + l) \) = f \( v_1 \, dots.h \, v_k \) g \( v_(k + 1) \, dots.h \, v_(k + l) \) $
$ sigma f \( v_1 \, dots.h \, v_k \) = f \( v_(sigma \( 1 \)) \, dots.h \, v_(sigma \( k \)) \) $
$ S f & = sum_(sigma in frak(S)_k) sigma f\
A f & = sum_(sigma in frak(S)_k) \( "sgn" sigma \) sigma f $
$ f and g & = frac(1, k ! l !) A \( f times.o g \) $
]
$ f \( dots.h \, v_(i + 1) \, v_i \, dots.h \) = - f \( dots.h \, v_i \, v_(i + 1) \, dots.h \) $
$ f \( v_1 \, dots.h \, v_k \) = 0 $
