#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "プラズマ物理学",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/plasma_physics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= プラズマ
<プラズマ>
プラズマとは高エネルギー状態で励起・電離し、陽イオンと電子が熱運動している状態のこと。

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([種類], [質量], [電荷], [力],),
    table.hline(),
    [陽イオン], [$M approx 1800 m$], [$Z_sigma e$], [],
    [電子], [$m = 511$ keV], [$- e$], [],
  )]
  , caption: []
  , kind: table
  )

] <table:particles>
$ alpha_sigma = n_sigma / N_sigma $

== 散乱断面積
<散乱断面積>
$ D = r_1 + r_2 $ $ sigma \( chi \) = D^2 / 4 $
$ sigma \( chi \) = lr(|frac(b, sin b) frac(upright(d) b, upright(d) chi)|) $
$ Q = integral W \( chi \) sigma \( chi \) thin upright(d) Omega = integral_0^pi W \( chi \) sigma \( chi \) 2 pi sin chi thin upright(d) chi $

$ {F_r = m \( dot.double(r) - r dot(theta)^2 \) = frac(q_0 q, r^2)\
F_theta = 1 / r frac(upright(d), upright(d) t) \( m r^2 dot(theta) \) = 0 $
これらをエネルギー積分することで保存量を見出すことができる。
$  & frac(upright(d), upright(d) t) \( m r^2 dot(theta) \) = frac(upright(d), upright(d) t) L = 0\
 & m dot(r) \( dot.double(r) - r dot(theta)^2 \) - frac(q_0 q, r^2) dot(r) = m dot(r) dot.double(r) - frac(L^2, m r^3) dot(r) - frac(q_0 q, r^2) dot(r) = frac(upright(d), upright(d) t) (1 / 2 m dot(r)^2 + frac(L^2, 2 m r^2) + frac(q_0 q, r)) = 0 $
これより初期状態において速度 $v_0$, $r arrow.r oo$ に対して最近接距離
$r_min$ のとき $dot(r) = 0$ となるから次のように求まる。
$ 1 / 2 m v_0^2 & = frac(L_0^2, 2 m r_min^2) + frac(q_0 q, r_min) \, #h(2em) L_0 = m v_0 b\
r_min^2 & - frac(2 q_0 q, m v_0^2) r_min - b^2 = 0\
r_min & = frac(q_0 q, m v_0^2) + sqrt((frac(q_0 q, m v_0^2))^2 + b^2) $

次の関係式が成り立つ。 $ tan chi / 2 & = frac(q_0 q, b m v_0^2)\
3 / 2 k_B T & = 1 / 2 m v_0^2 $ これを課題 1
の式に代入することで次のような関係式が成り立つ。
$ r_min & = frac(q_0 q, m v_0^2) \( 1 + sqrt(1 + tan^2 chi / 2) \) $
散乱角を $chi lt.double 1$ とすると $n tilde.op 10^20$ m#super[−3] 温度
$T tilde.op 10$ keV より
$ r_min = frac(q_0 q, 2 m v_0^2) = frac(q_0 q, 2 k_B T) = 5.0 times 10^(- 5) m $

== Maxwell-Boltzmann 分布
<maxwell-boltzmann-分布>
統計力学より速度分布関数は熱平衡状態を特徴付ける系の熱速度
$v_t = sqrt(k_B T \/ m)$ を用いて次のように書ける。
$ f \( bold(v) \) & = n (frac(m, 2 pi k_B T))^(3 \/ 2) exp (- frac(m v^2 \/ 2, k_B T)) = frac(n, \( 2 v_t^2 pi \)^(3 \/ 2)) exp (- frac(v^2, 2 v_t^2)) $
これを積分すると
$ integral f \( bold(v) \; t \) thin upright(d) bold(v) & = frac(n, \( 2 v_t^2 pi \)^(3 \/ 2)) integral exp (- frac(v^2, 2 v_t^2)) thin upright(d) bold(v) = n $
より任意の物理量 $Q \( bold(v) \)$
の全速度空間の平均値は次のようになる。
$ chevron.l Q \( bold(v) \) chevron.r = integral Q \( bold(v) \) f \( bold(v) \; t \) thin upright(d) bold(v) #scale(x: 240%, y: 240%)[\/] integral f \( bold(v) \; t \) thin upright(d) bold(v) = 1 / n integral Q \( bold(v) \) f \( bold(v) \; t \) thin upright(d) bold(v) $
$thin upright(d) bold(v) = 4 pi v^2 thin upright(d) v$
$ chevron.l 1 chevron.r & = frac(1, \( 2 v_t^2 pi \)^(3 \/ 2)) integral exp (- frac(v^2, 2 v_t^2)) thin upright(d) bold(v) = 1\
chevron.l q bold(v) chevron.r & = frac(1, \( 2 v_t^2 pi \)^(3 \/ 2)) integral q bold(v) exp (- frac(v^2, 2 v_t^2)) thin upright(d) bold(v) = bold(0)\
⟨1 / 2 m v^2⟩ & = frac(1, \( 2 v_t^2 pi \)^(3 \/ 2)) integral 1 / 2 m v^2 exp (- frac(v^2, 2 v_t^2)) thin upright(d) bold(v) = 3 / 2 m v_t^2 = 3 / 2 k_B T\
⟨1 / 2 m v^2 bold(v)⟩ & = frac(1, \( 2 v_t^2 pi \)^(3 \/ 2)) integral 1 / 2 m v^2 bold(v) exp (- frac(v^2, 2 v_t^2)) thin upright(d) bold(v) = bold(0)\
chevron.l v^3 chevron.r & = frac(1, \( 2 v_t^2 pi \)^(3 \/ 2)) integral_0^oo 4 pi v^5 exp (- frac(v^2, 2 v_t^2)) thin upright(d) v = 4 pi (frac(2 v_t^2, pi))^(3 \/ 2)\
chevron.l v^4 chevron.r & = frac(1, \( 2 v_t^2 pi \)^(3 \/ 2)) integral_0^oo 4 pi v^6 exp (- frac(v^2, 2 v_t^2)) thin upright(d) v = 15 v_t^4 = 15 T^2 / m^2 $
さらに電場が掛かっている状態のとき Boltzmann 分布
$ f \( bold(v) \, bold(r) \) & = n_0 (frac(m, 2 pi k_B T))^(3 \/ 2) exp (- frac(m v^2 \/ 2 + q phi \( bold(r) \), k_B T)) = frac(n \( bold(r) \), \( 2 v_t^2 pi \)^(3 \/ 2)) exp (- frac(v^2, 2 v_t^2))\
integral f \( bold(v) \, bold(r) \) thin upright(d) bold(v) & = n \( bold(r) \) = n_0 exp (- frac(q phi \( bold(r) \), k_B T)) $
速度 $bold(u)_0 = \( 0 \, 0 \, u_0 \)$ で移流している温度 $T$
のプラズマは次のように与えられる。 Debye 長の 2
乗程度大きく個別運動をしつつ、より大きなスケールでは集団振動していることが分かる。

== Debye 遮蔽
<debye-遮蔽>
電⼦は質量が軽い $m lt.double 1$ として慣性項を無視、圧力 $p = n T$
を用いて電⼦温度は空間的に⼀様であるとすると
$ m n frac(upright(d) bold(v)_e, upright(d) t) & = n q (bold(E) + 1 / c bold(v) times bold(B)) - nabla p\
0 & = - n q nabla phi \( bold(r) \) - T nabla n\
n & = n_0 exp (- frac(q phi \( bold(r) \), T))\
phi \( bold(r) \) & = - T / q ln (n / n_0) $ $q = - e \, Z e$
$m = m_e \, M$, $Z n_i = n_e$
$ nabla phi \( bold(r) \) = - frac(T nabla n, n q) = frac(T nabla n_e, n_e e) = - frac(T nabla n_i, n_i Z e)\
delta n_i = - frac(Z e phi, T_i) n_(i 0) $
ポテンシャルとそれを構築する電荷分布は次のようになる。
$ phi \( bold(r) \) & = q_0 / r exp \( - k_d r \)\
rho \( bold(r) \) & = - frac(1, 4 pi) nabla^2 phi \( bold(r) \) = - 1 / r^2 frac(partial, partial r) (r^2 frac(partial phi, partial r)) = - frac(k_d^2 q_0, r) exp \( - k_d r \) $
これより総電荷は次のようになる。
$ integral rho \( bold(r) \) thin upright(d) bold(r) & = - k_d^2 q_0 integral frac(exp \( - k_d r \), r) thin upright(d) bold(r) = - q_0 $

== プラズマ振動
<プラズマ振動>
= 集団運動と個別運動
<集団運動と個別運動>
$ rho \( bold(r) \, t \) & = sum_i delta \( bold(r) - bold(r)_i \)\
rho_(bold(k)) \( t \) & = integral rho \( bold(r) \, t \) e^(- i bold(k) dot.op bold(r)) thin upright(d) bold(r) = sum_i e^(- i bold(k) dot.op bold(r)_i) $
$ nabla^2 phi \( bold(r)_i \) & = 4 pi e rho \( bold(r)_i \) = 4 pi e sum_(j eq.not i) delta \( bold(r)_i - bold(r)_j \) = 4 pi e sum_(j eq.not i) frac(1, \( 2 pi \)^3) integral e^(i bold(k) dot.op \( bold(r)_i - bold(r)_j \)) thin upright(d) bold(k)\
nabla^2 phi \( bold(r)_i \) & = frac(1, \( 2 pi \)^3) integral phi \( bold(k) \) nabla^2 e^(i bold(k) dot.op bold(r)_i) thin upright(d) bold(k) = frac(1, \( 2 pi \)^3) integral \( - k^2 \) phi \( bold(k) \) e^(i bold(k) dot.op bold(r)_i) thin upright(d) bold(k)\
phi \( bold(k) \) & = - frac(4 pi e, k^2) sum_(j eq.not i) e^(- i bold(k) dot.op bold(r)_j)\
phi \( bold(r) \) & = frac(1, \( 2 pi \)^3) integral phi \( bold(k) \) e^(i bold(k) dot.op bold(r)) thin upright(d) bold(k) = - frac(4 pi e, \( 2 pi \)^3) integral sum_(j eq.not i) 1 / k^2 e^(i bold(k) dot.op \( bold(r) - bold(r)_j \)) thin upright(d) bold(k)\
 & = - 4 pi e sum_(bold(k)) zws' sum_(j eq.not i) 1 / k^2 e^(i bold(k) dot.op \( bold(r) - bold(r)_j \))\
nabla phi \( bold(r) \) & = - 4 pi e i sum_(bold(k)) zws' sum_(j eq.not i) bold(k) / k^2 e^(i bold(k) dot.op \( bold(r) - bold(r)_j \)) $
$ dot(rho)_(bold(k)) & = - i sum_i \( bold(k) dot.op bold(v)_i \) e^(- i bold(k) dot.op bold(r)_i)\
dot.double(rho)_(bold(k)) & = - sum_i \[ \( bold(k) dot.op bold(v)_i \)^2 + i bold(k) dot.op dot(bold(v))_i \] e^(- i bold(k) dot.op bold(r)_i)\
 & = - sum_i \( bold(k) dot.op bold(v)_i \)^2 e^(- i bold(k) dot.op bold(r)_i) - sum_i i bold(k) dot.op (frac(e nabla phi \( bold(r)_i \), m)) e^(- i bold(k) dot.op bold(r)_i)\
 & = - sum_i \( bold(k) dot.op bold(v)_i \)^2 e^(- i bold(k) dot.op bold(r)_i) - frac(4 pi e^2, m) sum_i bold(k) dot.op (sum_(bold(q)) zws' sum_(j eq.not i) bold(q) / q^2 e^(i bold(q) dot.op \( bold(r) - bold(r)_j \))) e^(- i bold(k) dot.op bold(r)_i)\
 & = - sum_i \( bold(k) dot.op bold(v)_i \)^2 e^(- i bold(k) dot.op bold(r)_i) - frac(4 pi e^2, m) sum_i sum_(bold(q)) zws' rho_(bold(q)) (frac(bold(k) dot.op bold(q), q^2)) e^(- i bold(k) dot.op bold(r)_i) e^(i bold(q) dot.op bold(r)_i)\
 & = - T / m k^2 rho_(bold(k)) - frac(4 pi e^2, m) sum_(bold(q)) zws' (frac(bold(k) dot.op bold(q), q^2)) rho_(bold(q)) rho_(bold(k) - bold(q))\
 & = - T / m k^2 rho_(bold(k)) - omega_p^2 rho_(bold(k)) - frac(4 pi e^2, m) sum_(bold(q) eq.not bold(k)) zws' (frac(bold(k) dot.op bold(q), q^2)) rho_(bold(q)) rho_(bold(k) - bold(q)) $
$bold(k) = bold(q)$ のとき $rho_0 = n_0$ であるから
$ dot.double(rho)_(bold(k)) + [omega_p^2 + frac(3 k_B T, m) k^2] rho_(bold(k)) = - frac(4 pi e^2, m) sum_(bold(q) eq.not bold(k))^() zws' (frac(bold(k) dot.op bold(q), q^2)) rho_(bold(q)) rho_(bold(k) - bold(q)) $
つまり運動方程式において波数 $bold(q)$ と $bold(k) - bold(q)$
の波から波数 $bold(k)$ の波に相互作用する。 3 次元ではなく 1
次元であると仮定する以外で係数 3 は消すことが出来なかった。

== ガウス積分
<ガウス積分>
$ integral_(- oo)^oo exp (- x^2 / alpha) thin upright(d) x = \( alpha pi \)^(1 \/ 2) $
