#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "相対性理論",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/general_relativity.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 特殊相対性理論
<特殊相対性理論>
#definition("Einstein の相対性原理")[
自然法則は全ての慣性系において同じ形になる。
]
#definition("光速度不変の原理")[
光の速度は全ての慣性系で、光源の速度によらず一定である。
]
世界線がどんな慣性系 Lorentz 変換に対して不変
$ upright(d) s^2 & := \( c upright(d) t \)^2 - upright(d) x^2 - upright(d) y^2 - upright(d) z^2 = \( c upright(d) tau \)^2 $
すべての慣性系から見て $d s^2$ は不変であることがわかる。

時刻 $t in bb(R)$ と場所 $bold(x) = \( x^1 \, x^2 \, x^3 \) in bb(R)^3$
をまとめた時空点 $x = \( x^mu \)$ を次の反変ベクトルで表す。
4次元時空座標 $x^mu$ を定義する。
$ x^mu & := \( x^0 \, x^1 \, x^2 \, x^3 \) = \( c t \, x \, y \, z \)\
x_mu & := \( x_0 \, x_1 \, x_2 \, x_3 \) = \( c t \, - x \, - y \, - z \) $
添字の上下で
$ x^0 = x_0 \, quad x^1 = - x_1 \, quad x^2 = - x_2 \, quad x^3 = - x_3 $
これが次のように表される。 $ d s^2 & = sum_(mu = 0)^3 d x_mu d x^mu\
 & = d x_0 d x^0 + d x_1 d x^1 + d x_2 d x^2 + d x_3 d x^3\
 & = \( c d t \)^2 - d x^2 - d y^2 - d z^2 $
このように上付き添字を持つものは反変ベクトル $V^mu$,
下付き添字を持つものは共変ベクトル $V_mu$ と呼びます。
物理的な内容は同じですが表現が違うものです。 ただの表記の違い

次に基本となる反変ベクトルだけで世界線を表すことを考えてみましょう。これには次の計量テンソル
$g_(mu nu)$ を定義します。
$ g_(mu nu) = mat(delim: "(", 1, 0, 0, 0; 0, - 1, 0, 0; 0, 0, - 1, 0; 0, 0, 0, - 1)_(mu nu) $
これにより
$ d s^2 & = sum_(mu = 0)^3 sum_(nu = 0)^3 g_(mu nu) d x^mu d x^nu\
 & = g_00 d x^0 d x^0 + g_11 d x^1 d x^1 + g_22 d x^2 d x^2 + g_33 d x^3 d x^3\
 & = \( c d t \)^2 - d x^2 - d y^2 - d z^2 $
総和記号が多くなってきたので Einstein の縮約記法を用いると
$ d s^2 = d x_mu d x^mu = g_(mu nu) d x^mu d x^nu $ 計量テンソル
$g_(mu nu)$ は添字を上下する。 $ d s^2 = - d tau^2 $

$ A^mu A_mu = A^nu A_nu $ $x$
による微分を共変ベクトルとして次のように定義する。
$ partial_mu & := \( partial_0 \, partial_1 \, partial_2 \, partial_3 \) = (frac(partial, partial x^0) \, frac(partial, partial x^1) \, frac(partial, partial x^2) \, frac(partial, partial x^3)) = (1 / c frac(partial, partial t) \, frac(partial, partial x) \, frac(partial, partial y) \, frac(partial, partial z)) $

== 計量
<計量>
とその逆行列 $g^(mu nu)$
$ g_(mu nu) = g^(mu nu) = mat(delim: "(", 1, 0, 0, 0; 0, - 1, 0, 0; 0, 0, - 1, 0; 0, 0, 0, - 1) $
$ g_(mu nu) & = M eta_(mu nu) M^top\
g & = det \( eta_(mu nu) \) det \( M \)^2 = - det \( M \)^2 < 0 $

これらを元に四元速度、四元加速度、四元運動量
$ u^mu \( t \) & = frac(upright(d) x^mu, upright(d) tau) = gamma \( c \, dot(bold(r)) \)\
a^mu \( t \) & = frac(upright(d)^2 x^mu, upright(d) tau^2) = gamma \( 0 \, dot.double(bold(r)) \)\
p^mu & = m u^mu = m gamma \( c \, dot(bold(r)) \)\
j^mu \( x \) & := \( c rho \, bold(j) \) $

運動方程式 $ m frac(upright(d)^2 x^mu, upright(d) tau^2) = 0 $

作用 $ delta S & = integral epsilon^mu delta x_mu upright(d) tau = 0 $

= 一般相対性理論
<一般相対性理論>
#axiom("アインシュタインの等価原理")[
加速系と重力場の系は局所的には原理的に区別できない。
]
例えば宇宙人によって部屋に閉じ込められたとき地球と同じ重力があるからといって地球にいるとは限らない。

== 座標系
<座標系>
#definition("デカルト座標")[
$ bold(e)_x dot.op bold(e)_x & = bold(e)_y dot.op bold(e)_y = 1 \, #h(2em) bold(e)_x dot.op bold(e)_y = 0 $
]
#definition("極座標")[
ユークリッド平面においてデカルト座標 $\( x \, y \)$ から極座標
$\( r \, theta \)$ への変換は次のように定義する。
$ r = sqrt(x^2 + y^2) \, #h(2em) theta = arctan y / x $ 逆に極座標
$\( r \, theta \)$ からデカルト座標 $\( x \, y \)$ へは次のようになる。
$ x = r cos theta \, #h(2em) y = r sin theta $
]
$ bold(e)_r & = frac(partial x, partial r) bold(e)_x + frac(partial y, partial r) bold(e)_y = cos theta bold(e)_x + sin theta bold(e)_y\
bold(e)_theta & = frac(partial x, partial theta) bold(e)_x + frac(partial y, partial theta) bold(e)_y = - r sin theta bold(e)_x + r cos theta bold(e)_y $
$ bold(e)_r dot.op bold(e)_r & = \( cos theta bold(e)_x + sin theta bold(e)_y \) dot.op \( cos theta bold(e)_x + sin theta bold(e)_y \)\
 & = cos^2 theta + sin^2 theta = 1\
bold(e)_theta dot.op bold(e)_theta & = \( - r sin theta bold(e)_x + r cos theta bold(e)_y \) dot.op \( - r sin theta bold(e)_x + r cos theta bold(e)_y \)\
 & = r^2 sin^2 theta + r^2 cos^2 theta = r^2\
bold(e)_r dot.op bold(e)_theta & = \( cos theta bold(e)_x + sin theta bold(e)_y \) dot.op \( - r sin theta bold(e)_x + r cos theta bold(e)_y \)\
 & = - r sin theta cos theta + r sin theta cos theta = 0 $

== 様々な座標系における演算
<様々な座標系における演算>
どのような座標系においても同じ形の式を作る。 異なる座標系での内積

#definition("座標系の基底ベクトル")[
座標変換によって基底ベクトルによる
$ bold(e)_(alpha') & = Lambda_(med alpha')^beta bold(e)_beta = frac(partial x^beta, partial x^(alpha')) bold(e)_beta $
ある座標系において基底ベクトル同士の内積を計量テンソル $g_(alpha beta)$
といい、場所の複雑な関数である。
$ bold(e)_alpha dot.op bold(e)_beta & = g_(alpha beta) $
また基底ベクトルの微分による係数をクリストッフェル記号といい、$Gamma_(med alpha beta)^mu$
と書く。
$ frac(partial bold(e)_alpha, partial x^beta) & = Gamma_(med alpha beta)^mu bold(e)_mu $
]
$ g^(alpha beta) & = g_(alpha beta)^(- 1)\
g_(alpha beta) & = g_(beta alpha)\
g_(mu nu) & = Lambda_(med mu)^alpha Lambda_(med nu)^beta g_(alpha beta) $
ベクトル $bold(A) = A^alpha bold(e)_alpha$ を基底で微分
\$\\nabla\_\\beta\\bm{A}= \\difsp{\\bm{A}}{x^\\beta} = A^\\alpha\_{\\ ;\\beta}\\bm{e}\_\\alpha\$
について
$ A_(med ; beta)^alpha bold(e)_alpha & = frac(partial, partial x^beta) \( A^alpha bold(e)_alpha \) = frac(partial A^alpha, partial x^beta) bold(e)_alpha + A^alpha frac(partial bold(e)_alpha, partial x^beta) = A_(med \, beta)^alpha bold(e)_alpha + A^alpha Gamma_(med alpha beta)^mu bold(e)_mu $
より
$ A_(med ; beta)^alpha & = A_(med \, beta)^alpha + A^mu Gamma_(med mu beta)^alpha $
これを共変微分という。スカラー場 $phi.alt$
について微分と共変微分をすることについて
$ phi.alt_(\, alpha ; beta) & = phi.alt_(\, alpha \, beta) + phi.alt_mu Gamma_(med alpha beta)^mu\
phi.alt_(\, beta ; alpha) & = phi.alt_(\, beta \, alpha) + phi.alt_mu Gamma_(med beta alpha)^mu = phi.alt_(\, alpha \, beta) + phi.alt_mu Gamma_(med beta alpha)^mu $
であり、$phi.alt_(\, alpha ; beta) = phi.alt_(\, beta ; alpha)$
であるから $ Gamma_(med alpha beta)^mu & = Gamma_(med beta alpha)^mu $
となる。

共変ベクトルについても共変微分すると
$ A_(alpha ; mu) & = \( g_(alpha beta) A^beta \)_(; mu) = g_(alpha beta ; mu) A^beta + g_(alpha beta) A_(med ; mu)^beta = g_(alpha beta ; mu) A^beta + A_(alpha ; mu) $
より最初と結果を比較することで次のテンソル方程式が成り立つ。
$ g_(alpha beta ; mu) & = 0 $ また計量テンソルの共変微分を計算すると
$ g_(alpha beta ; mu) & = g_(alpha beta \, mu) - g_(nu beta) Gamma_(med alpha mu)^nu - g_(alpha nu) Gamma_(med mu beta)^nu = 0 $
より、これを添字を変えたものを
$ g_(alpha beta \, mu) & = g_(nu beta) Gamma_(med alpha mu)^nu + g_(alpha nu) Gamma_(med mu beta)^nu\
g_(mu alpha \, beta) & = g_(nu alpha) Gamma_(med mu beta)^nu + g_(mu nu) Gamma_(med beta alpha)^nu\
g_(beta mu \, alpha) & = g_(nu mu) Gamma_(med beta alpha)^nu + g_(beta nu) Gamma_(med alpha mu)^nu $
適切に足し引きして両辺に $1 / 2 g^(alpha nu)$ を掛けると
$ 2 g_(alpha nu) Gamma_(med beta mu)^nu & = g_(alpha beta \, mu) + g_(mu alpha \, beta) - g_(beta mu \, alpha)\
Gamma_(med beta mu)^nu & = 1 / 2 g^(alpha nu) (g_(alpha beta \, mu) + g_(mu alpha \, beta) - g_(beta mu \, alpha)) $
よりクリストッフェル記号を計量テンソルで表すことができる。
$ Gamma_(med alpha beta)^mu & = 1 / 2 g^(mu nu) \( g_(alpha nu \, beta) + g_(beta nu \, alpha) - g_(alpha beta \, nu) \) $

#block[
テンソル方程式 テンソルの共変微分は次のようになる。
$ V_(med ; beta)^alpha & = V_(med \, beta)^alpha + Gamma_(med mu beta)^alpha V^mu\
P_(alpha ; beta) & = P_(alpha \, beta) + Gamma_(med alpha beta)^mu P_mu\
T_(quad ; gamma)^(alpha beta) & = T_(quad \, gamma)^(alpha beta) + Gamma_(med mu gamma)^alpha T^(mu beta) + Gamma_(med mu gamma)^beta T^(alpha mu) $
更に $ g_(alpha beta ; mu) & = 0\
Gamma_(med alpha beta)^mu = Gamma_(med beta alpha)^mu & = 1 / 2 g^(mu nu) \( g_(alpha nu \, beta) + g_(beta nu \, alpha) - g_(alpha beta \, nu) \) $

]
#example("デカルト座標")[
$ g_(alpha beta) & = delta_(alpha beta)\
frac(partial bold(e)_alpha, partial x^beta) & = Gamma_(med alpha beta)^mu bold(e)_mu = 0\
A_(med ; beta)^alpha & = A_(med \, beta)^alpha = A_(alpha \, beta)\
A_(med ; alpha)^alpha & = frac(partial A^x, partial x) + frac(partial A^y, partial y) $
]
#example("極座標")[
$ Lambda_(med alpha)^beta & = mat(delim: "(", Lambda_(med r)^x, Lambda_(med r)^y; Lambda_(med theta)^x, Lambda_(med theta)^y) = mat(delim: "(", frac(partial x, partial r), frac(partial y, partial r); frac(partial x, partial theta), frac(partial y, partial theta)) = mat(delim: "(", cos theta, sin theta; - r sin theta, r cos theta)\
bold(e)_r & = cos theta bold(e)_x + sin theta bold(e)_y\
bold(e)_theta & = - r sin theta bold(e)_x + r cos theta bold(e)_y $
$ g_(alpha beta) & = mat(delim: "(", 1, 0; 0, r^2) $
$ frac(partial bold(e)_r, partial r) & = Gamma_(med r r)^r bold(e)_r + Gamma_(med r r)^theta bold(e)_theta = 0\
frac(partial bold(e)_r, partial theta) & = Gamma_(med r theta)^r bold(e)_r + Gamma_(med r theta)^theta bold(e)_theta = 1 / r bold(e)_theta\
frac(partial bold(e)_theta, partial r) & = Gamma_(med theta r)^r bold(e)_r + Gamma_(med theta r)^theta bold(e)_theta = 1 / r bold(e)_theta\
frac(partial bold(e)_theta, partial theta) & = Gamma_(med theta theta)^r bold(e)_r + Gamma_(med theta theta)^theta bold(e)_theta = - r bold(e)_r $
$ A_(med ; alpha)^alpha & = frac(partial A^alpha, partial alpha) + Gamma_(med mu alpha)^alpha A^mu\
 & = frac(partial A^r, partial r) + frac(partial A^theta, partial theta) + 1 / r A^r\
 & = 1 / r frac(partial, partial r) \( r A^r \) + frac(partial, partial theta) A^theta $
]
== 局所平坦性定理
<局所平坦性定理>
#theorem[
任意の計量 $g_(alpha beta)$
は座標変換することである点で平坦な計量となる。
$ \( eta_(mu nu) \) = mat(delim: "(", - 1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) $
]
#proof[
一般相対論において計量は 3 つの正の固有値と 1
つの負の固有値を持つ。これより任意の計量 $g_(alpha beta)$
に対して次のように定式化できる。
$ g_(mu nu) \( x^gamma \) = Lambda_(med mu)^alpha Lambda_(med nu)^beta g_(alpha beta) & = eta_(mu nu) + O \[ \( x^gamma - cal(P) \)^2 \] $
つまり次のように書ける。
$ g_(mu nu) \|_(cal(P)) & = Lambda_(med mu)^alpha \|_(cal(P)) Lambda_(med nu)^beta \|_(cal(P)) g_(alpha beta) \|_(cal(P)) = eta_(mu nu)\
g_(mu nu \, gamma) \|_(cal(P)) & = 0\
g_(mu nu \, gamma lambda) \|_(cal(P)) & eq.not 0 $ これらはそれぞれ $10$
個、$10 times 4 = 40$ 個、$10 times 10 = 100$ 個の独立な成分を持つ。
それぞれのテンソルをテイラー展開する。
$ Lambda_(med mu)^alpha & = Lambda_(med mu)^alpha \|_(cal(P)) + \( x^gamma - x_0^gamma \) frac(partial Lambda_(med mu)^alpha, partial x^gamma) \[ cal(P) \] + 1 / 2 \( x^gamma - x_0^gamma \) \( x^lambda - x_0^lambda \) frac(partial Lambda_(med mu)^alpha, partial x^lambda \, x^gamma) \[ cal(P) \] + dots.h.c\
 & = Lambda_(med mu)^alpha \|_(cal(P)) + \( x^gamma - x_0^gamma \) frac(partial x^alpha, partial x^gamma \, x^mu) \[ cal(P) \] + 1 / 2 \( x^gamma - x_0^gamma \) \( x^lambda - x_0^lambda \) frac(partial x^alpha, partial x^lambda \, x^gamma \, x^mu) \[ cal(P) \] + dots.h.c\
g_(alpha beta) \( x \) & = g_(alpha beta) \|_(cal(P)) + \( x^gamma - x_0^gamma \) frac(partial g_(alpha beta), partial x^gamma) \[ cal(P) \] + 1 / 2 \( x^gamma - x_0^gamma \) \( x^lambda - x_0^lambda \) frac(partial g_(alpha beta), partial x^lambda \, x^gamma) \[ cal(P) \] + dots.h.c\
g_(mu nu) \( x \) & = \[ Lambda_(med mu)^alpha Lambda_(med nu)^beta g_(alpha beta) \]_(cal(P)) + \( x^gamma - x_0^gamma \) [Lambda_(med mu)^alpha Lambda_(med nu)^beta g_(alpha beta \, lambda) + Lambda_(med mu)^alpha Lambda_(med nu \, lambda)^beta g_(alpha beta) + Lambda_(med mu \, lambda)^alpha Lambda_(med nu)^beta g_(alpha beta)]_(cal(P))\
 & + 1 / 2 \( x^gamma - x_0^gamma \) \( x^lambda - x_0^lambda \) \[ dots.h.c \]_(cal(P)) + dots.h.c $
$Lambda_(med mu)^alpha \|_(cal(P))$,
$Lambda_(med mu \, gamma)^alpha \|_(cal(P))$,
$Lambda_(med mu \, gamma lambda)^alpha \|_(cal(P))$
は偏微分の対称性よりそれぞれ $4 times 4 = 16$ 個、$4 times 10 = 40$
個、$4 times 20 = 80$ 個を持つ。
$ g_(mu nu) \|_(cal(P)) & = Lambda_(med mu)^alpha \|_(cal(P)) Lambda_(med nu)^beta \|_(cal(P)) g_(alpha beta) \|_(cal(P)) = eta_(mu nu) $
の 10 個の方程式を満たすことは $Lambda_(med mu)^alpha \|_(cal(P))$ の 16
個の成分によってできる。残りの 6
個の成分はローレンツ変換の自由度に対応している。(速度の 3
成分とある軸による回転の 3 成分)
$ g_(mu nu \, gamma) \|_(cal(P)) & = 0 $ については 40 個と 40
個でなんとか満たすことができる。
$ g_(mu nu \, gamma lambda) \|_(cal(P)) & = 0 $ を満たすことについては
100 個に対して 80 個で不可能である。
]

#proposition[
長さ $upright(d) l$ と体積
$upright(d) x^0 upright(d) x^1 upright(d) x^2 upright(d) x^3$ について
$ upright(d) l & = lr(|bold(A)|) upright(d) lambda\
upright(d) x^0 upright(d) x^1 upright(d) x^2 upright(d) x^3 & = sqrt(- g) upright(d) x'^0 upright(d) x'^1 upright(d) x'^2 upright(d) x'^3 $
]
#proof[
長さ $upright(d) l$ を計算する。
$ upright(d) l & = \| g_(alpha beta) upright(d) x^alpha upright(d) x^beta \|^(1 \/ 2)\
 & = lr(|g_(alpha beta) frac(upright(d) x^alpha, upright(d) lambda) frac(upright(d) x^beta, upright(d) lambda)|)^(1 \/ 2) upright(d) lambda\
 & = lr(|g_(alpha beta) A^alpha A^beta|)^(1 \/ 2) upright(d) lambda\
 & = sqrt(\| bold(A)^2 \|) upright(d) lambda $ 体積
$upright(d) x^0 upright(d) x^1 upright(d) x^2 upright(d) x^3$ について
$ upright(d) x^0 upright(d) x^1 upright(d) x^2 upright(d) x^3 & = frac(partial \( x^0 \, x^1 \, x^2 \, x^3 \), partial \( x'^0 thin x'^1 thin x'^2 thin x'^3 \)) upright(d) x'^0 upright(d) x'^1 upright(d) x'^2 upright(d) x'^3\
 & = mat(delim: bar.double, partial x^0 \/ partial x'^0, partial x^0 \/ partial x'^1, partial x^0 \/ partial x'^2, partial x^0 \/ partial x'^3; partial x^1 \/ partial x'^0, partial x^1 \/ partial x'^1, partial x^1 \/ partial x'^2, partial x^1 \/ partial x'^3; partial x^2 \/ partial x'^0, partial x^2 \/ partial x'^1, partial x^2 \/ partial x'^2, partial x^2 \/ partial x'^3; partial x^3 \/ partial x'^0, partial x^3 \/ partial x'^1, partial x^3 \/ partial x'^2, partial x^3 \/ partial x'^3) upright(d) x'^0 upright(d) x'^1 upright(d) x'^2 upright(d) x'^3\
 & = det \( Lambda_(med beta)^alpha \) upright(d) x'^0 upright(d) x'^1 upright(d) x'^2 upright(d) x'^3 $
$det \( Lambda_(med beta)^alpha \)$ について計算すると
$ \( g_(alpha beta) \) & = \( Lambda_(med beta)^alpha \) \( eta_(alpha beta) \) \( Lambda_(med beta)^alpha \)^T\
g = det \( g_(alpha beta) \) & = det \( Lambda_(med beta)^alpha \) det \( eta_(alpha beta) \) det \( Lambda_(med beta)^alpha \) = - det \( Lambda_(med beta)^alpha \)^2\
det \( Lambda_(med beta)^alpha \) & = sqrt(- g) $ となるから
$ upright(d) x^0 upright(d) x^1 upright(d) x^2 upright(d) x^3 & = sqrt(- g) upright(d) x'^0 upright(d) x'^1 upright(d) x'^2 upright(d) x'^3 $
となる。
]

#block[
局所慣性系 ある点 $cal(P)$ が局所慣性系となっているとき
$ g_(alpha beta) & = eta_(alpha beta)\
g_(alpha beta \, mu) & = 0 arrow.r.double.long Gamma_(med alpha beta)^mu = 0 $

]
#theorem("発散の公式")[
$ A_(med ; alpha)^alpha & = 1 / sqrt(- g) \( sqrt(- g) A^mu \)_(\, mu) $
]
#proof[
$ Gamma_(med mu alpha)^alpha & = 1 / 2 g^(alpha beta) \( g_(mu beta \, alpha) + g_(alpha beta \, mu) - g_(mu alpha \, beta) \)\
 & = 1 / 2 underbrace(g^(alpha beta), "対称") underbrace(\( g_(mu beta \, alpha) - g_(mu alpha \, beta) \), "反対称") + 1 / 2 g^(alpha beta) g_(alpha beta \, mu)\
 & = 1 / 2 g^(alpha beta) g_(alpha beta \, mu)\
 & = 1 / sqrt(- g) \( sqrt(- g) \)_(\, mu) #h(2em) \( g_(\, mu) = g g^(alpha beta) g_(alpha beta \, mu) \) $
$ A_(med ; alpha)^alpha & = A_(med \, alpha)^alpha + A^mu Gamma_(med mu alpha)^alpha\
 & = A_(med \, alpha)^alpha + 1 / sqrt(- g) A^mu \( sqrt(- g) \)_(\, mu)\
 & = 1 / sqrt(- g) \( sqrt(- g) A^mu \)_(\, mu) $
] 測地線
$ V^alpha \( B \) - V^alpha \( A \) & = integral_A^B frac(partial V^alpha, partial x^1) upright(d) x^1 = - integral_(x^2 = b) Gamma_(med mu 1)^alpha V^mu upright(d) x^1 $
$ delta V^alpha & = "最初に" delta a bold(e)_sigma \, "次に" delta b bold(e)_lambda \, "そして" - delta a bold(e)_sigma \, "最後に" - delta b bold(e)_lambda "の移動による" V^alpha "の変化"\
 & = - integral_(x^lambda = b) Gamma_(med mu sigma)^alpha V^mu upright(d) x^sigma - integral_(x^sigma = a + delta a) Gamma_(med mu lambda)^alpha V^mu upright(d) x^lambda + integral_(x^lambda = b + delta b) Gamma_(med mu sigma)^alpha V^mu upright(d) x^sigma + integral_(x^sigma = a) Gamma_(med mu lambda)^alpha V^mu upright(d) x^lambda\
 & approx integral_a^(a + delta a) delta b frac(partial, partial x^lambda) \( Gamma_(med mu sigma)^alpha V^mu \) upright(d) x^sigma + integral_b^(b + delta b) delta a frac(partial, partial x^sigma) \( Gamma_(med mu lambda)^alpha V^mu \) upright(d) x^lambda\
 & approx delta a delta b [frac(partial, partial x^lambda) \( Gamma_(med mu sigma)^alpha V^mu \) - frac(partial, partial x^sigma) \( Gamma_(med mu lambda)^alpha V^mu \)]\
 & = delta a delta b \[ Gamma_(med mu sigma \, lambda)^alpha - Gamma_(med mu lambda \, sigma)^alpha + Gamma_(med nu lambda)^alpha Gamma_(med mu sigma)^nu - Gamma_(med nu sigma)^alpha Gamma_(med mu lambda)^nu \] V^mu $
$ \[ nabla_alpha \, nabla_beta \] V^mu = R_(nu alpha beta)^mu V^nu $

#definition("リーマンの曲率テンソル")[
ぱっと見テンソルではないけどテンソルとなる。
$ R_(med beta mu nu)^alpha & = Gamma_(med beta nu \, mu)^alpha - Gamma_(med beta mu \, nu)^alpha + Gamma_(med sigma mu)^alpha Gamma_(med beta nu)^sigma - Gamma_(med sigma nu)^alpha Gamma_(med beta mu)^nu\
R_(alpha beta mu nu) & = g_(alpha lambda) R_(med beta mu nu)^lambda $
$ R_(med beta mu nu)^alpha = 0 arrow.l.r.double "平坦な多様体" $
]
#theorem[
$  & R_(alpha beta mu nu) = - R_(beta alpha mu nu) = - R_(alpha beta nu mu) = R_(mu nu alpha beta)\
 & R_(alpha beta mu nu) + R_(alpha nu beta mu) + R_(alpha mu nu beta) = 0\
 & R_(alpha beta mu nu ; lambda) + R_(alpha beta lambda mu ; nu) + R_(alpha beta nu lambda ; mu) = 0 $
]
局所慣性系において $Gamma_(med mu nu)^alpha = 0$ であるから
$ R_(med beta mu nu)^alpha & = Gamma_(med beta nu \, mu)^alpha - Gamma_(med beta mu \, nu)^alpha\
 & = 1 / 2 g^(alpha sigma) \( g_(sigma beta \, mu nu) + g_(sigma nu \, beta mu) - g_(beta nu \, sigma mu) \) - 1 / 2 g^(alpha sigma) \( g_(sigma beta \, nu mu) + g_(sigma mu \, beta nu) - g_(beta mu \, sigma nu) \)\
 & = 1 / 2 g^(alpha sigma) (g_(sigma nu \, beta mu) - g_(sigma mu \, beta nu) + g_(beta mu \, sigma nu) - g_(beta nu \, sigma mu))\
R_(alpha beta mu nu) & = g_(alpha lambda) R_(med beta mu nu)^lambda = 1 / 2 (g_(alpha nu \, beta mu) - g_(alpha mu \, beta nu) + g_(beta mu \, alpha nu) - g_(beta nu \, alpha mu))\
R_(alpha beta mu nu \, lambda) & = 1 / 2 (g_(alpha nu \, beta mu lambda) - g_(alpha mu \, beta nu lambda) + g_(beta mu \, alpha nu lambda) - g_(beta nu \, alpha mu lambda)) $
これらについて次のような関係式が成り立つ。
$  & R_(alpha beta mu nu) = - R_(beta alpha mu nu) = - R_(alpha beta nu mu) = R_(mu nu alpha beta)\
 & R_(alpha beta mu nu) + R_(alpha nu beta mu) + R_(alpha mu nu beta) = 0\
 & R_(alpha beta mu nu \, lambda) + R_(alpha beta lambda mu \, nu) + R_(alpha beta nu lambda \, mu) = 0 $
これよりテンソル方程式
$ R_(alpha beta mu nu ; lambda) + R_(alpha beta lambda mu ; nu) + R_(alpha beta nu lambda ; mu) = 0 $
これをビアンキの恒等式という。

#definition[
$ R_(alpha beta) & = R_(med alpha mu beta)^mu = R_(beta alpha)\
R & = g^(mu nu) R_(mu nu) = g^(mu nu) g^(alpha beta) R_(alpha mu beta nu)\
G^(alpha beta) & = R^(alpha beta) - 1 / 2 g^(alpha beta) R $
]
ビアンキ恒等式に対して $alpha mu$、$beta nu$ の順に縮約を取ると
$ R_(alpha beta mu nu ; lambda) + R_(alpha beta lambda mu ; nu) + R_(alpha beta nu lambda ; mu) = 0 $
$  & quad med g^(beta nu) g^(alpha mu) \[ R_(alpha beta mu nu ; lambda) + R_(alpha beta lambda mu ; nu) + R_(alpha beta nu lambda ; mu) \]\
 & = g^(beta nu) \[ R_(beta nu ; lambda) + \( - R_(beta lambda \; nu) \) + R_(med beta nu lambda ; mu)^mu \]\
 & = R_(; lambda) + \( - R_(med lambda \; nu)^nu \) + \( - R_(med lambda \; mu)^mu \)\
 & = R_(; lambda) - 2 R_(med lambda ; mu)^mu\
 & = (delta_lambda^mu R - 2 R_(med lambda)^mu)_(; mu)\
 & = g_(lambda gamma) (g^(mu gamma) R - 2 R^(mu gamma))_(; mu) $
これはアインシュタイン・テンソルを用いて
$ (delta_lambda^mu R - 2 R_(med lambda)^mu)_(; mu) & = - 2 g_(lambda gamma) (R^(mu gamma) - 1 / 2 g^(mu gamma) R)_(; mu) = 0\
G_(med med ; beta)^(alpha beta) & = 0 $ となる。

== 曲がった時空での物理
<曲がった時空での物理>
+ 時空 (すべての事象の集合) は、メトリックをもった四次元多様体である。

+ メトリックは棒と時計で測ることができる。二つの近傍の点の間の棒に沿った距離は
  $\| upright(d) x^2 \|^(1 \/ 2)$
  であり、短時間に引き続いて起こる二つの事象を通過した時計の測る、それらの時間間隔は、$\| - upright(d) x^2 \|^(1 \/ 2)$
  である。

+ 時空のメトリックは、適当な座標系を選ぶことによって任意の一点でローレンツ系での形
  $eta_(alpha beta)$ とすることである。

+ アインシュタインの等価原理:
  重力作用を考えなくてよい局所的な物理実験はどんなものであっても自由落下する慣性系で測定すれば、特殊相対論の成り立つ平坦な時空でなされる実験と同じ結果を与える。

特殊相対論における粒子、エントロピー、四元運動量の保存則は次のように表された。
$ \( n U^alpha \)_(\, alpha) & = 0\
U^alpha S_(\, alpha) & = 0\
T_(quad \, nu)^(mu nu) & = 0 $
これはアインシュタインの等価原理によってテンソル方程式が成り立つ。
$ \( n U^alpha \)_(; alpha) & = 0\
U^alpha S_(; alpha) & = 0\
T_(quad ; nu)^(mu nu) & = 0 $

$ T^(mu nu) & = \( rho + p \) U^mu U^nu + p g^(mu nu) $
$ upright(d) s^2 = - \( 1 + 2 phi.alt \) upright(d) t^2 + \( 1 - 2 phi.alt \) \( upright(d) x^2 + upright(d) y^2 + upright(d) z^2 \) $
