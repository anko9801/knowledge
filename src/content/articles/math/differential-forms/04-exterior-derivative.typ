#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "外微分は一つしかない",
  date: "2026-08-20",
  field: "math",
  series: "differential-forms",
  order: 4,
  tags: ("微分形式",),
  summary: "四つの条件を課すと、次数を上げる微分は一つに決まる。天下りに見えた d の定義は、選択の余地が無かったということである。そして d は引き戻しと交換する。これが「座標に依らない」ことの正体になる。",
)

#layer("L1 微分構造")[$dif$ に計量は要らない。この回で一度も $g$ を書かない]

= 定義を選ぶのではなく、追い詰める

#link("/math/vector-analysis/3")[ベクトル解析 第 3 回]では、外微分をこう定めた。
$ omega = sum_I f_I thin dif x^I quad arrow.long.bar quad
  dif omega = sum_I dif f_I and dif x^I $

座標を使った定義である。別の座標で書いても同じものになるか、という点が残る。
そして「なぜこの式なのか」も説明していない。

やり方を変える。#strong[満たしてほしい性質を先に並べ、それを満たす操作を追い詰める。]

= 四つの条件

#theorem[
  次の四条件を満たす $dif : Omega^k arrow.long Omega^(k+1)$ は、ただ一つ存在する。

  + #strong[線形] $dif(a alpha + b beta) = a thin dif alpha + b thin dif beta$（$a, b$ は定数）
  + #strong[Leibniz 則（次数付き）] $dif(alpha and beta) = dif alpha and beta + (-1)^k alpha and dif beta$
    （$alpha$ は $k$ 形式）
  + #strong[二度で消える] $dif (dif alpha) = 0$
  + #strong[関数の上では微分] $0$ 形式 $f$ に対し $dif f$ は
    #link("/math/differential-forms/2")[第 2 回]の $dif f$ に一致する
]<thm:unique>

#proof[
  #strong[一意性。] 座標近傍で $omega = sum_I f_I thin dif x^(i_1) and dots.c and dif x^(i_k)$ と書く。
  条件 1 より各項を別々に扱えばよい。

  条件 2 を繰り返し使うと
  $ dif (f thin dif x^(i_1) and dots.c and dif x^(i_k))
    = dif f and dif x^(i_1) and dots.c and dif x^(i_k)
      + f thin dif(dif x^(i_1) and dots.c) $
  である。第二項に条件 2 と 3 を当てると、
  $dif(dif x^(i_j)) = 0$ なのですべて消える。
  残るのは第一項で、条件 4 が $dif f$ を決めている。
  よって $dif omega$ は完全に決まってしまう。

  #strong[存在。] 上で追い詰めた式を定義として採用し、
  四条件を満たすことを直接確かめればよい。
  条件 3 は $partial_i partial_j$ が対称、$dif x^i and dif x^j$ が反対称であることから出る
  （#link("/math/vector-analysis/3")[ベクトル解析 第 3 回]と同じ計算である）。
  座標の取り替えで定義が変わらないことは、下の @thm:natural から従う。
]

#strong[選ぶ余地が無かった]、というのが結論である。
座標を使った定義は、四条件を満たす唯一のものを書き下したにすぎない。

そして四条件のどれにも計量が出てこない。
だから $dif$ は、長さも角度も定義されていない空間で使える。
#link("/math/vector-analysis/6")[ベクトル解析 第 6 回]で熱力学の状態空間を扱えたのは、この理由による。

#remark[
  条件 2 の $(-1)^k$ が気持ち悪く見えるかもしれない。
  これは $dif$ が「$1$ 形式のようなもの」だからである。
  $dif$ を $alpha$ とすれ違わせるのに、$1$ 形式を $k$ 形式とすれ違わせるのと同じ符号が付く。
  規則ではなく、次数の勘定である。
]

= 座標に依らない、とはどういうことか

「座標に依らない」を、二つの座標での計算が一致することとして確かめるのは面倒である。
もっと強い形で述べられる。

#theorem[
  任意の滑らかな写像 $F : M arrow N$ について
  $ F^* (dif omega) = dif (F^* omega) $
]<thm:natural>

#proof[
  $0$ 形式については #link("/math/differential-forms/2")[第 2 回]で示した
  （$F^*(dif f) = dif(f compose F)$）。

  一般の場合は、局所で $omega = sum_I f_I thin dif x^I$ と書き、
  $F^*$ が楔積を通り抜けること（前回の定理）と、$0$ 形式の場合を組み合わせる。
  $ F^*(dif omega) = sum_I F^*(dif f_I) and F^*(dif x^(i_1)) and dots.c
    = sum_I dif (F^* f_I) and dif (F^* x^(i_1)) and dots.c = dif (F^* omega) $
]

座標変換は写像の特別な場合なので、@thm:natural から「座標に依らない」が出る。
しかも主張はもっと広く、#strong[どんな写像で運んでも $dif$ とすれ違える]と言っている。

このことを、$dif$ は#strong[自然]である、と言う。
理論を作るとき、自然な操作は少ない。$dif$ はその数少ない一つである。

= 三つの演算子（再訪）

$RR^3$ で @thm:unique の $dif$ を書き下すと、grad・rot・div が出る。
計算は #link("/math/vector-analysis/3")[ベクトル解析 第 3 回]で済ませたので、結果だけ再掲する。

#table(
  columns: (auto, auto, 1fr),
  [$Omega^0 arrow Omega^1$], [$dif f$], [$nabla f$],
  [$Omega^1 arrow Omega^2$], [$dif omega$], [$nabla times bold(A)$],
  [$Omega^2 arrow Omega^3$], [$dif beta$], [$nabla dot bold(B)$],
)

右の列に直すのに計量が要る、というのが前回までの話だった。
左の列だけなら計量が要らない。

= 内部積と Lie 微分

$dif$ と組にして使う操作を、名前だけ置いておく。

#definition[
  ベクトル場 $X$ と $k$ 形式 $omega$ に対し、
  $ (iota_X omega)(Y_1, dots, Y_(k-1)) := omega(X, Y_1, dots, Y_(k-1)) $
  を#strong[内部積]と呼ぶ。次数を $1$ 下げる。
]<def:interior>

$dif$ が次数を上げ、$iota_X$ が下げる。二つを組み合わせると、次数を変えない操作ができる。

#theorem("Cartan の公式")[
  $ cal(L)_X = dif compose iota_X + iota_X compose dif $
  左辺はベクトル場 $X$ の流れに沿った#strong[Lie 微分]である。
]<thm:cartan>

Lie 微分は「$X$ の流れで運んだときに、形式がどれだけ変わるか」を測る。
@thm:cartan は、それが $dif$ と $iota_X$ だけで書けることを言っている。

この式が効く場面は多い。

#table(
  columns: (auto, 1fr),
  [解析力学], [$cal(L)_X omega = 0$ が正準変換の条件。Hamilton ベクトル場は $iota_X omega = dif H$ で定まる],
  [流体], [渦度の保存（Kelvin の循環定理）が $cal(L)$ の言葉で書ける],
  [対称性], [$cal(L)_X g = 0$ が計量の対称性（Killing ベクトル）],
)

この連載では使わないが、
#link("/physics/mechanics/3")[Noether の定理]を形式の言葉で書き直すときの道具になる。

= 閉形式と完全形式

@thm:unique の条件 3 から、二種類の形式を区別する意味が出る。

#definition[
  $dif omega = 0$ を満たす $omega$ を#strong[閉形式]、
  $omega = dif eta$ と書ける $omega$ を#strong[完全形式]と呼ぶ。
]<def:closed-exact>

条件 3 は「完全ならば閉」を言っている。逆は一般に成り立たない。

#example[閉だが完全でない $1$ 形式][
  $RR^2$ から原点を除いた領域で
  $ omega = frac(-y thin dif x + x thin dif y, x^2 + y^2) $
  とおく。計算すると $dif omega = 0$ である。

  ところが原点を囲む円周に沿って積分すると $2 pi$ になり、$0$ でない。
  $omega = dif f$ なら閉曲線上の積分は $0$ のはずなので、完全ではない。

  実は $omega = dif theta$ と書きたいところだが、
  $theta$ は一周すると $2 pi$ ずれるので、大域的な関数にならない。
  #strong[穴があるせいで、局所的にしか原始関数が取れない]のである。
]

この例は#link("/math/vector-analysis/1")[ベクトル解析 第 1 回]の
Aharonov--Bohm 効果の $bold(A)$ と同じものである。
そして「閉だが完全でない形式がどれだけあるか」を数える理論が
#link("/math/differential-forms/7")[第 7 回]の主題になる。

= ここまでの道具

#table(
  columns: (auto, 1fr),
  [$dif$], [四条件で一意に決まる。計量を使わない],
  [$F^* dif = dif F^*$], [自然性。座標に依らないことの強い形],
  [$dif dif = 0$], [完全ならば閉。逆は穴の有無による],
  [$iota_X$、$cal(L)_X$], [次数を下げる操作と、流れに沿った変化],
)

道具は揃った。だが、まだ舞台を定義していない。
「多様体」と書いてきたものが何なのか、正面から述べていない。

次回それを定める。
$RR^n$ の開集合で済ませてきた話が、なぜ済まないのか。
球面に大域的な座標が張れない、という具体的な事実から始める。
