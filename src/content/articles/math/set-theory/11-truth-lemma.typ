#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "補遺: 真理補題の証明",
  date: "2026-08-17",
  field: "math",
  series: "set-theory",
  order: 11,
  tags: ("集合論",),
  summary: "強制関係を M の中で定義し、それが外から見た意味と一致することを証明する。第 9 回で省いた唯一の穴を埋める。",
  provides: ("truth-lemma",),
)

#let val = math.op("val")
#let dom = math.op("dom")
#let rank = math.op("rank")

= 借りを返す

#link("/math/set-theory/9")[第 9 回]で、強制関係 $p ⊩ phi.alt$ を
「$p$ を含む任意の生成的フィルター $G$ について $M[G] ⊨ phi.alt$」と定義した。
そして二つの補題を骨格だけ述べて先へ進んだ。

+ #strong[定義可能性補題]：この関係は $M$ の中で定義できる。
+ #strong[真理補題]：$M[G] ⊨ phi.alt$ となるのは、$G$ の中に $phi.alt$ を強制する条件があるときに限る。

この二つは強制法の心臓部であって、ここを認めてしまうと
「強制法とは何をしているのか」が結局分からないままになる。今回はその借りを返す。

やることは単純である。$M$ の外を見ずに済む形で強制関係を#strong[定義し直し]、
それが元の意味と一致することを証明する。定義し直したほうを $⊩^*$ と書いて区別しよう。
最後に $⊩ thin = thin ⊩^*$ を示せば、二つの補題が同時に片づく。

以下、$M$ は $upright("ZFC")$ の可算推移モデル、$bb(P) in M$ は強制概念、
$G$ は $M$ 上生成的なフィルターとする。

= 下向きの稠密性

先に、何度も使う道具を用意する。

#definition[
  $D subset.eq bb(P)$ が $p$ の下で#strong[稠密]であるとは、
  任意の $q <= p$ に対し $r <= q$ なる $r in D$ が存在することをいう。
]<def:dense-below>

#lemma[
  $D in M$ が $p$ の下で稠密で、$p in G$ ならば $G inter D != nothing$。
  さらに $G inter D$ の要素は $p$ 以下に取れる。
]<lem:dense-below-meets>

#proof[
  $ D' := \{ r in bb(P) : r in D and r <= p \} union \{ r in bb(P) : r upright("は") p upright("と両立しない") \} $
  とおく。$D' in M$ である。$D'$ が $bb(P)$ 全体で稠密であることを見る。
  $q in bb(P)$ を任意に取り、$q$ が $p$ と両立しなければ $q in D'$ である。
  両立するなら共通の下界 $q' <= p, q$ が取れ、$D$ が $p$ の下で稠密だから
  $r <= q'$ なる $r in D$ があり、$r <= p$ より $r in D'$ である。

  $G$ は生成的なので $G inter D' != nothing$。ところが $p in G$ なので、
  $G$ の要素は $p$ と両立する。よって $G$ が拾えるのは $D'$ の前半、
  つまり $D$ の要素で $p$ 以下のものである。
]

生成的フィルターは「$M$ に属する稠密集合をすべて満たす」対象だった。
この補題は、その要求を「$p$ の下で」という局所的な形に緩めても、
$p$ 自身が $G$ にいる限り同じことだ、と言っている。以後、断りなく使う。

= 強制関係を M の中で定義する

いよいよ本題である。$G$ を見ずに $⊩^*$ を定義したい。

方針は「$G$ がどう転んでも成り立つように、稠密性の言葉で書く」ことである。
$G$ が生成的である以上、$p$ の下で稠密な集合は必ず $G$ に引っかかる。
そこで「必ず引っかかる」を「強制する」の定義に採用してしまう。

まず原子論理式から。ここが一番込み入っている。

#definition("原子論理式の強制")[
  名前についての再帰で、次のように定める。

  $p ⊩^* tau_1 = tau_2$ とは、次の二つがともに成り立つことをいう。

  + 任意の $⟨pi_1, s_1⟩ in tau_1$ に対し
    $ \{ q <= p : q <= s_1 => exists ⟨pi_2, s_2⟩ in tau_2 med
        (q <= s_2 and q ⊩^* pi_1 = pi_2) \} $
    が $p$ の下で稠密である。
  + $tau_1$ と $tau_2$ を入れ替えた同じ条件。

  $p ⊩^* tau_1 in tau_2$ とは、
  $ \{ q <= p : exists ⟨pi, s⟩ in tau_2 med (q <= s and q ⊩^* tau_1 = pi) \} $
  が $p$ の下で稠密であることをいう。
]<def:forces-atomic>

読み下しておこう。$tau_1 = tau_2$ の条件 1 は、
「$tau_1$ の部品 $pi_1$ が採用されるなら（$q <= s_1$）、
それに等しい $tau_2$ の部品も採用される」ということを、
$p$ 以下のどこへ行っても言い続けられる、という主張である。

この再帰が正当であることを確かめておく。
$p ⊩^* tau_1 = tau_2$ の定義に現れるのは $pi_1 in dom tau_1$、$pi_2 in dom tau_2$ に対する
$⊩^*$ であり、名前の階数が真に下がっている。
$p ⊩^* tau_1 in tau_2$ の定義に現れるのは $pi in dom tau_2$ との等号なので、やはり下がる。
よって、名前の対に階数から定まる整礎な順序を入れれば、これは正当な再帰である。
そして再帰は $M$ の中で実行できる。

次に、残りの論理式へ拡張する。

#definition("論理式の構成についての強制")[
  $ p ⊩^* (phi.alt and psi) quad & <==> quad p ⊩^* phi.alt upright(" かつ ") p ⊩^* psi \
    p ⊩^* not phi.alt quad & <==> quad forall q <= p med (not (q ⊩^* phi.alt)) \
    p ⊩^* exists x med phi.alt(x) quad & <==> quad
      \{ q <= p : exists sigma in M^(bb(P)) med (q ⊩^* phi.alt(sigma)) \}
      upright(" が ") p upright(" の下で稠密") $
  ここで $M^(bb(P))$ は $M$ に属する $bb(P)$-名前の全体である。
  $or$、$=>$、$forall$ はこれらから定義する。
]<def:forces-logical>

#example[否定の非対称を、有限条件で見る][
  条件を「$0$ と $1$ の有限列」とし、長い方を小さいとする（Cohen 強制）。
  $G$ が決める無限列を $c$ と書く。

  $p = ⟨0, 1⟩$ を取る。$phi.alt$ を「$c$ の第 $3$ 項は $0$」とすると、

  #table(
    columns: (auto, 1fr),
    [$p ⊩^* phi.alt$ か], [#strong[否]。$p$ を $⟨0,1,1⟩$ に伸ばせば偽になる],
    [$p ⊩^* not phi.alt$ か], [#strong[否]。$⟨0,1,0⟩$ に伸ばせば真になる],
  )

  #strong[どちらも強制していない。]これが素朴な真偽と違うところで、
  $p$ が決めていないことについては、$phi.alt$ も $not phi.alt$ も強制されない。

  伸ばして決まるので、決まる先は $p$ 以下に必ずある。
  だから「どの $q <= p$ も $phi.alt$ を強制しない」を否定の定義に採ると、
  #strong[伸ばしても $phi.alt$ にならない]ことを言い当てられる。
]

否定の定義に注目してほしい。$p ⊩^* not phi.alt$ は
「$p$ 以下のどの条件も $phi.alt$ を強制しない」である。
「$p$ が $phi.alt$ を強制しない」ではない。この差は決定的で、
条件は $phi.alt$ についても $not phi.alt$ についても
態度を保留できる、というのが強制法の世界観である。

#remark("定義可能性補題")[
  以上の定義は、どこにも $G$ が現れていない。名前と条件と稠密性しか使っていないので、
  $M$ の中でそのまま書き下せる。これが定義可能性補題である。

  ただし、一つ断りが要る。これは論理式 $phi.alt$ ごとに一つずつ定義が与えられる、
  という形の主張（図式）である。「すべての論理式について $p ⊩^* phi.alt$」を
  一本の論理式として書くことはできない。書けてしまうと $M$ の中に真理述語ができ、
  Tarski の定理に反する。

  実務上これで困ることはない。独立性の証明で扱う論理式は、いつでも具体的な一本だからだ。
]

= 単調性と局所性

$⊩^*$ の基本的な性質を二つ押さえる。どちらも当たり前に見えるが、
証明は $⊩^*$ の定義を舐めることになる。

#lemma("単調性")[
  $p ⊩^* phi.alt$ かつ $q <= p$ ならば $q ⊩^* phi.alt$。
]<lem:monotone>

#proof[
  論理式の構成についての帰納法による。

  原子論理式のとき。定義に現れる集合が $p$ の下で稠密ならば、$q <= p$ の下でも稠密である。
  $q$ 以下の条件は $p$ 以下の条件でもあるからだ。

  $and$ は明らか。$not$ のとき、$q$ 以下の条件は $p$ 以下の条件なので、
  $p$ 以下のどれも $phi.alt$ を強制しないなら $q$ 以下のどれも強制しない。
  $exists$ は原子論理式と同じ理由による。
]

#lemma("局所性")[
  $\{ q <= p : q ⊩^* phi.alt \}$ が $p$ の下で稠密ならば、$p ⊩^* phi.alt$。
]<lem:local>

#proof[
  こちらも構成についての帰納法による。

  原子論理式のとき。$phi.alt$ が $tau_1 in tau_2$ の場合を書く。
  $D_q := \{ r <= q : exists ⟨pi, s⟩ in tau_2 med (r <= s and r ⊩^* tau_1 = pi) \}$ とおくと、
  仮定より、任意の $q' <= p$ に対しある $q <= q'$ が $q ⊩^* tau_1 in tau_2$ を満たし、
  そのとき $D_q$ は $q$ の下で稠密である。よって $q'$ 以下に $D_q$ の元があり、
  それは $D_p$ の元でもある。したがって $D_p$ は $p$ の下で稠密で、$p ⊩^* tau_1 in tau_2$。
  等号の場合も、二つの条件それぞれに同じ議論を当てればよい。

  $not$ のとき。$p ⊩^* not phi.alt$ が成り立たないとすると、
  ある $q <= p$ が $q ⊩^* phi.alt$ を満たす。仮定より $r <= q$ で $r ⊩^* not phi.alt$ なるものがあるが、
  @lem:monotone より $r ⊩^* phi.alt$ でもあり、$not$ の定義に反する。

  $and$ と $exists$ も同様である。
]

局所性は「$p$ 以下いたるところで成り立つなら $p$ で成り立つ」という主張で、
強制関係が本質的に稠密性で書かれていることの反映である。

= 真理補題：原子論理式の場合

ここからが山場である。

#theorem[
  名前 $tau_1, tau_2 in M$ と生成的フィルター $G$ について、次が成り立つ。
  $ val(tau_1, G) = val(tau_2, G) quad & <==> quad exists p in G med (p ⊩^* tau_1 = tau_2) \
    val(tau_1, G) in val(tau_2, G) quad & <==> quad exists p in G med (p ⊩^* tau_1 in tau_2) $
]<thm:truth-atomic>

#proof[
  名前の対 $⟨tau_1, tau_2⟩$ について、階数から定まる整礎順序による帰納法で示す。
  四つの向きを順に片づける。

  #strong[(=, $arrow.l.double$)] $p in G$ が $p ⊩^* tau_1 = tau_2$ を満たすとする。
  $val(tau_1, G) subset.eq val(tau_2, G)$ を示せば、対称性より十分である。

  $a in val(tau_1, G)$ とすると、$⟨pi_1, s_1⟩ in tau_1$ と $s_1 in G$ があって
  $a = val(pi_1, G)$ である。$p, s_1 in G$ なので、共通の下界 $r in G$、$r <= p, s_1$ が取れる。

  定義 1 の集合を $D$ とすると、$D$ は $p$ の下で稠密だから $r$ の下でも稠密である。
  @lem:dense-below-meets より、$q in G inter D$ で $q <= r$ なるものが取れる。
  $q <= r <= s_1$ なので、$D$ の条件から $⟨pi_2, s_2⟩ in tau_2$ が存在して
  $q <= s_2$ かつ $q ⊩^* pi_1 = pi_2$ となる。

  $q in G$ かつ $q <= s_2$ より $s_2 in G$、よって $val(pi_2, G) in val(tau_2, G)$ である。
  また $⟨pi_1, pi_2⟩$ は階数が真に下がっているので、帰納法の仮定より
  $val(pi_1, G) = val(pi_2, G)$。以上より $a in val(tau_2, G)$ である。

  #strong[($in$, $arrow.l.double$)] $p in G$ が $p ⊩^* tau_1 in tau_2$ を満たすとする。
  定義の集合は $p$ の下で稠密なので、@lem:dense-below-meets により
  $q in G$ でその集合に属するものが取れる。すると $⟨pi, s⟩ in tau_2$ があって
  $q <= s$ かつ $q ⊩^* tau_1 = pi$ である。$s in G$ より $val(pi, G) in val(tau_2, G)$ であり、
  帰納法の仮定より $val(tau_1, G) = val(pi, G)$。よって $val(tau_1, G) in val(tau_2, G)$。

  #strong[($in$, $arrow.r.double$)] $val(tau_1, G) in val(tau_2, G)$ とする。
  すると $⟨pi, s⟩ in tau_2$ と $s in G$ があって $val(pi, G) = val(tau_1, G)$ である。
  帰納法の仮定より $r ⊩^* tau_1 = pi$ なる $r in G$ が取れる。
  $r, s in G$ の共通の下界 $q in G$ を取ると、@lem:monotone より
  $q ⊩^* tau_1 = pi$ かつ $q <= s$ である。

  このとき、任意の $q' <= q$ もまた $q' <= s$ かつ $q' ⊩^* tau_1 = pi$ を満たすので、
  定義の集合は $q$ の下で稠密である。よって $q ⊩^* tau_1 in tau_2$ となる。

  #strong[(=, $arrow.r.double$)] これが一番厄介である。
  $val(tau_1, G) = val(tau_2, G)$ とし、次の集合を考える。
  $ E := & \{ q : q ⊩^* tau_1 = tau_2 \} \
    & union \{ q : exists ⟨pi, s⟩ in tau_1 med (q <= s and q ⊩^* not (pi in tau_2)) \} \
    & union \{ q : exists ⟨pi, s⟩ in tau_2 med (q <= s and q ⊩^* not (pi in tau_1)) \} $
  $E in M$ である。$E$ が $bb(P)$ で稠密であることを示す。

  $p in bb(P)$ を取る。$p ⊩^* tau_1 = tau_2$ ならば $p in E$ で終わりである。
  そうでないとき、定義の条件 1 か 2 が破れている。条件 1 が破れたとしよう。
  すなわちある $⟨pi_1, s_1⟩ in tau_1$ について、集合
  $ A := \{ q <= p : q <= s_1 => exists ⟨pi_2, s_2⟩ in tau_2 med
      (q <= s_2 and q ⊩^* pi_1 = pi_2) \} $
  が $p$ の下で稠密でない。よって $p' <= p$ があって、$p'$ 以下のどの条件も $A$ に属さない。

  $A$ の条件が破れるとは「$q <= s_1$ であって、しかも $tau_2$ 側に対応物がない」ことである。
  したがって $p'$ 以下のすべての $q$ について、$q <= s_1$ であり、かつ
  $⟨pi_2, s_2⟩ in tau_2$ で $q <= s_2$ かつ $q ⊩^* pi_1 = pi_2$ なるものは存在しない。
  とくに $p' <= s_1$ である。

  ここで $p' ⊩^* not (pi_1 in tau_2)$ を示す。$q <= p'$ が $q ⊩^* pi_1 in tau_2$ を満たすとすると、
  定義よりある $r <= q$ と $⟨pi_2, s_2⟩ in tau_2$ が $r <= s_2$ かつ $r ⊩^* pi_1 = pi_2$ を満たす。
  しかし $r <= q <= p'$ なので、いま述べたことに反する。よって $p'$ 以下のどれも
  $pi_1 in tau_2$ を強制せず、定義より $p' ⊩^* not (pi_1 in tau_2)$ である。

  $p' <= s_1$ と合わせて $p' in E$ であり、$p' <= p$ だから $E$ は稠密である。

  さて $G$ は生成的なので $q in G inter E$ が取れる。
  一つ目の場合なら求める結論そのものである。
  二つ目の場合、$⟨pi, s⟩ in tau_1$、$q <= s$、$q ⊩^* not (pi in tau_2)$ となる。
  $s in G$ より $val(pi, G) in val(tau_1, G) = val(tau_2, G)$ である。
  一方、$⟨pi, tau_2⟩$ は階数が下がっているので、帰納法の仮定と否定の定義から
  $val(pi, G) in.not val(tau_2, G)$ が従う。実際、もし属していれば
  ある $r in G$ が $r ⊩^* pi in tau_2$ を満たし、$q, r in G$ の共通の下界 $t in G$ について
  @lem:monotone より $t ⊩^* pi in tau_2$ となるが、$t <= q$ は
  $q ⊩^* not (pi in tau_2)$ に反する。よって矛盾。三つ目の場合も同様である。

  したがって $G inter E$ が拾えるのは一つ目の場合だけで、
  $q ⊩^* tau_1 = tau_2$ なる $q in G$ が存在する。
]

長い証明だったが、使っている道具は稠密性と生成性だけである。
「$G$ の中身は知らないが、稠密な集合には必ず引っかかる」という一点だけで、
これだけのことが言えてしまう。

= 真理補題：一般の場合

原子論理式さえ片づけば、あとは論理式の構成をたどるだけである。

#theorem("真理補題")[
  名前 $arrow(tau) in M$ と生成的フィルター $G$ について
  $ M[G] ⊨ phi.alt(val(arrow(tau), G)) quad <==> quad
    exists p in G med (p ⊩^* phi.alt(arrow(tau))) $
]<thm:truth>

#proof[
  論理式の構成についての帰納法による。原子論理式は @thm:truth-atomic である。

  #strong[$and$]。$arrow.l.double$ は帰納法の仮定から直ちに従う。
  $arrow.r.double$ は、$phi.alt$ を強制する $p in G$ と $psi$ を強制する $q in G$ を取り、
  共通の下界 $r in G$ を取れば、@lem:monotone より $r$ が両方を強制する。

  #strong[$not$]。$arrow.l.double$：$p in G$ が $p ⊩^* not phi.alt$ を満たすとする。
  もし $M[G] ⊨ phi.alt$ なら、帰納法の仮定よりある $q in G$ が $q ⊩^* phi.alt$ を満たす。
  $p, q in G$ の共通の下界 $r in G$ について @lem:monotone より $r ⊩^* phi.alt$ となるが、
  $r <= p$ なので $not$ の定義に反する。

  $arrow.r.double$：$M[G] ⊨ not phi.alt$ とする。集合
  $ D := \{ q : q ⊩^* phi.alt upright(" または ") q ⊩^* not phi.alt \} $
  は稠密である。実際、$q$ を取ったとき、$q$ 以下に $phi.alt$ を強制する条件がなければ
  定義より $q ⊩^* not phi.alt$ であり、あればその条件が $D$ に属する。
  $D in M$ なので $G$ と交わる。$phi.alt$ を強制する条件が $G$ にあると
  帰納法の仮定より $M[G] ⊨ phi.alt$ となって仮定に反するので、
  $G$ が拾うのは $not phi.alt$ を強制する条件である。

  #strong[$exists$]。$arrow.l.double$：$p in G$ が $exists x med phi.alt(x)$ を強制するとする。
  定義の集合は $p$ の下で稠密なので、@lem:dense-below-meets より
  $q in G$ と名前 $sigma$ が取れて $q ⊩^* phi.alt(sigma)$ となる。
  帰納法の仮定より $M[G] ⊨ phi.alt(val(sigma, G))$ であり、とくに $M[G] ⊨ exists x med phi.alt(x)$。

  $arrow.r.double$：$M[G] ⊨ exists x med phi.alt(x)$ とすると、証人は $M[G]$ の要素なので
  $val(sigma, G)$ の形に書ける（$M[G]$ の定義そのものである）。
  帰納法の仮定より $p ⊩^* phi.alt(sigma)$ なる $p in G$ が取れる。
  @lem:monotone より $p$ 以下のすべての条件が $phi.alt(sigma)$ を強制するので、
  定義の集合は $p$ の下で稠密であり、$p ⊩^* exists x med phi.alt(x)$ となる。
]

= 二つの強制関係は一致する

最後に、$M$ の中で定義した $⊩^*$ が、外から見た意味の $⊩$ と同じものであることを確かめる。

#theorem[
  $p ⊩ phi.alt(arrow(tau))$ と $p ⊩^* phi.alt(arrow(tau))$ は同値である。
]<thm:forcing-agree>

#proof[
  $arrow.l.double$。$p ⊩^* phi.alt$ とし、$p in G$ なる生成的 $G$ を任意に取る。
  @thm:truth より $M[G] ⊨ phi.alt$ である。$G$ は任意だったので $p ⊩ phi.alt$。

  $arrow.r.double$。対偶を示す。$not (p ⊩^* phi.alt)$ とする。

  まず、ある $q <= p$ が $q ⊩^* not phi.alt$ を満たすことを言う。
  そうでないとすると、任意の $q <= p$ について $not (q ⊩^* not phi.alt)$、
  すなわち $not$ の定義より、$q$ 以下に $phi.alt$ を強制する条件が存在する。
  これは $\{ r <= p : r ⊩^* phi.alt \}$ が $p$ の下で稠密であることを意味し、
  @lem:local より $p ⊩^* phi.alt$ となって仮定に反する。

  そこで $q <= p$ を $q ⊩^* not phi.alt$ なるものとする。
  $M$ は可算なので、Rasiowa--Sikorski の定理（#link("/math/set-theory/9")[第 9 回]）により
  $q$ を含む生成的フィルター $G$ が取れる。フィルターは上に閉じているので $p in G$ である。
  @thm:truth より $M[G] ⊨ not phi.alt$ となり、$p ⊩ phi.alt$ は成り立たない。
]

これで #link("/math/set-theory/9")[第 9 回]の二つの補題が証明された。
$⊩$ は $M$ の中で定義でき、$M[G]$ での真偽は $G$ に属する条件が強制するかどうかで決まる。

#check[
  @thm:forcing-agree の証明で、$M$ が可算であることを一度だけ使った。
  Rasiowa--Sikorski で $G$ を作るところである。
  可算性は技術的な都合に見えるが、外しても $⊩ thin = thin ⊩^*$ は言えるだろうか。
][
  #strong[言えない。それどころか、$⊩$ のほうが壊れる。]

  $⊩$ の定義は「$p$ を含む#strong[任意の]生成的 $G$ について $M[G] ⊨ phi.alt$」だった。
  全称なので、そういう $G$ が一つも無ければ#strong[空虚に真]になる。
  $phi.alt$ でも $not phi.alt$ でも、何でも強制されてしまう。

  そして $M$ が可算でないと、$G$ は本当に無くなりうる。極端な例として
  $M = V$ を取ると、$bb(P)$ に原子が無い限り、$V$ の中のどんなフィルター $G$ に対しても
  $bb(P) without G$ が稠密になる。$G$ は自分自身の補集合と交われないので、
  生成的なフィルターは存在しない。

  いっぽう $⊩^*$ は $G$ を一度も見ていない。名前と条件と稠密性だけで書かれているので、
  $M$ が何であっても意味を持つ。しかも @def:forces-logical の $not$ の定義から、
  $p ⊩^* phi.alt$ と $p ⊩^* not phi.alt$ が同時に成り立つことはない。
  #strong[空虚に真になる余地が無い。]

  だから二つは一致しなくなる。$⊩^*$ を「定義し直したもの」ではなく
  #strong[本来の定義]と見るべき理由がここにある。
  可算性は $⊩$ の側を救うための仮定であって、$⊩^*$ には要らない。
]

= なぜこんなに面倒だったのか

証明を振り返ると、面倒さの出どころは一つに絞れる。
#strong[条件は、命題の真偽について態度を保留できる]という点である。

$p$ が $phi.alt$ を強制せず、$not phi.alt$ も強制しない、という状況が普通に起きる。
$p$ はまだ情報が足りないだけで、下に伸ばせばどちらにも転べるからだ。
だから「$p$ が $phi.alt$ を強制しない」から「$p$ が $not phi.alt$ を強制する」へは進めない。
古典論理の二値性が、条件のレベルでは成り立っていない。

そのぶんを回収しているのが稠密性である。個々の条件は保留できるが、
$p$ 以下を全部見渡せば必ずどちらかに決まる条件が見つかる（@thm:truth の $not$ の場合）。
そして生成的フィルターは稠密集合を必ず拾う。
保留された態度が、$G$ を取った瞬間に一斉に確定する。

この構造は、直観主義論理の Kripke 意味論とよく似ている。
実際、強制法は Kripke モデルや層の理論と数学的に近い場所にいて、
Boolean 値モデルによる定式化はその親戚関係をはっきりさせたものである。
Cohen が独力でこの仕掛けに辿り着いたのは、やはり驚くべきことだと思う。

これでシリーズの穴は埋まった。
#link("/math/set-theory/10")[第 10 回]の Cohen の定理は、
これで下から上まで隙間なく証明されたことになる。

技術的な話はここまでである。
#link("/math/set-theory/12")[第 12 回]では、独立性の手前に何があるのかを見て、
シリーズを終える。
