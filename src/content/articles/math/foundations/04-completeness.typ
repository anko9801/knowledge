#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "穴が空いていないこと",
  date: "2026-08-21",
  field: "math",
  series: "foundations",
  order: 4,
  tags: ("土台",),
  summary: "完備性は位相の性質ではない。距離を替えると変わる。それでも完備性を仮定すると、縮小写像の原理という強い道具が手に入り、微分方程式の解も逆関数も、そこから出てくる。",
  provides: (
    "metric-space",
    "completeness",
    "uniform-convergence",
    "banach-space",
    "banach-fixed-point",
    "function-space",
    "ode-existence",
  ),
)

#layer("L1 位相 ＋ 距離", metric: true)[距離を入れる。位相だけでは言えないことを扱う]

= 位相では言えなかったこと

#link("/math/foundations/3")[前回]、位相と距離を仕分けた。

#table(
  columns: (auto, 1fr),
  [位相だけで決まる], [連続、コンパクト、連結、収束],
  [距離が要る], [長さ、一様連続、Cauchy 列、#strong[完備性]],
)

$RR$ と開区間 $(-1,1)$ は同相なのに、片方は完備でもう片方は完備でない。
だから完備性は位相の性質ではない。

それでも完備性は捨てられない。#strong[「極限が存在する」と言えるかどうか]が
そこに懸かっているからである。

この回で入れる道具は一つだけである。縮小写像の原理。
そしてそれが、常微分方程式の解の存在も、逆関数定理も、まとめて出す。

= 距離空間と完備性

#definition[
  集合 $X$ 上の関数 $d : X times X arrow RR_(>=0)$ が
  + $d(x,y) = 0 arrow.l.r.double x = y$
  + $d(x,y) = d(y,x)$
  + $d(x,z) <= d(x,y) + d(y,z)$（三角不等式）

  を満たすとき $d$ を#strong[距離]と呼ぶ。
  開球 $B(x, r) = {y : d(x,y) < r}$ を基本近傍として位相が入る。
]<def:metric>

三角不等式だけが実質である。他の二つは「距離らしさ」の最低限にすぎない。

#definition[
  点列 $(x_n)$ が
  $ forall epsilon > 0, exists N : m, n >= N arrow.r.double d(x_m, x_n) < epsilon $
  を満たすとき#strong[Cauchy 列]という。
  すべての Cauchy 列が収束する距離空間を#strong[完備]という。
]<def:complete>

Cauchy 列の定義には#strong[極限が出てこない]。「行き先を知らなくても、
収束しそうかどうかは判定できる」というのが要点である。
完備とは、そう判定したものが必ず本当に収束する、ということである。

#example[有理数には穴が空いている][
  $QQ$ の中で $x_(n+1) = (x_n + 2\/x_n) \/ 2$、$x_1 = 1$ とすると、
  この列は Cauchy 列である。ところが極限 $sqrt(2)$ は $QQ$ にない。
  $QQ$ は完備でない。

  実数を「$QQ$ の Cauchy 列を集めて穴を埋めたもの」として構成する流儀は、
  この観察をそのまま定義にしたものである。
]

#remark[
  完備性が位相の性質でないことは、$RR tilde.equiv (-1,1)$ の例で見た。
  同じ位相に、完備な距離と完備でない距離の両方が入る。

  「完備距離が一つでも入るか」という問いなら位相の性質になる（完備距離化可能性）。
  性質を主張するときに、何の上で言っているのかを取り違えないこと。
]

= 一様収束

関数の列については、収束の言い方が二通りある。

#definition[
  $f_n arrow f$ が#strong[各点収束]とは、各 $x$ について $f_n (x) arrow f(x)$。
  #strong[一様収束]とは
  $ sup_x abs(f_n (x) - f(x)) arrow 0 $
  すなわち、$N$ の取り方が $x$ に依らないことをいう。
]<def:uniform>

差は $N$ が $x$ に依るかどうかだけだが、結果が大きく変わる。

#theorem[
  連続関数の列が一様収束すれば、極限も連続である。
]<thm:uniform-continuous>

#example[各点収束では壊れる][
  $[0,1]$ 上で $f_n (x) = x^n$ は各点収束するが、極限は
  $x < 1$ で $0$、$x = 1$ で $1$ という不連続関数である。
  各 $f_n$ は連続なのに、極限が連続でない。

  一様収束していないことは、$sup$ が $1$ のままであることから分かる。
]

#strong[極限と他の操作を交換してよいか]、という問いはここから始まる。
微分と極限、積分と極限、無限和と微分。どれも一様収束（あるいはもっと強い条件）が要る。

= Banach 空間

ベクトル空間に距離を入れる。ただし線形構造と噛み合う形で。

#definition[
  ベクトル空間 $V$ 上の $norm(dot) : V arrow RR_(>=0)$ が
  $norm(bold(v)) = 0 arrow.l.r.double bold(v) = bold(0)$、
  $norm(a bold(v)) = abs(a) norm(bold(v))$、
  $norm(bold(u) + bold(v)) <= norm(bold(u)) + norm(bold(v))$
  を満たすとき#strong[ノルム]と呼ぶ。$d(bold(u), bold(v)) = norm(bold(u) - bold(v))$ で距離が入る。
  完備なノルム空間を#strong[Banach 空間]という。
]<def:banach>

有限次元では、ノルムの取り方に依らず完備になる。
だから#link("/math/foundations/1")[第 1 回]までの話では完備性が問題にならなかった。

無限次元では違う。

#example[関数空間][
  $[0,1]$ 上の連続関数の全体 $C[0,1]$ に
  $ norm(f) = sup_x abs(f(x)) $
  を入れると Banach 空間になる。この距離での収束が、@def:uniform の一様収束である。

  いっぽう $norm(f) = integral_0^1 abs(f)$ を入れると、完備でない。
  同じ空間なのにノルムの取り方で完備性が変わる。
  穴を埋めた先が $L^1$ で、そこには連続でない関数が入ってくる。
]

#strong[関数の集合をベクトル空間として扱う]、というのが要点である。
そうすると「関数の列の収束」が「点列の収束」になり、@def:complete がそのまま使える。

= 縮小写像の原理

完備性を仮定すると、この定理が使える。

#theorem("Banach の不動点定理")[
  完備距離空間 $X$ 上の写像 $T : X arrow X$ が、ある $0 <= k < 1$ について
  $ d(T x, T y) <= k thin d(x, y) $
  を満たすとき、$T$ の不動点 $T x^* = x^*$ がただ一つ存在する。
]<thm:contraction>

#proof[
  任意の $x_0$ から $x_(n+1) = T x_n$ と定める。仮定より
  $d(x_(n+1), x_n) <= k^n d(x_1, x_0)$ なので、三角不等式から
  $ d(x_m, x_n) <= frac(k^n, 1 - k) d(x_1, x_0) quad (m > n) $
  である。$k < 1$ より右辺は $0$ に行くので $(x_n)$ は Cauchy 列。
  完備性から収束し、$T$ は連続なので極限が不動点になる。

  一意性は、二つあれば $d(x^*, y^*) <= k thin d(x^*, y^*)$ となり $k < 1$ から $d = 0$。
]

証明が短い。使ったのは#strong[完備性ただ一つ]である。

そして、この定理の使い道が広い。

#table(
  columns: (auto, 1fr),
  [常微分方程式], [解の存在と一意性（Picard--Lindelöf）。積分作用素が縮小写像になる],
  [逆関数定理], [#link("/math/foundations/5")[次回]。$f(x) = y$ を不動点方程式に直す],
  [数値計算], [Newton 法が収束する条件],
  [フラクタル], [縮小写像の族の不動点として図形が定まる],
)

#example[常微分方程式の解が存在する理由][
  $dot(x) = f(t, x)$、$x(t_0) = x_0$ を積分の形に直すと
  $ x(t) = x_0 + integral_(t_0)^t f(s, x(s)) thin dif s $
  になる。右辺を「関数 $x$ を入れると関数を返す作用素 $T$」と見れば、
  求める解は $T$ の不動点である。

  $f$ が $x$ について Lipschitz 連続なら、区間を十分短く取ると $T$ は縮小写像になる。
  舞台は連続関数の空間 $C[t_0 - h, t_0 + h]$ で、これは Banach 空間である。
  @thm:contraction から、解がただ一つ存在する。
]

#strong[「解がある」という主張が、完備性から出た。]
微分方程式を解いたのではなく、解の存在を保証しただけだが、
存在が保証されない対象を扱うわけにはいかない。

= 何のために完備性を仮定するのか

まとめておく。

#table(
  columns: (auto, 1fr),
  [完備性], [Cauchy 列が収束する。位相の性質ではない],
  [一様収束], [$N$ が $x$ に依らない。極限が連続性を保つ],
  [Banach 空間], [完備なノルム空間。関数の空間として使う],
  [縮小写像の原理], [完備性だけから、不動点の存在と一意性が出る],
)

完備性は「無い方が一般的」という種類の仮定ではない。
#strong[極限を取ってよい、と言うための最低限]である。
これが無いと、解析のほとんどの議論が「収束するかどうか分からない」で止まる。

次回は微分の側へ戻る。@thm:contraction を使って逆関数定理を証明し、
そこから#strong[どこまで微分できるか]という階層——$C^k$ と $C^infinity$——を扱う。
#link("/math/differential-forms/5")[多様体]の定義に「遷移関数が滑らか」と書いてあったが、
その「滑らか」が何を指すのかを、そこで決める。
