#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "連続体仮説の独立性",
  date: "2026-08-17",
  field: "math",
  series: "set-theory",
  order: 10,
  tags: ("集合論",),
  summary: "実数を ℵ₂ 本足しても基数が壊れないことを示す。Δ-システム補題から ccc を経て、Cohen の定理へ。",
)

#let ON = $upright(sans("On"))$
#let card(x) = $lr(|#x|)$
#let val = math.op("val")
#let Fn = math.op("Fn")
#let dom = math.op("dom")
#let cf = math.op("cf")

= 作戦

道具は#link("/math/set-theory/9")[第 9 回]で揃った。$upright("CH")$ を破るには、
実数を $aleph_2$ 本以上にすればよい。作戦はこうなる。

+ 可算推移モデル $M ⊨ upright("ZFC")$ を取る。
+ 実数を $aleph_2^M$ 本足す強制概念 $bb(P)$ を設計する。
+ 生成的 $G$ を取って $M[G]$ を作る。
+ $M[G]$ で $2^(aleph_0) >= aleph_2$ を示す。

3 まではもう分かっている。落とし穴は 4 にある。

$M[G]$ に $aleph_2^M$ 本の実数があったとしても、それだけでは $upright("CH")$ は破れない。
$M[G]$ の中で $aleph_2^M$ が $aleph_2$ のままである保証がないからだ。
新しい全単射が付け足されて、$aleph_2^M$ が $M[G]$ から見ると可算になっていた、
ということが実際に起こり得る。これを#strong[基数の崩壊]という。

#link("/math/set-theory/7")[第 7 回]で見たとおり、「$kappa$ は基数」は $Pi_1$ で下向きにしか絶対でない。
広い世界で基数なら狭い世界でも基数だが、逆はない。$M[G]$ は $M$ より広いので、
まさに危ない方向である。

というわけで、今回の実質的な仕事は「基数を壊さない」ことの証明になる。

= 実数を足す

#definition[
  集合 $I$ に対し
  $ Fn(I, 2) := \{ p : p upright("は") I upright("から") \{0,1\} upright("への有限部分関数") \} $
  とし、$p <= q :<=> p supset.eq q$ で順序を入れる。
]<def:Fn>

$M$ の中で $I := omega_2^M times omega$ と取る。条件は
「$aleph_2$ 本の実数のうち、有限個の桁を指定したもの」である。

$G$ を生成的とし、$f := union.big G$ とおく。

#proposition[
  $f$ は $I$ 全体で定義された関数であり、
  $ a_alpha := \{ n < omega : f(alpha, n) = 1 \} quad (alpha < omega_2^M) $
  は互いに相異なる $omega$ の部分集合である。
]<prop:reals>

#proof[
  $G$ はフィルターなので、その要素は両立し、和 $f$ は関数になる。

  定義域が $I$ 全体であること。$⟨alpha, n⟩ in I$ に対し
  $ D_(alpha, n) := \{ p : ⟨alpha, n⟩ in dom p \} $
  は稠密である（未定義なら値を決めればよい）。$D_(alpha, n) in M$ なので $G$ と交わり、
  したがって $f$ は $⟨alpha, n⟩$ で定義されている。

  相異なること。$alpha != beta$ に対し
  $ E_(alpha, beta) := \{ p : exists n med (⟨alpha, n⟩, ⟨beta, n⟩ in dom p
      and p(alpha, n) != p(beta, n)) \} $
  が稠密であることを見る。任意の $p$ を取ると $dom p$ は有限なので、
  まだ使っていない $n$ が取れる。そこで $p$ に
  $p(alpha, n) = 0$、$p(beta, n) = 1$ を付け足せば $E_(alpha, beta)$ に入る。
  $E_(alpha, beta) in M$ より $G$ と交わるので、$a_alpha != a_beta$ である。
]

これで $M[G]$ には少なくとも $aleph_2^M$ 本の実数がある。
あとは $aleph_2^M$ が $M[G]$ でも $aleph_2$ であることを示せばよい。

= Δ-システム補題

基数保存の証明には、組合せ論の補題が要る。有限集合がたくさんあると、
そのうちのたくさんが「同じ芯を共有して、外側は互いに交わらない」形に揃う、という主張である。

#definition[
  集合族 $cal(A)$ が根 $r$ の#strong[Δ-システム]であるとは、
  相異なる任意の $A, B in cal(A)$ について $A inter B = r$ が成り立つことをいう。
]<def:delta-system>

#theorem("Δ-システム補題")[
  $cal(A)$ を非可算個の有限集合からなる族とすると、
  $cal(A)$ の非可算な部分族で Δ-システムになるものが存在する。
]<thm:delta-system>

#proof[
  要素数で分類すると、鳩の巣原理により、ある $n$ について
  「要素数 $n$ の元」が非可算個ある。そこで最初から $card(cal(A)) = aleph_1$ で、
  すべての元の要素数が $n$ であるとしてよい。$n$ についての帰納法で示す。

  $n = 1$ のときは、元がすべて一点集合なので、非可算個は互いに交わらない。
  根 $nothing$ の Δ-システムである。

  $n > 1$ とする。二つの場合に分ける。

  #strong[場合 1]：ある $x$ が非可算個の $A in cal(A)$ に属する。
  そのような $A$ を集めた族から $x$ を除くと、要素数 $n-1$ の非可算族が得られる。
  帰納法の仮定より根 $r$ の非可算な Δ-システムが取れるので、
  $x$ を戻せば根 $r union \{x\}$ の Δ-システムになる。

  #strong[場合 2]：どの $x$ も可算個の $A in cal(A)$ にしか属さない。
  このとき互いに交わらない非可算部分族を、長さ $omega_1$ の超限再帰で作る。
  $alpha < omega_1$ の段階で、すでに選んだ $\{A_xi : xi < alpha\}$ は可算個であり、
  その和 $S := union.big_(xi < alpha) A_xi$ は可算集合である。
  場合 2 の仮定より、$S$ の各点を含む $cal(A)$ の元は可算個しかないので、
  $S$ と交わる $cal(A)$ の元は全部合わせても可算個である。
  $card(cal(A)) = aleph_1$ だから、$S$ と交わらない元が残っており、それを $A_alpha$ とする。
  こうして得た $\{A_alpha : alpha < omega_1\}$ は根 $nothing$ の Δ-システムである。
]

場合 2 の再帰では、各段階で「まだ非可算個残っている」ことを使っている。
$aleph_1$ が正則基数であること（#link("/math/set-theory/6")[第 6 回]）が、
ここで静かに効いている。

= 可算鎖条件

#definition[
  $bb(P)$ の部分集合 $A$ が#strong[反鎖]であるとは、
  $A$ の相異なる二つの要素が常に両立しないことをいう。
  $bb(P)$ の反鎖がすべて可算であるとき、$bb(P)$ は#strong[可算鎖条件]（ccc）を満たすという。
]<def:ccc>

#theorem[
  任意の $I$ について $Fn(I, 2)$ は ccc を満たす。
]<thm:Fn-ccc>

#proof[
  非可算な反鎖 $\{p_alpha : alpha < omega_1\}$ があったとする。
  定義域 $dom p_alpha$ は有限集合なので、@thm:delta-system より、
  非可算な部分族で $\{dom p_alpha\}$ が根 $r$ の Δ-システムになるものが取れる。

  $r$ は有限集合だから、$r$ から $\{0, 1\}$ への関数は有限個しかない。
  非可算個の $p_alpha$ があるので、鳩の巣原理より、そのうち二つ $p_alpha, p_beta$ は
  $r$ の上で一致する。

  このとき $p_alpha union p_beta$ は関数である。
  $r$ の外では定義域が交わらず、$r$ の上では値が一致しているからだ。
  よって $p_alpha$ と $p_beta$ は両立し、反鎖であることに矛盾する。
]

証明の形が気持ちよい。「両立しない条件を非可算個は並べられない」ことを、
Δ-システム補題が要求する「芯を共有する」構造から導いている。

= ccc なら基数は壊れない

#lemma[
  $bb(P)$ が $M$ で ccc を満たすとする。$M[G]$ の中の関数 $f : alpha -> beta$
  （$alpha, beta$ は $M$ の順序数）に対し、$M$ に属する関数 $F$ であって
  $ forall xi < alpha med (f(xi) in F(xi)) quad upright("かつ") quad
    forall xi < alpha med (card(F(xi))^M <= aleph_0) $
  を満たすものが存在する。
]<lem:ccc-cover>

#proof[
  $f = val(tau, G)$ となる名前 $tau in M$ を取り、
  $p_0 in G$ が「$tau$ は $alpha$ から $beta$ への関数」を強制するとしてよい。$M$ の中で
  $ F(xi) := \{ eta < beta : exists p <= p_0 med (p ⊩ tau(caron(xi)) = caron(eta)) \} $
  と定める。定義可能性補題（#link("/math/set-theory/9")[第 9 回]）より、これは $M$ の中で定義できる。

  $F(xi)$ が可算であることを示す。相異なる $eta, eta' in F(xi)$ の証人 $p, q$ が両立したとすると、
  共通の下界 $s$ は $tau(caron(xi)) = caron(eta)$ と $tau(caron(xi)) = caron(eta')$ を同時に強制する。
  $s$ を含む生成的フィルターを取れば $M[G']$ で $eta = eta'$ となり矛盾する。
  よって証人たちは互いに両立せず、反鎖をなす。ccc よりこれは可算なので、$F(xi)$ も可算である。

  最後に $f(xi) in F(xi)$ は真理補題から従う。$f(xi) = eta$ なら、
  それを強制する条件が $G$ の中にあるからだ。
]

「値そのものは分からないが、候補を可算個に絞り込むことはできる」というのが要点である。
$M$ の住人は $f$ を見られないのに、$f$ の値の候補表 $F$ を作れてしまう。

#theorem[
  $bb(P)$ が $M$ で ccc を満たすならば、$M$ の基数は $M[G]$ でも基数であり、
  共終数も保たれる。
]<thm:ccc-preserves>

#proof[
  $beta$ を $M$ の基数とし、$M[G]$ では基数でないと仮定する。
  すると $M[G]$ に全射 $f : alpha -> beta$ が存在する（$alpha < beta$ はある基数）。

  @lem:ccc-cover により $F in M$ が取れる。$f$ が全射なので
  $ beta = union.big_(xi < alpha) F(xi) $
  であり、右辺は $M$ の中で計算すると濃度が高々 $card(alpha) dot aleph_0 < beta$ である
  （#link("/math/set-theory/4")[第 4 回]の基数算術）。
  $beta$ が $M$ の基数であることに矛盾する。

  共終数についても同様で、$alpha < cf(beta)^M$ からの共終写像があれば、
  同じ議論で $M$ の中に共終な可算和が作れてしまう。
]

これで安全が確認できた。ccc を満たす強制概念は、基数の目盛りをまったく動かさない。
$Fn(I, 2)$ は ccc だったので、実数をいくら足しても $aleph_1, aleph_2, dots$ はそのままである。

= Cohen の定理

#theorem("Cohen")[
  $upright("ZFC")$ が無矛盾ならば、$upright("ZFC") + not upright("CH")$ も無矛盾である。
]<thm:cohen>

#proof[
  $M$ を $upright("ZFC")$ の可算推移モデル、$bb(P) := Fn(omega_2^M times omega, 2)^M$、
  $G$ を $M$ 上生成的なフィルターとする。

  #link("/math/set-theory/9")[第 9 回]より $M[G] ⊨ upright("ZFC")$ である。

  @thm:Fn-ccc と @thm:ccc-preserves より、$M$ の基数はすべて $M[G]$ の基数である。
  とくに $omega_2^M = omega_2^(M[G])$ である。

  @prop:reals より、$M[G]$ には相異なる実数 $a_alpha$（$alpha < omega_2^M$）がある。
  よって $M[G]$ の中で
  $ 2^(aleph_0) >= aleph_2 > aleph_1 $
  が成り立ち、$upright("CH")$ は成り立たない。
]

#link("/math/set-theory/8")[第 8 回]の $L$ と合わせると、これで決着である。

$ upright("Con")(upright("ZFC")) => upright("Con")(upright("ZFC") + upright("CH")) quad upright("かつ") quad
  upright("Con")(upright("ZFC")) => upright("Con")(upright("ZFC") + not upright("CH")) $

$upright("CH")$ は $upright("ZFC")$ から独立である。

#remark[
  上では $2^(aleph_0) >= aleph_2$ しか示していないが、
  $M ⊨ upright("GCH")$ を仮定すれば $M[G] ⊨ 2^(aleph_0) = aleph_2$ が言える。
  $omega$ の部分集合の名前を数えればよい。
  各名前は「反鎖の可算列」の形に標準化でき、ccc より反鎖は可算、
  $card(bb(P)) = aleph_2$ なので、そのような名前は高々
  $(aleph_2^(aleph_0))^(aleph_0) = aleph_2$ 個しかない。
  つまり $M[G]$ の実数は $aleph_2$ 本ぴったりになる。

  同じ要領で $bb(P)$ を $Fn(omega_(17) times omega, 2)$ に取り替えれば
  $2^(aleph_0) = aleph_(17)$ のモデルが作れる。
  König の定理（#link("/math/set-theory/6")[第 6 回]）の制約
  $cf(2^(aleph_0)) > aleph_0$ に反しない限り、連続体の大きさは何にでもできる。
]

= それで、$upright("CH")$ は真なのか

独立性が示されたあと、集合論は二手に分かれた。

一方は、それで終わりだとする立場である。$upright("CH")$ は $upright("ZFC")$ という枠の中では
真でも偽でもない。ちょうど平行線公理が、絶対幾何の中では真でも偽でもないのと同じことだ。
ユークリッド幾何と非ユークリッド幾何が両方あるように、
$upright("CH")$ の成り立つ宇宙と成り立たない宇宙が両方ある、と考える。

他方は、まだ終わっていないとする立場である。$upright("ZFC")$ が
決めきれていないだけであって、正しい公理を足せば決まるはずだ、と考える。
Gödel 自身がこちらだった。$upright("CH")$ の真偽は決まっているが、
我々の公理が足りないので見えていない、というわけである。

後者の立場から、多くの候補が検討されてきた。大きな基数の公理、
決定性公理、Martin の公理、強制公理。どれも $upright("CH")$ に何らかの態度を取る。
Woodin は $upright("CH")$ が偽（$2^(aleph_0) = aleph_2$）だと主張する議論を組み立て、
その後に立場を変えたことでも知られている。決着はついていない。

私は、この状況そのものが集合論の一番面白いところだと思っている。
「集合とは何か」を定義しないところから始めた話が、
最後には「どんな宇宙を選びたいか」という問いに行き着く。
公理は発見するものなのか、それとも設計するものなのか。
$upright("CH")$ は、その問いを一番きれいな形で突きつけてくる。

= シリーズを終えて

第 1 回から通してやってきたことを、並べておく。

#table(
  columns: (auto, 1fr),
  [1--2], [逆理から公理へ。関係も関数も順序も、すべて集合として組み立てた],
  [3--4], [順序数で順番を測り、基数で大きさを測った],
  [5], [選択公理が Zorn の補題や整列可能定理と同じものだと分かった],
  [6], [宇宙を階層に整理し、共終数と大きな基数を見た],
  [7--8], [モデルの中と外を区別し、痩せた宇宙 $L$ を彫り出した],
  [9--10], [名前を使って宇宙を太らせ、$upright("CH")$ の独立性を証明した],
  [補遺], [強制関係を $M$ の中で定義し直し、真理補題を証明した（#link("/math/set-theory/11")[第 11 回]）],
)

ここから先は、たとえば反復強制法と Martin の公理、記述集合論と決定性、
大きな基数の階層、内部モデル理論といった方向へ道が伸びている。
どれも、今回作った道具の上に立っている。

集合論を始めたときに「大きすぎる集まりを集合として扱うな」と言われて、
ずいぶん窮屈な話だと思った人もいるだろう。だが最後まで来てみると、
あの制限こそが、宇宙を複数作って比べるという遊びを可能にしていたことが分かる。
何を作ってよいかを決めたからこそ、作り方を変えた宇宙を比較できるようになったのだ。
