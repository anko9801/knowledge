#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "テンソル",
  date: "2026-08-20",
  field: "math",
  series: "linear-algebra",
  order: 3,
  tags: ("線形代数",),
  summary: "「テンソルとは、こう変換するものである」という定義を見かける。定義に座標表示の振る舞いを使うのは順序が逆で、実際それは定義ではなく定理である。テンソルは多重線形写像であり、変換則はそれを基底で書いた結果にすぎない。",
  provides: (
    "multilinear-map",
    "tensor-type",
    "tensor-product",
    "contraction",
    "tensor-transformation-law",
  ),
  requires: (
    "dual-space",
    "dual-basis",
  ),
)

= 変換則で定義する、という流儀

テンソルの定義には、二つの流儀がある。一つはこう述べる。

「座標変換のもとで
$ T'^(i j) = frac(partial x'^i, partial x^k) frac(partial x'^j, partial x^l) T^(k l) $
のように変換する量をテンソルという。」

初めて見たとき、私はこれを定義として受け取れなかった。
何かを定義するのに、#strong[その何かの座標表示の振る舞い]を使っている。
座標を選ぶ前の対象が何なのかは、一度も言われていない。

それに、この定義では確かめようがない。
ある量がテンソルかどうかを判定するのに、あらゆる座標変換を試すのか。

もう一つの流儀を採る。そして最初の流儀は、そこから定理として出る。

#strong[テンソルとは多重線形写像である。変換則は、それを基底で書いたときの帰結である。]

= 定義

#link("/math/linear-algebra/2")[前回]の材料は二つだけだった。$V$ と $V^*$ である。
これらから数を作る機械を、まとめて考える。

#definition[
  $ T : underbrace(V^* times dots.c times V^*, p) times underbrace(V times dots.c times V, q)
      arrow.long RR $
  が各引数について線形であるとき、$T$ を#strong[$(p, q)$ 型テンソル]と呼ぶ。
]<def:tensor>

見慣れたものが、すべてここに収まる。

#table(
  columns: (auto, auto, 1fr),
  [$(0, 1)$], [$V arrow RR$], [余ベクトル。$V^*$ の元],
  [$(1, 0)$], [$V^* arrow RR$], [ベクトル。前回の自然な同型 $V tilde.equiv V^(**)$ で読み替える],
  [$(0, 2)$], [$V times V arrow RR$], [双線形形式。計量 $g$ がこれ],
  [$(1, 1)$], [$V^* times V arrow RR$], [線形写像 $V arrow V$],
)

$(1,1)$ 型の行は説明が要る。線形写像 $f : V arrow V$ に対し
$ T(alpha, bold(v)) := alpha(f(bold(v))) $
と定めれば $(1,1)$ 型テンソルになり、逆もたどれる。
つまり#strong[行列で書いていたものは $(1,1)$ 型テンソル]だった。

#definition[
  基底 $(bold(e)_i)$ とその双対基底 $(e^i)$ を選び
  $ T^(i_1 dots.c i_p){}_(j_1 dots.c j_q)
    := T(e^(i_1), dots, e^(i_p), bold(e)_(j_1), dots, bold(e)_(j_q)) $
  を $T$ の#strong[成分]と呼ぶ。
]<def:components>

多重線形性から、成分がすべて決まれば $T$ が決まる。

= 変換則は定理である

#theorem[
  基底を $bold(e)'_j = sum_i P^i{}_j bold(e)_i$ と取り替えると、
  $(1,1)$ 型テンソルの成分は
  $ T'^i{}_j = sum_(k, l) (P^(-1))^i{}_k thin T^k{}_l thin P^l{}_j $
  と変わる。一般の $(p,q)$ 型でも、上の添字ごとに $P^(-1)$ が、
  下の添字ごとに $P$ が掛かる。
]<thm:transform>

#proof[
  双対基底が $e'^i = sum_k (P^(-1))^i{}_k thin e^k$ と変わることを見ればよい。
  実際 $e'^i (bold(e)'_j) = sum_(k,l) (P^(-1))^i{}_k P^l{}_j thin e^k (bold(e)_l) = delta^i{}_j$ である。
  あとは @def:components に代入するだけである。
]

これで冒頭の式が説明される。
上の添字と下の添字で $P$ と $P^(-1)$ が入れ替わるのは、
#strong[ベクトルと余ベクトルが逆向きに変換するから]である。前回の話がそのまま効いている。

そして「テンソルかどうかの判定」も、実務としては @thm:transform を使う。
定義ではないが、判定法としては正しい。順序を取り違えなければよい。

#remark[
  #link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で
  「$epsilon_(i j k)$ はテンソルでない」という話をしなかったが、ここで触れておく。
  $epsilon_(i j k)$ の値を全座標系で $plus.minus 1, 0$ と決めてしまうと、
  @thm:transform に従わない。従うようにするには $sqrt(g)$ を掛ける必要がある。
  「どの座標でも同じ数を並べる」と決めた時点で、それは基底に依らない対象ではなくなる。
]

= テンソル積

@def:tensor のテンソルたちも、和とスカラー倍でベクトル空間になる。その正体を書いておく。

#definition[
  $bold(v) in V$、$bold(w) in W$ に対し、$(0,2)$ 型に相当する機械
  $ (bold(v) times.o bold(w))(alpha, beta) := alpha(bold(v)) thin beta(bold(w))
    quad (alpha in V^*, beta in W^*) $
  を定める。これらの線形結合の全体を $V times.o W$ と書く。
]<def:tensor-product>

#proposition[
  $(bold(e)_i)$ が $V$ の、$(bold(f)_a)$ が $W$ の基底なら、
  $bold(e)_i times.o bold(f)_a$ は $V times.o W$ の基底である。
  とくに $dim (V times.o W) = dim V dot dim W$。
]<prop:tensor-dim>

次元が積になる、というのが要点である。
直和 $V plus.o W$ なら次元は和で、こちらは「$V$ か $W$ のどちらか」を並べたもの。
テンソル積は「$V$ と $W$ の両方を同時に指定する」ときの部屋である。

== 分解できない元がある

@prop:tensor-dim から出る、いちばん大事な帰結を書いておく。

#example[$bold(v) times.o bold(w)$ の形に書けない元][
  $V = W = RR^2$ とし、基底を $bold(e)_1, bold(e)_2$ とする。
  $ bold(e)_1 times.o bold(e)_1 + bold(e)_2 times.o bold(e)_2 $
  は $bold(v) times.o bold(w)$ の形に書けない。

  実際 $bold(v) = a bold(e)_1 + b bold(e)_2$、$bold(w) = c bold(e)_1 + d bold(e)_2$ とすると
  $bold(v) times.o bold(w)$ の係数行列は $mat(a c, a d; b c, b d)$ で、行列式が $0$ になる。
  上の元の係数行列は単位行列で、行列式は $1$ である。
]

$V times.o W$ は「$V$ の元と $W$ の元の組」の集合ではない。
組で書ける元（#strong[単純テンソル]）は、その中のごく一部でしかない。

数え方でも確かめられる。単純テンソルの全体は $bold(v)$ と $bold(w)$ の
それぞれのスカラー倍を同一視して $m + n - 1$ 次元ぶんしかないが、
$V times.o W$ は $m n$ 次元ある。次元が積になったぶんの行き場所が、
「組に分解できない元」だったことになる。

#remark[
  この分解不能性が意味を持つ場面は多い。
  量子力学で二つの系の状態空間をテンソル積で作ると、
  「それぞれの系の状態」が定まらない状態が存在することになる。もつれである。
]

= 縮約と、跡が基底に依らない理由

テンソルには、基底を選ばずにできる操作がもう一つある。

#definition[
  $(p, q)$ 型テンソルの上の添字を一つ、下の添字を一つ選び、
  $ (upright("C") T)^(dots.c){}_(dots.c) := sum_i T^(dots.c i dots.c){}_(dots.c i dots.c) $
  とすることを#strong[縮約]と呼ぶ。結果は $(p-1, q-1)$ 型になる。
]<def:contraction>

#proposition[
  縮約は基底の取り方に依らない。
]<prop:contraction>

#proof[
  $(1,1)$ 型で見る。@thm:transform より
  $ sum_i T'^i{}_i = sum_(i, k, l) (P^(-1))^i{}_k thin T^k{}_l thin P^l{}_i
    = sum_(k, l) delta^l{}_k thin T^k{}_l = sum_k T^k{}_k $
  である。一般の場合も、縮約する 2 本の添字に付く $P$ と $P^(-1)$ が同じ形で相殺する。
]

これで#link("/math/linear-algebra/1")[第 1 回]の宿題が一つ片付く。
跡（トレース）が基底に依らないのは、
#strong[$(1,1)$ 型テンソルの縮約という、基底を使わない操作だった]からである。
$upright("tr")(P^(-1) A P) = upright("tr")(A)$ という計算は、その事実の確認にすぎない。

いっぽう「上の添字どうしを足す」$sum_i T^(i i)$ は基底に依る。
$P$ が二つ掛かって相殺しないからである。
物理の式で添字が上下ペアでしか縮約されないのは、この理由による。

= 型を潰さない

添字の位置を気にせず $T_(i j)$ と書いてしまう流儀がある。
できるのは、計量で添字を下げているからである。
そして直交座標では $g_(i j) = delta_(i j)$ なので、下げても数字が変わらず、
型の違いが目に見えなくなる。

見えなくなっているだけである。上下を区別せずに済ませられるのは、
計量を一つ固定して、しかもそれが $delta$ に見える基底を使っているときだけで、
その事情は #link("/math/linear-algebra/6")[第 6 回]で清算する。

型を保ったまま書くと、同じ「2 階のテンソル」でも役割が違うことが見える。

#table(
  columns: (auto, auto, 1fr),
  [$(0,2)$], [$V times V arrow RR$], [双線形形式。計量がこれ],
  [$(1,1)$], [$V^* times V arrow RR$], [線形写像 $V arrow V$。跡が取れる],
  [$(2,0)$], [$V^* times V^* arrow RR$], [$V^*$ 上の双線形形式],
)

前の節で見たとおり、縮約できるのは上下の添字が揃っているときだけである。
$(0,2)$ 型の「跡」を取ろうとしても、基底に依らない意味を持たない。
型を潰すと、この区別ごと消えてしまう。

次回は、テンソルの中でも特に扱いやすい二種類——対称なものと反対称なもの——を切り出す。
#link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で数えた $1, 3, 3, 1$ が、そこで正体を現す。
