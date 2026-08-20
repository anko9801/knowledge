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

= 証明とは有限の列である

意味論はできた。次は証明の側である。

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
      quad (t upright(" は自由に代入可能)") \
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

A1--A3 が命題論理の部分、A4--A5 が量化子、A6--A7 が等号を担当している。
公理を全称閉包込みで取っておくと、一般化の規則を別に立てなくて済むので、
以後の議論が楽になる。

#remark[
  この体系で実際に証明を書くのは、控えめに言って苦行である。
  $phi.alt arrow.r phi.alt$ を導くだけで A1 と A2 を組み合わせた数行が必要になる。

  それでも Hilbert 系を採るのは、体系#strong[について]証明するときに楽だからだ。
  規則が一つしかないので、「導出の長さについての帰納法」が
  「公理の場合と modus ponens の場合」の二つで済む。
  この楽さを、これから何度も使う。
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
  A1 の $phi.alt arrow.r ((phi.alt arrow.r phi.alt) arrow.r phi.alt)$ と
  A2 の $(phi.alt arrow.r ((phi.alt arrow.r phi.alt) arrow.r phi.alt)) arrow.r
  ((phi.alt arrow.r (phi.alt arrow.r phi.alt)) arrow.r (phi.alt arrow.r phi.alt))$、
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
