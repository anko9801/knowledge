#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "内積を入れる",
  date: "2026-08-20",
  field: "math",
  series: "linear-algebra",
  order: 6,
  tags: ("線形代数",),
  summary: "内積を一つ選ぶと、V と V* が自然に同一視でき、長さと角度と体積が決まり、転置が意味を持つ。買えるものは多い。代わりに、選んだことを忘れるという代償を払う。",
)

#layer("L0 ＋ 計量", metric: true)[ここで初めて計量を入れる。以降の話はすべてこの選択に依る]

= 五回ぶん、内積なしで来た

ここまで長さも角度も使っていない。それでも、双対空間・テンソル・交代形式・行列式が
すべて定義できた。#strong[線形代数の骨格は、内積なしで立つ。]

この回で内積を入れる。何が買えるのかを先に並べておく。

#table(
  columns: (auto, 1fr),
  [$V tilde.equiv V^*$], [自然な同型になる。行と列の区別が消える。添字の上げ下げ],
  [長さと角度], [$abs(bold(v))$、$cos theta$、直交],
  [転置], [随伴写像として、基底なしに意味を持つ],
  [体積の基準], [$Lambda^n$ の「$1$」が決まる。向きと合わせて体積形式],
  [$star$], [$Lambda^k tilde.equiv Lambda^(n-k)$。外積と回転が $3$ 次元でベクトルに見える理由],
)

= 計量

#definition[
  $(0,2)$ 型テンソル $g$ が
  #strong[対称]（$g(bold(u), bold(v)) = g(bold(v), bold(u))$）かつ
  #strong[非退化]——すべての $bold(v)$ に対し $g(bold(u), bold(v)) = 0$ なら $bold(u) = bold(0)$——
  であるとき、$g$ を#strong[計量]と呼ぶ。
  さらに $bold(v) != bold(0)$ について $g(bold(v), bold(v)) > 0$ であるとき#strong[正定値]といい、
  この場合の $g$ を#strong[内積]と呼ぶ。
]<def:metric>

正定値を要求しないのは、時空を扱うためである。Minkowski 計量
$ g = upright("diag")(-1, 1, 1, 1) $
は非退化だが正定値ではない。「長さの 2 乗」が負になるベクトル（時間的ベクトル）がある。

= 買えるもの その一：$V$ と $V^*$ の同一視

#definition[
  $ flat : V arrow.long V^*, quad flat(bold(v)) := g(bold(v), dot) $
]<def:flat>

#proposition[
  $g$ が非退化なら $flat$ は同型である。基底を選んでいないので、これは自然な同型になる。
]<prop:flat-iso>

#proof[
  線形性は $g$ の双線形性から。核が $0$ であることが非退化性そのものであり、
  次元が等しいので同型である。
]

#link("/math/linear-algebra/2")[第 2 回]で「$V tilde.equiv V^*$ は自然でない」と強調した。
それが覆ったわけではない。#strong[$g$ を一つ選んだ]から自然になったのである。
選択の場所が、基底から計量に移っただけだ。

移したことには利点がある。基底は無数にあるが、
計量は物理的に決まっていることが多い（空間の距離、時空の因果構造）。
選択を一度で済ませられる。

成分で書くと、これが添字の上げ下げである。
$ v_i = g_(i j) v^j, quad v^i = g^(i j) v_j $
$g^(i j)$ は $g_(i j)$ の逆行列で、$flat$ の逆写像 $sharp$ にあたる。

#example[勾配がベクトルになる][
  #link("/math/vector-analysis/2")[ベクトル解析 第 2 回]で、
  $dif f$ は $1$ 形式であってベクトルではない、と書いた。
  $nabla f$ とは、その $dif f$ に @def:flat の逆を当てたもの
  $ nabla f = sharp(dif f) $
  である。だから $nabla f$ を書くには計量が要る。
  直交直線座標では $g_(i j) = delta_(i j)$ なので成分が動かず、区別が見えない。
]

= 買えるもの その二：転置の意味

#definition[
  $f : V arrow V$ に対し、
  $ g(f^dagger (bold(u)), bold(v)) = g(bold(u), f(bold(v))) $
  をすべての $bold(u), bold(v)$ について満たす $f^dagger$ を#strong[随伴写像]と呼ぶ。
  $f^dagger = f$ のとき $f$ は#strong[自己随伴]であるという。
]<def:adjoint>

正規直交基底で書けば、$f^dagger$ の行列は $f$ の行列の転置である。

#link("/math/linear-algebra/2")[第 2 回]で「転置の正体は双対写像 $f^* : V^* arrow V^*$」と書いた。
随伴はそれを $flat$ で $V$ に引き戻したものである。
$ f^dagger = sharp compose f^* compose flat $
つまり#strong[転置には二つの顔があり、片方は計量なしで書け、もう片方は計量が要る]。
「対称行列」という言い方が基底に依るのに「自己随伴」が依らないのは、この差である。

#definition[
  $g$ を保つ写像、すなわち $g(f(bold(u)), f(bold(v))) = g(bold(u), bold(v))$ を満たす
  $f$ の全体を#strong[直交群]と呼び、$upright("O")(g)$ と書く。
]<def:orthogonal>

正定値なら $upright("O")(n)$、Minkowski 計量なら $upright("O")(1,3)$、すなわち Lorentz 群である。
#strong[「変換群を決める」ことと「計量を決める」ことは同じ一つの選択]である。

= 買えるもの その三：体積と $star$

#link("/math/linear-algebra/5")[第 5 回]で、$Lambda^n V^*$ は 1 次元だが、
どれを「$1$」と呼ぶかは決まらない、と書いた。内積があると決まる。

#definition[
  正規直交基底 $(bold(e)_i)$ に対して $upright("vol")(bold(e)_1, dots, bold(e)_n) = 1$ となる
  $upright("vol") in Lambda^n V^*$ を#strong[体積形式]と呼ぶ。
]<def:volume>

正規直交基底の取り方には $upright("O")(n)$ ぶんの自由があるが、
その行列式は $plus.minus 1$ なので、$upright("vol")$ は符号を除いて一意である。
符号を決めるのが向き付けで、#strong[$upright("vol")$ を決めるには計量と向きの両方が要る]。

そして、この二つがあれば次数の対応が付く。

#definition[
  $ alpha and star beta = g(alpha, beta) thin upright("vol") quad (alpha, beta in Lambda^k V^*) $
  で定まる $star : Lambda^k V^* arrow.long Lambda^(n-k) V^*$ を#strong[Hodge スター]と呼ぶ。
  ここで $g$ は $Lambda^k$ 上に自然に誘導された内積である。
]<def:hodge>

前回 $Lambda^n$ が 1 次元であることを使ったのと同じ理屈で、次元が
$ binom(n, k) = binom(n, n-k) $
で一致することが、この同型を許している。

#example[外積が $3$ 次元にしか無い理由（再訪）][
  $n = 3$、$k = 2$ とすると $star : Lambda^2 arrow Lambda^1$ である。
  #link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で
  $ bold(a) times bold(b) = star (bold(a) and bold(b)) $
  と書いたのは、これのことだった。$2$ 形式をベクトルに戻せるのは $n - 2 = 1$、
  すなわち $n = 3$ のときだけである。

  そして #strong[この式には計量と向きが要る]。
  外積が「純粋に線形代数の操作」でないのは、$star$ を経由しているからである。
]

= 払う代償

ここまで買ったものを並べたので、代金も書く。

#strong[一つ、選択を忘れる。]
$V$ と $V^*$ が同一視でき、正規直交基底で成分が動かないので、
区別が「そもそも無かった」ように見えてしまう。
斜交座標に移った瞬間、単位を替えた瞬間、時空に移った瞬間に、
忘れていた選択の請求書が届く。極座標の公式が座標系ごとに違うのも、
$g_(i j)$ が $delta_(i j)$ でなくなるからである。

#strong[二つ、計量に依らない構造が見えなくなる。]
体積の比（行列式）、積分と Stokes の定理、位相的な情報。
これらは計量なしで成り立つのに、内積を先に入れてしまうと、
どこまでが計量のおかげなのか分からなくなる。
#link("/math/differential-forms/1")[微分形式]の連載をわざわざ計量なしで組むのは、
この切り分けを保つためである。

#strong[三つ、正定値を暗黙に仮定してしまう。]
「長さの 2 乗は正」は内積の性質であって、計量一般の性質ではない。
相対論に移ると、この直観がそのまま誤りになる。

#remark[
  代償を払わずに済ませる方法は無い。長さを測りたければ計量が要る。
  正しい態度は「使わない」ではなく、
  #strong[どこで使ったかを記録しておく]ことである。
  この連載と幾何の連載で各回の頭に層バッジを出しているのは、そのためである。
]

次回は、@def:adjoint の自己随伴写像を扱う。
#link("/math/linear-algebra/1")[第 1 回]で「一般には対角化できない」と書いたのに、
自己随伴なら必ずできてしまう。その理由も、内積にある。
