#import "/src/typst/template.typ": post

#show: post.with(
  title: "相対論的量子力学 期末レポート",
  date: "2026-08-16",
  tags: ("レポート",),
  summary: "physics_report/relativistic_quantum.tex から変換",
)

= 2次元時空におけるディラック方程式
<次元時空におけるディラック方程式>
#block[
2次元時空におけるディラック方程式は次のように考えられる。
$ \( i planck gamma^mu partial_mu - m c \) psi \( x \) = 0 $
このときガンマ行列 $gamma^0 \, gamma^1$ は次を満たす。
$ { gamma^mu \, gamma^nu } = 2 g^(mu nu) \, #h(2em) \( gamma^0 \)^dagger = gamma^0 \, #h(2em) \( gamma^1 \)^dagger = - gamma^1 $
またカイラリティ $gamma^5$ は次を満たす。
$ \( gamma^5 \)^dagger = gamma^5 \, #h(2em) \( gamma^5 \)^2 = 1 \, #h(2em) { gamma^mu \, gamma^5 } = 0 $
$gamma^5$ を $gamma^0 \, gamma^1$ を用いて表わせ。

]
カイラリティがガンマ行列の複素数係数多項式で表されるとするとガンマ行列の性質より次のように書ける。
$ gamma^5 & = sum_(e_0 \, e_1) a_(e_0 \, e_1) \( gamma^0 \)^(e_0) \( gamma^1 \)^(e_1) = alpha_0 + alpha_1 gamma^0 + alpha_2 gamma^1 + alpha_3 gamma^0 gamma^1 & (a_(e_0 \, e_1) \, alpha_i in bb(C)) $
これを代入するとガンマ行列の直交性より
$ \( gamma^5 \)^dagger = gamma^5 & arrow.l.r.double alpha_0 in bb(R) \, alpha_1 in bb(R) \, alpha_2 in i bb(R) \, alpha_3 in bb(R)\
{ gamma^mu \, gamma^5 } = 0 & arrow.r.double.long alpha_0 = alpha_1 = alpha_2 = 0\
\( gamma^5 \)^2 = 1 & arrow.r.double.long alpha_4 = plus.minus 1 $
となる。よって $gamma^5 = plus.minus gamma^0 gamma^1$
となる。ここでは特に $gamma^5 = gamma^0 gamma^1$ とする。

#block[
$gamma_plus.minus = frac(1 plus.minus gamma^5, 2)$ とするとき
$\( gamma_(+) \)^a$, $\( gamma_(-) \)^b$,
$\( gamma_(+) \)^a \( gamma_(-) \)^b$,
$\( gamma_(-) \)^b \( gamma_(+) \)^a$ ($a \, b in bb(Z)_(> 0)$) を
$gamma_plus.minus$ を用いて表わせ。

]
$ \( gamma_plus.minus \)^2 & = frac(1 plus.minus 2 gamma^5 + \( gamma^5 \)^2, 2^2) = frac(1 plus.minus gamma^5, 2) = gamma_plus.minus\
gamma_(+) gamma_(-) & = gamma_(-) gamma_(+) = frac(1 + gamma^5 - gamma^5 - \( gamma^5 \)^2, 2^2) = 0 $
より帰納法から次が示せる。
$ \( gamma_(+) \)^a = gamma_(+) \, #h(2em) \( gamma_(-) \)^b = gamma_(-) \, #h(2em) \( gamma_(+) \)^a \( gamma_(-) \)^b = 0 \, #h(2em) \( gamma_(-) \)^b \( gamma_(+) \)^a = 0 $

#block[
$psi_plus.minus \( x \) = gamma_plus.minus psi \( x \)$ は $gamma^5$
の固有関数である。それぞれの固有値を求めよ。

]
カイラリティを作用させることで固有関数 $psi_plus.minus \( x \)$
の固有値は $plus.minus 1$ となる。
$ gamma^5 psi_plus.minus \( x \) & = gamma^5 gamma_plus.minus psi \( x \) = frac(gamma^5 plus.minus 1, 2) psi \( x \) = plus.minus gamma^5 psi \( x \) $

#block[
$psi_plus.minus \( x \)$
が満たす連立微分方程式をディラック方程式から求めよ。

]
${ gamma^mu \, gamma^5 } = 0$ より
$gamma^mu gamma_plus.minus = gamma_minus.plus gamma^mu$ となる。よって
$  & {gamma_(+) \( i planck gamma^mu partial_mu - m c \) psi \( x \) = 0\
gamma_(-) \( i planck gamma^mu partial_mu - m c \) psi \( x \) = 0\
\
arrow.l.r.double & {i planck gamma^mu partial_mu psi_(-) \( x \) = m c psi_(+) \( x \)\
i planck gamma^mu partial_mu psi_(+) \( x \) = m c psi_(-) \( x \)\
 $ となる。

#block[
$m = 0$ の場合に
$psi_(+) \( x \) prop e^(- i E t \/ planck + i p x \/ planck)$
が解となるとき、$E \, p$ が満たす関係式を求めよ。

]
$m = 0$ のとき $i planck gamma^mu partial_mu psi_(+) \( x \) = 0$
となる。 $gamma^1 = gamma^0 \( gamma_(+) - gamma_(-) \)$ より
$ i planck gamma^mu partial_mu psi_(+) \( x \) & = i planck \( gamma^0 c partial_t + gamma^1 partial_x \) psi_(+) \( x \)\
 & = \( gamma^0 E c - gamma^1 p \) psi_(+) \( x \)\
 & = gamma^0 \( E c - \( gamma_(+) - gamma_(-) \) p \) psi_(+) \( x \)\
 & = gamma^0 \( E c - p \) psi_(+) \( x \) = 0 $ となる。よって
$E c = p$ を満たす。

#block[
$m = 0$ の場合に
$psi_(-) \( x \) prop e^(- i E t \/ planck + i p x \/ planck)$
が解となるとき、$E \, p$ が満たす関係式を求めよ。

]
$m = 0$ のとき $i planck gamma^mu partial_mu psi_(-) \( x \) = 0$
となる。 $gamma^1 = gamma^0 \( gamma_(+) - gamma_(-) \)$ より
$ i planck gamma^mu partial_mu psi_(-) \( x \) & = i planck \( gamma^0 c partial_t + gamma^1 partial_x \) psi_(-) \( x \)\
 & = \( gamma^0 E c - gamma^1 p \) psi_(-) \( x \)\
 & = gamma^0 \( E c - \( gamma_(+) - gamma_(-) \) p \) psi_(-) \( x \)\
 & = gamma^0 \( E c + p \) psi_(-) \( x \) = 0 $ となる。よって
$E c = - p$ を満たす。

#block[
$gamma^0 \, gamma^1 \, gamma^5$ を 2 行 2
列の行列とするとき、それらの具体形をパウリ行列を用いて表せ。

]
パウリ行列を次のように定義する。
$ sigma_1 = mat(delim: "(", 0, 1; 1, 0) \, #h(2em) sigma_2 = mat(delim: "(", 0, - i; i, 0) \, #h(2em) sigma_3 = mat(delim: "(", 1, 0; 0, - 1) $
これより次のようにおくとそれぞれの性質を満たす。
$ gamma^0 = sigma_1 \, #h(2em) gamma^1 = i sigma_2 \, #h(2em) gamma^5 = - sigma_3 $

= 指数関数
<指数関数>
#block[
次の式を示せ。
$ e^(i hat(B)) hat(A) e^(- i hat(B)) = sum_(n = 0)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, hat(A) \] \] dots.h \] $

]
$e^(i lambda hat(B)) hat(A) e^(- i lambda hat(B))$
について考える。これを $lambda$ について展開すると
$ e^(i lambda hat(B)) hat(A) e^(- i lambda hat(B)) & = sum_(n = 0)^oo frac(lambda^n, n !) [frac(upright(d)^n, upright(d) lambda^n) e^(i lambda hat(B)) hat(A) e^(i lambda hat(B))]_(lambda = 0)\
 & = sum_(n = 0)^oo frac(lambda^n, n !) [frac(upright(d)^(n - 1), upright(d) lambda^(n - 1)) e^(i lambda hat(B)) i \[ hat(B) \, hat(A) \] e^(i lambda hat(B))]_(lambda = 0)\
 & = sum_(n = 0)^oo frac(lambda^n, n !) #scale(x: 180%, y: 180%)[\[] e^(i lambda hat(B)) i^n underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, hat(A) \] \] dots.h \] e^(i lambda hat(B)) #scale(x: 180%, y: 180%)[\]]_(lambda = 0)\
 & = sum_(n = 0)^oo frac(\( i lambda \)^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, hat(A) \] \] dots.h \] $
よって $lambda = 1$ を代入することで示せる。
$ e^(i hat(B)) hat(A) e^(- i hat(B)) & = sum_(n = 0)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, hat(A) \] \] dots.h \] $

#block[
$partial$
を微分演算子とするとき、$\( partial e^(i hat(B)) \) e^(- i hat(B)) = - e^(i hat(B)) \( partial e^(- i hat(B)) \)$
を示せ。

]
$1 = e^(i hat(B)) e^(- i hat(B))$ に微分演算子を作用させることで示せる。
$ 0 = partial 1 = partial \( e^(i hat(B)) e^(- i hat(B)) \) & = \( partial e^(i hat(B)) \) e^(- i hat(B)) + e^(i hat(B)) \( partial e^(- i hat(B)) \)\
\( partial e^(i hat(B)) \) e^(- i hat(B)) & = - e^(i hat(B)) \( partial e^(- i hat(B)) \) $

#block[
次の式を示せ。
$ e^(i hat(B)) \( partial e^(- i hat(B)) \) = - sum_(n = 1)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n - 1) \, partial hat(B) \] \] dots.h \] $

]
(1) において $hat(A) = partial$ を代入して示せる。
$ e^(i hat(B)) \( partial e^(- i hat(B)) \) & = sum_(n = 0)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, partial \] \] dots.h \]\
 & = partial + sum_(n = 1)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, partial \] \] dots.h \]\
 & = - sum_(n = 1)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n - 1) \, partial hat(B) \] \] dots.h \]\
 $

= スピノル球関数
<スピノル球関数>
#block[
スピノル球関数を球面調和関数を用いて次のように定義する。
$ cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = 1 / sqrt(2 l + 1) vec(sqrt(l + 1 / 2 plus.minus m) Y_l^(m - 1 \/ 2) \( theta \, phi.alt \), plus.minus sqrt(l + 1 / 2 minus.plus m) Y_l^(m + 1 \/ 2) \( theta \, phi.alt \), )_(j = l plus.minus 1 \/ 2) $
軌道角運動量 $hat(bold(L))$, スピン角運動量 $hat(bold(S))$, 全角運動量
$hat(bold(J))$ とする。

$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$
が持つパリティを求めよ。

]
球面調和関数におけるパリティは $\( - 1 \)^l$
となるからスピノル球関数のパリティは $\( - 1 \)^l$ となる。
$ Y_l^m \( pi - theta \, pi + phi.alt \) & = \( - 1 \)^l Y_l^m \( theta \, phi.alt \)\
cal(Y)_(j \, m)^plus.minus \( pi - theta \, pi + phi.alt \) & = \( - 1 \)^l cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ $hat(J)_z$
の固有値を求めよ。

]
球面調和関数における固有値からスピノル球関数の $hat(J)_z$ の固有値は
$m planck$ となる。
$ hat(J)_z Y_l^m \( theta \, phi.alt \) & = m planck Y_l^m \( theta \, phi.alt \)\
hat(J)_z cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = m planck cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ
$hat(bold(L))^2$ の固有値を求めよ。

]
球面調和関数における固有値からスピノル球関数の $hat(bold(L))^2$
の固有値は $planck^2 l \( l + 1 \)$ となる。
$ hat(bold(L))^2 Y_l^m \( theta \, phi.alt \) & = planck^2 l \( l + 1 \) Y_l^m \( theta \, phi.alt \)\
hat(bold(L))^2 cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = planck^2 l \( l + 1 \) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ
$hat(bold(L)) dot.op hat(bold(S))$ の固有値を求めよ。

]
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ に
$hat(bold(L)) dot.op hat(bold(S))$ を作用させると
$ hat(bold(L)) dot.op hat(bold(S)) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = 1 / 2 \( hat(bold(J))^2 - hat(bold(L))^2 - hat(bold(S))^2 \) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 / 2 (j \( j + 1 \) - l \( l + 1 \) - 3 / 4) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 / 2 ((l plus.minus 1 / 2) (l plus.minus 1 / 2 + 1) - l \( l + 1 \) - 3 / 4) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 / 2 (plus.minus (l + 1 / 2) - 1 / 2) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 $ より固有値は
$frac(planck^2 l, 2) \, - frac(planck^2 \( l + 1 \), 2)$
となる。

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ
$hat(bold(J))^2$ の固有値を求めよ。

]
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ に $hat(bold(J))^2$
を作用させると
$ hat(bold(J))^2 cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = planck^2 j \( j + 1 \) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 (l plus.minus 1 / 2) ((l plus.minus 1 / 2) + 1) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 ((l plus.minus 1 / 2 + 1 / 2)^2 - 1 / 4) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $
より固有値は $l^2 - 1 / 4 \, \( l + 1 \)^2 - 1 / 4$ となる。

#block[
パウリ行列 $bold(sigma)$ と位置ベクトル
$bold(r) = r \( sin theta cos phi.alt \, sin theta sin phi.alt \, cos theta \)$
に対して
$bold(sigma) dot.op bold(r) / r cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$
を計算し、スピノル球関数のみを用いて表せ。

]
まず演算子を計算すると
$ bold(sigma) dot.op bold(r) / r & = bold(sigma) dot.op \( sin theta cos phi.alt \, sin theta sin phi.alt \, cos theta \) = mat(delim: "(", cos theta, sin theta e^(- i phi.alt); sin theta e^(i phi.alt), - cos theta) $
となる。三角関数を球面調和関数に作用させたときの固有値は次のようになるから
$ cos theta Y_l^m \( theta \, phi.alt \) & = sqrt(frac(\( l + m + 1 \) \( l - m + 1 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^m \( theta \, phi.alt \) + sqrt(frac(\( l + m \) \( l - m \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^m \( theta \, phi.alt \)\
sin theta e^(i phi.alt) Y_l^m \( theta \, phi.alt \) & = - sqrt(frac(\( l + m + 1 \) \( l + m + 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m + 1) \( theta \, phi.alt \) + sqrt(frac(\( l - m \) \( l - m - 1 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m + 1) \( theta \, phi.alt \)\
sin theta e^(- i phi.alt) Y_l^m \( theta \, phi.alt \) & = sqrt(frac(\( l - m + 1 \) \( l - m + 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m - 1) \( theta \, phi.alt \) + sqrt(frac(\( l + m \) \( l + m - 1 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m - 1) \( theta \, phi.alt \) $
次のように計算できる。
$ 3 bold(sigma) dot.op bold(r) / r cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = 1 / sqrt(2 l + 1) &  & mat(delim: "(", cos theta, sin theta e^(- i phi.alt); sin theta e^(i phi.alt), - cos theta) vec(sqrt(l + 1 / 2 plus.minus m) Y_l^(m - 1 \/ 2) \( theta \, phi.alt \), plus.minus sqrt(l + 1 / 2 minus.plus m) Y_l^(m + 1 \/ 2) \( theta \, phi.alt \), )_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 l + 1) &  & #scale(x: 300%, y: 300%)[\(] sqrt(l + 1 / 2 plus.minus m) cos theta Y_l^(m - 1 \/ 2) \( theta \, phi.alt \) plus.minus sqrt(l + 1 / 2 minus.plus m) sin theta e^(- i phi.alt) Y_l^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, sqrt(l + 1 / 2 plus.minus m) sin theta e^(i phi.alt) Y_l^(m - 1 \/ 2) \( theta \, phi.alt \) minus.plus sqrt(l + 1 / 2 minus.plus m) cos theta Y_l^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)]_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 l + 1) &  & #scale(x: 300%, y: 300%)[\(] sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l + m + 1 / 2 \) \( l - m + 3 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & + sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l + m - 1 / 2 \) \( l - m + 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & plus.minus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l - m + 1 / 2 \) \( l - m + 3 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & plus.minus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l + m + 1 / 2 \) \( l + m - 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, - sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l + m + 1 / 2 \) \( l + m + 3 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & + sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l - m + 1 / 2 \) \( l - m - 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & minus.plus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l + m + 3 / 2 \) \( l - m + 1 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & minus.plus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l + m + 1 / 2 \) \( l - m - 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)]_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 l + 1) &  & #scale(x: 300%, y: 300%)[\(] \( 2 l + 1 \) sqrt(frac(l minus.plus m + 1 / 2 plus.minus 1, \( 2 l + 1 \) \( 2 l + 1 plus.minus 2 \))) Y_(l plus.minus 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, minus.plus \( 2 l + 1 \) sqrt(frac(l plus.minus m + 1 / 2 plus.minus 1, \( 2 l + 1 \) \( 2 l + 1 plus.minus 2 \))) Y_(l plus.minus 1)^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)]_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 j + 1 plus.minus 1) &  & #scale(x: 300%, y: 300%)[\(] sqrt(j + 1 / 2 minus.plus (m - 1 / 2)) Y_(j plus.minus 1 \/ 2)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, minus.plus sqrt(j + 1 / 2 plus.minus (m + 1 / 2)) Y_(j plus.minus 1 \/ 2)^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)] = cal(Y)_(j \, m)^minus.plus \( theta \, phi.alt \) $
よって次の式となる。
$ bold(sigma) dot.op bold(r) / r cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = cal(Y)_(j \, m)^minus.plus \( theta \, phi.alt \) $

= 水素原子における電子のエネルギー準位
<水素原子における電子のエネルギー準位>
#block[
中心力ポテンシャル $V \( r \) = - frac(alpha planck c, r)$
のもとでディラック方程式を解くことにより得られる水素原子中の電子のエネルギー準位を考える。

主量子数 $n$ が与えられたとき、全角運動量 $j$ が取り得る値を答えよ。

]
$n$ と $j$ に関して $n = j + n' + 1 \/ 2$ という関係があるから
$j = 1 \/ 2 \, dots.h \, \( 2 n - 1 \) \/ 2$ を取る。

#block[
主量子数 $n$, 全角運動量 $j$
を持つ状態のエネルギー固有値の表式を書き下せ。また、そのエネルギー固有値の縮重度を答えよ。

]
主量子数 $n$, 全角運動量 $j$
を持つ状態のエネルギー固有値の表式は次のようになる。
$ E & = frac(m c^2, sqrt(1 + frac(\( Z alpha \)^2, (n - (j + 1 / 2) + sqrt(\( j + 1 / 2 \)^2 - \( Z alpha \)^2))^2))) $
また縮重度は $j = l plus.minus 1 \/ 2$ より $n' = 0$ において
$2 j + 1$、$n' > 0$ において $2 \( 2 j + 1 \)$ となる。

#block[
主量子数 $n$ を持つ状態の総数を求めよ。

]
$n = j + n' + 1 \/ 2$ と $j = l plus.minus 1 \/ 2$ より状態の総数は
$2 n^2$ となる。
$ 2 n + 2 times sum_(n' = 1)^(n - 1) 2 \( n - n' \) & = 2 n^2 $

#block[
電子の静止エネルギーから測った束縛エネルギーの大きさが縮退を除いて 7
番目と 10 番目に大きい準位の主量子数 $n$ と全角運動量 $j$
をそれぞれ答えよ。また、それらの準位の束縛エネルギーの大きさを有効数字 6
桁で求めよ。

]
7 番目に大きい準位は $n = 4 \, j = 1 \/ 2$ で 10 番目に大きい準位は
$n = 4 \, j = 7 \/ 2$ である。 またそれぞれの束縛エネルギーは
$ cal(E) & approx - frac(alpha^2 m c^2, 2 n^2) - (frac(1, j + 1 \/ 2) - frac(3, 4 n)) frac(alpha^4 m c^2, 2 n^3)\
 & approx - 13.60569 / n^2 - (frac(1, j + 1 \/ 2) - frac(3, 4 n)) frac(7.249022 times 10^(- 4), n^3)\
cal(E)_(4 \, 1 \/ 2) & approx 0.850365\
cal(E)_(4 \, 7 \/ 2) & approx 0.850356 $ となる。

#block[
同じ主量子数 $n$ を持つ状態でも全角運動量 $j$
に依存してエネルギー準位が分裂する. この現象を表す名称を答えよ.

]
微細構造
