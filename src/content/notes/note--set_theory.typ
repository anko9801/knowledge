#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "集合論",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/set_theory.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 公理的集合論の基礎
<公理的集合論の基礎>
== 論理
<論理>
等号

== 集合
<集合>
#definition("集合")[
集合とはものからなる集まりのことである。
]
集合に対してさまざまな公理を要請します。

#axiom("外延性公理")[
全く同じ要素からなる 2
つの集合は等しい。
$ forall A forall B \( forall x \( x in A arrow.l.r.double x in B \) arrow.r.double.long A = B \) $
]
等号の代入原理より同値であることがわかる。
$ forall A forall B \( forall x \( x in A arrow.l.r.double x in B \) arrow.l.r.double A = B \) $
またこの公理から集合の順不同性 ${ a \, b } = { b \, a }$,
多重集合は存在しない ${ a \, a } = { a }$

#axiom("内包性図式")[
集合に対してある条件
$phi.alt$ を満たしたものを集めた集合がある。
$ exists y forall x \( x in y arrow.l.r.double x in z and phi.alt \) $
ただし論理式 $phi.alt$ は変数 $y$ を自由変数として用いないこととする。
この $y$ は外延性より唯一つに定まり, これを ${ x in z : phi.alt }$
と書く。
]
この内包性公理から空集合の存在やすべての集合を含む集合は存在しないことを示せる。

まず空集合 $nothing$
については恒偽の論理式を内包性公理に入れることで存在することが分かる。
$  & exists y forall x \( x in y arrow.l.r.double x in z and x eq.not x \)\
 & exists y forall x \( x in y arrow.l.r.double x in.not z \)\
 & exists y forall x \( x in.not y \) $ すべての集合を含む集合
$z quad upright(s . t .) med forall x \( x in z \)$
が存在すると仮定すると論理式 $x in.not x$ を内包性公理に入れて $y = x$
と代入すると
$  & exists y forall x \( x in y arrow.l.r.double x in z and x in.not x \)\
 & exists y forall x \( x in y arrow.l.r.double x in.not x \)\
 & exists y \( y in y arrow.l.r.double y in.not y \) $
より矛盾する。よってすべての集合を含む集合は存在しない。

差集合 $ A \\ B colon.eq { x in A : x in.not B } $

#axiom("対の公理")[
2
つの集合があるときそれらを集めた集合も存在する。
$ forall x forall y exists z \( x in z and y in z \) $
]
対の公理から(?) 成り立たなさそう。 対 ${ x \, y }$ の存在や 1
つの元だけ持つ単集合 ${ x }$, 順序を備えた順序対 $⟨x \, y⟩$
を定義できます。 $ { x \, y } & := { v in z : v = x or v = y }\
{ x } & := { x \, x }\
⟨x \, y⟩ & := { { x } \, { x \, y } } $

#axiom("和集合の公理")[
集合族 $cal(F)$
に関する和集合が存在する。
$ forall cal(F) exists A forall Y forall x \( x in Y and Y in cal(F) arrow.r.double.long x in A \) $
]
和集合や共通部分, 和集合と積集合
$ union.big cal(F) & := { x : exists Y in cal(F) \( x in Y \) }\
inter.big cal(F) & := { x : forall Y in cal(F) \( x in Y \) }\
A union B & := union.big { A \, B }\
A inter B & := inter.big { A \, B } $

#axiom("置換図式")[
ある集合に対して論理式によって対応する集合がある。
$ forall x in A exists ! y phi.alt \( x \, y \) arrow.r.double.long exists Y forall x in A exists y in Y phi.alt \( x \, y \) $
つまり一意に決まる論理式があるとき
${ y : exists x in A med phi.alt \( x \, y \) }$ が存在する。
]
#theorem("直積集合")[
$ A times B := { ⟨x \, y⟩ : x in A and y in B } $
]
#proof[
置換公理と内包性公理より, 各 $y in B$ に対し,
$ forall x in A exists ! z { z = ⟨x \, y⟩ } upright(p r o d) \( A \, y \) colon.eq { z : exists x in A \( z = ⟨x \, y⟩ \) } $
また, 次のように定義できる。
$ forall y in B exists ! z { z = upright(p r o d) { A \, y } } upright(p r o d)' \( A \, B \) colon.eq { upright(p r o d) { A \, y } : y in B } $
$A times B colon.eq union.big upright(p r o d)' \( A \, B \)$
と置くことで定義の正当性が分かる。
]

#definition[
関係

任意の要素が順序対となる集合。

関係 $R$ に対し, 定義域 $upright(d o m) \( R \)$ と値域
$upright(r a n) \( R \)$ は次のように定義する。
$ upright(d o m) \( R \) & = { x : exists y med ⟨x \, y⟩ in R }\
upright(r a n) \( R \) & = { y : exists x med ⟨x \, y⟩ in R } $ 関係 $R$
は通常 $R subset upright(d o m) \( R \) times upright(r a n) \( R \)$
となる場合だけに使われる。 $ R^(- 1) := { ⟨x \, y⟩ : ⟨y \, x⟩ in R } $
]
#theorem[
関係 $R$ に対し ${ R^(- 1) }^(- 1) = R$ となる。
]
#proof[
$R$ は関係であるから任意の $R$ の元は順序対であり,
それぞれに対し反転を2回行えば元に戻る。
]

#definition("関数")[
関係 $f$ が
$forall x in upright(d o m) \( f \) \, exists y in upright(r a n) \( f \) { ⟨x \, y⟩ in f }$
を満たすとき $f$ を関数と呼ぶ。また, 関数 $f$ について
$A = upright(d o m) \( f \) \, B supset upright(r a n) \( f \)$
を満たすとき, $f : A arrow.r B$ と書く。

関数の制限
]
#definition("狭義全順序")[
集合 $A$ 関係 $R$
に対し, 次を満たす組 $⟨A \, R⟩$ を狭義全順序と呼ぶ。
$ upright("推移律") quad & forall x \, y \, z in A \( x R y and y R z arrow.r x R z \)\
upright("三分律") quad & forall x \, y in A \( x = y or x R y or y R x \)\
upright("非反射律") quad & forall x in A { not { x R x } } $
]
#theorem[
$⟨A \, R⟩$ が狭義全順序ならば, 任意の $B subset A$
について $⟨B \, R⟩$ は狭義全順序となる。
]
#proof[
$R subset upright(d o m) \( R \) times upright(r a n) \( R \)$
より集合に対して関係の集合は依存していない。また推移律, 三分律,
非反射律は存在を示している訳ではないので $B$ に対しても成立する。よって
$⟨B \, R⟩$ は狭義全順序となる。
]

#definition[
同型写像 集合と関係の対 $⟨A \, R⟩ \, ⟨B \, S⟩$
について 全単射 $f : A arrow.r B$ が存在し
$ ⟨A \, R⟩ tilde.equiv ⟨B \, S⟩ : arrow.l.r.double forall x \, y in A \( x R y arrow.l.r.double f \( x \) S f \( y \) \) $
$f$ を同型写像と呼ぶ。

整列順序

全順序 $⟨A \, R⟩$ について $A$ の空でない任意の部分集合に必ず
$R$-最小の要素があるとき, $⟨A \, R⟩$ が整列順序であるという。

切片 $ upright(p r e d) \( A \, x \, R \) := { y in A : y R x } $
]
#theorem[
$⟨A \, R⟩$ を整列順序とするとき, 任意の $x in A$
に対して
$⟨A \, R⟩ tilde.equiv.not ⟨upright(p r e d) \( A \, x \, R \) \, R⟩$
である。
]
#proof[
$f : A arrow.r upright(p r e d) \( A \, x \, R \)$
が同型写像であると仮定すると, 集合 ${ y in A : f \( y \) eq.not y }$ の
$R$-最小要素 $y$ が。
]

#theorem[
$⟨A \, R⟩ \, ⟨B \, S⟩$
を互いに同型な整列順序とするとき, この間の同型写像は唯一つ存在する。
]
#proof[
仮に2つの同型写像 $f \, g$ が存在したとき
$f \( y \) eq.not g \( y \)$ であるような $y in A$ のうち $R$-最小の $y$
を考えると矛盾。
]

#theorem[
$⟨A \, R⟩ \, ⟨B \, S⟩$ を整列順序とするとき,
次の3つの命題は互いに背反である。
$ upright("(a)") quad & ⟨A \, R⟩ tilde.equiv ⟨B \, S⟩\
upright("(b)") quad & exists y in B { ⟨A \, R⟩ tilde.equiv ⟨upright(p r e d) \( B \, y \, S \) \, S⟩ }\
upright("(c)") quad & exists x in A { ⟨upright(p r e d) \( A \, x \, R \) \, R⟩ tilde.equiv ⟨B \, S⟩ } $
]
#proof[
次のように $f$ を定める。
$ f & = { ⟨v \, w⟩ : v in A and w in B and ⟨upright(p r e d) \( A \, v \, R \) \, R⟩ tilde.equiv ⟨upright(p r e d) \( B \, w \, S \) \, S⟩ } $
このとき, $f$ は $A$ のある切片から $B$ のある切片への同型写像となるが,
これら二つの切片の両方が真の切片となることはありえない。
]

#axiom("選択公理")[
$forall A exists R \( upright("RはAを整列順序づけする") \)$
]
$ f \( x \) & = { y in b divides \( x \, y \) in f }\
f \[ a' \] & = { y in b divides exists x \( x in a' and \( x \, y \) in f \) }\
f^(- 1) & = { \( y \, x \) in b times a divides \( x \, y \) in f }\
g compose f & = { \( x \, z \) in a times c divides f \( x \) inter g^(- 1) \( z \) eq.not phi.alt } $

== 順序数
<順序数>
#definition("推移的")[
集合 $x$ の任意の要素が同時に
$x$ の部分集合でもあるとき $x$ が推移的であると呼ぶ。
]
#definition("順序数")[
推移的な集合 $x$ が $in$
によって整列順序づけされるとき, $x$ を順序数と呼ぶ。
]
#theorem[
+ $x$ が順序数で $y in x$ なら, $y$ も順序数で
  $y = upright(p r e d) \( x \, y \)$。

+ $x$ と $y$ が順序数で $x tilde.equiv y$ なら, $x = y$。

+ $x$ と $y$ が順序数なら, $x in y \, y in x \, y = x$
  のどれか1つだけが成立する。

+ $x$ と $y$ と $z$ が順序数で $x in y \, y in z$ であれば, $x in z$
  である。

+ $C$ が順序数の空でない集合であれば,
  $exists x in C forall y in C \( x in y or x = y \)$。
]
#proof[
+ 推移的であるから $y$ も順序数であり
  $upright(p r e d) \( x \, y \) = { z in x : z in y } = y$ となる。

+ 具体的な集合は空集合しか定義されていないから $x \, y$
  が同じように推移的であるならば $x = y$ であることが分かる。

+ (1), (2) と定理(ref)より成立する。$x = { x }$
  などの自分自身の元となる推移的な集合は順序数でないから2つ同時に成立することはない。

+ 推移的である為, 成り立つ。

+ $C$ の $in$-最小 $x$ について $x inter C = 0$ となる。よって $0$
  に含まれる元は存在しないことと(3)より $x$ は条件を満たす。

よって全て示された。
]

#theorem[
\$\\lnot\\exists z\\forall x(x\\text!{は順序数}\\to x\\in z)\$
]
#proof[
仮に任意の順序数を含む集合 $z$ があるとすると, 集合
$ O N & = { x : x upright("は順序数") } $ が存在し,
これは順序数となるが, $O N in O N$ となり, 整列順序付けできない為,
順序数ではない。よって矛盾し, そのような集合 $z$ は存在しない。
]

#lemma[
順序数の集合 $A$ が
$forall x in A forall y in x \( y in A \)$ ならば $A$ は順序数である。
]
#theorem[
$⟨A \, R⟩$ が整列順序であれば,
あるただ一つに定まる順序数 $C$ について $⟨A \, R⟩ tilde.equiv C$
となる。
]
#proof[
定理(ref)(3)より唯一性はわかる。\$B = \\{a\\in A:\\exists x(x\\text!{は順序数} \\land x\\cong\\left\\langle \\mathrm{pred}(A, a, R)\\right\\rangle )\\}\$
とおくと, 置換公理より
$ forall a in B exists ! x \( x tilde.equiv ⟨upright(p r e d) \( A \, a \, R \)⟩ \)\
C colon.eq { x : exists a in B { x tilde.equiv ⟨upright(p r e d) \( A \, a \, R \)⟩ } } $
となる $C$ が存在し, 関数 $f$ を $f : a mapsto x$ とおくと
$f subset B times C$ となる。
]

= 基礎
<基礎>
全射 (surjection) $ f \[ a \] = b $ 単射 (injection)
$ f \( x \) = f \( y \) arrow.r.double.long x = y $ 全単射 (bijection)
全射かつ単射

対等 全単射が存在する $a approx b$
