#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "微分とは最良の線形近似である",
  date: "2026-08-20",
  field: "math",
  series: "foundations",
  order: 2,
  tags: ("土台",),
  summary: "微分係数を「傾き」ではなく「線形写像」と定義し直すと、多変数へそのまま延びる。偏微分はその成分、連鎖律は写像の合成、ヤコビアンはその行列式になる。覚える公式が一つに減る。",
  provides: (
    "multivariable-calculus",
    "landau-notation",
  ),
)

#layer("L0 ベクトル空間")[線形写像だけで微分を定義する。長さは収束を言うときだけ使う]

= 傾きのままでは、多変数へ行けない

$1$ 変数の微分は
$ f'(x) = lim_(h arrow 0) frac(f(x+h) - f(x), h) $
で定義される。これを多変数へ持っていこうとすると、すぐ詰まる。
$bold(h)$ がベクトルになると、割り算ができない。

そこで偏微分を導入して、方向ごとに $1$ 変数の微分をする。
$ frac(partial f, partial x), quad frac(partial f, partial y) $
確かに計算はできる。だが、これは#strong[座標を選んでからでないと書けない]量である。
そして偏微分が全部あっても微分可能とは限らない、という不愉快な事実が付いてくる。

定義を書き直す。上の式を移項すると
$ f(x + h) = f(x) + f'(x) h + o(h) $
になる。ここで $f'(x) h$ は、$h$ に数を掛けているだけ、つまり#strong[線形写像]である。

この形なら、$h$ がベクトルでも書ける。

#strong[微分とは、その点のまわりで関数を最もよく近似する線形写像である。]

= 定義

#definition[
  $U subset RR^n$ を開集合、$f : U arrow RR^m$ とする。
  点 $bold(a) in U$ において、線形写像 $D f_bold(a) : RR^n arrow RR^m$ が存在して
  $ lim_(bold(h) arrow bold(0))
      frac(abs(f(bold(a) + bold(h)) - f(bold(a)) - D f_bold(a)(bold(h))), abs(bold(h))) = 0 $
  を満たすとき、$f$ は $bold(a)$ で#strong[微分可能]といい、
  $D f_bold(a)$ を#strong[微分]と呼ぶ。
]<def:derivative>

割り算をしているのは $abs(bold(h))$ という数だけである。ベクトルは割っていない。

#proposition[
  $D f_bold(a)$ は存在すれば一つしかない。
]<prop:unique>

#proof[
  二つあったとして差を $L$ とすると、任意の $bold(h)$ について
  $abs(L(bold(h) t)) \/ abs(bold(h) t) arrow 0$（$t arrow 0$）となる。
  $L$ は線形なので $abs(L(bold(h)) t) \/ (abs(bold(h)) t) = abs(L(bold(h))) \/ abs(bold(h))$ は $t$ に依らず、
  よって $L(bold(h)) = bold(0)$。
]

一意なので、$D f_bold(a)$ は $f$ と $bold(a)$ だけで決まる。座標を選んでいない。

= 偏微分は、その成分である

#proposition[
  $f$ が $bold(a)$ で微分可能なら、すべての偏微分が存在し、
  $D f_bold(a)$ の行列表示は
  $ (D f_bold(a))^i{}_j = frac(partial f^i, partial x^j) (bold(a)) $
  である（#strong[ヤコビ行列]）。
]<prop:partial>

#proof[
  @def:derivative で $bold(h) = t bold(e)_j$ と取れば、
  第 $i$ 成分の式が $partial f^i \/ partial x^j$ の定義そのものになる。
]

#strong[偏微分は、微分を基底で書いた成分だった。]
#link("/math/linear-algebra/1")[線形代数 第 1 回]で「行列は写像＋基底の記録」と書いたが、
ヤコビ行列はその一例である。

逆は成り立たない。

#example[偏微分はあるのに微分可能でない][
  $ f(x, y) = cases(frac(x y, x^2 + y^2) & ((x,y) != (0,0)), 0 & ((x,y) = (0,0))) $
  は原点で $partial f \/ partial x = partial f \/ partial y = 0$ である
  （軸に沿えば恒等的に $0$ だから）。

  ところが $y = x$ に沿って近づくと $f = 1\/2$ で、連続ですらない。
  線形写像で近似できていないので、@def:derivative の意味では微分可能でない。
]

軸方向だけ見ても足りない、というのがこの例の教訓である。
#strong[偏微分が「連続なら」微分可能]という定理はあるので、実用上はそちらを使う。

= 連鎖律は、写像の合成である

定義を線形写像にした見返りが、ここに出る。

#theorem("連鎖律")[
  $f$ が $bold(a)$ で、$g$ が $f(bold(a))$ で微分可能なら、$g compose f$ も微分可能で
  $ D (g compose f)_bold(a) = D g_(f(bold(a))) compose D f_bold(a) $
]<thm:chain>

#proof[
  $f(bold(a) + bold(h)) = f(bold(a)) + D f(bold(h)) + o(abs(bold(h)))$ を
  $g$ の同じ展開に代入し、$g$ の線形部分が $o$ を $o$ のまま送ることを使う。
]

主張の式に、和も積も出てこない。#strong[ただ合成しているだけ]である。

そして線形写像の合成を基底で書くと行列の積になるので、成分では
$ frac(partial (g compose f)^i, partial x^k)
  = sum_j frac(partial g^i, partial y^j) frac(partial f^j, partial x^k) $
という見慣れた形になる。

#strong[連鎖律で総和が現れる理由が、これで説明される。]
覚えるべきは「合成」の一語で、$sum$ は行列の積を書き下した結果である。

#remark[
  $1$ 変数の $(g compose f)' = g'(f(x)) f'(x)$ が積に見えるのは、
  $1 times 1$ 行列の積が数の積だからにすぎない。
  「微分を分数のように扱ってよい」という言い方も、この場合だけの偶然である。
]

= 高階の微分と、順序交換

$D f$ は点ごとに線形写像を返すので、それ自体が写像である。もう一度微分できる。

$D^2 f_bold(a)$ は $RR^n times RR^n arrow RR^m$ の双線形写像になり、
成分は $partial^2 f \/ partial x^i partial x^j$ である。

#theorem("Schwarz")[
  $f$ の $2$ 階偏導関数が連続なら
  $ frac(partial^2 f, partial x^i partial x^j) = frac(partial^2 f, partial x^j partial x^i) $
]<thm:schwarz>

短い定理だが、この連載で何度も効く。

#table(
  columns: (auto, 1fr),
  [$dif dif = 0$], [#link("/math/differential-forms/4")[外微分]が二度で消える理由],
  [$nabla times nabla f = bold(0)$], [その $RR^3$ での姿],
  [Bianchi 恒等式], [#link("/math/riemannian-geometry/6")[曲率]の微分についての恒等式],
)

どれも「対称なものと反対称なものを縮約すると $0$」という同じ形をしていて、
対称性のほうを供給しているのが @thm:schwarz である。

= 積分と、変数変換

微分の側を線形写像にしたので、積分の側も見ておく。

$RR^n$ の重積分は、直方体を並べて足す。
座標を替えると、直方体が平行体に歪む。その体積比が
#link("/math/linear-algebra/5")[行列式]なので

#theorem("変数変換")[
  $ integral_(phi(U)) f(bold(y)) thin dif bold(y)
    = integral_U f(phi(bold(x))) thin abs(det D phi_bold(x)) thin dif bold(x) $
]<thm:change-of-variables>

$det D phi$ が現れるのは、@def:derivative で微分を線形写像にしたからである。
線形写像が体積を何倍にするかが行列式だった。

絶対値が付いているのは、向きを忘れているためである。
向きまで込めて積分すると絶対値が消えることは、
#link("/math/vector-analysis/2")[ベクトル解析 第 2 回]と
#link("/math/differential-forms/6")[微分形式 第 6 回]で扱う。

= まとめ

#table(
  columns: (auto, 1fr),
  [微分], [最良の線形近似。座標を選ばずに定義できる],
  [偏微分], [その成分。基底を選んだ結果],
  [連鎖律], [線形写像の合成。総和は行列の積を書いた結果],
  [Schwarz], [$2$ 階の対称性。$dif dif = 0$ の供給源],
  [ヤコビアン], [線形写像が体積を何倍にするか],
)

次回は位相を扱う。
@def:derivative で $lim$ と $abs(dot)$ を使ったが、
#strong[極限を言うのに長さは要らない]。開集合だけで足りる。
その分離が、多様体を定義するときに効いてくる。
