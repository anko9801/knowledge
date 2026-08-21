#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "群を行列として見る",
  date: "2026-08-21",
  field: "math",
  series: "groups",
  order: 2,
  tags: ("群と表現",),
  summary: "群の作用を線形にすると、空間が既約な部分に一意に分かれる。分かれ方は指標という一つの関数で決まり、指標は互いに直交する。積分がゼロになるかどうかが、それだけで判定できる。",
  provides: (
    "representation",
    "irreducible-representation",
    "schur-lemma",
    "character-theory",
    "orthogonality-relations",
  ),
)

= 作用を線形にする

#link("/math/groups/1")[前回]、群が集合に作用することを定義した。
作用する先をベクトル空間にし、作用を線形写像に限る。それだけで話が一変する。

#definition[
  群 $G$ からベクトル空間 $V$ の可逆線形写像の群への準同型
  $ rho : G arrow.long "GL"(V) $
  を#strong[表現]と呼ぶ。$dim V$ をその#strong[次元]という。
]<def:representation>

準同型であること $rho(g h) = rho(g) rho(h)$ が全部である。
#strong[群の掛け算が、行列の掛け算になる。]

#example[表現の例][
  + #strong[自明表現。] $rho(g) = 1$。すべての群にある
  + #strong[正則表現。] 有限群 $G$ に対し $V = CC^abs(G)$ を取り、$G$ が自分自身を並べ替える
  + $upright("SO")(3)$ の $RR^3$ への自然な作用
  + $upright("SU")(2)$ の $CC^2$ への作用（スピン $1\/2$）
  + 対称群 $S_n$ の、$n$ 個の座標を入れ替える作用
]

なぜ線形にするのか。#strong[線形代数の道具が全部使えるようになる]からである。
とくに「空間を部分空間に分ける」という操作が効く。

= 既約分解

#definition[
  $rho(g) W subset W$ がすべての $g$ で成り立つ部分空間 $W$ を#strong[不変部分空間]という。
  $0$ と $V$ 以外に不変部分空間が無い表現を#strong[既約]と呼ぶ。
]<def:irreducible>

#theorem("Maschke")[
  有限群（あるいはコンパクト Lie 群）の表現は、既約表現の直和に分解する。
]<thm:maschke>

#proof[
  不変部分空間 $W$ があったとき、不変な補空間を作ればよい。
  任意の内積 $chevron.l dot, dot chevron.r_0$ を取り、群で平均する。
  $ chevron.l u, v chevron.r := frac(1, abs(G)) sum_(g in G) chevron.l rho(g) u, rho(g) v chevron.r_0 $
  （コンパクト Lie 群なら和を不変測度による積分に替える）。
  これは $G$ 不変な内積で、$W^perp$ が不変部分空間になる。
  次元について帰納すればよい。
]

証明の要は#strong[群で平均する]という一手である。
#link("/math/linear-algebra/7")[線形代数 第 7 回]で
「スペクトル定理が成り立つのは直交補空間が取れるから」と書いたが、
ここでも同じことが起きている。内積を作れれば、空間が安全に切れる。

#strong[有限群やコンパクト群では平均が取れる。]
だから既約分解ができる。無限群や非コンパクト群では一般に成り立たない。

= Schur の補題

既約なものどうしの間には、写像がほとんど無い。

#theorem("Schur")[
  $rho_1, rho_2$ を既約表現、$T$ を $T rho_1 (g) = rho_2 (g) T$ を満たす線形写像とする。
  + $rho_1 tilde.equiv.not rho_2$ なら $T = 0$
  + $rho_1 = rho_2$（複素数上）なら $T$ はスカラー倍
]<thm:schur>

#proof[
  $ker T$ は $rho_1$ の不変部分空間、$upright("im") T$ は $rho_2$ の不変部分空間である
  （交換関係から直ちに従う）。既約性より、それぞれ $0$ か全体しかない。
  $T != 0$ なら $ker T = 0$、$upright("im") T = V_2$ で同型になる。これが 1。

  2 は、$CC$ 上なら $T$ が固有値 $lambda$ を持つので、$T - lambda I$ も交換関係を満たし、
  核が $0$ でないから 1 より $T - lambda I = 0$。
]

短いが、この補題が以下すべてを支える。
#strong[「既約なものは、それ自身の定数倍としか可換でない」]という主張である。

= 指標

表現を分類したいが、行列そのものは基底の取り方に依る。
基底に依らない量を取り出す。

#definition[
  $ chi_rho (g) := upright("tr") rho(g) $
  を表現 $rho$ の#strong[指標]と呼ぶ。
]<def:character>

#link("/math/linear-algebra/3")[線形代数 第 3 回]で見たとおり、
跡は縮約なので基底に依らない。さらに
$ chi_rho (h g h^(-1)) = chi_rho (g) $
なので、#strong[共役類の上で一定]である。関数としては共役類の個数ぶんしか自由度がない。

そして、この関数が表現をすべて決めてしまう。

#theorem("指標の直交関係")[
  既約表現の指標について
  $ chevron.l chi_1, chi_2 chevron.r := frac(1, abs(G)) sum_(g in G) chi_1 (g)^* thin chi_2 (g)
    = cases(1 & (rho_1 tilde.equiv rho_2), 0 & (upright("それ以外"))) $
  （$z^*$ は複素共役）
  すなわち、既約指標は#strong[正規直交系をなす]。
]<thm:orthogonality>

#proof[
  任意の線形写像 $A$ に対し $T := frac(1, abs(G)) sum_g rho_2 (g) A rho_1 (g)^(-1)$ を作ると、
  これは @thm:schur の交換関係を満たす。
  よって $T = 0$ かスカラー倍で、その跡を計算すると主張の式になる。
]

#strong[Schur の補題を、平均を取って使っただけ]である。

系として、扱いやすい判定法が並ぶ。

#corollary[
  + 表現 $rho$ が既約 $arrow.l.r.double$ $chevron.l chi_rho, chi_rho chevron.r = 1$
  + $rho = plus.o.big_i m_i rho_i$ と分解したとき、重複度は $m_i = chevron.l chi_i, chi_rho chevron.r$
  + 既約表現の個数 $=$ 共役類の個数
]<cor:character>

#strong[表現の分解が、内積の計算に落ちた。]
行列を扱う必要はなく、共役類ごとの数値を並べた表（指標表）だけで済む。

= 積分がゼロになるかどうか

指標の直交関係には、実用上いちばん効く帰結がある。

#corollary[
  $G$ 不変な操作で作った量が $0$ でないためには、
  関わる表現のテンソル積に#strong[自明表現が含まれていなければならない]。
]<cor:selection>

理由は簡単である。$G$ で平均する操作は、自明表現への射影にほかならない。
自明表現の成分が無ければ、平均は $0$ になる。

#example[選択則][
  分子の対称性の群を $G$、始状態と終状態の属する既約表現を $rho_i$、$rho_f$、
  遷移を起こす演算子の属する表現を $rho_o$ とする。

  遷移の大きさは $integral psi_f^* hat(O) psi_i$ の形の積分で、
  これが $0$ にならないためには
  $ rho_f^* times.o rho_o times.o rho_i supset upright("自明表現") $
  が必要である。@cor:character の 2 で重複度を計算すれば、
  #strong[積分を一切実行せずに判定できる]。

  「この遷移は対称性から禁制である」という言明は、この計算のことである。
]

積分の値ではなく、#strong[$0$ かどうかだけ]なら群論で決まる。
値を知るには実際に計算するしかないが、多くの場面では $0$ かどうかで十分である。

#check[
  @cor:selection は「この遷移は起きない」と言い切れるのに、
  「この遷移は起きる」とは言えない。#strong[非対称はどこから来るのか。]
][
  自明表現が#strong[含まれないこと]は積分が $0$ である十分条件だが、
  含まれることは $0$ でないことを保証しないからである。

  群論が答えているのは「対称性だけを理由に消えるか」であって、
  対称性以外の理由——波動関数の重なりがたまたま打ち消す、係数が小さい——で
  $0$ に近くなる可能性は残る。

  だから禁制則は#strong[片側だけの道具]である。禁制と出れば起きないと言い切れ、
  許容と出れば「対称性は邪魔していない」までしか言えない。
  積分を実行せずに済むのは前者だけで、そこが効くから使われている。
]

#remark[
  同じ構造が量子力学にもある。
  Hamiltonian が $G$ で不変なら、固有空間は $G$ の表現になる。
  既約分解が固有値の縮退の構造を与え、
  摂動で縮退がどう解けるかも、部分群への制限で決まる。

  角運動量の合成則（Clebsch--Gordan 係数）は、
  $upright("SU")(2)$ の既約表現のテンソル積を既約分解したものにほかならない。
]

= まとめ

#table(
  columns: (auto, 1fr),
  [表現], [群の掛け算を、行列の掛け算にする],
  [既約分解], [群で平均して内積を作る。有限群・コンパクト群でできる],
  [Schur], [既約なものはスカラー倍としか可換でない],
  [指標], [跡。基底に依らず、共役類の上で一定],
  [直交関係], [既約指標が正規直交系。分解が内積計算になる],
  [選択則], [自明表現を含むかどうかで、積分の消滅が決まる],
)

無限個の元を持つ群が、前回は有限次元の Lie 代数に落ちた。
今回は、表現の分類が有限個の数値の表に落ちた。

#strong[対称性を仮定すると、計算せずに分かることが増える。]
これが群を持ち出す理由である。
