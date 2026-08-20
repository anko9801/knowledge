#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "不確かさの量は一つしかない",
  date: "2026-08-21",
  field: "cs",
  series: "information",
  order: 1,
  tags: ("情報理論",),
  summary: "「どれくらい分からないか」を測りたい。満たしてほしい性質を三つ書き下すと、その関数は定数倍を除いて一つに決まる。それが Shannon エントロピーである。",
  provides: (
    "entropy",
    "kl-divergence",
    "mutual-information",
  ),
)

#layer("L0 確率")[測度と確率の連載が前提。新しい仮定は置かない]

= 不確かさを測りたい

サイコロを振る前は、目が分からない。振ったあとは分かる。
その「分からなさ」を数で表したい。

天下りに $-sum p log p$ を出す前に、#strong[何を満たしてほしいか]を書く。
#link("/physics/quantum/1")[量子力学 第 1 回]と同じ手口である。

#definition[
  確率分布 $p = (p_1, dots, p_n)$ に対する不確かさ $H(p)$ に、次を要求する。
  + #strong[連続]。$p$ を少し動かすと $H$ も少し動く
  + #strong[単調]。等確率 $n$ 個なら、$n$ が増えるほど $H$ も増える
  + #strong[分解できる]。選択を二段階に分けても、合計は変わらない
]<def:axioms>

条件 3 だけ説明が要る。
「$3$ つから $1$ つ選ぶ」を「まず $2$ 対 $1$ に分け、前者ならさらに $2$ から選ぶ」と
分けたとき、不確かさの合計が変わってほしくない、という要求である。

#theorem("Shannon、1948 年")[
  @def:axioms を満たす関数は、定数倍を除いて
  $ H(p) = -sum_i p_i log p_i $
  に限る。
]<thm:uniqueness>

#strong[選ぶ余地が無い。]
$-sum p log p$ という形は、発明ではなく三条件の帰結である。

対数の底で単位が決まる。$2$ ならビット、$e$ ならナット。以下は $2$ を採る。

#example[エントロピーの値][
  + 公平なコイン：$H = 1$ ビット
  + 表が出る確率 $0.9$ のコイン：$H approx 0.47$ ビット
  + 必ず表が出るコイン：$H = 0$
  + 公平なサイコロ：$H = log_2 6 approx 2.58$ ビット
]

#proposition[
  $0 <= H(p) <= log n$ であり、
  右の等号は一様分布のとき、左の等号は一点に集中しているときに限る。
]<prop:bounds>

#strong[一様分布がいちばん分からない。]直観と合う。

= 分布の隔たり

二つの分布を比べる量を、同じ枠から作る。

#definition[
  $ D(p parallel q) := sum_i p_i log frac(p_i, q_i) $
  を#strong[KL 情報量]と呼ぶ。
]<def:kl>

#theorem[
  $D(p parallel q) >= 0$ であり、等号は $p = q$ のときに限る。
]<thm:kl-nonneg>

#proof[
  $log$ が凹関数なので Jensen の不等式から
  $ -D(p parallel q) = sum_i p_i log frac(q_i, p_i)
    <= log sum_i p_i frac(q_i, p_i) = log 1 = 0 $
  等号は $q_i \/ p_i$ が定数のとき、すなわち $p = q$。
]

#strong[凸性しか使っていない。]
情報理論の不等式は、ほとんどがこの形で出る。

$D$ は距離ではない。対称でないし、三角不等式も満たさない。
それでも「$q$ だと思っていたら実は $p$ だった」ときの余分なコストとして意味を持つ。

#example[間違った符号を使う代償][
  分布 $q$ に最適化した符号で、実際には $p$ に従うデータを送ると、
  平均符号長が $H(p) + D(p parallel q)$ になる。
  $D$ が#strong[思い違いの代金]である。
]

= 二つの量の関係を測る

#definition[
  $ I(X ; Y) := D(p_(X Y) parallel p_X times.o p_Y)
    = H(X) + H(Y) - H(X, Y) $
  を#strong[相互情報量]と呼ぶ。
]<def:mutual>

同時分布が積からどれだけ離れているか、という量である。
#link("/math/measure/3")[測度と確率 第 3 回]で
「独立とは同時分布が積になること」と定義したので、
$I = 0$ が独立と同値になる（@thm:kl-nonneg から）。

#proposition[
  $ I(X ; Y) = H(X) - H(X | Y) $
  すなわち、$Y$ を知ると $X$ の不確かさがどれだけ減るか。
]<prop:mutual-reduction>

#strong[「情報を得る」とは、不確かさが減ることだった。]
そしてその減り分が、対称である（$I(X;Y) = I(Y;X)$）ことに注意してほしい。
$Y$ が $X$ について教える量と、$X$ が $Y$ について教える量は、必ず等しい。

#remark[
  条件付きエントロピー $H(X | Y)$ は
  $#link("/math/measure/3")[条件付き期待値]$ の枠に入る。
  部分 $sigma$ 加法族が「$Y$ を知っている」ことを表し、
  そこへの射影で残る不確かさが $H(X|Y)$ である。

  「知っているほど不確かさは減る」$H(X|Y) <= H(X)$ も、
  Jensen から出る（条件付けは平均を取る操作なので、凸性で押さえられる）。
]

= 何のためにこれを定義したのか

エントロピーは「不確かさ」という直観の形式化に見えるが、
それだけなら定義しても仕方がない。

値打ちは、#strong[それが操作的な限界を与える]ことにある。

#table(
  columns: (auto, 1fr),
  [$H(X)$], [$X$ を圧縮できる限界。これより短くできない],
  [$I(X;Y)$], [通信路で送れる情報量の限界],
)

どちらも「$H$ の定義からそう決めた」のではなく、
#strong[別に定義した操作的な量が、$H$ と一致する]という定理である。

#link("/cs/information/2")[次回]、圧縮の側を示す。
道具は#link("/math/measure/4")[大数の法則]ひとつで足りる。
