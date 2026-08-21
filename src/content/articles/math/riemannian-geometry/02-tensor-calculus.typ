#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "偏微分はテンソルにならない",
  date: "2026-08-20",
  field: "math",
  series: "riemannian-geometry",
  order: 2,
  tags: ("Riemann 幾何",),
  summary: "テンソル解析の記法をここで用意する。そして一つの事実に出会う。テンソル場を偏微分しても、テンソルにならない。この破れ方が、次回に接続を導入する動機になる。",
  provides: (
    "tensor-field",
    "musical-isomorphism",
    "partial-is-not-a-tensor",
  ),
  requires: (
    "riemannian-metric",
    "tensor-type",
    "tensor-transformation-law",
  ),
)

= なぜ添字に戻るのか

#link("/math/differential-forms/7")[微分形式]の連載では、添字をほとんど書かなかった。
$dif$ も $and$ も $star$ も、座標を選ばずに書けたからである。

計量が入ると、そうはいかなくなる。理由が二つある。

#strong[一つ、計量は対称テンソルである。]
#link("/math/linear-algebra/4")[線形代数 第 4 回]で見たとおり、
微分形式が扱えるのは反対称なものだけだった。
$g_(i j) = g_(j i)$ は反対称でないので、$k$ 形式として書けない。

#strong[二つ、曲率は混合対称である。]
$R_(i j k l)$ は前 2 本と後ろ 2 本について反対称だが、全体としては反対称でない。
やはり微分形式では書ききれない。

だから Riemann 幾何は、最後まで添字と付き合う。
この回はその記法を用意し、最後に一つの困難を見つける。

= テンソル場

#definition[
  各点 $p$ に $(p, q)$ 型テンソル（#link("/math/linear-algebra/3")[線形代数 第 3 回]）を
  滑らかに与えたものを#strong[テンソル場]と呼ぶ。座標では
  $ T^(i_1 dots.c i_p){}_(j_1 dots.c j_q) (x) $
  と成分で書く。
]<def:tensor-field>

座標を $x arrow.long.bar x'$ と替えると、成分は
$ T'^(i){}_(j) = frac(partial x'^i, partial x^k) frac(partial x^l, partial x'^j) thin T^(k){}_(l) $
と変わる（$(1,1)$ 型で書いた。一般も同様）。
上の添字にはヤコビ行列が、下の添字にはその逆行列が掛かる。

線形代数の回で見たとおり、これは定義ではなく定理である。
多重線形写像を座標で書いたときに、そうなるというだけである。

== 上げ下げ

計量があるので、上下を行き来できる。
$ T_(i j) = g_(i k) T^k{}_j, quad T^(i j) = g^(i k) T_k{}^j $

すべてを下付きで書く流儀があるのは、この操作で型を潰しているからである。
潰していることを忘れなければ問題ない。

#remark[
  #link("/math/vector-analysis/4")[ベクトル解析 第 4 回]で、
  学部の添字記法が四つの前提を暗黙に置いていると書いた。
  そのうち三つ——$g_(i j) = delta_(i j)$、上下を区別しない、$epsilon$ の値を固定——は、
  この回で外れた。残る一つ「基底が場所によらない」が、
  次の節で問題になる。
]

= 偏微分してみる

テンソル場ができたので、微分したい。
素朴には、成分を偏微分すればよさそうに見える。

#proposition[
  ベクトル場の成分 $X^i$ を偏微分した $partial_j X^i$ は、テンソルの成分ではない。
]<prop:not-tensor>

#proof[
  座標変換の下で
  $ X'^i = frac(partial x'^i, partial x^k) X^k $
  である。両辺を $x'^j$ で偏微分すると、積の微分から
  $ frac(partial X'^i, partial x'^j)
    = frac(partial x^l, partial x'^j) frac(partial x'^i, partial x^k) frac(partial X^k, partial x^l)
      + underbrace(frac(partial^2 x'^i, partial x^k partial x^l)
        frac(partial x^l, partial x'^j) X^k, upright("余分な項")) $
  第一項はテンソルの変換則そのものだが、第二項が残る。
  座標変換が線形でなければ $partial^2 x' \/ partial x partial x != 0$ なので、
  この項は消えない。
]

#strong[微分したとたんにテンソルでなくなる。]
これは記法の不備ではなく、実質的な困難である。

== なぜ壊れるのか

原因は、@prop:not-tensor の証明よりも幾何のほうにある。

ベクトル場を微分するとは
$ lim_(h arrow 0) frac(X_(p + h) - X_p, h) $
のようなものを取ることである。ところが $X_(p+h)$ は $T_(p+h)$ の元、
$X_p$ は $T_p$ の元で、#strong[別のベクトル空間にいる]。
引き算が定義されていない。

成分で書くと引き算ができるように見えるのは、
「同じ座標基底 $partial \/ partial x^i$ を使っているから同一視してよい」
と暗黙に仮定しているからである。
座標基底は場所によって変わるので、この仮定は正当化されていない。

#example[極座標で見える破れ][
  平面上の定ベクトル場——どこでも同じ向き、同じ長さ——を極座標で書く。
  たとえば $x$ 方向を向く単位ベクトル場は
  $ X = cos theta thin frac(partial, partial r) - frac(sin theta, r) frac(partial, partial theta) $
  になる。成分が場所によって変わっている。

  $partial_theta X^r = -sin theta != 0$ である。
  #strong[「変わらないベクトル場」の偏微分が $0$ にならない。]
  変わっているのは場ではなく、基底のほうである。
]

= 何を足せばよいか

@prop:not-tensor の証明で残った余分な項は、$X^k$ に比例していた。
だから、同じ形の項を持つ何かを引けば消せる。

$ nabla_j X^i := partial_j X^i + Gamma^i{}_(j k) X^k $

$Gamma$ が、余分な項をちょうど打ち消すように変換してくれればよい。
そういう $Gamma$ が存在するか、一意に決まるか、というのが次回の問いである。

先に結論を言っておくと、$Gamma$ は#strong[一意には決まらない]。
決めるには追加の条件が要る。そして、その追加の条件のほうが本質である。

#table(
  columns: (auto, 1fr),
  [多様体], [微分できる。$dif$ が使える],
  [＋計量], [測れる。長さ・角度・体積・$star$],
  [＋接続], [#strong[比べられる]。平行移動、共変微分、まっすぐ],
)

三段目が、まだ無い構造である。
そして「計量から自然に決まる接続がただ一つある」というのが、
Riemann 幾何の出発点になる定理である。

#remark[
  接続は計量とは独立の構造である。
  計量を持たない多様体にも接続は入れられるし、
  同じ計量に対して（捩れを許せば）複数の接続が入る。

  接続を主役に据えると、話は接束から一般のベクトル束へ広がる。
  多様体の各点にベクトル空間を付けたものが束で、
  その上で「隣の点の元と比べる方法」を決めるのが接続である。
  この連載では接束（$T M$）の場合だけを扱うが、
  以下の議論はほとんどそのまま一般の束に移る。
]

= 記法の対応表

添字記法と形式の記法の対応を、計量入りの版で置いておく。

#table(
  columns: (auto, auto),
  [添字], [座標を選ばない書き方],
  [$X^i$], [ベクトル場 $X$],
  [$omega_i$], [$1$ 形式 $omega$],
  [$g_(i j)$], [計量 $g$（$2$ 形式ではない。対称なので）],
  [$g_(i j) X^j$], [$flat X$],
  [$partial_i f$], [$dif f$],
  [$epsilon_(i j k) arrow sqrt(g) thin epsilon_(i j k)$], [体積形式 $upright("vol")$],
  [$Gamma^i{}_(j k)$], [接続（形式では書けない。テンソルですらない）],
)

最後の行が、この連載で添字を捨てられない理由である。
$Gamma$ はテンソルでないので、座標を選ばない記法では表しようがない。

次回、その $Gamma$ を導入する。
そして極座標の運動方程式に現れる遠心力と Coriolis 力が、
$Gamma$ の成分そのものであることを見る。
