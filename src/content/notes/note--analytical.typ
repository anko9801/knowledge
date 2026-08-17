#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem

#show: post.with(
  title: "解析力学",
  date: "2026-08-17",
  tags: ("ノート",),
  summary: "note/analytical.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= ニュートン力学の復習
<ニュートン力学の復習>
#definition[
ニュートンの運動の 3 法則

- 第 1 法則:
  物体が力を受けないとき、物体の運動状態は変化しない。(慣性の法則)

- 第 2 法則: 物体に力が働くとき、力に比例する加速度を持つ。(運動の法則)

- 第 3 法則: 物体 1, 2
  の間に力が働くとき、互いに大きさが等しく逆向きとなる。(作用・反作用の法則)
]
これらを定式化する。
$ m frac(upright(d)^2 bold(r), upright(d) t^2) = bold(F) $

例えば

\- 電磁気力 - ばね - 垂直抗力 - 慣性力 - 外力 - 重力

#definition("仕事")[
$ upright(d) W & = bold(F) dot.op upright(d) bold(r)\
W & = integral_C bold(F) dot.op upright(d) bold(r) $ 一般に仕事は経路
$C$ に依存する。 仕事が経路に依らない力を保存力という。
]
保存力のとき始点 $bold(r)_0$ と終点 $bold(r)$ を用いて
$ W = integral_(bold(r)_0)^(bold(r)) bold(F) dot.op upright(d) bold(r) $
ポテンシャルエネルギー $U \( bold(r) \)$ を基準点 $bold(r)_0$ から
$bold(r)$ までに進むのに必要な仕事と定義する。
$ U & = - integral_(bold(r)_0)^(bold(r)) bold(F) dot.op upright(d) bold(r) $
これは保存力でしか定義できない。

#theorem("エネルギー保存則")[
$ T + U \( bold(r) \) $
]
= 解析力学
<解析力学>
ニュートンの運動方程式の書き換えを行う。目的は解きやすくするためと定式化の適用範囲を拡張するためである。
$ U \( bold(r) \) = - integral_(bold(r)_0)^(bold(r)) bold(F) upright(d) bold(r) $
保存力に関するニュートンの運動方程式
$ m frac(upright(d)^2 bold(r), upright(d) t^2) = - nabla U $
運動エネルギー $ T & = 1 / 2 m dot(bold(r))^2 $ ポテンシャルエネルギー

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([保存力], [ポテンシャルエネルギー], [],),
    table.hline(),
    [重力 (local)], [$m g h$], [],
    [重力 (global)], [$- G frac(M m, r)$], [],
    [バネの力], [$1 / 2 k x^2$], [],
    [電磁気力], [$- q phi.alt \( bold(r) \, t \) + q dot(bold(r)) dot.op bold(A) \( bold(r) \, t \)$], [],
  )]
  , caption: [ポテンシャルエネルギーの表式]
  , kind: table
  )

] <table:potential>
== ラグランジュ形式
<ラグランジュ形式>
#definition("ラグランジアン")[
ラグランジュ形式において、ラグランジアン (Lagrangian)
とよばれる物理量が基本的な量となる。
$ L & = 1 / 2 m dot(bold(r))^2 - U \( bold(r) \) $
]
$ frac(partial L, partial dot(bold(r))) = m dot(bold(r)) \, quad frac(partial L, partial bold(r)) = - nabla U $
運動方程式は Euler-Lagrange 方程式とよばれる。
$ frac(partial L, partial bold(r)) - frac(d, d t) (frac(partial L, partial dot(bold(r)))) = 0 $
一般座標 (generalized coordinates) $q_i = q_i \( t \)$
($i = 1 \, 2 \, dots.h \, n$) を用いて系がラグランジアン
$L = L \( q_i \, dot(q)_i \)$ で記述される場合、運動方程式は
$ frac(partial L, partial q_i) - frac(d, d t) (frac(partial L, partial dot(q)_i)) = 0 $
ラグランジアンは座標系による？
すべての物体は運動方程式を解くことでどう動くかわかる
保存力を考えているのでポテンシャルが存在するので次のように表現できる。
$ frac(partial L, partial q_i) - frac(d, d t) (frac(partial L, partial dot(q)_i)) & = - frac(partial U, partial q_i) - frac(d p_i, d t) = - \( nabla U \)_i - m a_i $
ある座標変換に対して作用積分が対称ならばその対称性に対応する保存量が存在する

== ハミルトン形式
<ハミルトン形式>
#definition("ハミルトニアン")[
ハミルトニアン (Hamiltonian)
$ H & = frac(bold(p)^2, 2 m) + U \( bold(r) \, dot(bold(r)) \)\
H \( q_i \, p_i \) & = sum_i p_i dot(q)_i - L $
]
$ frac(partial H, partial bold(p)) = bold(p) / m \, quad frac(partial H, partial bold(r)) = nabla U $
ニュートンの運動方程式は $bold(p) = m dot(bold(r))$ より
$ frac(upright(d) bold(r), upright(d) t) = frac(partial H, partial bold(p)) \, quad frac(upright(d) bold(p), upright(d) t) = - frac(partial H, partial bold(r)) $
電磁場において $bold(p) = m dot(bold(r))$ とはならない。

== 変分原理
<変分原理>
ニュートンの運動の 3 法則の代わりに変分原理 (variational principle)
あるいはハミルトンの原理 (Hamilton's principle)
と呼ばれる次の原理が存在する。

#axiom("変分原理")[
物体の運動は作用が極値を取るような経路をたどる。
]
作用とは
$ S \[ q \] & = integral_(t_1)^(t_2) L \( q \( t \) \, dot(q) \( t \) \, t \) upright(d) t\
frac(delta S \[ q \], delta q_i) & = frac(partial L, partial q_i) - frac(d, d t) (frac(partial L, partial dot(q)_i)) = 0 $
ボールを投げたときに放物線を描くのはどんな運動もさまざまな軌道の中で等速に近くポテンシャルが高くなるような\"ちょうどいい\"軌道を選ぶ。

短いスケールではなく全体の動き
変分原理にトキメキを感じるくらい基礎のように見えたならあなたはセンスがあります。

ただトキメキを感じなければ運動方程式と数学的に同値な表現と思った方がいいです。一般の座標系にしただけで意味がない

== Noether の定理
<noether-の定理>
#theorem("Noether's theorem")[
無限小変換に対して
$ t & arrow.r t' = t + delta t\
q_i & arrow.r q_(i') = q_i + delta q_i $
作用積分が不変に保たれるならば保存量 $Phi$ が存在する。
$ Phi = p_i \( delta q_i - dot(q)_i delta t \) + L delta t $
]
#proof[
$ delta S = S' - S & = integral_(t_(1'))^(t_(2')) L (q_(i') \, frac(upright(d) q_(i'), upright(d) t')) upright(d) t' - integral_(t_1)^(t_2) L \( q_i \, dot(q)_i \) upright(d) t\
 & = integral_(t_1)^(t_2) L (q_(i') \, frac(upright(d) q_(i'), upright(d) t')) frac(upright(d) t', upright(d) t) upright(d) t - integral_(t_1)^(t_2) L \( q_i \, dot(q)_i \) upright(d) t\
 & = integral_(t_1)^(t_2) (L (q_(i') \, frac(upright(d) q_(i'), upright(d) t')) - L \( q_i \, dot(q)_i \)) upright(d) t + integral_(t_1)^(t_2) L (q_(i') \, frac(upright(d) q_(i'), upright(d) t')) accent(delta t, ̇) upright(d) t\
 & = integral_(t_1)^(t_2) (delta L + L (q_i \, dot(q)_i) accent(delta t, ̇)) upright(d) t $
任意の時間で $delta S = 0$ となるから
$delta L + L (q_i \, dot(q)_i) accent(delta t, ̇) = 0$ となる。
$ delta dot(q)_i & = frac(upright(d) q_(i'), upright(d) t') - dot(q)_i = frac(upright(d) t, upright(d) t') frac(upright(d) q_(i'), upright(d) t) - dot(q)_i = \( 1 - accent(delta t, ̇) \) \( dot(q)_i + accent(delta q_i, ̇) \) - dot(q)_i = - dot(q)_i accent(delta t, ̇) + accent(delta q_i, ̇) $
$ delta L & = L (q_(i') \, frac(upright(d) q_(i'), upright(d) t')) - L \( q_i \, dot(q)_i \)\
 & = frac(partial L, partial q_i) delta q_i + frac(partial L, partial dot(q)_i) (- dot(q)_i accent(delta t, ̇) + accent(delta q_i, ̇))\
 & = (frac(partial L, partial q_i) - frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i))) delta q_i + frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i) \( delta q_i - dot(q)_i delta t \)) + frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i) dot(q)_i) delta t\
delta L + L (q_i \, dot(q)_i) accent(delta t, ̇) & = frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i) \( delta q_i - dot(q)_i delta t \) + L delta t) + frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i) dot(q)_i) delta t - frac(upright(d) L, upright(d) t) delta t\
 & = frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i) \( delta q_i - dot(q)_i delta t \) + L delta t) + (frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i)) dot(q)_i + frac(partial L, partial dot(q)_i) dot.double(q)_i) delta t - (frac(partial L, partial q_i) dot(q)_i + frac(partial L, partial dot(q)_i) dot.double(q)_i) delta t\
 & = frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i) \( delta q_i - dot(q)_i delta t \) + L delta t) - (frac(partial L, partial q_i) - frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i))) dot(q)_i delta t\
 & = frac(upright(d), upright(d) t) (frac(partial L, partial dot(q)_i) \( delta q_i - dot(q)_i delta t \) + L delta t) = 0 $
]

#example[
微少量 $epsilon$ を用いて表現する。
$p_i \( delta q_i - dot(q)_i delta t \) + L delta t$

- 並進対称性 $delta q_i = epsilon$, $delta t = 0$ より $p_i$
  は保存量となる。

- 回転対称性 $delta x_i = - epsilon y_i$, $delta y_i = epsilon x_i$,
  $delta t = 0$ より
  $x_i p_(y_i) - y_i p_(x_i) = \( bold(r) times bold(p) \)_z = L_z$
  は保存量となる。

- 時間推進対称性 $delta q_i = 0$, $delta t = - epsilon$ より
  $p_i dot(q)_i - L = H$ は保存量となる。
]
== 正準変換
<正準変換>
= 
<section>
== 解析力学の復習：点正準変換
<解析力学の復習点正準変換>
ある $N$ 自由度の系の一般化座標を $q_1 \, dots.h \, q_N$ として Lagrange
形式では一般化座標 $q_i$ と一般化速度 $dot(q)_i$ を用いて表現される.
このとき一般化運動量 $p_i$ は次のように定められる.
$ L & = L \( q_1 \, dots.h \, q_N \, dot(q)_1 \, dots.h \, dot(q)_N \) \,\
p_i & = (frac(partial L, partial dot(q)_i))_(q_1 \, dots.h \, q_N \, dot(q)_1 \, dots.h \, dot(q)_(i - 1) \, dot(q)_(i + 1) \, dots.h \, dot(q)_N) #h(2em) \( i = 1 \, dots.h \, N \) . $
一方 Hamilton 形式では一般化座標 $q_i$ と一般化運動量 $p_i$
を用いて表現される.
$ H & = H \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) = sum_(i = 1)^N p_i dot(q)_i - L \,\
frac(upright(d) q_i, upright(d) t) & = frac(partial H, partial p_i) \, #h(2em) frac(upright(d) p_i, upright(d) t) = - frac(partial H, partial q_i) #h(2em) \( i = 1 \, dots.h \, N \) . $

#block[
Q 17-1. Lagrange 形式での一般座標変換
$\( q_1 \, dots.h \, q_N \) arrow.r \( Q_1 \, dots.h \, Q_N \)$
に対応する Hamilton 形式で正準変換を点正準変換といい,
$\( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) arrow.r \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \)$
を求める. $ q_i = f_i \( Q_1 \, dots.h \, Q_N \) . $

]
(i) 新しい運動量 $P_j$ は Lagrange 形式を用いて次のように求められる.
$ P_j & = (frac(partial L, partial dot(Q)_j))_(Q_1 \, dots.h \, Q_N \, dot(Q)_1 \, dots.h \, dot(Q)_(j - 1) \, dot(Q)_(j + 1) \, dots.h \, dot(Q)_N) #h(2em) \( j = 1 \, 2 \, dots.h \, N \)\
 & = sum_(i = 1)^N frac(partial L, partial dot(q)_i) frac(partial dot(q)_i, partial dot(Q)_j)\
 & = sum_(i = 1)^N p_i frac(partial q_i, partial Q_j)\
 & = sum_(i = 1)^N frac(partial f_i \( Q_1 \, dots.h \, Q_N \), partial Q_j) p_i . $

(ii) また新しい Hamilton 関数は定義式から古い Hamilton 関数と一致する.
$ H' = H' \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \) = sum_(j = 1)^N P_j dot(Q)_j - L = sum_(j = 1)^N sum_(i = 1)^N frac(partial f_i \( Q_1 \, dots.h \, Q_N \), partial Q_j) p_i dot(Q)_j - L = sum_(i = 1)^N p_i dot(q)_i - L = H $

== 1 次元結晶における平衡位置の回りの調和振動を記述する Hamilton 関数
<次元結晶における平衡位置の回りの調和振動を記述する-hamilton-関数>
直線上に等間隔の平衡位置を持って並んだ $N$ 個の原子からなる 1
次元結晶を物理系として記述して古典力学により考察する. $i$
番目の原子の位置座標の平衡位置からのずれを $q_i$ として, その運動量を
$p_i$ とする.

#block[
Q 17-2. 1 次元結晶の Hamilton 関数は次のように表される.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & := frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 $
ただし $kappa$ は隣り合った原子の間の原子間力のバネ定数とし,
両端の原子は固定されている $q_0 = q_(N + 1) = 0$ と仮定する.

]
$i$ 番目の原子の運動エネルギーは運動量 $p_i$ を用いて次のように表される.
$ frac(p_i^2, 2 m) . $ また隣り合う $i \, i + 1$
番目の原子の原子間力のポテンシャルエネルギーはバネ定数 $kappa$
を用いて次のように表される. $ 1 / 2 kappa \( q_i - q_(i + 1) \)^2 . $
これより Hamilton 関数は次のように表される.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & := frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 . $

== 1 次元結晶における平衡位置の回りの調和振動の基準モードの計算
<次元結晶における平衡位置の回りの調和振動の基準モードの計算>
#block[
Q 17-3. 固定端境界条件の 1 次元結晶の系を考えているので Fourier
展開した基底が基準振動となる.
$ H^(1 "次元結晶") \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \) & = sum_(j = 1)^N (frac(1, 2 m) P_j^2 + 1 / 2 m omega_j^2 Q_j^2) . $
ただし, $omega_j$ を次のように定める.
$ omega_j = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j) . $

]
固定端境界条件の 1 次元結晶の系を考えているので Fourier Sine
展開の基底が基準振動になっているとする.
$ q_i^(\( j \)) & = sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j i) . $
まず計算に必要な関数を定義する. \
(i) $alpha eq.not 0 med \( mod med 2 pi \)$ に対して
$F \( alpha \) \, G \( alpha \)$ を次のように定義する.
$ F \( alpha \) & := sum_(i = 1)^N cos \( alpha i \) \,\
G \( alpha \) & := sum_(i = 1)^N sin \( alpha i \) . $ このとき
$F \( alpha \) \, G \( alpha \) in bb(R)$ より
$F \( alpha \) + sqrt(- 1) G \( alpha \) in bb(C)$
の実部と虚部はそれぞれ $F \( alpha \) \, G \( alpha \)$
と対応した値となる. Euler の公式を用いて次のように計算できる.
$ F \( alpha \) + sqrt(- 1) G \( alpha \) & = sum_(i = 1)^N e^(sqrt(- 1) alpha i)\
 & = frac(e^(sqrt(- 1) alpha) - e^(sqrt(- 1) alpha \( N + 1 \)), 1 - e^(sqrt(- 1) alpha))\
 & = frac(2 e^(sqrt(- 1) alpha) e^(sqrt(- 1) alpha N / 2) sin alpha N / 2, 2 e^(sqrt(- 1) alpha 1 / 2) sin alpha 1 / 2)\
 & = frac(e^(sqrt(- 1) alpha / 2 \( N + 1 \)) sin alpha / 2 N, sin alpha / 2)\
 & = frac(cos (alpha / 2 \( N + 1 \)) sin alpha / 2 N, sin alpha / 2) + sqrt(- 1) frac(sin (alpha / 2 \( N + 1 \)) sin alpha / 2 N, sin alpha / 2) . $
これより実部虚部の対応から $F \( alpha \) \, G \( alpha \)$ が求まる.
$ F \( alpha \) & := sum_(i = 1)^N cos \( alpha i \) = frac(cos (alpha / 2 \( N + 1 \)) sin (alpha / 2 N), sin alpha / 2) \,\
G \( alpha \) & := sum_(i = 1)^N sin \( alpha i \) = frac(sin (alpha / 2 \( N + 1 \)) sin (alpha / 2 N), sin alpha / 2) . $

(ii) $j \, j' = 1 \, dots.h \, N$ とすると
$j - j' = - \( N - 1 \) \, dots.h \, N - 1$ かつ
$j + j' = 2 \, dots.h \, 2 N$ である. これより $j - j' = 0$
である場合に限り $j - j' = 0 med \( mod med 2 \( N + 1 \) \)$
が成り立ち, $j + j' = 0 med \( mod med 2 \( N + 1 \) \)$
が成り立つ場合は存在せず,
逆に主結合子の前件が恒偽ならばその論理式は真である.
よって次の同値関係が成り立つ.
$  & frac(pi, N + 1) \( j - j' \) = 0 med \( mod med 2 pi \) arrow.l.r.double j - j' = 0 med \( mod med 2 \( N + 1 \) \) arrow.l.r.double j = j' \,\
 & frac(pi, N + 1) \( j + j' \) = 0 med \( mod med 2 pi \) arrow.l.r.double j + j' = 0 med \( mod med 2 \( N + 1 \) \) arrow.l.r.double f a l s e . $<Q17-3-ii-1>

(iii) $j \, j' = 1 \, dots.h \, N$ に対して次のように内積を定義する.
このときこの内積の正規直交関係を示す.
$ \( q^(\( j \)) \, q^(\( j' \)) \) & := sum_(i = 1)^N q_i^(\( j \)) q_i^(\( j' \)) . $
まず (i), (ii) を用いることで次のように式変形できる.
$ \( q^(\( j \)) \, q^(\( j' \)) \) & := sum_(i = 1)^N q_i^(\( j \)) q_i^(\( j' \))\
 & = frac(2, N + 1) sum_(i = 1)^N sin (frac(pi, N + 1) j i) sin (frac(pi, N + 1) j' i)\
 & = frac(1, N + 1) sum_(i = 1)^N (cos (frac(pi, N + 1) \( j - j' \) i) - cos (frac(pi, N + 1) \( j + j' \) i))\
 & = cases(delim: "{", frac(1, N + 1) (frac(cos (pi / 2 \( j - j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j - j' \)), sin (frac(pi, 2 \( N + 1 \)) \( j - j' \))) - frac(cos (pi / 2 \( j + j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j + j' \)), sin (frac(pi, 2 \( N + 1 \)) \( j + j' \)))) & \( j eq.not j' \), frac(1, N + 1) (N - frac(cos (j pi) sin (frac(j N, N + 1) pi), sin (frac(j, N + 1) pi))) & \( j = j' \)) . $
先に $j eq.not j'$ の場合を考える.
括弧内を通分した分子の第一項と第二項についてそれぞれ計算する.
第一項について
$  & cos (pi / 2 \( j - j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j - j' \)) sin (frac(pi, 2 \( N + 1 \)) \( j + j' \))\
= & cos (frac(j - j', 2) pi) (cos (frac(\( N - 1 \) j - \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(\( N + 1 \) j - \( N - 1 \) j', 2 \( N + 1 \)) pi))\
= & cos (frac(j - j', 2) pi) cos (frac(\( N - 1 \) j - \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(j - j', 2) pi) cos (frac(\( N + 1 \) j - \( N - 1 \) j', 2 \( N + 1 \)) pi)\
= & cos (frac(j, N + 1) pi) + cos (frac(N j - \( N + 1 \) j', N + 1) pi) - cos (frac(j', N + 1) pi) - cos (frac(\( N + 1 \) j - N j', N + 1) pi) . $<Q17-3-iii-1>
第二項について
$  & cos (pi / 2 \( j + j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j + j' \)) sin (frac(pi, 2 \( N + 1 \)) \( j - j' \))\
= & cos (frac(j + j', 2) pi) (cos (frac(\( N - 1 \) j + \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(\( N + 1 \) j + \( N - 1 \) j', 2 \( N + 1 \)) pi))\
= & cos (frac(j + j', 2) pi) cos (frac(\( N - 1 \) j + \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(j + j', 2) pi) cos (frac(\( N + 1 \) j + \( N - 1 \) j', 2 \( N + 1 \)) pi)\
= & cos (frac(N j + \( N + 1 \) j', N + 1) pi) + cos (frac(j, N + 1) pi) - cos (frac(\( N + 1 \) j + N j', N + 1) pi) - cos (frac(j', N + 1) pi) . $<Q17-3-iii-2>
これより分子は次のようになる.
$ upright(Q 17 - 3 . i i i 1) - upright(Q 17 - 3 . i i i 2) & = (cos frac(j, N + 1) pi + cos (frac(N j, N + 1) - j') pi - cos frac(j', N + 1) pi - cos (j - frac(N j', N + 1)) pi)\
 & - (cos (frac(N j, N + 1) + j') pi + cos frac(j, N + 1) pi - cos (j + frac(N j', N + 1)) pi - cos frac(j', N + 1) pi)\
 & = cos (frac(N j, N + 1) - j') pi - cos (frac(N j, N + 1) + j') pi + cos (j + frac(N j', N + 1)) pi - cos (j - frac(N j', N + 1)) pi\
 & = 2 sin (j' pi) sin (frac(N j, N + 1) pi) - 2 sin (j pi) sin (frac(N j', N + 1) pi)\
 & = 0 #h(2em) \( because j \, j' in bb(Z) \) . $ よって $j eq.not j'$
のときは $\( q^(\( j \)) \, q^(\( j' \)) \) = 0$ となる.

次に $j = j'$ の場合を考える. これは $j$
が奇数か偶数かで場合分けして考える.
$ frac(cos (j pi) sin (frac(j N, N + 1) pi), sin (frac(j, N + 1) pi)) & = cases(delim: "{", frac(cos (2 k pi) sin (frac(2 k N, N + 1) pi), sin (frac(2 k, N + 1) pi)) & \( j = 2 k \, k in bb(Z) \), frac(cos (\( 2 k - 1 \) pi) sin (frac(\( 2 k - 1 \) N, N + 1) pi), sin (frac(2 k - 1, N + 1) pi)) & \( j = 2 k - 1 \, k in bb(Z) \))\
 & = {frac(1 dot.op sin (2 k pi frac(N, N + 1) - 2 k pi), sin (2 k pi frac(1, N + 1)))\
frac(- 1 dot.op - sin (\( 2 k - 1 \) pi frac(N, N + 1) - \( 2 k - 1 \) pi), sin (\( 2 k - 1 \) pi frac(1, N + 1)))\
 & = - 1 . $ よって $j = j'$ のときは
$\( q^(\( j \)) \, q^(\( j' \)) \) = 1$ となる. これより,
まとめると次の式が成り立つ.
$ \( q^(\( j \)) \, q^(\( j' \)) \) = delta_(j \, j') . $

(iv) ここで行列 $A_(i j) := q_i^(\( j \))$ を定義する.
このとき次の計算から $A_(i j)$ は直交行列であるとわかる.
$ \( A^top A \)_(i j) & = sum_(k = 1)^N A_(i k)^top A_(k j) = sum_(k = 1)^N A_(k i) A_(k j) = sum_(k = 1)^N q_k^(\( i \)) q_k^(\( j \)) = \( q^(\( i \)) \, q^(\( j \)) \) = delta_(i \, j) . $

(v) また $A_(i j)$ が直交行列であるから次のような正規直交関係もある.
$ \( A A^top \)_(i j) & = sum_(k = 1)^N A_(i k) A_(k j)^top = sum_(k = 1)^N A_(i k) A_(j k) = sum_(k = 1)^N q_i^(\( k \)) q_j^(\( k \)) = delta_(i \, j) . $

(vi) ここで原子の変位を表す古い座標系 $q_1 \, dots.h \, q_N$ を
$q^(\( 1 \)) \, dots.h \, q^(\( N \))$ で離散 Fourier Sine
展開した振幅を新しい座標系 $Q_1 \, dots.h \, Q_N$ と定義する.
$ q_i = sum_(j = 1)^N Q_j q_i^(\( j \)) . $
これは点正準変換を用いて新しい運動量を古い運動量を表せられる.
$ P_j = sum_(i = 1)^N frac(partial q_i, partial Q_j) p_i = sum_(i = 1)^N q_i^(\( j \)) p_i . $

(vii) Hamilton
関数の運動エネルギーの表式の核の部分について次のように表される.
$ sum_(j = 1)^N P_j^2 = sum_(j = 1)^N (sum_(i = 1)^N q_i^(\( j \)) p_i)^2 = sum_(j = 1)^N sum_(i = 1)^N sum_(i' = 1)^N \( q_i^(\( j \)) p_i \) \( q_(i')^(\( j \)) p_(i') \) = sum_(i = 1)^N p_i^2 . $

(viii) Hamilton
関数のポテンシャルエネルギーの核の部分について次のような表される.
$ sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 & = sum_(i = 0)^N (sum_(j = 1)^N (Q_j q_i^(\( j \)) - Q_j q_(i + 1)^(\( j \))))^2\
 & = sum_(i = 0)^N sum_(j = 1)^N sum_(j' = 1)^N (Q_j q_i^(\( j \)) - Q_j q_(i + 1)^(\( j \))) (Q_(j') q_i^(\( j' \)) - Q_(j') q_(i + 1)^(\( j' \)))\
 & = sum_(j = 1)^N sum_(j' = 1)^N sum_(i = 0)^N \( q_i^(\( j \)) - q_(i + 1)^(\( j \)) \) \( q_i^(\( j' \)) - q_(i + 1)^(\( j' \)) \) Q_j Q_(j')\
 & = sum_(j = 1)^N sum_(j' = 1)^N B_(j \, j') Q_j Q_(j') . $ ただし,
$B_(j \, j')$ を次のように定める.
$ B_(j \, j') := sum_(i = 0)^N \( q_i^(\( j \)) - q_(i + 1)^(\( j \)) \) \( q_i^(\( j' \)) - q_(i + 1)^(\( j' \)) \) . $

(ix) 次に $B_(j \, j')$ を求める. まず
$q_i^(\( j \)) - q_(i + 1)^(\( j \))$ は次のように求められる.
$ q_i^(\( j \)) - q_(i + 1)^(\( j \)) & = sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j i) - sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j \( i + 1 \))\
 & = sqrt(frac(2, N + 1)) (sin (frac(pi, N + 1) j i) - sin (frac(pi, N + 1) j \( i + 1 \)))\
 & = - 2 sqrt(frac(2, N + 1)) cos (pi / 2 frac(\( 2 i + 1 \) j, N + 1)) sin (pi / 2 frac(j, N + 1)) . $

(x) これより $B_(j \, j')$ は次のように計算できる.
$ B_(j \, j') & = sum_(i = 0)^N \( q_i^(\( j \)) - q_(i + 1)^(\( j \)) \) \( q_i^(\( j' \)) - q_(i + 1)^(\( j' \)) \)\
 & = sum_(i = 0)^N (- 2 sqrt(frac(2, N + 1)) cos (pi / 2 frac(\( 2 i + 1 \) j, N + 1)) sin (pi / 2 frac(j, N + 1))) (- 2 sqrt(frac(2, N + 1)) cos (pi / 2 frac(\( 2 i + 1 \) j', N + 1)) sin (pi / 2 frac(j', N + 1)))\
 & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) frac(2, N + 1) sum_(i = 0)^N cos (frac(pi, N + 1) j (i + 1 / 2)) cos (frac(pi, N + 1) j' (i + 1 / 2))\
 & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) frac(1, N + 1) sum_(i = 0)^N (cos (frac(pi, N + 1) \( j + j' \) (i + 1 / 2)) + cos (frac(pi, N + 1) \( j - j' \) (i + 1 / 2)))\
 & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) tilde(B)_(j \, j') . $
ただし, $tilde(B)_(j \, j')$ を次のように定める.
$ tilde(B)_(j \, j') & := frac(1, N + 1) sum_(i = 0)^N (cos (frac(pi, N + 1) \( j + j' \) (i + 1 / 2)) + cos (frac(pi, N + 1) \( j - j' \) (i + 1 / 2))) . $

(xi) さらに $tilde(B)_(j \, j')$ は次のように計算できる.
$ tilde(B)_(j \, j') & = frac(1, N + 1) sum_(i = 0)^N (cos (pi frac(j + j', N + 1) (i + 1 / 2)) + cos (pi frac(j - j', N + 1) (i + 1 / 2)))\
 & med = frac(1, N + 1) sum_(i = 0)^N #scale(x: 240%, y: 240%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) cos (pi frac(j + j', N + 1) i)\
 & - sin (pi / 2 frac(j + j', N + 1)) sin (pi frac(j + j', N + 1) i)\
 & + cos (pi / 2 frac(j - j', N + 1)) cos (pi frac(j - j', N + 1) i)\
 & - sin (pi / 2 frac(j - j', N + 1)) sin (pi frac(j - j', N + 1) i) #scale(x: 240%, y: 240%)[\]]\
 & med = frac(1, N + 1) #scale(x: 240%, y: 240%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) (1 + F (pi frac(j + j', N + 1)))\
 & - sin (pi / 2 frac(j + j', N + 1)) G (pi frac(j + j', N + 1))\
 & + cos (pi / 2 frac(j - j', N + 1)) (1 + F (pi frac(j - j', N + 1)))\
 & - sin (pi / 2 frac(j - j', N + 1)) G (pi frac(j - j', N + 1)) #scale(x: 240%, y: 240%)[\]] . $

(xii) まず $tilde(B)_(j \, j')$ について $j = j'$ の場合を考える.
$ tilde(B)_(j \, j') & = tilde(B)_(j \, j)\
 & = frac(1, N + 1) [cos (frac(1, N + 1) j pi) (1 + F (frac(2, N + 1) j pi)) - sin (frac(1, N + 1) j pi) G (frac(2, N + 1) j pi) + (1 + N) - 0]\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) (1 + frac(cos (j pi) sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi))) - sin (frac(1, N + 1) j pi) frac(sin (j pi) sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi)))\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) + (cos (frac(1, N + 1) j pi) cos (j pi) - sin (frac(1, N + 1) j pi) sin (j pi)) frac(sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi)))\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) + cos (frac(N + 2, N + 1) j pi) frac(sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi)))\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) sin (frac(1, N + 1) j pi) + cos (frac(N + 2, N + 1) j pi) sin (frac(N, N + 1) j pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, N + 1) j pi)\
 & = 1 + frac(1, N + 1) (1 / 2 sin (frac(2, N + 1) j pi) + 1 / 2 sin (- frac(2, N + 1) j pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, N + 1) j pi)\
 & = 1 . $

(xiii) 次に $tilde(B)_(j \, j')$ について $j eq.not j'$ の場合を考える.
$ tilde(B)_(j \, j') & = tilde(B)_(j \, j')\
 & med = frac(1, N + 1) #scale(x: 240%, y: 240%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) (1 + F (pi frac(j + j', N + 1)))\
 & - sin (pi / 2 frac(j + j', N + 1)) G (pi frac(j + j', N + 1))\
 & + cos (pi / 2 frac(j - j', N + 1)) (1 + F (pi frac(j - j', N + 1)))\
 & - sin (pi / 2 frac(j - j', N + 1)) G (pi frac(j - j', N + 1)) #scale(x: 240%, y: 240%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) (1 + frac(cos (1 / 2 \( j + j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j + j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi)))\
 & - sin (pi / 2 frac(j + j', N + 1)) frac(sin (1 / 2 \( j + j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j + j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi))\
 & + cos (pi / 2 frac(j - j', N + 1)) (1 + frac(cos (1 / 2 \( j - j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j - j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi)))\
 & - sin (pi / 2 frac(j - j', N + 1)) frac(sin (1 / 2 \( j - j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j - j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi)) #scale(x: 300%, y: 300%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) + (cos (pi / 2 frac(j + j', N + 1)) cos (frac(j + j', 2) pi) - sin (pi / 2 frac(j + j', N + 1)) sin (frac(j + j', 2) pi)) frac(sin (frac(N \( j + j' \), 2 \( N + 1 \)) pi), sin (frac(j + j', 2 \( N + 1 \)) pi))\
 & + cos (pi / 2 frac(j - j', N + 1)) + (cos (pi / 2 frac(j - j', N + 1)) cos (frac(j - j', 2) pi) - sin (pi / 2 frac(j - j', N + 1)) sin (frac(j - j', 2) pi)) frac(sin (frac(N \( j - j' \), 2 \( N + 1 \)) pi), sin (frac(j - j', 2 \( N + 1 \)) pi)) #scale(x: 300%, y: 300%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) + cos (frac(N + 2, 2 \( N + 1 \)) \( j + j' \) pi) frac(sin (frac(N, 2 \( N + 1 \)) \( j + j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi))\
 & + cos (pi / 2 frac(j - j', N + 1)) + cos (frac(N + 2, 2 \( N + 1 \)) \( j - j' \) pi) frac(sin (frac(N, 2 \( N + 1 \)) \( j - j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi)) #scale(x: 300%, y: 300%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad 1 / 2 (sin (frac(j + j', N + 1) pi) + sin (\( j + j' \) pi) + sin (- frac(j + j', N + 1) pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi)\
 & + 1 / 2 (sin (frac(j - j', N + 1) pi) + sin (\( j - j' \) pi) + sin (- frac(j - j', N + 1) pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi) #scale(x: 240%, y: 240%)[\]]\
 & = 0 . $ よって (xii), (xiii) の考察から次の式が成り立つ.
$ tilde(B)_(j \, j') = delta_(j \, j') . $

(xiv) これより $B_(j \, j')$ は (x) の考察から次のようになる.
$ B_(j \, j') & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) tilde(B)_(j \, j')\
 & = delta_(j \, j') 4 sin^2 (frac(pi, 2 \( N + 1 \)) j) . $

(xv) ポテンシャルエネルギーの表式 (vii) に代入して次のようになる.
$ sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 & = sum_(j = 1)^N sum_(j' = 1)^N B_(j \, j') Q_j Q_(j')\
 & = sum_(j = 1)^N sum_(j' = 1)^N delta_(j \, j') 4 sin^2 (frac(pi, 2 \( N + 1 \)) j) Q_j Q_(j')\
 & = 4 sum_(j = 1)^N sin^2 (frac(pi, 2 \( N + 1 \)) j) Q_j^2 . $

(xvi) よって Hamilton 関数は (vii) (xv) から次のように表される.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & = frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2\
 & = frac(1, 2 m) sum_(j = 1)^N P_j^2 + 2 kappa sum_(j = 1)^N sin^2 (frac(pi, 2 \( N + 1 \)) j) Q_j^2\
H^(1 "次元結晶") \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \) & = sum_(j = 1)^N (frac(1, 2 m) P_j^2 + 1 / 2 m omega_j^2 Q_j^2) . $
ただし, $omega_j$ を次のように定めた.
$ omega_j = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j) #h(2em) \( j = 1 \, dots.h \, N \) . $

#block[
Q 17-4. 1 次元結晶中の波数 $k$ に対する分散関係 $omega \( k \)$
は次のようになる.
$ omega \( k \) & = 2 sqrt(kappa / m) sin (1 / 2 k a) approx sqrt(kappa / m) k a + cal(O) \( \( k a \)^3 \) #h(2em) \( k a lt.double 1 \) . $

]
(i) $j = 1 \, dots.h \, N$ に対して $j$ 番目の基準振動 $q_i^(\( j \))$
は次のように計算される.
$ q_i^(\( j \)) & = sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j i)\
 & = sqrt(frac(2, N + 1)) sin (pi / a frac(j, N + 1) x_i)\
 & = sqrt(frac(2, N + 1)) sin (k_j x_i) . $ ただし, $i$
番目の原子の平衡位置の座標を $x_i = a i$ とし, $j$ 番目の基準振動の波数
$k_j$ を次のように定める.
$ k_j := pi / a frac(j, N + 1) #h(2em) \( j = 1 \, dots.h \, N \) . $

(ii) 基準振動 $q_i^(\( j \))$ の角振動数 $omega_j$ を波数 $k_j$
の関数として次のように表される.
$ omega \( k_j \) & = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j)\
 & = 2 sqrt(kappa / m) sin (1 / 2 k_j a) . $ よって分散関係
$omega = omega \( k \)$ は次のように与えられる.
$ omega \( k \) & = 2 sqrt(kappa / m) sin (1 / 2 k a) . $

(iii) この 1 次元結晶を伝わる線形波動 (弾性波, 音波)
が波数ごとに異なる速さを持って伝播するということから,
1次元結晶中にこれらを重ね合わせて波束が作られたとすると次第に波束の形が変化していき最終的に崩壊する.

(iv) 十分に長波長 $k a lt.double 1$
のとき次のように近似することで分散関係 $omega \( k \)$ は線形関係となる.
$ omega \( k \) & = 2 sqrt(kappa / m) sin (1 / 2 k a)\
 & approx 2 sqrt(kappa / m) (1 / 2 k a + cal(O) \( \( k a \)^3 \))\
 & = sqrt(kappa / m) k a + cal(O) \( \( k a \)^3 \) #h(2em) \( k a lt.double 1 \) . $

(v) 長波長の極限での弾性波の速さを音速という. 固体の音速 $v$
は次のようになる.
$ v & = lim_(k a arrow.r 0) frac(omega \( k \), k) = sqrt(kappa / m) a . $

(vi) (iv), (v) の考察より十分に長波長のとき分散関係が線形関係となるので
1 次元結晶中では線形波動は音速 $v$ と等しい速さを持って伝搬する.

#block[
Q 17-5. 1 次元結晶における基準振動の角振動数 $omega_j$
の分布を明らかにする.

]
(i)(ii) $omega_j$ は次のように表されることから $j = 1 \, dots.h \, N$
に対して単調増加となる.
$ omega_j & = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j) . $
これより $omega_j$ の最大値と最小値は次のようになる.
$ omega_max & := max_(1 lt.eq j lt.eq N) omega_j = omega_N = 2 sqrt(kappa / m) sin (frac(pi N, 2 \( N + 1 \))) approx 2 sqrt(kappa / m) \,\
omega_min & := min_(1 lt.eq j lt.eq N) omega_j = omega_1 = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \))) approx 2 sqrt(kappa / m) frac(pi, 2 \( N + 1 \)) = sqrt(kappa / m) frac(pi, N + 1) . $

== 3 次元結晶における平衡位置の回りの調和振動を記述する Hamilton 関数
<次元結晶における平衡位置の回りの調和振動を記述する-hamilton-関数-1>
立方格子の各点に平衡位置を持つ $N^3$ 個の原子が全体として立方体に並んだ
3 次元結晶を物理系として記述して、古典力学により考察する。任意の
$i_x \, i_y \, i_z = 1 \, dots.h \, N$ に対してラベル
$\( i_x \, i_y \, i_z \)$ を持つ原子の平衡位置は格子定数 $a$ を用いて
$\( a i_x \, a i_y \, a i_z \)$ であるとする.

#block[
Q 17-6. このとき 3 次元結晶の Hamilton 関数は次のように与えられる.
$  & H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)\
:= & frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) p_(i_x \, i_y \, i_z \, alpha)^2\
+ & 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y \, i_z + 1 \, alpha) \)^2) . $
ただし $m$ は 1 個の原子の質量であり, $kappa$
は隣り合った原子間の原子間力のバネ定数とする.
また立方体の表面は固定されているとする.
$ i_x = 0 \, N + 1 or i_y = 0 \, N + 1 or i_z = 0 \, N + 1 arrow.r.double.long q_(i_x \, i_y \, i_z \, alpha) = 0 . $

]
Q17-3 の考察から 1 次元結晶の系の Hamilton 関数は次のように与えられる.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & := frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 . $
3 次元結晶の系は $N^3$ 個の原子と $3$ 個の自由度があり,
それらの原子間力は独立にそれぞれの自由度と原子に働くと考えられる.
これより 3 次元結晶の系の Hamilton 関数
$H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)$
は次のように書ける.
$  & H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)\
:= & frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) p_(i_x \, i_y \, i_z \, alpha)^2\
+ & 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y \, i_z + 1 \, alpha) \)^2) . $
ただし $m$ は 1 個の原子の質量であり, $kappa$
は隣り合った原子間の原子間力のバネ定数とする.
また立方体の表面は固定されているとする.
$ i_x = 0 \, N + 1 or i_y = 0 \, N + 1 or i_z = 0 \, N + 1 arrow.r.double.long q_(i_x \, i_y \, i_z \, alpha) = 0 . $

== 3 次元結晶における平衡位置の回りの調和振動の基準モードの計算
<次元結晶における平衡位置の回りの調和振動の基準モードの計算-1>
固定端境界条件の 3 次元結晶の系を考えているので 1 次元の Fourier Sine
展開の基底 3 つの直積が基準振動になっていると予想できる.
これより古い座標 $q_(i_x \, i_y \, i_z \, alpha)$ を基準振動
$q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))$
で展開したときの振幅を新しい座標 $Q_(j_x \, j_y \, j_z \, alpha)$
とする.
$ q_(i_x \, i_y \, i_z \, alpha) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N Q_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) . $
この新しい座標 $Q_(j_x \, j_y \, j_z \, alpha)$ に対応する新しい運動量を
$P_(j_x \, j_y \, j_z \, alpha)$ とおくと Hamilton
関数について次のように表される.

#block[
Q 17-7. 新しい座標と運動量
$Q_(j_x \, j_y \, j_z \, alpha) \, P_(j_x \, j_y \, j_z \, alpha)$
において Hamilton 関数は次のように表される.
$ H^(3 "次元結晶") \( \( Q_(j_x \, j_y \, j_z \, alpha) \, P_(j_x \, j_y \, j_z \, alpha) \)_(1 lt.eq j_x \, j_y \, j_z lt.eq N \, alpha = x \, y \, z) \) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) P_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 Q_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし, $omega_(j_x \, j_y \, j_z)$ は次のように定めた.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

]
(i) Q17-1 の考察より新しい運動量を古い運動量と座標,
新しい座標から求めることができる.
$ P_(j_x \, j_y \, j_z \, alpha) & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N frac(partial q_(i_x \, i_y \, i_z \, alpha), partial Q_(j_x \, j_y \, j_z \, alpha)) p_(i_x \, i_y \, i_z \, alpha)\
 & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) p_(i_x \, i_y \, i_z \, alpha) . $

(ii) この点正準変換に対し,
運動エネルギーは新しい運動量を用いて表せられる.
$  & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N P_(j_x \, j_y \, j_z \, alpha)^2\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N (sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) p_(i_x \, i_y \, i_z \, alpha))^2\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N (sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) p_(i_x \, i_y \, i_z \, alpha) q_(i_(x'))^(\( j_x \)) q_(i_(y'))^(\( j_y \)) q_(i_(z'))^(\( j_z \)) p_(i_(x') \, i_(y') \, i_(z') \, alpha))\
= & sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N delta_(i_x \, i_(x')) delta_(i_y \, i_(y')) delta_(i_z \, i_(z')) p_(i_x \, i_y \, i_z \, alpha) p_(i_(x') \, i_(y') \, i_(z') \, alpha)\
= & sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N p_(i_x \, i_y \, i_z \, alpha)^2 . $

(iii) またポテンシャルエネルギーについても新しい座標で表すことができる.
$  & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2\
= & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N (sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N (Q_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) - Q_(j_x \, j_y \, j_z \, alpha) q_(i_x + 1)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))))^2\
= & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N\
 & (Q_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) - Q_(j_x \, j_y \, j_z \, alpha) q_(i_x + 1)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))) (Q_(j_(x') \, j_(y') \, j_(z') \, alpha) q_(i_x)^(\( j_(x') \)) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \)) - Q_(j_(x') \, j_(y') \, j_(z') \, alpha) q_(i_x + 1)^(\( j_(x') \)) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \)))\
= & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N Q_(j_x \, j_y \, j_z \, alpha) (q_(i_x)^(\( j_x \)) - q_(i_x + 1)^(\( j_x \))) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) Q_(j_(x') \, j_(y') \, j_(z') \, alpha) (q_(i_x)^(\( j_(x') \)) - q_(i_x + 1)^(\( j_(x') \))) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \))\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N B_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) Q_(j_x \, j_y \, j_z \, alpha) Q_(j_(x') \, j_(y') \, j_(z') \, alpha)\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N 4 sin^2 (frac(pi, 2 \( N + 1 \)) j_x) delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) Q_(j_x \, j_y \, j_z \, alpha) Q_(j_(x') \, j_(y') \, j_(z') \, alpha)\
= & 4 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sin^2 (frac(pi, 2 \( N + 1 \)) j_x) Q_(j_x \, j_y \, j_z \, alpha)^2 . $

(iv) これより Hamilton 関数は新しい座標と運動量を用いて表すことができる.
$  & H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)\
:= & frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) p_(i_x \, i_y \, i_z \, alpha)^2\
+ & 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y \, i_z + 1 \, alpha) \)^2)\
= & frac(1, 2 m) sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) P_(j_x \, j_y \, j_z \, alpha)^2\
+ & 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (sin^2 (frac(pi, 2 \( N + 1 \)) j_x) Q_(j_x \, j_y \, j_z \, alpha)^2 + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) Q_(j_x \, j_y \, j_z \, alpha)^2 + sin^2 (frac(pi, 2 \( N + 1 \)) j_z) Q_(j_x \, j_y \, j_z \, alpha)^2)\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) P_(j_x \, j_y \, j_z \, alpha)^2 + 2 kappa (sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) Q_(j_x \, j_y \, j_z \, alpha)^2)\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) P_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 Q_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし, $omega_(j_x \, j_y \, j_z)$ は次のように定めた.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

これより 3 次元結晶の模型の基準振動は位置や運動量に独立な角振動数
$omega_(j_x \, j_y \, j_z)$ の調和振動子となることがわかった.

#block[
Q 17-9. 3 次元結晶の模型における調和振動子の角振動数の個数分布関数
$g \( omega \)$ は次のように表される.
$ g \( omega \) & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \) . $

]
(i) 調和振動子の角振動数 $omega \( bold(k)_(j_x \, j_y \, j_z) \)$
の個数分布関数 $g \( omega \)$ について
$omega \( bold(k)_(j_x \, j_y \, j_z) \)$ は離散的な値を持ち,
各基準モード $\( j_x \, j_y \, j_z \, alpha \)$
によってパラメータ化されるのでデルタ関数を用いて次のように表される.
$ g \( omega \) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \) . $
また $omega \( bold(k)_(j_x \, j_y \, j_z) \)$ は
$omega \( bold(k)_(j_x \, j_y \, j_z) \) gt.eq 0$ に限られるから
$omega gt.eq 0$ となる.

(ii) これより調和振動子の総数は次のようになる.
$ integral_0^oo upright(d) omega g \( omega \) & = 3 integral_0^oo upright(d) omega sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 N^3 . $

ただこのような調和振動子の角振動数の個数分布関数 $g \( omega \)$
をさらに簡単にすることは分散関係 $omega \( bold(k) \)$
の複雑さのためにできない為,
これに統計力学を適用しても計算がすぐに行き詰まる.

== 量子論での基準モード
<量子論での基準モード>
今まで古典力学により行ってきた考察を量子力学に翻訳する. まず Debye
模型の Hamilton 関数は次のように与えられる.
$ hat(H) & = frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) hat(p)_(i_x \, i_y \, i_z \, alpha)^2\
 & + 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( hat(q)_(i_x \, i_y \, i_z \, alpha) - hat(q)_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( hat(q)_(i_x \, i_y \, i_z \, alpha) - hat(q)_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( hat(q)_(i_x \, i_y \, i_z \, alpha) - hat(q)_(i_x \, i_y \, i_z + 1 \, alpha) \)^2) . $
ただし $m$ は 1 個の原子の質量であり, $kappa$
は隣り合った原子間の原子間力のバネ定数とする.
また立方体の表面は固定されているとする.
$ i_x = 0 \, N + 1 or i_y = 0 \, N + 1 or i_z = 0 \, N + 1 arrow.r.double.long hat(q)_(i_x \, i_y \, i_z \, alpha) = 0 . $
また位置演算子 $hat(q)_(i_x \, i_y \, i_z \, alpha)$ と運動量演算子
$hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')$ は正準交換関係を満たす.
$ [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')] & = sqrt(- 1) planck delta_(i_x \, i_(x')) delta_(i_y \, i_(y')) delta_(i_z \, i_(z')) delta_(alpha \, alpha') \,\
[hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(q)_(i_(x') \, i_(y') \, i_(z') \, alpha')] & = [hat(p)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')] = 0\
\( 1 lt.eq i_x \, i_y \, i_z \, i_(x') \, i_(y') \, i_(z') & lt.eq N \, alpha \, alpha' = x \, y \, z \) . $
古典論での点正準変換を量子論でも行う.
$\( hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) arrow.r \( hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_x \, j_y \, j_z \, alpha) \)_(1 lt.eq j_x \, j_y \, j_z lt.eq N \, alpha = x \, y \, z)$
を次のように定める.
$ hat(q)_(i_x \, i_y \, i_z \, alpha) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N hat(Q)_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) #h(2em) \( 1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z \) \,\
hat(P)_(j_x \, j_y \, j_z \, alpha) & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N hat(p)_(i_x \, i_y \, i_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) #h(2em) \( 1 lt.eq j_x \, j_y \, j_z lt.eq N \, alpha = x \, y \, z \) . $

#block[
Q 17-13. 新しい位置演算子 $hat(Q)_(j_x \, j_y \, j_z \, alpha)$
と運動量演算子 $hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')$
について正準交換関係を満たす.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = sqrt(- 1) planck delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) delta_(alpha \, alpha') \,\
[hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = 0\
\( 1 lt.eq j_x \, j_y \, j_z \, j_(x') \, j_(y') \, j_(z') & lt.eq N \, alpha \, alpha' = x \, y \, z \) . $

]
まず $hat(q)_(i_x \, i_y \, i_z \, alpha)$,
$hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')$
の交換関係について左を展開するものと右を展開するもので分けて計算すると次のようになる.
$ [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [hat(q)_(i_x \, i_y \, i_z \, alpha) \, sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha') q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))]\
 & = sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')] q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N sqrt(- 1) planck delta_(i_x \, i_(x')) delta_(i_y \, i_(y')) delta_(i_z \, i_(z')) delta_(alpha \, alpha') q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = sqrt(- 1) planck delta_(alpha \, alpha') q_(i_x)^(\( j_(x') \)) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \)) \,\
[hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N hat(Q)_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')]\
 & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) . $
これより $q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))$
の直交性から次のことがわかる.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = sqrt(- 1) planck delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) delta_(alpha \, alpha') . $
同様に $hat(q)_(i_x \, i_y \, i_z \, alpha)$ 同士,
$hat(P)_(j_x \, j_y \, j_z \, alpha)$
同士の交換関係について計算すると次のようになる.
$ [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(q)_(i_(x') \, i_(y') \, i_(z') \, alpha')] & = [sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N hat(Q)_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) \, sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha') q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))]\
 & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = 0 \,\
[hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N hat(p)_(i_x \, i_y \, i_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) \, sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))]\
 & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N [hat(p)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha)] q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = 0 . $ これより
$q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))$
の直交性から次のことがわかる.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = [hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = 0 . $
よって示された.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = sqrt(- 1) planck delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) delta_(alpha \, alpha') \,\
[hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = 0\
\( 1 lt.eq j_x \, j_y \, j_z \, j_(x') \, j_(y') \, j_(z') & lt.eq N \, alpha \, alpha' = x \, y \, z \) . $

#block[
Q 17-14. Hamilton 演算子 $hat(H)$ は独立な調和振動子の Hamilton
演算子の和となる.
$ hat(H) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) hat(P)_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 hat(Q)_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし $omega_(j_x \, j_y \, j_z)$ は次のように与えられる.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

]
Q 17-7 で位置,
運動量が演算子だとしても同様に計算できるよう書いたので同じ結果が得られる.
よって Hamilton 演算子は次のように書ける.
$ hat(H) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) hat(P)_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 hat(Q)_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし $omega_(j_x \, j_y \, j_z)$ は次のように与えられる.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

#block[
Q 17-12. Debye 模型における調和振動子の角振動数の個数分布関数
$g \( omega \)$ は次のように表される.
$ g \( omega \) & = cases(delim: "{", frac(9 N^3, omega_D) (omega / omega_D)^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \))\
omega_D & = \( 6 pi^2 \)^(1 \/ 3) sqrt(kappa / m) . $

]
(i) Debye 模型における調和振動子の角振動数の個数分布関数 $g \( omega \)$
は $omega \( bold(k)_(j_x \, j_y \, j_z) \)$ が固有モード
$\( j_x \, j_y \, j_z \, alpha \)$
によってパラメータ化されるのでデルタ関数を用いて次のように表される.
$ g \( omega \) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \) #h(2em) \( omega gt.eq 0 \) . $

(ii) また調和振動子の総数は 3 次元結晶の模型と同様に $3 N^3$ となる.
$ integral_0^oo upright(d) omega g \( omega \) & = 3 integral_0^oo upright(d) omega sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 N^3 . $

(iii) ここでDebye 模型における調和振動子の角振動数の個数分布関数
$g \( omega \)$ を具体的に計算すると次のようになる.
$ g \( omega \) & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (omega - sqrt(kappa / m) a lr(|frac(pi, a \( N + 1 \)) \( j_x \, j_y \, j_z \)|))\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (omega - sqrt(kappa / m) frac(pi, N + 1) sqrt(j_x^2 + j_y^2 + j_z^2))\
 & = 3 sqrt(m / kappa) frac(N + 1, pi) sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2)) . $

(iv) またデルタ関数を少し広がった有限の Gauss 分布とすることで
$g \( omega \)$ を滑らかな分布として近似できる.
これより総和は次のように積分で置き換えられることが言える.
$ g \( omega \) & = 3 sqrt(m / kappa) frac(N + 1, pi) sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2))\
 & approx 3 sqrt(m / kappa) frac(N + 1, pi) integral_1^N upright(d) j_x integral_1^N upright(d) j_y integral_1^N upright(d) j_z delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2)) . $

(v) ここで $omega$ に関する次の条件が成り立つとする.
$ sqrt(m / kappa) frac(N + 1, pi) omega lt.eq N . $<omega_condition>
特に $g \( omega \)$
の被積分関数の積分値は次のような幾何学的解釈で近似できる.
$  & integral_1^N upright(d) j_x integral_1^N upright(d) j_y integral_1^N upright(d) j_z delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2))\
= & integral_V upright(d) bold(r) delta (\| bold(r) \| - sqrt(m / kappa) frac(N + 1, pi) omega) #h(2em) (V := { \( x \, y \, z \) divides 1 lt.eq x lt.eq N \, 1 lt.eq y lt.eq N \, 1 lt.eq z lt.eq N })\
approx & ("半径" sqrt(m / kappa) frac(N + 1, pi) omega の 2 "次元球面" S_2 "を第" 1 "象限で切り取った曲面の表面積") . $
これより $g \( omega \)$ は次のように書ける.
$ g \( omega \) & approx 3 sqrt(m / kappa) frac(N + 1, pi) times ("半径" sqrt(m / kappa) frac(N + 1, pi) omega の 2 "次元球面" S_2 "を第" 1 "象限で切り取った曲面の表面積") . $

(vi) それを具体的に計算すると次のようになる.
$ g \( omega \) & approx 3 sqrt(m / kappa) frac(N + 1, pi) times ("半径" sqrt(m / kappa) frac(N + 1, pi) omega の 2 "次元球面" S_2 "を第" 1 "象限で切り取った曲面の表面積")\
 & = 3 sqrt(m / kappa) frac(N + 1, pi) times frac(4 pi, 8) (sqrt(m / kappa) frac(N + 1, pi) omega)^2\
 & = frac(3 pi, 2) (sqrt(m / kappa) frac(N + 1, pi))^3 omega^2 . $

(vii) $omega$ に関する条件 @omega_condition
が成り立たない場合は立方体の積分範囲と球面の表面の共通部分の面積となるので複雑な式となってしまう.
ただ Debye 模型は低温における比熱の振る舞いからの要請により
$omega \( bold(k) \)$ が大きいときは気にしなくて良い模型でした. これより
$g \( omega \)$ の $\( j_x \, j_y \, j_z \)$
に関する積分範囲を立方体から球へ修正することが許され, 次のように
$g \( omega \)$ は表される.
$ g \( omega \) & = cases(delim: "{", frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \)) . $
ただし $N gt.double 1$ であることから $N + 1$ を $N$ と近似し,
また打ち切る角振動数 $omega_D$ を次のように定める.
$ integral_0^oo upright(d) omega g \( omega \) & = integral_0^(omega_D) upright(d) omega g \( omega \) = 3 N^3 . $
この $omega_D$ を Debye の角振動数という.

(viii) これより Debye の角振動数 $omega_D$ は次のように計算される.
$ integral_0^(omega_D) upright(d) omega g \( omega \) & = integral_0^(omega_D) upright(d) omega frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 = pi / 2 (sqrt(m / kappa) N / pi)^3 omega_D^3 = 3 N^3 \,\
omega_D & = (3 N^3 2 / pi)^(1 \/ 3) sqrt(kappa / m) pi / N = \( 6 pi^2 \)^(1 \/ 3) sqrt(kappa / m) . $

(ix) また Debye の角振動数 $omega_D$ を用いて $g \( omega \)$
は次のように表される.
$ g \( omega \) & = cases(delim: "{", frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \))\
 & = cases(delim: "{", frac(9 N^3, omega_D) (omega / omega_D)^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \)) . $

現実の物質に Debye 模型を当てはめるときには, それぞれの物質は固有の
Debye 角振動数 $omega_D$ を持つことになる.
