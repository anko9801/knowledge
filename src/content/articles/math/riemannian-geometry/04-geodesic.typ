#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "まっすぐと最短は、別の定義である",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 4,
  tags: ("Riemann 幾何",),
  summary: "測地線には二つの定義がある。自分自身に平行な曲線（まっすぐ）と、長さが停留する曲線（最短）。前者は接続、後者は計量だけを使う。Levi-Civita 接続のもとで、この二つが一致する。",
  provides: (
    "geodesic",
    "exponential-map",
    "geodesic-deviation",
  ),
  requires: (
    "connection",
    "covariant-derivative",
    "arc-length",
  ),
)

= 二つの「まっすぐ」

平面で直線を定義する方法は、少なくとも二つある。

+ #strong[向きを変えずに進む]。速度ベクトルが変化しない
+ #strong[二点間を最短で結ぶ]

平面では同じものになる。曲がった空間ではどうか。
そもそも二つの定義は、使っている構造が違う。

#table(
  columns: (auto, 1fr),
  [向きを変えない], [接続が要る。平行移動の言葉],
  [最短], [計量が要る。長さの言葉],
)

前回、計量から接続が一意に決まることを見た（Levi-Civita）。
だから二つが一致してくれそうだが、それは定理であって自明ではない。

= 定義その一：自分自身に平行

#definition[
  曲線 $gamma$ が
  $ nabla_(dot(gamma)) dot(gamma) = 0 $
  を満たすとき、$gamma$ を#strong[測地線]と呼ぶ。
]<def:geodesic>

「速度ベクトルを、自分自身の方向へ平行移動しても変わらない」ということである。
成分で書くと
$ dot.double(x)^k + Gamma^k{}_(i j) dot(x)^i dot(x)^j = 0 $
になる。これが#strong[測地線方程式]である。

前回の極座標の例を思い出すと、$Gamma = 0$ の座標——デカルト座標——では
$dot.double(x) = 0$、すなわち等速直線運動になる。
自由粒子の運動方程式そのものである。

#example[球面の測地線][
  単位球面 $g = dif theta^2 + sin^2 theta thin dif phi.alt^2$ で
  前回の Christoffel 記号の公式を計算すると
  $ Gamma^theta{}_(phi.alt phi.alt) = -sin theta cos theta, quad
    Gamma^phi.alt{}_(theta phi.alt) = cot theta $
  である。測地線方程式を解くと、解は#strong[大円]になる。

  赤道は測地線だが、それ以外の緯線は測地線でない。
  飛行機の航路が地図の上で曲がって見えるのは、
  地図（メルカトル図法）が計量を歪めているからである。
]

= 定義その二：長さが停留する

#theorem[
  端点を固定した曲線のうち、長さ
  $ L(gamma) = integral sqrt(g_(i j) dot(x)^i dot(x)^j) thin dif t $
  が停留するものは、（弧長でパラメータ付けすれば）@def:geodesic の測地線である。
]<thm:variational>

#proof[
  $L$ の停留条件を直接扱うと、パラメータ付けの自由度のぶんだけ式が煩雑になる。
  代わりに
  $ E(gamma) := frac(1, 2) integral g_(i j) dot(x)^i dot(x)^j thin dif t $
  の停留条件を考える（$E$ を#strong[エネルギー汎関数]と呼ぶ）。

  Euler--Lagrange 方程式は
  $ frac(dif, dif t)(g_(k j) dot(x)^j) - frac(1, 2) partial_k g_(i j) dot(x)^i dot(x)^j = 0 $
  であり、左辺第一項を展開して整理すると
  $ g_(k l) (dot.double(x)^l + frac(1,2) g^(l m)
    (partial_i g_(j m) + partial_j g_(i m) - partial_m g_(i j)) dot(x)^i dot(x)^j) = 0 $
  になる。括弧の中は前回の Christoffel 記号の式そのもので、測地線方程式に一致する。

  $L$ と $E$ の停留点が（弧長パラメータのもとで）一致することは、
  Cauchy--Schwarz の不等式から従う。
]

#link("/physics/mechanics/2")[解析力学 第 2 回]の変分原理が、そのまま使えた。
$E$ を作用、$g_(i j) dot(x)^i dot(x)^j \/ 2$ をラグランジアンと見れば、
測地線方程式は Euler--Lagrange 方程式である。

#strong[Christoffel 記号を計算する実用的な方法]としても、これが最短である。
前回の Christoffel 記号の公式に $g$ を代入するより、
$E$ の Euler--Lagrange 方程式を書き下して $dot(x)^i dot(x)^j$ の係数を読むほうが速い。

#remark[
  「最短」と書いたが、正確には#strong[停留]である。
  球面上で二点を結ぶ大円は二本あり、長いほうも測地線になる。
  #link("/physics/mechanics/2")[解析力学 第 2 回]で
  「最小作用の『最小』は嘘で、正しくは停留」と書いたのと同じ事情である。

  十分近い二点なら最短になる。これは局所的な主張で、大域的には成り立たない。
]

= 局所的には平坦に見える

測地線を使うと、前回述べた正規座標が具体的に作れる。

#definition[
  点 $p$ の接空間のベクトル $v$ に対し、
  $p$ から $v$ 方向へ出る測地線をパラメータ $1$ まで進んだ点を
  $exp_p (v)$ と書く。これを#strong[指数写像]と呼ぶ。
]<def:exp>

$exp_p$ は $p$ の近くで微分同相になるので、
接空間の座標をそのまま多様体の座標として使える。
この座標では
$ g_(i j)(p) = delta_(i j), quad Gamma^k{}_(i j)(p) = 0 $
が成り立つ。#strong[測地線を座標軸にすれば、その点で平坦に見える]わけである。

前回、正規座標の存在を述べて構成を後回しにした。指数写像がその構成である。

そして消えないものが、次の展開で出る。
$ g_(i j)(x) = delta_(i j) - frac(1, 3) R_(i k j l) x^k x^l + O(x^3) $
一階の項は消せたが、#strong[二階の項に曲率が残る]。
どんな座標を選んでも、この項までは消せない。
「一点で平坦にできる」の限界が、この展開の形で見えている。

= 測地線が離れていく

曲率が測れる形で現れる場面を、一つだけ先に見ておく。

隣り合う二本の測地線を考える。
その間隔を表すベクトル $xi$ の変化を追うと
$ frac(D^2 xi, dif tau^2) = R(dot(gamma), xi) dot(gamma) $
という式が出る（#strong[測地線偏差の方程式]）。右辺の $R$ が曲率である。

#table(
  columns: (auto, 1fr),
  [平坦], [$R = 0$。平行な測地線はいつまでも平行],
  [球面], [$R > 0$。二本の経線は極で交わる],
  [双曲平面], [$R < 0$。測地線は指数的に離れていく],
)

ここが重要である。#strong[$Gamma$ は一点で消せるが、測地線の離れ方は消せない。]
一本の測地線だけ見ていると、その上ではいつでも「まっすぐ進んでいる」ように書けるが、
二本並べると差が出る。座標をどう選んでも消えないので、これは対象の性質である。

球面上の二本の経線は、赤道で平行に出発しても極で必ず交わる。
どんな地図の描き方をしても、この事実は変わらない。

= まとめ

#table(
  columns: (auto, 1fr),
  [測地線], [$nabla_(dot(gamma)) dot(gamma) = 0$。接続の言葉],
  [同値な特徴づけ], [長さ（あるいはエネルギー）の停留。計量の言葉],
  [実用], [$E$ の Euler--Lagrange 方程式から $Gamma$ を読む],
  [指数写像], [測地線で座標を張ると、一点で平坦に見える],
  [測地線偏差], [近い測地線が離れる率が曲率。座標では消せない],
)

次回、その曲率を正面から定義する。
出発点は「平行移動が経路に依る」という、前回の宿題である。
