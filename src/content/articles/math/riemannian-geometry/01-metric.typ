#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "計量は空間の性質ではない",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 1,
  tags: ("Riemann 幾何",),
  summary: "同じ多様体に、いくらでも違う計量が入る。計量は測る道具であって、空間そのものではない。だから Riemann 計量は必ず存在するのに、Lorentz 計量には位相的な障害がある。",
)

#layer("L2 Riemann 多様体", metric: true)[ここから計量を使う。長さ・角度・体積・$star$ が戻る]

= 何が足りなかったか

#link("/math/differential-forms/7")[微分形式]の連載は、計量を一度も使わずに閉じた。
微分し、積分し、穴を数えるところまで行った。

それでもできないことがあった。

#table(
  columns: (auto, 1fr),
  [長さ], [曲線の長さ、ベクトルの大きさ],
  [角度], [直交、内積],
  [体積], [比ではなく絶対値としての体積],
  [$star$], [$Lambda^k$ と $Lambda^(n-k)$ の対応。div も rot も書けない],
  [まっすぐ], [測地線。平行移動],
)

この回で最初の四つを入れる。最後の一つは、計量を入れただけでは出てこない。
それが#link("/math/riemannian-geometry/3")[第 3 回]の主題になる。

= Riemann 計量

#definition[
  多様体 $M$ の各点 $p$ に、接空間 $T_p$ 上の内積 $g_p$ を滑らかに与えたものを
  #strong[Riemann 計量]と呼ぶ。座標で書けば
  $ g = g_(i j)(x) thin dif x^i times.o dif x^j $
  で、$g_(i j)$ は各点で対称正定値な行列である。
]<def:riemann>

#link("/math/linear-algebra/6")[線形代数 第 6 回]の内積を、各点に配っただけである。
新しい概念は入っていない。

#definition[
  曲線 $gamma : [a, b] arrow M$ の#strong[長さ]を
  $ L(gamma) := integral_a^b sqrt(g(dot(gamma), dot(gamma))) thin dif t $
  で定める。
]<def:length>

@def:length は、パラメータの取り方に依らない。
線素の記法では
$ dif s^2 = g_(i j) thin dif x^i thin dif x^j $
と書く。学部の力学で $dif s^2 = dif r^2 + r^2 dif theta^2$ と書いていたものが、
極座標での $g$ の成分表示だった。

#example[三つの計量][
  + #strong[平面。] $dif s^2 = dif x^2 + dif y^2$
  + #strong[単位球面。] $dif s^2 = dif theta^2 + sin^2 theta thin dif phi.alt^2$
  + #strong[双曲平面（上半平面）。] $dif s^2 = (dif x^2 + dif y^2) \/ y^2$

  三番目は $y arrow 0$ で長さが無限に伸びる。
  ユークリッド的には有限に見える距離が、この計量では無限に遠い。
  #strong[同じ集合に別の計量を入れると、別の幾何になる。]
]

= 計量は空間の性質ではない

この記事の見出しにした主張を、ここで書いておく。

@def:riemann は多様体に#strong[付け加える]構造である。
多様体そのものが持っている性質ではない。
同じ $RR^2$ に、平面の計量も双曲平面の計量も入る。

だから「この空間は曲がっている」という言い方は、正確には不完全である。
#strong[この計量のもとで曲がっている]と言わねばならない。

物理でこの区別が効く場面は多い。
一般相対論で決まるのは時空多様体そのものではなく、その上の計量である。
Einstein 方程式は $g_(mu nu)$ についての方程式であって、
多様体の位相は方程式が決めてくれない。

#remark[
  では位相はどう決まるのか。決まらない、というのが現状の答えである。
  時空の大域的な形（トポロジー）は、局所的な方程式からは決まらない。
  宇宙が有限か無限か、という問いが観測にしか答えられないのは、この事情による。
]

= 存在するかどうか

計量が付加構造なら、入るかどうかが問題になる。

#theorem[
  どんな（パラコンパクトな）多様体にも Riemann 計量が存在する。
]<thm:exists>

#proof[
  各チャートでユークリッド計量 $sum_i dif x^i times.o dif x^i$ を取り、
  #link("/math/differential-forms/6")[微分形式 第 6 回]の 1 の分割で貼り合わせる。
  正定値な対称行列の和は正定値なので、貼り合わせた先も正定値である。
]

正定値であることが証明の要である。正定値なものは足しても正定値のままだ。

ところが、正定値を外すと話が変わる。

#theorem[
  コンパクトな多様体に Lorentz 計量（符号数 $(-,+,dots,+)$）が入るための必要十分条件は
  $ chi(M) = 0 $
  である（$chi$ は Euler 標数）。
]<thm:lorentz>

理由は、Lorentz 計量があると「時間方向」を各点で選べる、
すなわち至るところ $0$ でないベクトル場が作れることによる。
そういうベクトル場が存在する条件が $chi(M) = 0$ である
（Poincaré--Hopf の定理。球面では $chi = 2$ なので、
「毛の生えた球には必ずつむじがある」）。

#strong[Riemann 計量はいつでも入るが、Lorentz 計量には位相的な障害がある。]
時間の向きを大域的に決められない時空がありうる、ということでもある。
この違いは、正定値性の有無から出ている。

= 買い戻したもの

計量が入ったので、置いてきた道具が戻る。

#definition[
  $ flat : T_p arrow.long T_p^*, quad flat(X) = g(X, dot) $
  とその逆 $sharp$ を各点で定める。座標では添字の上げ下げ
  $ X_i = g_(i j) X^j, quad X^i = g^(i j) X_j $
  になる。
]<def:musical>

#definition[
  向き付けられた $M$ 上で、正規直交な余枠 $theta^i$ を使って
  $ upright("vol") := theta^1 and dots.c and theta^n
    = sqrt(det g) thin dif x^1 and dots.c and dif x^n $
  を#strong[体積形式]と呼ぶ。$sqrt(det g)$ を $sqrt(g)$ と略記する。
]<def:volume>

$sqrt(g)$ が現れる場所は、これで一つに決まった。
#link("/math/vector-analysis/5")[ベクトル解析 第 5 回]で
球座標の Laplacian に $r^2 sin theta$ が出た理由も、
極座標の面積要素に $r$ が付く理由も、すべて @def:volume の一行である。

そして $star$ が戻り、$dif$ と組み合わせて演算子が書ける。

#table(
  columns: (auto, 1fr),
  [$nabla f$], [$sharp thin dif f$],
  [$nabla dot X$], [$star thin dif star thin flat X$],
  [$nabla^2 f$], [$star thin dif star thin dif f$],
)

計量が入ったとたんに、$star$ が三つとも顔を出す。
#strong[div も Laplacian も、計量抜きには定義できない]ということが、
この形で目に見える。

= 等長写像と対称性

計量が入ると、「同じ形」という概念が定義できる。

#definition[
  $F^* g = g$ を満たす微分同相 $F$ を#strong[等長写像]と呼ぶ。
  一パラメータ族の等長写像の生成子 $X$——すなわち $cal(L)_X g = 0$ を満たすベクトル場——を
  #strong[Killing ベクトル]と呼ぶ。
]<def:killing>

Killing ベクトルは、計量の対称性そのものである。

#table(
  columns: (auto, auto, 1fr),
  [空間], [Killing ベクトルの数], [対称性],
  [$RR^3$（平坦）], [$6$], [並進 3 ＋ 回転 3],
  [$S^2$], [$3$], [回転 3],
  [Schwarzschild], [$4$], [時間並進 1 ＋ 回転 3],
)

そして#link("/physics/mechanics/3")[Noether の定理]から、
Killing ベクトルの一つ一つが保存量を生む。
Schwarzschild 時空で粒子のエネルギーと角運動量が保存するのは、
その時空が時間並進と回転で不変だからである。

#strong[対称性を数えることが、保存量を数えることになる]という
#link("/physics/mechanics/3")[解析力学 第 3 回]の主張が、
ここでは計量の対称性として実装されている。

= それでも「まっすぐ」は決まらない

長さが測れるようになった。角度も体積も測れる。

だが、まだできないことがある。
#strong[離れた 2 点の接ベクトルを比べること]である。

東京の接ベクトルとロンドンの接ベクトルは、
どちらも長さを測れるようになったが、
「同じ向きか」を問う手段がまだない。
$T_p$ と $T_q$ は別のベクトル空間だからだ。

比べる手段が無いと、
「速度が変わらない」という言明が書けない。つまり#strong[まっすぐが定義できない]。

次回はいったん寄り道して、計量が入った世界を成分で書く記法——テンソル解析——を用意する。
そこで「$partial_i$ はテンソルにならない」という事実に出会い、
それが第 3 回で接続を導入する動機になる。
