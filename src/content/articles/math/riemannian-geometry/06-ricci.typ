#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "Ricci と Bianchi",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 6,
  tags: ("Riemann 幾何",),
  summary: "曲率を縮約すると Ricci テンソルが出る。その意味は測地球の体積の変化率である。そして Bianchi 恒等式から、発散が恒等的にゼロになる組み合わせがただ一つ決まる。",
  provides: (
    "ricci-tensor",
    "scalar-curvature",
    "weyl-tensor",
    "bianchi-identity",
    "einstein-tensor",
    "bonnet-myers",
  ),
  requires: (
    "riemann-curvature",
    "contraction",
    "covariant-derivative",
  ),
)

#layer("L2 ＋ 接続", metric: true)[前回の曲率を縮約し、微分の恒等式を一つ導く]

= 20 個は多すぎる

前回、$4$ 次元の Riemann テンソルが $20$ 個の独立成分を持つことを見た。
$n$ 次元なら $n^2(n^2-1)\/12$ 個で、次元とともに急に増える。

これでは扱いにくい。#strong[縮約して情報を落とし、扱える大きさにする]のが常道である。

だが、どう落としてもよいわけではない。落とし方に自由が無いこと、
そして落としたあとに残る量が微分の恒等式を満たすこと。この二つがこの記事の内容である。

= 縮約する

#definition[
  $ R_(mu nu) := R^lambda{}_(mu lambda nu), quad R := g^(mu nu) R_(mu nu) $
  を#strong[Ricci テンソル]、#strong[スカラー曲率]と呼ぶ。
]<def:ricci>

前回の対称性から、$R_(mu nu)$ は対称になり、成分は $n(n+1)\/2$ 個である
（$n = 4$ なら $10$ 個）。

他の縮約の仕方もあるが、前回の対称性のせいで、
$0$ になるか $R_(mu nu)$ の符号違いになるかしかない。
#strong[$4$ 本の添字から $2$ 本へ落とす方法は、本質的に一つ]である。

== Ricci は体積の変化率である

$R_(mu nu)$ の幾何的な意味を書いておく。

一点から、あらゆる方向へ測地線を出す。
平坦なら、半径 $r$ の測地球の体積は $RR^n$ の球と同じになる。
曲がっていると、ずれる。そのずれが
$ frac(upright("測地球の体積"), upright("平坦な球の体積"))
  = 1 - frac(R, 6(n+2)) r^2 + O(r^4) $
と展開でき、方向を指定した版が $R_(mu nu)$ である。

#table(
  columns: (auto, 1fr),
  [$R_(mu nu) u^mu u^nu > 0$], [その方向へ出した測地線の束が収束する。体積が減る],
  [$R_(mu nu) u^mu u^nu < 0$], [発散する。体積が増える],
)

#strong[Ricci テンソルは、体積が縮むか膨らむかを測っている。]
断面曲率が方向ごとの $2$ 次元の曲がりを見ていたのに対し、
Ricci はその方向まわりの平均を取ったものである。

落ちた $n^2(n^2-1)\/12 - n(n+1)\/2$ 個の情報は、#strong[Weyl テンソル]と呼ばれる。
$n = 4$ なら $20 - 10 = 10$ 個で、こちらは体積を変えずに形だけ歪める部分である。
$n <= 3$ では Weyl が恒等的に消えるので、前回書いたとおり
Riemann テンソルは Ricci で完全に決まる。

#remark[
  Ricci テンソルは、それ自身が幾何を強く縛る。
  $R_(mu nu) >= (n-1) k thin g_(mu nu)$（$k > 0$）が成り立つと、多様体は必ずコンパクトになり、
  直径が $pi \/ sqrt(k)$ 以下に抑えられる（Bonnet--Myers の定理）。
  #strong[局所的な曲率の下界が、大域的な有界性を強制する]わけである。

  逆に断面曲率が至るところ $<= 0$ なら、普遍被覆が $RR^n$ と微分同相になる
  （Cartan--Hadamard の定理）。曲率が位相を縛るという話の、二つの代表例である。
]

= 発散がゼロになる組み合わせ

$R_(mu nu)$ を微分すると何が起きるかを見る。
曲率には、微分についての恒等式が一つある。

#theorem("第二 Bianchi 恒等式")[
  $ nabla_lambda R_(mu nu rho sigma) + nabla_rho R_(mu nu sigma lambda)
    + nabla_sigma R_(mu nu lambda rho) = 0 $
]<thm:bianchi>

#proof[
  正規座標を取ると、その点で $Gamma = 0$ になる。
  曲率の成分表示から $Gamma Gamma$ の項が消え、
  $nabla_lambda R^m{}_(k i j) = partial_lambda (partial_i Gamma^m{}_(j k) - partial_j Gamma^m{}_(i k))$
  となる。三つを巡回して足すと、偏微分の順序交換ですべて相殺する。
  両辺がテンソルなので、一点で成り立てば全体で成り立つ。
]

@thm:bianchi を二回縮約すると
$ nabla^mu (R_(mu nu) - frac(1, 2) R thin g_(mu nu)) = 0 $
が出る。

#definition[
  $ G_(mu nu) := R_(mu nu) - frac(1, 2) R thin g_(mu nu) $
  を#strong[Einstein テンソル]と呼ぶ。
]<def:einstein-tensor>

$-1\/2$ という係数は、選んだのではない。
#strong[発散が $0$ になるように決まった]のである。

= 発散がゼロなものは、これしかない

$G_(mu nu)$ はたまたま見つかった組み合わせではない。

#theorem("Lovelock、1971 年")[
  $n = 4$ で、計量とその $2$ 階までの微分から作られる対称 $(0,2)$ 型テンソルで、
  発散が恒等的に $0$ になるものは
  $ alpha thin G_(mu nu) + lambda thin g_(mu nu) $
  の形に限る（$alpha, lambda$ は定数）。
]<thm:lovelock>

条件は四つである。

+ 計量から作る
+ $2$ 階微分まで
+ 対称
+ 発散が恒等的にゼロ

これだけで、残る自由度は係数 $2$ つになってしまう。
$g_(mu nu)$ 自身が入るのは $nabla g = 0$ だからで、
#link("/math/riemannian-geometry/3")[第 3 回]で接続に課した「計量的」という条件が
そのまま効いている。

#remark[
  この一意性は $n = 4$ の話である。
  $n >= 5$ では Gauss--Bonnet 項から作られる別の候補が現れ、
  条件を満たすテンソルの族が伸びていく（Lovelock テンソル）。
  $n = 4$ でその項が効かないのは、次回扱う Gauss--Bonnet の定理のためで、
  積分すると位相不変量になり、変分が恒等的に消える。

  「$4$ 次元だから一意」という事情は、
  #link("/math/vector-analysis/1")[ベクトル解析 第 1 回]の
  「$3$ 次元だから外積が書ける」と同じ種類の、次元に依る偶然である。
]

= Ricci がゼロでも平坦とは限らない

$R_(mu nu) = 0$ を満たす計量を#strong[Ricci 平坦]と呼ぶ。
これは $R_(mu nu rho sigma) = 0$ より弱い条件である。

$n <= 3$ では Weyl が消えるので、Ricci 平坦なら本当に平坦になる。
$n >= 4$ では Weyl 成分が残るので、#strong[Ricci 平坦だが平坦でない計量]が存在する。

#table(
  columns: (auto, 1fr),
  [$n <= 3$], [$R_(mu nu) = 0 arrow.r.double R_(mu nu rho sigma) = 0$。Ricci 平坦は平坦],
  [$n = 4$], [Weyl が $10$ 成分残る。Ricci 平坦で曲がっている多様体がある],
  [$n = 6$ など], [Calabi--Yau 多様体。Ricci 平坦な Kähler 多様体として分類が研究される],
)

Ricci 平坦性は、こうして#strong[多様体の分類の条件]として使われる。
曲率をどこまで落とせば「ほとんど平坦」と言えるのか、という問いの一つの答えである。

= 応用：Einstein 方程式

@thm:lovelock の条件を眺めると、あることに気づく。
「計量から作る、$2$ 階微分まで、対称、発散がゼロ」という四つは、
#strong[保存する対称テンソルと釣り合わせたい]ときに自然に出る条件である。

一般相対論はまさにそれをする。保存量を表す対称 $(0,2)$ 型テンソル $T_(mu nu)$
（$nabla^mu T_(mu nu) = 0$）を右辺に置き、左辺に @thm:lovelock の形を置く。

$ G_(mu nu) + Lambda g_(mu nu) = kappa thin T_(mu nu) $

方程式の形が決まってしまうのは、この記事で示した Bianchi 恒等式と Lovelock の定理による。
残る自由度は $Lambda$ と $kappa$ の $2$ つの定数だけで、そこから先は幾何の問題ではない。

= まとめ

#table(
  columns: (auto, 1fr),
  [Ricci $R_(mu nu)$], [曲率の縮約。測地球の体積の変化率],
  [Weyl], [残りの成分。体積を変えず形を歪める。$n <= 3$ では消える],
  [Bianchi], [$nabla^mu G_(mu nu) = 0$。$-1\/2$ の係数はここから出る],
  [Lovelock], [四条件を課すと $alpha G + lambda g$ に限る],
  [Bonnet--Myers], [Ricci の下界が直径を抑える。局所が大域を縛る],
)

最後の行が、次回の主題につながる。
局所的な曲率が大域的な形をどこまで決めるのか、という問いである。
次回はその極端な例——#strong[曲率を全部足すと位相不変量になる]——を見て、
#link("/math/differential-forms/7")[微分形式]の連載と合流する。
