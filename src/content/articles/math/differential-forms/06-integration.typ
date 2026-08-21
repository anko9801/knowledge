#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "積分に距離は要らない",
  date: "2026-08-20",
  field: "math",
  series: "differential-forms",
  order: 6,
  tags: ("微分形式",),
  summary: "n 形式の変換則は、ちょうど重積分のヤコビアンと同じ形をしている。だから n 形式は多様体の上で座標に依らず積分できる。関数は積分できない。この一点が、微分形式という道具の存在理由である。",
  provides: (
    "integration-of-forms",
    "partition-of-unity",
    "boundary",
    "stokes-theorem",
  ),
  requires: (
    "manifold",
    "orientability",
    "k-form",
    "exterior-derivative",
    "jacobian-from-wedge",
  ),
)

= 関数は積分できない

奇妙な見出しだが、正確な主張である。

多様体 $M$ の上に関数 $f$ があるとして、$integral_M f$ は定義できない。
やってみると分かる。チャートを取って $integral f(x) thin dif x^1 dots.c dif x^n$ と書くと、
別のチャートでは変数変換のヤコビアンが出て、値が変わってしまう。

$ integral f thin dif x^1 dots.c dif x^n != integral f thin dif u^1 dots.c dif u^n $

$RR^n$ で気にせずに済んでいたのは、標準の座標を使い続けていたからである。
どの座標も対等な多様体の上では、この式に意味がない。

#example[極座標に移すと、何が起きるか][
  平面で $f equiv 1$ とし、単位円板で積分する。

  直交座標なら $integral dif x thin dif y = pi$ である。
  そのまま $x = r cos theta$、$y = r sin theta$ と置いて
  $integral dif r thin dif theta$ を計算すると $2 pi$ になり、#strong[合わない]。

  合わせるには $r$ を掛けなければならない。この $r$ がヤコビアンで、
  $ dif x and dif y = r thin dif r and dif theta $
  である。#strong[$2$ 形式として書けば、$r$ は自動的に付いてくる。]

  関数として $f$ だけを運ぶと $r$ が落ちる。
  微積分で「置換積分ではヤコビアンを忘れるな」と注意されるのは、
  #strong[運ぶべきものが関数ではなく形式だから]である。
]

いっぽう $n$ 形式は積分できる。理由は一行で言える。

#strong[$n$ 形式の変換則が、ちょうどヤコビアンと同じ形をしているからである。]

= 定義

#definition[
  向き付けられた $n$ 次元多様体 $M$ の一つのチャート $(U, phi)$ に台を持つ
  $n$ 形式 $omega = f thin dif x^1 and dots.c and dif x^n$ に対して
  $ integral_M omega := integral_(phi(U)) f(x) thin dif x^1 dots.c dif x^n $
  と定める（右辺は $RR^n$ の普通の重積分）。
]<def:chart-integral>

#proposition[
  @def:chart-integral の値は、向きを保つチャートの取り替えに依らない。
]<prop:well-defined>

#proof[
  座標を $x = x(u)$ と取り替える。
  #link("/math/vector-analysis/2")[ベクトル解析 第 2 回]で見たとおり、楔積の反対称性から
  $ dif x^1 and dots.c and dif x^n = det J thin dif u^1 and dots.c and dif u^n $
  である。いっぽう重積分の変数変換は $abs(det J)$ を掛ける。
  向きを保つ取り替えでは $det J > 0$ なので、両者が一致する。
]

証明が短いが、ここに全部が入っている。
$n$ 形式は#strong[ヤコビアンを自分で連れて変換する]ので、
重積分の変換則とちょうど釣り合う。関数にはそれが無い。

#strong[「積分できるもの」として設計されたのが微分形式だった]、と言ってよい。
$k$ 次元の領域には $k$ 形式、というのはそういう意味である。

そして @prop:well-defined の証明には、計量が一度も出てこない。
必要だったのは向き付けだけである。

= 一枚に収まらないとき

@def:chart-integral は、チャート一枚に収まる形式にしか使えない。
球面全体のような場合は、分けて足す必要がある。

#definition[
  被覆 ${U_alpha}$ に従属する#strong[1 の分割]とは、
  各 $rho_alpha$ が $U_alpha$ に台を持ち、$0 <= rho_alpha <= 1$ で
  $ sum_alpha rho_alpha = 1 $
  を満たす滑らかな関数の族である。
]<def:partition>

滑らかな多様体では常に存在する（証明は省く。滑らかな山形関数を貼り合わせて作る）。

#definition[
  一般の $omega in Omega^n(M)$ に対し
  $ integral_M omega := sum_alpha integral_M rho_alpha thin omega $
  と定める。各項は一枚のチャートに収まるので @def:chart-integral が使える。
]<def:integral>

別の 1 の分割を使っても同じ値になることは、
両方を掛けた $rho_alpha sigma_beta$ による和を経由すれば確かめられる。

#remark[
  1 の分割は「局所でできることを大域へ持ち上げる」ための標準的な道具である。
  前回、向き付け可能なら体積形式が存在することを示したときも、これを使った。

  ただし持ち上げられるのは、和を取ってよい性質だけである。
  「閉形式であること」は和で保たれないので、
  #link("/math/differential-forms/7")[次回]の話は 1 の分割では片付かない。
  そこが位相の出てくる場所になる。
]

= 境界

Stokes の定理を述べるには、境界が要る。

#definition[
  $M$ が#strong[境界付き多様体]であるとは、前回の多様体の定義で $RR^n$ を
  半空間 $ H^n = {x in RR^n : x^n >= 0} $ に置き換えたものをいう。
  $x^n = 0$ に対応する点の全体を $partial M$ と書き、境界と呼ぶ。
  $partial M$ は $(n-1)$ 次元多様体になる。
]<def:boundary>

#definition[
  $M$ の向きから $partial M$ の向きを、
  #strong[外向きの方向を先頭に置く]という規約で定める。
]<def:induced-orientation>

@def:induced-orientation は
#link("/math/vector-analysis/3")[ベクトル解析 第 3 回]で立てた規約と同じものである。
そこでは $k = 1, 2, 3$ が「引き算」「反時計回り」「外向き法線」に対応した。

そして
$ partial(partial M) = nothing $
が成り立つ。境界の境界は無い。
これが $dif dif = 0$ と対になっていることは、次の定理を見れば分かる。

= 定理

#theorem("Stokes")[
  $M$ を向き付けられたコンパクトな $n$ 次元境界付き多様体、
  $omega$ をその上の $(n-1)$ 形式とすると
  $ integral_M dif omega = integral_(partial M) omega $
]<thm:stokes>

#proof[
  1 の分割 ${rho_alpha}$ を取る。両辺とも $omega$ について線形なので、
  $rho_alpha omega$ について示せばよい。すなわち、
  #strong[一枚のチャートに収まる場合]に帰着する。

  チャートが境界に触れない場合、$omega$ の台は内部にあり、
  #link("/math/vector-analysis/3")[ベクトル解析 第 3 回]の立方体での計算により
  $integral dif omega = 0$ である。右辺も $0$。

  チャートが境界に触れる場合、同じ計算で、
  境界に乗った面からの寄与だけが残る。それが右辺である。
  符号が合うのは @def:induced-orientation の規約による。

  和を取って
  $ integral_M dif omega = sum_alpha integral_M dif(rho_alpha omega)
    = sum_alpha integral_(partial M) rho_alpha omega = integral_(partial M) omega $
  を得る（$sum_alpha dif rho_alpha = dif(1) = 0$ を使った）。
]

証明の実質は、$RR^n$ での立方体の計算——すなわち 1 次元の微積分学の基本定理——だけである。
1 の分割が、それを多様体全体へ運んでいる。

== 境界が無いときに何が言えるか

#corollary[
  $partial M = nothing$（閉多様体）なら、任意の $(n-1)$ 形式について
  $ integral_M dif omega = 0 $
]<cor:closed>

短い系だが、後で重い意味を持つ。

たとえば $S^2$ の面積形式 $sigma$ を考える。
$integral_(S^2) sigma = 4 pi != 0$ である。
@cor:closed の対偶から、#strong[$sigma$ は完全形式ではない]。
つまり $sigma = dif eta$ と書ける $1$ 形式 $eta$ は、$S^2$ 全体では存在しない。

局所的には存在する。北極を除けば書けるし、南極を除いても書ける。
それでも全体では書けない。
#strong[積分が、局所と大域の食い違いを検出している。]

これが磁気単極子の話と同じ構造であることは、
#link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で見たとおりである。
$nabla dot bold(B) = 0$ でも大域的な $bold(A)$ が無い、というあの話が、
ここでは @cor:closed の一行になった。

= 積分は形式と領域のペアリングである

最後に、この回の見方を一つ言い直しておく。

$integral_M omega$ は、$M$ という $n$ 次元の領域と $omega$ という $n$ 形式から数を作る。
つまり#strong[領域と形式の間の組み合わせ]である。

@thm:stokes は、この組み合わせについて
$ chevron.l M, dif omega chevron.r = chevron.l partial M, omega chevron.r $
と書ける。$dif$ と $partial$ が、この組み合わせに関して互いの相方になっている、
という主張である。

そして $partial partial = 0$ と $dif dif = 0$ が対応する。
偶然ではない。片方から他方が従う。

この対応を最後まで押していくと、
#strong[形式の側の情報と、領域の側の情報が同じものになる]。
それが de Rham の定理で、次回の到達点である。
