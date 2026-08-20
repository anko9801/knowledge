#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "Löwenheim–Skolem と初等部分構造",
  date: "2026-08-17",
  field: "math",
  series: "logic",
  order: 7,
  tags: ("数理論理学",),
  summary: "大きな構造の中に、同じ一階の性質を持つ小さな構造が住んでいる。集合論に返す借りの本体。",
  provides: (
    "lowenheim-skolem",
    "elementary-substructure",
  ),
)

#let Fv = math.op("FV")

= 小さいのに同じに見える

#link("/math/logic/5")[第 5 回]の項モデルは、言語が可算なら可算だった。
そこから「無矛盾な理論には可算なモデルがある」が出る。これが下向きの Löwenheim--Skolem である。

ただ、この形では使いにくい。実際に欲しいのはこういう主張である。

#strong[すでに手元にある大きな構造の中から、小さな部分を切り出して、
それが元の構造と同じ一階の性質を持つようにできる。]

集合論で使ったのはこの形だった。$V_alpha$ から可算な部分を切り出して、
それが同じ文を満たすようにする。そこから Mostowski 崩壊で推移的モデルを作る、
というのが #link("/math/set-theory/7")[集合論の第 7 回]の議論である。
今回はその「切り出し」を正当化する。

= 部分構造では足りない

#definition[
  構造 $frak(A)$、$frak(B)$ について、$A subset.eq B$ であって
  記号の解釈が $A$ 上で一致するとき、$frak(A)$ を $frak(B)$ の#strong[部分構造]といい
  $frak(A) subset.eq frak(B)$ と書く。

  さらに、$A$ の要素からなる任意の付値 $s$ と任意の論理式 $phi.alt$ について
  $ frak(A) ⊨ phi.alt [s] quad <==> quad frak(B) ⊨ phi.alt [s] $
  が成り立つとき、$frak(A)$ を $frak(B)$ の#strong[初等部分構造]といい
  $frak(A) prec frak(B)$ と書く。
]<def:elementary>

部分構造であるだけでは、性質は保たれない。

#example[
  順序の言語で $frak(A) := ⟨bb(N), <⟩$、$frak(B) := ⟨bb(Z), <⟩$ とすると
  $frak(A) subset.eq frak(B)$ である。しかし
  $ exists x med forall y med not (y < x) $
  （最小元がある）は $frak(A)$ で真、$frak(B)$ で偽である。よって $frak(A) prec frak(B)$ でない。

  食い違いの原因は $exists$ にある。$frak(A)$ が「そんなものはない」と言うとき、
  $frak(B)$ にはあるかも知れない。逆に $frak(B)$ が証人を持っていても、
  それが $A$ の中にあるとは限らない。
]

つまり初等部分構造であるためには、$frak(B)$ の証人を $A$ が取りこぼさないことが必要である。
それを条件として書き下したのが次の判定法で、これが今回の技術的な要になる。

#theorem("Tarski--Vaught の判定法")[
  $frak(A) subset.eq frak(B)$ とする。次は同値である。
  + $frak(A) prec frak(B)$
  + 任意の論理式 $phi.alt(x, arrow(y))$ と $A$ の要素 $arrow(a)$ について、
    $frak(B) ⊨ phi.alt [b, arrow(a)]$ なる $b in B$ が存在するならば、
    そのような $b$ を $A$ の中に取れる
]<thm:tarski-vaught>

#proof[
  $1 arrow.r.double 2$。$frak(B) ⊨ exists x med phi.alt [arrow(a)]$ とすると、
  $frak(A) prec frak(B)$ より $frak(A) ⊨ exists x med phi.alt [arrow(a)]$ であり、
  $frak(A)$ の中に証人 $a in A$ がある。$frak(A) ⊨ phi.alt [a, arrow(a)]$ から、
  ふたたび初等性より $frak(B) ⊨ phi.alt [a, arrow(a)]$ となる。

  $2 arrow.r.double 1$。論理式の構成についての帰納法で
  $frak(A) ⊨ phi.alt [s] <=> frak(B) ⊨ phi.alt [s]$ を示す。

  原子論理式は、部分構造の定義から従う（記号の解釈が一致している）。
  $not$ と $and$ は帰納法の仮定がそのまま持ち上がる。

  $phi.alt = exists x med psi$ の場合が本題である
  （$forall$ は $not exists not$ の略記なので、これで足りる）。

  $frak(A) ⊨ exists x med psi [s]$ なら、証人 $a in A subset.eq B$ が帰納法の仮定より
  $frak(B)$ でも証人になるので $frak(B) ⊨ exists x med psi [s]$。

  逆に $frak(B) ⊨ exists x med psi [s]$ とすると、条件 2 より証人を $A$ の中に取れる。
  その $a in A$ について帰納法の仮定より $frak(A) ⊨ psi [s(x \| a)]$、
  よって $frak(A) ⊨ exists x med psi [s]$ である。
]

条件 2 は「$frak(B)$ が何かの存在を主張するなら、その実例を $A$ が持っている」と読める。
初等部分構造の本質は、量化子の証人を取りこぼさないことだ、というのがこの定理の内容である。

= 小さな初等部分構造を作る

判定法があれば、構成は素直である。証人を集めて閉じるだけだ。

#theorem("下向き Löwenheim--Skolem")[
  可算な言語の構造 $frak(B)$ と部分集合 $X subset.eq B$ に対し、
  $X subset.eq A$ かつ $frak(A) prec frak(B)$ で
  $ lr(|A|) <= max(lr(|X|), aleph_0) $
  を満たす初等部分構造 $frak(A)$ が存在する。
  とくに $X = nothing$ と取れば、可算な初等部分構造が得られる。
]<thm:downward-ls>

#proof[
  選択公理により、$frak(B)$ の各論理式 $phi.alt(x, arrow(y))$ と各 $arrow(b) in B^n$ に対し、
  $ h_(phi.alt)(arrow(b)) := cases(
      frak(B) ⊨ phi.alt [b, arrow(b)] upright(" なる ") b upright(" を一つ選ぶ"),
      upright("そのような ") b upright(" がなければ ") B upright(" の適当な元"),
    ) $
  という写像を選ぶ。これを#strong[Skolem 関数]と呼ぶ。

  $A_0 := X union \{b_0\}$（$b_0$ は $B$ の任意の元。空でないようにするため）とし、
  $ A_(n+1) := A_n union \{ h_(phi.alt)(arrow(b)) :
      phi.alt upright(" は論理式、") arrow(b) in A_n^(< omega) \} $
  と定めて $A := union.big_n A_n$ とおく。

  $A$ は関数記号について閉じている（関数の値も Skolem 関数で拾える）ので、
  $frak(B)$ の部分構造 $frak(A)$ を定める。

  濃度を数える。論理式は可算個、各段階の有限列は
  $lr(|A_n|)$ が無限なら $lr(|A_n|)$ 個なので、
  $lr(|A_(n+1)|) <= aleph_0 dot lr(|A_n|) = lr(|A_n|)$ である
  （#link("/math/set-theory/4")[集合論の第 4 回]の基数算術）。
  可算個の和なので $lr(|A|) <= max(lr(|X|), aleph_0)$ となる。

  最後に @thm:tarski-vaught の条件 2 を確かめる。
  $arrow(a) in A$ について $frak(B) ⊨ exists x med phi.alt [arrow(a)]$ とすると、
  $arrow(a) in A_n$ なる $n$ があり、$h_(phi.alt)(arrow(a)) in A_(n+1) subset.eq A$ が証人になる。
  よって $frak(A) prec frak(B)$ である。
]

証明の中で選択公理を使った箇所を見てほしい。Skolem 関数を選ぶところである。
「証人が存在するなら一つ選ぶ」を非可算個の組について同時に行うので、
ここは選択公理なしでは済まない。

#remark[
  この構成が集合論でどう使われたかを並べておく。

  #link("/math/set-theory/7")[集合論の第 7 回]では、
  反映原理で $V_alpha ⊨ T$ を得たあと、@thm:downward-ls で可算な $M prec V_alpha$ を取り、
  Mostowski 崩壊で推移的にした。強制法の舞台となる可算推移モデルはこうして作られた。

  #link("/math/set-theory/8")[集合論の第 8 回]では、
  $A subset.eq kappa$ を含む濃度 $kappa$ の初等部分構造 $M prec L_delta$ を取り、
  凝縮補題で $L_beta$ に戻した。これが $L ⊨ upright("GCH")$ の証明の核心だった。

  どちらも「大きな構造から小さな初等部分構造を切り出す」という同じ一手である。
  借りていたのはこの定理だったわけである。
]

= Skolem の逆理

下向き Löwenheim--Skolem を集合論そのものに適用すると、奇妙な結論が出る。

#remark("Skolem の逆理")[
  $upright("ZFC")$ が無矛盾ならモデルを持ち、@thm:downward-ls より#strong[可算な]モデル $frak(M)$ を持つ。

  ところが $upright("ZFC")$ は「非可算集合が存在する」を証明する。
  よって $frak(M)$ の中には、$frak(M)$ の住人が「これは非可算だ」と言う集合 $a$ がある。
  しかし $frak(M)$ 全体が可算なのだから、外から見れば $a$ の要素は可算個しかない。
]

初めて聞くと矛盾のように思える。私も学生のとき、これで何日か悩んだ。

答えはこうである。「$a$ は非可算」とは
「$omega$ から $a$ への全単射が#strong[存在しない]」という主張だった。
$frak(M)$ の住人がそう言えるのは、そのような全単射が $frak(M)$ の中にないからである。
外から見れば全単射はちゃんとあるが、それは $frak(M)$ の要素ではない。

#link("/math/set-theory/7")[集合論の第 7 回]の言葉で言えば、
「$x$ は可算」は $Sigma_1$ なので上向きにしか絶対でない。
モデルの外で可算だからといって、中で可算とは限らないのだ。
逆理の正体は、可算性という概念が絶対でないことに尽きる。

#remark[
  同じ現象は強制法でも起きていた。
  #link("/math/set-theory/10")[集合論の第 10 回]で「基数の崩壊」を心配したのは、
  モデルを太らせたときに新しい全単射が入り込み、
  それまで非可算だったものが可算になってしまう危険があったからである。
  ccc という条件は、まさにそれを防ぐために課されていた。

  Skolem の逆理と基数の崩壊は、同じ一つの事実の別の顔である。
  「大きさ」はモデルに相対的だ、ということだ。
]

= モデル理論への入口

今回の道具は、集合論のためだけのものではない。
初等部分構造と初等拡大は、モデル理論という分野の基本語彙である。

たとえば「$frak(A) prec frak(B)$ かつ $frak(A) != frak(B)$」という関係を使うと、
理論の分類（$omega$ 安定性、カテゴリカル性）や、
代数閉体・実閉体の性質の統一的な扱いが可能になる。
Ax--Grothendieck の定理のような、一見して論理と無関係な代数の定理が
コンパクト性定理と初等性から出てくる、というのはモデル理論の醍醐味である。

このシリーズではそちらへは進まず、残りの三回で不完全性定理へ向かう。
道具立てが意味論から構文と計算へ切り替わるので、
次回はいったん論理式を離れて、計算とは何かを考えることになる。
