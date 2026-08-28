#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "計量は空間の性質ではない",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 1,
  tags: ("Riemann 幾何",),
  summary: "同じ多様体に、いくらでも違う計量が入る。計量は測る道具であって、空間そのものではない。だから Riemann 計量は必ず存在するのに、Lorentz 計量には位相的な障害がある。",
  provides: (
    "riemannian-metric",
    "arc-length",
    "volume-element",
    "isometry",
    "killing-vector",
  ),
  requires: (
    "manifold",
    "inner-product",
    "k-form",
  ),
  uses: (
    "hodge-star",
    "lie-derivative",
  ),
)

= 長さは、空間が決めない

球面に「長さ」を入れる方法は、一つではない。どう入れても球面は球面のままで、
多様体としての構造は何も変わらない。
#strong[長さの測り方を、空間そのものは決めてくれない。]

つまり計量は、外から足す道具である。何が足りていなかったのかから書く。

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

#link("/math/linear-algebra/7")[線形代数 第 6 回]の内積を、各点に配っただけである。
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

#check[
  上半平面で $y arrow 0$ へ近づくと、目で見れば境界まで有限の距離しかない。
  ところが上の計量では、そこまでの長さが無限に発散する。
  #strong[どちらが本当の距離なのか。]
][
  #strong[どちらも本当で、比べる相手が違う。]

  「目で見た距離」は、この集合を $RR^2$ の部分集合と見て、
  $dif s^2 = dif x^2 + dif y^2$ を当てたときの答えである。
  無限に遠いほうは $dif s^2 = (dif x^2 + dif y^2) \/ y^2$ を当てた答えである。
  #strong[計量を二つ当てて、二つの答えが出ているだけ]である。

  取り違えが起きるのは、集合のほうが同じだからである。
  だが @def:riemann は多様体に付け加える構造で、多様体が持っている性質ではない。
  長さも角度も体積も、$g$ を指定して初めて決まる。

  だから「どちらが本当か」は問いとして立たない。立つのは
  #strong[どの計量を入れたか]で、そこまで込みで対象になる。
]

だから幾何の問いは、たいてい二段構えになる。
#strong[この多様体に、これこれの性質を持つ計量は入るか。]
「至るところ $K > 0$ の計量が入る多様体はどれか」「Ricci 平坦な計量は入るか」といった問いは、
どれもこの形をしている。

計量を一つ固定して考えるのと、計量の全体を動かして考えるのとでは、
見ている対象が違う。この連載は前者を扱い、
後者は#link("/math/riemannian-geometry/7")[第 7 回]で少しだけ顔を出す。

#remark[
  逆向きの問いもある。#strong[計量は位相をどこまで決めるか。]
  局所的な条件（曲率の符号）が大域的な形を縛る、という結果がいくつも知られている。
  #link("/math/riemannian-geometry/6")[第 6 回]の Bonnet--Myers と
  #link("/math/riemannian-geometry/7")[第 7 回]の Gauss--Bonnet が、その代表例である。
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

理由は、符号数 $(-,+,dots,+)$ の計量があると、各点で「負の方向」を一つ選べる、
すなわち至るところ $0$ でないベクトル場が作れることによる。
そういうベクトル場が存在する条件が $chi(M) = 0$ である
（Poincaré--Hopf の定理。$S^2$ では $chi = 2$ なので、
「毛の生えた球には必ずつむじがある」）。

#strong[Riemann 計量はいつでも入るが、不定値の計量には位相的な障害がある。]
この違いは、正定値性の有無から出ている。
正定値なものは足しても正定値だが、符号数を保ったまま足すことはできない。
@thm:exists の証明で使った 1 の分割が、そのまま使えないのである。

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
  [$RR^n$（平坦）], [$n(n+1)\/2$], [並進 $n$ ＋ 回転 $n(n-1)\/2$],
  [$S^n$], [$n(n+1)\/2$], [回転のみ。平坦と同じ数],
  [一般の $M$], [$0$ のことが多い], [対称性を持つ計量のほうが例外],
)

#theorem[
  $n$ 次元 Riemann 多様体の Killing ベクトルは、多くとも $n(n+1)\/2$ 個である。
  この上限に達するものを#strong[極大対称空間]と呼び、
  断面曲率が一定な空間——$RR^n$、$S^n$、双曲空間——に限る。
]<thm:maximally-symmetric>

上限が $n(n+1)\/2$ なのは、Killing ベクトルが一点での値（$n$ 個）と
微分の反対称部分（$n(n-1)\/2$ 個）で決まってしまうからである。
#strong[対称性の個数を数えることが、そのまま空間の分類になる]、
というのがこの定理の内容である。

そして「対称性がゼロ」が普通である。
どこにも対称性のない計量のほうが圧倒的に多く、
上の表の $RR^n$ と $S^n$ は、極端に特殊な例だということになる。

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
