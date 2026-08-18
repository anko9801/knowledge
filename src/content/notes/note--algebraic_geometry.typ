#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "代数幾何",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/algebraic_geometry.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= スキーム
<スキーム>
#definition("前層")[
位相空間 $X$ 上の各開集合 $U$
に対して加群 $cal(F) \( U \)$ が対応し、開集合 $V subset.eq U$
に対して制限写像と呼ばれる加群の準同型写像
$rho_(V \, U) : cal(F) \( U \) arrow.r cal(F) \( V \)$ が定義され、
以下の性質を満たすとき、$cal(F)$ を $X$ 上の前層 (presheaf) という。

+ $cal(F) \( nothing \) = 0$

+ $rho_(U \, U) = i d_(cal(F) \( U \))$

+ $rho_(W \, U) = rho_(W \, V) compose rho_(V \, U)$
]
#definition("層")[
さらに次の 2
つの性質を満足するとき、$cal(F)$ を $X$ 上の層 (sheaf) という。

+ $a in cal(F) \( U \)$ が $rho_(U_j \, U) \( a \) = 0 \, j in J$
  を満足すれば $a = 0$ となる。

+ $a_j in cal(F) \( U_j \) \, j in J$ が
  $rho_(U_i inter U_j \, U_j) \( a_j \) = rho_(U_i inter U_j \, U_i) \( a_i \) \, i \, j in J$
  ならば $a_j = rho_(U_j \, U) \( a \)$ となる $a in cal(F) \( U \)$
  が存在する。

$ cal(F) \( U \) arrow.r product_j cal(F) \( U_i \) arrows.rr product_(i \, j) cal(F) \( U_i inter U_j \) $
]
位相空間 $X$ 上の点 $P$ における茎 (stalk) $cal(F)_P$ を $P$
を含むすべての開集合 $U$ に対する $cal(F) \( U \)$
と制限写像がなす順系に関する順極限と定義する。
$ cal(F)_P = upright(accent(lim, ⃯))_(P in U) cal(F) \( U \) $ 点 $P$
における $cal(F)$ の切断の芽 (germ) ともいう。

= 代数多様体
<代数多様体>
代数幾何学は代数方程式で定められる図形の幾何学である。

代数閉体上の $n$
変数連立方程式のイデアルの解を代数的集合という。代数的集合はグラフ上の点、曲線、曲面の組み合わせと幾何的に捉えられる。
そして代数的集合を閉集合とする位相空間 (Zariski 位相)
の元を多様体という。

- 極大イデアルと点が対応する。

- 素イデアルと既約な閉集合が対応する。豊かな性質を持つ。

- イデアルと閉集合が対応する。既約な閉集合から構成できる。

特に重要な既約な閉集合について考える。

- 多様体 $Y$ による座標環 $A \( Y \)$ と $Y$ 上で正則な関数の環
  $cal(O) \( Y \)$ は同型

これを代数閉体から一般の可換環に適用したい。Grothendieck
は素イデアルに注目し、スキームを導入することで解決させた。
素イデアルの集合 素スペクトル

- 素スペクトル同士の写像

- 局所化された環同士での元の対応

- 関数 $f$ によって局所化された環と $f$ を含まない素イデアルが対応する

== アフィン空間
<アフィン空間>
#definition("アフィン空間")[
代数的閉体
$k$ に対して解の全体 $k^n$ を $n$ 次元アフィン空間 (affine space)
と呼び、$bb(A)_k^n$ または $bb(A)^n$ と書く。
]
代数的閉体 $k$ 上の $n$ 変数多項式環 $k \[ x_1 \, dots.h \, x_n \]$
について連立方程式の解の 1 つはアフィン空間の元
$\( a_1 \, dots.h \, a_n \) in k^n$
として書ける。このとき連立方程式の解の全体を #strong[代数的集合
(algebraic set)] と呼ぶ。多項式 $f_1 \, dots.h \, f_l$ やイデアル
$I = \( f_1 \, dots.h \, f_l \)$ からなる代数的集合をそれぞれ
$V \( f_1 \, dots.h \, f_l \)$, $V \( I \)$ と書く。
$ V \( f_1 \, dots.h \, f_l \) & = { \( a_1 \, dots.h \, a_n \) in k^n divides f_alpha \( a_1 \, dots.h \, a_n \) = 0 \, med alpha = 1 \, dots.h \, l }\
V \( I \) & = { \( a_1 \, dots.h \, a_n \) in k^n divides forall f in I med f \( a_1 \, dots.h \, a_n \) = 0 } $
このとき極大イデアル $frak(m) = \( x_1 - a_1 \, dots.h \, x_n - a_n \)$
の代数的集合 $V \( frak(m) \) = { \( a_1 \, dots.h \, a_n \) }$ は 1
点と対応する。

#proposition[
代数的集合について次の性質がわかる。
$ V \( \( f_1 \, dots.h \, f_l \) \) & = V \( f_1 \, dots.h \, f_l \)\
V \( I \) union V \( J \) & = V \( I inter J \)\
union.big V \( I_lambda \) & subset.eq V (inter.big I_lambda)\
inter.big V \( I_lambda \) & = V (sum I_lambda)\
V \( \( 1 \) \) & = nothing \, #h(2em) V \( \( 0 \) \) = bb(A)_k^n\
sqrt(I) supset.eq sqrt(J) & arrow.r.double.long V \( I \) subset.eq V \( J \)\
I \( V \( J \) \) & = sqrt(J) $
]
#proof[
+ イデアル $I = \( f_1 \, dots.h \, f_l \)$ の任意の元
  $f \( x_1 \, dots.h \, x_n \) in I$ について
  $ f \( x_1 \, dots.h \, x_n \) & = sum_(alpha = 1)^l g_alpha \( x_1 \, dots.h \, x_n \) f_alpha \( x_1 \, dots.h \, x_n \)\
  f \( a_1 \, dots.h \, a_n \) & = sum_(alpha = 1)^l g_alpha \( a_1 \, dots.h \, a_n \) f_alpha \( a_1 \, dots.h \, a_n \) = 0 arrow.l.r.double f_alpha \( a_1 \, dots.h \, a_n \) = 0 $
  と書ける。よって
  $ V \( f_1 \, dots.h \, f_l \) & = { \( a_1 \, dots.h \, a_n \) in k^n divides forall alpha = 1 \, dots.h \, l med f_alpha \( a_1 \, dots.h \, a_n \) = 0 }\
   & = { \( a_1 \, dots.h \, a_n \) in k^n divides forall g_alpha med sum_(alpha = 1)^l g_alpha \( a_1 \, dots.h \, a_n \) f_alpha \( a_1 \, dots.h \, a_n \) = 0 }\
   & = { \( a_1 \, dots.h \, a_n \) in k^n divides forall f in I med f \( a_1 \, dots.h \, a_n \) = 0 }\
   & = V \( I \) $

+ イデアルの包含関係を $  & I \, J supset.eq I inter J\
  arrow.r.double.long & V \( I \) \, V \( J \) subset.eq V \( I inter J \)\
  arrow.r.double.long & V \( I \) union V \( J \) subset.eq V \( I inter J \)\
   & I inter J supset.eq I J\
  arrow.r.double.long & V \( I \) union V \( J \) supset.eq V \( I J \) supset.eq V \( I inter J \) $
  よって $V \( I \) union V \( J \) = V \( I inter J \)$ となる。

+ 可算無限個の相違なる元 $c_1 \, dots.h \, c_n \, dots.h$ を取り出し
  $k \[ x \]$ のイデアル $I_j = \( x - c_j \)$ とすると
  $union.big_j V \( I_j \) = { c_1 \, c_2 \, dots.h }$
  である。一方、可算無限次数の多項式は存在しないので
  $ V \( I_(j_1) inter dots.h.c inter I_(j_n) \) & = V ((product_(i = 1)^n \( x - c_(j_i) \))) = { c_(j_1) \, dots.h \, c_(j_n) }\
  union.big_j V \( I_j \) & subset.neq V (inter.big_j I_j) = V (\( 0 \)) = bb(A)_k^1 $
  となる。

+ a $  & forall mu med I_mu subset.eq sum_lambda I_lambda\
  arrow.r.double.long & forall mu med V \( I_mu \) supset.eq V (sum_lambda I_lambda)\
  arrow.r.double.long & inter.big_lambda V \( I_lambda \) supset.eq V (sum_lambda I_lambda) $
  $  & h_(lambda i) \( a_1 \, dots.h \, a_n \) = 0\
   & sum_(lambda \, i) f \( a_1 \, dots.h \, a_n \) h_(lambda_i) \( a_1 \, dots.h \, a_n \) = 0 $
  より
  $ inter.big_lambda V \( I_lambda \) subset.eq V (sum_lambda I_lambda) $

+

+ ($arrow.r.double.long$)
  それぞれの解が独立かつアフィン空間を被覆する方程式を作れるから成り立つ。
  \
  ($arrow.l.double.long$) この対偶について任意のイデアル
  $I eq.not \( 1 \)$ はそれを含む極大イデアル $frak(m) supset.eq I$
  があり $V \( frak(m) \) eq.not nothing$ となるから
  $V \( I \) eq.not nothing$ である。

+ ($arrow.r.double.long$) $0 = 0$ は任意のアフィン空間の元が成り立つ。 \
  ($arrow.l.double.long$) $V \( I \) = bb(A)_k^n$ のとき Hilbert
  の零点定理より $I = sqrt(\( 0 \)) = \( 0 \)$ となる。
]

#proposition[
1 次元アフィン空間 $bb(A)^1$ 内の代数的集合は
$bb(A)^1$ 以外有限個の点である。
]
#proof[
体 $k$ の $1$
変数多項式環は単項イデアル整域であるから自明でないイデアルは $f \( x \)$
を用いて $I = \( f \( x \) \) eq.not \( 0 \)$ と表される。これより
$ V \( I \) & = { a in k divides f \( a \) = 0 } $
となるから有限個の解しかない。
]

#proposition[
実数体 $bb(R)$ 上の 1
変数多項式環の極大イデアルは $  & \( x - a \) \, a in bb(R)\
 & \( x^2 + a x + b \) \, a \, b in bb(R) \, a^2 - 4 b < 0 $
の形となる。
]
#proof[
単項イデアル整域より既約元のイデアルと極大イデアルは同値である。
]

#block[
交点 平面曲線 $C_f : f \( x \, y \) = 0$ と $C_g : g \( x \, y \) = 0$
の交点について

]
#definition("座標環")[
$ k \[ V \] := k \[ x_1 \, x_2 \, dots.h \, x_n \] \/ I \( V \) $
変数変換を一般化した

代数的集合 $V \, W$ において写像 $phi : V arrow.r W$ を $V$ の点
$P = \( a_1 \, dots.h \, a_m \)$ に対して射 (morphism) を定義する。
$ 3 phi : med & V quad & arrow.r quad & W\
 & P quad & mapsto quad & \( f_1 \( P \) \, dots.h \, f_n \( P \) \) $
$k \[ V \] subset.eq bb(A)_k^m \, k \[ W \] subset.eq bb(A)_k^n$
]
#example[
3 次曲線 $C = V \( y^2 - x^3 \) subset.eq bb(A)_k^2$
を考える。アフィン直線 $bb(A)^1$ とアフィン平面 $bb(A)^2$
の座標環はそれぞれ $k \[ bb(A)^1 \] = k \[ t \]$,
$k \[ bb(A)^2 \] = k \[ x \, y \]$ と与えられる。 $ x = t^2 \, y = t^3 $
$ 3 phi : med & bb(A)^1 quad & arrow.r quad & C\
 & a quad & mapsto quad & \( a^2 \, a^3 \)\
tilde(phi) : med & bb(A)^1 quad & arrow.r quad & bb(A)^2\
 & a quad & mapsto quad & \( a^2 \, a^3 \)\
iota : med & bb(A)^2 quad & arrow.r quad & C\
 & \( a^2 \, a^3 \) quad & mapsto quad & \( a^2 \, a^3 \) $
$ 3 phi^(\#) : med & k \[ C \] = k \[ x \, y \] \/ \( y^2 - x^3 \) quad & arrow.r quad & k \[ bb(A)^1 \] = k \[ t \]\
 & overline(f \( x \, y \)) = f \( x \, y \) med mod med \( y^2 - x^3 \) quad & mapsto quad & f \( t^2 \, t^3 \)\
tilde(phi)^(\#) : med & k \[ bb(A)^2 \] = k \[ x \, y \] quad & arrow.r quad & k \[ bb(A)^1 \] = k \[ t \]\
 & f \( x \, y \) quad & mapsto quad & f \( t^2 \, t^3 \)\
iota^(\#) : med & k \[ bb(A)^2 \] = k \[ x \, y \] quad & arrow.r quad & k \[ C \] = k \[ x \, y \] \/ \( y^2 - x^3 \)\
 & f \( x \, y \) quad & mapsto quad & overline(f \( x \, y \)) $
#block(inset: (left: 0.9em), stroke: (left: 2pt + luma(80%)))[
  #text(size: 0.85em, fill: luma(45%))[図は変換できていません（元の LaTeX）]
  #raw("\\begin{tikzcd}\n      \\mathbb{A}^1 \\arrow[r,\"\\tilde{\\varphi}\"]\\arrow[dr,\"\\varphi\"] & C \\arrow[d,\"\\iota\"] \\\\\n      & \\mathbb{A}^2\n    \\end{tikzcd}\n    \\qquad\n    \\begin{tikzcd}\n      k[\\mathbb{A}^1] & k[C] \\arrow[l,\"\\tilde{\\varphi}^\\#\"] \\\\\n      & k[\\mathbb{A}^2] \\arrow[u,\"\\iota^\\#\"]\\arrow[ul,\"\\varphi^\\#\"]\n    \\end{tikzcd}", lang: "latex", block: true)
] ここで $phi$ は全単射であるが $phi^(\#)$ は $t$
の一次式は得られないことから全射ではない。
]
#example[
$ E & = V \( y^2 - x^3 + 1 \) subset.eq bb(A)^2\
D & = V \( \( x_2^2 - x_1^3 + 1 \, x_3 - x_1^2 \) \) subset.eq bb(A)^3 $
$ 3 psi : med & E quad & arrow.r quad & D\
 & x_1 = x \, x_2 = y \, x_3 = x^2\
tilde(psi) : med & bb(A)^2 quad & arrow.r quad & bb(A)^3\
 & \( a \, b \) quad & mapsto quad & \( a \, b \, a^2 \) $
$ 3 psi^(\#) : med & k \[ D \] = k \[ x_1 \, x_2 \, x_3 \] \/ I quad & arrow.r quad & k \[ E \] = k \[ x \, y \] \/ J\
 & overline(g \( x_1 \, x_2 \, x_3 \)) quad & mapsto quad & overline(g \( x \, y \, x^2 \))\
tilde(psi)^(\#) : med & k \[ bb(A)^3 \] = k \[ x_1 \, x_2 \, x_3 \] quad & arrow.r quad & k \[ bb(A)^2 \] = k \[ x \, y \]\
 & g \( x_1 \, x_2 \, x_3 \) quad & mapsto quad & g \( x \, y \, x^2 \) $
]
#proposition[
代数的集合の射 $phi : V arrow.r W$
が与えられると、座標環の $k$ 準同型写像
$phi^(\#) : k \[ W \] arrow.r k \[ V \]$ が定まり、かつ点
$\( a_1 \, dots.h \, a_m \) in V$ から定まる
]
#block[
重複度・局所交点数 平面曲線 $C_f : f \( x \, y \) = 0$ と
$C_g : g \( x \, y \) = 0$ の交点が重根によって表現されることがある。
$ arrow.b.double $ $n$ 変数多項式環 $R = k \[ x_1 \, dots.h \, x_n \]$
の点 $P$ での局所化 $R_P$ について連立方程式のイデアル
$I = \( f_1 \, dots.h \, f_l \)$ で割った環の $k$
に関する次元を局所交点数と呼び、$I_P \( C_1 \, dots.h \, C_l \)$
と書く。 $ I_P \( C_1 \, dots.h \, C_l \) = dim_k R_P \/ I $

]
#proof[
$R = k \[ x_1 \, dots.h \, x_n \]$ の
$I = \( f_1 \, dots.h \, f_l \)$ に関する局所化 $R_P$
$ f \( x \) & = a_0 product_(j = 1)^m \( x - alpha_j \)^(n_j) $
]

#example[

]
== 射影空間
<射影空間>
無限遠点を含む空間を用いて議論したい。

#definition("射影空間")[
代数的閉体 $k$ 上の
$n + 1$ 次元アフィン空間 $k^(n + 1)$ から原点を除いたものを $W$ とおく。
$ W = k^(n + 1) \/ { \( 0 \, dots.h \, 0 \) } $ $W$ に同値関係
$tilde.op$ を次のように定義する。
$ \( a_0 \, dots.h \, a_n \) tilde.op \( b_0 \, dots.h \, b_n \) arrow.l.r.double exists alpha in k^times \( a_0 \, dots.h \, a_n \) = \( alpha b_0 \, dots.h \, alpha b_n \) $
この同値関係 $tilde.op$ による $W$ の商空間 $W \/ tilde.op$ を
$bb(P)_k^n$ と記し、$n$ 次元射影空間 ($n$-dimensional projective space)
という。 $bb(P)_k^n$ の元は $\( a_0 \, a_1 \, dots.h \, a_n \)$
の定める同値類を $\( a_0 : a_1 : dots.h : a_n \)$ と記し $bb(P)_k^n$
の点という。 $ \( a_0 : a_1 : dots.h : a_n \) in bb(P)_k^n $
]
斉次式

$ X = "Spec" R & = { frak(p) divides frak(p) upright(" is prime ideal") }\
X_f = \( "Spec" R \)_f & = { frak(p) in "Spec" R divides f in.not frak(p) }\
V \( I \) & = { frak(p) in "Spec" R divides I subset.eq frak(p) }\
U_(frak(p)) & = { X_f divides frak(p) in X_f } $

$ Gamma \( U \, cal(O)_X \) & = cal(O)_X \( U \) = inter.big_(frak(p) in U) R_(frak(p)) = {{ s_(frak(p)) } in product_(frak(p) in U) R_(frak(p)) divides U "の開被覆" { X_(f_beta) }_(beta in B)}\
Gamma \( X \, cal(O)_X \) & = cal(O)_X \( X \) = R\
Gamma \( X_f \, cal(O)_X \) & = cal(O)_X \( X_f \) = R_f\
lim_(frak(p) in U) Gamma \( X_f \, cal(O)_X \) & = cal(O)_(X \, frak(p)) = R_(frak(p)) $

== 代入
<代入>
#definition[

]
