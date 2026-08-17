#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "関係と順序",
  date: "2026-08-17",
  field: "math",
  series: "set-theory",
  order: 2,
  tags: ("集合論",),
  summary: "関数はグラフである、と言い切ってしまう流儀。整列順序の基本定理まで一気に。",
)

#let dom = math.op("dom")
#let ran = math.op("ran")
#let fld = math.op("fld")
#let pred = math.op("pred")

= 関数とは何か、を集合で答える

#link("/math/set-theory/1")[第 1 回] で順序対
$⟨x, y⟩ = \{\{x\}, \{x, y\}\}$ と直積 $A times B$ が手に入った。
これから、数学で日常的に使う道具をこの上に全部載せていく。

ところで「関数とは何か」と聞かれたら、何と答えるだろうか。
「入力に対して出力を一つ返す規則」だろうか。悪くないが、
「規則」というのが何なのかは答えていない。集合論の言語には規則などという便利な言葉はない。

集合論の答えは、身も蓋もない。#strong[関数とはグラフのことである]。
入力と出力の対を全部集めた集合、それが関数の正体だ、と言い切ってしまう。
乱暴に聞こえるが、これで全部うまくいく。

== 関係

#definition[
  要素がすべて順序対であるような集合 $R$ を#strong[関係]と呼び、
  $⟨x, y⟩ in R$ のことを $x R y$ とも書く。さらに
  $ dom R := \{x : exists y med (⟨x, y⟩ in R)\}, quad
    ran R := \{y : exists x med (⟨x, y⟩ in R)\}, quad
    fld R := dom R union ran R $
  をそれぞれ#strong[定義域]、#strong[値域]、#strong[台]と呼ぶ。
]<def:rel>

さらっと定義を書いたが、こういうときは毎回立ち止まる癖をつけたい。
$dom R$ は本当に集合だろうか。クラスとして書いただけかも知れないではないか。

大丈夫である。$⟨x, y⟩ = \{\{x\}, \{x, y\}\}$ という定義を思い出すと、
$x$ も $y$ も $union.big union.big R$ の要素になっている。
つまり容れ物は $union.big union.big R$ で、あとは分出すればよい。

このように「それは集合か」を毎回問うのが、この分野の作法である。
最初は面倒だが、Russell の逆理を見たあとでは、疑わないほうが怖い。

#definition[
  $ R^(-1) := \{⟨y, x⟩ : ⟨x, y⟩ in R\}, quad
    S compose R := \{⟨x, z⟩ : exists y med (⟨x, y⟩ in R and ⟨y, z⟩ in S)\} $
]

#proposition[
  関係 $R, S, T$ に対して $(R^(-1))^(-1) = R$ および
  $T compose (S compose R) = (T compose S) compose R$ が成り立つ。
]

#proof[
  $R$ の要素はすべて順序対なので $⟨x, y⟩$ の形に書け、反転を 2 回行えば元に戻る。
  よって前半が従う。後半は、どちらの辺も
  「$⟨x, w⟩$ であって、ある $y, z$ が $x R y$、$y S z$、$z T w$ を満たすもの」の全体に等しい。
]

== 関数

#definition[
  関係 $f$ が $forall x in dom f med exists! y med (⟨x, y⟩ in f)$ を満たすとき、
  $f$ を#strong[関数]と呼ぶ。このとき $⟨x, y⟩ in f$ なる唯一の $y$ を $f(x)$ と書く。
  $dom f = A$ かつ $ran f subset.eq B$ のとき $f : A -> B$ と書く。
]<def:fun>

関数は集合であり、その集合はグラフそのものである。だから
「2 つの関数が等しい」とは、定義域が同じで各点の値が同じ、ということに他ならない。
これは外延性がそう言っているだけで、証明すべきことは何もない。

#definition[
  $f : A -> B$、$X subset.eq A$、$Y subset.eq B$ に対し
  $ f[X] := \{f(x) : x in X\}, quad
    f^(-1)[Y] := \{x in A : f(x) in Y\}, quad
    f|_X := \{⟨x, y⟩ in f : x in X\} $
  と定める。$f[A] = B$ のとき#strong[全射]、$f(x) = f(y) => x = y$ のとき#strong[単射]、
  両方満たすとき#strong[全単射]という。
]

記号について一言。$f^(-1)$ は関係としては常に定義できるが、
関数になるのは $f$ が単射のときだけである。それでも $f^(-1)[Y]$ という記法は使ってよい。
これは逆関係による像という意味で、$f$ が単射でなくても意味を持つからだ。
紛らわしいので嫌う人もいるが、慣習として定着してしまっている。

さて、像と逆像の性質を並べてみると、奇妙な非対称性に気づく。

#proposition[
  $f : A -> B$、$cal(X)$ を $A$ の部分集合の族、$cal(Y)$ を $B$ の部分集合の族とする。
  $ f[union.big cal(X)] = union.big_(X in cal(X)) f[X], quad
    f[inter.big cal(X)] subset.eq inter.big_(X in cal(X)) f[X] $
  $ f^(-1)[union.big cal(Y)] = union.big_(Y in cal(Y)) f^(-1)[Y], quad
    f^(-1)[inter.big cal(Y)] = inter.big_(Y in cal(Y)) f^(-1)[Y] $
  さらに $f$ が単射ならば、上段の包含は等号になる。
]<prop:image>

#proof[
  非自明なのは像と共通部分の関係だけである。
  $y in inter.big_(X in cal(X)) f[X]$ とすると、各 $X in cal(X)$ ごとに
  $f(x_X) = y$ なる $x_X in X$ が取れる。しかしこれらが同じ点である保証はどこにもなく、
  したがって $y in f[inter.big cal(X)]$ とは言えない。
  $f$ が単射ならば $x_X$ は $y$ から一意に定まるのですべて一致し、
  その共通の点が $inter.big cal(X)$ に属するので、等号になる。
  残りの三つの等式は、両辺の要素の条件を書き下すと同じ論理式になるので直ちに従う。
]

逆像は和も共通部分も補集合も、何でも保つ。ところが像は和しか保たない。
これは覚えるべき事実というより、関数の定義そのものの反映である。
関数は入力から出力へ一意だが、逆は一意でない。その一方通行が、そのまま現れている。

位相空間の連続性が、像ではなく逆像を使って定義されるのも同じ理由である。
逆像は行儀がよいのだ。

#proposition[
  $A$ から $B$ への関数全体 ${}^A B := \{f : f : A -> B\}$ は集合である。
]

#proof[
  関数 $f : A -> B$ は $A times B$ の部分集合だから ${}^A B subset.eq cal(P)(A times B)$ である。
  $A times B$ は集合であり（#link("/math/set-theory/1")[第 1 回]）、
  その冪集合も集合なので、分出より ${}^A B$ が得られる。
]

またしても「容れ物を見つけて分出」である。この型の証明はもう三回目だが、
これから何度も出てくるので、そういうものだと思っておいてほしい。

= 同値関係と商

#definition[
  $A$ 上の関係 $E subset.eq A times A$ が
  反射律 $forall x in A med (x E x)$、対称律 $x E y => y E x$、
  推移律 $x E y and y E z => x E z$ を満たすとき、$E$ を#strong[同値関係]と呼ぶ。
  $[x]_E := \{y in A : x E y\}$ を#strong[同値類]、
  $A slash E := \{[x]_E : x in A\}$ を#strong[商集合]と呼ぶ。
]<def:equiv>

同値関係の定義は三つの条件からなるが、本当に言いたいことは一つである。
「$A$ を重なりなく区分けせよ」。それを関係の言葉で書き直すと、あの三条件になる。
次の定理がその主張を正確にしたものだ。

#theorem[
  $E$ を $A$ 上の同値関係とすると、$A slash E$ は $A$ の分割である。
  すなわち空でない集合からなり、互いに交わらず、和が $A$ に等しい。
  逆に $A$ の分割 $cal(Q)$ が与えられれば、
  $x E_(cal(Q)) y :<=> exists Q in cal(Q) med (x in Q and y in Q)$ は同値関係であり、
  この二つの対応は互いに逆になる。
]<thm:partition>

#proof[
  反射律より $x in [x]_E$ なので、各同値類は空でなく、$union.big (A slash E) = A$ である。
  交わらないことを見る。$[x]_E inter [y]_E != nothing$ とし $z$ をその要素とすると、
  $x E z$ と $y E z$ から対称律と推移律により $x E y$ を得る。
  すると任意の $w in [x]_E$ に対し $y E x$ かつ $x E w$ より $w in [y]_E$ となり、
  逆向きも同様なので $[x]_E = [y]_E$。つまり二つの同値類は一致するか交わらないかのどちらかである。

  逆向き。分割 $cal(Q)$ に対し、各 $x$ はちょうど一つの $Q in cal(Q)$ に属するので、
  $E_(cal(Q))$ は反射律・対称律・推移律を満たす。
  $A slash E_(cal(Q)) = cal(Q)$ および $E_(A slash E) = E$ も、
  いま示した「一致するか交わらないか」から直ちに従う。
]

商という構成は、集合論の外でも際限なく現れる。整数から有理数を作るのもこの形だし、
「同じ大きさの集合を同一視して基数を作る」のもこの形にしたい。

……のだが、後者は素直にいかない。同値類が真のクラスになってしまうのである。
$bb(N)$ と対等な集合を全部集めた「類」は、集合ではない。
この躓きをどう回避するかは #link("/math/set-theory/4")[第 4 回] の見どころである。

= 順序

#definition[
  集合 $A$ 上の関係 $R$ が
  $ upright("推移律") quad & forall x, y, z in A med (x R y and y R z => x R z) \
    upright("非反射律") quad & forall x in A med (not (x R x)) $
  を満たすとき、$⟨A, R⟩$ を#strong[狭義半順序]と呼ぶ。さらに
  $ upright("三分律") quad forall x, y in A med (x = y or x R y or y R x) $
  を満たすとき、#strong[狭義全順序]（線型順序）と呼ぶ。
]<def:order>

$<=$ で書く流儀もあって、そちらのほうが馴染みがあるかも知れない。
集合論で狭義のほうを採るのは、順序数を $in$ で順序づけたいからである。
$in$ は非反射的だ（#link("/math/set-theory/1")[第 1 回] の正則性より $x in.not x$）。
道具を後で使う場面に合わせておく、という実利的な理由である。

#definition[
  $⟨A, R⟩$ を順序、$X subset.eq A$ とする。
  $forall x in X med (x R b or x = b)$ なる $b in A$ を $X$ の#strong[上界]、
  上界のうち $R$-最小のものを#strong[上限] $sup X$ と呼ぶ。
  $forall x in X med (not (b R x))$ なる $b in X$ を#strong[極大元]、
  $forall x in X med (b R x or b = x)$ なる $b in X$ を#strong[最大元]と呼ぶ。
]

極大元と最大元は、初学者が必ず一度は混同する。極大元は「自分より上がいない」だけで、
比較不能な相手がいてもよい。最大元は「全員より上」である。
全順序なら両者は一致するが、半順序では極大元がいくつもある状況が普通に起きる。

#example[
  $⟨cal(P)(A), subset⟩$ は狭義半順序であって、$A$ が 2 元以上なら全順序ではない。
  任意の部分族 $cal(X) subset.eq cal(P)(A)$ が上限
  $sup cal(X) = union.big cal(X)$ を持つので、これは完備束になる。
  Zorn の補題が活躍するのは、だいたいこの型の順序である
  （#link("/math/set-theory/5")[第 5 回]）。
]

#proposition[
  $⟨A, R⟩$ が狭義全順序で $B subset.eq A$ ならば、
  $⟨B, R inter (B times B)⟩$ も狭義全順序である。
]

#proof[
  推移律・非反射律・三分律はいずれも「$A$ のすべての要素について」という形の主張で、
  何かの存在を要求していない。よって要素を減らしても成立し続ける。
]

「存在を要求しない条件は部分集合に遺伝する」というのは、覚えておくと便利な経験則である。
次に扱う整列性は最小元の#strong[存在]を要求するので、この経験則の外にある。
（結果としては遺伝するのだが、それは「部分集合の部分集合は部分集合」という別の理由による。）

= 整列順序

いよいよ主役の登場である。

#definition[
  狭義全順序 $⟨A, R⟩$ について、$A$ の空でない任意の部分集合が $R$-最小元を持つとき、
  $⟨A, R⟩$ を#strong[整列順序]と呼ぶ。
]<def:wo>

#example[
  $⟨bb(N), <⟩$ は整列順序である。$⟨bb(Z), <⟩$ も $⟨bb(Q), <⟩$ も全順序だが整列ではない。
  $bb(Z)$ には最小元がないし、$bb(Q)$ では開区間が最小元を持たない。

  面白いのは、$bb(N)$ に「偶数を全部並べてから奇数を全部並べる」順序を入れた場合である。
  これも整列順序になる。台集合は同じ $bb(N)$ なのに、並び方の形が違う。
  この「形」を測るのが順序数だ。
]

整列順序が特別扱いされる理由は一つである。帰納法が使えるのだ。

#theorem("超限帰納法（整列集合版）")[
  $⟨A, R⟩$ を整列順序、$X subset.eq A$ とする。
  $ forall a in A med (pred(A, a, R) subset.eq X => a in X) $
  ならば $X = A$。ここで $pred(A, a, R) := \{y in A : y R a\}$ を $a$ による#strong[切片]と呼ぶ。
]<thm:transfinite-induction>

#proof[
  $X != A$ と仮定する。$A without X != nothing$ だから、整列性よりその $R$-最小元 $a$ が取れる。
  $a$ の最小性より、$y R a$ なる $y$ はすべて $X$ に属する。すなわち $pred(A, a, R) subset.eq X$。
  すると仮定より $a in X$ となるが、これは $a in A without X$ に反する。
]

高校で習う数学的帰納法との違いを見てほしい。あちらは「$n$ で成り立てば $n+1$ でも」
という形だった。ここでは直前という言葉が一切出てこない。

これは技巧ではなく必然である。整列順序には「直前がない要素」が現れうるからだ。
先ほどの偶数・奇数の例なら、最初の奇数 $1$ には直前がない。
その手前には偶数が無限に並んでいて、どれも直前ではない。
だから $n$ から $n+1$ という形の帰納法は通用しない。
切片全体を仮定に使う形にしておけば、直前があろうがなかろうが同じ扱いで済む。

#definition[
  $⟨A, R⟩$ と $⟨B, S⟩$ に対し、全単射 $f : A -> B$ が
  $ forall x, y in A med (x R y <=> f(x) S f(y)) $
  を満たすとき、$f$ を#strong[同型写像]と呼び、$⟨A, R⟩ tilde.equiv ⟨B, S⟩$ と書く。
]<def:iso>

ここから先の三つの定理が、整列順序の性格を決めている。まず補題を一つ用意する。
地味だが、これがすべての鍵になる。

#lemma[
  $⟨A, R⟩$ を整列順序、$f : A -> A$ を順序を保つ単射とすると、
  任意の $a in A$ に対し $not (f(a) R a)$ である。
]<lem:no-decrease>

#proof[
  $X := \{a in A : f(a) R a\}$ が空でないとし、その $R$-最小元を $a$ とする。
  $f(a) R a$ に $f$ を施すと、$f$ が順序を保つので $f(f(a)) R f(a)$ となる。
  これは $f(a) in X$ を意味する。ところが $f(a) R a$ なので、$a$ の最小性に反する。
  よって $X = nothing$。
]

順序を保つ写像は、どの点も自分より下には落とせない、という主張である。
言われてみれば当たり前に思えるが、整列性がないと成り立たない。
$bb(Z)$ 上の $f(n) = n - 1$ は順序を保つ単射だが、全部を下に落としている。

#theorem[
  整列順序 $⟨A, R⟩$ は、その真の切片とは同型でない。
  すなわち任意の $a in A$ に対し $⟨A, R⟩ tilde.equiv.not ⟨pred(A, a, R), R⟩$。
]<thm:no-iso-seg>

#proof[
  同型 $f : A -> pred(A, a, R)$ があったとする。
  $f$ は $A$ から $A$ への順序を保つ単射でもあり、$f(a) in pred(A, a, R)$ すなわち $f(a) R a$。
  これは @lem:no-decrease に矛盾する。
]

無限集合は自分自身の真部分集合と対等になれる（$bb(N)$ と偶数全体を思い出そう）。
しかし整列順序として見ると、真の切片とは決して同型にならない。
大きさの話と並びの話は別物なのだ、ということがここで初めてはっきりする。

#theorem[
  同型な整列順序 $⟨A, R⟩ tilde.equiv ⟨B, S⟩$ の間の同型写像は、ただ一つしかない。
]<thm:unique-iso>

#proof[
  $f, g$ を同型とすると $g^(-1) compose f : A -> A$ は順序を保つ全単射である。
  @lem:no-decrease をこれとその逆写像の両方に適用すると、任意の $a in A$ に対し
  $not (g^(-1)(f(a)) R a)$ かつ $not (a R g^(-1)(f(a)))$ を得る。
  三分律より $g^(-1)(f(a)) = a$、すなわち $f = g$。
]

同型がたくさんあると「形」が曖昧になるが、整列順序ではそれが起きない。
剛い（rigid）と言う。この剛さのおかげで、後に順序型を一つの順序数として
迷いなく決めることができる。

最後に、任意の二つの整列順序が必ず比較できることを示す。これが今回の山場である。

#theorem("比較定理")[
  整列順序 $⟨A, R⟩$、$⟨B, S⟩$ に対し、次の三つのうちちょうど一つが成り立つ。
  $ upright("(a)") quad & ⟨A, R⟩ tilde.equiv ⟨B, S⟩ \
    upright("(b)") quad & exists y in B med (⟨A, R⟩ tilde.equiv ⟨pred(B, y, S), S⟩) \
    upright("(c)") quad & exists x in A med (⟨pred(A, x, R), R⟩ tilde.equiv ⟨B, S⟩) $
]<thm:comparison>

#proof[
  対応を天下りに与える。
  $ f := \{⟨v, w⟩ in A times B :
      ⟨pred(A, v, R), R⟩ tilde.equiv ⟨pred(B, w, S), S⟩\} $
  とおく。$A times B$ からの分出なので、これは集合である。
  「$v$ の手前の形と $w$ の手前の形が同じなら対応させる」という素直な定義になっている。

  まず $f$ は関数である。$v$ に対応する $w$ が二つあれば $B$ の相異なる二つの切片が
  同型になり、一方は他方の真の切片だから @thm:no-iso-seg に反する。
  同じ議論を逆向きに使えば $f$ が単射であることも分かる。
  定義の形から $f$ が順序を保つことも直ちに従う。

  次に $dom f$ は $A$ の切片である。$v in dom f$ かつ $u R v$ とすると、
  $pred(A, v, R)$ と $pred(B, f(v), S)$ の間の同型を $u$ までに制限すれば
  $u$ に対応する $w$ が得られるからだ。同様に $ran f$ は $B$ の切片である。

  ここで、$dom f$ と $ran f$ の両方が#strong[真の]切片だとしてみよう。
  $dom f = pred(A, x, R)$、$ran f = pred(B, y, S)$ と書けて、
  $f$ 自身がこの二つの切片の間の同型を与えている。すると $f$ の定義より $⟨x, y⟩ in f$、
  つまり $x in dom f = pred(A, x, R)$ となって $x R x$、非反射律に矛盾する。

  よって $dom f = A$ または $ran f = B$ の少なくとも一方が成り立ち、
  組み合わせに応じて (a)(b)(c) のいずれかが得られる。
  排他性は @thm:no-iso-seg から従う。たとえば (a) と (b) が同時に成り立てば、
  $⟨B, S⟩$ が自分の真の切片と同型になってしまう。
]

比較定理が言っているのは「整列順序たちは一列に並ぶ」ということである。
どの二つを持ってきても、どちらかがどちらかの先頭部分になっている。
ならば、その列に目盛りを打ちたくなるのが人情だろう。
その目盛りが順序数で、#link("/math/set-theory/3")[第 3 回] でいよいよ構成する。
