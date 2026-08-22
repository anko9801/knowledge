#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "計量を入れる",
  date: "2026-08-20",
  field: "math",
  series: "vector-analysis",
  order: 5,
  tags: ("ベクトル解析",),
  summary: "Hodge スターを定義すると、grad・div・rot が d と ⋆ の組み合わせとして書ける。すると曲線座標の公式集は覚えるものではなくなる。球座標の Laplacian にあの 1/r² が付く理由も、√g の一語で片付く。",
  provides: (
    "hodge-star",
    "curvilinear-coordinates",
    "laplacian",
  ),
  requires: (
    "exterior-derivative",
    "inner-product",
  ),
)

= 公式集を覚えたくない

物理の教科書には、たいてい巻末に公式集が付いている。

$ nabla^2 f = frac(1, r^2) frac(partial, partial r)(r^2 frac(partial f, partial r))
  + frac(1, r^2 sin theta) frac(partial, partial theta)(sin theta frac(partial f, partial theta))
  + frac(1, r^2 sin^2 theta) frac(partial^2 f, partial phi.alt^2) $

球座標の Laplacian である。円筒座標のもある。div も rot も grad もある。
全部で数十本。覚えるものではなく引くものだ、と割り切って使ってきた。

だが、$1 \/ r^2$ や $sin theta$ がどこから来たのかは分からないままだった。
デカルト座標では
$ nabla^2 f = partial_x^2 f + partial_y^2 f + partial_z^2 f $
と対称なのに、座標を替えるだけでこんな形になる。

答えを先に書く。#strong[出どころは一つ、体積の測り方 $sqrt(g)$ である。]

そしてそれを式にするために、#link("/math/vector-analysis/1")[第 1 回]から
名前だけ出して保留にしてきた $star$ を、ここで定義する。

= Hodge スター

#link("/math/linear-algebra/6")[線形代数 第 6 回]で一般の定義を与えたが、
$3$ 次元では表で書けてしまう。

#definition[
  正の向きの正規直交な基底 $1$ 形式 $theta^1, theta^2, theta^3$ に対して
  $ star 1 = theta^1 and theta^2 and theta^3, quad
    star theta^1 = theta^2 and theta^3, quad
    star (theta^1 and theta^2) = theta^3, quad
    star (theta^1 and theta^2 and theta^3) = 1 $
  および添字の巡回で $star$ を定める。線形に延ばす。
]<def:hodge3>

「残りの方向を取る」操作である。
$theta^1$ に対しては $theta^2 and theta^3$、というふうに、補集合を返す。

$3$ 次元では $star star = upright("id")$ になる。
この $star$ を挟むと、grad・div・rot がすべて $dif$ で書ける。

#theorem[
  ベクトル場 $bold(A)$ に対応する $1$ 形式を $omega = flat bold(A)$ とすると
  $ nabla f = sharp (dif f), quad
    nabla times bold(A) = sharp star dif omega, quad
    nabla dot bold(A) = star dif star omega $
  さらに
  $ nabla^2 f = star dif star dif f $
]<thm:operators>

#proof[
  第 1 式は $flat$ と $sharp$ の定義である。
  第 2 式は #link("/math/vector-analysis/3")[第 3 回]で
  $dif omega$ の成分が $nabla times bold(A)$ になることを見た。
  $2$ 形式をベクトルに戻すのに $star$ が要る。
  第 3 式も同じく第 3 回で、$2$ 形式 $star omega$ の外微分の係数が $nabla dot bold(A)$ になった。
  最後に $Lambda^3$ を数に戻すのが $star$ である。
  Laplacian は $nabla dot (nabla f)$ を書き下したものにほかならない。
]

$dif$ には計量が要らないのに、この三つの式にはすべて $star$ か $sharp$ が入っている。
#strong[grad・div・rot が計量に依るのは、この $star$ と $sharp$ のせい]である。

= 直交曲線座標

準備ができたので、公式集を導く。

#definition[
  座標 $(u^1, u^2, u^3)$ が直交曲線座標であるとは、線素が
  $ dif s^2 = h_1^2 (dif u^1)^2 + h_2^2 (dif u^2)^2 + h_3^2 (dif u^3)^2 $
  の形に書けることをいう。$h_i$ を#strong[スケール因子]と呼ぶ。
]<def:scale>

#table(
  columns: (auto, auto, 1fr),
  [デカルト], [$(x, y, z)$], [$h_1 = h_2 = h_3 = 1$],
  [円筒], [$(rho, phi.alt, z)$], [$h_1 = 1$, $h_2 = rho$, $h_3 = 1$],
  [球], [$(r, theta, phi.alt)$], [$h_1 = 1$, $h_2 = r$, $h_3 = r sin theta$],
)

スケール因子は「座標を $1$ 動かすと、実際の距離がどれだけ動くか」である。
角度を $1$ ラジアン動かすと、半径 $r$ の場所では距離が $r$ 動く。だから $h = r$ になる。

正規直交な基底 $1$ 形式は
$ theta^i = h_i thin dif u^i quad (upright("和を取らない")) $
であり、体積形式は
$ upright("vol") = theta^1 and theta^2 and theta^3 = h_1 h_2 h_3 thin dif u^1 and dif u^2 and dif u^3 $
になる。この $h_1 h_2 h_3$ が $sqrt(g)$ である。

#check[
  Laplacian はデカルト座標では三つの二階微分の和で、完全に対称である。
  球座標にすると $1 \/ r^2$ や $sin theta$ が付く。
  座標は名前の付け替えでしかないはずである。
  #strong[それなのに形が変わるのはなぜか。]
][
  #strong[変わったのは演算子ではなく、体積の測り方である。]

  @thm:operators より $nabla^2 = star dif star dif$ で、$dif$ には計量が要らない。
  変わりうるのは $star$ のほうしかない。

  そして $star$ は体積形式を使う。上の $upright("vol") = h_1 h_2 h_3 thin dif u^1 and dif u^2 and dif u^3$ が
  それで、$h_1 h_2 h_3$ が座標ごとに違う。球座標なら $r^2 sin theta$ である。
  #strong[公式集に出てくる $1 \/ r^2$ と $sin theta$ は、全部ここから来ている。]

  だから覚えるものは一つしかない。スケール因子を書き下せば、
  @thm:curvilinear が残りを出す。円筒座標も、楕円座標も、同じ一本から出る。
]

#theorem[
  直交曲線座標で
  $ (nabla f)_i = frac(1, h_i) frac(partial f, partial u^i) $
  $ nabla dot bold(A) = frac(1, h_1 h_2 h_3) [
      frac(partial, partial u^1)(h_2 h_3 A_1)
    + frac(partial, partial u^2)(h_3 h_1 A_2)
    + frac(partial, partial u^3)(h_1 h_2 A_3) ] $
  $ nabla^2 f = frac(1, h_1 h_2 h_3) [
      frac(partial, partial u^1)(frac(h_2 h_3, h_1) frac(partial f, partial u^1))
    + frac(partial, partial u^2)(frac(h_3 h_1, h_2) frac(partial f, partial u^2))
    + frac(partial, partial u^3)(frac(h_1 h_2, h_3) frac(partial f, partial u^3)) ] $
]<thm:curvilinear>

#proof[
  #strong[勾配。] $dif f = sum_i (partial f \/ partial u^i) dif u^i$ を
  正規直交な基底で書き直す。$dif u^i = theta^i \/ h_i$ なので
  $ dif f = sum_i frac(1, h_i) frac(partial f, partial u^i) thin theta^i $
  となり、成分が主張の形になる。

  #strong[発散。] $omega = sum_i A_i theta^i = sum_i A_i h_i thin dif u^i$ である。
  @def:hodge3 より
  $ star omega = A_1 theta^2 and theta^3 + dots.c
    = A_1 h_2 h_3 thin dif u^2 and dif u^3 + dots.c $
  これに $dif$ を当てると、@def:scale の座標では基底 $dif u^i$ が定数なので係数だけが微分され、
  $ dif star omega = [partial_1 (A_1 h_2 h_3) + partial_2 (A_2 h_3 h_1) + partial_3 (A_3 h_1 h_2)]
    thin dif u^1 and dif u^2 and dif u^3 $
  となる。最後に $star$ で数に戻すとき、体積形式が $h_1 h_2 h_3 thin dif u^1 and dif u^2 and dif u^3$
  なので、$1 \/ h_1 h_2 h_3$ が掛かる。

  #strong[Laplacian。] 勾配の結果を発散の式の $A_i$ に代入すればよい。
]

証明の中で $h$ が現れた場所は二つだけである。
#strong[$theta^i = h_i thin dif u^i$ で基底を正規化したところと、
体積形式が $h_1 h_2 h_3$ 倍になったところ]。公式集の複雑さは全部そこから来ている。

#example[球座標の Laplacian][
  @thm:curvilinear に $h_1 = 1$、$h_2 = r$、$h_3 = r sin theta$ を入れる。
  $ frac(h_2 h_3, h_1) = r^2 sin theta, quad
    frac(h_3 h_1, h_2) = sin theta, quad
    frac(h_1 h_2, h_3) = frac(1, sin theta) $
  であり、$h_1 h_2 h_3 = r^2 sin theta$ なので
  $ nabla^2 f = frac(1, r^2 sin theta) [
      partial_r (r^2 sin theta thin partial_r f)
    + partial_theta (sin theta thin partial_theta f)
    + partial_phi.alt (frac(1, sin theta) partial_phi.alt f) ] $
  $sin theta$ は $r$ にも $phi.alt$ にも依らないので前の二項から括り出せて、
  冒頭に挙げた形になる。
]

$1 \/ r^2$ の出どころは $h_1 h_2 h_3 = r^2 sin theta$、
すなわち#strong[球座標の体積要素]だった。
$dif V = r^2 sin theta thin dif r thin dif theta thin dif phi.alt$ を知っていれば、
公式の形はもう半分決まっている。

#remark[
  同じ理由で、$n$ 次元球座標の動径方向の Laplacian は
  $ frac(1, r^(n-1)) frac(partial, partial r)(r^(n-1) frac(partial f, partial r)) $
  になる。$r^(n-1)$ は球面の面積の $r$ 依存性である。
  拡散方程式の解が次元によって振る舞いを変えるのも、この一箇所から来る。
]

= 計量が入る場所を数える

この回で使った計量を並べておく。

#table(
  columns: (auto, 1fr),
  [$flat$ と $sharp$], [ベクトル場と $1$ 形式を行き来する],
  [$star$], [$Lambda^k$ と $Lambda^(n-k)$ を行き来する。向きも要る],
  [$theta^i$ の正規化], [「長さ $1$」を決めるのに計量が要る],
  [体積形式], [$sqrt(g) = h_1 h_2 h_3$],
)

いっぽう $dif$ は一度も計量を使っていない。
#link("/math/vector-analysis/3")[第 3 回]の $dif dif = 0$ も、Stokes の定理も、
座標を替えても形が変わらなかった。
#strong[座標ごとに書き換えが必要になったのは、$star$ を含む式だけ]である。

これが層を分ける実利である。
座標を替えたときに何が変わり、何が変わらないかを、あらかじめ知っていられる。

次回は最終回。$RR^3$ の外へ出て、この記法が通用しなくなる場面と、
それでも $dif$ の側だけは生き残る場面を見る。
熱力学と解析力学が、意外な形で出てくる。
