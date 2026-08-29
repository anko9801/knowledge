#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "山の形は書いたときのままではない",
  date: "2026-08-31",
  field: "physics",
  series: "gauge-theory",
  order: 4,
  tags: ("ゲージ場の量子論",),
  summary: "谷が割れるポテンシャルは、二次の項の符号を手で逆にして書きます。量子の効果を入れると山の形が変わり、符号を入れなくても谷が割れることがあります。そのとき、次元を持たない理論から質量が出てきます。ただし山の形そのものは測れる量ではありません。",
  provides: (
    "effective-potential",
    "coleman-weinberg",
    "dimensional-transmutation",
  ),
)

= 符号を手で入れていた

谷が割れるポテンシャルは、こう書きます。

$ V = - mu^2 abs(phi.alt)^2 + lambda abs(phi.alt)^4 $

$mu^2 > 0$ に取ります。#strong[二次の項の符号を、手で逆にしています。]

そう取れば谷が割れます。取らなければ割れません。
#strong[割れるかどうかを、こちらが決めています。]

自然が決めているはずのことを、こちらが入力にしている。

そして、書いた $V$ をそのまま使っています。#strong[古典的な扱いです。]
量子の効果を入れると、山の形が変わります。

#strong[形が変わった先で、谷が割れることがあります。] 書いた時点では
割れていないのに。

= 場の値を止めて、残りを積分する

量子の効果を入れた山の形を定義します。

場 $phi.alt$ の値を $phi.alt_c$ に固定して、それ以外の揺れについて積分します。
出てきたエネルギーを $phi.alt_c$ の関数として書く。

#definition[
  場の値を固定したときの、揺れを積分したあとのエネルギー密度を
  #strong[有効ポテンシャル]と呼ぶ。
]<def:veff>

@def:veff は、#link("/physics/renormalization/4")[くりこみ 第 4 回]と
同じ形の操作です。あちらは細かい運動量を積分しました。
こちらは、場の値を止めて残りを積分します。

#strong[どちらも「一部を畳んで、残りについての理論を作る」形です。]

一つ輪を数えると、$V$ に付く補正が計算できます。揺れの質量は $phi.alt_c$ に
依るので、補正も $phi.alt_c$ に依ります。

$ V_"eff" (phi.alt_c) = V(phi.alt_c)
  + (1) / (64 pi^2) thin m^4 (phi.alt_c) thin log (m^2 (phi.alt_c)) / (Lambda^2) $

#strong[対数が出ます。] 前回の $V$ には無かった形です。

= 谷が無いところに谷ができる

@def:veff を、$mu^2 = 0$ の場合に当てます。

#strong[質量項をゼロに取ります。] 前回の言葉では、手で入れた符号を
入れないということです。

$ V = lambda abs(phi.alt)^4 $

古典的には、谷は $phi.alt = 0$ の一つだけ。#strong[破れません。]

一つ輪の補正を足します。$m^2(phi.alt_c) prop lambda phi.alt_c^2$ なので

$ V_"eff" prop lambda phi.alt_c^4
  + c thin lambda^2 phi.alt_c^4 log (phi.alt_c^2) / (Lambda^2) $

#strong[対数が効きます。] $phi.alt_c$ が小さいところで $log$ が
大きな負の値になるので、二項目が負に振れる。

競い合った結果、#strong[$phi.alt_c = 0$ ではないところに谷ができます。]

#theorem("Coleman と Weinberg、1973 年")[
  古典的には破れていない理論が、#strong[量子補正だけで破れる]ことがある。
]<thm:cw>

@thm:cw では、前回のように符号を手で入れていません。#strong[入れたのは、
質量項がゼロという条件だけです。]

#check("なぜ小さいところで対数が効くのか")[
  $log(phi.alt_c^2 slash Lambda^2)$ は、$phi.alt_c$ が小さいほど
  大きな負の数になります。だから二項目は、$phi.alt_c arrow.r 0$ で
  #strong[いくらでも負になりそうに見えます。]

  それなら谷は原点にいくらでも近づくはずです。
  #strong[どこで止まるのでしょうか。]
][
  #strong[$phi.alt_c^4$ が先に消えるからです。]

  二項目は $phi.alt_c^4 log phi.alt_c^2$ です。$log$ は発散しますが、
  $phi.alt_c^4$ のほうが速くゼロへ行く。#strong[積はゼロに戻ります。]

  だから二項目は、途中で一番深くなって、また上がってきます。
  その一番深いところが谷です。

  位置は、二つの項の比で決まります。$lambda$ と $c lambda^2 log$ が
  競い合うので、#strong[$log$ が $1 slash lambda$ の程度になるところ]です。

  $ log (v^2) / (Lambda^2) tilde - (1) / (lambda) $

  つまり $v tilde Lambda thin e^(-1 slash 2 lambda)$。

  #strong[結合定数が小さいほど、谷が指数関数的に近くなります。]
  そして $lambda$ が小さいと二項目も小さいので、
  一つ輪だけ数えた式が信用できる範囲に入ります。
]

= 次元を持たない理論から質量が出る

@thm:cw の谷の位置を、もう一度見ます。

$ v tilde Lambda thin e^(-1 slash 2 lambda) $

#strong[書いた理論に、質量を持つ量がありません。] $lambda$ は無次元で、
質量項はゼロに取りました。

それなのに、$v$ という質量の次元を持つ量が出ています。

#definition[
  次元を持たない理論から、次元を持つ量が出ることを
  #strong[次元変換]と呼ぶ。
]<def:transmutation>

@def:transmutation は、#link("/physics/renormalization/3")[くりこみ 第 3 回]で
一度出ています。あそこでは $Lambda_"QCD"$ でした。無次元の結合定数が
エネルギーの目盛りを持ち込む、という形。

#strong[同じことが起きています。] 走る結合定数が $mu$ に依っていて、
その依存が目盛りを作る。

無次元の助変数 $lambda$ が、有次元の $v$ に化けた。#strong[助変数の個数は
変わっていません。] 一つが一つに置き換わっただけです。

= 谷が割れる理由が二つになった

前回と今回で、谷が割れる形が二つ出ました。

#table(
  columns: (auto, auto, 1fr),
  [], [入れるもの], [出るもの],
  [前回], [$mu^2 > 0$ を手で入れる], [$v = sqrt(mu^2 slash 2 lambda)$],
  [今回], [$mu^2 = 0$ とだけ置く], [$v tilde Lambda e^(-1 slash 2 lambda)$],
)

#strong[今回のほうが、入れるものが少ないです。] 符号を選んでいません。

それでも、#strong[どちらが自然の側かは決まっていません。]

標準模型の Higgs については、前回の形が使われています。質量項を手で入れて、
その符号を負に取る。#strong[$mu^2$ の値は実験から入れます。]

@thm:cw の形が使われていない理由が一つあります。#strong[出てくる質量の比が
合いません。] 標準模型で@thm:cw を素直に当てると、Higgs 粒子が
$W$ 粒子よりずっと軽くなります。$125$ GeV は $80$ GeV より重い。

= 山の形そのものは測れない

@def:veff を作ったところを見直します。

場の値を止めて、残りを積分しました。#strong[「場の値」というのは、
どの場のことでしょうか。]

#link("/physics/quantum-field-theory/6")[場の量子論 第 6 回]で、
場は一意に決まらないと出ました。$phi.alt$ を $phi.alt + lambda phi.alt^3$ に
取り替えても、測れる量は変わらない。

#strong[取り替えると、@def:veff の形が変わります。] 谷の深さも位置も変わる。

さらに、ゲージ理論では@def:veff がゲージの選び方にも依ります。
前回のゲージ固定でどれを選んだかで、山の形が変わる。

#strong[それでも、測れる量は変わりません。] 谷の底での値、つまり真空の
エネルギー密度は、選び方に依らない。破れているかどうかも変わりません。

#strong[山の形そのものは、測れる量ではありません。]

だから「量子補正で谷が割れる」という言い方には、注意が要ります。
#strong[割れているかどうかは物理ですが、どんな形の山が割れているかは
書き方の問題です。]

@thm:cw を、山の絵として受け取ると行き過ぎます。#strong[受け取ってよいのは、
古典的に対称な理論が量子では破れうる、という結論のほうです。]
