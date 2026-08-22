#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "証明体系と健全性定理",
  date: "2026-08-17",
  field: "math",
  series: "logic",
  order: 4,
  tags: ("数理論理学",),
  summary: "証明を記号列の有限列として定義する。Hilbert 系、演繹定理、そして証明できることは正しい。",
  provides: (
    "proof-system",
    "soundness",
  ),
)

#let Fv = math.op("FV")

= 「$phi.alt$ ならば $phi.alt$」の証明が、数行かかる

これから作る体系で、いちばん自明な主張を証明してみる。
$phi.alt arrow.r phi.alt$、つまり「$phi.alt$ ならば $phi.alt$」である。

書けない。公理をそのまま当てはめても出てこない。
A1 と A2 という二つの公理を、$psi$ の取り方を工夫して三度組み合わせ、
三段論法を二回使って、ようやく出る。

ここで多くの人が、自分の理解を疑う。こんな簡単なことが書けないのは、
どこかを読み落としたからではないか、と。#strong[読み落としてはいない。]
この体系は本当に、そういう使いにくさを持っている。
もっと素直な体系はいくらでもあって、自然演繹なら一行で済む。

わざと選んでいる。証明を#strong[書く]ためではなく、証明#strong[について]
証明するために作っているからである。推論規則が一つしかない体系では、
「導出の長さについての帰納法」が#strong[公理の場合と三段論法の場合の二つ]で終わる。
書く側の不便を、論じる側の楽さと引き換えにしている。

この取引が、今回と次回のすべてを通す。健全性定理はこの帰納法で数行に収まり、
同じ形の議論が完全性定理まで届く。そして第 9 回では、この
「機械的に並べた有限の列」という定義そのものが、算術の中に写し取られる。
証明が数になり、数についての定理が証明についての定理になる。

方針は徹底的に機械的にする。公理として認める論理式を決め、
そこから新しい論理式を作る規則を決める。証明とは、
その規則を有限回使って並べた列にすぎない。意味は一切使わない。

#definition[
  以下の形の文（およびその全称閉包）を#strong[論理公理]と呼ぶ。
  $ upright("A1") quad & phi.alt arrow.r (psi arrow.r phi.alt) \
    upright("A2") quad & (phi.alt arrow.r (psi arrow.r chi)) arrow.r
      ((phi.alt arrow.r psi) arrow.r (phi.alt arrow.r chi)) \
    upright("A3") quad & (not psi arrow.r not phi.alt) arrow.r (phi.alt arrow.r psi) \
    upright("A4") quad & forall x med phi.alt arrow.r phi.alt [t \/ x]
      quad (t upright(" は自由に代入可能")) \
    upright("A5") quad & forall x med (phi.alt arrow.r psi) arrow.r
      (phi.alt arrow.r forall x med psi) quad (x in.not Fv(phi.alt)) \
    upright("A6") quad & x = x \
    upright("A7") quad & x = y arrow.r (phi.alt arrow.r phi.alt') $
  A7 の $phi.alt'$ は、$phi.alt$ 中の $x$ の自由な出現のいくつかを $y$ に置き換えたものである。

  推論規則は三段論法（modus ponens）だけとする。
  $phi.alt$ と $phi.alt arrow.r psi$ から $psi$ を得てよい。
]<def:hilbert>

#definition[
  文の集合 $Gamma$ からの $phi.alt$ の#strong[導出]とは、論理式の有限列
  $phi.alt_1, dots, phi.alt_n$ であって $phi.alt_n = phi.alt$、
  かつ各 $phi.alt_i$ が論理公理か $Gamma$ の元か、
  それより前の二つに modus ponens を適用したものであることをいう。
  導出が存在するとき $Gamma tack.r phi.alt$ と書く。
]<def:derivation>

#example[導出とは、こういう列である][
  @def:derivation の言う「有限列」を、$phi.alt arrow.r phi.alt$ で実際に書き下す。

  #table(
    columns: (auto, 1fr, auto),
    [$1$], [$(phi.alt arrow.r ((phi.alt arrow.r phi.alt) arrow.r phi.alt)) arrow.r
            ((phi.alt arrow.r (phi.alt arrow.r phi.alt)) arrow.r (phi.alt arrow.r phi.alt))$],
           [A2],
    [$2$], [$phi.alt arrow.r ((phi.alt arrow.r phi.alt) arrow.r phi.alt)$], [A1],
    [$3$], [$(phi.alt arrow.r (phi.alt arrow.r phi.alt)) arrow.r (phi.alt arrow.r phi.alt)$],
           [$1, 2$ に MP],
    [$4$], [$phi.alt arrow.r (phi.alt arrow.r phi.alt)$], [A1],
    [$5$], [$phi.alt arrow.r phi.alt$], [$3, 4$ に MP],
  )

  各行に付いている右端が、@def:derivation の三つの場合のどれかを指している。
  #strong[論理公理か、$Gamma$ の元か、前の二つに MP か。]それ以外は無い。

  だから導出の正しさは#strong[見れば機械的に確かめられる]。
  意味を一切参照しないのはこのためで、
  この性質がそのまま #link("/math/logic/9")[第 9 回]で算術に写る。
]

A1--A3 が命題論理の部分、A4--A5 が量化子、A6--A7 が等号を担当している。
公理を全称閉包込みで取っておくと、一般化の規則を別に立てなくて済むので、
以後の議論が楽になる。

#remark[
  A1--A3 だけで $phi.alt arrow.r phi.alt$ を導く手順を書いておく。
  A2 で $psi := phi.alt arrow.r phi.alt$、$chi := phi.alt$ と取ると
  $ (phi.alt arrow.r ((phi.alt arrow.r phi.alt) arrow.r phi.alt)) arrow.r
    ((phi.alt arrow.r (phi.alt arrow.r phi.alt)) arrow.r (phi.alt arrow.r phi.alt)) $
  になる。前件は A1 そのものなので三段論法で外れ、残った前件も A1 なので
  もう一度外すと $phi.alt arrow.r phi.alt$ が出る。

  自明な命題に公理を三つ使う。書く道具としては明らかに悪い。
]

= 有限性という性質

定義から直ちに分かることを一つ。地味だが、後で効く。

#proposition[
  $Gamma tack.r phi.alt$ ならば、$Gamma$ の有限部分集合 $Gamma_0$ で
  $Gamma_0 tack.r phi.alt$ となるものが存在する。
]<prop:finiteness>

#proof[
  導出は有限列なので、そこに現れる $Gamma$ の元は有限個しかない。
  それらを集めて $Gamma_0$ とすればよい。
]

「証明は有限である」と言っているだけである。だがこれが、
第 6 回のコンパクト性定理を生む源になる。
無限個の仮定を持つ理論でも、個々の結論は必ず有限個の仮定に依存している、
という事実は思ったより強い。

= 演繹定理

Hilbert 系で証明を書くのが苦しい理由の半分は、
「$phi.alt$ を仮定して $psi$ を導く」という日常的な推論が、
そのままでは規則として存在しないからである。それを回復するのが次の定理である。

#theorem("演繹定理")[
  $Gamma union \{phi.alt\} tack.r psi$ ならば $Gamma tack.r phi.alt arrow.r psi$。
  逆も成り立つ。
]<thm:deduction>

#proof[
  逆向きは簡単である。$Gamma tack.r phi.alt arrow.r psi$ なら、
  $Gamma union \{phi.alt\}$ からは $phi.alt$ も使えるので modus ponens で $psi$ が出る。

  本題のほうを、導出 $psi_1, dots, psi_n$ の長さについての帰納法で示す。
  各段階で $Gamma tack.r phi.alt arrow.r psi_i$ を示せばよい。

  $psi_i$ が論理公理か $Gamma$ の元のとき。$Gamma tack.r psi_i$ であり、
  A1 の形 $psi_i arrow.r (phi.alt arrow.r psi_i)$ と modus ponens から
  $Gamma tack.r phi.alt arrow.r psi_i$ が出る。

  $psi_i = phi.alt$ のとき。$Gamma tack.r phi.alt arrow.r phi.alt$ を示せばよい。
  A1 の $phi.alt arrow.r ((phi.alt arrow.r phi.alt) arrow.r phi.alt)$ と、A2 の
  $ (phi.alt arrow.r ((phi.alt arrow.r phi.alt) arrow.r phi.alt)) \
    quad arrow.r ((phi.alt arrow.r (phi.alt arrow.r phi.alt)) arrow.r (phi.alt arrow.r phi.alt)) $
  それに A1 の $phi.alt arrow.r (phi.alt arrow.r phi.alt)$ を組み合わせればよい。

  $psi_i$ が $psi_j$ と $psi_j arrow.r psi_i$ から modus ponens で得られたとき。
  帰納法の仮定より
  $Gamma tack.r phi.alt arrow.r psi_j$ と
  $Gamma tack.r phi.alt arrow.r (psi_j arrow.r psi_i)$ が成り立つ。
  A2 を使えば、この二つから $Gamma tack.r phi.alt arrow.r psi_i$ が得られる。
]

証明を見て分かるとおり、A1 と A2 は演繹定理を成り立たせるために選ばれている。
公理の見た目が奇妙なのは、人間の直観に合わせたのではなく、
こういうメタ定理が通るように設計されているからである。

#check[
  @thm:deduction が成り立つなら、これを推論規則として @def:hilbert に
  足してしまえばよさそうに見える。書くのが楽になり、
  しかも新しく証明できることは増えない（定理なのだから）。
  #strong[なぜ足さないのか。]
][
  #strong[足すと、この先の証明が全部長くなるからである。]

  @def:derivation の場合分けは三つしかない。論理公理か、$Gamma$ の元か、
  前の二つに MP か。この三つで尽きているから、
  @thm:soundness の証明が「公理が恒真」と「MP が真理を保つ」の
  二点だけで終わっている。

  規則を一つ足すと、場合分けが四つになる。健全性でも、完全性でも、
  第 9 回の算術への写し取りでも、#strong[毎回その一つぶんを確かめ直す]ことになる。
  一度の便利さと引き換えに、以後ずっと払い続ける。

  そして払う必要がない。@thm:deduction はメタ言語の定理なので、
  #strong[体系の外側で自由に使える]。「$phi.alt$ を仮定して $psi$ が出たから
  $phi.alt arrow.r psi$」と書いてよく、そう書いた文章は、
  必要なら元の三つの場合だけの導出に展開できる。

  #strong[書く側の道具はメタ言語に置き、対象言語は痩せさせておく。]
  第 1 回で層を分けたのは、こういうときに効かせるためである。
]

= 健全性定理

いよいよ構文と意味論を突き合わせる。まず易しい向きから。

#theorem("健全性定理")[
  $Gamma tack.r phi.alt$ ならば $Gamma ⊨ phi.alt$。
]<thm:soundness>

#proof[
  導出の長さについての帰納法による。示すべきことは二つだけである。
  論理公理が恒真であること、そして modus ponens が真理を保つことである。

  modus ponens は易しい。$frak(A) ⊨ phi.alt$ かつ $frak(A) ⊨ phi.alt arrow.r psi$ とすると、
  $arrow.r$ の意味論（$not (phi.alt and not psi)$ の略記だったことを思い出す）より
  $frak(A) ⊨ psi$ である。

  公理を順に見る。A1--A3 は命題論理のトートロジーで、
  $not$ と $and$ の意味論から真偽表を確かめれば分かる。

  A4 が本題である。$frak(A) ⊨ (forall x med phi.alt)[s]$ とすると、
  すべての $a in A$ について $frak(A) ⊨ phi.alt [s(x \| a)]$ が成り立つ。
  とくに $a := t^frak(A)[s]$ と取れば
  $frak(A) ⊨ phi.alt [s(x \| t^frak(A)[s])]$ であり、
  #link("/math/logic/3")[第 3 回]の代入補題より
  $frak(A) ⊨ phi.alt [t \/ x][s]$ を得る。

  ここで代入補題の仮定、つまり $t$ が自由に代入可能であることが使われている。
  A4 にこの条件が付いていた理由がこれである。条件を外すと
  $forall x med exists y med not (y = x) arrow.r exists y med not (y = y)$
  のような偽の文が公理になってしまう。

  A5 は、$x in.not Fv(phi.alt)$ より $phi.alt$ の真偽が $x$ の値に依存しないこと
  （一致補題）から従う。A6 は自明。
  A7 は、等号が意味論では本物の等号に解釈されることから、
  論理式の構成についての帰納法で従う。
]

健全性定理は、あまりに当たり前に見えるかも知れない。
だが、これがなければ形式的証明には何の価値もない。
記号を機械的に並べただけの操作が、意味の世界での正しさを保証している、
というのがこの定理の内容である。

#corollary[
  $Gamma$ がモデルを持つならば、$Gamma$ は無矛盾である
  （$Gamma tack.r phi.alt$ かつ $Gamma tack.r not phi.alt$ となる $phi.alt$ が存在しない）。
]<cor:model-consistent>

#proof[
  $frak(A) ⊨ Gamma$ とする。$Gamma tack.r phi.alt$ と $Gamma tack.r not phi.alt$ が
  両方成り立つとすると、@thm:soundness より $frak(A) ⊨ phi.alt$ かつ
  $frak(A) ⊨ not phi.alt$ となり、$not$ の意味論に反する。
]

無矛盾性を示したければモデルを一つ作ればよい、というのがこの系である。
実際、集合論で正則性公理や無限公理の独立性を示すときに使ったのは、この方向だった。
$V_omega$ というモデルを作って「無限公理は証明できない」を示したのが
#link("/math/set-theory/6")[集合論の第 6 回]である。

= 逆は成り立つのか

残るのは逆向きである。$Gamma ⊨ phi.alt$ ならば $Gamma tack.r phi.alt$ か。

これは自明ではない。左辺は「すべての構造について」という、
とてつもなく大きな範囲の主張である。いっぽう右辺は
「有限の記号列が存在する」という、ずいぶん小さな主張だ。
大きな主張から小さな主張が出てくるという保証はどこにもない。

しかも @cor:model-consistent の対偶を考えると、逆向きは
#strong[無矛盾な理論には必ずモデルがある]という主張と同じことになる。
記号列の操作について「矛盾が出ない」ことだけから、
数学的な構造を作り出せというのだ。

それができるのが Gödel の完全性定理で、次回の主題である。
公理を組み合わせて矛盾が出ないなら、その公理を満たす世界が本当にある。
証明を書くのが苦行だという不満はさておき、
この体系はこれで論理としては完全なのである。
