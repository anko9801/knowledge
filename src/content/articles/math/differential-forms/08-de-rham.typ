#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "微分方程式の解の個数が、穴の数である",
  date: "2026-08-21",
  field: "math",
  series: "differential-forms",
  order: 8,
  tags: ("微分形式",),
  summary: "位相の側にも穴を数える方法がある。三角形を貼るホモロジーで、微分をまったく使わない。それが解析の側のコホモロジーと一致する。さらに計量を入れると、各類に最も滑らかな代表元が一つ選べる。",
  provides: (
    "singular-homology",
    "de-rham-theorem",
    "hodge-theory",
  ),
)

= 材料を共有しない二つの数え方が、同じ答えを出す

一方は、微分方程式の話である。
ある方程式に解があるかどうかを問い、解けないものの個数を数える。
微分が要る。滑らかでない空間では、問いそのものが立たない。

もう一方は、三角形を貼る話である。
輪になっているのに、縁として張れる面が無いものを数える。
微分は一度も使わない。連続でありさえすればよい。

#strong[同じ数が出る。]

片方は解析の道具だけ、もう片方は位相の道具だけで作ってある。
途中で共有している材料が無い。それでも答えが合う。

= 穴を数える方法は、二つある

#link("/math/differential-forms/7")[前回]、閉形式と完全形式の差として
$H^k_(upright("dR"))$ を作った。微分方程式が解けるかどうかを数えたら、位相が出た。

これが解析の側の数え方である。位相の側にも、穴を数える方法がある。

= 三角形を貼る

#definition[
  標準 $k$ 単体から $M$ への連続写像を#strong[特異 $k$ 単体]と呼び、
  その形式的な整数係数の和を#strong[$k$ 鎖]という。
  境界作用素 $partial$ を「面を向き付きで並べる」ことで定め、
  $ H_k (M) := frac(ker partial_k, upright("im") partial_(k+1)) $
  を#strong[特異ホモロジー]と呼ぶ。
]<def:singular>

「三角形（の連続像）を貼り合わせて、輪になっているが縁を張れないものを数える」
という操作である。

前回の構成と、形が同じことに注意してほしい。

#table(
  columns: (auto, auto, 1fr),
  [], [de Rham], [特異ホモロジー],
  [対象], [$k$ 形式], [$k$ 鎖],
  [作用素], [$dif$（次数を上げる）], [$partial$（次数を下げる）],
  [二度で消える], [$dif dif = 0$], [$partial partial = 0$],
  [商], [閉 $\/$ 完全], [輪体 $\/$ 境界],
  [要る構造], [微分構造], [#strong[位相だけ]],
)

$partial partial = 0$ は「境界の境界は無い」で、
#link("/math/differential-forms/6")[第 6 回]で書いた $partial(partial M) = nothing$ と同じことである。

#strong[$H_k$ は連続写像だけで定義されている。]
滑らかさも計量も要らないので、多様体でない空間にも使える。

#example[$H_*(S^2)$][
  球面を二つの三角形で覆うと、$H_0 = ZZ$（連結）、$H_1 = 0$、$H_2 = ZZ$。
  前回 $b_0 = 1$、$b_1 = 0$、$b_2 = 1$ と計算したものと一致している。
]

= 二つが一致する

一致は偶然ではない。積分が対応を与える。

#theorem("de Rham")[
  $M$ を滑らかな多様体とすると、積分が誘導する写像
  $ H^k_(upright("dR")) (M) arrow.long upright("Hom")(H_k (M), RR) $
  $ [omega] arrow.long.bar ([c] mapsto integral_c omega) $
  は同型である。
]<thm:de-rham>

写像が well-defined であることは、#link("/math/differential-forms/6#thm-stokes")[Stokes の定理]から出る。
$omega$ を完全形式 $dif eta$ にずらすと
$ integral_c dif eta = integral_(partial c) eta = 0 quad (partial c = 0) $
となり、$c$ を境界 $partial b$ にずらすと
$ integral_(partial b) omega = integral_b dif omega = 0 quad (dif omega = 0) $
となる。#strong[どちらをずらしても値が変わらない。]

同型であることの証明は、Mayer--Vietoris を両側で回して、
可縮な開集合の上で一致することから貼り合わせる。

#strong[解析の問いと位相の問いが、同じ答えを持つ。]
「この微分方程式は解けるか」と「この空間に穴があるか」が、同じことを聞いていた。

#remark[
  $upright("Hom")(H_k, RR)$ という形になるのは、実係数で見ているためである。
  整数係数のホモロジーには#strong[捩れ]——有限位数の元——がありうるが、
  $RR$ に写すと消える。

  $RR P^2$ で $H_1 = ZZ\/2ZZ$ だが $H^1_(upright("dR")) = 0$ になる、というのがその例である。
  微分形式は、この種の情報を見ない。
]

#check[
  @thm:de-rham は同型だと言っている。ところが $RR P^2$ では
  $H_1 = ZZ\/2ZZ$ で元が $2$ 個あるのに、$H^1_(upright("dR")) = 0$ である。
  #strong[同型なのに数が合わないのは、どういうことか。]
][
  #strong[定理が同型だと言っているのは $H_k$ とではなく、$upright("Hom")(H_k, RR)$ とである。]

  $upright("Hom")(ZZ\/2ZZ, RR)$ を計算してみればよい。
  $f(1) = a$ とすると $2a = f(2) = f(0) = 0$ なので $a = 0$。
  $RR$ には位数 $2$ の元が無いから、写す先が $0$ しかない。
  つまり $upright("Hom")(H_1, RR) = 0$ で、$H^1_(upright("dR")) = 0$ と合っている。

  そもそも対応を与えたのが#strong[積分]だったことを思い出せばよい。
  $[c] arrow.long.bar integral_c omega$ は実数を返す。実数の側に
  「二周すると戻る」という現象が無いので、そういう情報は運べない。

  #strong[捩れは、積分では見えない種類の穴である。]
  $RR P^2$ の $1$ 次元の輪は、一周では境界にならないが二周すると境界になる。
  微分形式はこの「二周すれば」を区別する手段を持たない。

  それでも $b_1 = 0$ は正しい答えである。実係数で数えるかぎり穴は無い。
  #strong[何を数えているかが、係数で変わる。]
]

= 代表元を一つ選ぶ

コホモロジー類は「完全形式の差を無視した同値類」なので、代表元がたくさんある。
どれを選んでもよいが、#strong[最も自然なものが一つある]。

ただし、それを言うには計量が要る。この連載で使わずに来たものである。

計量と向きがあれば #link("/math/vector-analysis/5")[Hodge スター]が定まり、
$dif$ の随伴が作れる。

#definition[
  $delta := plus.minus star dif star$ を#strong[余微分]と呼ぶ。次数を $1$ 下げる。
  $ Delta := dif delta + delta dif $
  を#strong[Hodge--Laplace 作用素]、$Delta omega = 0$ を満たす $omega$ を#strong[調和形式]と呼ぶ。
]<def:laplacian-forms>

$0$ 形式に当てると、$Delta$ は通常の Laplacian になる。
#link("/math/vector-analysis/5")[ベクトル解析 第 5 回]で
$nabla^2 = star dif star dif$ と書いたものの一般化である。

#theorem("Hodge")[
  コンパクトで向き付け可能な Riemann 多様体上で、
  各 de Rham コホモロジー類に、調和形式である代表元がちょうど一つ存在する。
  すなわち
  $ H^k_(upright("dR")) (M) tilde.equiv cal(H)^k (M) $
  （$cal(H)^k$ は調和 $k$ 形式の空間）。
]<thm:hodge>

証明は楕円型作用素の理論による。ここでは、何が言えたかだけ見る。

#strong[調和形式は、その類の中でノルムが最小のものである。]
$omega = h + dif eta$ と分けると、$h$ と $dif eta$ が直交するので
$ norm(omega)^2 = norm(h)^2 + norm(dif eta)^2 >= norm(h)^2 $
になる。#link("/math/linear-algebra/8")[線形代数 第 7 回]の直交射影と同じ構造である。

#example[調和 $1$ 形式と穴][
  トーラス $T^2$ に平坦な計量を入れると、調和 $1$ 形式は
  $a thin dif theta_1 + b thin dif theta_2$（$a, b$ は定数）で、$2$ 次元。
  $b_1 = 2$ と一致する。

  $S^2$ では調和 $1$ 形式が $0$ しかない。$b_1 = 0$ と一致する。
  #strong[穴が無ければ、方程式 $Delta omega = 0$ の解も自明なものしかない。]
]

= 三つが同じものになった

並べておく。

#table(
  columns: (auto, auto, 1fr),
  [], [数えるもの], [要る構造],
  [$H_k$], [輪体 $\/$ 境界], [位相],
  [$H^k_(upright("dR"))$], [閉形式 $\/$ 完全形式], [微分構造],
  [$cal(H)^k$], [$Delta omega = 0$ の解], [計量],
)

三つとも次元が等しい。
そして#strong[要る構造が順に増えている]のに、答えが変わらない。

これがこの連載を通しての主張の、いちばん強い形である。
計量を足しても位相の情報は増えない。増えたのは#strong[代表元を一つ選ぶ能力]だけで、
数えられるものは最初から位相が決めていた。

#remark[
  Hodge 理論の値打ちは、この「一つ選べる」ことにある。

  複素多様体では、調和形式がさらに $(p,q)$ 型に分解し
  $ H^k = plus.o.big_(p+q=k) H^(p,q) $
  という分解が出る（Hodge 分解）。位相不変量である $b_k$ が、
  複素構造の情報を持つ細かい数に割れる。代数幾何の基本的な道具になっている。

  同じ構造は物理にも出る。ゲージ場の配位空間を調和形式で代表させると、
  ゲージの冗長性を落とした最小のノルムの配位が選べる。
]

= 構造を足したのに、数が増えなかった

#link("/math/differential-forms/7")[第 7 回]で
「計量を一度も使っていない」と書いたが、
最後に使ってみて、#strong[使っても数は変わらなかった]。

構造を足すと言えることが増える、というのがこの連載群の筋だった。
その例外がここにある。計量を足しても、数えられるものは増えない。
