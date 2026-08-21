#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "平行を、外から決める",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 3,
  tags: ("Riemann 幾何",),
  summary: "離れた点の接ベクトルを比べる方法は、多様体にも計量にも入っていない。外から決めるしかない。それが接続である。計量的で捩れがない、という二条件を課すと接続は一つに定まり、その成分が Christoffel 記号になる。",
  provides: (
    "connection",
    "parallel-transport",
    "covariant-derivative",
    "christoffel-symbol",
    "levi-civita-connection",
    "normal-coordinates",
  ),
  requires: (
    "tensor-field",
    "partial-is-not-a-tensor",
    "riemannian-metric",
  ),
)

= 地球の上では、まっすぐ運ぶと向きが変わる

北極に立って、矢印を南に向けて持つ。向きを変えないように気をつけながら、
赤道まで南下する。そのまま赤道沿いに $90°$ 東へ歩き、また北極へ戻る。

矢印は $90°$ 回っている。

一度も回していない。各瞬間、まっすぐ前に運んだだけである。
それでも出発点に戻ったとき、向きが変わっている。
#strong[「向きを変えずに運ぶ」ことが、経路に依ってしまう。]

平面ではこうならない。平面なら、どんな道を通って戻っても矢印は元のままである。
だから普通は、この操作に名前が要るとすら思わない。

原因は前回のところにある。$T_p$ と $T_q$ は別のベクトル空間で、
離れた $2$ 点のベクトルを比べる方法が#strong[そもそも無い]。
無いものを、球面という形が勝手に決めてくれていたわけでもない。
#strong[こちらが決めなければならない。]

決め方が一つでないので、接続は計量から自動的には出ない付加構造になる。
今回はまずそれを定義し、計量と両立させる条件を課すと
#strong[一つに定まる]（Levi-Civita）ところまで行く。

そして冒頭の $90°$ は捨てずに取っておく。ずれの大きさが何で決まるかを問うと、
それが次々回の曲率になる。#strong[運んで帰ってきたときのずれ]が、
曲がっていることの定義そのものになる。

#definition[
  #strong[接続]（共変微分）とは、ベクトル場の組に対しベクトル場を返す操作
  $nabla_X Y$ であって、次を満たすものをいう。

  + $nabla_(f X + g Y) Z = f nabla_X Z + g nabla_Y Z$（$X$ について関数線形）
  + $nabla_X (Y + Z) = nabla_X Y + nabla_X Z$
  + $nabla_X (f Y) = X(f) thin Y + f nabla_X Y$（Leibniz 則）
]<def:connection>

条件 1 と 3 が非対称なことに注意してほしい。
$X$ については関数を通り抜けるが、$Y$ については微分が落ちてくる。
これは「$X$ は微分する方向を指定するだけ、$Y$ は微分される対象」という役割の違いである。

座標で書くと
$ nabla_(partial_j) partial_i =: Gamma^k{}_(j i) thin partial_k $
で定まる $Gamma$ が接続を決める。成分では
$ nabla_j X^i = partial_j X^i + Gamma^i{}_(j k) X^k $
となり、前回の予告どおりの形になる。

#proposition[
  $Gamma$ はテンソルではない。座標変換で
  $ Gamma'^i{}_(j k) = frac(partial x'^i, partial x^a) frac(partial x^b, partial x'^j)
      frac(partial x^c, partial x'^k) Gamma^a{}_(b c)
    + frac(partial x'^i, partial x^a) frac(partial^2 x^a, partial x'^j partial x'^k) $
  と変わる。
]<prop:gamma>

第二項が余分である。そしてこれは、前回 $partial_j X^i$ に現れた余分な項と
ちょうど同じ形をしている。だから足すと打ち消し合い、$nabla_j X^i$ はテンソルになる。

#strong[テンソルでないもの二つを足して、テンソルを作る。]
これが共変微分の仕掛けである。

= 平行移動

@def:connection を、幾何の言葉に直しておく。

#definition[
  曲線 $gamma$ に沿ってベクトル場 $V$ が
  $ nabla_(dot(gamma)) V = 0 $
  を満たすとき、$V$ は $gamma$ に沿って#strong[平行移動]されているという。
]<def:parallel>

これは常微分方程式なので、初期ベクトルを与えれば一意に解ける。
つまり#strong[曲線を一本決めれば、$T_p$ から $T_q$ への対応が定まる]。

決まらないのは、曲線に依らずに定まるかどうかである。
別の曲線を通ると、別のベクトルが返ってくる。
そのズレが#link("/math/riemannian-geometry/5")[曲率]になる。

= 計量から接続を決める

@def:connection には自由度が多すぎる。二つの条件で絞る。

#definition[
  + #strong[計量的]（$nabla g = 0$）。平行移動で長さと角度が変わらない
  + #strong[捩れがない]（$nabla_X Y - nabla_Y X = [X, Y]$）。成分では $Gamma^k{}_(i j) = Gamma^k{}_(j i)$
]<def:levi-civita-conditions>

条件 1 は自然である。長さを測る道具が計量なのに、
平行移動で長さが変わったら「平行」と呼ぶ意味がない。

条件 2 は分かりにくいので、幾何的な意味を書いておく。
$X$ 方向に少し進んでから $Y$ 方向に少し進むのと、逆順に進むのとで、
着く点が違ってよい——それが $[X, Y]$ である。
捩れとは、この差以上の「ねじれ」があるかどうかを測る。
条件 2 は、余計なねじれを入れないという要請である。

#theorem("Riemann 幾何の基本定理")[
  @def:levi-civita-conditions の二条件を満たす接続はただ一つ存在する。
  これを#strong[Levi-Civita 接続]と呼び、その成分は
  $ Gamma^k{}_(i j) = frac(1, 2) g^(k l)
    (partial_i g_(j l) + partial_j g_(i l) - partial_l g_(i j)) $
  で与えられる。
]<thm:levi-civita>

#proof[
  計量的であることを、添字を入れ替えて三通りに書く。
  $ partial_i g_(j k) = Gamma^l{}_(i j) g_(l k) + Gamma^l{}_(i k) g_(j l) $
  同じ式を $(j, k, i)$ と $(k, i, j)$ の順で書き、
  最初の二つを足して三つ目を引く。
  捩れがないので $Gamma$ の下 2 本が対称になり、多くの項が相殺して
  $ 2 Gamma^l{}_(i j) g_(l k) = partial_i g_(j k) + partial_j g_(i k) - partial_k g_(i j) $
  が残る。$g^(k l)$ を掛ければ主張の式になる。
  この過程で $Gamma$ が完全に決まったので、一意性も同時に示された。
]

計量を与えると接続が決まり、接続が決まると「まっすぐ」が決まる。
#strong[Riemann 幾何が計量だけで組み立つのは、@thm:levi-civita のおかげ]である。

= 平坦な空間でも Γ はゼロにならない

@thm:levi-civita を、いちばん身近な例で計算する。

#example[平面の極座標][
  $g = dif r^2 + r^2 dif theta^2$ なので $g_(r r) = 1$、$g_(theta theta) = r^2$、
  非対角成分は $0$ である。@thm:levi-civita に入れると、$0$ でないのは
  $ Gamma^r{}_(theta theta) = -r, quad
    Gamma^theta{}_(r theta) = Gamma^theta{}_(theta r) = frac(1, r) $
  の三つだけである。

  これを使って曲線の加速度——速度の共変微分——を書くと
  $ a^r = dot.double(r) - r dot(theta)^2, quad
    a^theta = dot.double(theta) + frac(2, r) dot(r) dot(theta) $
  になる。
]

舞台は#strong[平面]である。曲がっていないのに $Gamma != 0$ になった。

つまり $Gamma$ は、空間が曲がっていることの指標ではない。
#strong[選んだ座標基底が場所によって変わっていることの指標]である。
デカルト座標を取れば $g_(i j) = delta_(i j)$ が定数になり、$Gamma$ は消える。

そして「消せる」ことは、@prop:gamma の第二項が保証していた。
$Gamma$ はテンソルではないので、座標の選び方で値が動く。

== 一点でなら、必ず消せる

平坦でなくても、一点に限れば消せる。

#theorem[
  任意の点 $p$ に対し、$p$ で $Gamma^k{}_(i j)(p) = 0$ かつ
  $g_(i j)(p) = delta_(i j)$ となる座標が存在する。
]<thm:normal>

これを#strong[正規座標]と呼ぶ。証明は @prop:gamma の第二項を使って
$Gamma(p)$ を打ち消す座標変換を構成すればよい。
具体的な作り方は#link("/math/riemannian-geometry/4")[次回]、測地線を使って与える。

消せるのは#strong[一点で、一階微分まで]である。
近傍全体で $Gamma equiv 0$ にできるかどうかは、また別の問いになる。
$partial Gamma$ の組み合わせのうち、どんな座標変換でも消えない部分が残るからである。
それが曲率で、#link("/math/riemannian-geometry/5")[第 5 回]の主題になる。

= どこまでが構造か

三つの層を、いま一度並べておく。

#table(
  columns: (auto, auto, 1fr),
  [構造], [決めるもの], [座標で消せるか],
  [多様体], [微分できること], [—],
  [計量 $g$], [長さ・角度・体積], [一点でなら $delta$ にできる],
  [接続 $Gamma$], [平行・まっすぐ], [#strong[一点でなら $0$ にできる]],
  [曲率 $R$], [平行移動の経路依存性], [#strong[消せない]],
)

この表が、#link("/math/linear-algebra/1")[線形代数 第 1 回]で立てた判定の、幾何版になっている。
座標を選ばずに述べられるものが対象の性質で、選び方で消えるものは記述の都合である。
$Gamma$ は後者、$R$ は前者。両者を分ける線が、テンソルかどうかの線と一致している。

次回、$Gamma = 0$ が定める「まっすぐな経路」——測地線——を扱う。
そして、それが長さの停留する経路と一致することを見る。
