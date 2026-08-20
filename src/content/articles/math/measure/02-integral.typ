#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "値域を刻む",
  date: "2026-08-21",
  field: "math",
  series: "measure",
  order: 2,
  tags: ("測度と確率",),
  summary: "Riemann 積分は定義域を刻む。Lebesgue 積分は値域を刻む。この違いだけで、極限と積分を交換してよい条件が大きく緩む。",
  provides: (
    "lebesgue-integral",
    "convergence-theorems",
    "lp-space",
  ),
)

#layer("L0 測度")[前回の測度の上で積分を定義する。位相は使わない]

= 刻む向きを変える

Riemann 積分は、定義域を細かく刻んで長方形を並べる。
$ sum_i f(xi_i) (x_(i+1) - x_i) $

Lebesgue 積分は、#strong[値域を刻む]。
値が $[y_j, y_(j+1))$ に入る点を集め、その集合の測度を掛けて足す。
$ sum_j y_j thin mu({x : y_j <= f(x) < y_(j+1)}) $

「値が同じくらいの点をまとめてから測る」という順序である。
そして「まとめた集合が測れるか」を保証するのが、前回の $sigma$ 加法族だった。

差が出る例を先に見る。

#example[Dirichlet 関数][
  $ f(x) = cases(1 & (x in QQ), 0 & (x in.not QQ)) $
  を $[0,1]$ で考える。

  Riemann の意味では、どんなに細かく刻んでも各小区間に有理数と無理数の両方があるので、
  上積分は $1$、下積分は $0$ になり、積分できない。

  Lebesgue の意味では簡単である。値が $1$ の集合は $QQ inter [0,1]$ で測度 $0$、
  値が $0$ の集合は測度 $1$。よって
  $ integral_0^1 f thin dif mu = 1 dot 0 + 0 dot 1 = 0 $
]

= 定義

#definition[
  $f : X arrow RR$ が#strong[可測]であるとは、任意の Borel 集合 $B$ について
  $f^(-1)(B) in cal(F)$ が成り立つことをいう。
]<def:measurable>

#link("/math/foundations/3")[位相]の連続の定義（開集合の逆像が開集合）と同じ形である。
逆像で定義する、というのが構造を保つ写像の共通の書き方になっている。

#definition[
  可測集合の指示関数の有限な線形結合
  $ s = sum_(i=1)^n a_i thin bold(1)_(A_i) $
  を#strong[単関数]と呼び、その積分を
  $ integral s thin dif mu := sum_i a_i thin mu(A_i) $
  で定める。非負可測関数 $f$ に対しては
  $ integral f thin dif mu := sup {integral s thin dif mu : s upright(" は単関数、") 0 <= s <= f} $
  一般の $f$ には $f = f^+ - f^-$ と分けて定める。
]<def:integral>

$sup$ で定義しているのは、Riemann 積分の下積分と同じ発想である。
違うのは、近似に使う「単関数」が区間ではなく#strong[任意の可測集合]の上で一定なことである。
そのぶん近似が細かくできて、積分できる関数が増える。

= 極限と交換してよいか

Lebesgue 積分を採る本当の理由は、ここにある。

#theorem("単調収束定理")[
  非負可測関数の列が $f_1 <= f_2 <= dots.c$ と増加して $f$ に各点収束するなら
  $ lim_n integral f_n thin dif mu = integral f thin dif mu $
]<thm:mct>

#theorem("優収束定理")[
  $f_n arrow f$ が各点収束し、ある可積分な $g$ について $abs(f_n) <= g$ が
  すべての $n$ で成り立つなら
  $ lim_n integral f_n thin dif mu = integral f thin dif mu $
]<thm:dct>

条件を見比べてほしい。

#table(
  columns: (auto, 1fr),
  [Riemann], [#strong[一様収束]が要る（#link("/math/foundations/4")[土台 第 4 回]）],
  [Lebesgue], [#strong[各点収束]でよい。押さえの関数 $g$ があれば],
)

一様収束は $sup$ を制御する強い条件で、実際にはめったに成り立たない。
各点収束は弱いので、使える場面が桁違いに多い。

#strong[この一点のために測度論を組んだ]、と言ってよい。
極限と積分の交換は、微分方程式でも Fourier 解析でも確率論でも、毎回必要になる。

#example[押さえが無いと壊れる][
  $[0, infinity)$ で $f_n = bold(1)_([n, n+1])$ とすると、各点で $f_n arrow 0$ である。
  ところが $integral f_n = 1$ で、極限は $0$ にならない。

  この列を上から押さえる可積分関数は無い（$sup_n f_n = bold(1)_([0,infinity))$ は可積分でない）。
  @thm:dct の条件が効いていることが、この例で分かる。
]

#remark[
  @thm:mct の証明は、単関数の $sup$ として定義した @def:integral から素直に出る。
  @thm:dct は、Fatou の補題（$integral liminf <= liminf integral$）を経由する。

  どちらも可算加法性と、前回の測度の連続性（増大列の極限と測度が交換すること）を使う。
  「可算」の制限が、そのまま「極限が扱える」という利点になって返ってくる。
]

= $L^p$ 空間

積分ができるので、関数の大きさが測れる。

#definition[
  $ norm(f)_p := (integral abs(f)^p thin dif mu)^(1\/p) quad (1 <= p < infinity) $
  が有限な可測関数の全体を、零集合の違いを同一視して $L^p (mu)$ と書く。
]<def:lp>

同一視が要る。$norm(f)_p = 0$ でも $f$ が恒等的に $0$ とは限らず、
零集合の上では何でもよいからである。
そこを同一視して初めて、ノルムの公理（$norm(f) = 0 arrow.l.r.double f = 0$）が成り立つ。

#theorem("Riesz--Fischer")[
  $L^p (mu)$ は完備である。すなわち Banach 空間になる。
]<thm:riesz-fischer>

#link("/math/foundations/4")[土台 第 4 回]で、連続関数の空間に
$integral abs(f)$ のノルムを入れると完備でない、と書いた。
穴を埋めた先がここである。
#strong[完備にするために、連続でない関数まで入れることになった。]

$p = 2$ のとき、$L^2$ は内積
$ chevron.l f, g chevron.r = integral f g thin dif mu $
を持つので #link("/math/foundations/4")[Hilbert 空間]になる。
Fourier 級数も、量子力学の状態空間も、ここに住む。

= まとめ

#table(
  columns: (auto, 1fr),
  [刻む向き], [Riemann は定義域、Lebesgue は値域],
  [可測関数], [Borel 集合の逆像が可測。連続の定義と同じ形],
  [単調収束・優収束], [#strong[各点収束]で交換してよい。これが目的],
  [$L^p$], [零集合を同一視して完備になる],
)

道具はそろった。次回、全測度を $1$ に正規化する。
それだけで確率論になる。

可測関数は確率変数と呼ばれ、積分は期待値と呼ばれ、
積測度は独立性と呼ばれる。#strong[名前が変わるだけで、中身はここまでと同じ]である。
