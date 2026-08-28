#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/diagram.typ": diagram, ink, ink-thin, ink-wash

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

#check("前回のふりかえり")[
  Vitali の議論は三つの要求——区間の長さは $b-a$、平行移動で不変、
  可算加法的——から矛盾を出した。#strong[どれか一つを捨てれば矛盾は消える。]
  だが測度論は三つとも捨てなかった。では何を変えたのか。
][
  要求ではなく、#strong[要求を課す範囲]を変えた。三つはそのまま残し、
  「$RR$ のすべての部分集合について」という部分だけを外す。

  だから $sigma$ 加法族が先に来る。測る対象を決めてから測度を定義するので、
  Vitali 集合はそもそも定義域に入らず、矛盾を作れない。

  この手つきは今回も効く。積分でも「どの関数を積分するか」（可測関数）を先に
  決める。#strong[公理を弱めるのではなく、適用範囲を切る]のが測度論の作法である。
]

= 刻む向きを変えると、極限が通る

同じ面積を、縦に切るか横に切るかの違いしかない。
それなのに#strong[極限と積分を交換してよい条件が、大きく緩む]。
切り方の都合が、なぜ極限の話に効くのか。

Riemann 積分は、定義域を細かく刻んで長方形を並べる。
$ sum_i f(xi_i) (x_(i+1) - x_i) $

Lebesgue 積分は、#strong[値域を刻む]。
値が $[y_j, y_(j+1))$ に入る点を集め、その集合の測度を掛けて足す。
$ sum_j y_j thin mu({x : y_j <= f(x) < y_(j+1)}) $

「値が同じくらいの点をまとめてから測る」という順序である。
そして「まとめた集合が測れるか」を保証するのが、前回の $sigma$ 加法族だった。

#let W = 108pt
#let H = 66pt
#let f = ((0.0, 0.15), (0.18, 0.55), (0.34, 0.38), (0.52, 0.82), (0.70, 0.62), (0.86, 0.92), (1.0, 0.70))
#let px(t) = W * t
#let py(v) = H - H * v

#let frame = {
  place(line(start: (0pt, H), end: (W + 6pt, H), stroke: 0.5pt + ink))
  place(line(start: (0pt, -5pt), end: (0pt, H), stroke: 0.5pt + ink))
}

#let graph = place(
  curve(
    stroke: 0.9pt + ink,
    curve.move((px(f.at(0).at(0)), py(f.at(0).at(1)))),
    ..f.slice(1).map(p => curve.line((px(p.at(0)), py(p.at(1))))),
  ),
)

// 折れ線 f を x で評価する。刻み目をグラフまで届かせるために要る。
#let at(x) = {
  let y = f.last().at(1)
  for i in range(f.len() - 1) {
    let (x0, y0) = f.at(i)
    let (x1, y1) = f.at(i + 1)
    if x >= x0 and x <= x1 {
      y = y0 + (y1 - y0) * (x - x0) / (x1 - x0)
    }
  }
  y
}

#let riemann = box(width: W + 10pt, height: H + 8pt, {
  frame
  for i in range(1, 8) {
    let t = i / 8
    place(line(start: (px(t), H), end: (px(t), py(at(t))), stroke: 0.5pt + ink-thin))
  }
  graph
})

// 値の帯 [0.50, 0.65] の逆像。折れ線 f から手で解いた三区間で、
// 「値でまとめると x 側はばらける」ことがこの図の言いたいことである。
#let band = (0.50, 0.65)
#let preimage = ((0.158, 0.227), (0.389, 0.451), (0.673, 0.716))

#let lebesgue = box(width: W + 10pt, height: H + 8pt, {
  frame
  place(
    dy: py(band.at(1)),
    rect(width: W, height: py(band.at(0)) - py(band.at(1)), fill: ink-wash, stroke: none),
  )
  for v in band {
    place(line(start: (0pt, py(v)), end: (W, py(v)), stroke: 0.5pt + ink-thin))
  }
  graph
  // 逆像は x 軸の上に、太い線分として落とす。
  for (a, b) in preimage {
    place(line(start: (px(a), H), end: (px(b), H), stroke: 2.2pt + ink))
  }
})

#diagram(
  caption: [
    左は定義域を刻む。右は値域を刻み、値が帯に入る $x$ を集める。
    集めた集合は#strong[三つの区間にばらける]。
    これが「測れる集合」を先に決めておく理由である。
  ],
  grid(columns: (auto, 16pt, auto), riemann, [], lebesgue),
)

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

#link("/math/topology/1#def-continuous")[位相]の連続の定義（開集合の逆像が開集合）と同じ形である。
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
  [Riemann], [#strong[一様収束]が要る（#link("/math/analysis/2#def-uniform")[解析 第 2 回]）],
  [Lebesgue], [#strong[各点収束]でよい。押さえの関数 $g$ があれば],
)

一様収束は $sup$ を制御する強い条件で、実際にはめったに成り立たない。
各点収束は弱いので、使える場面が桁違いに多い。

#strong[差は刻む向きから出ている。]Riemann は定義域を刻むので、各小区間の上で
$f_n$ の#strong[振れ幅]を押さえないと、上積分と下積分が寄らない。それを全区間で
一斉に要求したものが一様収束である。Lebesgue は値域を刻むので、要るのは
「値が $[y, y+Delta)$ に入る点の集合が測れること」と「その測度が極限で追随すること」
だけで、各点の収束の速さが揃っている必要が無い。

つまり#strong[一様収束は Riemann の刻み方が要求していたもので、
積分される関数の側の性質ではなかった]。刻む向きを変えると、その要求ごと消える。

#strong[この一点のために測度論を組んだ]、と言ってよい。
極限と積分の交換は、微分方程式でも Fourier 解析でも確率論でも、毎回必要になる。

#example[押さえが無いと壊れる][
  $[0, infinity)$ で $f_n = bold(1)_([n, n+1])$ とすると、各点で $f_n arrow 0$ である。
  ところが $integral f_n = 1$ で、極限は $0$ にならない。

  この列を上から押さえる可積分関数は無い（$sup_n f_n = bold(1)_([0,infinity))$ は可積分でない）。
  @thm:dct の条件が効いていることが、この例で分かる。
]

#check[
  @thm:mct と @thm:dct は、どちらも「各点収束でよい」と言っている。
  では二つは何が違い、@thm:mct のほうには押さえの $g$ が要らないのはなぜか。
][
  @thm:mct は#strong[増加列]に限る代わりに、押さえを要らなくしている。
  増加列なら $f$ 自身が上からの押さえになっていて、$sup_n f_n = f$ だからである。

  @thm:dct は増加を捨てる代わりに、外から $g$ を要求する。
  上の例で壊れたのはまさにここで、$f_n = bold(1)_([n,n+1])$ は増加列でもなく、
  可積分な押さえも持たない。二つの定理のどちらの傘にも入らない。
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

#link("/math/analysis/2#def-complete")[解析 第 2 回]で、連続関数の空間に
$integral abs(f)$ のノルムを入れると完備でない、と書いた。
穴を埋めた先がここである。
#strong[完備にするために、連続でない関数まで入れることになった。]

$p = 2$ のとき、$L^2$ は内積
$ chevron.l f, g chevron.r = integral f g thin dif mu $
を持つので #link("/math/analysis/2")[Hilbert 空間]になる。
Fourier 級数も、量子力学の状態空間も、ここに住む。

#check[
  @def:lp で「零集合の違いを同一視する」と断らずに、可測関数そのものの集合として
  $L^p$ を定めると、何が成り立たなくなるか。
][
  ノルムの公理の $norm(f) = 0 arrow.l.r.double f = 0$ である。

  有理数の上でだけ $1$、ほかで $0$ の関数は $norm(f)_p = 0$ だが、
  関数としては $0$ ではない。同一視しないとノルム空間ですらないので、
  完備性（@thm:riesz-fischer）を論じる土俵に乗らない。

  前回の「測度論は零集合の違いを見ない」が、そのまま効いている。
]

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
