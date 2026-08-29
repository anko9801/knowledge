#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "一つの微分、一つの定理",
  date: "2026-08-20",
  field: "math",
  series: "vector-analysis",
  order: 3,
  tags: ("ベクトル解析",),
  summary: "外微分を一つ定義すると grad・div・rot がまとめて出る。二度当てると 0 になり、それが二つの恒等式の正体である。そして四つの積分定理は一本になる。仕上げに Maxwell 方程式が 4 本から 2 本になる。",
  provides: (
    "exterior-derivative",
    "dd-zero",
    "integration-in-rn",
    "boundary-in-rn",
    "stokes-in-rn",
  ),
  requires: (
    "one-form",
    "wedge-product",
  ),
)

= 二つの公式がどちらも $0$ になる

ベクトル解析には、成分を書き下すだけで確かめられる恒等式が二つある。
$ nabla times (nabla f) = bold(0), quad quad nabla dot (nabla times bold(A)) = 0 $

どちらも偏微分の順序を入れ替えると打ち消し合って消える。計算は合っている。

だが#strong[なぜ二つとも $0$ なのか]は、その計算からは出てこない。
左は勾配に回転を当てたもので、答えは $3$ 成分のベクトル。
右は回転に発散を当てたもので、答えは $1$ 個のスカラー。
当てる演算子も、出てくるものの形も違う。それが両方 $0$ になる。

同じことが積分の側にも起きている。
Green、Gauss、Stokes。別々の名前が付いた定理が、
どれも#strong[中で微分したものを、境界での積分に移す]という同じ形をしている。

偶然ではない。#strong[微分の操作が、はじめから一つしかないからである。]

= 残っている操作

#link("/math/vector-analysis/2")[前回]、関数から $1$ 形式を作る操作 $dif$ を定めた。
$ dif f = sum_i frac(partial f, partial x^i) dif x^i $

足りないのは、これを $1$ 形式や $2$ 形式にも当てる方法である。
定めれば、#link("/math/vector-analysis/1")[第 1 回]で予告した梯子
$ Lambda^0 attach(-->, t: dif) Lambda^1 attach(-->, t: dif) Lambda^2 attach(-->, t: dif) Lambda^3 $
が完成し、rot と div が向こう側から出てくるはずである。

拡張の仕方は、一つしかないと言ってよい。
$k$ 形式は $f thin dif x^(i_1) and dots.c and dif x^(i_k)$ の和で書けるので、
係数の関数だけを微分してやればよい。

#definition[
  $ omega = sum_I f_I thin dif x^(i_1) and dots.c and dif x^(i_k) $
  に対し、#strong[外微分]を
  $ dif omega := sum_I dif f_I and dif x^(i_1) and dots.c and dif x^(i_k) $
  で定める。$k$ 形式を $(k+1)$ 形式に移す操作である。
]<def:exterior>

$dif x^(i_1) and dots.c$ の部分には触らない。座標の基底は場所によらないからである。
動くのは係数 $f_I$ だけで、その $dif f_I$ を前から楔で掛ける。それだけの定義である。

= 三つの演算子を取り出す

これだけで grad・div・rot がすべて出る。$3$ 次元の直交座標で確かめる。

== 勾配

$0$ 形式 $f$ に当てると、定義そのままである。
$ dif f = frac(partial f, partial x) dif x + frac(partial f, partial y) dif y + frac(partial f, partial z) dif z $
係数を並べれば $nabla f$ になる。

== 回転

ベクトル場 $bold(A)$ に対応する $1$ 形式
$ omega = A_x thin dif x + A_y thin dif y + A_z thin dif z $
に当てる。

#proposition[
  $ dif omega = (partial_y A_z - partial_z A_y) dif y and dif z
    + (partial_z A_x - partial_x A_z) dif z and dif x
    + (partial_x A_y - partial_y A_x) dif x and dif y $
]<prop:curl>

#proof[
  @def:exterior より $dif omega = dif A_x and dif x + dif A_y and dif y + dif A_z and dif z$ である。
  第一項を展開すると
  $ dif A_x and dif x = (partial_x A_x thin dif x + partial_y A_x thin dif y + partial_z A_x thin dif z) and dif x $
  で、$dif x and dif x = 0$ より第一項は消え、
  $partial_y A_x thin dif y and dif x + partial_z A_x thin dif z and dif x$ が残る。
  他の二項も同様に展開し、$dif y and dif x = - dif x and dif y$ などで基底の順序を揃えて集めればよい。
]

係数はまさに $nabla times bold(A)$ の成分である。
そして左辺は $2$ 形式であって、$1$ 形式ではない。
第 1 回で「回転はベクトルではない」と書いたのは、この一段のことだった。

== 発散

ベクトル場 $bold(B)$ に対応する $2$ 形式
$ beta = B_x thin dif y and dif z + B_y thin dif z and dif x + B_z thin dif x and dif y $
に当てる。

#proposition[
  $ dif beta = (partial_x B_x + partial_y B_y + partial_z B_z) thin dif x and dif y and dif z $
]<prop:div>

#proof[
  第一項は
  $ dif B_x and dif y and dif z
    = (partial_x B_x thin dif x + partial_y B_x thin dif y + partial_z B_x thin dif z) and dif y and dif z $
  であり、$dif y$ と $dif z$ を含む項は重複で消えるので $partial_x B_x thin dif x and dif y and dif z$ だけが残る。
  他の二項も同じで、基底の順序を $dif x and dif y and dif z$ に揃えると符号は $+$ になる。
]

係数は $nabla dot bold(B)$ である。三つとも @def:exterior の一行から出た。

#remark[
  ベクトル場を $1$ 形式と見るか $2$ 形式と見るかを、上では黙って選んだ。
  この選択には#strong[計量と向き付けが要る]（第 1 回の $star$ である）。
  外微分そのものに計量は要らないが、
  「三つの演算子として読む」ためには要る、という順序になっている。
]

= 二度当てると消える

#theorem[
  任意の形式について $dif (dif omega) = 0$。
]<thm:dd>

#proof[
  まず $0$ 形式 $f$ について。
  $ dif (dif f) = sum_j sum_i frac(partial^2 f, partial x^j partial x^i) dif x^j and dif x^i $
  である。係数 $partial^2 f \/ partial x^j partial x^i$ は $i, j$ の入れ替えで変わらず
  （偏微分の順序交換）、$dif x^j and dif x^i$ は入れ替えると符号が変わる。
  対称なものと反対称なものを掛けて全部足すと $0$ になる。

  一般の $omega = sum_I f_I thin dif x^I$ については、
  $dif omega = sum_I dif f_I and dif x^I$ にもう一度 @def:exterior を当てると
  $sum_I dif (dif f_I) and dif x^I$ になる
  （楔積を挟んだ微分の規則で、$dif x^I$ 側の微分は $0$ である）。
  前半より各項が $0$。
]

#example[実際に打ち消し合うところを見る][
  $f = x y$ とする。$dif f = y thin dif x + x thin dif y$。
  もう一度当てると
  $ dif (dif f) = dif y and dif x + dif x and dif y $
  で、$dif y and dif x = - dif x and dif y$ だから#strong[相殺する]。

  打ち消したのは、$partial^2 f \/ partial x partial y$ と
  $partial^2 f \/ partial y partial x$ が#strong[どちらも $1$ で等しい]からである。
  もし偏微分の順序で値が変わる関数なら、消えない。

  @thm:dd は結局、#strong[偏微分が交換すること]を楔積の反対称性で受けているだけである。
]

これで、講義で覚えさせられた二つの恒等式が同時に片付く。

#corollary[
  $ nabla times (nabla f) = bold(0), quad nabla dot (nabla times bold(A)) = 0 $
]<cor:identities>

#proof[
  前者は @thm:dd を $0$ 形式に、後者は $1$ 形式に当てて、
  @prop:curl と @prop:div の辞書で読み替えたものである。
]

$3$ 次元の梯子は 3 段しかないので、$dif$ を続けて 2 回当てられる場所も 2 か所しかない。
#strong[恒等式がちょうど二つある理由]は、これで尽きている。
覚える式ではなく、$partial_i partial_j$ が対称だという事実の言い換えだった。

= 境界には向きが伝わる

定理を述べる準備として、$partial Omega$ の向きを決めておく。ここを曖昧にすると符号が合わない。

#definition[
  向き付けられた $k$ 次元領域 $Omega$ の境界 $partial Omega$ には、次の規約で向きを入れる。
  境界の点で#strong[外向き]の方向 $bold(n)$ を取り、
  $(bold(n), bold(e)_1, dots, bold(e)_(k-1))$ が $Omega$ の向きと合うとき、
  $(bold(e)_1, dots, bold(e)_(k-1))$ を $partial Omega$ の正の向きとする。
]<def:induced>

「外向きを先頭に置く」という一つの約束である。
ばらばらに覚えていた三つの規約は、これの $k = 1, 2, 3$ の場合にすぎない。

#table(
  columns: (auto, 1fr),
  [$k = 1$], [区間の右端が $+$、左端が $-$。だから $f(b) - f(a)$ と引き算になる],
  [$k = 2$], [面の向きに対して境界は#strong[反時計回り]。右ねじの規則],
  [$k = 3$], [立体の表面は#strong[外向き法線]],
)

Gauss の定理で法線を外へ向けるのも、Stokes の定理で周回を反時計回りに取るのも、
微積分学の基本定理が引き算になるのも、この一行から出ている。

= 一つの定理

#theorem("一般化された Stokes の定理")[
  向き付けられたコンパクトな $k$ 次元領域 $Omega$ と、
  その上の（滑らかな）$(k-1)$ 形式 $omega$ について
  $ integral_Omega dif omega = integral_(partial Omega) omega $
  ここで $partial Omega$ の向きは @def:induced による。
]<thm:stokes>

#proof[
  まず $Omega$ が単位立方体 $[0,1]^k$ の場合を示す。座標を $u^1, dots, u^k$ とする。

  $(k-1)$ 形式は基底の和なので、線形性より、
  ある $j$ について $dif u^j$ だけを欠いた項
  $ omega = f thin dif u^1 and dots.c and dif u^(j-1) and dif u^(j+1) and dots.c and dif u^k $
  を調べれば足りる。

  #strong[左辺。] @def:exterior より $dif omega = dif f and dif u^1 and dots.c$ であるが、
  $dif f$ の展開のうち $dif u^i$（$i != j$）の項は基底の重複で消える。残るのは $i = j$ の項で、
  $dif u^j$ を先頭から $j$ 番目へ移すのに $j - 1$ 回の入れ替えが要るから
  $ dif omega = (-1)^(j-1) frac(partial f, partial u^j) thin dif u^1 and dots.c and dif u^k $
  である。これを立方体で積分し、$u^j$ について 1 次元の微積分学の基本定理を使うと
  $ integral_Omega dif omega = (-1)^(j-1) integral_([0,1]^(k-1))
      (lr(f|)_(u^j = 1) - lr(f|)_(u^j = 0)) $
  を得る。

  #strong[右辺。] 立方体の境界は $2k$ 枚の面からなる。
  面 $u^i = 0$ または $1$（$i != j$）の上では $dif u^i = 0$ であり、
  $omega$ はその $dif u^i$ を含むので、制限すると $0$ になる。寄与するのは $u^j = 0, 1$ の 2 枚だけである。

  この 2 枚の上で $omega$ は $f thin dif u^1 and dots.c$（$dif u^j$ を欠く）に制限される。
  @def:induced で向きを入れると、面 $u^j = 1$ の外向きは $+u^j$ 方向なので、
  これを先頭に持ってくるのに $j - 1$ 回の入れ替えが要り、符号は $(-1)^(j-1)$ になる。
  面 $u^j = 0$ の外向きは逆なので符号も逆である。よって
  $ integral_(partial Omega) omega = (-1)^(j-1) integral_([0,1]^(k-1))
      (lr(f|)_(u^j = 1) - lr(f|)_(u^j = 0)) $
  となり、左辺と一致する。

  #strong[一般の場合。] $Omega$ を、立方体の像となる小片に分けて貼り合わせる。
  両辺とも小片についての和になるが、右辺で現れる面のうち
  #strong[小片どうしが接している面は 2 度数えられ、しかも外向きが互いに逆]なので打ち消し合う。
  残るのは $partial Omega$ に乗っている面だけである。
]

証明の中身は、要するに 1 次元の微積分学の基本定理を $j$ 方向に一度使っただけである。
残りはすべて、基底の並べ替えで出る符号の管理と、内側の面が相殺するという幾何の話でしかない。

== 三つの定理を取り出す

@thm:stokes に次数を入れると、講義で別々に習ったものが順に出る。

#table(
  columns: (auto, auto, 1fr),
  [$k$], [$omega$], [出てくる定理],
  [$1$], [$0$ 形式 $f$], [$display(integral_C dif f = f(B) - f(A))$。勾配定理。$1$ 次元なら微積分学の基本定理],
  [$2$], [$1$ 形式 $A_i dif x^i$], [@prop:curl より左辺が $nabla times bold(A)$ の面積分。Stokes の定理],
  [$3$], [$2$ 形式 $B_i thin dif x^j and dif x^k$], [@prop:div より左辺が $nabla dot bold(B)$ の体積積分。発散定理],
)

三つとも、$dif$ の定義と @thm:stokes に代入しただけである。
別々の定理ではなかった。

#remark[
  ただし、この表の「出てくる定理」の欄を書くには、
  ベクトル場を $1$ 形式や $2$ 形式に翻訳する辞書が要り、辞書には計量が要る。
  つまり#strong[古典的な三つの定理のほうが、@thm:stokes より狭い]。
  一般化された定理は計量を要求しないので、長さも角度も定義されていない空間でも成り立つ。
]

= ご褒美：Maxwell 方程式が 2 本になる

道具がそろったので、第 1 回で予告した式を読む。

舞台を $4$ 次元の時空にする。$1$ 形式のポテンシャル
$ A = -phi.alt thin dif t + A_x thin dif x + A_y thin dif y + A_z thin dif z $
を取り、その外微分
$ F := dif A $
を考える。$F$ は $2$ 形式で、第 1 回で数えたとおり成分は $binom(4, 2) = 6$ 個ある。

計算すると、その 6 個はこう並ぶ。

$ F = (E_x thin dif x + E_y thin dif y + E_z thin dif z) and dif t
  + B_x thin dif y and dif z + B_y thin dif z and dif x + B_z thin dif x and dif y $

ここで $bold(E) = -nabla phi.alt - partial_t bold(A)$、$bold(B) = nabla times bold(A)$ である。
電場と磁場は、$4$ 次元の $2$ 形式を「時間を含む成分」と「含まない成分」に分けただけのものだった。

#theorem[
  Maxwell 方程式は
  $ dif F = 0, quad dif star F = J $
  と書ける。
]<thm:maxwell>

第一の式は、$F = dif A$ と @thm:dd から自動的に成り立つ。展開すると
$dif x and dif y and dif z$ の成分が $nabla dot bold(B) = 0$ を与え、
$dif t$ を含む三つの成分が $nabla times bold(E) + partial_t bold(B) = bold(0)$、
すなわち Faraday の法則を与える。#strong[磁気単極子が無いことと電磁誘導は、同じ一本の式]である。

第二の式が Gauss の法則と Ampère--Maxwell の法則を与える。
ここには $star$ が入っているので、時空の計量を使っている。

そして電荷保存則も、ただで出る。@thm:maxwell の第二式に $dif$ を当てると
$ dif J = dif (dif star F) = 0 $
であり、これは
$ partial_t rho + nabla dot bold(j) = 0 $
に他ならない。@thm:dd の系である。

#strong[電荷が保存する理由は、$dif$ を二度当てると消えることだった。]
$4$ 本の方程式を $2$ 本にたたみ、保存則を定理に格下げする。これが書き換えの見返りである。

#check[
  @thm:maxwell の第一式は $F = dif A$ と @thm:dd から自動的に出る、と書いた。
  すると $nabla dot bold(B) = 0$ も Faraday の法則も、
  #strong[法則ではなく記法の帰結]ということになる。
  実験で確かめられてきた内容は、どこへ行ったのか。
][
  #strong[$A$ が存在するという仮定のほうへ移った。]

  $dif F = 0$ が $F = dif A$ から出るのは正しい。だが逆は、
  #strong[穴の無い領域でしか]言えない。$dif F = 0$ を満たす $F$ に対して
  大域的な $A$ が取れるかどうかは、領域の形の問題である。

  だから「ポテンシャル $A$ から出発する」と決めた時点で、
  $dif F = 0$ より強いことを仮定している。実際、磁気単極子があると
  $dif F = 0$ は成り立つのに、大域的な $A$ は存在しない。

  つまり内容は消えていない。#strong[「磁気単極子は無い」という実験事実が、
  「$A$ が書ける」という仮定に姿を変えている]だけである。
  法則として書くか、出発点の設定として書くかの違いになる。

  この記事の最後に「穴の話が残っている」と書くのは、そのためである。
  @thm:dd の逆が成り立つ範囲を測る道具が要る。
]

#remark[
  さらに、この形は座標を一つも選んでいない。
  曲がった時空でも、$dif F = 0$ はそのままの形で成り立つ。
  変えなければならないのは $star$ の側、つまり計量が入る側だけである。
  一般相対論と電磁気を同時に扱うとき、この分業が効く。
]

= 何を残したか

三回かけて、第 1 回の主張を組み立てた。

#table(
  columns: (auto, 1fr),
  [演算子は一つ], [@def:exterior の $dif$。grad・rot・div はその三つの顔],
  [恒等式は一つ], [@thm:dd の $dif dif = 0$。二つの公式はその 2 例],
  [定理は一つ], [@thm:stokes。四つの積分定理はその次数違い],
)

残したものも書いておく。

#strong[$star$ を正面から扱っていない。] Hodge スターには計量が要る。
Laplacian も、内積も、$abs(bold(A))$ も、この側にある。
「$dif$ には計量が要らない」という売り文句が効くのは梯子の縦方向だけで、
横向きの同一視には最初から計量が要る。
曲線座標で div の公式が座標系ごとに違う形になるのも、この $star$ のせいである。

#strong[穴の話が残っている。] @thm:dd の逆——$dif omega = 0$ なら $omega = dif eta$ か——は、
領域に穴が無ければ正しい。無ければ、である。
第 1 回で挙げた Aharonov--Bohm 効果と磁気単極子は、
その但し書きが破れる場所が観測にかかる、という例だった。
破れ方を数える道具が de Rham コホモロジーで、そこから先は幾何の話になる。

#strong[これが唯一の言語でもない。] Clifford 代数（幾何代数）では、
ベクトルと $2$ 形式を足し合わせることができ、スピノルまで同じ枠に収まる。
微分形式は「積分できるもの」を整理するには最良だが、
回転を作用させる側の記述には向いていない。

そして最後にもう一度、第 1 回の但し書きを繰り返しておく。
#strong[$3$ 次元の計算だけをするなら、$nabla$ の記法のほうが速い。]
この連載は $nabla$ を捨てさせるために書いたのではない。
$nabla$ が何を折り畳んでいたのかを見せるために書いた。

折り畳まれていたのは、$1, 3, 3, 1$ という数え上げと、
それを許した「我々は $3$ 次元にいる」という事実である。
