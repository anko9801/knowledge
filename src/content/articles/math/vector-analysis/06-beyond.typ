#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "3 次元の外へ",
  date: "2026-08-20",
  field: "math",
  series: "vector-analysis",
  order: 6,
  tags: ("ベクトル解析",),
  summary: "熱力学の状態空間には距離が無い。それでも δQ は 1 形式で、第二法則は「その 1 形式が積分因子を持つ」という主張である。計量を持たない場所こそ、d の独壇場になる。",
  provides: (
    "closed-vs-exact",
    "frobenius-integrability",
    "symplectic-form",
  ),
  requires: (
    "exterior-derivative",
    "wedge-product",
  ),
)

= どこで壊れるのか

五回かけて $RR^3$ のベクトル解析を組み直した。最後に、この記法が通用しない場所を見る。

壊れ方には二種類ある。

#table(
  columns: (auto, 1fr),
  [次元が違う], [$times$ が定義できず、rot がベクトルでなくなる。相対論、場の理論],
  [計量が無い], [$star$ が書けない。$nabla$ 記法の演算子が三つとも定義できない],
)

前者は#link("/math/vector-analysis/1")[第 1 回]で扱った。この回は後者を見る。
そして計量が無い舞台は、遠い応用ではなく、
学部で必ず習う科目の中にある。#strong[熱力学]である。

= 熱力学の状態空間には距離が無い

理想気体の状態は $(T, V)$ とか $(p, V)$ とかで指定できる。
これらの組の全体が状態空間で、$2$ 次元の多様体になっている。

この空間に、長さは無い。
「この状態とあの状態の距離」を測る自然な方法が無いのである。
$T$ と $V$ は単位が違うので、$sqrt(Delta T^2 + Delta V^2)$ には意味がない。
角度も、内積も、$star$ も書けない。

それでも微分と積分はできる。#strong[計量を必要としない構造だけがある]、という状況である。

== 第一法則は $1$ 形式の等式である

熱力学第一法則を書く。
$ delta Q = dif U + p thin dif V $

$dif U$ と $dif V$ は $0$ 形式の外微分、$p$ は状態の関数である。
右辺は $1$ 形式の和なので、左辺の $delta Q$ も $1$ 形式である。

なぜ $dif Q$ ではなく $delta Q$ と書くのか。ここで説明が付く。

#definition[
  $1$ 形式 $omega$ が、ある関数 $f$ を使って $omega = dif f$ と書けるとき#strong[完全]という。
]<def:exact>

$dif U$ は完全である。$U$ という状態量があるからだ。
いっぽう $delta Q$ は完全でない。もし $delta Q = dif Q$ と書ける状態量 $Q$ があれば、
#link("/math/vector-analysis/3")[第 3 回]の Stokes の定理から、閉じた経路について
$ integral.cont delta Q = 0 $
になってしまう。だが熱機関は、サイクルを一周して正味の熱を受け取り、仕事をする。
$integral.cont delta Q != 0$ なのである。

#strong[熱が状態量でないという事実は、$delta Q$ が完全形式でないという一行と同じ]である。
$delta$ という記号は、その注意書きだった。

#remark[
  同じことが仕事にも言える。$delta W = p thin dif V$ も完全でない。
  ところが和 $delta Q - delta W$ は完全になり、それが内部エネルギー $U$ である。
  第一法則の内容は「完全でない二つの $1$ 形式の差が完全になる」ことだと読める。
]

== 第二法則は積分因子の存在である

$delta Q$ は完全でないが、$1 \/ T$ を掛けると完全になる。
$ frac(delta Q, T) = dif S $
これがエントロピーの定義である。

このような $1 \/ T$ を#strong[積分因子]と呼ぶ。
そして「積分因子が存在するか」は、$1$ 形式についての純粋に幾何的な問いである。

#theorem("Frobenius")[
  $1$ 形式 $omega$（$omega != 0$）が局所的に積分因子を持つ、すなわち
  $omega = lambda thin dif f$ と書けるための必要十分条件は
  $ omega and dif omega = 0 $
]<thm:frobenius>

#proof[
  必要性のみ示す。$omega = lambda thin dif f$ なら
  $dif omega = dif lambda and dif f$ なので
  $ omega and dif omega = lambda thin dif f and dif lambda and dif f = 0 $
  である（$dif f and dif f = 0$）。十分性は局所的な標準形の議論による。
]

変数が 2 個なら $dif omega$ は $2$ 形式、$omega and dif omega$ は $3$ 形式で、
$2$ 次元では $Lambda^3 = 0$ だから条件は自動的に成り立つ。
#strong[単純な系でエントロピーが必ず存在するのは、状態空間が $2$ 次元だからである。]

変数が 3 個以上——たとえば混合系や、磁場をかけた系——では自動ではない。
そこで条件を物理から要求する必要が出てくる。それが第二法則である。

#theorem("Carathéodory の原理")[
  任意の状態のどんな近傍にも、そこから断熱的に到達できない状態が存在する。
]<thm:caratheodory>

断熱過程とは $delta Q = 0$ の経路、つまり $delta Q$ の「核」に沿って動くことである。
@thm:caratheodory は、その核が空間を#strong[葉に分ける]ことを要求している。
到達できない状態があるのは、葉をまたげないからだ。
そして葉に分かれる条件が、@thm:frobenius の $omega and dif omega = 0$ にほかならない。

だから $1 \/ T$ と $S$ が存在する。
#strong[第二法則は、$1$ 形式の可積分性についての主張だった]と読める。

熱力学に計量は一度も出てこない。$star$ も長さも角度も使っていない。
それでも $dif$ と $and$ だけで、第一法則も第二法則も述べられる。

== Maxwell の関係式は $dif dif = 0$ である

もう一つ、熱力学で丸暗記させられるものがある。
$ (frac(partial T, partial V))_S = -(frac(partial p, partial S))_V, quad
  (frac(partial S, partial V))_T = (frac(partial p, partial T))_V, quad dots.c $

四本ある。出どころは一つである。
$dif U = T thin dif S - p thin dif V$ の両辺に $dif$ を当てると、左辺は
#link("/math/vector-analysis/3")[第 3 回]の $dif dif = 0$ で消えるので
$ 0 = dif T and dif S - dif p and dif V $
となる。これを $(S, V)$ の座標で成分に書き下せば第一の関係式が、
$(T, V)$ で書けば第二の関係式が出る。
残り二つも、$H$、$F$、$G$ という別の座標の取り方に対応するだけである。

#strong[四本ではなく一本]だった。
そして正体は、偏微分の順序交換である。

= 解析力学にも計量は無い

同じ構造が、もう一つの学部科目にある。

#link("/physics/mechanics/1")[解析力学]の相空間 $(q^1, dots, q^n, p_1, dots, p_n)$ にも、
自然な計量は無い。$q$ と $p$ は単位が違うので、距離が定義できない。

あるのは $2$ 形式である。
$ omega = sum_k dif p_k and dif q^k $
これを#strong[シンプレクティック形式]と呼ぶ。計量とは別の構造で、
対称ではなく#strong[反対称]である。

正準変換とは $omega$ を保つ変換のことで、
Hamilton の運動方程式は「$omega$ と $H$ から決まる流れ」として書ける。
そして
$ omega^n \/ n! = dif p_1 and dif q^1 and dots.c $
が相空間の体積形式になり、これが流れで保たれることが#strong[Liouville の定理]である。
統計力学が相空間の体積を数えて始まるのは、この量が保存するからだ。

#table(
  columns: (auto, auto, 1fr),
  [構造], [対称性], [出てくる場所],
  [計量 $g$], [対称], [長さ、角度、$star$。Riemann 幾何、一般相対論],
  [シンプレクティック $omega$], [反対称], [相空間、正準変換、Liouville],
  [接触構造], [—], [熱力学の状態空間（$delta Q$ の核）],
)

#link("/math/linear-algebra/4")[線形代数 第 4 回]で対称と反対称を分けたが、
その分岐がそのまま#strong[幾何学の分岐]になっている。
対称なほうを主役にすると Riemann 幾何、反対称なほうを主役にするとシンプレクティック幾何である。

= 何を持って出るか

$RR^3$ を離れるとき、持って出られるものと出られないものを分けておく。

#table(
  columns: (auto, 1fr),
  [持って出られる],
  [$dif$、$and$、引き戻し、$integral_Omega dif omega = integral_(partial Omega) omega$、$dif dif = 0$、
   Poincaré の補題と穴の勘定],
  [持って出られない],
  [$times$（$3$ 次元限定）、$star$（計量が要る）、$nabla dot$ と $nabla times$（$star$ を含む）、
   長さ・角度・弧長],
)

そして左の列だけで、熱力学の二法則も、Maxwell の関係式も、
Liouville の定理も、Aharonov--Bohm 効果も述べられた。
#strong[計量を使わずに言えることは、思ったより多い。]

= 連載を閉じる

六回でやったことを一行にたたむ。

#strong[$nabla$ の記法は、$3$ 次元・直交・平坦という三つの条件のもとで、
四つの層をひとつに圧縮した記法だった。]

圧縮のおかげで $3$ 次元の計算は速い。
圧縮のせいで、そこから出られない。

ここから先は二つに分かれる。

#link("/math/differential-forms/1")[微分形式]の連載では、
計量を使わない側だけを取り出して、多様体の上で作り直す。
座標が大域的に張れない場所——球面や、穴の開いた領域——まで話が届くようになる。

#link("/math/riemannian-geometry/1")[Riemann 幾何]の連載では、そこに計量を足す。
$star$ が戻り、長さと角度が戻り、代わりに「平行」を定義し直す必要が出てくる。
その先が一般相対論である。

土台が要るなら#link("/math/linear-algebra/1")[線形代数]へ。
この連載で「基底に依らない」と何度も書いたことの中身は、あちらにある。
