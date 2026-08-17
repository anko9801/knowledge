#import "/src/typst/template.typ": post

#show: post.with(
  title: "統計力学 II",
  date: "2026-08-17",
  tags: ("レポート",),
  summary: "physics_report/statistical2_report.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 熱力学の復習、古典・量子統計力学の復習、グランドカノニカル分布の基礎
<熱力学の復習古典量子統計力学の復習グランドカノニカル分布の基礎>
== 物理数学の復習
<物理数学の復習>
#block[
ゼータ関数について $zeta \( 2 \) \, zeta \( 4 \)$ を求めよ。
$ zeta \( x \) := sum_(n = 1)^oo 1 / n^x #h(2em) \( x > 1 \) $

]
$f_m \( x \) = x^m$ をフーリエ展開する。
$ f_m \( x \) = x^m = sum_(n = - oo)^oo c_(n \, m) e^(i n x) $
このときの係数は次のようになる。
$ c_(n \, m) & = frac(1, 2 pi) integral_(- pi)^pi x^m e^(- i n x) upright(d) x\
 & = frac(1, 2 pi) sum_(i = 0)^4 [frac(m ! \( - 1 \)^i, \( m - i \) ! \( - i n \)^(i + 1)) x^(m - i) e^(- i n x)]_(- pi)^pi\
 & = frac(1, 2 pi) (- frac(m, \( - i n \)^2) \( - 1 \)^n (pi^(m - 1) - \( - pi^(m - 1) \)) - frac(m \( m - 1 \) \( m - 2 \), \( - i n \)^4) \( - 1 \)^n (pi^(m - 3) - \( - pi \)^(m - 3)))\
 & = \( - 1 \)^n (m / n^2 pi^(m - 2) - frac(m \( m - 1 \) \( m - 2 \), n^4) pi^(m - 4))\
c_(0 \, m) & = frac(1, 2 pi) integral_(- pi)^pi x^m upright(d) x = frac(pi^m, m + 1) $
これより $f_m \( x \)$ が求まり、$x = pi$
を代入することでゼータ関数の値が分かる。
$ f_m \( x \) & = frac(pi^m, m + 1) + sum_(n eq.not 0) (m / n^2 pi^(m - 2) - frac(m \( m - 1 \) \( m - 2 \), n^4) pi^(m - 4)) \( - 1 \)^n e^(i n x)\
f_2 \( pi \) = pi^2 & = pi^2 / 3 + sum_(n eq.not 0) 2 / n^2 \, #h(2em) f_4 \( pi \) = pi^4 = pi^4 / 5 + sum_(n eq.not 0) (4 / n^2 pi^2 - 24 / n^4)\
zeta \( 2 \) & = sum_(n = 1)^oo 1 / n^2 = pi^2 / 6 \, #h(2em) zeta \( 4 \) = sum_(n = 1)^oo 1 / n^4 = pi^4 / 90 $

#block[
次の関数 $I_plus.minus \( alpha \)$ が収束する実数 $alpha$
の範囲とその収束値を求めよ。
$ I_plus.minus \( alpha \) & = integral_0^oo frac(z^(alpha - 1), e^z plus.minus 1) upright(d) z $

]
分母を展開すると
$ I_plus.minus \( alpha \) & = integral_0^oo frac(z^(alpha - 1) e^(- z), 1 plus.minus e^(- z)) upright(d) z\
 & = integral_0^oo z^(alpha - 1) e^(- z) sum_(k = 0)^oo \( minus.plus e^(- z) \)^k upright(d) z\
 & = sum_(k = 1)^oo \( minus.plus 1 \)^(k - 1) integral_0^oo z^(alpha - 1) e^(- k z) upright(d) z\
 & = (sum_(k = 1)^oo frac(\( minus.plus 1 \)^(k - 1), k^alpha)) integral_0^oo z^(alpha - 1) e^(- z) upright(d) z & \( k z arrow.r z \)\
 & = cases(delim: "{", \( 1 - 2^(1 - alpha) \) zeta \( alpha \) Gamma \( alpha \) & \( I_(+) \( alpha \) \), zeta \( alpha \) Gamma \( alpha \) & \( I_(-) \( alpha \) \), ) $
ゼータ関数 $zeta \( s \)$ は $Re s lt.eq 1$ において発散し、ガンマ関数は
$0$ または負の整数で発散するから $alpha lt.eq 1$ のとき
$I_plus.minus \( alpha \)$ は発散し、$alpha > 1$
のとき次のように収束する。
$ I_(+) \( alpha \) & = \( 1 - 2^(1 - alpha) \) zeta \( alpha \) Gamma \( alpha \)\
I_(-) \( alpha \) & = zeta \( alpha \) Gamma \( alpha \) $

== 3 次元調和振動子
<次元調和振動子>
$ hat(H) & = - frac(planck^2, 2 m) nabla^2 + V \( bold(r) \) \, #h(2em) V \( bold(r) \) = k / 2 \| bold(r) \|^2 $

#block[
固有関数を $psi \( bold(r) \) = X \( x \) Y \( y \) Z \( z \)$
と変数分離できるとすると固有エネルギーを求めよ。

]
$ hat(H) psi & = - frac(planck^2, 2 m) nabla^2 psi + V \( bold(r) \) psi\
 & = - frac(planck^2, 2 m) \( X'' Y Z + X Y'' Z + X Y Z'' \) + V \( bold(r) \) X Y Z\
 & = (- frac(planck^2, 2 m) (X'' / X + Y'' / Y + Z'' / Z) + 1 / 2 \( x^2 + y^2 + z^2 \)) X Y Z\
 & = sum_i (- frac(planck^2, 2 m) frac(X_(i'') \( x_i \), X_i \( x_i \)) + k / 2 x_i^2) psi = E psi $
総和の各項はそれぞれ変数が独立しているから定数となり、それぞれ $E_i$
とおく。
$ - frac(planck^2, 2 m) frac(X_(i'') \( x_i \), X_i \( x_i \)) + k / 2 x_i^2 & = E_i\
- frac(planck^2, 2 m) X_(i'') + k / 2 x_i^2 X_i & = E_i X_i $
これは 1
次元調和振動子のポテンシャルであるので固有エネルギーは次のようになる。
$ E_(i \, n) & = (n + 1 / 2) planck omega #h(2em) (n = 0 \, 1 \, 2 \, dots.h.c)\
E_(\( n_x \, n_y \, n_z \)) & = (n_x + n_y + n_z + 3 / 2) planck omega #h(2em) (n_x \, n_y \, n_z = 0 \, 1 \, 2 \, dots.h.c) $

#block[
固有エネルギー $epsilon$ が
$E_0 = 100 planck omega lt.eq epsilon < E_0 + delta E = 110 planck omega$
を満たす独立な固有状態は何個あるか? まず
($planck omega lt.double delta E lt.double E_0$ として)
概数を評価する方法を考えて評価し、次に具体的に求めてみよう。

]
まず概数についてエネルギー $E$ までの状態数 $D \( E \)$ は平面
$x + y + z + 3 \/ 2 = E \/ planck omega$
の第一象限を底とし、原点を頂点とする三角錐の体積と近似できるから
$ D \( E \) & = 1 / 6 (frac(E, planck omega) - 3 / 2)^3 $
となる。これより $E_0$ から $E_0 + delta E$
までの状態数は次のようになる。
$ D \( E_0 + delta E \) - D \( E_0 \) & = 1 / 6 ((frac(E_0 + delta E, planck omega) - 3 / 2)^3 - (frac(E_0, planck omega) - 3 / 2)^3) approx 53603 $
実際に計算すると次のようになる。
$ sum_(k = 99)^108 zws_(k + 2) C_2 & = 55165 $

#block[
極座標において固有関数が
$psi \( bold(r) \) = R \( r \) Y \( theta \, phi.alt \) = R \( r \) Theta \( theta \) Phi \( phi.alt \)$
と変数分離できるとき固有関数と固有エネルギーはどのように求められるか。
$ x & = r sin theta cos phi.alt \, y = r sin theta sin phi.alt \, z = r cos theta\
nabla^2 & = frac(partial^2, partial r^2) + 2 / r frac(partial, partial r) + 1 / r^2 (frac(1, sin theta) frac(partial, partial theta) sin theta frac(partial, partial theta) + frac(1, sin^2 theta) frac(partial^2, partial phi.alt^2)) $

]
$ hat(H) & = - frac(planck^2, 2 m) nabla^2 + V \( r \)\
 & = - frac(planck^2, 2 m) (1 / r^2 frac(partial, partial r) (r^2 frac(partial, partial r)) + frac(1, r^2 sin theta) frac(partial, partial theta) (sin theta frac(partial, partial theta)) + frac(1, r^2 sin^2 theta) frac(partial^2, partial phi.alt^2)) + V \( r \)\
0 & = (frac(partial, partial r) (r^2 frac(partial, partial r)) + frac(1, sin theta) frac(partial, partial theta) (sin theta frac(partial, partial theta)) + frac(1, sin^2 theta) frac(partial^2, partial phi.alt^2) + frac(2 m r^2 \( E - V \( r \) \), planck^2)) psi \( r \, theta \, phi.alt \) $
と書ける。$k = m omega^2$ とおくと独立な変数であるから定数 $lambda \, m$
を用いて
$  & (frac(partial, partial r) (r^2 frac(partial, partial r)) + frac(2 m r^2, planck^2) E - frac(m^2 omega^2 r^4, planck^2)) R \( r \) = lambda R \( r \)\
 & (frac(1, sin theta) frac(partial, partial theta) (sin theta frac(partial, partial theta)) + frac(1, sin^2 theta) frac(partial^2, partial phi.alt^2)) Y \( theta \, phi.alt \) = - lambda Y \( theta \, phi.alt \)\
 & (sin theta frac(partial, partial theta) (sin theta frac(partial, partial theta)) + lambda sin^2 theta) Theta \( theta \) = m^2 Theta \( theta \)\
 & frac(upright(d)^2 Phi \( phi.alt \), upright(d) phi.alt^2) = - m^2 Phi \( phi.alt \) $
となる。まず $Phi \( phi.alt \)$ の一般解は次のようになる。
$  & frac(upright(d)^2 Phi \( phi.alt \), upright(d) phi.alt^2) + m^2 Phi \( phi.alt \) = 0\
 & Phi \( phi.alt \) = cases(delim: "{", A e^(i \| m \| phi.alt) + B e^(- i \| m \| phi.alt) & \( m^2 eq.not 0 \), C phi.alt + D & \( m^2 = 0 \), ) $
波動関数は連続であるから $Phi \( 0 \) = Phi \( 2 pi \)$
であり、規格化条件を満たす。$C = D = 0$
となる解は意味を成さず、$m in bb(Z)$ となる。$L_z$
の固有関数となることから
$ Phi \( phi.alt \) & = 1 / sqrt(2 pi) e^(i m phi.alt) #h(2em) \( m in bb(Z) \) $
となる。次に $Theta \( theta \)$ について解く。$z = cos theta$ とおくと,
$ (sin theta frac(upright(d), upright(d) theta) (sin theta frac(upright(d), upright(d) theta)) + lambda sin^2 theta) Theta \( theta \) & = m^2 Theta \( theta \)\
frac(upright(d), upright(d) z) (\( 1 - z^2 \) frac(upright(d) Theta, upright(d) z)) + (lambda - frac(m^2, 1 - z^2)) Theta \( z \) & = 0 $
となる。$m = 0$ において $Theta \( z \)$
はルジャンドルの微分方程式を満たす。$Theta \( z \)$ をべき展開することで
$  & \( 1 - z^2 \) Theta'' - 2 z Theta' + lambda Theta = 0 \, #h(2em) Theta \( z \) = sum_(k = 0)^oo a_k z^k\
 & \( 1 - z^2 \) sum_(k = 2)^oo k \( k - 1 \) a_k z^(k - 2) - 2 z sum_(k = 1)^oo k a_k z^(k - 1) + lambda sum_(k = 0)^oo a_k z^k = 0\
 & sum_(k = 0)^oo (\( k + 1 \) \( k + 2 \) a_(k + 2) + (lambda - k \( k + 1 \)) a_k) z^k + cal(O) \( z \) = 0\
 & a_(k + 2) = frac(k \( k + 1 \) - lambda, \( k + 2 \) \( k + 1 \)) a_k $
となる。よって $z$ について一般に発散しない為には
$lambda = l \( l + 1 \) med \( l in bb(Z)_(> 0) \)$
とならければならない。すると $m eq.not 0$
のときはルジャンドルの陪微分方程式となる。
$ frac(upright(d), upright(d) z) (\( 1 - z^2 \) frac(upright(d) Theta, upright(d) z)) + (l \( l + 1 \) - frac(m^2, 1 - z^2)) Theta \( z \) & = 0 $
これよりルジャンドルの陪関数 $P_l^m \( z \)$ と規格化条件から
$Theta_(l m) \( theta \)$ は
$ Theta_(l m) \( theta \) & = \( - 1 \)^(frac(m + \| m \|, 2)) sqrt((l + 1 / 2) frac(\( l - \| m \| \) !, \( l + \| m \| \) !)) P_l^(\| m \|) \( cos theta \) $
と書ける。また $R_l \( r \)$ については
$rho = sqrt(frac(m omega, planck)) r$ と無次元化すると
$  & frac(upright(d)^2, upright(d) r^2) R_l \( r \) + 2 / r frac(upright(d), upright(d) r) R_l \( r \) + frac(2 m, planck^2) (E - 1 / 2 m omega^2 r^2 - frac(l \( l + 1 \) planck^2, 2 m r^2)) R_l \( r \) = 0\
 & frac(upright(d)^2, upright(d) rho^2) R_l \( rho \) + 2 / rho frac(upright(d), upright(d) rho) R_l \( rho \) + (lambda + rho^2 - frac(l \( l + 1 \), rho^2)) R_l \( rho \) = 0 & (lambda = frac(2 E, planck omega)) $
となる。$x = rho^2$ と変数変換すると
$  & x frac(upright(d)^2, upright(d) x^2) R_l \( x \) + 3 / 2 frac(upright(d), upright(d) x) R_l \( x \) + 1 / 4 (lambda + x - frac(l \( l + 1 \), x)) R_l \( x \) = 0 $
となり, 級数展開法より $rho arrow.r oo$ で発散しない為には $n$
を非負整数として $lambda = 4 n + 2 l + 3$ となる。 $rho arrow.r oo$,
$rho arrow.r 0$ のときの漸近解はそれぞれ $e^(- x \/ 2)$, $x^(l \/ 2)$
となるので $R_l \( x \) = x^(l \/ 2) e^(- x \/ 2) S_n^alpha \( x \)$
と分離すると
$ x frac(upright(d)^2, upright(d) x^2) S_n^alpha + \( alpha + 1 - x \) frac(upright(d), upright(d) x) S_n^alpha + n S_n^alpha = 0 $
これはソニンの多項式となるので解はラゲールの陪関数を用いて
$S_n^alpha = L_(n + alpha)^alpha$ と書ける。
よって固有関数は次のように書ける。
$ psi \( r \, theta \, phi.alt \) & = R_l \( rho \) Theta_(l m) \( theta \) Phi_m \( phi.alt \)\
Phi_m \( phi.alt \) & = 1 / sqrt(2 pi) e^(i m phi.alt)\
Theta_(l m) \( theta \) & = \( - 1 \)^(frac(m + \| m \|, 2)) sqrt((l + 1 / 2) frac(\( l - \| m \| \) !, \( l + \| m \| \) !)) P_l^(\| m \|) \( cos theta \)\
R_(n l) \( rho \) & = rho^l e^(- rho^2 \/ 2) L_(n + alpha)^alpha \( rho^2 \) & (rho = sqrt(frac(m omega, planck)) r) $
固有エネルギーについては次のようになる。
$ E & = lambda / 2 planck omega = (2 n + l + 3 / 2) planck omega $

== 2 準位系, 3 準位系
<準位系-3-準位系>
#block[
エネルギー準位が $0$ と $epsilon$ からなり、それぞれ $m \, n$
重に縮重する互いに独立な $N$ 個の系が温度 $T$
の熱平衡状態にあるとする。このときの分配関数、エネルギーの期待値、比熱を求めよ。$a = n \/ m \, beta = frac(1, k_B T)$
とおく。

]
カノニカル分布を用いることで次のように計算できる。
$ Z_N \( beta \) & = (m + n e^(- beta epsilon))^N = m^N (1 + a e^(- beta epsilon))^N\
E \( beta \) & = - frac(partial, partial beta) ln Z_N \( beta \) = N frac(a epsilon e^(- beta epsilon), 1 + a e^(- beta epsilon))\
C \( T \) & = frac(upright(d) E, upright(d) T) = - frac(1, k_B T^2) frac(upright(d) E, upright(d) beta)\
 & = - N k_B beta^2 frac(- a epsilon^2 e^(- beta epsilon) \( 1 + a e^(- beta epsilon) \) + a epsilon e^(- beta epsilon) dot.op a epsilon e^(- beta epsilon), \( 1 + a e^(- beta epsilon) \)^2)\
 & = N k_B beta^2 frac(a epsilon^2 e^(- beta epsilon), \( 1 + a e^(- beta epsilon) \)^2) $
$a lt.double 1$ の場合と $a gt.double 1$
の場合について比熱は次のような表式となる。
$ frac(C \( T \), N k_B) & = (frac(epsilon, k_B T))^2 frac(a e^(- epsilon \/ k_B T), \( 1 + a e^(- epsilon \/ k_B T) \)^2)\
 & = cases(delim: "{", (frac(epsilon, k_B T))^2 a e^(- epsilon \/ k_B T) & \( a lt.double 1 \), (frac(epsilon, k_B T))^2 frac(1, a e^(- epsilon \/ k_B T)) & \( a gt.double 1 \)) $
このとき $x = frac(k_B T, epsilon)$ とおくと
$ frac(partial, partial x) (frac(C \( T \), N k_B)) & = cases(delim: "{", e^(- 1 \/ x) / x^4 \( 1 - 2 x \) & \( a lt.double 1 \), e^(1 \/ x) / x^4 \( - 1 - 2 x \) & \( a gt.double 1 \)) $
よりピークはそれぞれ $1 \/ 2$,
なしとなる。これより次のようなグラフとなる。

#block[
エネルギー準位が $0 \, epsilon \, b epsilon$ からなる独立な $N$
個の系が温度 $T$
の熱平衡状態にあるとする。このとき分配関数、エネルギーの期待値、比熱を求めよ。

]
前問と同様にして
$ Z_N \( beta \) & = (1 + e^(- beta epsilon) + e^(- beta b epsilon))^N\
E \( beta \) & = - frac(partial, partial beta) ln Z_N \( beta \)\
 & = N frac(epsilon e^(- beta epsilon) + b epsilon e^(- beta b epsilon), 1 + e^(- beta epsilon) + e^(- beta b epsilon))\
C \( T \) & = frac(upright(d) E, upright(d) T) = - frac(1, k_B T^2) frac(upright(d) E, upright(d) beta)\
 & = N k_B beta^2 frac(\( epsilon^2 e^(- beta epsilon) + b^2 epsilon^2 e^(- beta b epsilon) \) \( 1 + e^(- beta epsilon) + e^(- beta b epsilon) \) - \( epsilon e^(- beta epsilon) + b epsilon e^(- beta b epsilon) \)^2, \( 1 + e^(- beta epsilon) + e^(- beta b epsilon) \)^2)\
 & = N k_B \( beta epsilon \)^2 frac(e^(- beta epsilon) + \( b - 1 \)^2 e^(- beta \( 1 + b \) epsilon) + b^2 e^(- beta b epsilon), \( 1 + e^(- beta epsilon) + e^(- beta b epsilon) \)^2)\
frac(C \( T \), N k_B) & = (frac(epsilon, k_B T))^2 frac(e^(- epsilon \/ k_B T) + \( b - 1 \)^2 e^(- \( 1 + b \) epsilon \/ k_B T) + b^2 e^(- b epsilon \/ k_B T), \( 1 + e^(- epsilon \/ k_B T) + e^(- b epsilon \/ k_B T) \)^2) $
これよりグラフは次のようになる。

= 理想量子気体とグランドカノニカル分布
<理想量子気体とグランドカノニカル分布>
== 状態を占める粒子数の揺らぎ
<状態を占める粒子数の揺らぎ>
#block[
Fermi 粒子系、Bose 粒子系における粒子数の揺らぎを調べよ。

]
グランドカノニカル分布の分布関数 $f \( epsilon \)$
が与えられたときに粒子数の揺らぎは次のように書ける。
$ N & = sum_(j = 1)^oo f \( epsilon_j \)\
(frac(partial N, partial mu))_(T \, V) & = beta (chevron.l N^2 chevron.r - N^2) = beta chevron.l \( accent(Delta N, ̂) \)^2 chevron.r $
これより Fermi 粒子系の粒子数の揺らぎは次のように書ける。
$ N & = frac(1, e^(beta \( epsilon - mu \)) + 1)\
chevron.l \( accent(Delta N, ̂) \)^2 chevron.r & = frac(e^(beta \( epsilon - mu \)), \( e^(beta \( epsilon - mu \)) + 1 \)^2) = e^(beta \( epsilon - mu \)) N^2 $
同様に Bose 粒子系の粒子数の揺らぎは次のようになる。
$ N & = frac(1, e^(beta \( epsilon - mu \)) - 1)\
chevron.l \( accent(Delta N, ̂) \)^2 chevron.r & = frac(e^(beta \( epsilon - mu \)), \( e^(beta \( epsilon - mu \)) - 1 \)^2) = e^(beta \( epsilon - mu \)) N^2 $
これより $chevron.l hat(N) chevron.r arrow.r oo$ の極限において
$ sqrt(chevron.l \( accent(Delta N, ̂) \)^2 chevron.r) / N & arrow.r e^(beta \( epsilon - mu \) \/ 2) $
となる。

= 理想ボーズ気体、ボーズ凝縮
<理想ボーズ気体ボーズ凝縮>
== 格子比熱 (Debye 模型)
<格子比熱-debye-模型>
縦波と 2 つの独立な横波のモードが可能であり、それらの分散関係は
$omega = v_l \| bold(k) \|$, $omega = v_t \| bold(k) \|$ と表される。

#block[
固体の体積を $V$、全原子数を $N$($gt.double 1$) として、振動数が $omega$
と $omega + upright(d) omega$ の間にある状態の数
$D \( omega \) upright(d) omega$ を求めよ。固体を各辺の長さが $L$
($L^3 = V$) の立方体と考え、周期境界条件をとってよい。

]
周期境界条件と媒体が奇妙な振動をしない条件として分散関係
$omega = v_l \| bold(k) \|$ より次のように書ける。
$ bold(k) & = pi / L \( n_x \, n_y \, n_z \) #h(2em) (0 lt.eq n_i lt.eq root(3, N))\
frac(omega L, v pi) & = sqrt(n_x^2 + n_y^2 + n_z^2) $ これより状態の数
$D \( omega \)$ は速度 $v$ に対して $frac(omega L, v pi)$
を半径とする第一象限の表面積と近似できる。
$ D \( omega \) & = 1 / 8 frac(4 pi, 3) (frac(omega L, v_l pi))^3 + 2 / 8 frac(4 pi, 3) (frac(omega L, v_t pi))^3\
 & = frac(omega^3 L^3, 6 pi^2) (1 / v_l^3 + 2 / v_t^3)\
 & = frac(omega^3 L^3, 6 pi^2) frac(v_t^3 + 2 v_l^3, v_l^3 v_t^3)\
D \( omega \) upright(d) omega & = frac(omega^2 L^3, 2 pi^2) frac(v_t^3 + 2 v_l^3, v_l^3 v_t^3) upright(d) omega\
 $

#block[
$D \( omega \)$ を Debye 振動数 $omega_D$ を用いて表せ。

]
$omega_D$ の条件に代入することで
$ integral_0^(omega_D) D \( omega \) upright(d) omega & = integral_0^(omega_D) frac(omega^2 L^3, 2 pi^2) frac(v_t^3 + 2 v_l^3, v_l^3 v_t^3) upright(d) omega = 3 N\
omega_D & = frac(v_l v_t, L) (frac(18 N pi^2, v_t^3 + 2 v_l^3))^(1 \/ 3) $
となる為、$omega_D$ を用いて $D \( omega \)$ は次のように求まる。
$ D \( omega \) & = cases(delim: "{", frac(9 N omega^2, omega_D^3) & \( omega < omega_D \), 0 & \( omega > omega_D \)) $

#block[
この模型における固体の定積比熱 $C$
を求め、高温、低温での振る舞いを調べよ。また、Einstein 模型 ($3 N$
個の独立な調和振動子が、いずれも等しい振動数 $omega$ を持つ)
と比較せよ。

]
$omega$ に対する調和振動子における比熱 $c \( omega \)$ を用いて比熱 $C$
は次のように求まる。
$ C & = integral_0^oo D \( omega \) c \( omega \) upright(d) omega\
 & = integral_0^(omega_D) frac(9 N omega^2, omega_D^3) k_B (frac(beta planck omega e^(beta planck omega \/ 2), e^(beta planck omega) - 1))^2 upright(d) omega\
 & = 9 N k_B b^2 integral_0^1 frac(x^4 e^(b x), \( e^(b x) - 1 \)^2) upright(d) x & (x = omega / omega_D \, b = beta planck omega_D)\
 & = - 9 N k_B b^2 frac(upright(d), upright(d) b) integral_0^1 frac(x^3, e^(b x) - 1) upright(d) x $
高温極限 ($b lt.double 1$) のとき Bernoulli 数 $B_n$
の定義を用いて次のように計算できる。
$ integral_0^1 frac(x^3, e^(b x) - 1) upright(d) x & = integral_0^1 sum_(n = 0)^oo frac(B_n b^(n - 1), n !) x^(n + 2) upright(d) x\
 & = sum_(n = 0)^oo frac(B_n, \( n + 3 \) n !) b^(n - 1)\
 & = frac(1, 3 b) - 1 / 8 + 1 / 60 b - 1 / 5040 b^3 + 1 / 272160 b^5 - dots.h.c . $
低温極限 ($b gt.double 1$)
のとき分母を展開することで次のように計算できる。
$ integral_0^1 frac(x^3, e^(b x) - 1) upright(d) x & = integral_0^1 x^3 sum_(n = 1)^oo e^(- n b x) upright(d) x = sum_(n = 1)^oo integral_0^1 x^3 e^(- n b x) upright(d) x\
 & = sum_(n = 1)^oo frac(1, \( n b \)^4) integral_0^(n b) t^3 e^(- t) upright(d) t #h(2em) \( t = n b x \)\
 & approx 1 / b^4 zeta \( 4 \) Gamma \( 4 \)\
 & = 1 / b^4 pi^4 / 15 $
よって比熱は高温、低温について次のような値となる。
$ C & = 9 N k_B b^2 integral_0^1 frac(x^4 e^(b x), \( e^(b x) - 1 \)^2) upright(d) x\
 & approx cases(delim: "{", 3 N k_B & \( b lt.double 1 \), 3 N k_B frac(4 pi^4, 5 b^3) & \( b gt.double 1 \)) $
Einstein 模型における比熱は次のようになる。
$ C & = 3 N k_B (frac(beta planck omega, 2 sinh 1 / 2 beta planck omega))^2\
 & approx 3 N k_B b^2 e^(- b) $ よって低温における温度 $T$ 依存性が
Debye 模型は $b^(- 3)$ に対して Einstein 模型は $b^2 e^(- b)$
と異なることが分かる。

#block[
一般化して、$d$ 次元における格子比熱の低温 ($T lt.double omega_D$)
での温度依存性を調べよ。

]
一般の $d$ 次元において状態密度 $D \( omega \)$ と比熱 $C$
は次のようになる。
$ D \( omega \) & = cases(delim: "{", 3 N frac(d omega^(d - 1), omega_D^d) & \( omega < omega_D \), 0 & \( omega > omega_D \))\
C & = integral_0^oo D \( omega \) c \( omega \) upright(d) omega\
 & = 3 d N k_B b^2 integral_0^1 frac(x^(d + 1) e^(b x), \( e^(b x) - 1 \)^2) upright(d) x\
 $ 低温極限 ($b gt.double 1$) において
$ integral_0^1 frac(x^d, e^(b x) - 1) upright(d) x & = integral_0^1 x^d sum_(n = 1)^oo e^(- n b x) upright(d) x = sum_(n = 1)^oo integral_0^1 x^d e^(- n b x) upright(d) x\
 & = sum_(n = 1)^oo frac(1, \( n b \)^(d + 1)) integral_0^(n b) t^d e^(- t) upright(d) t #h(2em) \( t = n b x \)\
 & approx 1 / b^(d + 1) zeta \( d + 1 \) Gamma \( d + 1 \) $
これより比熱は次のようになる。
$ C & approx 3 N k_B 1 / b^d d \( d + 1 \) zeta \( d + 1 \) Gamma \( d + 1 \) $
よって比熱は $T^d$ に比例する。

== 3 次元調和トラップ中での Bose-Einstein 凝縮での比熱の変化
<次元調和トラップ中での-bose-einstein-凝縮での比熱の変化>
#block[
3 次元等方調和ポテンシャル
$V \( r \) = \( m omega^2 \/ 2 \) \| bold(r) \|^2$ 中での質量 $m$
の単原子分子の気体の Bose-Einstein 凝縮 (BEC) について、凝縮温度 $T_c$
のすぐ上およびすぐ下での比熱を計算し、比較せよ。原子相互作用が無視できるとして原子の質量
$1.44 times 10^(- 25)$ kg, 調和振動子閉じ込めの角周波数
$omega = 2 pi times 60$ Hz, 原子の個数 $2.0 times 10^3$
個のとき、転移温度を求めよ。

]
3
次元等方調和ポテンシャル中でボース凝縮しているとき凝縮温度近くの比熱は次のようになる。
$ D \( epsilon \) & = frac(epsilon^2, 2 planck^3 omega^3)\
N & = (frac(k_B T, planck omega))^3 zeta \( 3 \)\
T_c & = frac(planck omega, k_B) (frac(N, zeta \( 3 \)))^(1 \/ 3)\
U \( epsilon \) & = integral_0^oo epsilon D \( epsilon \) f_B \( epsilon \) upright(d) epsilon = frac(1, 2 planck^3 omega^3) integral_0^oo frac(epsilon^3, e^(beta epsilon) - 1) upright(d) epsilon\
 & = frac(1, 2 planck^3 omega^3) \( k_B T \)^4 Gamma \( 4 \) zeta \( 4 \) = frac(pi^4, 30 planck^3 omega^3) \( k_B T \)^4\
C \( T \) & = frac(2 pi^4, 15 planck^3 omega^3) k_B^4 T^3\
C \( T_c + Delta T \) & approx frac(2 pi^4, 15 planck^3 omega^3) k_B^4 (T_c^3 + 3 T_c^2 Delta T)\
 & approx frac(2 pi^4, 15) k_B + frac(2 pi^4, 5) frac(k_B^2, planck omega) (frac(N, zeta \( 3 \)))^(2 \/ 3) Delta T $

= 理想フェルミ気体、低温展開
<理想フェルミ気体低温展開>
== Pauli 常磁性
<pauli-常磁性>
#block[
磁場による効果を無視した自由電子におけるスピン磁化率 $chi_s$
を求める。ただし磁場 $H$ における 1 電子のエネルギーは次のようになる。
$ epsilon_plus.minus = frac(p^2, 2 m) plus.minus mu_B H $
このとき磁場下での磁化 $M$ と絶対零度のスピン磁化率を求めよ。

]
3 次元自由フェルミ粒子系の状態密度を $D \( epsilon \) = c sqrt(epsilon)$
とおき、各スピン状態における粒子数 $N_plus.minus$
を求め、ゾンマーフェルト展開を行うことで磁化 $M$ は次のようになる。
$ N_plus.minus & = integral_(- oo)^oo D \( epsilon \) f \( epsilon plus.minus mu_B H \) upright(d) epsilon\
M & = mu_B N_(+) - mu_B N_(-)\
 & = mu_B integral_(- oo)^oo frac(D \( epsilon \), 2) \( f \( epsilon + mu_B H \) - f \( epsilon - mu_B H \) \) upright(d) epsilon\
 & approx mu_B^2 H integral_(- oo)^oo D \( epsilon \) f' \( epsilon \) upright(d) epsilon + cal(O) \( H^3 \)\
 & approx mu_B^2 H (D \( mu \) + frac(pi^2, 6 beta^2) D'' \( mu \) + cal(O) \( beta^(- 4) \)) + cal(O) \( H^3 \) $
これより絶対零度におけるスピン磁化率 $chi_s$ は次のようになる。
$ chi_s \( T = 0 \) & = lim_(H arrow.r 0) M / H = mu_B^2 D \( mu \) = c mu_B^2 sqrt(mu) = 3 / 2 mu_B^2 / mu N $
ただし $N$ は系の粒子数とする。

#block[
$chi_s$ について、低温での $T$ について最低次の補正を求めよ。

]
低温のスピン磁化率 $chi_s$ は次のようになる。
$ chi_s & approx mu_B^2 (D \( mu \) + frac(pi^2, 6 beta^2) D'' \( mu \)) = mu_B^2 c sqrt(mu) (1 - frac(pi^2, 6 beta^2) frac(1, 2 mu^2)) = 3 / 2 mu_B^2 / mu N (1 - frac(k_B^2 T^2 pi^2, 12 mu^2)) $

#block[
Fermi 縮退温度 $T_F$
に比べ充分高温での表式を求めよ。低温の場合と比べてどうなるか?

]
高温のとき $f \( epsilon \) approx e^(- beta \( epsilon - mu \))$
と近似できる。これよりスピン磁化率は次のように近似できる。
$ chi_s & = mu_B^2 integral_0^oo D \( epsilon \) f' \( epsilon \) upright(d) epsilon = mu_B^2 integral_0^oo D' \( epsilon \) f \( epsilon \) upright(d) epsilon = mu_B^2 integral_0^oo 1 / 2 c epsilon^(- 1 \/ 2) e^(- beta \( epsilon - mu \)) upright(d) epsilon\
 & = 1 / 2 c mu_B^2 e^(beta mu) beta^(1 \/ 2) Gamma (1 / 2) = sqrt(pi) / 2 c mu_B^2 e^(beta mu) beta^(1 \/ 2) $
低温の場合と比べ、$T$ が大きくなるほど $0$ に近づくことが分かる。

== ブロッホの定理
<ブロッホの定理>
結晶固体中の電子は、周期的に配列した原子核や他の電子の作るポテンシャルの影響を受けて運動する。1
個の電子が感じるポテンシャルが、結晶と同じ空間的な周期性を持つとして、この電子の波動関数
$psi \( bold(r) \)$ について考えてみよう。

#block[
1 次元の場合について並進運動と周期境界条件を満たすとき $cal(H) \( x \)$
と $cal(T)_a$ は交換することを示せ。

]
$ cal(H) \( x \) & = - frac(planck^2, 2 m) frac(partial^2, partial x^2) + V \( x \) \, #h(2em) V \( x + a \) = V \( a \)\
cal(T)_a psi \( x \) & = psi \( x + a \) $ このとき $cal(H) \( x \)$ と
$cal(T)_a$ を波動関数に作用させると次のようになる。
$ cal(T)_a cal(H) \( x \) psi \( x \) & = cal(T)_a (cal(H) \( x \) psi \( x \))\
 & = cal(H) \( x + a \) psi \( x + a \)\
 & = cal(H) \( x \) psi \( x + a \)\
 & = cal(H) \( x \) cal(T)_a psi \( x \) $ よって $cal(H) \( x \)$ と
$cal(T)_a$ は交換する。

#block[
次のようになることを説明せよ。
$ psi \( x + n a \) = e^(i k n a) psi \( x \) $

]
並進演算子 $cal(T)_a$ の固有関数 $psi \( x \)$ に対して $n$
回作用させることでその固有値 $E_a$ に関して $E_a^n = 1$
という関係式が得られる。
$ cal(T)_a^n psi \( x \) = psi \( x + n a \) = psi \( x \) = E_a^n psi \( x \) $
これより、ある波数 $k$ を用いて $E_a = e^(i k a)$ と書ける。

#block[
3 次元のとき基本格子ベクトル $\( bold(a)_1 \, bold(a)_2 \, bold(a)_3 \)$
とすると格子ベクトル
$bold(R) = n_1 bold(a)_1 + n_2 bold(a)_2 + n_3 bold(a)_3$
($n_i in bb(Z)$) を用いて
$ psi \( bold(r) + bold(R) \) = e^(i bold(k) dot.op bold(R)) psi \( bold(r) \) $
が成り立つことを説明せよ。

]
基本格子ベクトルについて次の関係が成り立つ。
$ psi \( bold(r) + bold(a)_1 \) = psi \( bold(r) + bold(a)_2 \) = psi \( bold(r) + bold(a)_3 \) = psi \( bold(r) \) $
それぞれに対して上の推論を用いることで固有値は
$e^(i \( n_1 k_1 a_1 \)) \, e^(i \( n_2 k_2 a_2 \)) \, e^(i \( n_3 k_3 a_3 \))$
となる。これよりある波数 $bold(k)$ を用いて
$ psi \( bold(r) + bold(R) \) = e^(i bold(k) dot.op bold(R)) psi \( bold(r) \) $
と表される。

== 1 次元周期的井戸型ポテンシャル
<次元周期的井戸型ポテンシャル>
#block[
$V 0 > 0 \, a > 0 \, b > 0 \, l = a + b$ とする。1
次元に閉じ込められた質量 $m$ の電子が、$n$
を任意の整数として次の式で表される周期的井戸型ポテンシャル中を運動する。
$ V \( x \) = cases(delim: "{", 0 & \( n l < x lt.eq n l + a \), V_0 & \( n l + a < x lt.eq \( n + 1 \) l \)) $
まず、$V \( x \)$ を数周期にわたり図示せよ。そして、波数 $k$
に対応するブロッホ状態の一つのエネルギーが $E \( 0 < E < V_0 \)$
であるとして、$p = sqrt(2 m E) \/ planck$ と
$q = sqrt(2 m \( V_0 - E \)) \/ planck$ の満たす式を求めよ。

さらに、$E lt.double V_0$ として、$b V_0$ を一定に保ったまま
$b arrow.r 0 \, V_0 arrow.r oo$ の極限をとったとき ($a$
ごとにデルタ関数的な斥力が存在することに対応する)
$P equiv frac(m a, planck^2) b V_0$ として、上で求めた式から、
$p a$ と $k a$ の満たすべき式を求め、$P = 3 pi \/ 2$ のときに、$E$
の値を $k$ を横軸として拡張ゾーン形式により ($0 lt.eq k a lt.eq 4 pi$
を含む適当な範囲で) 図示せよ。

]
まず $V \( x \)$ について次のような図となる。

このときの波動関数は次のようになる。
$ psi \( x \) & = cases(delim: "{", A e^(i p \( x - n l \)) + B e^(- i p \( x - n l \)) & (n l < x lt.eq n l + a \, E = frac(planck^2 p^2, 2 m)), C e^(q \( x - \( n + 1 \) l \)) + D e^(- q \( x - \( n + 1 \) l \)) & (n l + a < x lt.eq \( n + 1 \) l \, V_0 - E = frac(planck^2 q^2, 2 m)))\
psi \( x \) & = u \( x \) e^(i k x) $ これはブロッホの定理と境界条件より
$  & {psi \( 0 \) = A + B = C + D\
psi' \( 0 \) = i p A - i p B = q C - q D\
u \( a \) = A e^(i \( p - k \) a) + B e^(- i \( p + k \) a) = C e^(- \( q - i k \) b) + D e^(\( q + i k \) b)\
u' \( a \) = i \( p - k \) A e^(i \( p - k \) a) - i \( p + k \) B e^(- i \( p + k \) a) = \( q - i k \) C e^(- \( q - i k \) b) - \( q + i k \) D e^(\( q + i k \) b)\
 & mat(delim: "(", 1, 1, - 1, - 1; i p, - i p, - q, q; e^(i p a - i k a), e^(- i p a - i k a), - e^(- q b + i k b), - e^(q b + i k b); i \( p - k \) e^(i p a - i k a), - i \( p + k \) e^(- i p a - i k a), - \( q - i k \) e^(- q b + i k b), \( q + i k \) e^(q b + i k b)) vec(A, B, C, D) = vec(0, 0, 0, 0) $
$A \, B \, C \, D$ がすべて 0
でない為には係数行列の行列式がゼロとなければならない。これより $p$, $q$
の満たす式は次のようになる。
$ cos \( k l \) & = frac(q^2 - p^2, 2 p q) sin \( p a \) sinh \( q b \) + cos \( p a \) cosh \( q b \) $
$q prop sqrt(V_0) arrow.r oo$ より $q b arrow.r 0$
となるので近似することで $p a \, k a$ の満たすべき式は次のようになる。
$ cos \( k l \) & = frac(q^2 - p^2, 2 p q) sin \( p a \) sinh \( q b \) + cos \( p a \) cosh \( q b \)\
 & approx frac(q^2, 2 p q) sin \( p a \) q b + cos \( p a \)\
 & approx frac(q^2 b, 2 p) sin \( p a \) + cos \( p a \)\
cos \( k a \) & approx P frac(sin \( p a \), p a) + cos \( p a \) $
これより $P = 3 pi \/ 2$ のとき拡張ゾーン形式は次のように書ける。

== グラフェンにおける分散関係
<グラフェンにおける分散関係>
#block[
グラフェン (graphene) は炭素原子が 2
次元的に六角格子をなす。格子ベクトル $bold(R)$ は次のように表される。
$ 3 bold(R) & = n_1 bold(a)_1 + n_2 bold(a)_2\
bold(a)_1 & = (frac(3 a, 2) \, frac(sqrt(3) a, 2)) & #h(2em) bold(a)_2 & = (0 \, sqrt(3) a)\
bold(b)_1 & = (frac(4 pi, 3 a) \, 0) & #h(2em) bold(b)_2 & = (- frac(2 pi, 3 a) \, frac(2 pi, sqrt(3) a)) $
孤立系でこの格子のサイト $s = A \, B$ に粒子がある固有状態を
$\|bold(R) \, s⟩$ で表す。隣接サイト間のみのホッピングを考えると、1
粒子のハミルトニアンは、ホッピングを $t$ として
$ cal(H) & = - t sum_(bold(R)) (\|bold(R) \, A⟩ ⟨bold(R) \, B\| + \|bold(R) \, B⟩ ⟨bold(R) \, A\| + sum_(j = 1 \, 2) (\|bold(R) \, A⟩ ⟨bold(R) - bold(a)_j \, B\| + \|bold(R) \, B⟩ ⟨bold(R) + bold(a)_j \, A\|))\
\|bold(k)⟩ & = sum_(bold(R)) e^(i bold(k) dot.op bold(R)) sum_(s = A \, B) u_s \|bold(R) \, s⟩ = sum_(bold(R)) e^(i bold(k) dot.op bold(R)) \( u_A \|bold(R) \, A⟩ + u_B \|bold(R) \, B⟩ \) #h(2em) \( \| u_A \|^2 + \| u_B \|^2 = 1 \) $
と表され $cal(H) \|bold(k)⟩ = E \( bold(k) \) \|bold(k)⟩$ を満たす。
ここで $bold(k)$ を固定したとき
$eta = e^(i bold(k) dot.op bold(a)_1) \, xi = e^(i bold(k) dot.op bold(a)_2)$
として、非零となる $E \( bold(k) \)$ の条件を調べよ。

]
このときハミルトニアンと固有ケットは次のようになる。
$ cal(H) & = - t sum_(bold(R)) (\|bold(R) \, A⟩ (⟨bold(R) \, B\| + sum_(j = 1 \, 2) ⟨bold(R) - bold(a)_j \, B\|) + \|bold(R) \, B⟩ (⟨bold(R) \, A\| + sum_(j = 1 \, 2) ⟨bold(R) + bold(a)_j \, A\|))\
\|bold(k)⟩ & = sum_(bold(R)) eta^(n_1) xi^(n_2) \( u_A \|bold(R) \, A⟩ + u_B \|bold(R) \, B⟩ \) $
固有ケットにハミルトニアンを作用させると次のようになる。
$ cal(H) \|bold(k)⟩ & = - t sum_(bold(R)) eta^(n_1) xi^(n_2) (\( 1 + eta^(- 1) + xi^(- 1) \) u_B \|bold(R) \, A⟩ + \( 1 + eta + xi \) u_A \|bold(R) \, B⟩) = E \( bold(k) \) \|bold(k)⟩ $
ここで $\( u_A \, u_B \) eq.not \( 0 \, 0 \)$
なる解が得られるためのエネルギー固有値 $E \( bold(k) \)$
の条件は次のようになる。
$ E \( bold(k) \) & = - t \( 1 + eta^(- 1) + xi^(- 1) \) u_B / u_A = - t \( 1 + eta + xi \) u_A / u_B\
E \( bold(k) \) & = plus.minus t sqrt(\( 1 + eta + xi \) \( 1 + eta^(- 1) + xi^(- 1) \)) $

#block[
逆格子空間の点
$bold(k) = y / a hat(bold(k))_y med (0 lt.eq y lt.eq frac(2 pi, sqrt(3)))$
における 2 つのエネルギー固有値を求めることにより $bold(k)$ が原点
$Gamma$ から対称性の高い点 $K'$ を経由してブリルアン・ゾーン境界 $M$
に達するまでのバンド構造の概形を図示せよ。

]
まず $bold(k)$ と格子ベクトルの内積を計算する。
$ bold(k) dot.op bold(a)_1 & = (0 \, y / a) dot.op (frac(3 a, 2) \, frac(sqrt(3) a, 2)) = sqrt(3) / 2 y\
bold(k) dot.op bold(a)_2 & = (0 \, y / a) dot.op (0 \, sqrt(3) a) = sqrt(3) y $
これよりエネルギー固有値は次のようになる。
$ E \( bold(k) \) & = plus.minus t sqrt(\( 1 + eta + xi \) \( 1 + eta^(- 1) + xi^(- 1) \)) #h(2em) (eta = e^(i sqrt(3) / 2 y) \, xi = e^(i sqrt(3) y))\
 & = plus.minus t sqrt(3 + 4 cos (sqrt(3) / 2 y) + 2 cos (sqrt(3) y)) $
$bold(k) = y / a hat(bold(k))_y med (0 lt.eq y lt.eq frac(2 pi, sqrt(3)))$
の具体値を代入すると次のようになる。
$ E (0 hat(bold(k))_y) & = plus.minus 3 t & E (frac(pi, sqrt(3) a) hat(bold(k))_y) & = plus.minus t & E (frac(4 pi, 3 sqrt(3) a) hat(bold(k))_y) & = 0 & E (frac(2 pi, sqrt(3) a) hat(bold(k))_y) & = plus.minus 3 t $
よってバンド構造の概形は次のようになる。

#block[
K' 点近傍での 2
つのバンドのエネルギーと、対応する波動関数の振る舞いについて調べ、考察せよ。

]
K' 点近傍での 2 つのバンドのエネルギーについて $Delta y lt.double 1$
より 2 次まで展開すると
$  & E ((frac(4 pi, 3 sqrt(3)) + Delta y) hat(bold(k))_y / a)\
 & = plus.minus t sqrt(3 + 4 cos (2 / 3 pi + sqrt(3) / 2 Delta y) + 2 cos (4 / 3 pi + sqrt(3) Delta y))\
 & = plus.minus t sqrt(3 + 4 (- 1 / 2 cos (sqrt(3) / 2 Delta y) - sqrt(3) / 2 sin (sqrt(3) / 2 Delta y)) + 2 (- 1 / 2 cos (sqrt(3) Delta y) + sqrt(3) / 2 sin (sqrt(3) Delta y)))\
 & approx plus.minus t sqrt(3 Delta y^2 + cal(O) \( Delta y^3 \)) approx plus.minus sqrt(3) t \| Delta y \| $
となり、Dirac 電子のように振る舞う。

また K' 点近傍において波動関数は次のようになる。
$  & {u_A approx e^(i theta) sqrt(frac(Delta y, 2))\
u_B approx plus.minus e^(i theta) sqrt(frac(Delta y, 2))\
\|bold(k)⟩ & = sum_(bold(R)) e^(i bold(k) dot.op bold(R) + i theta) (sqrt(frac(Delta y, 2)) \|bold(R) \, A⟩ plus.minus sqrt(frac(Delta y, 2)) \|bold(R) \, B⟩) $

= 多電子系の波動関数と相互作用、相転移と臨界現象 I
<多電子系の波動関数と相互作用相転移と臨界現象-i>
== 相互作用のある 1 次元 Ising 模型: ゼロ磁場
<相互作用のある-1-次元-ising-模型-ゼロ磁場>
#block[
1次元の Ising
模型において磁場が存在しないとき分配関数、自由エネルギー、比熱、スピン相関
$chevron.l sigma_i sigma i + r chevron.r prop e^(- r \/ xi)$、相関長 $xi$
を求めよ。
$ H = - J sum_(i = 1)^(N - 1) sigma_i sigma_(i + 1) - h sum_(i = 1)^N sigma_i $

]
$h = 0$ においてハミルトニアンは次のようになる。
$ H = - J sum_(i = 1)^(N - 1) sigma_i sigma_(i + 1) $
これより熱力学的関数はそれぞれ次のようになる。
$ Z & = sum_(sigma_i = plus.minus 1) e^(- beta H) = sum_(sigma_i = plus.minus 1) product_(i = 1)^(N - 1) e^(beta J sigma_i sigma_(i + 1))\
 & = sum_(sigma_i = plus.minus 1) \( e^(beta J sigma_(N - 1)) + e^(- beta J sigma_(N - 1)) \) (product_(i = 1)^(N - 2) e^(beta J sigma_i sigma_(i + 1)))\
 & = sum_(sigma_i = plus.minus 1) 2 cosh \( beta J \) (product_(i = 1)^(N - 2) e^(beta J sigma_i sigma_(i + 1)))\
 & = 2 \( 2 cosh \( beta J \) \)^(N - 1)\
F & = - 1 / beta ln Z = - 1 / beta (\( N - 1 \) ln \( 2 cosh beta J \) + ln 2)\
S & = k_B beta^2 frac(partial F, partial beta) = k_B \( N - 1 \) (ln \( 2 cosh beta J \) - beta J tanh beta J) + k_B ln 2\
C & = - beta frac(partial S, partial beta) = k_B \( N - 1 \) (frac(beta J, cosh beta J))^2 $
スピン相関 $chevron.l sigma_i sigma_(i + r) chevron.r$ については
$ chevron.l sigma_i sigma_(i + r) chevron.r & = 1 / Z sum_(sigma_i = plus.minus 1) sigma_i sigma_(i + r) product_(j = 1)^(N - 1) e^(beta J sigma_j sigma_(j + 1))\
 & = frac(1, 2 \( 2 cosh \( beta J \) \)^(i + r - 1)) sum_(sigma_i = plus.minus 1) sigma_i sigma_(i + r) product_(j = 1)^(i + r - 1) e^(beta J sigma_j sigma_(j + 1))\
 & = frac(1, 2 \( 2 cosh \( beta J \) \)^(i + r - 1)) sum_(sigma_i = plus.minus 1) sigma_i sigma_(i + r) e^(beta J sigma_(i + r - 1) sigma_(i + r)) product_(j = 1)^(i + r - 2) e^(beta J sigma_j sigma_(j + 1))\
 & = frac(2 sinh \( beta J \), 2 \( 2 cosh \( beta J \) \)^(i + r - 1)) sum_(sigma_i = plus.minus 1) sigma_i sigma_(i + r - 1) product_(j = 1)^(i + r - 2) e^(beta J sigma_j sigma_(j + 1))\
 & = frac(tanh^r \( beta J \), 2 \( 2 cosh \( beta J \) \)^(i - 1)) sum_(sigma_i = plus.minus 1) sigma_i^2 product_(j = 1)^(i - 1) e^(beta J sigma_j sigma_(j + 1))\
 & = tanh^r \( beta J \) $ より相関長 $xi$ は次のようになる。
$ xi & = - frac(1, ln tanh \( beta J \)) $

== Landau 理論
<landau-理論>
#block[
前問の Ising モデルにおける平均場近似の解析により、2
次相転移を記述する平均場理論において、自由エネルギーは一般的に転移点近傍でモデルによらずに
$ F \( T \, h \) = min_sigma (F_0 - h sigma + a \( T - T_c \) sigma^2 + b sigma^4) $
となることが期待される。

]
まず自由エネルギーについて $sigma$
に対して極小値となる条件は次のようになる。
$ frac(partial F, partial sigma) & = - h + 2 a \( T - T_c \) sigma + 4 b sigma^3 = 0 $
これに対する $h = 0$ での解は
$ 2 a \( T - T_c \) sigma + 4 b sigma^3 = 0 arrow.l.r.double sigma & = 0 \, plus.minus sigma_0 & (sigma_0 = sqrt(frac(a \( T_c - T \), 2 b))) $
となり、方程式から $T < T_c$ かつ $h > 0$ のとき $sigma approx sigma_0$,
$h < 0$ のとき $sigma approx - sigma_0$ と対応する。$sigma = sigma_0$
周りで展開すると
$ frac(partial F, partial sigma) & approx - h + 2 a \( T - T_c \) \( sigma_0 + \( sigma - sigma_0 \) \) + 4 b \( sigma_0^3 + 3 sigma_0^2 \( sigma - sigma_0 \) \)\
 & = - h + 4 a \( T_c - T \) \( sigma - sigma_0 \) = 0\
sigma & = sigma_0 + frac(h, 4 a \( T_c - T \)) $ $sigma = - sigma_0$
も同様であるから $sigma$ は次のようになる。
$ sigma = cases(delim: "{", frac(h, 2 a \( T - T_c \)) & \( T > T_c \), sqrt(frac(a \( T_c - T \), 2 b)) + frac(h, 4 a \( T - T_c \)) & \( T < T_c \, h > 0 \), - sqrt(frac(a \( T_c - T \), 2 b)) + frac(h, 4 a \( T - T_c \)) & \( T < T_c \, h < 0 \), ) $

#block[
転移温度前後での磁化率の温度依存性を求めよ。

]
$ chi & = frac(partial sigma, partial h)\|_(h arrow.r 0) = cases(delim: "{", frac(1, 2 a \( T - T_c \)) & \( T > T_c \), frac(1, 4 a \( T - T_c \)) & \( T < T_c \), ) $
より磁化率 $chi$ は $T^(- 1)$ に依存する。

#block[
転移温度近傍において、$h = 0$
における比熱に有限の飛びが現れることを示せ。

]
$h = 0$ において自由エネルギー $F$, エントロピー $S$, 比熱 $C$
は次のようになる。
$ F & = cases(delim: "{", F_0 & \( T > T_c \), F_0 - frac(a^2 \( T - T_c \)^2, 4 b) & \( T < T_c \), )\
S = - frac(partial F, partial T) & = cases(delim: "{", - frac(partial F_0, partial T) & \( T > T_c \), - frac(partial F_0, partial T) + frac(a^2 \( T - T_c \), 2 b) & \( T < T_c \), )\
C = T frac(partial S, partial T) & = cases(delim: "{", - T frac(partial^2 F_0, partial T^2) & \( T > T_c \), - T frac(partial^2 F_0, partial T^2) + T frac(a^2, 2 b) & \( T < T_c \), ) $
これより $T = T_c$ 付近において $T_c a^2 \/ 2 b$ の有限の飛びがある。

= 期末レポート問題
<期末レポート問題>
== Kosterlitz-Thouless 転移
<kosterlitz-thouless-転移>
#block[
2 次元の古典 XY スピン系を考える。スピン $bold(S) = \( S_x \, S_y \)$
が正方格子状に配列した系ではハミルトニアンは次のように書ける。
$ hat(H) & = - J_0 sum_(chevron.l i \, j chevron.r) bold(S)_i dot.op bold(S)_j $
各スピン $bold(S)_i$ が $x$ 軸の正方向となす角度を $theta_i$
とし、低温では次のような近似が行える。 $ bold(S) & = S e^(i theta)\
bold(S)_i dot.op bold(S)_j & = S^2 cos \( theta_i - theta_j \) approx c o n s t . - S^2 / 2 \( theta_i - theta_j \)^2 $
最近接スピンの間隔を $a lt.double l$ とし $a$
より充分大きなスケールで見ると各点 $bold(r)$
の周りのスピンの角度は連続的に変化しているとみなせるとし、$J = J_0 S^2$
とする。 このときハミルトニアンを近似せよ。

]
$ hat(H) & = - J_0 sum_(chevron.l i \, j chevron.r) bold(S)_i dot.op bold(S)_j = - J sum_(chevron.l i \, j chevron.r) cos \( theta_i - theta_j \) approx - J sum_(chevron.l i \, j chevron.r) (1 - frac(\( theta_i - theta_j \)^2, 2))\
 & = J / 2 sum_(chevron.l i \, j chevron.r) \( theta_i - theta_j \)^2 + c o n s t . approx J / 2 integral_A upright(d) bold(r) \( upright(bold(nabla)) theta \( bold(r) \) \)^2 + c o n s t . $

#block[
充分に高温であれば磁化は存在せず、温度を下げていっても有限温度で巨視的な磁化が生じる相転移は起きないことを説明する。
$Delta E$ の $l$ 依存性と、似たようなスピンの揃わない状況 (欠陥)
を作る方法の数の $l$
依存性から、渦の生成に関する自由エネルギーの損得を考え、任意に有限温度を固定したとき、$l$
が充分大きければ巨視的な磁化が生じないことを説明せよ。

]
系全体でスピンの向きが揃った ($theta \( bold(r) \) = theta_0$) 状態
$Theta_0$ とスピンの向きが平面波 $theta \( x \, y \) = frac(pi y, l)$
に従う状態 $Pi_y$ のエネルギーの差 $Delta E$ について
$ Delta E & = (J / 2 integral_A upright(d) bold(r) (upright(bold(nabla)) frac(pi y, l))^2 + c o n s t .) - (J / 2 integral_A upright(d) bold(r) \( upright(bold(nabla)) theta_0 \)^2 + c o n s t .)\
 & = J / 2 integral_A pi^2 / l^2 upright(d) bold(r) = J / 2 pi^2 $
となり $Delta E$ は $l$ に依存しない。またスピンの揃わない状況 (欠陥)
を作る方法の数は $2^(l \/ a)$ 個あるからエントロピーは次のようになる。
$ S & approx k_B l / a $ これより自由エネルギーは
$ F & = E - T S approx J / 2 pi^2 - k_B T l / a $
となり、$l \/ a gt.double 1$
より高温あるいは有限温度では巨視的な磁化は存在できない。

#block[
系全体としては巨視的な磁化が生じるような相転移はないにもかかわらず、有限温度で相転移が起きることを説明せよ。
まず、スピンが $x \, y$
方向に最近接スピンをもつ正方格子状に並んでいるとして、$4 times 4$
の格子の中央に中心をもつ $n = + 1$ および $n = - 1$
の渦を図示せよ。また渦を形成することによるエネルギーの増加 $E_n$
を求めよ。

]
$4 times 4$ の格子において渦は次の図のようになる。
$ upright(bold(nabla)) theta = upright(bold(nabla)) \( n phi.alt \) = (0 \, n / r) $
渦を形成することによるエネルギーの増加 $E_n$
について、渦の中心におけるエネルギーはゼロと考えてよいから積分の下端は
$a$, 上端は $l$ とおいて問題ない。
$ E_n & = J / 2 integral_A upright(d) bold(r) \( upright(bold(nabla)) theta \( bold(r) \) \)^2 = J / 2 integral_0^(2 pi) integral_a^l n^2 / r^2 r upright(d) r upright(d) phi.alt = n^2 pi J ln l / a $

#block[
$n = plus.minus 1$ の自由な渦 1 個のエネルギーは $E_1$,
渦の場所の選び方は $W = \( l \/ a \)^2$
と考えられるので、与えられた、スピンの空間変化が緩やかな状態に 1
個渦を加えることによる自由エネルギーの変化は
$ Delta cal(F) & = E_1 - k_B T ln W $ と見積もれる。相転移の起きる温度
$T_(K T)$ を評価せよ。

]
$n = plus.minus 1$
の自由な渦が生成されるときの自由エネルギーが極小となる点において相転移が起きるから転移温度
$T_(K T)$ は次のようになる。
$ Delta cal(F) & = E_1 - k_B T_(K T) ln W = pi J ln l / a - 2 k_B T_(K T) ln l / a = 0\
T_(K T) & = frac(pi J, 2 k_B) $

== Dirac Fermion
<dirac-fermion>
#block[
グラフェンではそのフェルミ準位 $epsilon_F = 0$
付近の電子のエネルギー分散関係が質量 0 の Dirac 電子と同じ
$epsilon_(bold(k)) = plus.minus c k$ で与えられる。
$k = sqrt(k_x^2 + k_y^2)$ は ($K$ 点から測った) 波数の大きさ、 $c$
は定数でフェルミ速度を用いて $planck v_F$
と表される。以下でこのような分散関係を持つ、スピン $1 \/ 2$
のフェルミ気体の熱力学的な性質について考えよう。

ただし、グラフェンについて 2
サイトからなる単位格子を考えると、単位逆格子あたり 2 個の点 (K, K' 点)
で電子のエネルギーが $epsilon_F = 0$ となっているが、その効果 (valley
自由度と呼ばれる) はここでは考えず、$bold(k)$ 平面の単位面積あたり $N$
個の状態があるものと考えよう。

状態密度 $D \( epsilon \)$ を求めよ。$epsilon = 0$
でゼロになるが、通常の半導体とは異なり、完全なギャップを開かないことからゼロギャップ半導体と呼ばれる。

]
エネルギー $epsilon$ までの状態数 $Omega \( epsilon \)$ は
$epsilon_(bold(k)) = plus.minus c k$
より状態数は円錐の表面積で近似できる。
$ Omega \( epsilon \) & = N times pi epsilon / c epsilon sqrt(1 + 1 / c^2) = sqrt(1 + c^2) / c^2 N pi epsilon^2 $
これより状態密度は次のようになる。
$ D \( epsilon \) & = frac(2 N pi sqrt(1 + c^2), c^2) epsilon $

#block[
以下、絶対零度 $T = 0$ においては電子が $epsilon = 0$
まで詰まるような電子密度を考える。有限温度でも化学ポテンシャル $mu$ が
$0$ のままであることを示せ。

]
$D \( 0 \)$
において有限値を取ると考えると、ゾンマーフェルト展開を行うことで化学ポテンシャルは次のように近似できる。
$ mu & approx epsilon_F - pi^2 / 6 frac(D' \( epsilon_F \), D \( epsilon_F \)) \( k_B T \)^2 = 0 $
これより化学ポテンシャルは有限温度でも $0$ となる。

#block[
有限温度で $T = 0$
と比べた内部エネルギーの増分を計算して比熱を求め、通常の金属における電子比熱の場合と温度の冪が異なる理由を考察せよ。

]
有限温度においてボーズ凝縮を起こしているから内部エネルギーの増分と比熱は次のようになる。
$ U & = integral_0^oo epsilon D \( epsilon \) f_B \( epsilon \) upright(d) epsilon = frac(2 N pi sqrt(1 + c^2), c^2) integral_0^oo frac(epsilon^2, e^(beta epsilon) - 1) upright(d) epsilon\
 & = frac(2 N pi sqrt(1 + c^2), c^2 beta^3) integral_0^oo frac(u^2, e^u - 1) upright(d) u = frac(2 N pi sqrt(1 + c^2), c^2 beta^3) Gamma \( 3 \) zeta \( 3 \) & \( u = beta epsilon \)\
 & = frac(4 N pi sqrt(1 + c^2), c^2) zeta \( 3 \) \( k_B T \)^3\
C & = frac(12 N pi sqrt(1 + c^2), c^2) zeta \( 3 \) k_B^3 T^2 $
通常の金属における電子比熱の場合は $T^(3 \/ 2)$
に依存するが、これは単純に分散関係が異なることにより比熱での温度の冪が異なると考えられる。
