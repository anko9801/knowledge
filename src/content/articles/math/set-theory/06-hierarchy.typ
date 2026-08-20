#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "累積階層と独立性",
  date: "2026-08-17",
  field: "math",
  series: "set-theory",
  order: 6,
  tags: ("集合論",),
  summary: "集合の宇宙を段階に分けて眺める。共終数、到達不能基数、そして CH が独立であるとはどういうことか。",
  provides: (
    "cumulative-hierarchy",
    "relative-consistency",
  ),
)

#let ON = $upright(sans("On"))$
#let card(x) = $lr(|#x|)$
#let rank = math.op("rank")
#let cf = math.op("cf")
#let Def = math.op("Def")

= 宇宙を段階に分ける

#link("/math/set-theory/1")[第 1 回] で、公理的集合論は
「すでにある集合から新しい集合をどう作るか」だけを定めるのだ、と書いた。
ならば、作れる順に並べてみたらどうなるか。それをやったのが累積階層である。

#definition("累積階層")[
  超限再帰により
  $ V_0 := nothing, quad V_(alpha + 1) := cal(P)(V_alpha), quad
    V_lambda := union.big_(alpha < lambda) V_alpha quad (lambda upright("は極限")) $
  と定める。
]<def:cumulative>

何もないところから始めて、毎段階「今までにできたものの部分集合を全部」加える。
極限では、それまでを全部集めるだけである。極めて単純な作り方だ。

#proposition[
  + 各 $V_alpha$ は推移的である。
  + $alpha <= beta$ ならば $V_alpha subset.eq V_beta$。
]<prop:valpha>

#proof[
  両方まとめて $beta$ についての超限帰納法で示す。$beta = 0$ は自明。

  $beta = alpha + 1$ のとき。$x in V_(alpha+1) = cal(P)(V_alpha)$ とすると $x subset.eq V_alpha$ であり、
  帰納法の仮定より $V_alpha$ は推移的なので $x$ の要素も $V_alpha$ の部分集合、
  すなわち $V_(alpha+1)$ の要素である。よって $x subset.eq V_(alpha+1)$ となり推移的。
  また $V_alpha$ の推移性から $V_alpha subset.eq cal(P)(V_alpha) = V_(alpha+1)$ が従う。

  $beta$ が極限のとき。推移的な集合の和集合は推移的であり、単調性は定義から明らか。
]

さて、この階層はどこまで届くのか。ここで正則性公理が効いてくる。

#theorem[
  $upright("ZF")$ から正則性公理を除いた体系のもとで、次は同値である。
  + 正則性公理
  + 任意の集合 $x$ に対し、$x in V_alpha$ なる順序数 $alpha$ が存在する
]<thm:foundation-hierarchy>

#proof[
  #strong[(2) $=>$ (1)]。$x != nothing$ とする。$x$ の各要素 $y$ に対し
  $y in V_alpha$ なる最小の $alpha$ を $rank(y) + 1$ と書くことにして、
  $\{rank(y) : y in x\}$ の最小元を与える $y_0 in x$ を取る（順序数の集合には最小元がある）。
  $z in y_0 inter x$ なる $z$ があれば $rank(z) < rank(y_0)$ となって最小性に反するので、
  $y_0 inter x = nothing$ である。よって正則性が成り立つ。

  #strong[(1) $=>$ (2)]。まず、任意の集合 $x$ は推移的な集合に含まれることに注意する。
  実際 $u_0 := x$、$u_(n+1) := union.big u_n$ とおいて $t := union.big_n u_n$ とすれば、
  $t$ は $x$ を含む推移的な集合である（推移閉包という）。

  $x in.not V_alpha$ となる $x$ があったとして、その推移閉包 $t$ を取り、
  $ s := \{y in t : forall alpha med (y in.not V_alpha)\} $
  とおく。$x in s$ なので $s != nothing$、正則性より $y_0 inter s = nothing$ なる $y_0 in s$ がある。
  $t$ は推移的だから $y_0 subset.eq t$ であり、$y_0$ の要素はすべて $s$ の外、
  つまりどれかの $V_alpha$ に属する。置換公理により
  $beta := sup \{rank(z) + 1 : z in y_0\}$ が取れて $y_0 subset.eq V_beta$、
  すなわち $y_0 in V_(beta+1)$ となる。これは $y_0 in s$ に矛盾する。
]

つまり正則性公理は、「すべての集合はこの階層のどこかに現れる」と言っているのと同じである。
公理を並べた段階では、$in$ の循環を禁じる細かい規則にしか見えなかった。
それが実は、宇宙の全体像を規定していたわけだ。私はこの定理を知って、
ようやく正則性公理が好きになった。

#definition[
  $x in V_(alpha+1)$ となる最小の $alpha$ を $x$ の#strong[階数] $rank(x)$ と呼ぶ。
  同値に $rank(x) = sup \{rank(y) + 1 : y in x\}$。
]<def:rank>

#example[
  $V_omega$ は遺伝的有限集合の全体である。有限で、その要素も有限で、
  そのまた要素も……と、どこまで潜っても有限であるような集合のことだ。
  実はこの $V_omega$ は、無限公理を除いた $upright("ZF")$ のすべての公理を満たす。
  ここに無限集合はないので、無限公理だけが破れる。
  つまり無限公理は他の公理から証明できない。独立性の証明としては、これが一番易しい例である。
]

= 反映原理

累積階層を手に入れると、面白い現象が見えてくる。宇宙全体で成り立つことが、
どこかの段階 $V_alpha$ の中だけでも成り立ってしまう、という現象である。

#theorem("反映原理")[
  任意の有限個の論理式 $phi.alt_1, dots, phi.alt_n$ と任意の順序数 $beta$ に対し、
  $beta < alpha$ なる順序数 $alpha$ が存在して、すべての $i$ と
  $V_alpha$ の要素からなる任意の代入について
  $ phi.alt_i <==> phi.alt_i^(V_alpha) $
  が成り立つ。ここで $phi.alt^(V_alpha)$ は、$phi.alt$ の中の量化子をすべて
  $V_alpha$ に制限した論理式である。
]<thm:reflection>

#proof[
  部分論理式の個数は有限なので、それらをすべて含む有限集合を取って考えればよい。
  $exists y med psi(y, arrow(x))$ の形の部分論理式それぞれについて、次の関数を用意する。
  $arrow(x)$ に対し、$psi(y, arrow(x))$ を満たす $y$ が存在するならそのような $y$ が
  現れる最小の段階を返し、存在しないなら $0$ を返す関数 $F$ である（置換公理で定まる）。

  $alpha_0 := beta + 1$ とし、$alpha_(k+1)$ を、$V_(alpha_k)$ の要素の組すべてに対する
  $F$ の値の上限より大きい順序数として取る（置換と、順序数の集合が上限を持つことによる）。
  $alpha := sup_k alpha_k$ とおくと、$V_alpha$ の要素について
  「$y$ が存在するなら $V_alpha$ の中に存在する」が成り立つ。

  あとは論理式の構成についての帰納法である。原子論理式と論理結合子については主張は自明で、
  量化子の場合が上で用意した性質そのものになる。
]

有限個に限られているところが肝である。すべての論理式について同時に反映させることはできない。
もしできたら「$V_alpha$ が $upright("ZF")$ のモデルである」と $upright("ZF")$ の中で証明でき、
Gödel の第二不完全性定理（#link("/math/logic/10")[数理論理学の第 10 回]）に反してしまう。

#remark[
  この反映原理から、$upright("ZF")$ が有限個の公理では公理化できないことが従う（Montague）。
  分出と置換が公理図式として無限個あるのは、単に書き方の都合ではなかったのだ。
  どうしても無限個必要なのである。
]

= 共終数

大きい基数の話に入る前に、道具を一つ用意する。

#definition[
  極限順序数 $alpha$ に対し、
  $sup A = alpha$ となる $A subset.eq alpha$ の順序型の最小値を#strong[共終数] $cf(alpha)$ と呼ぶ。
  無限基数 $kappa$ が $cf(kappa) = kappa$ を満たすとき#strong[正則]、
  そうでないとき#strong[特異]という。
]<def:cofinality>

要するに「$alpha$ に到達するのに、最低何ステップ必要か」である。

#example[
  $cf(omega) = omega$ である。有限個の自然数では $omega$ に届かない。
  $cf(aleph_omega) = omega$ である。$aleph_0, aleph_1, aleph_2, dots$ という
  可算個の列で $aleph_omega$ に届いてしまう。
  つまり $aleph_omega$ は、自分よりはるかに小さい可算個の階段で到達できる、
  背伸びをした基数である。こういうものを特異と呼ぶ。
]

#proposition[
  + $cf(alpha)$ は正則な基数である。
  + 選択公理のもとで、後続基数 $aleph_(alpha+1)$ はすべて正則である。
]<prop:cf>

#proof[
  (1) $cf(alpha)$ が基数でないとすると、より小さい順序型の共終部分集合が取れてしまう。
  $cf(cf(alpha)) < cf(alpha)$ とすると、共終列を合成することで
  $alpha$ への共終列がより短く作れて矛盾する。

  (2) $cf(aleph_(alpha+1)) <= aleph_alpha$ と仮定すると、
  $aleph_(alpha+1)$ が $aleph_alpha$ 個以下の、それぞれ濃度 $aleph_alpha$ 以下の
  集合の和として書ける。すると Hessenberg の定理
  （#link("/math/set-theory/4")[第 4 回]）より
  $aleph_alpha dot aleph_alpha = aleph_alpha < aleph_(alpha+1)$ となって矛盾する。
  各部分の番号づけを選ぶところで選択公理を使っている。
]

共終数が効いてくるのが次の定理である。$2^(aleph_0)$ の値に制約をかけるのは、
実質これしかない。

#theorem("König")[
  任意の無限基数 $kappa$ に対し $kappa < kappa^(cf(kappa))$。
]<thm:koenig>

#proof[
  $lambda := cf(kappa)$ とし、$kappa$ に共終な増加列 $⟨kappa_i : i < lambda⟩$ を取る。
  任意の関数 $F : kappa -> {}^lambda kappa$ が全射でないことを示せばよい。

  各 $i < lambda$ について
  $ g(i) := min (kappa without \{F(xi)(i) : xi < kappa_i\}) $
  と定める。右辺の集合は濃度が $card(kappa_i) < kappa$ 以下なので $kappa$ を尽くさず、
  最小元が取れる。よって $g in {}^lambda kappa$ である。

  この $g$ はどの $F(xi)$ とも等しくない。実際 $xi < kappa$ を取ると、
  共終性より $xi < kappa_i$ なる $i < lambda$ があり、$g$ の定義から
  $g(i) != F(xi)(i)$ となる。よって $F$ は全射でない。
]

対角線論法である。Cantor の定理と同じ骨格をしているのが見て取れるだろう。

#corollary[
  $cf(2^(aleph_0)) > aleph_0$。とくに $2^(aleph_0) != aleph_omega$。
]<cor:cf-continuum>

#proof[
  $kappa := 2^(aleph_0)$ とおき、$cf(kappa) = aleph_0$ と仮定する。
  @thm:koenig より $kappa < kappa^(aleph_0)$ であるが、
  $ kappa^(aleph_0) = (2^(aleph_0))^(aleph_0) = 2^(aleph_0 dot aleph_0) = 2^(aleph_0) = kappa $
  となって矛盾する。$cf(aleph_omega) = omega$ なので $2^(aleph_0) = aleph_omega$ はあり得ない。
]

$2^(aleph_0)$ が何かは決まらない。しかし何でもよいわけでもない。
$upright("ZFC")$ が持っている情報はこの程度だ、ということである。

= 到達不能基数

$V_omega$ が無限公理以外を満たしたように、階層のどこかを切り取ると
$upright("ZFC")$ のモデルになっていることがある。どこで切ればよいか。

#definition[
  非可算な正則基数 $kappa$ であって、$lambda < kappa => 2^lambda < kappa$ を満たすものを
  #strong[（強）到達不能基数]と呼ぶ。
]<def:inaccessible>

正則だから下から短い列では届かず、冪集合を取っても飛び越えられない。
$aleph_0$ はこの二条件を満たしている（有限から $omega$ には届かないし、
$2^n$ は有限のまま）。到達不能基数とは、要するに
#strong[$aleph_0$ が有限に対して持っていた立場を、$aleph_0$ に対して持つ基数]である。

#theorem[
  $kappa$ が到達不能ならば $V_kappa$ は $upright("ZFC")$ のモデルである。
]<thm:inaccessible-model>

#proof[
  外延性・対・和集合・冪集合・分出・正則性・選択公理は、$V_kappa$ が推移的で
  冪集合について閉じていることから確かめられる。$kappa$ は非可算なので $omega in V_kappa$ であり、
  無限公理も成り立つ。

  残るのは置換である。$f$ を $V_kappa$ の中で定義される関数、$a in V_kappa$ とする。
  $card(a) < kappa$ であり、$kappa$ は正則だから、像 $f[a]$ の要素の階数の上限は
  $kappa$ に届かない。よって $f[a] in V_kappa$ である。
  $kappa$ の正則性が本質的に効いているのはここだけだが、ここが一番重要である。
]

#corollary[
  $upright("ZFC")$ が無矛盾なら、$upright("ZFC")$ から到達不能基数の存在は証明できない。
]<cor:inaccessible-independent>

#proof[
  証明できたとすると、@thm:inaccessible-model により $upright("ZFC")$ の中で
  $upright("ZFC")$ のモデルの存在が証明できることになり、
  $upright("ZFC")$ が自身の無矛盾性を証明してしまう。
  これは Gödel の第二不完全性定理に反する。
]

到達不能基数の上には、Mahlo 基数、可測基数、超コンパクト基数……と、
「大きな基数」の階層が延々と続いている。どれも存在は証明できず、
仮定として置くしかない。それでいて、置くと下界の問題（実数の性質など）が
きれいに決まることがある。奇妙な話だが、集合論の現代的な研究はこの辺りが主戦場である。

= 独立性へ向けて

ここまでで、宇宙の全体像と、その中の大きな基数までを見た。
残っているのは、最初に予告したまま放ってある宿題である。
なぜ $upright("CH")$ は $upright("ZFC")$ から独立なのか。

方針そのものは単純で、$upright("CH")$ が成り立つモデルと成り立たないモデルの両方を作ればよい。
そうすれば、どちらの側も証明できないことになる。

そして今回作った $V_alpha$ が、そのまま出発点になる。
階層の作り方を変えれば、別の宇宙が手に入るからだ。
$V_(alpha+1) = cal(P)(V_alpha)$ の「部分集合を全部」という乱暴な一手を
「定義できるものだけ」に絞れば、痩せた宇宙 $L$ が得られる。
そこでは選択公理も一般連続体仮説も成り立つ。

逆に、モデルに新しい集合を足して太らせることもできる。これが Cohen の強制法で、
実数を $aleph_2$ 本足せば $upright("CH")$ は破れる。

どちらの構成にも、この回で用意した道具が要る。$L$ の議論では反映原理と
Löwenheim--Skolem が、強制法では基数と共終数の保存、
つまり @thm:koenig や @prop:cf の周辺が効いてくる。

順序としては次の三段構えになる。

+ #link("/math/set-theory/7")[第 7 回]：モデルの中と外で何が食い違うのか（絶対性）
+ #link("/math/set-theory/8")[第 8 回]：宇宙を痩せさせる（構成可能宇宙 $L$）
+ #link("/math/set-theory/9")[第 9 回]と#link("/math/set-theory/10")[第 10 回]：宇宙を太らせる（強制法と $upright("CH")$ の独立性）

まずは、モデルの中の住人に何が見えているのかを整理するところからである。
