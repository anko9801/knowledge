#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "計算物理",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/computational.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 差分法
<差分法>
#definition[
連続な時間 $t$
に対し、離散化された時間のパラメータは微小時間 $Delta t$ を用いて
$t_n = n Delta t$ と書く。同様に空間についても $x_i = i Delta x$
とする。 時間・空間について連続な関数 $f \( x \, t \)$ に対する離散値を
$f_i^(\( n \)) := f \( x_i \, t_n \)$ と書く。 空間について $n$
次精度とは $cal(O) \( Delta x^n \)$ となること
]
#theorem("1階微分の差分公式")[
1次前進差分、1次後退差分、2次中心差分は次のように求まる。
$ f_(i') & approx frac(f_(i + 1) - f_i, Delta x) + cal(O) \( Delta x \)\
f_(i') & approx frac(f_i - f_(i - 1), Delta x) + cal(O) \( Delta x \)\
f_(i') & approx frac(f_(i + 1) - f_(i - 1), 2 Delta x) + cal(O) \( Delta x^2 \) $
]
#proof[
$f \( x plus.minus Delta x \)$ を 2 次まで Taylor
展開すると
$ f \( x plus.minus Delta x \) & = f_(i plus.minus 1) = f_i plus.minus f_(i') Delta x + 1 / 2 f_(i'') Delta x^2 + cal(O) \( Delta x^3 \) $
より次の式が成り立つ。
$ f_(i + 1) - f_i & = f_(i') Delta x + cal(O) \( Delta x^2 \)\
f_i - f_(i - 1) & = f_(i') Delta x + cal(O) \( Delta x^2 \)\
f_(i + 1) - f_(i - 1) & = 2 f_(i') Delta x + cal(O) \( Delta x^3 \) $
よって微分は
$ f_(i') & approx frac(f_(i + 1) - f_i, Delta x) + cal(O) \( Delta x \)\
f_(i') & approx frac(f_i - f_(i - 1), Delta x) + cal(O) \( Delta x \)\
f_(i') & approx frac(f_(i + 1) - f_(i - 1), 2 Delta x) + cal(O) \( Delta x^2 \) $
] 

#theorem("2次精度2階微分の差分公式")[
2次中心差分は次のように書ける。
$ f'' \( x_n \) & approx frac(f \( x_(n + 1) \) - 2 f \( x_n \) + f \( x_(n - 1) \), Delta x^2) + cal(O) \( Delta x^2 \) $
]
#proof[
$f \( x plus.minus Delta x \)$ を 3 次まで Taylor
展開すると
$ f \( x plus.minus Delta x \) & = f_(i plus.minus 1) = f_i plus.minus f_(i') Delta x + 1 / 2 f_(i'') Delta x^2 plus.minus frac(1, 3 !) f_(i''') Delta x^3 + cal(O) \( Delta x^4 \) $
となりこの和について計算することで求まる。
$ f_(i + 1) + f_(i - 1) & = 2 f_i + f_(i'') Delta x^2 + cal(O) \( Delta x^4 \)\
f_(i'') & = frac(f_(i + 1) - 2 f_i + f_(i - 1), Delta x^2) + cal(O) \( Delta x^2 \) $
] 

#theorem("2階微分の差分公式")[
$f \( x plus.minus k Delta x \)$ の Taylor 展開で 2
次以外の項を相殺することで次の式が得られる.
$ f'' \( x_n \) & approx frac(- f \( x_(n + 2) \) + 16 f \( x_(n + 1) \) - 30 f \( x_n \) + 16 f \( x_(n - 1) \) - f \( x_(n - 2) \), 12 Delta x^2) + cal(O) \( Delta x^4 \) $
]
== 安全性解析
<安全性解析>
#block[
#definition("フォン・ノイマン (von Neumann) の安定性解析")[
時間が経つと共に振幅が増大しないことは安定性の条件となる。
$ f \( x \, t \) & = sum_k A_k \( t \) e^(i k x)\
lr(|A_k^(\( n + 1 \)) / A_k^(\( n \))|) & lt.eq 1 $
]

]
#block[
#definition("CFL (Courant-Friedrichs-Lewy) 条件")[
計算上の情報の伝播する速さより物理的な情報の伝播する速さの方が小さい。
$ frac(Delta x, Delta t) gt.eq c\
nu := frac(c Delta t, Delta x) lt.eq 1 $
]

]
#definition("拡散方程式")[
$ frac(partial f \( x \, t \), partial t) & = kappa frac(partial^2 f \( x \, t \), partial x^2) $
]
#theorem[
$ f_i^(\( n + 1 \)) & = f_i^(\( n \)) + frac(kappa Delta t, Delta x^2) (f_(i + 1)^(\( n \)) - 2 f_i^(\( n \)) + f_(i - 1)^(\( n \))) $
]
#proof[
拡散方程式は時間について(1次)前進差分、空間について(2次)中心差分を取る。これを
FTCS (Forward Time Centered Space) スキームという。
$ frac(f_i^(\( n + 1 \)) - f_i^(\( n \)), Delta t) & = kappa frac(f_(i + 1)^(\( n \)) - 2 f_i^(\( n \)) + f_(i - 1)^(\( n \)), Delta x^2)\
f_i^(\( n + 1 \)) & = f_i^(\( n \)) + frac(kappa Delta t, Delta x^2) (f_(i + 1)^(\( n \)) - 2 f_i^(\( n \)) + f_(i - 1)^(\( n \))) $
このように時間発展を求められる。これは安全性を満たす。
$ frac(A^(\( n + 1 \)) e^(i k x_i) - A^(\( n \)) e^(i k x_i), Delta t) & = kappa frac(A^(\( n \)) e^(i k x_(i + 1)) - 2 A^(\( n \)) e^(i k x_i) + A^(\( n \)) e^(i k x_(i - 1)), Delta x^2)\
lr(|A_k^(\( n + 1 \)) / A_k^(\( n \))|) & = lr(|1 + frac(kappa Delta t, Delta x^2) \( e^(i k Delta x) - 2 + e^(- i k Delta x) \)|)\
 & = lr(|1 - frac(2 kappa Delta t, Delta x^2) \( 1 - cos \( k Delta x \) \)|) lt.eq 1 $
] 

#definition("移流方程式")[
$ frac(partial f \( x \, t \), partial t) & = - c frac(partial f \( x \, t \), partial x) $
]
#theorem[
移流方程式は時間について(1次)前進差分、空間について(2次)中心差分を取ると安全性を満たさない。
\
時間について(1次)前進差分、空間について(1次)後退差分を取ると安全性を満たす。
$ frac(f_i^(\( n + 1 \)) - f_i^(\( n \)), Delta t) & = - c frac(f_i^(\( n \)) - f_(i - 1)^(\( n \)), Delta x) $
]
#proof[
時間について(1次)前進差分、空間について(2次)中心差分を取る。
$ frac(f_i^(\( n + 1 \)) - f_i^(\( n \)), Delta t) & = - c frac(f_(i + 1)^(\( n \)) - f_(i - 1)^(\( n \)), 2 Delta x) $
安全性解析すると
$ (A \( t_(n + 1) \) - A \( t_n \)) frac(e^(i k x_i), Delta t) & = - c (e^(i k Delta x) - e^(- i k Delta x)) frac(A \( t_n \) e^(i k x_i), 2 Delta x)\
lr(|frac(A \( t_(n + 1) \), A \( t_n \))|) & = sqrt(lr(|1 - i nu sin \( k Delta x \)|)^2) = sqrt(1 + nu^2 sin^2 \( k Delta x \)) > 1 $
CFL 条件
$ frac(Delta x, Delta t) & = - c frac(f_(i + 1)^(\( n \)) - f_(i - 1)^(\( n \)), 2 \( f_i^(\( n + 1 \)) - f_i^(\( n \)) \)) gt.eq c $
1次後退差分で離散化したものについて
$ frac(f_i^(\( n + 1 \)) - f_i^(\( n \)), Delta t) & = - c frac(f_i^(\( n \)) - f_(i - 1)^(\( n \)), Delta x) $
安定性解析すると
$ (A \( t_(n + 1) \) - A \( t_n \)) frac(e^(i k x_i), Delta t) & = - c (1 - e^(- i k Delta x)) frac(A \( t_n \) e^(i k x_i), Delta x)\
lr(|frac(A \( t_(n + 1) \), A \( t_n \))|) & = sqrt(lr(|1 - nu \( 1 - e^(- i k Delta x) \)|)^2)\
 & = sqrt(1 - 2 nu \( 1 - nu \) \( 1 - cos \( k Delta x \) \)) lt.eq 1\
arrow.l.r.double nu & lt.eq 1 $
] 
これは差分により拡散項が増えてしまったからである。

#definition("Navier-Stokes 方程式")[
$ frac(partial bold(v), partial t) & = - \( bold(v) dot.op nabla \) bold(v) - 1 / rho nabla p + nu nabla^2 bold(v) + bold(F) $
まず無次元量とする。
$ bold(v) & = V tilde(bold(v)) & bold(r) & = L tilde(bold(r)) & t & = L / V tilde(t) & p & = rho V^2 tilde(p) & nabla & = 1 / L tilde(nabla) & frac(partial, partial t) & = V / L frac(partial, partial tilde(t)) & upright(R e) & = frac(U V, nu) $
レイノルズ数 $upright(R e)$ は慣性力と粘性力の比に対応する。
$ frac(partial tilde(bold(v)), partial tilde(t)) & = - \( tilde(bold(v)) dot.op tilde(nabla) \) tilde(bold(v)) - tilde(nabla) tilde(p) + 1 / upright(R e) tilde(nabla)^2 tilde(bold(v)) $
これ以降、無次元量を表すチルダは略す。
]
#theorem[
Navier-Stokes 方程式
]
#proof[
$omega = nabla times bold(v)$ とすると
$ frac(partial omega_i, partial t) & = frac(partial, partial t) \( nabla times bold(v) \)_i\
 & = - nabla times \( \( bold(v) dot.op nabla \) bold(v) \) - nabla times nabla p + 1 / upright(R e) nabla times nabla^2 bold(v)\
 & = - epsilon_(i j k) partial_j \( \( v_l partial_l \) v_k \) + 1 / upright(R e) epsilon_(i j k) partial_j partial_l partial_l v_k\
 & = - epsilon_(i j k) \( partial_j v_l partial_l v_k + v_l partial_j partial_l v_k \) + 1 / upright(R e) partial_l partial_l epsilon_(i j k) partial_j v_k\
 & = - epsilon_(i j k) partial_j v_l partial_l v_k - \( bold(v) dot.op nabla \) \( nabla times bold(v) \) + 1 / upright(R e) nabla^2 \( nabla times bold(v) \)\
 & = - epsilon_(i j k) partial_j v_l partial_l v_k - \( bold(v) dot.op nabla \) omega + 1 / upright(R e) nabla^2 omega $
$bold(v) \( x \, y \, t \) = \( u \( x \, y \, t \) \, v \( x \, y \, t \) \, 0 \)$
とするとき、次の渦度方程式となる。
$ frac(partial omega_3, partial t) & = - \( bold(v) dot.op nabla \) omega_3 + 1 / upright(R e) nabla^2 omega_3 $
ここでは非圧縮性液体 $nabla dot.op bold(v) = 0$ のとき
$bold(v) = nabla times Phi$ と書ける。ここで流れ関数 $Phi$ を導入する。
$ u & = - frac(partial Phi, partial y) quad v = frac(partial Phi, partial x)\
omega & = frac(partial^2 Phi, partial x^2) + frac(partial^2 Phi, partial y^2) = nabla^2 Phi\
omega & = nabla times \( nabla times Phi \)\
 & = nabla dot.op \( nabla Phi \) - nabla^2 Phi $
流れ関数を用いると解くべき方程式は渦度方程式とポアソン方程式に分けることができる。
$ frac(partial omega, partial t) & = frac(partial Phi, partial x) frac(partial omega, partial y) - frac(partial Phi, partial y) frac(partial omega, partial x) + 1 / upright(R e) nabla^2 omega\
nabla^2 Phi & = - omega $
] 

#theorem[
ポアソン方程式については差分法で解ける。
$  & nabla^2 Phi = - omega\
 & frac(Phi_(i + 1 \, j) - 2 Phi_(i \, j) + Phi_(i - 1 \, j), Delta x^2) + frac(Phi_(i \, j + 1) - 2 Phi_(i \, j) + Phi_(i \, j - 1), Delta y^2) = omega_(i \, j)\
 & Phi_(i \, j) = 1 / 4 (Phi_(i + 1 \, j) + Phi_(i - 1 \, j) + Phi_(i \, j + 1) + Phi_(i \, j - 1) - Delta x^2 omega_(i \, j)) $
初期値を適当にセットして、この漸化式を収束するまで繰り返し更新する。この漸化式を改良させて収束を早めることができる。次の漸化式を順にヤコビ法,
ガウス・ザイデル法, SOR 法という。
$ Phi_(i \, j)^(upright(n e w)) & = 1 / 4 (Phi_(i + 1 \, j) + Phi_(i - 1 \, j) + Phi_(i \, j + 1) + Phi_(i \, j - 1) - Delta x^2 omega_(i \, j))\
Phi_(i \, j)^(upright(n e w)) & = 1 / 4 (Phi_(i + 1 \, j) + Phi_(i - 1 \, j)^(upright(n e w)) + Phi_(i \, j + 1) + Phi_(i \, j - 1)^(upright(n e w)) - Delta x^2 omega_(i \, j))\
Phi_(i \, j)^(upright(n e w)) & = C_(S O R) 1 / 4 (Phi_(i + 1 \, j) + Phi_(i - 1 \, j)^(upright(n e w)) + Phi_(i \, j + 1) + Phi_(i \, j - 1)^(upright(n e w)) - Delta x^2 omega_(i \, j)) + \( 1 - C_(S O R) \) Phi_(i \, j) & \( 0 < C_(S O R) < 2 \) $
]
= ヌメロフ法
<ヌメロフ法>
= LAPACK
<lapack>
= Taylor 展開法
<taylor-展開法>
#definition[
現在の情報のみを使って時間発展を記述する方法を陽解法という。未来の情報も使って時間発展を記述する方法を陰解法という。
]
#definition[
Taylor展開法 Crank-Nicolson
法は時間と空間について2次精度の陰解法
]
#definition("TDSE")[
$ i planck frac(partial psi, partial t) & = (- frac(planck^2, 2 m) nabla^2 + V \( bold(r) \)) psi \( bold(r) \, t \) $
]
$ - frac(planck^2, 2 m) mat(delim: "(", - 2, 1, , , , ; 1, - 2, 1, , , ; #none, 1, - 2, 1, , ; #none, , , dots.down, , ; #none, , , 1, - 2, 1) vec(psi_alpha \( x_1 \), psi_alpha \( x_2 \), psi_alpha \( x_3 \), dots.h.c, psi_alpha \( x_N \)) + mat(delim: "(", V \( x_1 \), , , ; #none, V \( x_2 \), , ; #none, , dots.down, ; #none, , , V \( x_N \)) vec(psi_alpha \( x_1 \), psi_alpha \( x_2 \), dots.h.c, psi_alpha \( x_N \)) = E vec(psi_alpha \( x_1 \), psi_alpha \( x_2 \), dots.h.c, psi_alpha \( x_N \)) $

#block[
#definition("時間依存Gross-Pitaevskii方程式: TDGPE (時間依存非線形Schrödinger方程式: TDNSE)")[
非線形項
$ i planck frac(partial Psi, partial t) & = (- frac(planck^2, 2 m) nabla^2 + V_(e x t) \( bold(r) \, t \) + g \| Psi \( bold(r) \, t \) \|^2) Psi \( bold(r) \, t \) & (g = frac(4 pi planck^2 a_s, m)) $
]

]
= 動的システム
<動的システム>
#definition("システム")[
システムとは入力に対して出力を返す\"機能\"を持つ対象の総称である。
これは次のようにモデル化できる。

静的システム (static system) とは入力 $bold(u)$ に対して一意の出力
$bold(y)$ を返すシステムである。
$ bold(y) \( t \) = bold(f) \( bold(u) \( t \) \) $ 動的システム
(dynamic system) とは内部状態 $bold(x)$
を持ち、入力に対して状態が変化し、状態から出力が返されるシステムである。
$ frac(upright(d) bold(x), upright(d) t) & = bold(f) \( bold(x) \, bold(u) \, t \)\
bold(y) & = bold(g) \( bold(x) \, t \) $ 第 1 式を状態方程式、第 2
式を出力方程式と呼ぶ。
]
まず平衡点 $bold(x)_0 \, bold(u)_0 \, bold(y)_0$ において展開する。
$ dot(bold(x)) & approx frac(partial bold(f), partial bold(x)) \[ \( bold(x)_0 \, bold(u)_0 \) \] bold(x) + frac(partial bold(f), partial bold(u)) \[ \( bold(x)_0 \, bold(u)_0 \) \] bold(u)\
bold(y) & approx frac(partial bold(g), partial bold(x)) \[ bold(x)_0 \] bold(x) $
これより $ dot(bold(x)) & = A bold(x) + B bold(u)\
bold(y) & = C bold(x) $ と定式化できる。 $bold(x) = T bold(z)$ とおくと
$ dot(bold(z)) & = T^(- 1) A T bold(z) + T^(- 1) B bold(u)\
bold(y) & = C T bold(z) $ により $A$ を対角化できる。

#theorem[
$ bold(y) & = C exp \( A \( t - t_0 \) \) bold(x)_0 + C integral_(t_0)^t exp \( A \( t - tau \) \) B bold(u) \( tau \) thin upright(d) tau $
]
#proof[
まず $bold(u) = 0$
のときの状態方程式は次のように解ける。 $ dot(bold(x)) & = A bold(x)\
bold(x) & = exp \( A \( t - t_0 \) \) bold(x)_0 $ これより一般において
$bold(x) = exp \( A t \) bold(k)$ とおくと
$ dot(bold(x)) & = A bold(x) + exp \( A t \) dot(bold(k)) = A bold(x) + B bold(u)\
dot(bold(k)) & = exp \( - A t \) B bold(u) $ この微分方程式を解くと
$ bold(k) \( t \) - bold(k)_0 & = integral_(t_0)^t exp \( - A tau \) B bold(u) \( tau \) thin upright(d) tau\
bold(k) & = exp \( - A t_0 \) bold(x)_0 + integral_(t_0)^t exp \( - A tau \) B bold(u) thin upright(d) tau $
となる。よって
$ bold(x) & = exp \( A \( t - t_0 \) \) bold(x)_0 + integral_(t_0)^t exp \( A \( t - tau \) \) B bold(u) thin upright(d) tau\
bold(y) & = C exp \( A \( t - t_0 \) \) bold(x)_0 + C integral_(t_0)^t exp \( A \( t - tau \) \) B bold(u) \( tau \) thin upright(d) tau $
] 

#example[

]
#example("バネ・マス・ダンパ系")[
$ m dot.double(y) + b dot(y) + k y = f $ $x_1 = y := y$,
$x_2 := dot(y)$, $u = f$
$ vec(dot(x)_1, dot(x)_2) & = mat(delim: "(", 0, 1; - k / m, - b / m) vec(x_1, x_2) + vec(0, 1 / m) u & y & = mat(delim: "(", 1, 0) vec(x_1, x_2) $
]
#example("RLC")[
$ L dot.double(q) + R dot(q) + 1 / C q = e_i $
]
