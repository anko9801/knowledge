#import "/src/typst/template.typ": post

#show: post.with(
  title: "群論",
  date: "2026-08-17",
  tags: ("ノート",),
  summary: "note/group_theory.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 群に触れる
<群に触れる>
== 群ってなんだろう？
<群ってなんだろう>
#block[
空集合でない集合 $G$
上で単位元と逆元を持つ結合的な演算が定義されているとき $G$ を群という。
演算 $dot.op$ $ a e = e a = a\
a a^(- 1) = a^(- 1) a = e\
\( a + b \) + c = a + \( b + c \) $

]
これはもう覚えるしかないです。

「単位元と逆元を持つ結合的な演算」

と覚えてください。

まずは足し算 $+$ の群を探しに行きます。

$ bb(C) supset bb(R) supset bb(Q) supset bb(Z) supset 2 bb(Z) supset { 0 } $

これらが群となっているのは単位元と逆元を持つ結合的な演算であることを調べればいいです。

+ $\( a + b \) + c = a + \( b + c \)$

+ $e := 0$, $a^(- 1) := - a$

次に掛け算 $times$ の群はどうでしょう。

$ bb(C)^times supset bb(R)^times supset bb(Q)^times supset bb(Z)^times supset { 1 } $

右肩に $times$
があるのは掛け算に使えない元を取り除いたものと考えればいいです。(環の乗法群)
例えば実数 $bb(R)$ は $0$ の逆元はないのでそれを取り除いたものです。
以下のように大体の代数では $0$ だけを除いたものと思えばいいですが、整数
$bb(Z)$
は例外でほとんどの整数の逆元は分数となってしまって整数に戻ってきません。
辛うじて $plus.minus 1$ の逆元は $plus.minus 1 in bb(Z)$
なので整数に入って

$ bb(C)^times & = bb(C) without { 0 }\
bb(R)^times & = bb(R) without { 0 }\
bb(Q)^times & = bb(Q) without { 0 }\
bb(Z)^times & = { plus.minus 1 } $

これらが群となっているのは単位元と逆元を持つ結合的な演算であることを調べればいいです。

+ $\( a times b \) times c = a times \( b times c \)$

+ $e := 1$, $a^(- 1) := 1 / a$

群というのはこのようなものです。

準同型定理、表現論などとても豊富な性質があります。 一つでも条件を外すと
(それらの研究をしている人には申し訳ないが) 殺風景となってしまいます。
最小の条件でもっとも幅広い分野に適用できる代数構造というのが群なのです。

可換法則 $a b = b a$ が成り立つとき可換群という。

環や体は和と積

== 部分群と生成元
<部分群と生成元>
#block[
群 $G$ の部分集合 $H$ が群となるとき $H$ は $G$ の部分群であるという。

]
#block[
$G$ を群として $g in G$
$ chevron.l g chevron.r := { g^n divides n in bb(Z) } $

]
一般的な代数を扱っているのに整数が入っていいのか！？ってのを気づいて欲しい。

例えば加法群 $bb(Z)$ において $2 in bb(Z)$ の巡回部分群は
$ chevron.l 2 chevron.r = { 2 n divides n in bb(Z) } = { dots.h \, - 4 \, - 2 \, 0 \, 2 \, 4 dots.h } = 2 bb(Z) subset bb(Z) $
これが群となっていることがわかるでしょう。

乗法群 $bb(Q)^times$ において $2 in bb(Q)^times$ の巡回部分群は
$ chevron.l 2 chevron.r = { 2^n divides n in bb(Z) } = {dots.h \, 1 / 4 \, 1 / 2 \, 1 \, 2 \, 4 \, 8 dots.h} subset bb(Q) $

== 位数
<位数>
#block[
群 $G$ の濃度 $\| G \|$ を群 $G$ の位数という。 \
また $G$ について $\| G \| < oo$ のとき有限群, $\| G \| gt.eq oo$
のとき無限群という。

]
== 剰余群
<剰余群>
