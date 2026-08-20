#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "どこまで微分できるか",
  date: "2026-08-21",
  field: "math",
  series: "foundations",
  order: 5,
  tags: ("土台",),
  summary: "「滑らか」には階層がある。C^k と C^∞ と解析的は、どれも別物である。多様体の定義に現れる「滑らか」がどれを指すのか、そしてなぜ C^∞ を選ぶのかを決める。",
  provides: (
    "smoothness-class",
    "power-series",
    "analytic-function",
    "identity-theorem",
    "bump-function",
    "frechet-derivative",
    "inverse-function-theorem",
    "implicit-function-theorem",
  ),
)

#layer("L1 ＋ 距離", metric: true)[前回の縮小写像の原理を使う]

= 「滑らか」と書いてある場所

#link("/math/differential-forms/5")[微分形式 第 5 回]で多様体を定義したとき、
条件はこうだった。

「重なりの上で、遷移関数が#strong[滑らか]である」

この一語で微分という操作を持ち込む権利が発生する、と書いた。
だが「滑らか」が何を指すのかは決めていない。

決める必要がある。候補が複数あり、しかも#strong[互いに違う]からである。

= 階層

#definition[
  $U subset RR^n$ 上の関数 $f$ について
  + $f in C^0$：連続
  + $f in C^k$：$k$ 階までの偏導関数がすべて存在して連続
  + $f in C^infinity$：すべての $k$ について $C^k$。#strong[滑らか]という
  + $f in C^omega$：各点で Taylor 級数が収束し、$f$ に一致する。#strong[解析的]という
]<def:smoothness>

包含関係は
$ C^0 supset C^1 supset dots.c supset C^infinity supset C^omega $
であり、#strong[どの包含も真である]。それぞれ反例がある。

#example[三つの分離][
  + $abs(x)$ は $C^0$ だが $C^1$ でない
  + $x^2 sin(1\/x)$（$x = 0$ で $0$）は $C^1$ だが $C^2$ でない
  + $ f(x) = cases(e^(-1\/x) & (x > 0), 0 & (x <= 0)) $
    は $C^infinity$ だが $C^omega$ でない。原点で全ての微分係数が $0$ になるので、
    Taylor 級数は恒等的に $0$ であり、$x > 0$ で $f$ と一致しない
]

三つ目が、後で決定的に効く。

= 解析的とは何か

$C^omega$ だけは、他と毛色が違う。微分の回数ではなく、級数で書けるかを問うている。
そこを詰めておく。

#definition[
  $sum_n a_n (x - a)^n$ の形の級数を#strong[べき級数]と呼ぶ。
  $ R := 1 \/ limsup_n abs(a_n)^(1\/n) $
  を#strong[収束半径]といい、$abs(x - a) < R$ で絶対収束、$> R$ で発散する。
]<def:power-series>

$abs(x - a) <= r < R$ の範囲では#strong[一様収束]するので、
#link("/math/foundations/4")[前回]の結果から極限が連続になり、
さらに項別に微分・積分してよい。
#strong[べき級数は、無限和なのに有限和のように扱える。]

#definition[
  各点の近傍で、$f$ が自身の Taylor 級数に一致するとき、$f$ を#strong[解析的]といい
  $f in C^omega$ と書く。
]<def:analytic>

$C^infinity$ であることは、Taylor 級数が#strong[書ける]ことしか保証しない。
その級数が収束するか、収束先が $f$ かは、別の問題である。
上の例の三つ目——$e^(-1\/x)$——は、書けるが一致しない例だった。

#theorem("一致の定理")[
  連結な領域上の解析関数 $f, g$ が、ある一点の近傍で一致すれば、領域全体で一致する。
]<thm:identity>

#proof[
  $f - g$ のすべての導関数が消える点の集合を考える。
  この集合は、導関数の連続性から閉集合であり、
  解析性から（その点の近傍で級数が恒等的に $0$ なので）開集合でもある。
  領域が連結なので、空でなければ全体に一致する。
]

#strong[解析関数は、一点の近傍の情報だけで全体が決まってしまう。]
局所を決めると大域が決まる、という意味で#strong[硬い]。

= なぜ $C^infinity$ を選ぶのか

多様体の「滑らか」は $C^infinity$ を指す。理由は二つある。

#strong[一つ、階数を数えたくない。]
$C^k$ を採ると、外微分を一回するたびに階数が一つ落ちる。
「$k$ 階微分可能な多様体上の $j$ 形式」と、数を持ち歩くことになる。
$C^infinity$ なら何回微分しても $C^infinity$ のままで、数が消える。

#strong[二つ、局所的な操作ができる。]
これが本質である。

#theorem[
  任意の開集合 $U$ と、その中のコンパクト集合 $K$ に対し、
  $K$ の上で $1$、$U$ の外で $0$ になる $C^infinity$ 関数が存在する。
  これを#strong[山形関数]と呼ぶ。
]<thm:bump>

#proof[
  上の例の三つ目 $f$ を使う。$g(x) = f(x) f(1-x)$ は $[0,1]$ の外で $0$、
  内側で正の $C^infinity$ 関数である。これを積分して正規化し、
  多次元へは動径方向に組み合わせればよい。
]

#strong[$C^omega$ ではこれができない。]
@thm:identity より、解析関数がある開集合の上で恒等的に $0$ なら、
連結な領域全体で $0$ になってしまう。
「ここでは $0$、あそこでは $1$」という関数は、解析的でありえない。

だから $C^infinity$ を選ぶ。
#link("/math/differential-forms/6")[微分形式 第 6 回]の 1 の分割も、
@thm:bump を貼り合わせて作っていた。
局所でできることを大域へ持ち上げる、という手口の全体が、この一点に乗っている。

#remark[
  解析的であることが要る場面も、もちろんある。
  複素解析では正則性が $C^omega$ を意味し、そのおかげで「一点の情報が全体を決める」。
  代数幾何や、剛性の議論でも $C^omega$ を採る。

  多様体論が $C^infinity$ を選ぶのは、#strong[柔らかいほうが貼り合わせやすい]からである。
  硬さが欲しい場面では、逆の選択になる。
]

= 無限次元での微分

#link("/math/foundations/2")[第 2 回]で、微分を「最良の線形近似」と定義した。
定義の式には $RR^n$ が要らない。ノルムがあればよい。

#definition[
  Banach 空間の間の写像 $f : U subset X arrow Y$ について、有界線形写像 $D f_a$ が
  $ lim_(norm(h) arrow 0) frac(norm(f(a+h) - f(a) - D f_a (h)), norm(h)) = 0 $
  を満たすとき、$f$ は $a$ で#strong[Fréchet 微分可能]という。
]<def:frechet>

$abs(dot)$ が $norm(dot)$ になっただけである。
#link("/math/foundations/2")[第 2 回]の連鎖律も、そのままの証明で成り立つ。

これで変分法が扱える。汎関数
$ S[q] = integral L(q, dot(q), t) thin dif t $
は関数の空間から $RR$ への写像なので、@def:frechet の微分が取れる。
$delta S = 0$ という条件は、その微分が $0$ になることである。

= 逆関数定理

前回の縮小写像の原理が、ここで効く。

#theorem("逆関数定理")[
  $f$ が $C^k$（$k >= 1$）で、$D f_a$ が可逆なら、
  $a$ の近傍で $f$ は $C^k$ 級の逆写像を持つ。
]<thm:inverse>

#proof[
  $y$ を固定し、$f(x) = y$ を不動点方程式に直す。
  $ T_y (x) := x + (D f_a)^(-1) (y - f(x)) $
  とおくと、$T_y (x) = x$ と $f(x) = y$ は同値である。

  $D T_y = I - (D f_a)^(-1) D f_x$ は $x = a$ で $0$ になり、
  $D f$ が連続なので、$a$ の近傍では $norm(D T_y) <= 1\/2$ に抑えられる。
  平均値の不等式から $T_y$ は縮小写像になる。

  近傍を完備な閉集合に取れば、#link("/math/foundations/4")[前回]の
  Banach の不動点定理から、$x$ がただ一つ存在する。
  逆写像の微分可能性と $C^k$ 性は、この構成を追えば出る。
]

#strong[「解ける」という主張が、完備性から出ている。]
前回の常微分方程式と、まったく同じ構造である。

#theorem("陰関数定理")[
  $F(x, y) = 0$ において $partial F \/ partial y$ が可逆なら、
  局所的に $y = g(x)$ と解けて、$g$ は $F$ と同じ滑らかさを持つ。
]<thm:implicit>

@thm:inverse を $(x, y) mapsto (x, F(x,y))$ に当てるだけで出る。
二つは同じ定理の言い換えである。

== 部分多様体を作る道具になる

@thm:implicit の使い道を一つ挙げておく。

#example[$S^n$ が多様体であること][
  $F(bold(x)) = abs(bold(x))^2 - 1$ とすると、$S^n = F^(-1)(0)$ である。
  $bold(x) != bold(0)$ で $D F != 0$ なので、@thm:implicit より
  $S^n$ の各点の近傍で、$n$ 個の座標が残り $1$ 個を決める。

  つまり局所的に $RR^n$ の開集合と対応が付く。
  #link("/math/differential-forms/5")[多様体の定義]を満たしている。
]

一般に「$F = 0$ で定まる図形は、$D F$ が最大階数なら多様体になる」。
球面もトーラスも $upright("SO")(n)$ も、この方法で多様体だと確かめられる。
#strong[アトラスを手で書かなくてよい]、というのが実用上の価値である。

= まとめ

#table(
  columns: (auto, 1fr),
  [$C^k$ の階層], [どの包含も真。反例が具体的に作れる],
  [$C^infinity$ を選ぶ理由], [階数を持ち歩かずに済み、山形関数が作れる],
  [$C^omega$ が使えない理由], [一致の定理。局所で $0$ にできない],
  [Fréchet 微分], [ノルムがあれば、第 2 回の定義がそのまま延びる],
  [逆関数定理], [縮小写像の原理から出る。陰関数定理と同じもの],
)

これで #link("/math/differential-forms/5")[多様体]の定義に書いた「滑らか」が
何を指すのかが決まった。$C^infinity$ である。
そして 1 の分割が作れるのも、@thm:bump が $C^infinity$ でだけ成り立つからである。

土台はここまでにする。連載の入口は
#link("/math/foundations/1")[第 1 回]に置いた表のとおりで、
どこから読んでも、詰まったらここへ戻ってくればよい。
