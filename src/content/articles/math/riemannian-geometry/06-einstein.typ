#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "Einstein 方程式の左辺は選べない",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 6,
  tags: ("Riemann 幾何",),
  summary: "曲率を縮約すると Ricci テンソルが出る。その意味は体積の変化率である。そして Bianchi 恒等式から発散がゼロになる組み合わせが一つ決まり、それが Einstein テンソルになる。左辺は思いつきで選ばれたのではない。",
)

#layer("L2 ＋ 接続", metric: true)[前回の曲率を縮約する。物理への接続が主]

= 20 個は多すぎる

前回、$4$ 次元の Riemann テンソルが $20$ 個の独立成分を持つことを見た。

物質の側は、エネルギー・運動量テンソル $T_(mu nu)$ で表される。
これは対称な $(0,2)$ 型なので $10$ 個である。

$20 != 10$ なので、$R_(mu nu rho sigma) prop T_(mu nu)$ とは書けない。
#strong[曲率のどの部分が物質と繋がるのか]を選ぶ必要がある。

選び方には、実は自由が無い。この記事はその話である。

= 縮約する

#definition[
  $ R_(mu nu) := R^lambda{}_(mu lambda nu), quad R := g^(mu nu) R_(mu nu) $
  を#strong[Ricci テンソル]、#strong[スカラー曲率]と呼ぶ。
]<def:ricci>

前回の対称性から、$R_(mu nu)$ は対称になり、成分は $10$ 個である。
$T_(mu nu)$ と同じ数になった。

他の縮約の仕方もあるが、前回の対称性のせいで、
$0$ になるか $R_(mu nu)$ の符号違いになるかしかない。
#strong[縮約の結果は本質的に一つ]である。

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

物質があると重力で引き寄せられ、測地線の束が収束する。
#strong[Ricci テンソルは、物質と直接繋がるべき量]だと分かる。

いっぽう Weyl テンソル（$20 - 10 = 10$ 個の残り）は、
体積を変えずに形だけ歪める部分である。
真空中を伝わる重力波はこちらで、
重力波の検出器が「一方向に伸びて直交方向に縮む」信号を見るのは、
体積を保つ変形だからである。

= 発散がゼロになる組み合わせ

物質の側には、満たすべき条件がある。

$ nabla^mu T_(mu nu) = 0 $

エネルギーと運動量の保存則である。
だから左辺に置く量も、発散が恒等的に $0$ でなければならない。
そうでなければ、方程式が保存則と矛盾する。

$R_(mu nu)$ 自身は、この条件を満たさない。

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

= 左辺は決まってしまう

これで方程式が書ける。

$ G_(mu nu) + Lambda g_(mu nu) = frac(8 pi G, c^4) T_(mu nu) $

$Lambda g_(mu nu)$ も発散が $0$（$nabla g = 0$ なので）なので、足してよい。
これが宇宙定数である。

そして、これ以外の選択肢がほとんど無い。

#theorem("Lovelock、1971 年")[
  $4$ 次元で、計量とその $2$ 階までの微分から作られる対称 $(0,2)$ 型テンソルで、
  発散が恒等的に $0$ になるものは
  $ alpha thin G_(mu nu) + lambda thin g_(mu nu) $
  の形に限る。
]<thm:lovelock>

#strong[左辺は思いつきで選ばれたのではない。]
次の四つを要求した時点で、決まってしまった。

+ 計量から作る（重力は幾何である）
+ $2$ 階微分まで（運動方程式が $2$ 階になる）
+ 対称テンソル（$T_(mu nu)$ と釣り合う）
+ 発散がゼロ（保存則と両立する）

残る自由度は係数 $alpha$ と $lambda$ の二つだけで、
前者は Newton 極限から $8 pi G \/ c^4$ に、後者は観測から決まる。

#link("/physics/mechanics/5")[解析力学 第 5 回]で
「理論を書くとは不変量を数え上げること」と書き、
Einstein--Hilbert 作用がその手続きで決まると述べた。
その主張の、方程式側からの姿がこれである。

#remark[
  この一意性は $4$ 次元の話である。
  $5$ 次元以上では Gauss--Bonnet 項という別の候補が現れ、
  Lovelock 重力と呼ばれる理論の族になる。
  $4$ 次元でその項が効かないのは、次回扱う Gauss--Bonnet の定理のためで、
  全微分になって運動方程式に寄与しない。

  「$4$ 次元だから一意」という事情は、
  #link("/math/vector-analysis/1")[ベクトル解析 第 1 回]の
  「$3$ 次元だから外積が書ける」と同じ種類の、次元に依る偶然である。
]

= 真空でも曲がる

方程式を眺めて、一つ確認しておく。

$T_(mu nu) = 0$（真空）とすると、$Lambda = 0$ のもとで
$ R_(mu nu) = 0 $
になる。だが $R_(mu nu rho sigma) = 0$ とは言っていない。

$4$ 次元では $20 - 10 = 10$ 個の Weyl 成分が残るので、
#strong[物質が無い場所でも曲率がありうる]。

これが重要である。

#table(
  columns: (auto, 1fr),
  [地球のまわり], [真空だが曲がっている。だから月が公転する],
  [重力波], [真空を伝わる曲率の波。$2015$ 年に直接検出],
  [ブラックホール], [物質は中心に落ちきっている。外側は真空で、それでも曲がっている],
)

前回書いたとおり、$3$ 次元では $R_(mu nu) = 0$ から $R = 0$ が出る。
だから $3$ 次元の重力は、物質の無い場所では完全に平坦で、
重力波もブラックホールの外部構造も存在しない。

$4$ 次元でようやく、重力が「離れたところへ伝わる」理論になる。

= まとめ

#table(
  columns: (auto, 1fr),
  [Ricci $R_(mu nu)$], [曲率の縮約。測地球の体積の変化率。$10$ 成分],
  [Weyl], [残りの $10$ 成分。体積を変えず形を歪める。重力波],
  [Bianchi], [$nabla^mu G_(mu nu) = 0$。$-1\/2$ の係数はここから出る],
  [Lovelock], [四条件を課すと左辺は $alpha G + lambda g$ に限る],
)

次回で連載を閉じる。
計量が入った多様体での積分を扱い、最後に
#strong[曲率を全体で積分すると位相不変量になる]という定理を見る。
そこで#link("/math/differential-forms/7")[微分形式]の連載と合流する。
