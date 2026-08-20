#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "構成可能宇宙 L",
  date: "2026-08-17",
  field: "math",
  series: "set-theory",
  order: 8,
  tags: ("集合論",),
  summary: "冪集合を「定義できるものだけ」に絞ると、選択公理も一般連続体仮説も成り立つ痩せた宇宙ができる。",
)

#let ON = $upright(sans("On"))$
#let card(x) = $lr(|#x|)$
#let Def = math.op("Def")

= 冪集合が乱暴すぎる

#link("/math/set-theory/6")[第 6 回]で累積階層 $V_(alpha+1) = cal(P)(V_alpha)$ を作った。
あのとき「一番の暴れ馬」と書いたのが冪集合である。
$V_alpha$ の部分集合を#strong[全部]入れる、と宣言しているのに、
その「全部」が何本あるのかは誰にも分からない。$upright("CH")$ が決まらない原因はここにある。

ならば、絞ればよい。何を根拠に絞るか。Gödel の答えはこうだった。

#strong[名前を呼べる部分集合だけを入れる。]

$V_alpha$ の部分集合のうち、$V_alpha$ の言葉で「こういう条件を満たすもの」と書けるものだけを認める。
書けないものは知らない、と突っぱねる。ずいぶん保守的な態度だが、
そのぶん増え方が完全に制御できる。論理式は可算個しかないからだ。

= 定義可能性を定義する

方針は明快だが、実行には一つ厄介な問題がある。
「定義できる」という言葉を、集合論の中で定義しなければならない。

これは無条件にはできない。Tarski の定理（#link("/math/logic/10")[数理論理学の第 10 回]）により、
「$V$ 全体についての真理述語」は集合論の言語では書けない。
書けてしまうと嘘つきのパラドクスが再現する。

救いは、相手が集合ならうまくいくことである。

#remark[
  構造 $⟨X, in⟩$ に対する満足関係 $X ⊨ phi.alt[a_1, dots, a_n]$ は、
  論理式を集合として符号化してしまえば、論理式の構成についての再帰で定義できる。
  再帰の各段階が $X$ の中で完結しているので、$V$ 全体を見に行く必要がない。

  つまり「宇宙全体の真理」は語れないが、「ある集合の中での真理」なら語れる。
  この差が $L$ の構成を可能にしている。Kunen がこの話に一章を割いて
  「定義可能性を定義する」と題したのは、それだけ神経を使う場所だからである。
]

これを認めれば、次の定義が書ける。

#definition[
  集合 $X$ に対し
  $ Def(X) := \{ Y subset.eq X : exists phi.alt med exists a_1, dots, a_n in X med
      (Y = \{x in X : ⟨X, in⟩ ⊨ phi.alt[x, a_1, dots, a_n]\}) \} $
  と定める。$X$ の要素をパラメータに使い、$X$ の中で定義できる部分集合の全体である。
]<def:Def>

パラメータを許すのが要点である。許さないと、
$X$ の要素を名指しできず、階層が痩せすぎて壊れてしまう。

#definition("構成可能宇宙")[
  $ L_0 := nothing, quad L_(alpha+1) := Def(L_alpha), quad
    L_lambda := union.big_(alpha < lambda) L_alpha, quad
    L := union.big_(alpha in ON) L_alpha $
]<def:L>

$V_alpha$ の定義と見比べてほしい。違うのは $cal(P)$ が $Def$ に変わった一箇所だけである。
たったこれだけで、宇宙の性格がまるごと変わる。

= L の基本性質

#proposition[
  + 各 $L_alpha$ は推移的であり、$alpha <= beta$ ならば $L_alpha subset.eq L_beta$。
  + $L_alpha subset.eq V_alpha$。とくに $n < omega$ では $L_n = V_n$ であり、$L_omega = V_omega$。
  + $L_alpha inter ON = alpha$。つまり $L$ はすべての順序数を持つ。
  + $alpha >= omega$ ならば $card(L_alpha) = card(alpha)$。
]<prop:L-basic>

#proof[
  (1) $Def(X) subset.eq cal(P)(X)$ なので、$V_alpha$ のときと同じ議論が通る。
  $X$ が推移的なら $X$ の要素は $X$ の部分集合であり、しかも
  $x in X$ に対し $x = \{y in X : y in x\}$ と定義できるので $x in Def(X)$、
  すなわち $X subset.eq Def(X)$ である。

  (2) $Def(X) subset.eq cal(P)(X)$ から帰納法で従う。
  有限段階では $X$ の部分集合はすべて（有限個のパラメータで）定義できるので、
  $Def(X) = cal(P)(X)$ となり $L_n = V_n$。極限で $L_omega = V_omega$。

  (3) 順序数 $alpha$ は $L_(alpha+1)$ で初めて現れる。
  「$x$ は順序数」は $Delta_0$ なので絶対であり（#link("/math/set-theory/7")[第 7 回]）、
  $alpha = \{x in L_alpha : x upright("は順序数")\}$ と定義できるからだ。
  逆に $L_alpha$ の要素である順序数は $alpha$ 未満である。

  (4) 論理式は可算個、パラメータは $L_alpha$ の有限列なので、
  $ card(Def(X)) <= aleph_0 dot card(X)^(< omega) = card(X) $
  が無限の $X$ について成り立つ（#link("/math/set-theory/4")[第 4 回]の基数算術）。
  あとは $alpha$ についての帰納法で、極限段階は和集合の濃度を数えればよい。
]

(4) が $L$ の生命線である。$V$ では $V_(omega+1)$ の時点で濃度が $2^(aleph_0)$ に跳ね上がるのに、
$L$ では段階の番号と濃度がぴったり一致したまま進む。
どこに何があるかを、番号で追いかけられるということだ。

#theorem[
  $L$ は $upright("ZF")$ のすべての公理を満たす。
]<thm:L-models-ZF>

#proof[
  外延性と正則性は、$L$ が推移的であることから直ちに従う。

  対・和集合・無限は、必要な集合が実際に $L$ のどこかの段階で定義できることを確かめればよい。
  たとえば $x, y in L_alpha$ なら $\{x, y\} = \{z in L_alpha : z = x or z = y\}$ と
  パラメータ $x, y$ を使って定義できるので $\{x, y\} in L_(alpha+1)$ である。

  分出は $Def$ の定義そのものである。$x in L_alpha$ と論理式 $phi.alt$ に対し、
  $\{z in x : phi.alt^L (z)\}$ は $L_alpha$ の中で（$phi.alt$ を $L_alpha$ に相対化した形で）定義でき、
  次の段階に現れる。ここで反映原理が効いていて、
  $phi.alt^L$ が十分大きい $L_alpha$ での成立と一致することを使う。

  冪集合。$x in L$ に対し $cal(P)(x) inter L$ が $L$ の要素であることを示せばよい。
  $cal(P)(x) inter L$ の各要素は、置換により、ある段階までに現れる。
  それらの段階の上限 $alpha$ を取れば $cal(P)(x) inter L subset.eq L_alpha$ であり、
  $cal(P)(x) inter L = \{z in L_alpha : z subset.eq x\}$ と定義できる。

  置換も同様に、像の要素が現れる段階の上限を取って、その段階で定義する。
  どちらも「上限を取る」ところで置換公理を（$V$ の側で）使っている。
]

証明を見て気づくのは、$L$ の中の住人にとって冪集合とは
$cal(P)(x) inter L$ のことだ、という点である。
本物の $cal(P)(x)$ より小さいかも知れないが、住人はそれに気づかない。
#link("/math/set-theory/7")[第 7 回]で「冪集合は絶対でない」と言ったのは、まさにこの状況を指している。

= 凝縮補題

$L$ の真価は次の補題にある。名前のとおり、大きいものを小さく凝縮する。

#theorem("凝縮補題")[
  $delta$ を極限順序数、$M prec L_delta$ を初等部分構造で推移的なものとすると、
  ある $beta <= delta$ について $M = L_beta$ である。
]<thm:condensation>

#proof[
  $beta := M inter ON$ とおく。$M$ は推移的なので $beta$ は順序数である。

  $L$ の構成は絶対である。すなわち「$y = L_alpha$」は、
  十分な公理を満たす推移的モデルの間で絶対になる。これは $L_alpha$ の定義が
  順序数に沿った再帰であり、各段階の $Def$ が有界な操作だからである。

  $M prec L_delta$ より、$M$ は $L_delta$ が満たす文をすべて満たす。
  とくに $L_delta$ の住人が「すべての集合はある $L_alpha$ に属する」と言っているので、
  $M$ の住人もそう言う。絶対性より、$M$ の住人の言う $L_alpha$ は本物の $L_alpha$ である。
  よって $display(M subset.eq union.big_(alpha < beta) L_alpha = L_beta)$ であり、逆向きの包含も同様に従う。
]

証明の骨は「$L$ の作り方が絶対だから、中の住人も同じ $L$ を作る」という一言である。
$V$ に対してはこんなことは言えない。$V_alpha$ の構成には冪集合が入っていて、
それが絶対でないからだ。$Def$ に置き換えたご利益がここで返ってくる。

#corollary[
  $L$ の中では「$V = L$」が成り立つ。すなわち $L ⊨ (V = L)$。
]<cor:VequalsL>

#proof[
  $L$ の中で構成した $L$、すなわち $L^L$ が $L$ に一致することを言えばよい。
  $L_alpha$ の構成が絶対なので、$L$ の住人が段階 $alpha$ で作るものは
  我々の $L_alpha$ と同じである。よって $L^L = L$ となり、
  $L$ の住人にとっては「すべての集合は構成可能」となる。
]

= L では選択公理が成り立つ

さて、ご褒美の時間である。

#theorem[
  $L ⊨ upright("AC")$。より強く、$L$ には $L$ 全体を整列するクラス関係 $<_L$ が定義できる。
]<thm:L-AC>

#proof[
  各 $L_alpha$ 上の整列順序 $<_alpha$ を、$alpha$ についての再帰で作る。

  $<_0$ は空。極限段階では、それまでの順序をつなげる
  （先に現れたものを前に置く）。後続段階が肝心である。
  $L_(alpha+1) = Def(L_alpha)$ の要素は、論理式 $phi.alt$ とパラメータの有限列 $arrow(a)$ の組で
  名指しされている。論理式は符号化により自然数として並べられ、
  パラメータは $<_alpha$ で並べられるから、組全体を辞書式に並べられる。
  そこで各要素に「それを定義する最小の組」を割り当てれば、$L_(alpha+1)$ の整列順序が決まる。

  $<_alpha$ たちは互いに整合的なので、合わせて $L$ 全体の整列順序 $<_L$ が得られる。
  これは論理式で定義されているので $L$ の中でも認識でき、
  各集合はどこかの $L_alpha$ に属するから、$L$ の中で任意の集合が整列可能となる。
]

選択公理は「規則を書けないときにも選べる」と主張する公理だった
（#link("/math/set-theory/5")[第 5 回]）。
その公理が $L$ で成り立つ理由が、まさに#strong[規則が書けてしまうから]だというのは、
なかなか皮肉が効いている。$L$ の住人は全員、生まれた順に名前と背番号を持っているのだ。

#corollary[
  $upright("ZF")$ が無矛盾なら $upright("ZFC")$ も無矛盾である。
]<cor:con-ZFC>

= L では一般連続体仮説が成り立つ

#theorem[
  $V = L$ を仮定すると、任意の無限基数 $kappa$ に対し $2^kappa = kappa^+$。
]<thm:L-GCH>

#proof[
  $A subset.eq kappa$ とする。$V = L$ より $A in L_delta$ なる $delta$ が取れ、
  $delta$ は十分な公理を満たす極限順序数としてよい。

  Löwenheim--Skolem（#link("/math/logic/7")[数理論理学の第 7 回]）により、
  $kappa union \{A\}$ を含み濃度 $kappa$ の初等部分構造
  $M prec L_delta$ を取る。$M$ を Mostowski 崩壊して推移的な $N$ にすると、
  @thm:condensation より $N = L_beta$ なる $beta$ がある。

  ここで崩壊写像 $pi$ は $kappa$ の上で恒等である。$kappa subset.eq M$ かつ $kappa$ は推移的なので、
  $in$-帰納法により $pi(xi) = xi$ が各 $xi < kappa$ で成り立つからだ。
  したがって $A subset.eq kappa$ についても
  $pi(A) = \{pi(x) : x in A\} = A$ となり、$A in L_beta$ である。

  $card(beta) = card(N) = card(M) = kappa$ だから $beta < kappa^+$、よって
  $ cal(P)(kappa) subset.eq L_(kappa^+) . $
  @prop:L-basic (4) より $card(L_(kappa^+)) = kappa^+$ なので $2^kappa <= kappa^+$。
  Cantor の定理から $2^kappa > kappa$ なので、$2^kappa = kappa^+$ である。
]

証明の仕掛けは「$A$ を含む小さな初等部分構造を取って、凝縮補題で $L$ の階層に戻す」という一手である。
$kappa$ の部分集合はどれも、$kappa^+$ より手前の段階までに現れてしまう。
だから $cal(P)(kappa)$ の大きさが $kappa^+$ で抑えられる。

#corollary[
  $upright("ZF")$ が無矛盾なら、$upright("ZFC") + upright("GCH")$ も無矛盾である。
  とくに $upright("CH")$ の否定は $upright("ZFC")$ から証明できない。
]<cor:con-GCH>

これが Gödel が 1938 年に示したことである。
モデルを外から作るのではなく、$V$ の中に痩せた部分宇宙を彫り出す。
この手法を内部モデル法と呼ぶ。

= V = L を公理にすべきか

$L$ を見ていると、こう思うかも知れない。
選択公理も連続体仮説も片づくのだから、$V = L$ を公理として採用すればよいではないか。

実際 Gödel は一時期そう考えていた節がある。だが現在の集合論では、
この公理はあまり歓迎されていない。理由は、$L$ が痩せすぎているからだ。

$V = L$ を認めると、可測基数のような大きな基数は存在できなくなる。
記述集合論の側でも、$L$ の中には「見た目は素直なのに測れない実数の集合」が現れてしまい、
解析学の直観と噛み合わない。極小の宇宙を選ぶことは、
書けるはずだった数学をあらかじめ捨てることでもある。

もっとも、$L$ が要らないという話ではまったくない。無矛盾性を測る物差しとして、
また比較のための基準点として、$L$ は今でも中心的な対象である。
「$L$ ではこうなる」という結果は、その命題がどれくらいの強さを要求するかを教えてくれる。

さて、$upright("CH")$ の否定が証明できないことは分かった。
残るは $upright("CH")$ 自身が証明できないことである。
そのためには $upright("CH")$ が破れるモデルが要る。彫り出すのではなく、
今度は付け足さなければならない。次回はいよいよ強制法である。
