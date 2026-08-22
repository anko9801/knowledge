#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "曲がりを積むと整数が出る",
  date: "2026-08-21",
  field: "math",
  series: "groups",
  order: 4,
  tags: ("群と表現",),
  summary: "束の切断を微分するには、比べる方法を外から決める必要がある。それが接続で、曲がりを測ると曲率になる。曲率から作った不変式を全体で積分すると、接続の取り方に依らない数——それも整数——が出てくる。",
  provides: (
    "bundle-connection",
    "characteristic-class",
  ),
)

= 好きに選んだのに、答えが整数になる

離れた二点にあるものを比べる方法を、一つ決める。
決め方は無数にあって、どれを選んでも構わない。
次に、選んだその比べ方がどれだけ捻れているかを各点で測り、空間全体で足し上げる。

#strong[答えが整数になる。]

選び方を変えれば、各点で測った値は変わる。連続に、なめらかに変わる。
足し上げる途中の量も、そのぶん動く。
それなのに#strong[総和だけが動かない]。$2$ が $2.03$ になることがない。
$2$ か $3$ かのどちらかで、あいだが無い。

連続に選べるものから、連続でない量が出ている。
どこかで、選んだ分がきれいに打ち消し合っているはずである。

= 同じ困難が、また出る

#link("/math/groups/3")[前回]、束の切断を微分できないところで止まった。
$s(p)$ と $s(q)$ が別のファイバーにいるので、引き算が定義されていない。

#link("/math/riemannian-geometry/3")[Riemann 幾何 第 3 回]と同じ困難である。
そして答えも同じで、#strong[比べる方法を外から決める]。

#definition[
  ベクトル束 $E arrow M$ の#strong[接続]とは、切断に作用する写像
  $ nabla : Gamma(E) arrow.long Gamma(T^* M times.o E) $
  であって、Leibniz 則
  $ nabla (f s) = dif f times.o s + f nabla s $
  を満たすものをいう。
]<def:connection>

条件は Leibniz 則だけである。
#link("/math/riemannian-geometry/3")[Riemann 幾何]の定義と見比べると、
「$X$ について関数線形」の条件が $T^* M$ に吸収されている。同じものである。

局所自明化を取ると
$ nabla = dif + A $
と書ける。$A$ は $frak(g)$ に値を取る $1$ 形式で、#strong[接続形式]と呼ぶ。
$frak(g)$ は #link("/math/groups/1")[第 1 回]の Lie 代数である。

#strong[$Gamma^k{}_(i j)$ も $A_mu$ も、この $A$ の成分である。]
前者は接束、後者は $upright("U")(1)$ 束の場合にすぎない。

#proposition[
  貼り合わせを $g$ で取り替えると
  $ A arrow.long.bar g A g^(-1) + g thin dif g^(-1) $
  と変わる。第二項があるので、$A$ はテンソルではない。
]<prop:gauge-transform>

#link("/math/riemannian-geometry/3")[Christoffel 記号がテンソルでない]のと同じ形である。
そして物理では、この式が#strong[ゲージ変換]と呼ばれる。

= 曲率

接続を二回当てると、テンソルが残る。

#definition[
  $ F := nabla compose nabla in Gamma(Lambda^2 T^* M times.o upright("End")(E)) $
  を#strong[曲率]と呼ぶ。局所的には
  $ F = dif A + A and A $
]<def:curvature>

$nabla nabla$ は微分作用素になりそうだが、Leibniz 則を二回使うと微分の項が消えて、
$0$ 階の作用素——つまりテンソル——になる。
#link("/math/riemannian-geometry/5")[Riemann 幾何 第 5 回]で
曲率がテンソルになることを示したのと、同じ計算である。

#proposition[
  貼り合わせの取り替えで
  $ F arrow.long.bar g F g^(-1) $
  となる。第二項が出ないので、$F$ は#strong[テンソルである]。
]<prop:curvature-tensor>

$A$ は座標（ゲージ）で消せるが、$F$ は消せない。
#link("/math/riemannian-geometry/3")[Riemann 幾何 第 3 回]で
「$Gamma$ は消せるが $R$ は消せない」と書いたのと、同じ事実である。

#table(
  columns: (auto, auto, 1fr),
  [], [接続], [曲率],
  [接束], [$Gamma^k{}_(i j)$], [$R^l{}_(k i j)$],
  [$upright("U")(1)$ 束], [$A_mu$], [$F_(mu nu) = partial_mu A_nu - partial_nu A_mu$],
  [一般], [$A$（$frak(g)$ 値 $1$ 形式）], [$F = dif A + A and A$],
)

$upright("U")(1)$ は可換なので $A and A = 0$ になり、第二項が消える。
だから電磁場だけ式が簡単に見える。非可換群では消えない。

#remark[
  Bianchi 恒等式も同じ形で出る。
  $ nabla F = 0 $
  これは $nabla nabla nabla$ を二通りに括ることから従い、
  #link("/math/riemannian-geometry/6")[Riemann 幾何 第 6 回]の第二 Bianchi 恒等式と、
  電磁気の $dif F = 0$ の両方を含んでいる。
]

= 曲率を積むと、接続に依らない数が出る

ここからが本題である。

$F$ は接続の取り方に依る。別の接続を取れば別の $F$ になる。
ところが、$F$ から作ったある種の式を#strong[全体で積分すると、接続に依らなくなる]。

#theorem("Chern--Weil")[
  $frak(g)$ 上の不変多項式 $P$（$P(g X g^(-1)) = P(X)$）に対し、
  $P(F)$ は閉形式であり、そのコホモロジー類
  $ [P(F)] in H^*_(upright("dR")) (M) $
  は接続の取り方に依らない。
]<thm:chern-weil>

#proof[
  二つの接続 $A_0, A_1$ を線分で結び $A_t = (1-t) A_0 + t A_1$ とする。
  $t$ で微分すると、Bianchi 恒等式と $P$ の不変性から
  $ frac(dif, dif t) P(F_t) = dif omega_t $
  の形になる（$omega_t$ は $A_1 - A_0$ と $F_t$ から作られる形式）。
  $t$ で積分すれば差が完全形式になり、類が一致する。
]

#strong[局所的に決めた接続の情報が、大域的な位相不変量になった。]

こうして得られる類を#strong[特性類]と呼ぶ。
Chern 類、Pontryagin 類、Euler 類がその例である。

#example[Chern 数は整数である][
  $upright("U")(1)$ 束について
  $ c_1 := frac(1, 2 pi) [F] in H^2 (M) $
  を第一 Chern 類と呼ぶ。閉曲面 $Sigma$ 上で積分すると
  $ frac(1, 2 pi) integral_Sigma F in ZZ $
  になる。#strong[整数である。]

  理由は、$F$ を $A$ で書くのに二枚の局所自明化が要り、
  重なりでの貼り合わせが一価であることを要求すると、
  積分が巻き数になるからである。
  #link("/math/differential-forms/7")[微分形式 第 7 回]で扱った
  磁気単極子の量子化条件は、この整数性のことだった。
]

#check[
  @prop:gauge-transform の
  $A arrow.long.bar g A g^(-1) + g thin dif g^(-1)$ は、$g$ をうまく選べば
  $A$ を $0$ にできそうに見える。実際、一点のまわりでは消せる。
  消えれば @def:curvature から $F = 0$、したがって $c_1 = 0$ である。
  #strong[それなのに整数 $2$ が出るのは、どこが違うからか。]
][
  #strong[消せるのは近傍だけで、一枚のゲージでは消せないからである。]

  $A$ を消す $g$ を探すのは、$dif g^(-1) = - g^(-1) A$ という
  微分方程式を解くことである。方程式なので、解けるとは限らない。
  可積分条件を書き下すと、それがちょうど $F = 0$ になる。
  #strong[$F != 0$ の場所では、そもそも局所的にすら解けない。]

  そして $F = 0$ であっても、まだ足りない。近傍ごとに $g$ が取れても、
  重なりで一致するとは限らないからである。一致させながら全体を回ると、
  戻ってきたときに $g$ が元に戻らないことがある。

  上の例が「二枚の局所自明化が要る」と書いたのは、この事情である。
  整数は各点の $F$ からではなく、#strong[二枚の貼り合わせ方]から出ている。
  貼り合わせは一価でなければならず、一価性が離散的な条件だから、
  出てくる数も離散になる。

  #strong[局所的に消せることと、大域的に消せることの差。]
  その差を測る量が特性類である。
]

#strong[連続に変えられる量（接続）から、飛び飛びの値（整数）が出る。]
これが特性類の値打ちである。連続変形で動かないので、分類に使える。

= 何がここで起きたか

三つの連載が、ここで合流する。

#table(
  columns: (auto, 1fr),
  [#link("/math/riemannian-geometry/3")[Riemann 幾何]], [接束の接続。曲率が測地線の離れ方を決めた],
  [#link("/math/differential-forms/7")[微分形式]], [コホモロジー。穴の数を数えた],
  [#link("/math/groups/1")[群と表現]], [Lie 群と表現。貼り合わせの群],
)

そして @thm:chern-weil が三つを繋ぐ。
#strong[接続（幾何）から作った量が、コホモロジー（位相）の元になり、
その値が群（代数）で決まる。]

#link("/math/riemannian-geometry/7")[Riemann 幾何 第 7 回]の Gauss--Bonnet も、
この枠に入る。$integral K = 2 pi chi$ は、Euler 類の積分が
Euler 標数になる、という主張の $2$ 次元版である。
一般次元の Chern--Gauss--Bonnet が、その形になっている。

#remark[
  物理では、この整数性が観測にかかる。
  量子ホール効果で伝導度が $sigma = nu thin e^2 \/ h$ となり、$nu$ が
  $10^(-9)$ の精度で整数になるのは、$nu$ が Chern 数だからである。
  試料の形も不純物も連続的な変形なので、整数を動かせない。

  #link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で
  この例を「作用に絶対的な目盛りがある」証拠として挙げたが、
  正確には#strong[特性類が整数値を取る]ことの帰結だった。
]

= 連載を閉じる

四回でやったことをたたむ。

#table(
  columns: (auto, 1fr),
  [Lie 群], [連続な対称性。単位元の接空間に落ちる],
  [表現], [群を行列として見る。指標で分類できる],
  [束], [各点に空間を貼る。貼り合わせ方に群が現れる],
  [接続と曲率], [比べる方法を決める。曲がりを積むと整数が出る],
)

対称性を仮定すると計算せずに分かることが増える、というのが第 2 回の結論だった。
第 4 回の結論はもう少し強い。
#strong[対称性を仮定すると、連続に動かせない量が現れる。]

動かせないものは分類に使える。だから群が幾何と位相の両方に効く。
