#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "意味論と充足関係",
  date: "2026-08-17",
  field: "math",
  series: "logic",
  order: 3,
  tags: ("数理論理学",),
  summary: "記号列に意味を与える。Tarski の再帰的定義と、それが集合論を借りているということ。",
)

#let Fv = math.op("FV")

= 記号列に意味を与える

前回作ったのは記号列だった。$forall x med (x = x)$ も
$forall x med not (x = x)$ も、構文としては等しく正当である。
そこに真偽を持ち込むには、記号が何を指すのかを決めなければならない。

決め方は素朴である。語る対象の集合を一つ用意し、各記号にその上の何かを割り当てる。

#definition[
  言語 $cal(L)$ の#strong[構造] $frak(A)$ とは、次の組である。
  - 空でない集合 $A$（#strong[領域]）
  - 各定数記号 $c$ に対する要素 $c^frak(A) in A$
  - 各 $n$ 変数関数記号 $f$ に対する写像 $f^frak(A) : A^n -> A$
  - 各 $n$ 変数述語記号 $P$ に対する部分集合 $P^frak(A) subset.eq A^n$
]<def:structure>

#example[
  順序の言語（$2$ 変数述語記号 $<$ だけ）の構造とは、
  集合とその上の二項関係の組である。順序である必要はない。
  「順序である」という条件は、公理を書いて絞り込むことで表現する。

  算術の言語の構造で $bb(N)$ を領域に取り、$0, S, +, times$ を通常のものに解釈したものを
  #strong[標準モデル] $frak(N)$ と呼ぶ。標準でないモデルもあることは第 6 回で見る。
]

領域を空でないとするのは、$exists x med (x = x)$ を恒真にしておきたいからである。
空の構造を許す流儀もあるが、公理系が少し面倒になる。

= 付値と項の値

自由変数を含む論理式は、変数に値を入れないと真偽が決まらない。そこで付値を用意する。

#definition[
  #strong[付値]とは写像 $s : \{v_0, v_1, dots\} -> A$ である。
  項 $t$ の値 $t^frak(A)[s] in A$ を次のように再帰的に定める。
  $ x^frak(A)[s] & := s(x) \
    c^frak(A)[s] & := c^frak(A) \
    (f t_1 dots t_n)^frak(A)[s] & := f^frak(A)(t_1^frak(A)[s], dots, t_n^frak(A)[s]) $
]<def:assignment>

この再帰が正当なのは、前回の一意可読性のおかげである。
項の分解が一通りしかないので、値も一通りに決まる。

$s(x \| a)$ で、$x$ の値だけを $a$ に取り替えた付値を表す。

= Tarski の充足関係

いよいよ本体である。

#definition[
  構造 $frak(A)$、付値 $s$、論理式 $phi.alt$ について、
  関係 $frak(A) ⊨ phi.alt [s]$ を論理式の構成についての再帰で定める。
  $ frak(A) ⊨ (t_1 = t_2)[s] quad & :<=> quad t_1^frak(A)[s] = t_2^frak(A)[s] \
    frak(A) ⊨ (P t_1 dots t_n)[s] quad & :<=> quad
      ⟨t_1^frak(A)[s], dots, t_n^frak(A)[s]⟩ in P^frak(A) \
    frak(A) ⊨ (not phi.alt)[s] quad & :<=> quad frak(A) ⊨ phi.alt [s] upright(" が成り立たない") \
    frak(A) ⊨ (phi.alt and psi)[s] quad & :<=> quad
      frak(A) ⊨ phi.alt [s] upright(" かつ ") frak(A) ⊨ psi [s] \
    frak(A) ⊨ (forall x med phi.alt)[s] quad & :<=> quad
      upright("すべての ") a in A upright(" について ") frak(A) ⊨ phi.alt [s(x \| a)] $
]<def:satisfaction>

見ての通り、右辺には左辺と同じ言葉が出てくる。「かつ」も「すべての」も「成り立たない」も、
メタ言語の側の言葉である。定義は循環しているのではなく、
#strong[対象言語の $and$ をメタ言語の「かつ」に翻訳している]のだ。

これが Tarski の定義の要点で、初めて見ると拍子抜けする。
$and$ の意味は「かつ」です、と言っているだけではないか。
だが、それ以外に何が言えるだろう。意味論の仕事は意味を無から作ることではなく、
対象言語の記号とメタ言語の概念を対応づけることなのだ。

#remark[
  この定義がなぜ「集合論を借りている」ことになるのか。
  $forall$ の行を見てほしい。「すべての $a in A$ について」と言うために、
  領域 $A$ の全体を見渡している。$A$ が無限集合なら、
  これは無限個の条件を一度に扱う操作である。
  有限的なメタ理論だけでは書けない。

  #link("/math/logic/1")[第 1 回]で述べた層の話がここで具体化する。
  構文の側（前回）は有限的な操作だけで済んだが、意味論の側は集合論の上に建っている。
]

#definition[
  文 $sigma$ については、付値の取り方によらず真偽が決まる（次の @lem:coincidence で示す）。
  そこで $frak(A) ⊨ sigma$ と書き、$frak(A)$ は $sigma$ の#strong[モデル]であるという。
  理論 $Gamma$ のすべての文が成り立つとき $frak(A) ⊨ Gamma$ と書く。

  $Gamma ⊨ phi.alt$（$phi.alt$ は $Gamma$ の#strong[意味論的帰結]）とは、
  $Gamma$ のすべてのモデルで $phi.alt$ が成り立つことをいう。
  $nothing ⊨ phi.alt$ のとき $phi.alt$ は#strong[恒真]であるという。
]<def:models>

= 自由変数だけが効く

定義を書いたら、まず基本的な整合性を確かめる。

#lemma("一致補題")[
  付値 $s, s'$ が $Fv(phi.alt)$ の上で一致するならば、
  $frak(A) ⊨ phi.alt [s]$ と $frak(A) ⊨ phi.alt [s']$ は同値である。
]<lem:coincidence>

#proof[
  まず項について、$t$ に現れる変数の上で $s$ と $s'$ が一致すれば
  $t^frak(A)[s] = t^frak(A)[s']$ が成り立つ。項の構成についての帰納法で直ちに従う。

  論理式について、構成の帰納法で示す。原子論理式は上の主張そのものである。
  $not$ と $and$ は帰納法の仮定がそのまま持ち上がる。

  $phi.alt = forall x med psi$ のとき。$Fv(psi) subset.eq Fv(phi.alt) union \{x\}$ なので、
  任意の $a in A$ について $s(x \| a)$ と $s'(x \| a)$ は $Fv(psi)$ の上で一致する。
  帰納法の仮定より $frak(A) ⊨ psi [s(x \| a)]$ と $frak(A) ⊨ psi [s'(x \| a)]$ は同値であり、
  $a$ が任意なので結論が従う。
]

これで文の真偽が付値によらないことが分かった。@def:models の書き方が正当化されたわけである。

もう一つ、代入と意味の関係を押さえる。

#lemma("代入補題")[
  項 $t$ が $phi.alt$ の $x$ に自由に代入可能であるとき、
  $ frak(A) ⊨ phi.alt [t \/ x] [s] quad <==> quad
    frak(A) ⊨ phi.alt [s(x \| t^frak(A)[s])] $
]<lem:substitution>

#proof[
  論理式の構成についての帰納法による。
  原子論理式の場合は、項についての対応する主張
  $ (u[t \/ x])^frak(A)[s] = u^frak(A)[s(x \| t^frak(A)[s])] $
  から従い、これは項の構成についての帰納法で示せる。
  $not$ と $and$ は素直に持ち上がる。

  $phi.alt = forall y med psi$ の場合が本題である。
  $y = x$ なら $x$ は $phi.alt$ に自由に現れないので、代入は何もせず、両辺は一致する。

  $y != x$ とする。自由に代入可能という仮定より、$y$ は $t$ に現れない。
  よって任意の $a in A$ について $t^frak(A)[s(y \| a)] = t^frak(A)[s]$ が成り立つ
  （@lem:coincidence の項版）。したがって帰納法の仮定から
  $ frak(A) ⊨ psi[t \/ x][s(y \| a)] <==> frak(A) ⊨ psi[s(y \| a)(x \| t^frak(A)[s])] $
  であり、$a$ について「すべての」を付ければ結論が得られる。
]

この補題が、$y$ が $t$ に現れないという条件をどこで使っているかを見てほしい。
条件を外すと、$t$ の値が $y$ の値に依存してしまい、
$forall y$ の内側と外側で $t$ の指すものが変わる。
前回の変数捕獲の例が、意味論の側では正確にこの形で壊れるのである。

= 集合論の相対化との関係

#link("/math/set-theory/7")[集合論の第 7 回]で、相対化 $phi.alt^M$ を定義した。
量化子を $M$ に制限した論理式のことである。あれと今回の $⊨$ はどう違うのか。

$M$ が集合なら、両者は本質的に同じものである。
$⟨M, in⟩$ を構造と見て $⟨M, in⟩ ⊨ phi.alt$ と書くのと、
$phi.alt^M$ と書くのは一致する。

違いが出るのは $M$ が真のクラスのときである。
$V$ や $L$ や $upright(sans("On"))$ を領域とする「構造」は集合ではないので、
@def:structure の意味では構造にならない。$⊨$ を使えないのだ。
そこで集合論では、相対化という構文的な操作で代用する。
$phi.alt^M$ は論理式ごとに一本ずつ書けるので、図式としてなら扱える。

#remark[
  この事情は、集合論で「$L ⊨ upright("ZF")$」と書くときの正確な意味にも関わる。
  これは一本の主張ではなく、$upright("ZF")$ の各公理 $phi.alt$ について
  「$phi.alt^L$ が定理である」という無限個の主張の集まりである。

  そして、これを一本にまとめようとすると Tarski の定理に阻まれる。
  $V$ 全体の真理述語は書けないからだ。
  #link("/math/set-theory/8")[集合論の第 8 回]で
  「集合の上でなら満足関係を定義できる」と急いで注意したのは、この境目の話だった。
  第 10 回で Tarski の定理を証明するとき、この境目がどこから来るのかがはっきりする。
]

意味論が手に入ったので、次は証明の側を作る。
そして「証明できること」と「正しいこと」を突き合わせる。
両者が一致するというのが完全性定理で、このシリーズの最初の山になる。
