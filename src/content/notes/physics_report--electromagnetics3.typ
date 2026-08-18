#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "電磁気学 III 演習 期末レポート",
  date: "2026-08-18",
  tags: ("レポート",),
  summary: "physics_report/electromagnetics3.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 真空中の電磁気学と導体の電場
<真空中の電磁気学と導体の電場>
== Green の定理
<green-の定理>
#block[
$ integral_V \( phi.alt nabla^2 psi + nabla phi.alt dot.op nabla psi \) upright(d) v = integral.cont_(partial V) phi.alt frac(partial psi, partial n) upright(d) S $

]
#proof[
Gauss 発散定理においてスカラー場 $phi.alt \, psi$
を用いて $bold(A) = phi.alt nabla psi$ とすると $bold(n)$ は $partial V$
に垂直に内側から外側へ出る方向であるから次のように示せる。
$ integral_V nabla dot.op \( phi.alt nabla psi \) upright(d) v & = integral_(partial V) \( phi.alt nabla psi \) dot.op bold(n) upright(d) S\
integral_V (phi.alt nabla dot.op \( nabla psi \) + nabla psi dot.op nabla phi.alt) upright(d) v & = integral_(partial V) phi.alt \( nabla psi dot.op bold(n) \) upright(d) S\
integral_V (phi.alt nabla^2 psi + nabla psi dot.op nabla phi.alt) upright(d) v & = integral.cont_(partial V) phi.alt frac(partial psi, partial n) upright(d) S $
]

#block[
$ integral_V \( phi.alt nabla^2 psi - psi nabla^2 phi.alt \) upright(d) v = integral_(partial V) (phi.alt frac(partial psi, partial n) - psi frac(partial phi.alt, partial n)) upright(d) S $

]
#proof[
(a) と同様に $bold(A) = psi nabla phi.alt$
を代入した場合の式との差を計算することで示せる。
$ integral_V (phi.alt nabla^2 psi + nabla psi dot.op nabla phi.alt) upright(d) v & = integral.cont_(partial V) phi.alt frac(partial psi, partial n) upright(d) S\
integral_V (psi nabla^2 phi.alt + nabla phi.alt dot.op nabla psi) upright(d) v & = integral.cont_(partial V) psi frac(partial phi.alt, partial n) upright(d) S\
integral_V (phi.alt nabla^2 psi - psi nabla^2 phi.alt) upright(d) v & = integral_(partial V) (phi.alt frac(partial psi, partial n) - psi frac(partial phi.alt, partial n)) upright(d) S $
]

#block[
Poisson
方程式にディレクレ境界条件またはノイマン境界条件を加えたとき、解は一意に定まる。
$ nabla^2 Phi \( bold(r) \) & = - frac(rho \( bold(r) \), epsilon_0) $

]
#proof[
Poisson 方程式の解を
$Phi_1 \( bold(r) \) \, Phi_2 \( bold(r) \)$ とおく。これらの差分を
$U \( bold(r) \) = Phi_1 \( bold(r) \) - Phi_2 \( bold(r) \)$ とおくと
Poisson 方程式と 2 つの境界条件より $ nabla^2 U & = 0\
U \|_(partial V) & = 0 "または" med frac(partial U, partial n)\|_(partial V) = 0 $
が成り立つ。ここで Green の第一公式より
$ integral_V \( U nabla^2 U + \( upright(bold(nabla)) U \)^2 \) upright(d) V & = integral.cont_(partial V) U frac(partial U, partial n) upright(d) S\
integral_V \( upright(bold(nabla)) U \)^2 upright(d) V & = 0 $ よって
$upright(bold(nabla)) U = bold(0)$ つまり $U$ は定数であるから Poisson
方程式の解はどちらかの境界条件を満たせば定数を除いて一意に定まる。
]

== 電位係数と静電容量
<電位係数と静電容量>
無限遠点において電位を $0$ とし $k_0 = frac(1, 4 pi epsilon_0)$ とする。

#block[
真空中に電荷 $q_j eq.not 0$ を持つ導体に関して、他の導体の電荷を $0$
としたときの $i$ 番目の導体の電位を $V_i$ とし、電位係数 $p_(i j)$ を
$V_i = p_(i j) q_j$ とおく。このとき次の式が成り立つ。
$ vec(V_1, V_2, dots.v, V_n) & = vec(p) n n vec(q_1, q_2, dots.v, q_n)\
p_(l k) & = p_(k l) > 0 arrow.r.double.long p_(k k) > p_(k l) #h(2em) \( k eq.not l \) $

]
#proof[
電位の重ね合わせの原理より導体の電位 $V_i$
は次のようになる。 $ V_i & = sum_(j = 1)^n p_(i j) q_j\
vec(V_1, V_2, dots.v, V_n) & = vec(p) n n vec(q_1, q_2, dots.v, q_n) $
また電荷に対して距離の逆二乗で正方向に電位が生じる為、$p_(l k) = p_(k l) > 0 \, p_(k k) > p_(k l) med \( k eq.not l \)$
となる。 $ V_k & = p_(k k) q_k + p_(k l) q_l\
V_l & = p_(l k) q_k + p_(l l) q_l $
]

#block[
導体に関して、$q_k eq.not 0 \, V_l = 0 med \( l eq.not k \)$ のときの
$V_k$ を用いて静電容量 $C_k$ は $q_k = C_k V_k$ と与えられる。また導体
$k \, l$ 間の静電容量 $C_(k l)$ は $q_k = Q \, q_l = - Q \, q_m = 0$
のときの $V_k \, V_l$ を用いて $Q = C_(k l) \( V_k - V_l \)$
で与えられる。このとき $C_k \, C_(k l)$ を求めよ。静電容量行列
$\( c_(k l) \)$ を電位係数行列 $\( p_(k l) \)$ の逆行列とおく。
$ vec(q_1, q_2, dots.v, q_n) & = vec(c) n n vec(V_1, V_2, dots.v, V_n) $

]
#proof[
$ q_k & = C_k V_k = C_k \( p_(k k) q_k \)\
Q & = C_(k l) \( V_k - V_l \) = C_(k l) \( \( p_(k k) - p_(k l) \) Q - \( p_(l k) - p_(l l) \) Q \)\
 & {C_k = 1 / p_(k k)\
C_(k l) = frac(1, p_(k k) - p_(k l) - p_(l k) + p_(l l)) $
]

#block[
電荷の合計が $Q$ ですべて同一の電圧 $V$ となっているとき次のように
$C = Q \/ V$ を $\( c_(j k) \)$ で表す。

]
#proof[
仮定より次のように計算できる。
$ Q & = sum_(i = 1)^n q_i = sum_(i = 1)^n sum_(j = 1)^n c_(i j) V_j = (sum_(i = 1)^n sum_(j = 1)^n c_(i j)) V\
C & = sum_(i = 1)^n sum_(j = 1)^n c_(i j) $
]

#block[
半径 $a \, b$ の導体球が距離 $d$ 離れて置かれている。このときの容量係数
$c_a \, c_b$ と誘導係数 $c_12$ を求める。

]
#proof[
2 つの導体球の中心が通る軸を $x$ 軸として原点に半径
$a$ の導体球、$x = d$ に半径 $b$ の導体球があるとする。
このとき導体外の電位は次のようになる。
$ vec(q_a, q_b) & = mat(delim: "(", c_(a a), c_(a b); c_(b a), c_(b b)) vec(V_a, V_b)\
 & = mat(delim: "(", c_(a a), c_(a b); c_(b a), c_(b b)) vec(frac(k_0 q_a, a), frac(k_0 q_b, b)) $
$ c_a & = q_a / V_a = a / k_0\
c_b & = q_b / V_b = b / k_0\
c_(a b) & = frac(Q, V_a - V_b) $
$ phi.alt \( r \) & = k_0 frac(q_a, \| x \|) + k_0 frac(q_b, \| x - d \|) $
]

#block[
半径 $a$ の導体球 1 を、同じ中心を持つ半径 $b$ の薄い導体球殻 2
で囲う。電位係数 $p_11 \, p_22 \, p_12$ と容量係数
$c_1 \, c_2$、誘導係数 $c_12$ を求めよ。

]
#proof[

]

= 静電遮蔽と電気伝導
<静電遮蔽と電気伝導>
== 双極子モーメントと電場
<双極子モーメントと電場>
#block[
原点中心に対称に電荷が置かれているときの電気双極子モーメントを求めよ。

]
#proof[
電位は次のように求まる。
$ phi.alt \( bold(r) \) & = frac(1, 4 pi epsilon_0) (frac(q, \| bold(r) - bold(d) \/ 2 \|) - frac(q, \| bold(r) + bold(d) \/ 2 \|))\
 & = frac(q, 4 pi epsilon_0) (upright(bold(nabla))' frac(1, \| bold(r) \|)) dot.op bold(d)\
 & = frac(1, 4 pi epsilon_0) frac(q bold(d) dot.op bold(r), \| bold(r) \|^3) $
これより電気双極子モーメントは $bold(p) = q bold(d)$ と書ける。
]

#block[
一様な電場 $bold(E)$ において電気双極子 $bold(p)$
のポテンシャルエネルギー $U$ を求めよ。

]
#proof[
分極していない状態から引き離す仕事がポテンシャルエネルギーとなる。
$ U & = q bold(E) dot.op bold(d) / 2 + \( - q bold(E) \) dot.op (- bold(d) / 2) = bold(E) dot.op bold(p) $
]

#block[
この電気双極子 $bold(p)$ が一様な電場から受ける力は全体として $bold(0)$
であることを示し、電場から受けるトルク $bold(N)$ を求めよ。

]
#proof[
全体の受ける力 $bold(F)$ と電場から受けるトルク
$bold(N)$ は次のようになる。
$ bold(F) & = q bold(E) + \( - q bold(E) \) = bold(0)\
bold(N) & = bold(d) / 2 times q bold(E) + (- bold(d) / 2) times \( - q bold(E) \)\
 & = bold(p) times bold(E) $
]

== Maxwell の方程式と応力テンソル
<maxwell-の方程式と応力テンソル>
#block[
$ bold(E) dot.op bold(j) + partial_t (1 / 2 bold(E) dot.op bold(D) + 1 / 2 bold(H) dot.op bold(B)) + upright(bold(nabla)) dot.op \( bold(E) times bold(H) \) = 0 $

]
#proof[
Maxwell 方程式より次のように示せる。
$ bold(E) dot.op \( upright(bold(nabla)) times bold(H) \) & = bold(E) dot.op (bold(j) + partial_t bold(D))\
- upright(bold(nabla)) dot.op \( bold(E) times bold(H) \) + \( upright(bold(nabla)) times bold(E) \) dot.op bold(H) & = bold(E) dot.op bold(j) + partial_t \( bold(E) dot.op bold(D) \)\
- upright(bold(nabla)) dot.op \( bold(E) times bold(H) \) + \( - partial_t bold(B) \) dot.op bold(H) & = bold(E) dot.op bold(j) + partial_t \( bold(E) dot.op bold(D) \)\
- partial_t (1 / 2 bold(E) dot.op bold(D) + 1 / 2 bold(H) dot.op bold(B)) - upright(bold(nabla)) dot.op \( bold(E) times bold(H) \) & = bold(E) dot.op bold(j) $
これは電磁場と物質のエネルギー密度の時間変化が電磁場のエネルギーの流れとなっており、エネルギー保存則を表す。
]

#block[
物質の運動量密度を $bold(p)_m \( bold(r) \, t \)$
とする。電磁場との相互作用による運動量密度の時間変化は電荷密度と電流密度が受ける力で与えられるので
$ partial_t bold(p)_m & = rho bold(E) + bold(j) times bold(B) $
と書ける。$rho \, bold(j)$ を消去せよ。

]
#proof[
$ partial_t bold(p)_m & = rho bold(E) + bold(j) times bold(B)\
 & = \( upright(bold(nabla)) dot.op bold(D) \) bold(E) + \( upright(bold(nabla)) times bold(H) - partial_t bold(D) \) times bold(B) $
]

#block[
電磁場の応力テンソル $T_(i j)$ を
$ T_(i j) & = E_i D_j + H_i B_j - delta_(i j) cal(E)_(E M)\
 & = E_i D_j + H_i B_j - delta_(i j) / 2 \( bold(E) dot.op bold(D) + bold(H) dot.op bold(B) \) $
と定義すると
$ partial_t [bold(p)_m + bold(Y) / c^2]_j = sum_i frac(partial, partial r_i) T_(i j) $
が成り立つことを示せ。

]
#proof[
Maxwell の方程式と $bold(E) \, bold(D)$ と
$bold(B) \, bold(H)$ の関係式から次のように求まる。
$ partial_t [bold(p)_m + bold(Y) / c^2]_j & = [partial_t bold(p)_m + partial_t frac(bold(E) times bold(H), c^2)]_j\
 & = [\( upright(bold(nabla)) dot.op bold(D) \) bold(E) + \( upright(bold(nabla)) times bold(H) - partial_t bold(D) \) times bold(B) + partial_t \( bold(D) times bold(B) \)]_j\
 & = [\( upright(bold(nabla)) dot.op bold(D) \) bold(E) + \( upright(bold(nabla)) times bold(H) \) times bold(B) + bold(D) times partial_t bold(B)]_j\
 & = [\( upright(bold(nabla)) dot.op bold(D) \) bold(E) + \( upright(bold(nabla)) times bold(H) \) times bold(B) - bold(D) times \( upright(bold(nabla)) times bold(E) \)]_j\
 & = \( partial_i D_i \) E_j + epsilon_(j i k) epsilon_(i l m) \( partial_l H_m \) B_k - epsilon_(j i k) D_i epsilon_(k l m) \( partial_l E_m \)\
 & = \( partial_i D_i \) E_j + \( partial_i H_j \) B_i - \( partial_j H_i \) B_i - D_i \( partial_j E_i \) + D_i \( partial_i E_j \)\
 & = partial_i \( E_i D_j \) + partial_i \( H_i B_j \) - \( partial_j H_i \) B_i - D_i \( partial_j E_i \)\
 & = partial_i \( E_i D_j \) + partial_i \( H_i B_j \) - 1 / 2 partial_j \( E_i D_i + H_i B_i \)\
 & = partial_i \( E_i D_j + H_i B_j - delta_(i j) cal(E)_(E M) \)\
 & = partial_i T_(i j) $
]

#block[
電磁場の運動量密度 $bold(p)_(E M)$
を次のように定義したときに運動量保存則を示せ。
$ bold(p)_(E M) & = bold(Y) / c^2 $

]
#proof[
応力テンソル $T_(i j)$ の逆方向を電磁場の運動量流密度
$bold(j) = - T_(i j)$ と定義することで次のように書ける。
$ upright(bold(nabla)) dot.op bold(j) + partial_t (bold(p)_m + bold(p)_(E M)) = bold(0) $
よってこれを積分形に書き直すと Gauss の発散定理を用いて次のようになる。
$ integral.cont_(partial V) bold(j) \( bold(r) \, t \) dot.op bold(n) \( bold(r) \) upright(d) S + partial_t integral_V \( bold(p)_m + bold(p)_(E M) \) upright(d) v = 0 $
]

= 誘電体の電場
<誘電体の電場>
== 誘電体と導体のある系
<誘電体と導体のある系>
#block[
真空中で、一様な外部電場 $E_0 hat(bold(x))$
が形成されているところに、半径 $a$ の長い円柱状の導体 (電位 $0$ とする)
の周囲に内半径 $a$、外半径 $b$、誘電率 $epsilon$
の円筒状の誘電体が密着したものを、軸を $z$
軸に合わせて置く。誘電体中および、誘電体の外側での電位をそれぞれ求めよ。

]
#proof[
円柱導体の中心を原点とする円筒座標系
$\( r \, theta \, z \)$ を考える。ただし $x$ 軸の方向を $theta = 0$
の軸とし、電位は $x = 0$ でゼロとなる。

まず半径 $b$ の誘電体球のみが存在する状況を考える。誘電体中の電場 $E$
はガウスの定理より次のように書ける。
$ epsilon E hat(bold(x)) = epsilon_0 E_0 hat(bold(x)) $
このとき外部電位は中心をゼロとすることで $phi.alt_e = - E r cos theta$
となるから対称性より $phi.alt = f \( r \) cos theta$ と書けて
$- nabla^2 phi.alt = 0$ を解くと
$ phi.alt \( r \, theta \) & = \( A r + B r^(- 2) \) cos theta $
となる。ここで真空と誘電体の境界条件より
$ epsilon frac(partial phi.alt, partial r) \[ r = b \] & = epsilon_0 frac(partial phi.alt, partial r) \[ r = b \]\
frac(partial phi.alt, partial theta) \[ r = b \] & = frac(partial phi.alt, partial theta) \[ r = b \] $
であり、無限遠点や原点で有限となるから電位は次のようになる。
$ phi.alt \( r \, theta \) & = cases(delim: "{", - frac(3 epsilon_0, epsilon + 2 epsilon_0) E r cos theta & \( r < b \), - E (r - frac(epsilon - epsilon_0, epsilon + 2 epsilon_0) b^3 / r^2) cos theta & \( r > b \), ) $
さらに半径 $a$
の導体を埋め込むと導体と誘電体の境界条件から電位は次のように求まる。
$ phi.alt \( r \, theta \) & = cases(delim: "{", 0 & \( r < a \), - frac(3 epsilon_0^2, epsilon \( epsilon + 2 epsilon_0 \)) (r - a^3 / r^2) E_0 cos theta & \( a < r < b \), - epsilon_0 / epsilon (r - frac(epsilon - epsilon_0, epsilon + 2 epsilon_0) b^3 / r^2 - frac(3 epsilon_0, epsilon + 2 epsilon_0) a^3 / r^2) E_0 cos theta & \( r > b \), ) $
]

== 誘電体中の静電場のエネルギー
<誘電体中の静電場のエネルギー>
面積 $S = a^2$
の正方形の平行導体板を持つ平行板コンデンサがあり、極板の間隔は
$d \( lt.double a \)$ である。厚さ $t \( t < d \)$、誘電率 $epsilon$
の極板と同じ形状の誘電体を、極板間に極板と平行に深さ $x \( 0 < x < a \)$
まで差し込んで保持した状態を考える。ただし、誘電体の辺は導体板と平行で、$x$
方向と垂直な方向については、誘電体ははみ出していないものとする。

#block[
電位差 $V$
の電池に繋がれているとき、誘電体がコンデンサに引き込まれる力を $x$
の関数として求めよ。

]
#proof[
電圧 $V$
と誘電体を含む領域とそうではない領域における電束密度 $D \, D'$
の関係は次のようになる。
$ V & = D (frac(d - t, epsilon_0) + t / epsilon) = D' d / epsilon_0 $
これよりエネルギーの差分は次のようになる。
$ Delta U & = frac(a x, 2) (frac(d - t, epsilon_0) + t / epsilon) (frac(epsilon epsilon_0, epsilon d - \( epsilon - epsilon_0 \) t) V)^2 + frac(a \( a - x \) d, 2 epsilon_0) (epsilon_0 / d V)^2 - frac(a^2 d, 2 epsilon_0) (epsilon_0 / d V)^2\
 & = frac(\( epsilon - epsilon_0 \) t, epsilon d - \( epsilon - epsilon_0 \) t) frac(a x, 2 d) epsilon_0 V^2 $
これより誘電体が引き込まれる力 $F$ は次のように求まる。
$ F & = frac(partial U, partial x) = frac(\( epsilon - epsilon_0 \) t, epsilon d - \( epsilon - epsilon_0 \) t) frac(a, 2 d) epsilon_0 V^2 $
]

#block[
電荷 $Q$
を充電して電池を外したとき、誘電体がコンデンサに引き込まれる力を $x$
の関数として求めよ。

]
#proof[
まず誘電体のある部分とそうではない部分の電荷密度を
$sigma' \, sigma_0$ とおく。このとき
$sigma' \/ sigma_0 = \( epsilon t + epsilon_0 \( d - t \) \) \/ epsilon_0 d \, Q = \( sigma' x + sigma_0 \( a - x \) \) a$
が成り立つ。
$ E & = sigma_0 / epsilon_0 = frac(Q, epsilon_0 \( \( epsilon t + epsilon_0 \( d - t \) \) x \/ epsilon_0 d + \( a - x \) \) a) = frac(Q d, \( \( epsilon - epsilon_0 \) t x + epsilon_0 d a \) a)\
Delta U_e & = E / 2 \( D' x + D_0 \( a - x \) \) a t - frac(epsilon_0 E_0^2, 2) a^2 t\
 & = frac(E Q t, 2) - frac(Q^2 t, 2 epsilon_0 a^2)\
 & = frac(Q^2 t, 2 epsilon_0 a^2) frac(epsilon_0 d a, \( epsilon - epsilon_0 \) t x + epsilon_0 d a) - frac(Q^2 t, 2 epsilon_0 a^2)\
 & = - frac(Q^2 t, 2 epsilon_0 a^2) frac(\( epsilon - epsilon_0 \) t x, \( epsilon - epsilon_0 \) t x + epsilon_0 d a) $
これより誘電体が引き込まれる力は次のように求まる。
$ F & = - frac(upright(d) Delta U_e, upright(d) x) = frac(Q^2 t, 2 epsilon_0 a^2) frac(epsilon_0 \( epsilon - epsilon_0 \) d a t, \( \( epsilon - epsilon_0 \) t x + epsilon_0 d a \)^2)\
 & = frac(Q^2 \( epsilon - epsilon_0 \) d t^2, 2 a \( \( epsilon - epsilon_0 \) t x + epsilon_0 d a \)^2) $
]

== 誘電体球の受ける力
<誘電体球の受ける力>
#block[
電気双極子 $bold(p)$ の受ける力は
$bold(F) \( bold(r) \) = \( bold(p) dot.op nabla \) bold(E)$
となることを示せ。

]
#proof[
電気双極子モーメントは空間に対して定数であるから次のように計算できる。
$ bold(F) \( bold(r) \) & = - upright(bold(nabla)) V \( bold(r) \)\
 & = upright(bold(nabla)) \( bold(p) dot.op bold(E)_0 \( bold(r) \) \)\
 & = \( bold(p) dot.op upright(bold(nabla)) \) bold(E)_0 + \( bold(E)_0 dot.op upright(bold(nabla)) \) bold(p) + bold(p) times \( upright(bold(nabla)) times bold(E)_0 \) + bold(E)_0 times \( upright(bold(nabla)) times bold(p) \)\
 & = \( bold(p) dot.op upright(bold(nabla)) \) bold(E)_0 \( bold(r) \) $
]

#block[
誘電体球内の点 $bold(x)$ での分極を
$bold(P) \( bold(r) \) = 3 epsilon_0 bold(E)_0$
と近似すると誘電体球の受ける力 $bold(F) \( bold(r) \)$ を求めよ。

]
#proof[
$ bold(P) \( bold(r) \) & = 3 epsilon_0 bold(E)_0\
bold(F) \( bold(r) \) & = \( bold(p) dot.op upright(bold(nabla)) \) bold(E)_0 \( bold(r) \)\
 & = \( 3 epsilon_0 bold(E)_0 dot.op upright(bold(nabla)) \) bold(E)_0 \( bold(r) \)\
 & = 3 / 2 epsilon_0 upright(bold(nabla)) \| bold(E)_0 \( bold(r) \) \|^2 $
]

== 液体の電気感受率
<液体の電気感受率>
#block[
半径 $a \, b$ ($\| b - a \| lt.double a < b$)
の長い同心円柱導体面が誘電体である液体に垂直に差し込まれているときの液体の電気感受率を求めよ。

]
#proof[
$ V & = (frac(d - h, epsilon_0) + frac(h, epsilon_0 \( 1 + chi \))) D\
Delta U & = D^2 / 2 (frac(d - h, epsilon_0) + frac(h, epsilon_0 \( 1 + chi \))) S - 1 / 2 frac(epsilon_0 S, d) V^2\
 & = 1 / 2 frac(epsilon_0 S, d) V^2 frac(\( 2 + chi \) h, \( 1 + chi \) d - chi h)\
rho S h g = frac(upright(d) Delta U, upright(d) h) & = 1 / 2 frac(epsilon_0 S, d) V^2 frac(\( 2 + chi \) \( 1 + chi \) d, \( \( 1 + chi \) d - chi h \)^2)\
rho h g \( \( 1 + chi \) d - chi h \)^2 & = 1 / 2 epsilon_0 V^2 \( 2 + chi \) \( 1 + chi \) $
]

= 磁性体と静磁場
<磁性体と静磁場>
== 磁気モーメントと磁場
<磁気モーメントと磁場>
#block[
点磁荷 $m$ が作る磁位を求めよ。

]
#proof[
極座標において点磁荷を中心とする半径 $R$ の球体 $V$
においてガウスの法則を適用することで磁場 $bold(H) \( bold(r) \)$
は次のようになる。
$ 4 pi R^2 H \( R \) = m arrow.l.r.double H \( r \) & = frac(1, 4 pi) m / r^2 $
これより磁位は次のようになる。
$ phi.alt_m \( r \) & = - integral_oo^r mu_0 H \( r' \) upright(d) r' = [frac(mu_0 m, 4 pi r')]_oo^r = frac(mu_0, 4 pi) m / r $
]

#block[
磁気モーメント $bold(m)$ が作る磁位を求めよ。

]
#proof[
磁荷 $m \, - m$ をそれぞれ $bold(0) \, bold(d)$
におくと磁気モーメント $bold(m) = m bold(d)$
となり、このときの磁位は次のようになる。
$ phi.alt_m \( bold(r) \) & = frac(mu_0, 4 pi) (frac(m, \| bold(r) - bold(d) \|) - frac(m, \| bold(r) \|))\
 & = frac(mu_0, 4 pi) (upright(bold(nabla)) frac(1, \| bold(r) \|)) dot.op bold(m)\
 & = frac(mu_0, 4 pi) frac(bold(m) dot.op bold(r), \| bold(r) \|^3)\
 & = frac(mu_0, 4 pi) frac(\| bold(m) \| r cos theta, r^3) $
]

#block[
磁気モーメント $bold(m)$ が作る磁場を求めよ。

]
#proof[
磁位から磁場と磁場 $bold(H)$ を求める。
$ bold(H) \( bold(r) \) & = - upright(bold(nabla)) phi.alt_m \( bold(r) \) = - frac(mu_0, 4 pi) upright(bold(nabla)) frac(bold(m) dot.op bold(r), \| bold(r) \|^3)\
 & = frac(mu_0, 4 pi) frac(\( 3 bold(m) dot.op bold(r) \) bold(r) - \| bold(r) \|^2 bold(m), \| bold(r) \|^5)\
 & = frac(mu_0, 4 pi) frac(\| bold(m) \| \( 3 cos theta hat(bold(r)) - hat(bold(m)) \), r^3) $
また $bold(H)$ が $bold(r)$ となす角は次のように求まる。
$ cos phi & = frac(bold(H) \( bold(r) \) dot.op bold(r), \| bold(H) \| \| bold(r) \|) = frac(2 \| bold(m) \| r cos theta, \| bold(m) \| \| 3 cos theta hat(bold(r)) - hat(bold(m)) \| r)\
 & = frac(2 cos theta, \| 3 cos theta hat(bold(r)) - hat(bold(m)) \|)\
phi & = cos^(- 1) (frac(2 cos theta, \| 3 cos theta hat(bold(r)) - hat(bold(m)) \|)) $
ただし $hat(bold(r)) \, hat(bold(m))$ をそれぞれ $bold(r) \, bold(m)$
方向の単位ベクトルとする。
]

= 常磁性体、強磁性体、超伝導
<常磁性体強磁性体超伝導>
== 磁性体中を流れる電流が受ける力
<磁性体中を流れる電流が受ける力>
#block[
透磁率 $mu_1 \, mu_2$ を持つ磁性体が平面で接しているとき、磁性体 $mu_1$
中に直線状導体に電流 $I$ を流すときの鏡像を求めよ。

]
#proof[
電流によって生じる磁場は次のようになるから、導線の鏡像は境界面に対して対称に導線を配置して逆方向に電流
$I mu_1 \/ mu_2$ を流す。 $ bold(H) & = frac(I, 2 pi r) $
]

#block[
真空中に無限に広い平面で隔てられた透磁率 $mu$
の磁性体が置かれている。このとき磁性体から距離 $a$
の真空中に境界面に平行に無限に長い直線電流 $I$
が置かれたときに単位長当たりに働く力を求めよ。

]
#proof[
鏡像によって作られる磁場 $bold(H) \( bold(r) \)$
は次のようになる。
$ bold(H) \( r \) & = frac(1, 2 pi r) (- mu_0 / mu I) hat(theta) $
これより単位長当たりに導線に働く力は次のようになる。
$ F & = mu_0 I H \( 2 a \) = frac(mu_0 I, 4 pi a) (- mu_0 / mu I) = - frac(mu_0^2 I^2, 4 pi mu a) $
よって磁性体に対して反発する方向に単位長当たり
$frac(mu_0^2 I^2, 4 pi mu a)$ だけ力が働く。
]

#block[
前問について透磁率が $mu_1 \, mu_2$ としたときに働く力を求めよ。

]
#proof[
磁性体に対して反発する方向に単位長当たり
$frac(mu_1^2 I^2, 4 pi mu_2 a)$ だけ力が働く。
]
