#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "引き戻せるのは、どちらか一方だけ",
  date: "2026-08-20",
  field: "math",
  series: "differential-forms",
  order: 2,
  tags: ("微分形式",),
  summary: "1 形式は写像でいつでも引き戻せるが、ベクトル場は一般に押し出せない。この非対称が、座標変換が破綻しない理由であり、物理の基本量の多くが共変ベクトルとして現れる理由でもある。",
)

#layer("L1 微分構造")[写像と微分だけ。計量は出てこない]

= 座標変換はなぜ必ずうまくいくのか

座標を替えると、$1$ 形式の成分は
$ omega = omega_i thin dif x^i = omega_i frac(partial x^i, partial u^j) thin dif u^j $
と書き換わる。連鎖律を当てただけで、何も破綻しない。

いっぽうベクトル場の成分は
$ X = X^i frac(partial, partial x^i) = X^i frac(partial u^j, partial x^i) frac(partial, partial u^j) $
と書き換わる。逆行列 $partial u \/ partial x$ が要る。
座標変換が可逆だから問題にならないが、#strong[可逆でない写像に対しては話が変わる]。

この記事はその非対称を扱う。結論を先に書く。

#strong[$1$ 形式はどんな滑らかな写像でも引き戻せる。ベクトル場は一般に運べない。]

= 余接空間と $1$ 形式

#definition[
  #link("/math/differential-forms/1")[前回]の接空間 $T_p$ の双対空間を#strong[余接空間]と呼び、
  $T_p^*$ と書く。各点に $T_p^*$ の元を滑らかに置いたものを#strong[$1$ 形式]と呼ぶ。
]<def:cotangent>

#definition[
  関数 $f$ に対し、$1$ 形式 $dif f$ を
  $ (dif f)(X) := X(f) $
  で定める。
]<def:df>

前回、接ベクトルを「関数を微分する作用素」として定義した。
その定義をひっくり返しただけである。
$X$ を固定して $f$ を動かせば接ベクトル、$f$ を固定して $X$ を動かせば $1$ 形式。

これを座標関数 $x^i$ に当てると
$ (dif x^i)(frac(partial, partial x^j)) = frac(partial x^i, partial x^j) = delta^i{}_j $
なので、$dif x^i$ は $partial \/ partial x^i$ の双対基底である。
#link("/math/vector-analysis/2")[ベクトル解析 第 2 回]で「$dif x$ は成分を読む機械」と書いたものが、
ここで正式に定義された。

= 引き戻し

滑らかな写像 $F : M arrow.long N$ を考える。
$M$ と $N$ の次元は違ってよいし、$F$ は単射でも全射でなくてよい。

まず、ベクトルは前へ送れる。

#definition[
  $F$ の#strong[微分]（押し出し）$dif F_p : T_p M arrow.long T_(F(p)) N$ を
  $ (dif F_p (X))(f) := X(f compose F) $
  で定める。
]<def:pushforward>

曲線の言葉なら、$M$ の曲線 $gamma$ を $F$ で送って $F compose gamma$ とし、その速度を取る操作である。
座標で書けばヤコビ行列が掛かる。

そして、$1$ 形式は後ろへ送れる。

#definition[
  $N$ 上の $1$ 形式 $omega$ に対し、$M$ 上の $1$ 形式 $F^* omega$ を
  $ (F^* omega)_p (X) := omega_(F(p)) (dif F_p (X)) $
  で定める。これを#strong[引き戻し]と呼ぶ。
]<def:pullback>

@def:pullback は、いつでも書ける。
$F$ に何の条件も要らない。
#strong[入力を先に $N$ へ送ってから、向こうで測ればよい]からである。

= 逆はできない

ベクトル#strong[場]を $F$ で前へ送ろうとすると、二か所で詰まる。

#example[押し出せない二つの理由][
  + #strong[$F$ が単射でないとき。] $M$ の 2 点 $p != q$ が $F(p) = F(q)$ と同じ点へ行くとする。
    $X_p$ と $X_q$ の行き先が食い違えば、$N$ 側の 1 点に 2 つの値が要求される。
    定義できない。

  + #strong[$F$ が全射でないとき。] $F$ の像の外にある点では、
    そもそも値を決める材料が無い。
]

$1$ 形式にはこの問題が起きない。
@def:pullback は $M$ の各点で独立に定義でき、$N$ 側の点が重なろうと余ろうと関係ない。

#table(
  columns: (auto, auto, 1fr),
  [], [向き], [条件],
  [接ベクトル（1 点）], [前へ], [いつでも可（@def:pushforward）],
  [ベクトル場], [前へ], [$F$ が微分同相でないと一般に不可],
  [$1$ 形式（場）], [#strong[後ろへ]], [#strong[いつでも可]],
)

この非対称は、#link("/math/linear-algebra/2")[線形代数 第 2 回]の双対写像と同じ形をしている。
$f : V arrow W$ に対して自然に定まるのは $f^* : W^* arrow V^*$ のほうだった。
矢印が逆を向くのは、余ベクトルが「入力を受け取る側」だからである。

= 引き戻しは何でも通り抜ける

@def:pullback は、見た目より強い性質を持つ。

#proposition[
  $ F^*(dif f) = dif (f compose F) $
]<prop:pullback-d>

#proof[
  両辺に $X in T_p M$ を入れる。左辺は @def:pullback と @def:df より
  $(dif f)(dif F_p (X)) = (dif F_p (X))(f)$ で、@def:pushforward からこれは $X(f compose F)$ である。
  右辺も @def:df より $X(f compose F)$ である。
]

短い命題だが、これが後で効く。
#strong[引き戻しと微分は交換する]と言っており、
#link("/math/differential-forms/4")[第 4 回]で外微分に一般化されると、
「$dif$ が座標に依らない」ことの正体になる。

== 座標変換は引き戻しの特別な場合

座標 $(u^j)$ から $(x^i)$ への変換とは、写像 $x = x(u)$ のことである。
これは微分同相なので、両方向に運べる。

冒頭に書いた $1$ 形式の変換則は、@def:pullback を書き下しただけである。
#strong[座標変換で成分がどう変わるかを覚える必要はない。]
$1$ 形式なら引き戻し、ベクトル場なら押し出し。それだけが規則で、
残りは連鎖律が勝手にやる。

#example[線積分が座標に依らない理由（再訪）][
  #link("/math/vector-analysis/2")[ベクトル解析 第 2 回]で、
  線積分がパラメータの取り方に依らないことを計算で確かめた。

  引き戻しの言葉で言えば、曲線 $gamma : [a, b] arrow M$ に対して
  $ integral_C omega := integral_a^b gamma^* omega $
  と定めている。パラメータの取り替え $t = t(s)$ は $[a,b]$ 上の微分同相で、
  積分は引き戻しで不変である。計算が相殺したのは、この構造のせいだった。
]

= 物理量が共変であることの意味

$1$ 形式ばかり出てくる、と感じたことはないだろうか。
ベクトルポテンシャル $A_mu$、運動量 $p_i$、力（仕事をする側）、勾配。
どれも下付きの添字を持つ、共変な量である。

理由の一つが、この記事の非対称にある。

#strong[引き戻せる量は、部分系に制限できる。]
$M$ が $N$ の中の部分多様体なら、包含写像 $iota : M arrow N$ で
$N$ 上の $1$ 形式を $M$ 上へ引き戻せる。
「ある曲面の上での電位差」「ある経路に沿った仕事」は、
それが $1$ 形式だから意味を持つ。

ベクトル場は制限できない。
曲面に接していないベクトル場を曲面上のベクトル場と見なすには、
#strong[垂直成分を捨てる]必要があり、そのためには計量が要る。

#remark[
  「積分される量は $1$ 形式である」という言い方も同じことを述べている。
  $integral_C omega$ が定義できるのは $gamma^* omega$ が作れるからで、
  ベクトル場に対しては $integral_C bold(A)$ という式そのものが書けない。
  $bold(A) dot dif bold(r)$ と内積を取って $1$ 形式に直して初めて積分できる。
  そして内積を取る操作には計量が要る。

  #link("/math/vector-analysis/2")[ベクトル解析 第 2 回]で
  「$bold(A) dot dif bold(r)$ には計量が要らない」と書いたのは、
  $bold(A)$ を最初から $1$ 形式と思っている場合の話である。
  ベクトル場から出発するなら、そこに $flat$ が一つ隠れている。
]

= まとめ

#table(
  columns: (auto, 1fr),
  [$T_p^*$], [接空間の双対。その元が余ベクトル],
  [$dif f$], [$X mapsto X(f)$。前回の定義をひっくり返しただけ],
  [$F^*$], [$1$ 形式を後ろへ運ぶ。$F$ に条件は要らない],
  [$F^* dif f = dif (f compose F)$], [引き戻しと微分は交換する],
)

次回は次数を上げ、$k$ 形式を多様体の上に作る。
引き戻しは楔積とも交換するので、
#strong[$k$ 形式の世界は写像に対してまるごと閉じている]ことになる。
その閉じ方が、外微分と Stokes の定理を支えることになる。
