#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "完全性定理",
  date: "2026-08-17",
  field: "math",
  series: "logic",
  order: 5,
  tags: ("数理論理学",),
  summary: "矛盾が出ないなら、その公理を満たす世界が本当にある。Henkin の構成で、記号列からモデルを作る。",
  provides: ("completeness-theorem",),
)

#let Fv = math.op("FV")

= 矛盾が無いというだけで、世界が湧いて出る

公理をいくつか書き並べる。中身は何でもよい。分かっているのは一つだけ——
#strong[そこから矛盾は出ない]、ということだけだとする。

これは記号列についての事実である。記号をどう並べ替えても、
$phi.alt$ と $not phi.alt$ が両方出てくることはない。それだけの、組合せの話である。

ところがこの事実だけから、#strong[その公理を全部満たす数学的な構造が一つ作れる。]
集合があり、その上に関数と関係が乗っていて、書いた公理をすべて満たしている。

材料は無い。手元にあるのは記号列だけである。
それでも構造が出てくる。無から有が出るように見える。

ここは初めて読むと、証明を追えても納得できないところである。
各段階は追えるのに、全体として何が起きたのか分からない。私もそうだった。

種を先に明かしておく。#strong[記号列そのものを材料にする。]
足りないものを外から持ってくるのではなく、手元にある記号列を、
そのまま構造の元として使ってしまう。これが Henkin の発想で、
今回の中身はほぼこれ一つである。

作り方が分かると、副作用のほうが面白くなる。記号列を材料にしたので、
できあがった構造の大きさは#strong[言語の大きさで決まってしまう]。
実数について語る理論からでも、可算な構造が出てくる。
第 7 回でその奇妙さを扱う。

なおこれは、前回の宿題への答えでもある。$Gamma ⊨ phi.alt$ ならば
$Gamma tack.r phi.alt$ か——対偶を取ると、上の主張になる。

= 極大無矛盾集合

まず理論を、これ以上足せないところまで膨らませる。

#definition[
  文の集合 $T$ が#strong[極大無矛盾]であるとは、$T$ が無矛盾で、
  任意の文 $sigma$ について $sigma in T$ または $not sigma in T$ が成り立つことをいう。
]<def:maximal>

#lemma("Lindenbaum")[
  無矛盾な文の集合 $Gamma$ は、極大無矛盾な集合 $T supset.eq Gamma$ に拡大できる。
]<lem:lindenbaum>

#proof[
  $Gamma$ を含む無矛盾な文の集合の全体を、包含関係で順序づける。
  鎖 $cal(C)$ の和集合 $Gamma^*$ は無矛盾である。実際 $Gamma^*$ から矛盾が導けるとすると、
  証明の有限性（#link("/math/logic/4")[第 4 回]）より有限個の文しか使わないので、
  それらはすべて鎖のある一つの元に含まれ、そこが矛盾することになってしまう。

  Zorn の補題より極大元 $T$ が存在する。$T$ が極大無矛盾であることを見る。
  ある文 $sigma$ について $sigma in.not T$ かつ $not sigma in.not T$ とすると、
  極大性より $T union \{sigma\}$ と $T union \{not sigma\}$ はどちらも矛盾する。
  前者から演繹定理により $T tack.r not sigma$、後者から $T tack.r sigma$ が出るので、
  $T$ 自身が矛盾する。これは仮定に反する。
]

#remark[
  ここで Zorn の補題、つまり選択公理を使った。
  言語が可算な場合は、文を $sigma_0, sigma_1, dots$ と並べて
  順に足せるほうを足していけばよいので、選択公理は要らない。

  一般の言語について完全性定理を示すには選択公理が必要で、
  実は「完全性定理」と「Boolean 素イデアル定理」は同等の強さを持つことが知られている。
  選択公理より弱いが、$upright("ZF")$ からは出ない。
  論理の基本定理が集合論の公理に依存している、というのは
  #link("/math/logic/1")[第 1 回]で述べた層の話の一例である。
]

= Henkin 拡大

極大無矛盾にしただけでは足りない。$exists x med phi.alt(x)$ が $T$ に入っていても、
その「$x$」に相当するものが言語の中にあるとは限らない。
モデルの材料は記号列しかないので、証人となる項が必要である。

そこで、証人の名前を無理やり付け足す。

#definition[
  文の集合 $T$ が#strong[Henkin 性]を持つとは、
  $exists x med phi.alt(x)$ の形の各文について、ある定数記号 $c$ が言語にあって
  $ (exists x med phi.alt(x)) arrow.r phi.alt[c \/ x] quad in T $
  となることをいう。
]<def:henkin>

#lemma[
  無矛盾な文の集合 $Gamma$ は、言語に定数記号を加えた上で、
  Henkin 性を持つ無矛盾な集合に拡大できる。
]<lem:henkin-extension>

#proof[
  現在の言語の各論理式 $phi.alt(x)$ に対し、新しい定数記号 $c_(phi.alt)$ を一つずつ用意し、
  $ (exists x med phi.alt(x)) arrow.r phi.alt[c_(phi.alt) \/ x] $
  をすべて $Gamma$ に加えたものを $Gamma_1$ とする。

  $Gamma_1$ が無矛盾であることを見る。矛盾するとすれば、有限個の追加公理から矛盾が出る。
  そのうちの一つ $(exists x med phi.alt) arrow.r phi.alt[c \/ x]$ を取り、
  残りを $Delta$ とすると、$Delta union \{(exists x med phi.alt) arrow.r phi.alt[c \/ x]\}$ が矛盾する。
  演繹定理より $Delta tack.r not ((exists x med phi.alt) arrow.r phi.alt[c \/ x])$、
  すなわち $Delta tack.r exists x med phi.alt$ かつ $Delta tack.r not phi.alt[c \/ x]$ である。

  ここで $c$ は $Delta$ に現れない新しい定数なので、$c$ を新しい変数 $y$ に置き換えても
  導出はそのまま通る（定数記号は導出の中で何の性質も使われていない）。
  すると $Delta tack.r forall y med not phi.alt[y \/ x]$、
  つまり $Delta tack.r not exists x med phi.alt$ となって、$Delta$ が矛盾する。
  追加公理の個数についての帰納法により、$Gamma_1$ は無矛盾である。

  ただし $Gamma_1$ には新しい定数を含む論理式が増えているので、
  それらについての証人がまた必要になる。そこで同じ操作を可算回繰り返し、
  $Gamma subset.eq Gamma_1 subset.eq Gamma_2 subset.eq dots$ の和集合を取る。
  各段階が無矛盾なので、証明の有限性より和集合も無矛盾であり、Henkin 性を持つ。
]

「新しい定数だから、変数に取り替えても証明は壊れない」という一手が要点である。
証明は記号の意味を一切使っていないので、こういう置き換えが自由にできる。
形式化しておいた御利益がここで出る。

= 項モデル

材料が揃った。$T$ を極大無矛盾で Henkin 性を持つ集合とする。
$T$ の言語の閉項（変数を含まない項）を使ってモデルを組む。

#definition[
  閉項 $t, u$ について $t tilde u :<=> (t = u) in T$ と定める。
  A6 と A7 から、これは同値関係である（推移律や対称律を与える文が $T$ に属することを、
  極大性から確かめればよい）。

  領域を $A := \{ [t] : t upright(" は閉項")\}$（$tilde$ による同値類）とし、
  $ c^frak(A) := [c], quad f^frak(A)([t_1], dots, [t_n]) := [f t_1 dots t_n], quad
    ⟨[t_1], dots, [t_n]⟩ in P^frak(A) :<=> P t_1 dots t_n in T $
  と定める。これを $T$ の#strong[項モデル]と呼ぶ。
]<def:term-model>

定義が well-defined であることは A7 から従う。
$t tilde t'$ なら、$P t dots$ と $P t' dots$ の真偽が $T$ の中で一致するからだ。

領域が空でないことにも注意しておく。Henkin 拡大で定数記号を足したので、閉項は必ず存在する。

#theorem("真理補題")[
  $T$ を極大無矛盾かつ Henkin 性を持つ集合、$frak(A)$ をその項モデルとすると、
  任意の文 $sigma$ について
  $ frak(A) ⊨ sigma quad <==> quad sigma in T $
]<thm:truth-lemma>

#proof[
  文の構成についての帰納法による。

  原子文のときは、項モデルの定義そのものである。
  等号については $t tilde u$ の定義から従う。

  $sigma = not tau$ のとき。帰納法の仮定より
  $frak(A) ⊨ tau <=> tau in T$ である。$T$ は極大無矛盾なので
  $tau in.not T <=> not tau in T$ であり、両辺の否定を取れば結論が出る。

  $sigma = (tau_1 and tau_2)$ のとき。極大無矛盾性から
  $(tau_1 and tau_2) in T <=> (tau_1 in T upright(" かつ ") tau_2 in T)$ が成り立つので、
  帰納法の仮定から従う。

  $sigma = forall x med phi.alt$ のとき。ここが本題である。

  $arrow.l.double$：$forall x med phi.alt in T$ とする。A4 より各閉項 $t$ について
  $T tack.r phi.alt[t \/ x]$ であり、極大無矛盾性から $phi.alt[t \/ x] in T$。
  帰納法の仮定より $frak(A) ⊨ phi.alt[t \/ x]$ である。
  領域の要素はすべて $[t]$ の形なので、代入補題より
  すべての $a in A$ について $frak(A) ⊨ phi.alt [s(x \| a)]$、
  すなわち $frak(A) ⊨ forall x med phi.alt$。

  $arrow.r.double$：$forall x med phi.alt in.not T$ とする。極大性より
  $not forall x med phi.alt in T$、つまり $exists x med not phi.alt in T$ である。
  Henkin 性より、ある定数 $c$ について
  $(exists x med not phi.alt) arrow.r not phi.alt[c \/ x] in T$ であり、
  modus ponens と極大性から $not phi.alt[c \/ x] in T$ を得る。
  帰納法の仮定より $frak(A) ⊨ not phi.alt[c \/ x]$ となり、
  $[c] in A$ が反例を与えるので $frak(A) ⊨ forall x med phi.alt$ は成り立たない。
]

Henkin 性が効いたのは最後の一箇所だけである。
だがそこが決定的で、$forall$ を破る証人を#strong[言語の中に]持っていないと、
モデルの側で反例を指し示せない。

= 完全性定理

#theorem("Gödel の完全性定理")[
  無矛盾な文の集合はモデルを持つ。したがって
  $ Gamma tack.r phi.alt quad <==> quad Gamma ⊨ phi.alt $
]<thm:completeness>

#proof[
  $Gamma$ を無矛盾とする。@lem:henkin-extension で Henkin 性を持つ無矛盾な拡大を取り、
  @lem:lindenbaum で極大無矛盾な $T$ に拡大する（Henkin 性は文を足しても保たれる）。
  @thm:truth-lemma より $T$ の項モデル $frak(A)$ は $T$ のすべての文を満たし、
  とくに $Gamma$ のモデルである。ただし言語を拡張したので、
  元の言語の記号だけを残して制限すれば、$Gamma$ のモデルが得られる。

  後半を示す。$arrow.r.double$ は健全性定理（#link("/math/logic/4")[第 4 回]）である。
  $arrow.l.double$ を対偶で示す。$Gamma tack.r.not phi.alt$ とすると、
  $Gamma union \{not phi.alt\}$ は無矛盾である
  （矛盾するなら演繹定理から $Gamma tack.r phi.alt$ が出てしまう）。
  よって前半よりモデル $frak(A)$ を持ち、$frak(A) ⊨ Gamma$ かつ
  $frak(A) ⊨ not phi.alt$ である。したがって $Gamma ⊨ phi.alt$ ではない。
]

証明を振り返ってみてほしい。構造の領域は#strong[閉項の同値類]だった。
つまり作られた世界の住人は、記号列そのものである。
数学的対象を無から作ったのではなく、名前を実体として採用しただけなのだ。

そう聞くと安っぽい構成のようだが、これで十分なのである。
一階述語論理が要求するのは「公理を満たす何か」であって、
その何かが記号列であっても文句は言えない。

#check[
  この構成は、作った構造の#strong[大きさ]まで決めてしまっている。
  言語が可算なら、出てくる構造はどれくらいの大きさになるか。そしてなぜか。
][
  可算になる。領域が#strong[閉項の同値類]だからである。

  閉項は言語の記号を有限個並べたものなので、可算個しかない。
  同値類に潰しても増えない。Henkin 拡大で定数記号を足したが、
  足すのも可算個なので可算のままである。

  つまり#strong[この作り方は、言語の大きさより大きい構造を作れない]。
  実数について語る理論から出発しても、可算な構造が出てくる。
  次回はこの奇妙さを正面から扱う。
]

#remark[
  この構成には副産物がある。言語が可算なら、閉項も可算個しかないので、
  出来上がるモデルは#strong[高々可算]である。

  無矛盾な理論には可算なモデルがある、というこの事実が
  Löwenheim--Skolem の定理で、第 7 回で正面から扱う。
  そして、これを集合論に適用したときに現れる違和感が Skolem の逆理である。
  $upright("ZFC")$ が無矛盾なら可算なモデルを持つ。
  非可算集合の存在を主張する理論が、可算な世界で成り立ってしまうのだ。
]

完全性定理は、証明という営みについての強い保証である。
正しいことは必ず証明できる。ならば、あとは頑張って探すだけではないか。

そう思いたいところだが、そうはならない。
「正しい」がどのモデルでの正しさなのかを取り違えると、話が変わってくる。
その落とし穴が、第 10 回の不完全性定理につながっている。
次回はまず、完全性定理の一番使い勝手のよい系を取り出す。
