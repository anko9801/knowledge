#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "固体物理学",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/solid_state_physics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 格子
<格子>
== 格子空間と逆格子空間
<格子空間と逆格子空間>
結晶中での原子・分子は周期的に配列された格子 (lattice)
という構造を持っている。

#definition("格子")[
ユークリッド空間 $bb(R)^n$
において基底となる ${ bold(a)_i }_(1 lt.eq i lt.eq n)$
を選び、$bold(R)_n$ をその整数倍の線形結合で表現できるとする。
$ bold(R)_n & = sum_(i = 1)^n n_i bold(a)_i #h(2em) \( n_i in bb(Z) \) $
このとき $bold(a)_i$ を基本並進ベクトル (primitive translation vector)
と呼び、$bold(R)_n$ を格子点 (lattice point)
または格子ベクトル、$bold(R)_n$ の集合全体を格子 (lattice) と呼ぶ。
]
#theorem[
同じ格子でも基本並進ベクトルの取り方は無数にある。 \
]
3 次元格子の格子点を原子・分子と対応付けたものが結晶構造となる。
そして格子を細かく区切っていくとある形の繰り返しの構造となっていて、その内面積最小となるものを基本単位胞
(primitive unit cell) と呼ぶ。
基本単位胞の形状も無数にあり、点のない場所に枠を作ってもよい。
格子点同士を結ぶ線分の垂直二等分面で囲まれた領域を基本単位胞と選んだものをウィグナーザイツ胞
(Wigner-Seitz cell) と呼ぶ。 \
1850 年に Bravie は 3 次元空間における格子は 14
種類に限られることを示した。 その格子群は Bravie 格子と呼ばれる。
対称性によって格子を分類する。

- 並進対称性: すべての格子がもつ

- 回転対称性: $C_1$ (恒等), $C_2$ (180°), $C_3$ (120°), $C_4$ (90°),
  $C_6$ (60°) のみ

- 鏡映 $m$: $\( x \, y \, z \) mapsto \( - x \, y \, z \)$

- 反転 $accent(1, macron)$: $\( x \, y \, z \) mapsto \( - x \, - y \, - z \)$

- 回反 $accent(4, macron)$: 90° 回転し上下反転して一致する。

#block[
#figure(
  table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([結晶], [格子条件], [単純], [面心], [対称性],),
    table.hline(),
    [正方晶], [$a = b \, theta = 90$°], [正方格子], [], [$C_4 \, m$],
    [直方晶], [$a eq.not b \, theta = 90$°], [直方格子], [面心直方格子], [$C_2 \, m$],
    [斜方晶], [$a eq.not b \, theta eq.not 90$°], [斜方格子], [], [$C_2$],
    [六方晶], [$theta = 60$°], [六方格子], [], [$C_6$],
  )
  , caption: [2 次元 Bravie 格子]
  , kind: table
  )

] <table:2D-Bravie>
#block[
#figure(
  table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([結晶系], [格子条件], [単純], [体心], [面心], [底心],),
    table.hline(),
    [立方晶], [$a = b = c$,
    $alpha = beta = gamma = 90$°], [単純立方格子], [体心立方格子], [面心立方格子], [],
    [正方晶], [$a = b eq.not c$,
    $alpha = beta = gamma = 90$°], [単純正方格子], [体心正方格子], [], [],
    [直方晶], [$a eq.not b eq.not c$,
    $alpha = beta = gamma = 90$°], [単純直方格子], [体心直方格子], [面心直方格子], [底心直方格子],
    [単斜晶], [$a eq.not b eq.not c$, $alpha = gamma = 90$°,
    $beta eq.not 90$°], [単純単斜格子], [], [], [底心単斜格子],
    [三方晶], [$a = b = c$,
    $alpha = beta = gamma eq.not 90$°], [単純三方晶], [], [], [],
    [六方晶], [$a = b eq.not c$, $alpha = beta = 90$°,
    $gamma = 120$°], [単純六方晶], [], [], [],
    [三斜晶], [$a eq.not b eq.not c$,
    $alpha eq.not beta eq.not gamma$], [単純三斜晶], [], [], [],
  )
  , caption: [3 次元 Bravie 格子]
  , kind: table
  )

] <table:3D-Bravie>
周期条件 $f \( bold(r) + bold(R)_n \) = f \( bold(r) \)$ を満たす関数
$f \( bold(r) \)$ を Fourier 変換すると次のようになる。
$ f \( bold(r) \) & = sum_m A_m exp \( i bold(G)_m dot.op bold(r) \) #h(2em) (exp \( i bold(G)_m dot.op bold(R)_n \) = 1) $
これより $bold(G)_m dot.op bold(R)_n = 2 pi N$ となるから $bold(G)_m$
は次のように表現できる。
$ bold(G)_m & = m_1 bold(b)_1 + m_2 bold(b)_2 + m_3 bold(b)_3 #h(2em) (bold(a)_i dot.op bold(b)_j = 2 pi delta_(i j)) $
$bold(G)_m$ を 3 次元の逆格子ベクトル (reciprocal lattice vector)
といい、$bold(b)_1 \, bold(b)_2 \, bold(b)_3$
を逆格子の基本ベクトルと呼ぶ。 逆格子ベクトルの集合を逆格子空間と呼ぶ。
Wigner-Seitz 胞の逆格子空間を Brillouin ゾーンという。

#block[
#example("単純立方格子 (simple cubic lattice)")[
($3 C_4 \, 4 C_3 \, 7 m$) 例えば単純立方格子の逆格子空間は単純立方格子
$ bold(a)_1 & = a \( 1 \, 0 \, 0 \) & bold(b)_1 & = frac(2 pi, a) \( 1 \, 0 \, 0 \)\
bold(a)_2 & = a \( 0 \, 1 \, 0 \) quad arrow.r.double.long quad & bold(b)_2 & = frac(2 pi, a) \( 0 \, 1 \, 0 \)\
bold(a)_3 & = a \( 0 \, 0 \, 1 \) & bold(b)_3 & = frac(2 pi, a) \( 0 \, 0 \, 1 \) $
]

]
#example("面心立方格子")[
逆格子空間は体心立方格子
$ bold(a)_1 & = a / 2 \( 0 \, 1 \, 1 \) & bold(b)_1 & = frac(2 pi, a) \( - 1 \, 1 \, 1 \)\
bold(a)_2 & = a / 2 \( 1 \, 0 \, 1 \) quad arrow.r.double.long quad & bold(b)_2 & = frac(2 pi, a) \( 1 \, - 1 \, 1 \)\
bold(a)_3 & = a / 2 \( 1 \, 1 \, 0 \) & bold(b)_3 & = frac(2 pi, a) \( 1 \, 1 \, - 1 \) $
]
#example("体心立方格子")[
逆格子空間は面心立方格子
$ bold(a)_1 & = a / 2 \( 0 \, 1 \, 1 \) & bold(b)_1 & = frac(2 pi, a) \( - 1 \, 1 \, 1 \)\
bold(a)_2 & = a / 2 \( 1 \, 0 \, 1 \) quad arrow.r.double.long quad & bold(b)_2 & = frac(2 pi, a) \( 1 \, - 1 \, 1 \)\
bold(a)_3 & = a / 2 \( 1 \, 1 \, 0 \) & bold(b)_3 & = frac(2 pi, a) \( 1 \, 1 \, - 1 \) $
]
== 回折
<回折>
Laue 条件 $ bold(k) = bold(k)_0 + bold(G)_m $ $bold(k)$ と $bold(k)_0$
のなす角 $2 theta$ $ 2 \| bold(k) \| sin theta & = \| bold(G)_m \|\
2 d sin theta & = lambda #h(2em) (\| bold(k) \| = frac(2 pi, lambda) \, \| bold(G)_m \| = frac(2 pi, d)) $
これを Bragg の条件という。 $ A \( bold(K) \) & = integral_a $

#definition[
Miller 指数 (Miller indices)
$\[ h med k med l \]$
$ bold(A) & = h bold(a)_1 + k bold(a)_2 + l bold(a)_3 $
]
= 固体における結合
<固体における結合>
== 共有結合 (covalent bond)
<共有結合-covalent-bond>
電子に対して陽子は質量が大きい為、陽子は固定されていると考えて陽子の運動エネルギーを除く。
これを断熱近似 (adiabatic approximation) という。
$ hat(H) & = - frac(planck^2, 2 m_e) nabla^2 - frac(e^2, 4 pi epsilon_0 r_1) - frac(e^2, 4 pi epsilon_0 r_2) + frac(e^2, 4 pi epsilon_0 R) $
LCAO 法 (linear combination of atomic orbitals method)
$ phi & = c_1 phi_1 + c_2 phi_2 #h(2em) \( H phi_i = cal(E) phi_i \) $

$ integral phi_i hat(H) phi thin upright(d) bold(r) & = cal(E) integral phi_i phi thin upright(d) bold(r)\
c_j H_(i j) & = cal(E) c_j S_(i j) $ ただし $j$
で縮約を取り、次のように定義した。
$ H_(i j) & := integral phi_i^(\*) hat(H) phi_j thin upright(d) bold(r) & \( H_11 = H_22 \, H_12 = H_21 \)\
S_(i j) & := integral phi_i^(\*) phi_j thin upright(d) bold(r) & \( S_11 = S_22 = 1 \, S_12 = S_21 \) $
このとき次が成り立つ。
$ mat(delim: "(", H_11 - S_11 cal(E), H_12 - S_12 cal(E); H_21 - S_21 cal(E), H_22 - S_22 cal(E)) vec(c_1, c_2) = mat(delim: "(", H_11 - cal(E), H_12 - S cal(E); H_12 - S cal(E), H_11 - cal(E)) vec(c_1, c_2) = 0 $
このとき行列式を考えることで次の式が成り立つ。
$ \( H_11 - cal(E) \)^2 & - \( H_12 - S cal(E) \)^2 = 0\
H_11 - cal(E) & = plus.minus \( H_12 - S cal(E) \)\
cal(E)_plus.minus & = frac(H_11 plus.minus H_12, 1 plus.minus S) $
これを代入すると
$ frac(1, 1 plus.minus S) mat(delim: "(", plus.minus H_11 S minus.plus H_12, H_12 - S H_11; H_12 - S H_11, plus.minus H_11 S minus.plus H_12) vec(c_1, c_2) = 0 $
より $c_2 = plus.minus c_1$ となる。
$ integral \| phi \|^2 thin upright(d) bold(r) & = integral \| c_1 phi_1 plus.minus c_1 phi_2 \|^2 thin upright(d) bold(r) = \| c_1 \|^2 integral \( \| phi_1 \|^2 plus.minus phi_1^(\*) phi_2 plus.minus phi_2^(\*) phi_1 + \| phi_2 \|^2 \) thin upright(d) bold(r)\
 & = \| c_1 \|^2 \( 2 plus.minus 2 S \) = 1\
c_1 & = 1 / sqrt(2 \( 1 plus.minus S \)) $
よって波動関数は次のように表示できる。
$ phi_plus.minus & = 1 / sqrt(2 \( 1 plus.minus S \)) \( phi_1 plus.minus phi_2 \) $

= 格子振動
<格子振動>
== 1 種類の原子からなる 1 次元格子振動
<種類の原子からなる-1-次元格子振動>
$ M frac(upright(d)^2 u_j, upright(d) t^2) & = - K \( u_j - u_(j - 1) \) + K \( u_(j + 1) - u_j \) $
$ u_j & = A e^(i j k a) e^(- i omega t) $
$ - M omega^2 & = - K \( 2 - e^(- i k a) - e^(i k a) \) = - 2 K \( 1 - cos k a \) = - 4 K sin^2 frac(k a, 2)\
omega & = 2 sqrt(K / M) lr(|sin frac(k a, 2)|) $ $omega$ と $k$
の関係は分散関係 (dispersion relation) と呼ぶ。 このとき $omega$ は周期
$display(frac(2 pi, a))$ で振動する。 $ k & = 0 #h(2em) omega = 0\
k & = pi / a #h(2em) omega = 2 sqrt(K / M)\
k & = frac(2 pi, a) #h(2em) omega = 0 $

== 2 種類の原子からなる 1 次元格子振動
<種類の原子からなる-1-次元格子振動-1>
結晶には 2 種類以上の原子からなるものも多い。 など
$ M_A frac(upright(d)^2 u_j^A, upright(d) t^2) & = c \( u_j^B - u_j^A \) - c \( u_j^A - u_(j - 1)^B \)\
M_B frac(upright(d)^2 u_j^B, upright(d) t^2) & = c \( u_(j + 1)^A - u_j^B \) - c \( u_j^B - u_j^A \) $
$ u_j^A & = A e^(i k \( n - 1 \) a - i omega t)\
u_j^B & = B e^(i k \( n - 1 / 2 \) a - i omega t) $
$ - M_A omega^2 A & = - c \( 2 A - B - B e^(- i k a) \)\
- M_B omega^2 B & = - c \( 2 B - A - A e^(i k a) \) $
$ mat(delim: "(", M_A omega^2 - 2 c, c \( 1 + e^(- i k a) \); c \( 1 + e^(i k a) \), M_B omega^2 - 2 c) vec(A, B) = 0 $
行列式が $0$ であることから
$ omega^2 & = c ((1 / M_A + 1 / M_B) plus.minus sqrt((1 / M_A + 1 / M_B)^2 - 4 frac(sin^2 frac(k a, 2), M_A M_B))) $
$k approx 0$ において
$ omega^2 & = c ((1 / M_A + 1 / M_B) plus.minus sqrt((1 / M_A + 1 / M_B)^2 - 4 frac(sin^2 frac(k a, 2), M_A M_B)))\
 & approx c ((1 / M_A + 1 / M_B) plus.minus ((1 / M_A + 1 / M_B) - frac(\( k a \)^2, 2 \( M_A + M_B \))))\
 & approx 2 c (1 / M_A + 1 / M_B) \, quad frac(c \( k a \)^2, 2 \( M_A + M_B \))\
omega & approx sqrt(2 c (1 / M_A + 1 / M_B)) \, quad a sqrt(frac(c, 2 \( M_A + M_B \))) k $
これより $k approx 0$
において線形的な音響モードと定数的な光学モードに分けられる。
音響モードは同じ向き 光学モードは逆向き 音速が速いと硬い

1次元の格子振動を量子化する。 より一般の 3 次元の格子振動はモードの種類
($s = 1 \, 2 \, 3$) による。

== フォノン
<フォノン>
$ u_j & = 1 / sqrt(N) sum_k u_k e^(i j k a)\
sum_(j = 1)^N e^(i j \( k + k' \) a) & = N delta_(k \, - k') $
$ H & = sum_(j = 1)^N (1 / 2 M (frac(partial u_j, partial t))^2 + 1 / 2 K \( u_(j + 1) - u_j \)^2)\
 & = sum_(j = 1)^N (1 / 2 M (1 / sqrt(N) sum_k frac(partial u_k, partial t) e^(i j k a))^2 + 1 / 2 K (1 / sqrt(N) sum_k u_k e^(i j k a) \( e^(i k a) - 1 \))^2)\
 & = sum_(j = 1)^N (frac(1, 2 N) M sum_(k \, k') frac(partial u_k, partial t) frac(partial u_(k'), partial t) e^(i j \( k + k' \) a) + frac(1, 2 N) K sum_(k \, k') u_k u_(k') \( e^(i k a) - 1 \) \( e^(i k' a) - 1 \) e^(i j \( k + k' \) a))\
 & = 1 / 2 M sum_k frac(partial u_k, partial t) frac(partial u_(- k), partial t) + frac(1, 2 N) K sum_k u_k u_(- k) \( e^(i k a) - 1 \) \( e^(- i k a) - 1 \)\
 & = sum_k (1 / 2 M frac(partial u_k, partial t) frac(partial u_(- k), partial t) + 2 K sin^2 frac(k a, 2) u_k u_(- k))\
 & = sum_k (frac(p_k p_(- k), 2 M) + 1 / 2 M omega^2 u_k u_(- k)) $
$ hat(a)_k & = sqrt(frac(M omega, 2 planck)) u_k + i / sqrt(2 M planck omega) p_(- k)\
hat(a)_k^dagger & = sqrt(frac(M omega, 2 planck)) u_(- k) - i / sqrt(2 M planck omega) p_k $
$ hat(H) = sum_k (hat(a)_k^dagger hat(a)_k + 1 / 2) planck omega $
$ \[ a_k \, a_(k')^dagger \] = delta_(k k') $ 波数 $bold(k)$
とモードの種類 $s$ のフォノンのエネルギーは $E_(bold(k) \, s)$
$ E_(bold(k) \, s) = (n_(bold(k) \, s) + 1 / 2) planck omega_(bold(k) \, s) $

= 固体の熱的性質
<固体の熱的性質>
= 自由電子
<自由電子>
== Nearly free electron model
<nearly-free-electron-model>
$V \( bold(r) \) lt.double 1$
$ V \( bold(r) \) & = sum_(bold(k)) V_(bold(k)) e^(i bold(k) dot.op bold(r)) $
