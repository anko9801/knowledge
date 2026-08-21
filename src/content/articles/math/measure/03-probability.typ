#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "確率は測度の言い換えである",
  date: "2026-08-21",
  field: "math",
  series: "measure",
  order: 3,
  tags: ("測度と確率",),
  summary: "全測度を 1 に正規化するだけで確率論になる。確率変数は可測関数、期待値は積分、独立性は積測度。新しい公理は一つも足さない。",
  provides: (
    "probability-space",
    "random-variable",
    "expectation",
    "distribution",
    "independence-probabilistic",
    "moments",
    "concentration-inequality",
    "conditional-expectation",
  ),
)

#layer("L0 測度")[前回までの測度論に、正規化の約束を一つ足すだけ]

#check[
  前回の想起。極限と積分を交換するのに、Riemann は一様収束を要求し、Lebesgue は
  各点収束で足りる。#strong[刻む向きを変えると、なぜその差が出るのか。]
][
  Riemann は定義域を刻むので、各小区間で $f_n$ の#strong[振れ幅]を押さえないと
  近似が崩れる。振れ幅を全区間で一斉に押さえる、というのが一様収束である。

  Lebesgue は値域を刻む。値が $[y, y+Delta)$ に入る点を集めるだけなので、
  必要なのは#strong[その集合が測れること]と、集合の測度が極限で追随することだけで、
  各点の収束の速さが揃っている必要が無い。一様性の要求はここで落ちる。

  つまり一様収束は Riemann の刻み方が要求していたもので、
  #strong[積分される関数の側の性質ではなかった]。今回の期待値の極限定理は、
  すべてこの緩んだ条件の上に乗る。
]

= 足すのは約束一つ

前回までに、$sigma$ 加法族・測度・積分を作った。
確率論に移るのに足すのは、次の一行だけである。

$ mu(X) = 1 $

これで語彙が入れ替わる。

#table(
  columns: (auto, auto),
  [測度論], [確率論],
  [測度空間 $(X, cal(F), mu)$], [確率空間 $(Omega, cal(F), PP)$],
  [可測集合], [事象],
  [可測関数], [#strong[確率変数]],
  [積分 $display(integral f thin dif mu)$], [#strong[期待値] $EE[X]$],
  [像測度], [#strong[分布]],
  [積測度], [#strong[独立性]],
  [ほとんど至るところ], [#strong[ほとんど確実に]],
)

#strong[新しい定理は一つも要らない。]
前回証明したことが、名前を変えてそのまま使える。
以下はその翻訳作業である。

= 確率変数は関数である

#definition[
  確率空間 $(Omega, cal(F), PP)$ 上の可測関数 $X : Omega arrow RR$ を
  #strong[確率変数]と呼ぶ。
]<def:rv>

初学者がいちばん引っかかる点を書いておく。
#strong[確率変数は数ではなく、写像である。]
「変数」という名前が誤解を招くが、$X$ は $omega in Omega$ を入れると数を返す関数で、
$omega$ のほうが「どの結果が起きたか」を表す。

$Omega$ が何であるかは、たいてい問題にならない。
必要なのは $X$ が誘導する分布だけだからである。

#definition[
  $X$ が誘導する $RR$ 上の測度
  $ PP_X (B) := PP(X^(-1)(B)) $
  を $X$ の#strong[分布]と呼ぶ。
]<def:distribution>

#strong[分布とは像測度のことである。]
正規分布も Poisson 分布も、$RR$ 上の測度の名前にすぎない。

#example[同じ分布、違う確率空間][
  コインを 1 回投げる。$Omega = {upright("表"), upright("裏")}$ で $X(upright("表")) = 1$。
  あるいは $Omega = [0,1]$ に Lebesgue 測度を入れ、$X = bold(1)_([0, 1\/2])$。

  $Omega$ も $X$ も違うが、分布は同じである。
  そして確率の議論に出てくるのは分布だけなので、
  #strong[どちらを使ってもよい]。$Omega$ は舞台裏である。
]

#check[
  「確率変数は数ではなく写像である」。では、その定義域 $Omega$ が具体的に
  何であるかを、なぜ普通は気にしなくてよいのか。
][
  確率の主張に現れるのは $X$ が誘導する分布 $PP_X = PP compose X^(-1)$
  （@def:distribution、像測度）だけだからである。

  期待値も分散も $PP(X <= a)$ も、すべて $PP_X$ から計算できる。
  $Omega$ を取り替えても $PP_X$ が同じなら、言えることは何も変わらない。
]

= 期待値は積分である

#definition[
  $ EE[X] := integral_Omega X thin dif PP $
]<def:expectation>

これだけである。前回の単調収束定理と優収束定理が、そのまま使える。

#definition[
  $EE[X^k]$ を $k$ 次の#strong[モーメント]、
  $ upright("Var")[X] := EE[(X - EE[X])^2] = EE[X^2] - EE[X]^2 $
  を#strong[分散]と呼ぶ。
]<def:moments>

そして、ずれの確率を押さえる不等式が出る。

#theorem("Markov と Chebyshev")[
  $X >= 0$ について
  $ PP(X >= a) <= frac(EE[X], a) $
  これを $(X - EE[X])^2$ に当てると
  $ PP(abs(X - EE[X]) >= a) <= frac(upright("Var")[X], a^2) $
]<thm:chebyshev>

#proof[
  $a thin bold(1)_({X >= a}) <= X$ の両辺を積分するだけである。
]

証明が一行である。#strong[積分の単調性しか使っていない。]
それでいて、これが次回の大数の法則の証明の骨格になる。

= 独立性は積測度である

#definition[
  確率変数 $X, Y$ が#strong[独立]であるとは、同時分布が積になること
  $ PP_((X,Y)) = PP_X times.o PP_Y $
  をいう。同値に、任意の Borel 集合 $A, B$ について
  $ PP(X in A, Y in B) = PP(X in A) thin PP(Y in B) $
]<def:independence>

これも新しい概念ではない。#strong[積測度に名前を付けただけ]である。

#proposition[
  $X, Y$ が独立で可積分なら $EE[X Y] = EE[X] EE[Y]$、
  したがって $upright("Var")[X + Y] = upright("Var")[X] + upright("Var")[Y]$。
]<prop:independent-var>

#proof[
  積測度上の積分を Fubini の定理で繰り返し積分に直す。
]

分散が足し算になる、というのが次回の要になる。
$n$ 個の独立な確率変数の和を $n$ で割ると、分散が $1\/n$ に縮む。
@thm:chebyshev と合わせると、それがそのまま大数の法則になる。

#remark[
  独立性は、確率論に固有に見えて、実は測度論の言葉で書けている。
  そしてそのおかげで「独立でない場合」を扱う道具も、測度論の側から来る。

  相関は $EE[X Y] - EE[X]EE[Y]$ で測るが、これが $0$ でも独立とは限らない。
  独立性は分布全体についての条件で、相関は $2$ 次モーメントだけの条件だからである。
]

= 条件付き期待値

最後に、後で効く道具を一つ。

条件付き確率 $PP(A | B) = PP(A inter B) \/ PP(B)$ は、$PP(B) = 0$ だと書けない。
連続な確率変数では、一点の確率はいつも $0$ なので、この定義では足りない。

#definition[
  部分 $sigma$ 加法族 $cal(G) subset cal(F)$ に対し、
  $cal(G)$ 可測で
  $ integral_G EE[X | cal(G)] thin dif PP = integral_G X thin dif PP quad (forall G in cal(G)) $
  を満たす確率変数を、$X$ の $cal(G)$ に関する#strong[条件付き期待値]と呼ぶ。
]<def:conditional>

「値を割り当てる」のではなく「積分が一致するもの」として定義する。
存在と一意性（ほとんど確実に）は Radon--Nikodym の定理から出る。

#check[
  素朴な条件付き確率 $PP(A | B) = PP(A inter B) \/ PP(B)$ で足りないのはなぜか。
  @def:conditional はそれをどう回避しているか。
][
  $PP(B) = 0$ だと割り算が書けない。そして連続な確率変数では一点の確率が
  いつも $0$ なので、「$X = x$ を条件にする」がこの定義では一度も使えない。

  @def:conditional は割り算を捨て、条件を#strong[積分の一致]に置き換える。
  各点の値を決めるのをやめて、$cal(G)$ の上での積分が合うものと定めるので、
  零集合の上で値が違っても構わない。だから一意性も「ほとんど確実に」になる。
]

$L^2$ で見ると分かりやすい。
条件付き期待値は、$cal(G)$ 可測な関数の全体への#strong[直交射影]である。
#link("/math/linear-algebra/7")[線形代数 第 7 回]で見た射影が、
そのまま無限次元で使われている。

#strong[$sigma$ 加法族が「どこまで知っているか」を表す]、という見方になる。
$cal(G)$ が粗いほど情報が少なく、条件付き期待値は平たくなる。
この見方を時間方向に並べたものがマルチンゲールで、
確率過程の理論はそこから始まる。

= まとめ

#table(
  columns: (auto, 1fr),
  [確率空間], [全測度 $1$ の測度空間。それだけ],
  [確率変数], [可測関数。数ではなく写像],
  [分布], [像測度。$Omega$ が何かは問題にならない],
  [期待値], [積分。極限定理は前回の収束定理から],
  [独立性], [積測度。分散が足し算になる],
  [条件付き期待値], [部分 $sigma$ 加法族への射影。情報の粗さを表す],
)

道具立ては前回までで終わっていて、今回やったのは翻訳だけだった。
#strong[確率論に固有の公理は無い。]

#link("/math/measure/4")[次回]、@thm:chebyshev と
@prop:independent-var を組み合わせて大数の法則を出し、
そこから中心極限定理まで進む。
「なぜ正規分布が至るところに出るのか」に答えが付く。
