#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "曲率を全部足すと、形が消える",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 7,
  tags: ("Riemann 幾何",),
  summary: "曲面の曲率を全体で積分すると、計量に一切依らない数が出る。どう凹ませても総和が変わらない。計量の情報が積分で消えて位相だけが残る、というこの現象が、微分形式の連載で数えた穴と同じものである。",
)

#layer("L2 ＋ 接続", metric: true)[計量で積分し、答えが計量に依らないことを見る]

= 計量で積分したのに、計量が消える

この連載は計量を入れるところから始まった。
長さが測れ、体積が測れ、曲率が測れるようになった。
どれも計量に依る量である。

最後に、依らない量を作る。

= 計量入りの積分

#definition[
  Riemann 多様体 $(M, g)$ 上の関数 $f$ の積分を
  $ integral_M f thin upright("vol") = integral_M f sqrt(g) thin dif x^1 dots.c dif x^n $
  で定める。
]<def:riemann-integral>

#link("/math/differential-forms/6")[微分形式 第 6 回]で
「関数は積分できない」と書いた。それが解消している。
計量があると体積形式 $upright("vol")$ が決まるので、
$f$ に掛けて $n$ 形式にできるからだ。

#strong[関数を積分するには計量が要る]、というのが正確な言い方だった。
$RR^n$ でそれを意識せずに済んでいたのは、標準の計量を使っていたからである。

発散定理も、この形で書き直せる。

#theorem[
  ベクトル場 $X$ に対し
  $ integral_M (nabla_mu X^mu) sqrt(g) thin dif^n x
    = integral_(partial M) X^mu n_mu sqrt(h) thin dif^(n-1) x $
  ここで $n_mu$ は外向き単位法線、$h$ は境界に誘導された計量である。
]<thm:divergence>

#proof[
  $nabla_mu X^mu = (1 \/ sqrt(g)) partial_mu (sqrt(g) X^mu)$ が示せる
  （Christoffel 記号の縮約 $Gamma^mu{}_(mu nu) = partial_nu ln sqrt(g)$ による）。
  すると被積分関数が $partial_mu (sqrt(g) X^mu)$ になり、
  $(n-1)$ 形式 $star flat X$ に対する Stokes の定理そのものになる。
]

一般相対論でエネルギーの保存を積分形で書くとき、
$sqrt(g)$ と法線が現れるのは @thm:divergence のせいである。

= Gauss--Bonnet

曲面（$n = 2$）に限ると、驚くことが起きる。

#theorem("Gauss--Bonnet")[
  コンパクトで向き付け可能な曲面 $M$（境界なし）について
  $ integral_M K thin upright("vol") = 2 pi chi(M) $
  ここで $K$ は Gauss 曲率、$chi(M) = 2 - 2 g$ は Euler 標数（$g$ は種数）。
]<thm:gauss-bonnet>

左辺は計量で書かれている。$K$ も $upright("vol")$ も計量に依る。
ところが右辺には計量が入っていない。#strong[穴の数だけである。]

#example[球を凹ませても変わらない][
  単位球面では $K = 1$、面積は $4 pi$ なので、左辺は $4 pi$。
  $chi(S^2) = 2$ なので右辺も $4 pi$。合う。

  この球を手で凹ませる。凹んだところは $K < 0$（鞍点）になり、
  まわりは $K$ が大きくなる。ところが#strong[総和は $4 pi$ のまま]である。

  どこかで曲率を減らすと、必ずどこかで増える。
  局所的にはいくらでも変えられるのに、全体の和が動かない。
]

#example[トーラス][
  $chi(T^2) = 0$ なので $integral K = 0$ である。
  ドーナツの外側は $K > 0$、内側（穴に面した側）は $K < 0$ で、
  ちょうど打ち消し合う。

  そして $chi = 0$ なので、トーラスには#strong[至るところ $K = 0$ の計量が入る]。
  平らなトーラスである（正方形の向かい合う辺を貼り合わせたもの）。
  球面には、そういう計量は入らない。
]

= 何が起きているのか

@thm:gauss-bonnet が示しているのは、次のことである。

#strong[計量を連続的に変えても、左辺は変わらない。]

計量を少し動かすと $K$ も $upright("vol")$ も変わる。
だがその変化は完全微分の形で書け、境界が無いので積分すると消える
（#link("/math/differential-forms/6")[微分形式 第 6 回]の系）。

つまり左辺は、計量の連続変形について不変な量である。
そして連続変形で移り合わない計量の違い——位相の違い——だけが残る。

#link("/math/differential-forms/7")[微分形式 第 7 回]で数えた Betti 数と、
ここで出た Euler 標数は
$ chi = sum_k (-1)^k b_k $
という関係にある。$S^2$ なら $1 - 0 + 1 = 2$、$T^2$ なら $1 - 2 + 1 = 0$。合う。

#strong[計量から出発した積分が、計量抜きで数えた穴と一致した。]
これが二つの連載の合流点である。

#remark[
  高次元への一般化は Chern--Gauss--Bonnet の定理で、
  偶数次元の閉多様体について
  $ integral_M upright("Pf")(R) = (2 pi)^(n\/2) chi(M) $
  が成り立つ（$upright("Pf")$ は曲率の Pfaffian）。

  $4$ 次元でのこの積分が、前回触れた Gauss--Bonnet 項である。
  位相不変量なので計量を変えても動かず、
  したがって変分しても運動方程式に寄与しない。
  #strong[$4$ 次元で Einstein 方程式が一意になる理由の一つが、この定理]である。
]

= 曲率と位相の関係

同じ形の主張が、いくつもある。

#table(
  columns: (auto, 1fr),
  [Gauss--Bonnet], [$integral K = 2 pi chi$。曲率の総和が位相を決める],
  [Poincaré--Hopf], [ベクトル場の特異点の指数の和 $= chi$],
  [Chern--Weil], [曲率から作った不変式の積分が、特性類（位相不変量）になる],
  [指数定理], [微分作用素の解の数の差が、位相で決まる（Atiyah--Singer）],
)

どれも「局所的な微分の情報を全体で積分すると、位相が出る」という形をしている。
$Lambda$ 上の解析と、穴の勘定が繋がっている。

物理では、この構造がそのまま観測にかかる。
量子ホール効果で伝導度が $10^(-9)$ の精度で整数になるのは、
その整数が位相不変量（Chern 数）だからで、
試料の形や不純物では変わらないためである。

= 連載を閉じる

七回でやったことをたたむ。

#table(
  columns: (auto, 1fr),
  [計量], [長さ・角度・体積・$star$。付加構造であり、常に存在する（Lorentz 計量は別）],
  [テンソル解析], [対称テンソルを扱うための記法。偏微分はテンソルにならない],
  [接続], [比べる方法を決める。計量的＋捩れなしで一意（Levi-Civita）],
  [測地線], [まっすぐと最短が一致する。局所的には平坦に見える],
  [曲率], [平行移動の経路依存性。座標で消せない。ゲージ場と同じ構造],
  [Einstein], [四条件を課すと左辺は決まる],
  [Gauss--Bonnet], [曲率の総和が位相になる],
)

== 四つの連載を並べて

ここまで四つの連載を書いた。層で並べると、こうなる。

#table(
  columns: (auto, auto, 1fr),
  [連載], [層], [仮定するもの],
  [#link("/math/linear-algebra/1")[線形代数]], [L0], [ベクトル空間。1 点での話],
  [#link("/math/vector-analysis/1")[ベクトル解析]], [L1＋L2], [$RR^3$。三つを混ぜたまま短く書く],
  [#link("/math/differential-forms/1")[微分形式]], [L1], [微分構造だけ。計量なし],
  [#link("/math/riemannian-geometry/1")[Riemann 幾何]], [L2], [＋計量、＋接続],
)

学ぶ順に並んでいるわけではない。
入口はベクトル解析で、詰まったところから下へ潜り、
必要になったところで上へ進む。そういう読み方を想定して書いた。

一貫して問うてきたのは、一つのことである。

#strong[いま使ったのは、どの構造か。]

$dif$ には計量が要らない。$star$ には要る。
積分には向き付けが要る。平行移動には接続が要る。
$Gamma$ は座標で消せる。$R$ は消せない。

この区別を持っていると、次に何が来ても位置づけができる。
ゲージ理論の接続も、シンプレクティック幾何の $2$ 形式も、
複素多様体の複素構造も、すべて「何を追加したか」で読める。

幾何とは、その管理のことだった。
