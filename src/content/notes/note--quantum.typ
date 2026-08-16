#import "/src/typst/template.typ": post

#show: post.with(
  title: "量子力学",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/quantum.tex から変換",
)

= 量子力学の基礎
<量子力学の基礎>
TODO: 実験的背景: 電子線を用いた二重スリット実験など

#block[
すべての粒子は粒子性と波動性を合わせ持つ。
$  & "波を特徴付ける物理量" #h(2em) &  & "波数" k \, #h(2em) &  & "角振動数" omega\
 & "粒子を特徴付ける物理量" &  & "運動量" p \, &  & "エネルギー" E $
これらはプランク定数 $planck$ を用いて次のような関係が成り立つ。
$ p & = planck k\
E & = planck omega $

]
== 波動関数
<波動関数>
#block[
波動方程式を満たす関数 $psi \( bold(r) \, t \) in C^1 \( bb(C) \)$
を粒子の場とし、これを波動関数 (wave function) という。また
$rho \( bold(r) \, t \) = \| psi \( bold(r) \, t \) \|^2$
を粒子の確率密度 (probability density)
と解釈し、次の規格化条件を満たすように波動関数を定義する。
$ integral rho \( bold(r) \, t \) upright(d) bold(r) = 1 $

]
#block[
#strong[定理 1] (Schrödinger の方程式). \

波動関数 $psi \( bold(r) \, t \)$ は次の Schrödinger の方程式に従う。
$ i planck frac(partial, partial t) psi \( bold(r) \, t \) & = (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi \( bold(r) \, t \) $

]
波動関数は波動方程式を満たすので次のように書ける。
$ k^2 / omega^2 frac(partial^2 psi \( bold(r) \, t \), partial t^2) & = nabla^2 psi \( bold(r) \, t \) $
このときダランベールの解より波数ベクトル $bold(k)$ を用いて波動関数は
$f \( bold(k) dot.op bold(r) - omega t \)$
の重ね合わせであるから次のようにおく。
$ psi \( bold(r) \, t \) & = integral_(bold(k)) tilde(phi) \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega t \)) upright(d) bold(k) $
この波動関数に対して微分すると次のようになる。
$ frac(partial, partial t) psi \( bold(r) \, t \) & = frac(partial, partial t) integral_(bold(k)) tilde(phi) \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega t \)) upright(d) bold(k) = - i omega integral_(bold(k)) tilde(phi) \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega t \)) upright(d) bold(k) = - i omega psi \( bold(r) \, t \)\
nabla^2 psi \( bold(r) \, t \) & = nabla^2 integral_(bold(k)) tilde(phi) \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega t \)) upright(d) bold(k) = - k^2 integral_(bold(k)) tilde(phi) \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega t \)) upright(d) bold(k) = - k^2 psi \( bold(r) \, t \) $
よって波動方程式は次のようになる。
$ i planck frac(partial, partial t) psi \( bold(r) \, t \) & = (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi \( bold(r) \, t \) $

#block[
#strong[定理 2] (). \

粒子の確率密度について連続の方程式を満たす。
$ frac(partial, partial t) rho \( bold(r) \, t \) + bold(nabla) dot.op bold(j) \( bold(r) \, t \) = 0 $
つまり粒子の全存在確率は保存する。

]
確率密度の時間微分を考えると
$  & quad med frac(partial, partial t) rho \( bold(r) \, t \)\
 & = psi^(\*) \( bold(r) \, t \) (frac(partial, partial t) psi \( bold(r) \, t \)) + (frac(partial, partial t) psi^(\*) \( bold(r) \, t \)) psi \( bold(r) \, t \)\
 & = psi^(\*) \( bold(r) \, t \) (- i / planck (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi \( bold(r) \, t \)) + (i / planck (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi^(\*) \( bold(r) \, t \)) psi \( bold(r) \, t \)\
 & = frac(i planck, 2 m) (psi^(\*) \( bold(r) \, t \) nabla^2 psi \( bold(r) \, t \) - nabla^2 psi^(\*) \( bold(r) \, t \) psi \( bold(r) \, t \))\
 & = frac(i planck, 2 m) bold(nabla) dot.op (psi^(\*) \( bold(r) \, t \) bold(nabla) psi \( bold(r) \, t \) - bold(nabla) psi^(\*) \( bold(r) \, t \) psi \( bold(r) \, t \)) $
より確率の流れ $bold(j) \( bold(r) \, t \)$ を次のように解釈する。
$ bold(j) \( bold(r) \, t \) & := - frac(i planck, 2 m) (psi^(\*) \( bold(r) \, t \) bold(nabla) psi \( bold(r) \, t \) - bold(nabla) psi^(\*) \( bold(r) \, t \) psi \( bold(r) \, t \)) $
これより連続の方程式を満たす。
$ frac(partial, partial t) rho \( bold(r) \, t \) + bold(nabla) dot.op bold(j) \( bold(r) \, t \) = 0 $
これは
$ frac(upright(d), upright(d) t) integral rho \( bold(r) \, t \) upright(d) V & = - integral bold(nabla) dot.op bold(j) \( bold(r) \, t \) upright(d) V = - lim_(\| bold(r) \| arrow.r oo) integral bold(j) \( bold(r) \, t \) dot.op bold(n) upright(d) S = 0 $

== 期待値と演算子
<期待値と演算子>
#block[
物理量 $F$ に対する期待値を次のように定義する。
$ ⟨F⟩ & := integral psi^(\*) \( bold(r) \, t \) F psi \( bold(r) \, t \) upright(d) bold(r) $

]
まずは運動量の期待値を計算すると次のようになる。
$ ⟨bold(p)⟩ & = m frac(upright(d) ⟨bold(r)⟩, upright(d) t) = m frac(upright(d), upright(d) t) integral psi^(\*) bold(r) psi upright(d) bold(r) = m integral (psi^(\*) bold(r) frac(partial psi, partial t) + frac(partial psi^(\*), partial t) bold(r) psi) upright(d) bold(r)\
 & = - m integral psi^(\*) bold(r) i / planck (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi upright(d) bold(r) + m integral i / planck (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi^(\*) bold(r) psi upright(d) bold(r)\
 & = frac(i planck, 2) integral (psi^(\*) bold(r) nabla^2 psi - nabla^2 psi^(\*) bold(r) psi) upright(d) bold(r)\
 & = frac(i planck, 2) integral (psi^(\*) bold(r) nabla^2 psi - psi^(\*) nabla^2 \( bold(r) psi \)) upright(d) bold(r) - frac(i planck, 2) [nabla psi^(\*) bold(r) psi] + frac(i planck, 2) [psi^(\*) nabla \( bold(r) psi \)]\
 & = integral psi^(\*) \( - i planck bold(nabla) \) psi upright(d) bold(r) = ⟨- i planck bold(nabla)⟩ $
また力の期待値も次のようになる。
$ m frac(upright(d)^2 ⟨bold(r)⟩, upright(d) t^2) & = frac(upright(d) ⟨bold(p)⟩, upright(d) t) = - i planck frac(upright(d), upright(d) t) integral psi^(\*) bold(nabla) psi upright(d) bold(r) = integral (- psi^(\*) bold(nabla) (i planck frac(partial psi, partial t)) + (- i planck frac(partial psi^(\*), partial t)) bold(nabla) psi) upright(d) bold(r)\
 & = - integral psi^(\*) bold(nabla) (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi upright(d) bold(r) + integral (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi^(\*) bold(nabla) psi upright(d) bold(r)\
 & = frac(planck^2, 2 m) integral (psi^(\*) bold(nabla) (nabla^2 psi) - (nabla^2 psi^(\*)) bold(nabla) psi) upright(d) bold(r) - integral psi^(\*) bold(nabla) V \( bold(r) \) psi upright(d) bold(r)\
 & = - integral psi^(\*) bold(nabla) V \( bold(r) \) psi upright(d) bold(r) = ⟨- bold(nabla) V⟩ $
このようなことから位置演算子 $hat(bold(r))$, 運動量演算子
$hat(bold(p))$, ハミルトニアン演算子 $hat(H)$ を次のように定義する。
$ hat(bold(r)) := bold(r) \, #h(2em) hat(bold(p)) := - i planck bold(nabla) \, #h(2em) hat(H) := frac(hat(bold(p))^2, 2 m) + V \( hat(bold(r)) \, t \) $

#block[
演算子 $hat(F)$ がエルミート演算子 (Hermite operator)
であるとは次の式が成り立つということである。
$ integral phi.alt^(\*) \( bold(r) \, t \) hat(F) psi \( bold(r) \, t \) upright(d) bold(r) = integral \( hat(F) phi.alt \( bold(r) \, t \) \)^(\*) psi \( bold(r) \, t \) upright(d) bold(r) $
次のように演算子 $hat(F)$
に対して定数倍を除いて波動関数が変化しないとき、波動関数
$psi_f \( bold(r) \, t \)$ を演算子 $hat(F)$ の固有関数、定数 $f$
を固有値と呼ぶ。
$ hat(F) psi_f \( bold(r) \, t \) & = f psi_f \( bold(r) \, t \) $

]
エルミート演算子 $hat(F)$ における固有値 $f \, f'$ を持つ固有関数
$psi_f \( bold(r) \, t \) \, psi_(f') \( bold(r) \, t \)$
について定義より
$ integral psi_(f')^(\*) \( bold(r) \, t \) hat(F) psi_f \( bold(r) \, t \) upright(d) bold(r) & = integral (hat(F) psi_(f') \( bold(r) \, t \))^(\*) psi_f \( bold(r) \, t \) upright(d) bold(r)\
\( f - f'^(\*) \) integral psi_(f')^(\*) \( bold(r) \, t \) psi_f \( bold(r) \, t \) upright(d) bold(r) & = 0 $
$f = f'$ のとき $f = f^(\*)$
であるからエルミート演算子の固有値は必ず実数となる。 また $f eq.not f'$
のとき
$ integral psi_(f')^(\*) \( bold(r) \, t \) psi_f \( bold(r) \, t \) upright(d) bold(r) & = 0 $
となるからエルミート演算子の固有関数は互いに直交する。

#block[
#strong[定理 3] (不確定性原理). \

ある波動関数においてある2つの物理量の標準偏差の積は一定値以上である。
$ Delta r_i Delta p_j gt.eq planck / 2 delta_(i j) $

]
波動関数が次のような関数のとき
$ Psi \( bold(r) \, t \) & := (i s \( hat(r)_i - ⟨hat(r)_i⟩ \) + \( hat(p)_j - ⟨hat(p)_j⟩ \)) psi \( bold(r) \, t \) $

\$\$\\begin{aligned}
    \\int|\\Psi(\\bm{r}, t)|^2\\mathrm{d}{\\bm{r}} & = \\int\\Psi^\*(\\bm{r}, t)\\Psi(\\bm{r}, t)\\mathrm{d}{\\bm{r}}                                                                                                                                     \\\\
                                 & = \\int\\psi^\*(\\bm{r}, t)\\left(s^2(\\hat{r}\_i - \\left\\langle \\hat{r}\_i\\right\\rangle )^2 - is\[\\hat{r}\_i - \\left\\langle \\hat{r}\_i\\right\\rangle , \\hat{p}\_j - \\left\\langle \\hat{p}\_j\\right\\rangle \] + (\\hat{p}\_j - \\left\\langle \\hat{p}\_j\\right\\rangle )^2\\right)\\psi(\\bm{r}, t)\\mathrm{d}{\\bm{r}} \\\\
                                 & = s^2\\left\\langle (\\hat{r}\_i - \\ev{\\hat{r}\_i})^2\\right\\rangle  + s\\hbar\\delta\_{ij} + \\left\\langle (\\hat{p}\_j - \\ev{\\hat{p}\_j})^2\\right\\rangle                                                                            \\\\
                                 & = s^2\\Delta r\_i^2 + s\\hbar\\delta\_{ij} + \\Delta p\_j^2                                                                                                                         \\\\
                                 & = \\left(s + \\frac{\\hbar\\delta\_{ij}}{2\\Delta r\_i^2}\\right)^2\\Delta r\_i^2 - \\frac{\\hbar^2\\delta\_{ij}}{4\\Delta r\_i^2} + \\Delta p\_j^2 \\geq 0
  
\\end{aligned}\$\$
$s = - frac(planck delta_(i j), 2 Delta r_i^2)$
とすると位置と運動量における不確定性原理が求まる。
$ Delta r_i Delta p_j gt.eq planck / 2 delta_(i j) $

= 時間に依存しないポテンシャル
<時間に依存しないポテンシャル>
ポテンシャルの性質によって解き方が変わってくる。

ここではポテンシャルが時間に依存せず、Schrödinger
方程式が時間に依存しないときを考える。時間成分について波動関数は
$psi \( bold(r) \, t \) = phi \( bold(r) \) e^(- i omega t)$
と分けられるから Schrödinger 方程式は次のように書ける。
$ hat(H) & = - frac(planck^2, 2 m) nabla^2 + V \( bold(r) \) = frac(hat(bold(p))^2, 2 m) + V \( bold(r) \)\
hat(H) psi \( bold(r) \, t \) & = i planck frac(partial, partial t) psi \( bold(r) \, t \) = planck omega psi \( bold(r) \, t \) = E psi \( bold(r) \, t \) $
またポテンシャルが不連続であっても有限ならば波動関数は連続である。
$ lim_(epsilon.alt arrow.r + 0) nabla psi \( bold(r) \, t \) \|_(bold(r)_0)^(bold(r)_0 + epsilon.alt) & = lim_(epsilon.alt arrow.r + 0) integral_(bold(r)_0)^(bold(r)_0 + epsilon.alt) nabla^2 psi \( bold(r) \, t \) upright(d) bold(r)\
 & = - frac(2 m, planck^2) lim_(epsilon.alt arrow.r + 0) integral_(bold(r)_0)^(bold(r)_0 + epsilon.alt) underbrace(\( E - V \( bold(r) \) \) psi \( bold(r) \, t \), "有限") upright(d) bold(r) arrow.r 0 $
ポテンシャルが空間反転対称性をもつとき $phi \( bold(r) \)$ が
Schrödinger 方程式の解ならば $phi \( - bold(r) \)$ も解となる。
$ E phi \( - bold(r) \) & = (- frac(planck^2, 2 m) \( - nabla \)^2 + V \( - bold(r) \)) phi \( - bold(r) \) = (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) phi \( - bold(r) \) = hat(H) phi \( - bold(r) \) $
線形従属、線形独立のときを考えると偶関数または奇関数としても一般性は失われない。

#block[
基底状態はエネルギーが最小となるパラメータの状態、第 $n$
励起状態は基底状態の次に $n$ 番目に低いエネルギーの状態である。3
次元系の場合、異なる状態で同じエネルギーを持つことがある。これをエネルギーの縮退という。

]
== 平面波
<平面波>
#block[
まずポテンシャルが $V \( x \) = 0$
のとき固有関数と固有エネルギーは次のようになる。
$ psi_(bold(k)) \( bold(r) \, t \) & = frac(1, \( 2 pi \)^(3 \/ 2)) e^(i \( bold(k) dot.op bold(r) - omega_(bold(k)) t \)) #h(2em) (E_(bold(k)) = planck omega_(bold(k)) = frac(planck^2 k^2, 2 m)) $
つまり平面波となる。

]
シュレーディンガー方程式は次のようになる。
$ - frac(planck^2, 2 m) bold(nabla)^2 psi \( bold(r) \) = E psi \( bold(r) \) $
これは波動方程式となっているから波数で展開すると
$ psi_(bold(k)) \( bold(r) \, t \) & = C e^(i \( bold(k) dot.op bold(r) - omega_(bold(k)) t \)) #h(2em) (E_(bold(k)) = frac(planck^2 k^2, 2 m)) $
一辺の長さ $L$ の箱の中に閉じ込めるという周期境界条件を考える。
$ psi \( bold(r) \, t \) = psi \( bold(r) + L bold(e)_i \, t \) arrow.l.r.double e^(i k_i L) = 1 arrow.l.r.double k_i = frac(2 pi n_i, L) #h(2em) \( n_i in bb(Z) \) $
また規格化条件より次のようになる。
$ integral \| psi_(bold(k)) \( bold(r) \, t \) \|^2 upright(d) bold(r) = \| C \|^2 L^3 = 1 arrow.l.r.double \| C \| & = 1 / L^(3 \/ 2) $
また正規直交関係式より
$ integral psi_(bold(k)')^(\*) \( bold(r) \, t \) psi_(bold(k)) \( bold(r) \, t \) upright(d) bold(r) & = delta_(bold(k) bold(k)') $
一辺の長さが無限大の箱を考えるときディラックのデルタ関数を用いると
$ lim_(L arrow.r oo) integral psi_(bold(k)')^(\*) \( bold(r) \, t \) psi_(bold(k)) \( bold(r) \, t \) upright(d) bold(r) & = \| C \|^2 e^(- i \( omega_(bold(k)) - omega_(bold(k)') \) t) lim_(L arrow.r oo) integral e^(i \( bold(k) - bold(k)' \) dot.op bold(r)) upright(d) bold(r)\
 & = \| C \|^2 e^(- i \( omega_(bold(k)) - omega_(bold(k)') \) t) product_(i = x \, y \, z) lim_(L arrow.r oo) integral_(- L \/ 2)^(L \/ 2) e^(i \( k_i - k_(i') \) r_i) upright(d) r_i\
 & = \| C \|^2 e^(- i \( omega_(bold(k)) - omega_(bold(k)') \) t) product_(i = x \, y \, z) lim_(L arrow.r oo) frac(e^(i \( k_i - k_(i') \) L \/ 2) - e^(- i \( k_i - k_(i') \) L \/ 2), i \( k_i - k_(i') \))\
 & = \| C \|^2 e^(- i \( omega_(bold(k)) - omega_(bold(k)') \) t) product_(i = x \, y \, z) 2 pi lim_(L arrow.r oo) frac(sin \( \( k_i - k_(i') \) L \/ 2 \), pi \( k_i - k_(i') \))\
 & = \| C \|^2 e^(- i \( omega_(bold(k)) - omega_(bold(k)') \) t) product_(i = x \, y \, z) 2 pi delta \( k_i - k_(i') \)\
 & = \| C \|^2 e^(- i \( omega_(bold(k)) - omega_(bold(k)') \) t) \( 2 pi \)^3 delta \( bold(k) - bold(k)' \)\
 & = e^(- i \( omega_(bold(k)) - omega_(bold(k)') \) t) delta \( bold(k) - bold(k)' \) #h(2em) (because \| C \| = frac(1, \( 2 pi \)^(3 \/ 2)))\
 & = delta \( bold(k) - bold(k)' \) $

== 剛体壁ポテンシャル
<剛体壁ポテンシャル>
#block[
中心から距離 $L$ 以降には粒子が入れないような 1
次元ポテンシャルを考える。
$ V \( x \) & = cases(delim: "{", + oo & \( \| x \| > L \), 0 & \( \| x \| < L \)) $
このとき固有関数、固有エネルギーは次のようになる。
$ phi_n \( x \) & = cases(delim: "{", 1 / sqrt(L) cos \( frac(n pi, 2 L) x \) & \( n = 1 \, 3 \, 5 \, dots.h \), 1 / sqrt(L) sin \( frac(n pi, 2 L) x \) & \( n = 2 \, 4 \, 6 \, dots.h \))\
E_n & = frac(planck^2, 2 m) (frac(n pi, 2 L))^2 $

]
$\| x \| > L$
においてポテンシャルの深さが無限大となるので粒子は侵入出来ない為に波動関数はゼロとなる。
$ phi \( x \) = 0 #h(2em) \( \| x \| > L \) $ また $\| x \| < L$
においては次の微分方程式となる。
$ - frac(planck^2, 2 m) frac(upright(d)^2, upright(d) x^2) phi \( x \) & = E phi \( x \) #h(2em) \( \| x \| < L \) $
これより波動関数の解は次のようになる。
$ phi \( x \) & = A e^(i k x) + B e^(- i k x)\
E & = frac(planck^2 k^2, 2 m) > 0 $
波動関数は連続的につながっていなければならないので
$ phi \( plus.minus L \) = 0 & arrow.l.r.double {A e^(i k L) + B e^(- i k L) = 0\
A e^(- i k L) + B e^(i k L) = 0 arrow.l.r.double {B = - A e^(2 i k L)\
A \( e^(4 i k L) - 1 \) = 0 $ ここで $A = B = 0$
となる解は意味を成さないので排除すると次のように $k$ が離散化される。
$ {e^(4 i k L) = 1\
B = - A e^(2 i k L)\
 & arrow.l.r.double {k = frac(n pi, 2 L)\
B = \( - 1 \)^(n + 1) A\
 #h(2em) \( n = 1 \, 2 \, dots.h.c \) $ これより $\| x \| < L$
において波動関数は次のように離散化される。
$ phi_n \( x \) = A e^(i k x) + B e^(- i k x) & = cases(delim: "{", 2 A cos \( frac(n pi, 2 L) x \) & \( n = 1 \, 3 \, 5 \, dots.h \), 2 A i sin \( frac(n pi, 2 L) x \) & \( n = 2 \, 4 \, 6 \, dots.h \)) $
最後に規格化条件を適用することで $A$ が決定される。
$ integral_(- oo)^oo \| phi_n \( x \) \|^2 upright(d) x = integral_(- L)^L \| phi_n \( x \) \|^2 upright(d) x = \( 2 A \)^2 L = 1 arrow.l.r.double 2 A = 1 / sqrt(L) $
よって固有関数とエネルギー固有値は
$ phi_n \( x \) & = cases(delim: "{", 1 / sqrt(L) cos \( frac(n pi, 2 L) x \) & \( n = 1 \, 3 \, 5 \, dots.h \), 1 / sqrt(L) sin \( frac(n pi, 2 L) x \) & \( n = 2 \, 4 \, 6 \, dots.h \))\
E_n & = frac(planck^2, 2 m) (frac(n pi, 2 L))^2 $
のように離散化される。

== 立方体剛体壁ポテンシャル
<立方体剛体壁ポテンシャル>
#block[
立方体中にしか粒子が存在しないようなポテンシャルを考える。
\$\$\\begin{aligned}
    V(x) & = \\begin{cases}
               0        & (\$0 \< x, y, z \< L\$) \\\\
               + \\infty & (otherwise)
             \\end{cases}
  
\\end{aligned}\$\$ このとき固有関数、固有エネルギーは次のようになる。
$ phi \( x \, y \, z \) & = (2 / L)^(3 \/ 2) sin \( frac(n_x pi, L) x \) sin \( frac(n_y pi, L) y \) sin \( frac(n_z pi, L) z \)\
E & = frac(pi^2 planck^2, 2 m L^2) (n_x^2 + n_y^2 + n_z^2) $

]
波動関数を $phi \( bold(r) \) = X \( x \) Y \( y \) Z \( z \)$
と変数分離する。
$  & - frac(planck^2, 2 m) nabla^2 phi \( bold(r) \) = E phi \( bold(r) \)\
 & - frac(planck^2, 2 m) (frac(partial^2, partial x^2) + frac(partial^2, partial y^2) + frac(partial^2, partial z^2)) \[ X \( x \) Y \( y \) Z \( z \) \] = E X \( x \) Y \( y \) Z \( z \)\
 & - frac(planck^2, 2 m) (1 / X frac(upright(d)^2 X, upright(d) x^2) + 1 / Y frac(upright(d)^2 Y, upright(d) y^2) + 1 / Z frac(upright(d)^2 Z, upright(d) z^2)) = E $
各変数に対して独立に考えることで剛体壁ポテンシャルと同様になる。エネルギーを$E = epsilon_x + epsilon_y + epsilon_z$
とおくと
$  & - frac(planck^2, 2 m) 1 / X frac(upright(d)^2 X, upright(d) x^2) = epsilon_x\
 & - frac(planck^2, 2 m) 1 / Y frac(upright(d)^2 Y, upright(d) y^2) = epsilon_y\
 & - frac(planck^2, 2 m) 1 / Z frac(upright(d)^2 Z, upright(d) z^2) = epsilon_z $

状態 $\( n_x \, n_y \, n_z \)$ について基底状態は $\( 1 \, 1 \, 1 \)$
の状態であり、第 1 励起状態は
$\( 2 \, 1 \, 1 \) \, \( 1 \, 2 \, 1 \) \, \( 1 \, 1 \, 2 \)$ の 3
つの状態があり、エネルギーの縮退を起こしている。

== 井戸型ポテンシャル
<井戸型ポテンシャル>
#block[
$ V \( x \) = cases(delim: "{", V_0 & \( \| x \| < L \), 0 & \( \| x \| > L \)) $
$V_0 < E < 0$ のとき

]
空間反転対称性より偶関数と奇関数 $phi_(+) \( x \) \, phi_(-) \( x \)$
としてよい。
$ - frac(planck^2, 2 m) frac(upright(d)^2, upright(d) x^2) phi_plus.minus \( x \) & = \( E - V_0 \) phi_plus.minus \( x \) & \( \| x \| < L \)\
- frac(planck^2, 2 m) frac(upright(d)^2, upright(d) x^2) phi_plus.minus \( x \) & = E phi_plus.minus \( x \) & \( \| x \| > L \) $
まず $V_0 < E < 0$ となる場合を考える。
$ phi_plus.minus \( x \) & = cases(delim: "{", A e^(i k x) + B e^(- i k x) & \( \| x \| < L \), C_plus.minus e^(kappa \( x - L \)) + D_plus.minus e^(- kappa \( x - L \)) & \( \| x \| > L \))\
E - V_0 & = frac(planck^2 k^2, 2 m) > 0 \, #h(2em) E = - frac(planck^2 kappa^2, 2 m) < 0 $
$\| x \| < L$ において偶奇性より
$ {phi_(+) \( x \) = A_(+) cos \( k x \)\
phi_(-) \( x \) = A_(-) sin \( k x \) $
境界における波動関数とその微分係数の連続性を要請すると
$ {phi_(+) \( L \) = A_(+) cos \( k L \) = C_(+) + D_(+)\
phi_(-) \( L \) = A_(-) sin \( k L \) = C_(-) + D_(-)\
phi_(+') \( L \) = - A_(+) k sin \( k L \) = C_(+) kappa - D_(+) kappa\
phi_(-') \( L \) = A_(-) k cos \( k L \) = C_(+) kappa - D_(+) kappa\
 arrow.l.r.double {2 C_(+) = A_(+) cos \( k L \) - A_(+) k / kappa sin \( k L \)\
2 D_(+) = A_(+) cos \( k L \) + A_(+) k / kappa sin \( k L \)\
2 C_(-) = A_(-) sin \( k L \) + A_(-) k / kappa cos \( k L \)\
2 D_(-) = A_(-) sin \( k L \) - A_(-) k / kappa cos \( k L \)\
 $

== 1次元調和振動子
<次元調和振動子>
#block[
ポテンシャルが質点の遠心力を仕事とした調和振動子とする。
$ V \( x \) = 1 / 2 m omega^2 x^2 $
固有関数と固有エネルギーは次のようになる。
$ psi_n \( x \) & = sqrt(frac(1, 2^n n ! sqrt(pi))) H_n (sqrt(frac(m omega, planck)) x) e^(- frac(m omega x^2, 2 planck))\
E_n & = (n + 1 / 2) planck omega $

]
$ hat(H) = frac(hat(p)^2, 2 m) + 1 / 2 m omega^2 x^2 $ 位置を無次元量
$xi = sqrt(frac(m omega, planck)) x$ に変換する。
$ hat(H) psi \( x \) & = (- frac(planck^2, 2 m) frac(upright(d)^2, upright(d) x^2) + 1 / 2 m omega^2 x^2) psi \( x \) = frac(planck omega, 2) (- frac(upright(d)^2, upright(d) xi^2) + xi^2) psi \( xi \) = E psi \( xi \) $
またエネルギーも無次元量 $epsilon.alt = frac(2, planck omega) E$
に変換すると $ psi'' + (epsilon.alt - xi^2) psi \( xi \) = 0 $
となる。この解は $psi \( xi \) = X \( xi \) e^(plus.minus xi^2 / 2)$
と予測されるのでこれを微分方程式に代入とすると
$ X'' plus.minus 2 xi X' + \( epsilon.alt plus.minus 1 \) X = 0 $
よりこの微分方程式の解 $X \( xi \)$ はエルミート多項式の定数倍
$c H_n \( xi \)$ となる。 ここで、Hermite 多項式 $H_n \( x \)$ は次の
Rodrigues 公式により定義される。
$ H_n \( x \) = \( - 1 \)^n e^(x^2) frac(upright(d)^n, upright(d) x^n) e^(- x^2) $
このとき無限大で発散する $psi \( xi \) = X \( xi \) e^(xi^2 / 2)$
は不適。 TODO: なぜ $+$ の場合を排除できるのかを明確に記す。 これより
$psi_n \( xi \) = c H_n \( xi \) e^(- xi^2 / 2)$
となる。規格化条件を考えると
$ integral_(bb(R)) psi_m^(\*) psi_n upright(d) xi & = c^2 integral_(bb(R)) (H_m \( xi \) e^(- xi^2 / 2))^(\*) H_n \( xi \) e^(- xi^2 / 2) upright(d) xi\
 & = c^2 integral_(bb(R)) H_m \( xi \) H_n \( xi \) e^(- xi^2) upright(d) xi\
 & = 2^n n ! sqrt(pi) c^2 delta_(m \, n)\
 & = delta_(m \, n) $ よって次のようになる。
$ psi_n \( xi \) & = sqrt(frac(1, 2^n n ! sqrt(pi))) H_n \( xi \) e^(- xi^2 / 2)\
psi_n \( x \) & = sqrt(frac(1, 2^n n ! sqrt(pi))) H_n (sqrt(frac(m omega, planck)) x) e^(- frac(m omega, 2 planck) x^2)\
E_n & = (n + 1 / 2) planck omega $

$ Psi_n \( q \) = ⟨q mid(bar.v) n⟩ = (frac(m omega, 2^(2 n) \( n ! \)^2 pi planck))^(1 / 4) e^(- frac(m omega, 2 planck) q^2) H_n (sqrt(frac(m omega, planck)) q) $

#block[
上昇演算子 $hat(a)^dagger$, 下降演算子 $hat(a)$, 数演算子 $hat(N)$
を次のように定義する。
$ hat(a)^dagger & = 1 / sqrt(2) (xi - frac(upright(d), upright(d) xi)) & hat(a) & = 1 / sqrt(2) (xi + frac(upright(d), upright(d) xi)) & hat(N) & = hat(a)^dagger hat(a) $

]
#block[
上昇・下降演算子により
$ hat(a)^dagger psi_n \( xi \) & = sqrt(n + 1) psi_(n + 1) \( xi \)\
hat(a) psi_n \( xi \) & = sqrt(n) psi_(n - 1) \( xi \)\
hat(N) psi_n \( xi \) & = n psi_n \( xi \)\
hat(H) & = (hat(N) + 1 / 2) planck omega $

]
これらを波動関数に掛けると
$ hat(a)^dagger psi_n \( xi \) & = 1 / sqrt(2) (xi - frac(upright(d), upright(d) xi)) (sqrt(frac(1, 2^n n ! sqrt(pi))) H_n \( xi \) e^(- xi^2 / 2))\
 & = sqrt(frac(n + 1, 2^(n + 1) \( n + 1 \) ! sqrt(pi))) (xi H_n \( xi \) - \( H_(n') \( xi \) - xi H_n \( xi \) \))\
 & = sqrt(n + 1) psi_(n + 1) \( xi \)\
hat(a) psi_n \( xi \) & = 1 / sqrt(2) (xi + frac(upright(d), upright(d) xi)) (sqrt(frac(1, 2^n n ! sqrt(pi))) H_n \( xi \) e^(- xi^2 / 2))\
 & = sqrt(frac(1, 2^(n - 1) \( n - 1 \) ! sqrt(pi))) frac(1, 2 sqrt(n)) (xi H_n \( xi \) + \( H_(n') \( xi \) - xi H_n \( xi \) \))\
 & = sqrt(n) psi_(n - 1) \( xi \) $ となる。この結果を用いて
$ hat(N) psi_n \( xi \) & = hat(a)^dagger hat(a) psi_n \( xi \) = sqrt(n) hat(a)^dagger psi_(n - 1) \( xi \) = n psi_n \( xi \) $
これより
$ hat(H) psi_n \( xi \) & = (n + 1 / 2) planck omega psi_n \( xi \) = (hat(N) + 1 / 2) planck omega psi_n \( xi \) $
となる。

#block[
上の結果を用いて交換関係は次のようになる。
$ \[ hat(a) \, hat(a)^dagger \] = 1 \, #h(2em) \[ hat(N) \, hat(a) \] = hat(a) \, #h(2em) \[ hat(N) \, hat(a)^dagger \] = - hat(a)^dagger $

]
$ \[ hat(a) \, hat(a)^dagger \] & = hat(a) hat(a)^dagger - hat(a)^dagger hat(a)\
 & = 1 / 2 ((xi + frac(upright(d), upright(d) xi)) (xi - frac(upright(d), upright(d) xi)) - (xi - frac(upright(d), upright(d) xi)) (xi + frac(upright(d), upright(d) xi)))\
 & = 1 / 2 ((xi^2 + 1 - frac(upright(d)^2, upright(d) xi^2)) - (xi^2 - 1 - frac(upright(d)^2, upright(d) xi^2)))\
 & = 1 $
$ \[ hat(N) \, hat(a) \] & = \[ hat(a)^dagger hat(a) \, hat(a) \] = \[ hat(a)^dagger \, hat(a) \] hat(a) = hat(a)\
\[ hat(N) \, hat(a)^dagger \] & = \[ hat(a)^dagger hat(a) \, hat(a)^dagger \] = hat(a)^dagger \[ hat(a) \, hat(a)^dagger \] = - hat(a)^dagger $

== 3次元調和振動子
<次元調和振動子-1>
#block[
3次元等方調和振動子について
$ hat(H) = frac(hat(bold(p)), 2 m) + 1 / 2 m omega^2 bold(r)^2 $
固有関数、固有エネルギーは次のようになる。
$ psi_(n_1 \, n_2 \, n_3) \( bold(r) \) & = product_(i = 1)^3 sqrt(frac(1, 2^(n_i) n_i ! sqrt(pi))) H_(n_i) (sqrt(frac(m omega, planck)) r_i) e^(- frac(m omega r_i^2, 2 planck))\
E_(n_1 \, n_2 \, n_3) & = (n_1 + n_2 + n_3 + 3 / 2) planck omega $

]
波動関数を
$psi \( bold(r) \) = X_1 \( r_1 \) X_2 \( r_2 \) X_3 \( r_3 \)$
と変数分離すると1次元調和振動子と同様に解ける。
$ E_i X_i \( r_i \) & = (frac(hat(p)_i^2, 2 m) + 1 / 2 m omega^2 r_i^2) X_i \( r_i \)\
X_i \( r_i \) & = sqrt(frac(1, 2^(n_i) n_i ! sqrt(pi))) H_(n_i) \( xi_i \) e^(- xi_i^2 / 2) & (xi_i = sqrt(frac(m omega, planck)) r_i)\
E_i & = (n_i + 1 / 2) planck omega $ より
$ psi_(n_1 \, n_2 \, n_3) \( r_1 \, r_2 \, r_3 \) & = product_(i = 1)^3 sqrt(frac(1, 2^(n_i) n_i ! sqrt(pi))) H_(n_i) \( xi_i \) e^(- xi_i^2 / 2)\
E_(n_1 \, n_2 \, n_3) & = (n_1 + n_2 + n_3 + 3 / 2) planck omega $
となる。

== 2次元中心力ポテンシャル
<次元中心力ポテンシャル>
#block[
2次元中心力ポテンシャルのとき、波動関数は
$psi \( r \, theta \) = R \( r \) e^(i mu theta)$ として $R \( r \)$
は次の微分方程式を満たす関数である。
$ R'' + 1 / r R' - (frac(2 m \( V \( r \) - E \), planck^2) + mu^2) R = 0 $

]
極座標 $ hat(H) & = - frac(planck^2, 2 m) nabla^2 + V \( r \)\
 & = - frac(planck^2, 2 m) (frac(partial^2, partial r^2) + 1 / r frac(partial, partial r) + 1 / r^2 frac(partial^2, partial theta^2)) + V \( r \)\
0 & = (frac(partial^2, partial r^2) + 1 / r frac(partial, partial r) + 1 / r^2 frac(partial^2, partial theta^2) + frac(2 m \( E - V \( r \) \), planck^2)) psi \( r \, theta \) $
波動関数を $psi \( r \, theta \) = R \( r \) Theta \( theta \)$
と変数分離する。
$ R'' / R + 1 / r R' / R + 1 / r^2 Theta'' / Theta + frac(2 m \( E - V \( r \) \), planck^2) = 0 $
依存する変数を分けることで定数 $mu$ を用いて次のようになる。
$ {R'' + 1 / r R' + frac(2 m \( E - V \( r \) \), planck^2) R = mu^2 R\
Theta'' = - mu^2 Theta $ $Theta \( theta \)$
については次のように解ける。
$ Theta \( theta \) = cases(delim: "{", A e^(i \| mu \| theta) + B e^(- i \| mu \| theta) & \( mu^2 eq.not 0 \), C theta + D & \( mu^2 = 0 \), ) $
波動関数は連続であるから $Theta \( 0 \) = Theta \( 2 pi \)$
であり、規格化条件を満たす。これより $C = D = 0$
となる解は意味を成さず、$m in bb(Z)$ となる。
$ Theta \( theta \) = 1 / sqrt(2 pi) e^(i mu theta) #h(2em) \( mu in bb(Z) \) $
よって波動関数は $psi \( r \, theta \) = R \( r \) e^(i mu theta)$
として $R \( r \)$ は次の微分方程式を満たす関数である。
$ R'' + 1 / r R' + (frac(2 m \( E - V \( r \) \), planck^2) - mu^2) R = 0 $

== 2次元等方調和振動子
<次元等方調和振動子>
#block[
2次元等方調和振動子のポテンシャルにおいて固有関数と固有エネルギーは次のようになる。
$ psi \( rho \, theta \) & = rho^(\| mu \|) e^(- rho^2 / 2) L_n^(\| mu \|) \( rho \) e^(i mu theta)\
E_(n \, mu) & = $

]
極座標で2次元等方調和振動子を考える。まず $r$ を無次元化すると
$ hat(H) & = - frac(planck^2, 2 m) nabla^2 + 1 / 2 m omega^2 r^2\
 & = - frac(planck^2, 2 m) (frac(partial^2, partial r^2) + 1 / r frac(partial, partial r) + 1 / r^2 frac(partial^2, partial theta^2)) + 1 / 2 m omega^2 r^2\
 & = - frac(planck omega, 2) (frac(partial^2, partial rho^2) + 1 / rho frac(partial, partial rho) + 1 / rho^2 frac(partial^2, partial theta^2) - rho^2) & (rho = sqrt(frac(m omega, planck)) r) $
波動関数を $psi \( rho \, theta \) = R \( rho \) e^(i mu theta)$
と変数分離する。
$ R'' + 1 / rho R' + (frac(2 E, planck omega) - rho^2 - mu^2 / rho^2) R = 0 $
$rho arrow.r 0$ のとき $R \( rho \) = rho^s$ とおくと
$R \( rho \) = rho^(\| mu \|)$ が適する。
$  & rho^2 R'' + rho R' - mu^2 R = 0 & \( rho arrow.r 0 \)\
 & rho^2 s \( s - 1 \) rho^(s - 2) + rho s rho^(s - 1) - mu^2 rho^s = 0\
 & \( s^2 - mu^2 \) rho^s = 0 $ $rho arrow.r oo$ のとき
$R = e^(- rho^2 / 2)$ が適する。
$  & rho R'' + R' - rho^3 R = 0 & \( rho arrow.r oo \)\
 & rho \( - 1 + rho^2 \) e^(- rho^2 / 2) - rho e^(- rho^2 / 2) - rho^3 e^(- rho^2 / 2) = 0 $
この結果を用いて微分方程式に代入するとそれらはラゲールの陪関数によって補完されることが分かる。
$ R \( rho \) & = rho^(\| mu \|) e^(- rho^2 / 2) L_n^(\| mu \|) \( rho \) #h(2em) \( \| mu \| lt.eq n in bb(Z) \) $
$ psi \( rho \, theta \) & = rho^(\| mu \|) e^(- rho^2 / 2) L_n^(\| mu \|) \( rho \) e^(i mu theta)\
E_(n \, mu) & = $

== 3次元中心力(球対称)ポテンシャル
<次元中心力球対称ポテンシャル>
#block[
3次元中心力ポテンシャルのとき、波動関数は
$psi_(l m) \( r \, theta \, phi.alt \) = R_l \( r \) Theta_(l m) \( theta \) Phi_m \( phi.alt \)$
と変数分離するとそれぞれ次のようになる。
$ Phi_m \( phi.alt \) & = 1 / sqrt(2 pi) e^(i m phi.alt) & \( m in bb(Z) \)\
Theta_(l m) \( theta \) & = \( - 1 \)^(frac(m + \| m \|, 2)) sqrt((l + 1 / 2) frac(\( l - \| m \| \) !, \( l + \| m \| \) !)) P_l^(\| m \|) \( cos theta \) & \( l in bb(Z) \)\
- frac(planck^2, 2 mu r) frac(upright(d)^2, upright(d) r^2) \( r R_l \( r \) \) & + (V \( r \) + frac(l \( l + 1 \) planck^2, 2 mu r^2)) r R_l \( r \) = E r R_l \( r \) $

]
動径方向のみに依存するポテンシャル $V \( r \)$ を考える。
$ hat(H) & = - frac(planck^2, 2 mu) nabla^2 + V \( r \)\
 & = - frac(planck^2, 2 mu) (1 / r^2 frac(partial, partial r) (r^2 frac(partial, partial r)) + frac(1, r^2 sin theta) frac(partial, partial theta) (sin theta frac(partial, partial theta)) + frac(1, r^2 sin^2 theta) frac(partial^2, partial phi.alt^2)) + V \( r \)\
0 & = (frac(partial, partial r) (r^2 frac(partial, partial r)) + frac(1, sin theta) frac(partial, partial theta) (sin theta frac(partial, partial theta)) + frac(1, sin^2 theta) frac(partial^2, partial phi.alt^2) + frac(2 mu r^2 \( E - V \( r \) \), planck^2)) psi \( r \, theta \, phi.alt \) $
と書ける。波動関数 $psi \( r \, theta \, phi.alt \)$ を
$psi \( r \, theta \, phi.alt \) = R \( r \) Y \( theta \, phi.alt \)$
と変数分離すると定数 $lambda$ を用いて
$  & (frac(partial, partial r) (r^2 frac(partial, partial r)) + frac(2 mu r^2 \( E - V \( r \) \), planck^2)) R \( r \) = lambda R \( r \)\
 & (frac(1, sin theta) frac(partial, partial theta) (sin theta frac(partial, partial theta)) + frac(1, sin^2 theta) frac(partial^2, partial phi.alt^2)) Y \( theta \, phi.alt \) = - lambda Y \( theta \, phi.alt \) $
となる。また
$Y \( theta \, phi.alt \) = Theta \( theta \) Phi \( phi.alt \)$
と変数分離すると定数 $m$ を用いて
$  & (sin theta frac(partial, partial theta) (sin theta frac(partial, partial theta)) + lambda sin^2 theta) Theta \( theta \) = m^2 Theta \( theta \)\
 & frac(upright(d)^2 Phi \( phi.alt \), upright(d) phi.alt^2) = - m^2 Phi \( phi.alt \) $
となる。よって次の 3 式を解けばよい。
$  & (frac(upright(d), upright(d) r) (r^2 frac(upright(d), upright(d) r)) + frac(2 mu r^2 \( E - V \( r \) \), planck^2)) R \( r \) = lambda R \( r \)\
 & (sin theta frac(upright(d), upright(d) theta) (sin theta frac(upright(d), upright(d) theta)) + lambda sin^2 theta) Theta \( theta \) = m^2 Theta \( theta \)\
 & frac(upright(d)^2 Phi \( phi.alt \), upright(d) phi.alt^2) = - m^2 Phi \( phi.alt \) $
まず $Phi \( phi.alt \)$ の一般解は次のようになる。
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
$ Theta_(l m) \( theta \) & = \( - 1 \)^(frac(m + \| m \|, 2)) sqrt((l + 1 / 2) frac(\( l - \| m \| \) !, \( l + \| m \| \) !)) P_l^(\| m \|) \( cos theta \)\
P_l^m \( z \) & = \( 1 - z^2 \)^(m / 2) frac(upright(d)^m P_l \( z \), upright(d) z^m)\
P_l^(- m) \( z \) & = \( - 1 \)^m frac(\( l - \| m \| \) !, \( l + \| m \| \) !) P_l^m \( z \)\
P_l \( z \) & = 1 / 2^l frac(upright(d)^l, upright(d) z^l) \( z^2 - 1 \)^l $
と書ける。また $R_l \( r \)$ については
$R_l \( r \) = frac(chi_l \( r \), r)$ とおくと
$ - frac(planck^2, 2 mu r) frac(upright(d)^2, upright(d) r^2) chi_l \( r \) + (V \( r \) + frac(l \( l + 1 \) planck^2, 2 mu r^2)) chi_l \( r \) = E chi_l \( r \) $
となり, 1 次元のシュレーディンガー方程式に帰着する。

== 自由な 3 次元系
<自由な-3-次元系>
#block[
ポテンシャルが球対称に無いとき $ V \( r \) = 0 $ 球ベッセル関数
$j_l \( xi \)$ と球ノイマン関数 $n_l \( xi \)$ の線形結合で書かれる。
$ R_l \( xi \) & = alpha j_l \( xi \) + beta n_l \( xi \) $

]
動径方向のシュレーディンガー方程式について
$k^2 = frac(2 mu E, planck^2)$, $xi = k r$ とすると
$  & frac(upright(d)^2, upright(d) r^2) R_l \( r \) + 2 / r frac(upright(d), upright(d) r) R_l \( r \) + (frac(2 mu E, planck^2) - frac(l \( l + 1 \), r^2)) R_l \( r \) = 0\
 & frac(upright(d)^2, upright(d) xi^2) R_l \( xi \) + 2 / xi frac(upright(d), upright(d) xi) R_l \( xi \) + (1 - frac(l \( l + 1 \), xi^2)) R_l \( xi \) = 0 $
となり, 一般解は球ベッセル関数 $j_l \( xi \)$ と球ノイマン関数
$n_l \( xi \)$ の線形結合で書かれる。
$ R_l \( xi \) & = alpha j_l \( xi \) + beta n_l \( xi \) $
球ノイマン関数は原点に極を持つので大体の場合排除される。

例えば球面波のとき
$psi_(l m) \( r \, theta \, phi.alt \) = j_l \( k r \) Y_l^m \( theta \, phi.alt \)$
となる。

平面波のとき
$psi_(l m) \( r \, theta \, phi.alt \) = e^(i bold(k) dot.op bold(r))$
となる。特に $z$ 方向のとき次のようになるらしい。
$ e^(i bold(k) dot.op bold(z)) = e^(i k r cos theta) = sum_(l = 0)^oo \( 2 l + 1 \) i^l j_l \( k r \) P_l \( cos theta \) $

== 球対称剛体壁ポテンシャル
<球対称剛体壁ポテンシャル>
#block[
次のようなポテンシャルのとき
$ V \( r \) = cases(delim: "{", 0 & \( 0 lt.eq r lt.eq L \), oo & \( L < r \)) $
固有関数と固有エネルギーは次のようになる。
$ psi_(n l m) \( r \, theta \, phi.alt \) & = C_(n l) j_l \( xi_(n l) \) Y_l^m \( theta \, phi.alt \)\
E_(l n) & = frac(planck^2, 2 mu L^2) xi_(l n)^2 $

]
$r > L$ のとき $xi_(n l) = 0$ となる。$0 lt.eq r < L$ において考える。

$l = 0$ のとき
$ - frac(planck^2, 2 mu r) frac(upright(d)^2, upright(d) r^2) chi_0 \( r \) + V \( r \) chi_0 \( r \) = E chi_0 \( r \) $
となるので境界条件と規格化条件より
$ R_(n 0) \( r \) = frac(chi_(n 0) \( r \), r) & = cases(delim: "{", 1 / r sqrt(2 / L) cos \( frac(n pi, 2 L) r \) & \( n : "奇数" \), 1 / r sqrt(2 / L) sin \( frac(n pi, 2 L) r \) & \( n : "偶数" \))\
E_(n 0) & = frac(planck^2, 2 mu) (frac(n pi, 2 L))^2 $ $n$
が奇数のときは $r arrow.r 0$ で発散する。これより $n$
が偶数のときに限る。
$ R_(n 0) \( r \) & = 1 / r sqrt(2 / L) sin \( frac(n pi, 2 L) r \) #h(2em) \( n : "偶数" \) $
$l eq.not 0$ のとき $k^2 = frac(2 mu E, planck^2)$, $xi = k r$
とおくと $R_(n l) \( r \)$ について球ベッセル微分方程式となる。
$ xi^2 frac(upright(d)^2 R_l, upright(d) xi^2) + 2 xi frac(upright(d) R_l, upright(d) xi) + \( xi^2 - l \( l + 1 \) \) R_l \( xi \) = 0 $
これより境界条件 $xi_(n l)$ を定めて となる。 球ベッセル関数
$j_l \( xi \)$ のゼロ点 $xi_(l \, n)$ におけるエネルギー固有値を
$E_(l \, n)$ とおくと $ R_l \( r \) & = j_l \( xi_(n l) \)\
E_(l n) & = frac(planck^2 xi_(l n)^2, 2 mu L^2) $

== 3次元等方調和振動子
<次元等方調和振動子-1>
#block[
ポテンシャルが次のような 3 次元等方調和振動子のとき
$ V \( r \) = 1 / 2 mu omega^2 r^2 $
半径成分の波動方程式は次のようになる。
$ R_(n l) \( x \) & = x^(l \/ 2) e^(- x \/ 2) S_n^alpha \( x \)\
E & = lambda / 2 planck omega = (2 n + l + 3 / 2) planck omega $

]
$ frac(upright(d)^2, upright(d) r^2) R_l \( r \) + 2 / r frac(upright(d), upright(d) r) R_l \( r \) + frac(2 mu, planck^2) (E - 1 / 2 mu omega^2 r^2 - frac(l \( l + 1 \) planck^2, 2 mu r^2)) R_l \( r \) = 0 $
まず $rho = sqrt(frac(mu omega, planck)) r$ と無次元化する。
$ frac(upright(d)^2, upright(d) rho^2) R_l \( rho \) + 2 / rho frac(upright(d), upright(d) rho) R_l \( rho \) + (lambda + rho^2 - frac(l \( l + 1 \), rho^2)) R_l \( rho \) & = 0 & (lambda = frac(2 E, planck omega)) $
となる。$x = rho^2$ と変数変換すると
$  & x frac(upright(d)^2, upright(d) x^2) R_l \( x \) + 3 / 2 frac(upright(d), upright(d) x) R_l \( x \) + 1 / 4 (lambda + x - frac(l \( l + 1 \), x)) R_l \( x \) = 0 $
となり, 級数展開法より $rho arrow.r oo$ で発散しない為には $n$
を非負整数として $lambda = 4 n + 2 l + 3$ となる。 $rho arrow.r oo$,
$rho arrow.r 0$ のときの漸近解はそれぞれ $e^(- x \/ 2)$, $x^(l \/ 2)$
となるので $R_l \( x \) = x^(l \/ 2) e^(- x \/ 2) S_n^alpha \( x \)$
と分離すると
$ x frac(upright(d)^2, upright(d) x^2) S_n^alpha + \( alpha + 1 - x \) frac(upright(d), upright(d) x) S_n^alpha + n S_n^alpha = 0 $
ソニンの多項式となるので解はラゲールの陪関数を用いて
$L_(n + alpha)^alpha$ と書ける。

== 水素原子
<水素原子>
#block[
$ V \( r \) = - frac(e^2, 4 pi epsilon.alt_0 r) $
固有関数と固有エネルギーは次のようになる。
$ R_(n l) \( rho \) & = (frac(2, n a_0))^(3 \/ 2) sqrt(frac(\( n - l - 1 \) !, 2 n \( \( n + l \) ! \)^3)) rho^l e^(- rho \/ 2) L_(n + l)^(2 l + 1) \( rho \)\
E_n & = - frac(e^2, 8 pi epsilon.alt_0 a_B) 1 / n^2 $

]
$ frac(upright(d)^2, upright(d) r^2) R_l \( r \) + 2 / r frac(upright(d), upright(d) r) R_l \( r \) + frac(2 mu, planck^2) (E + frac(e^2, 4 pi epsilon.alt_0 r) - frac(l \( l + 1 \) planck^2, 2 mu r^2)) R_l \( r \) = 0 $
まず $rho = alpha r$,
$alpha = 2 sqrt(frac(2 mu \| E \|, planck^2))$ と無次元化する。
$ frac(upright(d)^2, upright(d) rho^2) R_l \( rho \) + 2 / rho frac(upright(d), upright(d) rho) R_l \( rho \) + (1 / 4 + lambda / rho - frac(l \( l + 1 \), rho^2)) R_l \( rho \) & = 0 & (lambda = frac(e^2, 8 pi epsilon.alt_0 E) sqrt(frac(2 mu \| E \|, planck^2))) $
$rho arrow.r oo$, $rho arrow.r 0$ のときの漸近解はそれぞれ
$e^(- rho \/ 2)$, $rho^l$ となるので
$R_l \( rho \) = rho^l e^(- rho \/ 2) L \( rho \)$ と分離すると
$ rho frac(upright(d)^2 L, upright(d) rho^2) + \( 2 l + 2 - rho \) frac(upright(d) L, upright(d) rho) + \( lambda - 1 - l \) L = 0 $
となりラゲールの陪多項式となる。ここで級数展開法より $r arrow.r oo$
で発散しない為には非負整数 $n$ を用いて $lambda = n + l + 1$
とかける。これより水素原子のエネルギー準位はボーア半径 $a_B$ を用いて
$ E_n & = - frac(mu e^4, 2 \( 4 pi epsilon.alt_0 \)^2 planck^2) 1 / n^2 = - frac(e^2, 8 pi epsilon.alt_0 a_B) 1 / n^2\
a_B & = frac(4 pi epsilon.alt_0 planck^2, mu e^2) $
とかける。よって規格化条件を加えると
$ R_(n l) \( rho \) = (frac(2, n a_0))^(3 \/ 2) sqrt(frac(\( n - l - 1 \) !, 2 n \( \( n + l \) ! \)^3)) rho^l e^(- rho \/ 2) L_(n + l)^(2 l + 1) \( rho \) $
となり $0 lt.eq l < n$ を満たす。

= ヒルベルト空間
<ヒルベルト空間>
これからは固有関数を状態として抽象化を行う。

#block[
複素内積空間で内積によって誘導される距離関数に関して完備距離空間となるときヒルベルト空間という。

]
#block[
すべての量子状態はヒルベルト空間上のベクトルに対応する。このベクトルをケット
(ket) と呼び、$\|alpha⟩$
と記す。ベクトル空間よりケットの線形性は成り立ち、ケットのスカラー倍は同じ状態を表すと要請する。

ケットの双対としてブラ (bra) をエルミート共役 (Hermitian adjoint)
を用いて次のように定義する。 $ ⟨alpha\| & := \|alpha⟩^dagger\
c_1^(\*) ⟨alpha\| + c_2^(\*) ⟨beta\| & := \( c_1 \|alpha⟩ + c_2 \|beta⟩ \)^dagger\
⟨alpha\| X^dagger & := \( X \|alpha⟩ \)^dagger $ ブラ $⟨beta\|$ とケット
$\|alpha⟩$ との内積 (inner product)
は複素数を返し、$⟨beta mid(bar.v) alpha⟩ in bb(C)$
と記す。ただし交換すると複素共役となり、正値計量の要請を満たすとする。
$ ⟨beta mid(bar.v) alpha⟩ & = ⟨alpha mid(bar.v) beta⟩^(\*)\
⟨alpha mid(bar.v) alpha⟩ & gt.eq 0 $ ケット $\|beta⟩$ とブラ $⟨alpha\|$
との外積 (outer product) は演算子を返し、$\|beta⟩ ⟨alpha\|$ と記す。

]
#block[
演算子 $A$ はケット $\|alpha⟩$ に左から作用して別のケット $A \|alpha⟩$
となる。演算子同士の同値性、和、積を次のように定義される。
$ A = B & arrow.l.r.double forall \|alpha⟩ med A \|alpha⟩ = B \|alpha⟩\
\( A + B \) \|alpha⟩ & := A \|alpha⟩ + B \|alpha⟩\
\( A B \) \|alpha⟩ & := A \( B \|alpha⟩ \) $ 演算子 $A$
に対して固有ケット(eigenkets) と呼ばれる特別なケット $\|a^(\( n \))⟩$
があり、スカラー値 $a^(\( n \)) in bb(C)$
を用いて次のような関係が成り立つ。
$ A \|a^(\( n \))⟩ = a^(\( n \)) \|a^(\( n \))⟩ $
固有ケットに対応する物理的状態を固有状態 (eigenstate) という。

]
観測可能量 (observable) は演算子 (operator) で表される。

#block[
$ ⟨alpha mid(bar.v) alpha⟩ & in bb(R)\
\( X Y \)^dagger & = Y^dagger X^dagger\
\( \|beta⟩ ⟨alpha\| \)^dagger & = \|alpha⟩ ⟨beta\|\
⟨beta\| X \|alpha⟩ & = ⟨alpha\| X^dagger \|beta⟩^(\*) $

]
$⟨alpha mid(bar.v) alpha⟩ = ⟨alpha mid(bar.v) alpha⟩^(\*)$ より
$⟨alpha mid(bar.v) alpha⟩ in bb(R)$ となる。
$ \( X Y \|alpha⟩ \)^dagger & = \( X \( Y \|alpha⟩ \) \)^dagger = \( ⟨alpha\| Y^dagger \) X^dagger = ⟨alpha\| Y^dagger X^dagger\
\( \|beta⟩ ⟨alpha mid(bar.v) gamma⟩ \)^dagger & = ⟨alpha mid(bar.v) gamma⟩^(\*) ⟨beta\| = ⟨gamma mid(bar.v) alpha⟩ ⟨beta\| = ⟨gamma\| \( \|alpha⟩ ⟨beta\| \)\
⟨beta\| X \|alpha⟩ & = ⟨beta\| \( X \|alpha⟩ \) = {\( ⟨alpha\| X^dagger \) \|beta⟩}^(\*) = ⟨alpha\| X^dagger \|beta⟩^(\*) $

#block[
#strong[定理 4] (エルミート演算子の固有ケットの直交性). \

エルミート演算子の固有値は実数であり、異なる固有値を持つ固有ケットは互いに直交する。

]
$ A \|a'⟩ = a' \|a'⟩ & arrow.l.r.double ⟨a''\| A \|a'⟩ = a' ⟨a'' mid(bar.v) a'⟩\
⟨a''\| A = a''^(\*) ⟨a''\| & arrow.l.r.double ⟨a''\| A \|a'⟩ = a''^(\*) ⟨a'' mid(bar.v) a'⟩\
\( a' - a''^(\*) \) ⟨a'' mid(bar.v) a'⟩ & = 0 $ $a' = a''$ かつ
$⟨a' mid(bar.v) a'⟩ eq.not 0$ のとき $a' \, a'' in bb(R)$
である。これより $ \( a' - a'' \) ⟨a'' mid(bar.v) a'⟩ & = 0 $
となる。よって $a' eq.not a''$ のとき $⟨a'' mid(bar.v) a'⟩ = 0$ である。

これよりエルミート演算子の固有ケットは完全系を成す。状態は観測でしか分からないので固有ケットにより全てのケットは生成される。

$ \|alpha⟩ & = sum_(a') c_(a') \|a'⟩\
 & = sum_(a') \|a'⟩ ⟨a' mid(bar.v) alpha⟩ $ これより完備関係式
(completeness relation) と呼ばれる式が成り立つ。
$ sum_(a') \|a'⟩ ⟨a'\| = 1 $

#block[
演算子やブラケットは行列で表現できる。

]
ある演算子の固有ケットによる完備関係式を用いることで演算子とその和積、ブラケット
$\|alpha⟩$, $⟨alpha\|$ は次のように書ける。
$ X & = sum_(a'') sum_(a') \|a''⟩ ⟨a''\| X \|a'⟩ ⟨a'\|\
⟨a''\| \( X + Y \) \|a'⟩ & = ⟨a''\| X \|a'⟩ + ⟨a''\| Y \|a'⟩\
⟨a''\| X Y \|a'⟩ & = sum_(a''') ⟨a''\| X \|a'''⟩ ⟨a'''\| Y \|a'⟩\
⟨a'\| X \|alpha⟩ & = sum_(a'') ⟨a'\| X \|a''⟩ ⟨a'' mid(bar.v) alpha⟩\
⟨alpha\| X \|a'⟩ & = sum_(a'') ⟨alpha mid(bar.v) a''⟩ ⟨a''\| X \|a'⟩ $
これより行列として表現すると次のようになる。
$ X & = mat(delim: "(", ⟨a^(\( 1 \))\| X \|a^(\( 1 \))⟩, ⟨a^(\( 1 \))\| X \|a^(\( 2 \))⟩, dots.h.c; ⟨a^(\( 2 \))\| X \|a^(\( 1 \))⟩, ⟨a^(\( 2 \))\| X \|a^(\( 2 \))⟩, dots.h.c; dots.v, dots.v, dots.down)\
\|alpha⟩ & = vec(⟨a^(\( 1 \)) mid(bar.v) alpha⟩, ⟨a^(\( 2 \)) mid(bar.v) alpha⟩, dots.v) \, #h(2em) ⟨alpha\| = mat(delim: "(", ⟨alpha mid(bar.v) a^(\( 1 \))⟩, ⟨alpha mid(bar.v) a^(\( 2 \))⟩, dots.h.c) $

#block[
$ \|alpha⟩ & = integral upright(d) x' \|x'⟩ ⟨x' mid(bar.v) alpha⟩\
⟨x' mid(bar.v) alpha⟩ & = psi_alpha \( x' \)\
⟨beta mid(bar.v) alpha⟩ & = integral upright(d) x' ⟨beta mid(bar.v) x'⟩ ⟨x' mid(bar.v) alpha⟩\
 & = integral upright(d) x' psi_beta^(\*) \( x' \) psi_alpha \( x' \)\
⟨alpha mid(bar.v) alpha⟩ & = integral upright(d) x' ⟨alpha mid(bar.v) x'⟩ ⟨x' mid(bar.v) alpha⟩\
 & = integral upright(d) x' psi_alpha^(\*) \( x' \) psi_alpha \( x' \)\
 & = 1 $

]
#block[
無限小平行移動演算子
$ frak(J) \( upright(d) bold(r)' \) \|bold(r)'⟩ = \|bold(r)' + upright(d) bold(r)'⟩ $
平行移動生成演算子

]
$ frak(J) \( upright(d) bold(r)' \) \|alpha⟩ = frak(J) \( upright(d) bold(r)' \) integral upright(d) bold(r)' \|bold(r)'⟩ ⟨bold(r)' mid(bar.v) alpha⟩ = integral upright(d) bold(r)' \|bold(r)' + upright(d) bold(r)'⟩ ⟨bold(r)' mid(bar.v) alpha⟩ = integral upright(d) bold(r)' \|bold(r)'⟩ ⟨bold(r)' - upright(d) bold(r)' mid(bar.v) alpha⟩ $

#block[
2 つの演算子 $hat(A)$, $hat(B)$ について交換関係 (commutation relation)
$\[ hat(A) \, hat(B) \]$ と反交換関係 (anticommutation relations)
${ hat(A) \, hat(B) }$ は次のように定義する。
$ [hat(A) \, hat(B)] & = hat(A) hat(B) - hat(B) hat(A)\
{hat(A) \, hat(B)} & = hat(A) hat(B) + hat(B) hat(A) $
$\[ hat(A) \, hat(B) \] = 0$ のとき $hat(A)$ と $hat(B)$
は交換可能であるという。このとき $hat(A)$ の固有状態であり、同時に
$hat(B)$
の固有状態でもある状態を作ることができる。これを同時対角化可能という。

]
#block[
ヤコビ恒等式 $ \[ A \, A \] & = 0\
\[ A \, B \] & = - \[ B \, A \]\
\[ A \, c \] & = 0\
\[ A \, B + C \] & = \[ A \, B \] + \[ A \, C \]\
\[ A \, B C \] & = \[ A \, B \] C + B \[ A \, C \]\
\[ A \, \[ B \, C \] \] & + \[ B \, \[ C \, A \] \] + \[ C \, \[ A \, B \] \] = 0 $

]
$ \[ A \, A \] & = A A - A A = 0\
\[ A \, B \] & = A B - B A = - \[ B \, A \]\
\[ A \, c \] & = A c - c A = 0\
\[ A \, B + C \] & = A \( B + C \) - \( B + C \) A\
 & = \( A B - B A \) + \( A C - C A \)\
 & = \[ A \, B \] + \[ A \, C \]\
\[ A \, B C \] & = A B C - B C A\
 & = \( A B - B A \) C + B \( A C - C A \)\
 & = \[ A \, B \] C + B \[ A \, C \]\
\[ A \, \[ B \, C \] \] + \[ B \, \[ C \, A \] \] & = A \( B C - C B \) - \( B C - C B \) A + B \( C A - A C \) - \( C A - A C \) B\
 & = A B C + C B A - B A C - C A B\
 & = - \[ C \, \[ A \, B \] \] $

== 時間発展のあるシュレーディンガー方程式
<時間発展のあるシュレーディンガー方程式>
$ i planck frac(partial, partial t) \|phi.alt \( t \)⟩ & = hat(H) \|phi.alt \( t \)⟩ $
$hat(H) \|phi.alt_n⟩ = E_n \|phi.alt_n⟩$ としたとき, $\|phi.alt_n⟩$
は完全系をなす。これで展開して代入すると
$ \|phi.alt \( t \)⟩ & = sum_n c_n \( t \) \|phi.alt_n⟩ & (c_n \( t \) = ⟨phi.alt_n mid(bar.v) phi.alt \( t \)⟩)\
i planck frac(upright(d), upright(d) t) c_n \( t \) & = E_n c_n \( t \)\
c_n \( t \) & = c_n \( 0 \) exp \( - i frac(E_n t, planck) \)\
\|phi.alt \( t \)⟩ & = sum_n c_n \( 0 \) exp \( - i frac(E_n t, planck) \) \|phi.alt_n⟩ $
となる。

== ラーモア歳差運動
<ラーモア歳差運動>
$z$ の正方向に一様な磁場 $B$ があり、時刻 $t = 0$
で傾いたスピン状態を考える。
$ \|sigma \( t \)⟩ = exp \[ i frac(mu B, 2 planck) t \] cos theta / 2 \|alpha⟩ + exp \[ - i frac(mu B, 2 planck) t \] sin theta / 2 e^(i delta) \|alpha⟩ $
$ ⟨sigma \( t \)\| hat(s)_x \|sigma \( t \)⟩ & = 1 / 2 sin theta cos \( omega t - delta \)\
⟨sigma \( t \)\| hat(s)_y \|sigma \( t \)⟩ & = - 1 / 2 sin theta sin \( omega t - delta \)\
⟨sigma \( t \)\| hat(s)_z \|sigma \( t \)⟩ & = 1 / 2 cos theta $

= 角運動量代数
<角運動量代数>
これまでの角運動量演算子 $hat(bold(L))$ について
交換関係の性質を満たす代数を考え、そのスピン

== 角運動量代数
<角運動量代数-1>
#block[
$hat(bold(j))$ を無次元の演算子として次の交換関係が成り立つとする。
$ \[ hat(j)_i \, hat(j)_j \] = i epsilon.alt_(i j k) hat(j)_k $
$\[ hat(bold(j))^2 \, hat(j)_z \] = 0$ より $hat(bold(j))^2 \, hat(j)_z$
は固有値 $lambda \, m$ とする同時固有状態 $\|lambda \, m⟩$ を持つ。
上昇演算子 $hat(j)_(+)$ と下降演算子 $hat(j)_(-)$ を次のように定義する。
$ hat(j)_plus.minus & = hat(j)_x plus.minus i hat(j)_y $

]
#block[
$ \[ hat(bold(j))^2 \, hat(j)_z \] = 0 \, #h(2em) \[ hat(j)_(+) \, hat(j)_(-) \] = 2 hat(j)_z \, #h(2em) \[ hat(j)_z \, hat(j)_plus.minus \] = plus.minus hat(j)_plus.minus \, #h(2em) \[ hat(bold(j))^2 \, hat(j)_plus.minus \] = 0\
hat(bold(j))^2 = 1 / 2 \( hat(j)_(+) hat(j)_(-) + hat(j)_(-) hat(j)_(+) \) + hat(j)_z^2 = hat(j)_(-) hat(j)_(+) + hat(j)_z + hat(j)_z^2 = hat(j)_(+) hat(j)_(-) - hat(j)_z + hat(j)_z^2 $

]
$ \[ hat(bold(j))^2 \, hat(j)_z \] & = hat(j)_i \[ hat(j)_i \, hat(j)_z \] + \[ hat(j)_i \, hat(j)_z \] hat(j)_i = i epsilon.alt_(i z k) hat(j)_i hat(j)_k + i epsilon.alt_(i z k) hat(j)_k hat(j)_i = 0\
\[ hat(j)_(+) \, hat(j)_(-) \] & = \[ hat(j)_x + i hat(j)_y \, hat(j)_x - i hat(j)_y \] = \[ hat(j)_x \, hat(j)_x \] - i \[ hat(j)_x \, hat(j)_y \] + i \[ hat(j)_y \, hat(j)_x \] + \[ hat(j)_y \, hat(j)_y \] = 2 hat(j)_z\
\[ hat(j)_z \, hat(j)_plus.minus \] & = \[ hat(j)_z \, hat(j)_x plus.minus i hat(j)_y \] = \[ hat(j)_z \, hat(j)_x \] plus.minus i \[ hat(j)_z \, hat(j)_y \] = i hat(j)_y plus.minus hat(j)_x = plus.minus hat(j)_plus.minus\
\[ hat(bold(j))^2 \, hat(j)_plus.minus \] & = \[ hat(bold(j))^2 \, hat(j)_x plus.minus i hat(j)_y \] = \[ hat(bold(j))^2 \, hat(j)_x \] plus.minus i \[ hat(bold(j))^2 \, hat(j)_y \] = 0\
hat(bold(j))^2 & = 1 / 2 \( hat(j)_(+) hat(j)_(-) + hat(j)_(-) hat(j)_(+) \) + hat(j)_z^2 = hat(j)_(-) hat(j)_(+) + hat(j)_z + hat(j)_z^2 = hat(j)_(+) hat(j)_(-) - hat(j)_z + hat(j)_z^2 $

#block[
上昇演算子 $hat(j)_(+)$ を演算させると $hat(j)_z$ の固有値は 1
つ上昇し、下降演算子 $hat(j)_(-)$ を演算させると $hat(j)_z$ の固有値が 1
つ下降する。
$ hat(j)_plus.minus \|lambda \, m⟩ = sqrt(\( j minus.plus m \) \( j plus.minus m + 1 \)) \|lambda \, m plus.minus 1⟩ $

]
このとき上昇、下降演算子を作用させたとき
$ hat(bold(j))^2 \( hat(j)_plus.minus \|lambda \, m⟩ \) & = hat(j)_plus.minus hat(bold(j))^2 \|lambda \, m⟩ = lambda \( hat(j)_plus.minus \|lambda \, m⟩ \)\
hat(j)_z \( hat(j)_plus.minus \|lambda \, m⟩ \) & = \( hat(j)_plus.minus hat(j)_z plus.minus hat(j)_plus.minus \) \|lambda \, m⟩ = \( m plus.minus 1 \) \( hat(j)_plus.minus \|lambda \, m⟩ \) $
より $hat(j)_plus.minus \|lambda \, m⟩ = c \|lambda \, m plus.minus 1⟩$
とかける。
$ \| c \|^2 & = ⟨lambda \, m\| \( hat(j)_plus.minus \)^dagger hat(j)_plus.minus \|lambda \, m⟩\
 & = ⟨lambda \, m\| hat(j)_minus.plus hat(j)_plus.minus \|lambda \, m⟩\
 & = ⟨lambda \, m\| hat(bold(j))^2 - hat(j)_z^2 minus.plus hat(j)_z \|lambda \, m⟩\
 & = j \( j + 1 \) - m^2 minus.plus m $ よって
$\| c \| = sqrt(\( j minus.plus m \) \( j plus.minus m + 1 \))$ となる。
$ hat(j)_plus.minus \|lambda \, m⟩ = sqrt(\( j minus.plus m \) \( j plus.minus m + 1 \)) \|lambda \, m plus.minus 1⟩ $

#block[
$hat(j)_z$ の固有値 $m$ は非負の整数または半整数 $j$ を用いて
$m = - j \, - j + 1 \, dots.h \, j - 1 \, j$ と書ける。

]
$ hat(bold(j))^2 & = hat(j)_x^2 + hat(j)_y^2 + hat(j)_z^2 = hat(j)_(-) hat(j)_(+) + hat(j)_z + hat(j)_z^2 = hat(j)_(+) hat(j)_(-) - hat(j)_z + hat(j)_z^2 $
より次のような関係式が成り立つ。
$ ⟨lambda \, m\| hat(bold(j))^2 \|lambda \, m⟩ & = ⟨lambda \, m\| lambda \|lambda \, m⟩ = lambda\
 & = ⟨lambda \, m\| hat(j)_x^2 + hat(j)_y^2 + hat(j)_z^2 \|lambda \, m⟩ = ⟨lambda \, m\| hat(j)_x^2 + hat(j)_y^2 \|lambda \, m⟩ + m^2\
 & = ⟨lambda \, m\| hat(j)_(-) hat(j)_(+) + hat(j)_z^2 + hat(j)_z \|lambda \, m⟩ = ⟨lambda \, m\| hat(j)_(-) hat(j)_(+) \|lambda \, m⟩ + m \( m + 1 \)\
 & = ⟨lambda \, m\| hat(j)_(+) hat(j)_(-) + hat(j)_z^2 - hat(j)_z \|lambda \, m⟩ = ⟨lambda \, m\| hat(j)_(+) hat(j)_(-) \|lambda \, m⟩ + m \( m - 1 \) $<j2-lambda>
まず式 #link(<j2-lambda>)[j2-lambda] と #link(<j2-m2>)[j2-m2] について $hat(j)_x \, hat(j)_y$
はエルミート演算子であるから
$⟨lambda \, m\| hat(j)_x^2 \|lambda \, m⟩ gt.eq 0$,
$⟨lambda \, m\| hat(j)_y^2 \|lambda \, m⟩ gt.eq 0$ より
$0 lt.eq m^2 lt.eq lambda$ となる。 これより $m$ の上限値 $j$ とおくと式
#link(label("j2-m2-+-m"))[j2-m2-+-m] と #link(<j2-lambda>)[j2-lambda] より $lambda = j \( j + 1 \)$
となり、下限値 $j - n$ とおくと式 #link(<j2-m2---m>)[j2-m2---m] と #link(<j2-lambda>)[j2-lambda] より
$lambda = \( j - n \) \( j - n - 1 \)$ となる。 これら 2 つの式を用いて
$j$ を求める。 $ {lambda = j \( j + 1 \)\
lambda = \( j - n \) \( j - n - 1 \) arrow.l.r.double {lambda = j \( j + 1 \)\
j = n / 2 $ よって $j$
は非負の整数または半整数であり、$m = - j \, - j + 1 \, dots.h \, j - 1 \, j$
と書ける。

そこで $\|lambda \, m⟩$ を $\|j \, m⟩$ と書くことにすると
$ hat(bold(j))^2 \|j \, m⟩ & = j \( j + 1 \) \|j \, m⟩\
hat(j)_z \|j \, m⟩ & = m \|j \, m⟩\
hat(j)_plus.minus \|j \, m⟩ & = \|lambda \, m plus.minus 1⟩ = sqrt(\( j minus.plus m \) \( j plus.minus m + 1 \)) \|j \, m plus.minus 1⟩ $
となる。

#block[
角運動量代数まとめ $hat(bold(j))^2 \, hat(j)_z$ には同時固有状態
$\|j \, m⟩$ があり、それらの固有値は非負の整数または半整数 $j$
を用いてそれぞれ
$j \( j + 1 \) \, m = - j \, - j + 1 \, dots.h \, j - 1 \, j$
と書ける。昇降演算子
$hat(j)_plus.minus = hat(j)_x plus.minus i hat(j)_y$ を作用させると $m$
を昇降させることができる。
$ hat(j)_plus.minus \|j \, m⟩ & = sqrt(\( j minus.plus m \) \( j plus.minus m + 1 \)) \|j \, m plus.minus 1⟩ $

]
#block[
$j = 1 \/ 2$ のとき同時固有状態は次の 2 状態がある。
$ \|arrow.t⟩ = \|1 / 2 \, + 1 / 2⟩ \, #h(2em) \|arrow.b⟩ = \|1 / 2 \, - 1 / 2⟩ $
それぞれの固有状態は $hat(j)_z$ に対して固有値 $+ 1 \/ 2 \, - 1 \/ 2$
を持ち、$hat(bold(j))^2$ に対して固有値 $3 \/ 4$
を持つ。そして昇降演算子を用いると固有状態は互いに入れ替わる。
$ hat(j)_(+) \|arrow.t⟩ = 0 \, #h(2em) hat(j)_(+) \|arrow.b⟩ = \|arrow.t⟩ \, #h(2em) hat(j)_(-) \|arrow.t⟩ = \|arrow.b⟩ \, #h(2em) hat(j)_(-) \|arrow.b⟩ = 0 $

]
#block[
$j = 1$ のとき同時固有状態は次の 3 状態がある。
$ \|1 \, + 1⟩ \, #h(2em) \|1 \, 0⟩ \, #h(2em) \|1 \, - 1⟩ $
それぞれの固有状態は $hat(j)_z$ に対して固有値 $+ 1 \, 0 \, - 1$
を持ち、$hat(bold(j))^2$ に対して固有値 $2$
を持つ。そして昇降演算子を用いると固有状態は互いに入れ替わる。
$ hat(j)_(+) \|1 \, + 1⟩ & = 0 \, & hat(j)_(+) \|1 \, 0⟩ & = sqrt(2) \|1 \, + 1⟩ \, #h(2em) & hat(j)_(+) \|1 \, - 1⟩ & = sqrt(2) \|1 \, 0⟩\
hat(j)_(-) \|1 \, + 1⟩ & = sqrt(2) \|1 \, 0⟩ \, quad & hat(j)_(-) \|1 \, 0⟩ & = sqrt(2) \|1 \, - 1⟩ \, & hat(j)_(-) \|1 \, - 1⟩ & = 0 $

]
#block[
角運動量の合成とは合成系の角運動量固有状態を部分系の角運動量固有状態で表すことである。部分系の角運動量演算子
$hat(bold(j))_1 \, hat(bold(j))_2$
は角運動量代数を満たし、可換となる。それらの和で合成系の角運動量演算子
$hat(bold(j))$ が与えられる。
$ hat(bold(j)) & = hat(bold(j))_1 + hat(bold(j))_2 $
部分系の同時固有状態 $\|j_1 \, m_1⟩ \, \|j_2 \, m_2⟩$ を合わせた状態
$\|j_1 \, m_1⟩ \|j_2 \, m_2⟩$ は完全系を成す。これより合成系の状態
$\|j \, m⟩ chevron.r$ は部分系を合わせた状態の線形結合で表される。
$ \|j \, m⟩ chevron.r & = sum_(m_1 \, m_2) C_(j_1 m_1 j_2 m_2)^(j m) \|j_1 \, m_1⟩ \|j_2 \, m_2⟩ $
係数 $C_(j_1 m_1 j_2 m_2)^(j m)$ はクレブシュ・ゴルダン (Clebsch-Gordan)
係数と呼ばれる。

]
#block[
#strong[定理 5] (). \

合成系の角運動量演算子は角運動量代数を満たす。

]
まず合成系の交換関係について調べる。 $hat(bold(j))_1 \, hat(bold(j))_2$
が可換であることから
$ \[ hat(j)_(a \, i) \, hat(j)_(b \, j) \] & = i delta_(a b) epsilon.alt_(i j k) hat(j)_(a \, k) $
となる。これより角運動量代数の交換関係を満たす。
$ \[ hat(j)_i \, hat(j)_j \] & = \[ hat(j)_(1 \, i) + hat(j)_(2 \, i) \, hat(j)_(1 \, j) + hat(j)_(2 \, j) \] = i epsilon.alt_(i j k) hat(j)_(1 \, k) + i epsilon.alt_(i j k) hat(j)_(2 \, k) = i epsilon.alt_(i j k) hat(j)_k\
\[ hat(bold(j))^2 \, hat(j)_i \] & = hat(j)_j \[ hat(j)_j \, hat(j)_i \] + \[ hat(j)_j \, hat(j)_i \] hat(j)_j = - i epsilon.alt_(i j k) \( hat(j)_j hat(j)_k + hat(j)_k hat(j)_j \) = 0 $
$hat(bold(j))^2 \, hat(j)_z$
が可換であるから同様に議論することにより固有値 $j \( j + 1 \) \, m$
を持つ同時固有状態 $\|j \, m⟩ chevron.r$ がある。
$ hat(j)_z \|j \, m⟩ chevron.r & = \( j_(1 \, z) + j_(2 \, z) \) sum_(m_1 \, m_2) C_(j_1 m_1 j_2 m_2)^(j m) \|j_1 \, m_1⟩ \|j_2 \, m_2⟩\
 & = sum_(m_1 \, m_2) C_(j_1 m_1 j_2 m_2)^(j m) \( m_1 + m_2 \) \|j_1 \, m_1⟩ \|j_2 \, m_2⟩\
m \|j \, m⟩ chevron.r & = sum_(m_1 \, m_2) C_(j_1 m_1 j_2 m_2)^(j m) m \|j_1 \, m_1⟩ \|j_2 \, m_2⟩ $
これより $C_(j_1 m_1 j_2 m_2)^(j m) = 0 \, m_1 + m_2 eq.not m$
となる。これより $m_max = j_1 + j_2$ であるから $j_max = j_1 + j_2$
である。$j$ が取り得る値が $j_1 + j_2$
のみであると考えると部分系の固有状態数の積
$\( 2 j_1 + 1 \) \( 2 j_2 + 1 \)$ に対して全体系の固有状態数
$2 \( j_1 + j_2 \) + 1$ より次元が足りない。取り得る $j$ の最小値を
$j_min = \| j_1 - j_2 \|$
とすることで部分系の直積と全体系の次元が釣り合う。
$ sum_(j = j_min)^(j_max) \( 2 j + 1 \) = \( 2 j_1 + 1 \) \( 2 j_2 + 1 \) $

$ hat(j)_plus.minus \|j \, m⟩ chevron.r & = sqrt(\( j minus.plus m \) \( j plus.minus m + 1 \)) \|j \, m plus.minus 1⟩ chevron.r $

#block[
$j_1 = 1 \/ 2 \, j_2 = 1 \/ 2$ のとき同時固有状態は次のようになる。
$ \|1 \, + 1⟩ chevron.r & = \|arrow.t arrow.t⟩\
\|1 \, 0⟩ chevron.r & = 1 / sqrt(2) (\|arrow.t arrow.b⟩ + \|arrow.b arrow.t⟩)\
\|1 \, - 1⟩ chevron.r & = \|arrow.b arrow.b⟩\
\|0 \, 0⟩ chevron.r & = 1 / sqrt(2) (\|arrow.t arrow.b⟩ - \|arrow.b arrow.t⟩) $

]
$ \|1 \, 0⟩ chevron.r & = 1 / sqrt(2) j_(-) \|1 \, 1⟩ chevron.r = 1 / sqrt(2) (\|arrow.t arrow.b⟩ + \|arrow.b arrow.t⟩) $
$ \|0 \, 0⟩ chevron.r & = 1 / sqrt(2) (\|arrow.t arrow.b⟩ - \|arrow.b arrow.t⟩) $

#block[
$j_1 = 1 \, j_2 = 1 \/ 2$ のとき同時固有状態は次のようになる。
$ \|3 / 2 \, + 3 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = \|1 \, + 1⟩ \|1 / 2 \, + 1 / 2⟩\
\|3 / 2 \, + 1 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = sqrt(1 / 3) \|1 \, + 1⟩ \|1 / 2 \, - 1 / 2⟩ + sqrt(2 / 3) \|1 \, 0⟩ \|1 / 2 \, + 1 / 2⟩\
\|3 / 2 \, - 1 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = sqrt(1 / 3) \|1 \, - 1⟩ \|1 / 2 \, + 1 / 2⟩ + sqrt(2 / 3) \|1 \, 0⟩ \|1 / 2 \, - 1 / 2⟩\
\|3 / 2 \, - 3 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = \|1 \, - 1⟩ \|1 / 2 \, - 1 / 2⟩\
\|1 / 2 \, + 1 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = sqrt(2 / 3) \|1 \, + 1⟩ \|1 / 2 \, - 1 / 2⟩ - sqrt(1 / 3) \|1 \, 0⟩ \|1 / 2 \, + 1 / 2⟩\
\|1 / 2 \, - 1 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = sqrt(2 / 3) \|1 \, - 1⟩ \|1 / 2 \, + 1 / 2⟩ - sqrt(1 / 3) \|1 \, 0⟩ \|1 / 2 \, - 1 / 2⟩ $

]
$ \|3 / 2 \, + 1 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = hat(j)_(-) / sqrt(3) \|3 / 2 \, + 3 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] = sqrt(2 / 3) \|1 \, + 1⟩ \|1 / 2 \, - 1 / 2⟩ + sqrt(1 / 3) \|1 \, 0⟩ \|1 / 2 \, + 1 / 2⟩\
\|3 / 2 \, - 1 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] & = hat(j)_(+) / sqrt(3) \|3 / 2 \, - 3 / 2⟩ #scale(x: 240%, y: 240%)[chevron.r] = sqrt(1 / 3) \|1 \, - 1⟩ \|1 / 2 \, + 1 / 2⟩ + sqrt(2 / 3) \|1 \, 0⟩ \|1 / 2 \, - 1 / 2⟩ $

== スピン
<スピン>
量子力学的粒子にはスピンという内部自由度がある。

#block[
軌道角運動量演算子
$hat(bold(L)) = hat(bold(r)) times hat(bold(p)) = planck hat(bold(l))$
とスピン角運動量演算子 $hat(bold(S)) = S_z hat(bold(s))$
についてそれぞれの無次元量 $hat(bold(l)) \, hat(bold(s))$
は角運動量代数の性質を満たす。 またスピン角運動量 $hat(bold(S))$ は位置
$hat(bold(r))$、運動量 $hat(bold(p))$、軌道角運動量 $hat(bold(L))$
と交換する。
$ \[ hat(bold(r)) \, hat(bold(S)) \] = 0 \, #h(2em) \[ hat(bold(p)) \, hat(bold(S)) \] = 0 \, #h(2em) \[ hat(bold(L)) \, hat(bold(S)) \] = 0 $
これらの軌道角運動量 $hat(bold(L))$ とスピン角運動量 $hat(bold(S))$
の和を全角運動量 $hat(bold(J)) = hat(bold(L)) + hat(bold(S))$ という。

]
角運動量演算子の固有値は整数だけであったが、スピン角運動量演算子は半整数と成り得る。

#block[
$ \[ hat(bold(s))^2 \, hat(s)_z \] & = 0 \, #h(2em) \[ hat(s)_(+) \, hat(s)_(-) \] = 2 hat(s)_z \, #h(2em) \[ hat(s)_z \, hat(s)_plus.minus \] = plus.minus hat(s)_plus.minus \, #h(2em) \[ hat(bold(s))^2 \, hat(s)_plus.minus \] = 0\
hat(bold(s))^2 & = 1 / 2 \( hat(s)_(+) hat(s)_(-) + hat(s)_(-) hat(s)_(+) \) + hat(s)_z^2 = hat(s)_(-) hat(s)_(+) + hat(s)_z + hat(s)_z^2 = hat(s)_(+) hat(s)_(-) - hat(s)_z + hat(s)_z^2 $

]
#block[
スピン $s = 1 \/ 2$ では $hat(s)_z$ の固有状態が 2
つあり、それぞれ固有値 $m_s = plus.minus 1 \/ 2$ を持つ $\|arrow.t⟩$,
$\|arrow.b⟩$ とおく。
$ hat(s)_z \|arrow.t⟩ = 1 / 2 \|arrow.t⟩ \, #h(2em) hat(s)_z \|arrow.b⟩ = - 1 / 2 \|arrow.b⟩ \, #h(2em) hat(bold(s))^2 \|arrow.t⟩ = 3 / 4 \|arrow.t⟩ \, #h(2em) hat(bold(s))^2 \|arrow.b⟩ = 3 / 4 \|arrow.b⟩ $
スピン昇降演算子を用いると固有状態は互いに入れ替わる。
$ hat(s)_(+) \|arrow.t⟩ = 0 \, #h(2em) hat(s)_(+) \|arrow.b⟩ = \|arrow.t⟩ \, #h(2em) hat(s)_(-) \|arrow.t⟩ = \|arrow.b⟩ \, #h(2em) hat(s)_(-) \|arrow.b⟩ = 0 $

]
#block[
$ sigma_1 = mat(delim: "(", 0, 1; 1, 0) \, #h(2em) sigma_2 = mat(delim: "(", 0, - i; i, 0) \, #h(2em) sigma_3 = mat(delim: "(", 1, 0; 0, - 1) $

]
#block[
エルミート性を満たす。 $ sigma_i^dagger & = sigma_i\
sigma_i sigma_j & = delta_(i j) I + i epsilon_(i j k) sigma_k\
\[ sigma_i \, sigma_j \] & = 2 i epsilon_(i j k) sigma_k\
{sigma_i \, sigma_j} & = 2 delta_(i j) I $

]
1, 2 は調べることで成り立つ。
$ \[ sigma_i \, sigma_j \] & = sigma_i sigma_j - sigma_j sigma_i = \( delta_(i j) I + i epsilon_(i j k) sigma_k \) - \( delta_(j i) I + i epsilon_(j i k) sigma_k \) = 2 i epsilon_(i j k) sigma_k\
{sigma_i \, sigma_j} & = sigma_i sigma_j + sigma_j sigma_i = \( delta_(i j) I + i epsilon_(i j k) sigma_k \) + \( delta_(j i) I + i epsilon_(j i k) sigma_k \) = 2 delta_(i j) I $

#block[
#strong[定理 6] (). \

$s = 1 \/ 2$ における $hat(s)_z$ の固有状態 $\|arrow.t⟩ \, \|arrow.b⟩$
についてスピンとスピン演算子を行列表現すると次のようになる。
$  & \|arrow.t⟩ = vec(1, 0) \, #h(2em) \|arrow.b⟩ = vec(0, 1)\
 & hat(s)_i = 1 / 2 sigma_i \, quad hat(s)_(+) = mat(delim: "(", 0, 1; 0, 0) \, quad hat(s)_(-) = mat(delim: "(", 0, 0; 1, 0) \, quad hat(bold(s))^2 = 3 / 4 mat(delim: "(", 1, 0; 0, 1) $

]
#block[
完全系を貼るので任意の状態 $\|sigma⟩$ はその線形結合で書ける。
$ \|sigma⟩ & = c_1 \|arrow.t⟩ + c_2 \|arrow.b⟩ $

]
= 電磁場中の荷電粒子
<電磁場中の荷電粒子>
$ hat(H) arrow.r hat(H) - e phi.alt \( hat(bold(r)) \, t \) \, #h(2em) hat(bold(p)) arrow.r hat(bold(p)) - e bold(A) \( hat(bold(r)) \, t \) $

= 摂動論
<摂動論>
摂動論、変分法、WKB 法
近似法の一種。有限和で止めるとユニタリティはなくなる。重ね合わせの原理を満たさない。

#block[
ハミルトニアンを主要項である非摂動ハミルトニアン $hat(H)_0$
と影響の小さい摂動ハミルトニアン $hat(V)$ に分ける。パラメータ $lambda$
を用いて $hat(H) = hat(H)_0 + lambda hat(V)$ とし、次のように展開する。
$ hat(H) \|phi.alt_n⟩ & = E_n \|phi.alt_n⟩\
hat(H)_0 \|phi.alt_n^(\( 0 \))⟩ & = E_n^(\( 0 \)) \|phi.alt_n^(\( 0 \))⟩\
E_n & = E_n^(\( 0 \)) + lambda E_n^(\( 1 \)) + lambda^2 E_n^(\( 2 \)) + dots.h.c\
\|phi.alt_n⟩ & = \|phi.alt_n^(\( 0 \))⟩ + lambda \|phi.alt_n^(\( 1 \))⟩ + lambda^2 \|phi.alt_n^(\( 2 \))⟩ + dots.h.c $

]
#block[
1 次, 2 次の固有値 $E_n^(\( 1 \)) \, E_n^(\( 2 \))$ と固有状態
$\|phi.alt_n^(\( 1 \))⟩ \, \|phi.alt_n^(\( 2 \))⟩$ は定数
$c_n^(\( 1 \)) \, c_n^(\( 2 \))$ を用いて次のようになる。
$ E_n^(\( 1 \)) & = ⟨phi.alt_n^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩\
\|phi.alt_n^(\( 1 \))⟩ & = sum_(m eq.not n) frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, E_n^(\( 0 \)) - E_m^(\( 0 \))) \|phi.alt_m^(\( 0 \))⟩ + c_n^(\( 1 \)) \|phi.alt_n^(\( 0 \))⟩\
E_n^(\( 2 \)) & = sum_(m eq.not n) frac(lr(|⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩|)^2, E_n^(\( 0 \)) - E_m^(\( 0 \)))\
\|phi.alt_n^(\( 2 \))⟩ & = c_n^(\( 1 \)) sum_(m eq.not n) (frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, E_n^(\( 0 \)) - E_m^(\( 0 \))) - E_n^(\( 1 \)) frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, (E_n^(\( 0 \)) - E_m^(\( 0 \)))^2) + sum_(k eq.not n) frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_k^(\( 0 \))⟩ ⟨phi.alt_k^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, (E_n^(\( 0 \)) - E_m^(\( 0 \))) (E_n^(\( 0 \)) - E_k^(\( 0 \))))) \|phi.alt_m^(\( 0 \))⟩ + c_n^(\( 2 \)) \|phi.alt_n^(\( 0 \))⟩ $

]
$  & \( hat(H) - E_n \) \|phi.alt_n⟩ = 0\
 & = ((hat(H)_0 + lambda V) - (sum_(i = 0)^oo lambda^i E_n^(\( i \)))) (sum_(i = 0)^oo lambda^i \|phi.alt_n^(\( i \))⟩)\
 & = sum_(i = 0)^oo lambda^i (sum_(j + k = i) (delta_(0 j) H_0 + delta_(1 j) V - E_n^(\( j \))) \|phi.alt_n^(\( k \))⟩) $
これより各 $lambda$ の次数について比較して次のようになる。
$ sum_(j + k = i) (delta_(0 j) H_0 + delta_(1 j) V - E_n^(\( j \))) \|phi.alt_n^(\( k \))⟩ = 0 $
ここでは 0, 1, 2 次についてのみ考える。
$ {(E_n^(\( 0 \)) - H_0) \|phi.alt_n^(\( 0 \))⟩ = 0\
(E_n^(\( 0 \)) - H_0) \|phi.alt_n^(\( 1 \))⟩ = (V - E_n^(\( 1 \))) \|phi.alt_n^(\( 0 \))⟩\
(E_n^(\( 0 \)) - H_0) \|phi.alt_n^(\( 2 \))⟩ = (V - E_n^(\( 1 \))) \|phi.alt_n^(\( 1 \))⟩ - E_n^(\( 2 \)) \|phi.alt_n^(\( 0 \))⟩ $<perturbation>
まず 0 次については次のように書ける。
$ H_0 \|phi.alt_n^(\( 0 \))⟩ = E_n^(\( 0 \)) \|phi.alt_n^(\( 0 \))⟩ $ 式
#link(<perturbation>)[perturbation] に $⟨phi.alt_m^(\( 0 \))\|$ を掛けると
$  & {⟨phi.alt_m^(\( 0 \))\| (E_n^(\( 0 \)) - H_0) \|phi.alt_n^(\( 1 \))⟩ = ⟨phi.alt_m^(\( 0 \))\| (V - E_n^(\( 1 \))) \|phi.alt_n^(\( 0 \))⟩\
⟨phi.alt_m^(\( 0 \))\| (E_n^(\( 0 \)) - H_0) \|phi.alt_n^(\( 2 \))⟩ = ⟨phi.alt_m^(\( 0 \))\| (V - E_n^(\( 1 \))) \|phi.alt_n^(\( 1 \))⟩ - ⟨phi.alt_m^(\( 0 \))\| E_n^(\( 2 \)) \|phi.alt_n^(\( 0 \))⟩\
arrow.l.r.double & {(E_n^(\( 0 \)) - E_m^(\( 0 \))) ⟨phi.alt_m^(\( 0 \)) mid(bar.v) phi.alt_n^(\( 1 \))⟩ = ⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩ - E_n^(\( 1 \)) delta_(m n)\
(E_n^(\( 0 \)) - E_m^(\( 0 \))) ⟨phi.alt_m^(\( 0 \)) mid(bar.v) phi.alt_n^(\( 2 \))⟩ = ⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 1 \))⟩ - E_n^(\( 1 \)) ⟨phi.alt_m^(\( 0 \)) mid(bar.v) phi.alt_n^(\( 1 \))⟩ - E_n^(\( 2 \)) delta_(m n) $
よって 1 次, 2 次の固有値 $E_n^(\( 1 \)) \, E_n^(\( 2 \))$ と固有状態
$\|phi.alt_n^(\( 1 \))⟩ \, \|phi.alt_n^(\( 2 \))⟩$ は定数
$c_n^(\( 1 \)) \, c_n^(\( 2 \))$ を用いて次のようになる。
$ E_n^(\( 1 \)) & = ⟨phi.alt_n^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩\
\|phi.alt_n^(\( 1 \))⟩ & = sum_(m eq.not n) frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, E_n^(\( 0 \)) - E_m^(\( 0 \))) \|phi.alt_m^(\( 0 \))⟩ + c_n^(\( 1 \)) \|phi.alt_n^(\( 0 \))⟩\
E_n^(\( 2 \)) & = sum_(m eq.not n) frac(lr(|⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩|)^2, E_n^(\( 0 \)) - E_m^(\( 0 \)))\
\|phi.alt_n^(\( 2 \))⟩ & = c_n^(\( 1 \)) sum_(m eq.not n) (frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, E_n^(\( 0 \)) - E_m^(\( 0 \))) - E_n^(\( 1 \)) frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, (E_n^(\( 0 \)) - E_m^(\( 0 \)))^2) + sum_(k eq.not n) frac(⟨phi.alt_m^(\( 0 \))\| V \|phi.alt_k^(\( 0 \))⟩ ⟨phi.alt_k^(\( 0 \))\| V \|phi.alt_n^(\( 0 \))⟩, (E_n^(\( 0 \)) - E_m^(\( 0 \))) (E_n^(\( 0 \)) - E_k^(\( 0 \))))) \|phi.alt_m^(\( 0 \))⟩ + c_n^(\( 2 \)) \|phi.alt_n^(\( 0 \))⟩ $

#block[
1 次元調和振動子
$hat(H)_0 = frac(hat(p)^2, 2 m) + 1 / 2 m omega^2 hat(x)^2$ に摂動
$hat(V) = alpha hat(x)^2$ を加える。

]
= 散乱
<散乱>
== 反射と透過
<反射と透過>
左右から入射する $psi_R \, psi_L$ について
$ psi_R \( x \) & = cases(delim: "{", e^(i k x) + r e^(- i k x) & \( x arrow.r - oo \), t e^(i k x) & \( x arrow.r + oo \), )\
psi_L \( x \) & = cases(delim: "{", t' e^(- i k x) & \( x arrow.r - oo \), e^(- i k x) + r' e^(i k x) & \( x arrow.r + oo \), )\
psi_R^(\*) \( x \) - r^(\*) psi_R \( x \) & = cases(delim: "{", \( 1 - \| r \|^2 \) e^(- i k x) & \( x arrow.r - oo \), t^(\*) e^(- i k x) - r^(\*) t e^(i k x) & \( x arrow.r + oo \), ) $
$ J \( x \) & = - i frac(planck, 2 m) (psi^(\*) frac(upright(d) psi, upright(d) x) - psi frac(upright(d) psi^(\*), upright(d) x))\
frac(upright(d) J, upright(d) x) & = - i frac(planck, 2 m) (psi^(\*) frac(upright(d) psi, upright(d) x) - psi frac(upright(d) psi^(\*), upright(d) x)) $
$ t' & = frac(1 - \| r \|^2, t^(\*))\
r' & = - frac(r^(\*) t, t^(\*)) $


// 変換時に定義が失われた参照先。リンクを生かすための錨。
#metadata(none)#label("j2-m2-+-m")
#metadata(none)<j2-m2>
#metadata(none)<j2-m2---m>
