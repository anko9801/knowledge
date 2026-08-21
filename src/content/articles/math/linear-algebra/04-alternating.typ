#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "対称と反対称",
  date: "2026-08-20",
  field: "math",
  series: "linear-algebra",
  order: 4,
  tags: ("線形代数",),
  summary: "引数を入れ替える操作は対合なので、2 階のテンソルは対称と反対称に必ず分かれる。3 階以上では分かれきらない。そして反対称側の次元が二項係数になる。",
  provides: (
    "symmetric-antisymmetric-decomposition",
    "alternating-form",
    "wedge-product",
    "binomial-dimension",
  ),
  requires: (
    "multilinear-map",
    "tensor-product",
  ),
)

= 引数を入れ替えてみる

$(0,2)$ 型テンソル $T(bold(u), bold(v))$ に対し、引数を入れ替えたもの
$ T^top (bold(u), bold(v)) := T(bold(v), bold(u)) $
を考える。二度当てれば元に戻るので、$T arrow.long.bar T^top$ は#strong[対合]である。

対合の固有値は $plus.minus 1$ しかない。
だから空間が二つの固有空間に分かれ、$+1$ 側が対称なもの、$-1$ 側が反対称なものになる。
#strong[2 階のテンソルが必ず二種類に分かれるのは、これだけの理由]である。

では 3 階ではどうか。引数の入れ替え方が増えるので、対合ひとつでは済まなくなる。
この記事は、その分かれ方が 3 階以上で崩れることと、
反対称側の次元が $binom(n, k)$ になることを扱う。
#link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で数えた $1, 3, 3, 1$ の出どころも、そこにある。

= 2 階なら、必ずどちらかに分かれる

#proposition[
  任意の $(0,2)$ 型テンソル $T$ は
  $ T_(i j) = underbrace(frac(T_(i j) + T_(j i), 2), upright("対称")) + underbrace(frac(T_(i j) - T_(j i), 2), upright("反対称")) $
  と一意に分解する。すなわち
  $ V^* times.o V^* = upright("S")^2 V^* plus.o Lambda^2 V^* $
]<prop:decomposition>

#proof[
  上の式が対称部分と反対称部分の和であることは、書き下せば分かる。
  一意性は、対称かつ反対称なら $T_(i j) = -T_(i j)$ すなわち $T = 0$ であることによる。
]

次元を数えると
$ frac(n(n+1), 2) + frac(n(n-1), 2) = n^2 $
で、確かに全部を尽くしている。

そして、この分解は#strong[基底の取り替えで壊れない]。
入れ替えに対する符号は、基底を替えても変わらないからである。
つまり「対称である」「反対称である」は、前回の変換則の意味で座標に依らない性質であり、
テンソルの分類として使える。

#example[双線形形式の分解][
  $RR^2$ 上の双線形形式を行列で書くと、@prop:decomposition は
  $ mat(a, b; c, d) = mat(a, (b+c)\/2; (b+c)\/2, d) + mat(0, (b-c)\/2; -(b-c)\/2, 0) $
  という、行列の対称部分と交代部分への分解になる。

  次元は $3 + 1 = 4$。$n = 2$ で $n(n+1)\/2 = 3$、$n(n-1)\/2 = 1$ である。
  そして交代部分が 1 次元しかないことは、
  #link("/math/linear-algebra/5")[次回]の行列式の話に直結する。
]

= 交代形式の次元

反対称のほうを、次数を上げて一般化する。

#definition[
  $k$ 個のベクトルを食って数を返す多重線形写像のうち、
  任意の 2 つの引数を入れ替えると符号が変わるものを#strong[交代 $k$ 形式]と呼び、
  その全体を $Lambda^k V^*$ と書く。
]<def:alternating>

#theorem[
  $dim V = n$ のとき
  $ dim Lambda^k V^* = binom(n, k) $
  とくに $k > n$ なら $Lambda^k V^* = 0$ である。
]<thm:dim>

#proof[
  双対基底 $(e^i)$ から作った
  $ e^(i_1) and dots.c and e^(i_k) quad (i_1 < dots.c < i_k) $
  が基底になることを示せばよい（$and$ は下の @def:wedge で定める）。

  交代性から、同じ添字が二度現れる成分は $0$ である。
  また添字を並べ替えると符号が変わるだけなので、
  成分は $i_1 < dots.c < i_k$ の場合の値ですべて決まる。
  その選び方が $binom(n, k)$ 通りある。
  $k > n$ なら重複なしに $k$ 個選べないので、成分はすべて $0$ になる。
]

#definition[
  $ (alpha and beta)(bold(v)_1, dots, bold(v)_(k+l))
    := sum_(sigma) upright("sgn")(sigma) thin
       alpha(bold(v)_(sigma(1)), dots) thin beta(dots, bold(v)_(sigma(k+l))) $
  ここで和は、引数を $alpha$ 側 $k$ 個と $beta$ 側 $l$ 個に分ける組み合わせにわたる。
  $k = l = 1$ の場合を書き下せば
  $ (alpha and beta)(bold(u), bold(v)) = alpha(bold(u)) beta(bold(v)) - alpha(bold(v)) beta(bold(u)) $
  である。
]<def:wedge>

定義から
$ alpha and beta = (-1)^(k l) beta and alpha $
が出る。$1$ 形式どうしなら反交換、$alpha and alpha = 0$ である。

== $1, 3, 3, 1$ の正体

@thm:dim に $n = 3$ を入れる。

$ dim Lambda^0 = 1, quad dim Lambda^1 = 3, quad dim Lambda^2 = 3, quad dim Lambda^3 = 1 $

#link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で「元凶」と書いた数え上げは、
@thm:dim の $n = 3$ にすぎなかった。
$binom(3,1) = binom(3,2)$ という二項係数の等式が、
$1$ 形式と $2$ 形式を同じ「ベクトル」と呼ばせ、外積を存在させ、
磁場を擬ベクトルにしていたわけである。

$n = 4$ なら $1, 4, 6, 4, 1$ である。$binom(4,1) != binom(4,2)$ なので、
$4$ 次元では同じ混同が起きない。$2$ 形式は $6$ 成分を持ち、ベクトルには見えない。

= 3 階以上では、二つに分けきれない

@prop:decomposition は 2 階の話だった。ここは正直に書いておく。
#strong[3 階以上では、対称部分と反対称部分だけでは尽きない。]

$n$ 次元で $(0,3)$ 型テンソルの次元は $n^3$ だが、
$ dim upright("S")^3 = binom(n+2, 3), quad dim Lambda^3 = binom(n, 3) $
であり、$n = 2$ でも $8 != 4 + 0$ で足りない。残りは、
一部の添字についてだけ対称、というような#strong[混合対称]の成分である。

分類には引数を並べ替える群（対称群 $S_k$）の表現論が要り、その道具が Young 図形である。
$k = 2$ で二つに分かれたのは、$S_2$ の既約表現が自明表現と符号表現の二つしかないからだった。
$S_3$ には $2$ 次元の既約表現があり、それが混合対称に対応する。

#example[混合対称の代表例][
  #link("/math/riemannian-geometry/5")[Riemann 曲率テンソル]$R_(i j k l)$ は、
  最初の 2 本について反対称、後ろの 2 本についても反対称、
  かつ前半と後半を入れ替えると不変、という対称性を持つ。
  完全反対称でも完全対称でもない。

  独立成分が $n = 4$ で $20$ 個になるのは、この混合対称性を数えた結果である。
  幾何のいちばん重要な量が、$S^k$ にも $Lambda^k$ にも入らない場所にいる。
]

= なぜ反対称だけが特別扱いされるのか

対称と反対称は対等に見えるが、後の連載では反対称ばかり使う。理由が二つある。

#strong[一つ、積分できるのは反対称なものだけである。]
$k$ 次元の領域の上で積分するとは、小さな平行体を並べて足すことである。
平行体の向き付けられた体積は、辺のベクトルを入れ替えると符号が変わる。
だから積分される量は反対称でなければならない。
#link("/math/vector-analysis/2")[ベクトル解析 第 2 回]でヤコビアンが自動的に出たのは、
この反対称性からだった。

#strong[二つ、微分すると次数が上がる先が用意されている。]
@thm:dim で次数の梯子が有限段で閉じるので、
$Lambda^0 arrow Lambda^1 arrow dots.c arrow Lambda^n$ という有限の列ができる。
そこに微分を載せたものが外微分で、
#link("/math/differential-forms/1")[微分形式]の連載の主題になる。

対称テンソルにはこの二つが無い。計量も曲率も、最後まで添字で書くことになる。
どちらが偉いという話ではなく、#strong[道具の適用範囲が対称性で決まっている]だけである。

次回は、梯子のいちばん上 $Lambda^n$ を見る。@thm:dim より 1 次元である。
そのことだけから、行列式が定義できてしまう。
