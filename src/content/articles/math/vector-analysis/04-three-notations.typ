#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "三つの記法は同じことを言っている",
  date: "2026-08-20",
  field: "math",
  series: "vector-analysis",
  order: 4,
  tags: ("ベクトル解析",),
  summary: "∇ 記法、添字と ε_ijk、微分形式。三つは別の学問ではなく、同じ対象の三つの書き方である。ε_ijk の正体は体積形式であり、丸暗記させられた ε-δ 恒等式は ⋆⋆ = 1 の成分表示だった。",
  provides: (
    "index-notation",
    "levi-civita-symbol",
    "epsilon-delta-identity",
  ),
  requires: (
    "exterior-derivative",
    "grad-div-curl",
  ),
  uses: (
    "hodge-star",
    "volume-form",
  ),
)

= 習ったものと違う、という疑い

大学の講義でベクトル解析をやると、たいてい添字だらけになる。

$ (nabla times bold(A))_i = epsilon_(i j k) partial_j A_k, quad
  epsilon_(i j k) epsilon_(i l m) = delta_(j l) delta_(k m) - delta_(j m) delta_(k l) $

$epsilon_(i j k)$ の縮約公式を一つ覚えて、あとは機械的に押していく。
公式集はそれで全部導ける。

いっぽうこの連載は、#link("/math/vector-analysis/1")[第 1 回]から
$dif$ と $and$ と $star$ で書いてきた。見た目がまるで違う。

別のものを学んだのだろうか。#strong[違わない。同じ対象の、三つの書き方である。]

この記事は、その辞書を作る。そして三つがそれぞれ何を固定しているかを見る。

= 三つの記法

#table(
  columns: (auto, 1fr),
  [#strong[$nabla$ 記法]],
  [$nabla f$、$nabla dot bold(A)$、$nabla times bold(A)$。座標を書かない。
   $3$ 次元でだけ通用する],
  [#strong[添字記法]],
  [$partial_i f$、$partial_i A_i$、$epsilon_(i j k) partial_j A_k$。成分をすべて書く。
   計算が機械的になる],
  [#strong[微分形式]],
  [$dif f$、$dif omega$、$star$。座標も添字も書かない。
   次元にも計量にも縛られない],
)

同じ量が三通りに書けるのは、$3$ 次元で $Lambda^1$ と $Lambda^2$ が、
$Lambda^0$ と $Lambda^3$ が、それぞれ同じ次元だからである（第 1 回の $1,3,3,1$）。
どの記法も、この同一視の上に乗っている。

= 辞書

#table(
  columns: (auto, auto, 1fr),
  [対象], [添字], [形式],
  [スカラー場 $f$], [$f$], [$0$ 形式 $f$],
  [ベクトル場 $bold(A)$], [$A_i$], [$1$ 形式 $A_i thin dif x^i$、または $2$ 形式 $star(A_i thin dif x^i)$],
  [$nabla f$], [$partial_i f$], [$dif f$],
  [$nabla times bold(A)$], [$epsilon_(i j k) partial_j A_k$], [$dif omega$（$1$ 形式 → $2$ 形式）],
  [$nabla dot bold(A)$], [$partial_i A_i$], [$dif star omega$（$2$ 形式 → $3$ 形式）],
  [$bold(A) times bold(B)$], [$epsilon_(i j k) A_j B_k$], [$star(alpha and beta)$],
  [$bold(A) dot bold(B)$], [$A_i B_i$], [$star(alpha and star beta)$],
  [体積要素 $dif V$], [—], [$dif x and dif y and dif z$],
)

右の列の $star$ の個数を数えると、添字記法が何を隠しているかが見える。
#strong[$epsilon_(i j k)$ が現れる場所には、必ず $star$ が立っている。]

#check[
  辞書の 2 行目だけ、ベクトル場に訳語が二つ当たっている。
  $1$ 形式でもよいし $2$ 形式でもよい、と書いてある。
  #strong[訳語が二つある辞書は、辞書として壊れていないか。]
][
  #strong[壊れているのは辞書ではなく、「ベクトル場」という語のほうである。]

  $3$ 次元では $dim Lambda^1 = dim Lambda^2 = 3$ なので、
  成分を $3$ つ並べた量を見せられても、それが $1$ 形式なのか $2$ 形式なのかは
  #strong[成分からは判別できない]。判別できないまま同じ名前で呼んできた。

  そして、どちらとして扱うかで $dif$ の行き先が変わる。
  $1$ 形式なら $dif : Lambda^1 arrow Lambda^2$ で、これが rot になる。
  $2$ 形式なら $dif : Lambda^2 arrow Lambda^3$ で、これが div になる。
  #strong[辞書の 4 行目と 5 行目は、同じ $dif$ の二つの行き先である。]
  微分作用素が二つあるのではなく、入れる箱が二つある。

  区別が消えないところもある。向きを裏返すと、$1$ 形式は変わらず
  $2$ 形式は符号が変わる。速度は $1$ 形式、磁場は $2$ 形式で、
  #strong[「擬ベクトル」という呼び名は「実は $2$ 形式だった」という意味だった]。

  $4$ 次元なら $dim Lambda^1 = 4 != 6 = dim Lambda^2$ なので、
  そもそも取り違えようがない。訳語が二つ要るのは $3$ 次元の事故である。
]

= $epsilon_(i j k)$ の正体

#proposition[
  $3$ 次元の直交直線座標で
  $ epsilon_(i j k) = (dif x^1 and dif x^2 and dif x^3)(bold(e)_i, bold(e)_j, bold(e)_k) $
  すなわち $epsilon_(i j k)$ は#strong[体積形式の成分]である。
]<prop:epsilon>

#proof[
  右辺は交代形式なので $i, j, k$ の入れ替えで符号が変わり、
  $(1,2,3)$ を入れると $1$ になる。これは $epsilon_(i j k)$ の定義そのものである。
]

体積形式は、#link("/math/linear-algebra/7")[線形代数 第 6 回]で見たとおり
#strong[計量と向きの両方]を選んで初めて決まる。
つまり $epsilon_(i j k)$ を書いた時点で、その二つを使っている。

だから外積が $3$ 次元でしか書けないのも、磁場が擬ベクトルなのも、
添字記法の側では $epsilon$ に押し込められていた。
記号 1 文字に、次元と計量と向きの三つがまとめて詰まっている。

== $epsilon$-$delta$ 恒等式は $star star = 1$ である

丸暗記させられるあの式にも、出どころがある。

#proposition[
  $3$ 次元では $star star = upright("id")$ である。成分で書くと
  $ epsilon_(i j k) epsilon_(i l m) = delta_(j l) delta_(k m) - delta_(j m) delta_(k l) $
]<prop:epsilon-delta>

#proof[
  $star$ は $Lambda^1 arrow Lambda^2$ と $Lambda^2 arrow Lambda^1$ を与える。
  正の向きの正規直交基底で $star(dif x^1) = dif x^2 and dif x^3$ などが成り立ち、
  二度当てるともとに戻る。

  成分で追うと、$1$ 形式に $star$ を当てる操作が $epsilon$ を一つ掛けて添字を縮約することに
  対応するので、$star star$ は $epsilon$ を二つ掛けたものになる。
  それが恒等写像であるという主張が、右辺の $delta$ の組み合わせである。
]

$n$ 次元では $star star = (-1)^(k(n-k))$ で、Minkowski 計量ではさらに符号が付く。
$3$ 次元のユークリッド空間だけが $star star = 1$ という単純な形になり、
そのおかげで恒等式が $delta$ 二つの差という覚えやすい形に落ちる。

#example[恒等式の証明を三通りで][
  $nabla dot (nabla times bold(A)) = 0$ を三つの記法で書く。

  + #strong[$nabla$ 記法。] 成分に開いて偏微分の順序交換を使う。それ以外に手がかりが無い
  + #strong[添字。] $partial_i (epsilon_(i j k) partial_j A_k) = epsilon_(i j k) partial_i partial_j A_k = 0$。
    $partial_i partial_j$ が対称、$epsilon_(i j k)$ が反対称だから
  + #strong[形式。] $dif (dif omega) = 0$

  二番目と三番目は#strong[同じ証明]である。
  対称なものと反対称なものを縮約すると $0$ になる、という一点しか使っていない。
  違うのは、反対称性を $epsilon$ が担うか $and$ が担うかだけである。
]

= 添字記法は何を仮定しているか

三つの記法のうち、添字記法がいちばん多くを前提にしている。
講義ノートの書き出しを思い出すと、そこに書いてある。

#table(
  columns: (auto, 1fr),
  [$bold(A) = A_i bold(e)_i$],
  [基底が場所によらない。曲線座標では成り立たない],
  [$bold(A) dot bold(B) = g_(i j) A_i B_j = A_i B_i$],
  [$g_(i j) = delta_(i j)$ を使った。ここで計量を固定している],
  [添字を上下で区別しない],
  [上の等式のせいで区別が消えている。斜交座標では消えない],
  [$epsilon_(i j k)$ の値を固定],
  [向きを固定し、$sqrt(g) = 1$ を使った],
)

どれも $RR^3$ の直交直線座標では正しい。
そこから一歩でも出ると、四つとも破れる。

#strong[この四つを外したものがテンソル解析である。]
添字を上下に分け、$g_(i j)$ を一般の対称テンソルに戻し、
基底が場所で変わるぶんを Christoffel 記号で補い、
$epsilon$ に $sqrt(g)$ を掛ける。それだけの拡張で、曲線座標も曲がった空間も扱える。

つまり#strong[テンソル解析は添字記法の一般化]であり、
微分形式とは別の方向への拡張である。競合ではない。

#table(
  columns: (auto, 1fr),
  [テンソル解析], [添字を丁寧に扱う方向。対称テンソルも扱える。何でも書けるが式が長い],
  [微分形式], [反対称なものに絞る方向。座標も添字も書かずに済み、積分定理が付いてくる],
)

応力テンソルが対称なので微分形式では書けず、
電磁場テンソルが反対称なので $F = dif A$ と書ける、という区別がここから出る。
どちらの道を行くかは、#strong[扱う量が対称か反対称か]で決まる。

= どれを使うか

正直に書くと、用途で決まる。

#table(
  columns: (auto, 1fr),
  [$nabla$ 記法], [$3$ 次元の物理を読み書きするとき。いちばん短い],
  [添字], [恒等式を機械的に導くとき。証明が計算に落ちる],
  [形式], [積分定理、対称性、次元を上げるとき。位相が絡むとき],
  [テンソル], [曲線座標、曲がった空間、対称テンソルを扱うとき],
)

この連載が形式を推してきたのは、
#strong[三つの定理が一つであることが、その記法でしか見えない]からである。
計算を速くするためではない。

次回は、辞書の中で保留にしてきた $star$ を正面から定義する。
そこまで行くと、曲線座標での grad・div・rot・Laplacian の公式が、
覚えるものではなく導くものになる。
