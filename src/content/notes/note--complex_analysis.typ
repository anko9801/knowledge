#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "複素解析",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/complex_analysis.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 複素関数
<複素関数>
この章では

== 複素数
<複素数>
高校では $i^2 = - 1$ を満たす $i$
を虚数単位といってこれを実数に付け加えたものを複素数と言っていました。これを代数の知識を用いて定義し直します。

#definition[
$bb(R) \[ x \] \/ \( x^2 + 1 \)$
を複素数体といい、 $bb(C)$ と書く。この元を複素数といい、 $x$ を虚数単位
(imaginary unit) といい、$i$ と書くことにする。このとき任意の元
$z in bb(C)$ は 2 つの実数 $x \, y in bb(R)$ を用いて $z = x + i y$
と表される。このとき関数 $Re \, Im$ を次のように定義する。 $ {x = Re z\
y = Im z $
]
#proposition[
複素数 $z_1 = x_1 + i y_1$, $z_2 = x_2 + i y_2$,
$z = x + i y$ とすると次が成り立つ。
$  & z_1 = z_2 arrow.l.r.double x_1 = x_2 and y_1 = y_2\
 & z_1 + z_2 = \( x_1 + x_2 \) + i \( y_1 + y_2 \)\
 & z_1 z_2 = \( x_1 x_2 - y_1 y_2 \) + i \( x_1 y_2 + x_2 y_1 \)\
 & z^(- 1) = frac(x, x^2 + y^2) - i frac(y, x^2 + y^2) $
]
#proof[
複素数体 $bb(C)$ において ${ 1 \, i }$
は基底となるから線形独立であり $x + i y = 0$ ならば $x = 0$ かつ $y = 0$
である。 これより次のようになる。
$ z_1 = z_2 & arrow.l.r.double z_1 - z_2 = 0 arrow.l.r.double \( x_1 - x_2 \) + i \( y_1 - y_2 \) = 0\
 & arrow.l.r.double x_1 - x_2 = 0 and y_1 - y_2 = 0 arrow.l.r.double x_1 = x_2 and y_1 = y_2 $
他の等式は計算すれば満たすことが分かる。
]

また交換法則、結合法則、分配法則を満たすことが分かるので $bb(C)$
は可換体です。

#definition[
複素数 $z = x + i y$ の絶対値 (absolute
value)、共役複素数 (complex conjugate) をそれぞれ次のように定義する。
$ \| z \| & = sqrt(x^2 + y^2)\
overline(z) & = x - i y $
]
#proposition[
複素数 $z \, z_1 \, z_2 in bb(C)$
に対して次の式が成り立つ。 $  & \| z \|^2 = z overline(z)\
 & lr(||) z_1 \| - \| z_2 \| \| lt.eq \| z_1 + z_2 \| lt.eq \| z_1 \| + \| z_2 \| $
]
#proof[
最初の式については $z = x + i y$
と置くと次のように表される。
$ \| z \|^2 = x^2 + y^2 = \( x + i y \) \( x - i y \) = z overline(z) $
次に第二式の各項についてそれぞれを二乗した値を比較する。
$ (\| z_1 \| - \| z_2 \|)^2 & = (sqrt(x_1^2 + y_1^2) - sqrt(x_2^2 + y_2^2))^2 = x_1^2 + y_1^2 + x_2^2 + y_2^2 - 2 sqrt(\( x_1^2 + y_1^2 \) \( x_2^2 + y_2^2 \))\
\| z_1 + z_2 \|^2 & = \( x_1 + x_2 \)^2 + \( y_1 + y_2 \)^2 = x_1^2 + x_2^2 + y_1^2 + y_2^2 + 2 \( x_1 x_2 + y_1 y_2 \)\
\( \| z_1 \| + \| z_2 \| \)^2 & = \| z_1 \|^2 + \| z_2 \|^2 + 2 \| z_1 \| \| z_2 \| = x_1^2 + y_1^2 + x_2^2 + y_2^2 + 2 sqrt(\( x_1^2 + y_1^2 \) \( x_2^2 + y_2^2 \)) $
ここで $x_1^2 y_2^2 + x_2^2 y_1^2 gt.eq 2 x_1 x_2 y_1 y_2$ であるから
$x^2 lt.eq y^2 arrow.r.double.long \| x \| lt.eq \| y \|$
より第二式が成り立つ。
]

無限遠点

リーマン面 リーマン球面

== 複素変数の関数
<複素変数の関数>
#theorem("コーシー・リーマンの方程式")[
複素変数の関数
$f \( z \) in bb(C) \( z \) = f \( x + i y \) = u \( x \, y \) + i v \( x \, y \)$
が $z = z_0$ で微分可能であるとき導関数 $f' \( z_0 \)$
は次のように書くことができる。
$ f' \( z_0 \) = lim_(Delta z arrow.r 0) frac(f \( z_0 + Delta z \) - f \( z_0 \), Delta z) $
このとき実関数 $u \, v$ は次の式を満たす。
$ frac(partial u, partial x) = frac(partial v, partial y) \, frac(partial u, partial y) = - frac(partial v, partial x) $
]
#proof[
$Delta z = Delta x + 0 i$
$ f' \( z_0 \) & = lim_(Delta z arrow.r 0) frac(f \( z_0 + Delta z \) - f \( z_0 \), Delta z)\
 & = lim_(Delta x arrow.r 0) frac(u \( x_0 + Delta x \, y_0 \) - u \( x_0 \, y_0 \) + i \( v \( x_0 + Delta x \, y_0 \) - v \( x_0 \, y_0 \) \), Delta x)\
 & = frac(partial u \( x_0 \, y_0 \), partial x) + i frac(partial v \( x_0 \, y_0 \), partial x) $
$Delta z = 0 + i Delta y$
$ f' \( z_0 \) & = lim_(Delta z arrow.r 0) frac(f \( z_0 + Delta z \) - f \( z_0 \), Delta z)\
 & = lim_(Delta y arrow.r 0) frac(u \( x_0 \, y_0 + Delta y \) - u \( x_0 \, y_0 \) + i \( v \( x_0 \, y_0 + Delta y \) - v \( x_0 \, y_0 \) \), i Delta y)\
 & = frac(partial v \( x_0 \, y_0 \), partial y) - i frac(partial u \( x_0 \, y_0 \), partial y) $
これより領域において次が成り立つ
$ frac(partial u, partial x) = frac(partial v, partial y) \, frac(partial u, partial y) = - frac(partial v, partial x) $
]

== 正則関数
<正則関数>
#theorem[
Riemman Roch の定理
]
#definition("初等関数")[
指数関数 $2 pi i$
周期で同じ $ f \( z \) = e^z = e^(x + i y) = e^x \( cos y + i sin y \) $
三角関数 $ sin z & := frac(e^(i z) - e^(- i z), 2 i)\
cos z & := frac(e^(i z) + e^(- i z), 2)\
tan z & := 1 / i frac(e^(i z) - e^(- i z), e^(i z) + e^(- i z)) $

双曲線関数 $ sinh z & := frac(e^z - e^(- z), 2)\
cosh z & := frac(e^z + e^(- z), 2)\
tanh z & := frac(e^z - e^(- z), e^z + e^(- z)) $

対数関数 $ log z & := log r + i theta #h(2em) \( z eq.not 0 \)\
theta & = arg z = "Arg" z + 2 n pi\
"Log" z & := log r + i "Arg" z $
]
#proposition[
$ sin^(- 1) z = - i log \( i z + \( 1 - z^2 \)^(1 \/ 2) \) $
]
#theorem("一致の定理")[
領域 $D$ で正則な関数
$f \( z \) \, g \( z \)$ があり、$D$
の小領域もしくは曲線上で一致しているとき、領域 $D$ 全体で
$f \( z \) = g \( z \)$ が成り立つ。
]
#proof[
$ f \( z \) & = sum_(n = 0)^oo frac(f^(\( n \)) \( z_0 \), n !) \( z - z_0 \)^n\
g \( z \) & = sum_(n = 0)^oo frac(g^(\( n \)) \( z_0 \), n !) \( z - z_0 \)^n $
]

#theorem("解析接続")[

]
