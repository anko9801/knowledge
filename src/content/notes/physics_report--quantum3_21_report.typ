#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "量子力学 III 複数の同一粒子からなる量子系：発展編 (第二量子化)",
  date: "2026-08-18",
  tags: ("レポート",),
  summary: "physics_report/quantum3_21_report.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

<table:data_type>

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([問題番号], [正誤],),
    table.hline(),
    [Q21-1.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii) (ix) (x)],
    [Q21-2.], [(i) (ii)],
    [Q21-3.], [(i) (ii) (iii) (iv)],
    [Q21-4.], [],
    [Q21-5.], [(i) (ii)],
    [Q21-6.], [(i) (ii)],
    [Q21-7.], [(i) (ii)],
    [Q21-8.], [(i) (ii) (iii)],
    [Q21-9.], [(i) (ii)],
    [Q21-10.], [(i) (ii)],
    [Q21-11.], [(i) (ii) (iii) (iv)],
    [Q21-12.], [(i) (ii)],
    [Q21-13.], [(i) (ii)],
    [Q21-14.], [(i) (ii) (iii) (iv) (v)],
    [Q21-15.], [(i) (ii)],
    [Q21-16.], [(i) (ii)],
    [Q21-17.], [(i) (ii)],
    [Q21-18.], [(i) (ii)],
    [Q21-19.], [(i) (ii)],
    [Q21-20.], [(i) (ii) (iii) (iv) (v) (vi)],
    [Q21-21.], [(i) (ii) (iii) (iv) (v)],
    [Q21-22.], [(i) (ii) (iii) (iv)],
    [Q21-23.], [(i) (ii) (iii) (iv)],
    [Q21-24.], [(i) (ii)],
    [Q21-25.], [(i) (ii)],
    [Q21-26.], [(i) (ii) (iii)],
    [Q21-27.], [(i) (ii) (iii)],
    [Q21-28.], [],
    [Q21-29.], [],
    [Q21-30.], [],
    [Q21-31.], [],
    [Q21-32.], [],
    [Q21-33.], [],
    [Q21-34.], [],
    [Q21-35.], [],
    [Q21-36.], [],
    [Q21-37.], [(i) (ii) (iii) (iv) (v) (vi) (vii)],
    [Q21-38.], [(i) (ii)],
    [Q21-39.], [(i) (ii) (iii) (iv)],
  )]
  , caption: [正誤表]
  , kind: table
  )

] 


#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([問題番号], [正誤],),
    table.hline(),
    [Q21-40.], [(i) (ii)],
    [Q21-41.], [(i) (ii) (iii)],
    [Q21-42.], [],
    [Q21-43.], [],
    [Q21-44.], [],
    [Q21-45.], [],
    [Q21-46.], [],
    [Q21-47.], [],
    [Q21-48.], [],
    [Q21-49.], [(i) (ii) (iii)],
    [Q21-50.], [],
    [Q21-51.], [],
    [Q21-52.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii) (ix) (x) (xi)
    (xii) (xiii) (xiv)],
    [], [(xv) (xvi) (xvii) (xviii) (xix) (xx)],
    [Q21-53.], [(i) (ii)],
    [Q21-54.], [(i) (ii) (iii) (iv)],
    [Q21-55.], [(i) (ii)],
    [Q21-56.], [(i) (ii) (iii) (iv) (v) (vi)],
    [Q21-57.], [(i) (ii) (iii)],
    [Q21-58.], [],
    [Q21-59.], [],
    [Q21-60.], [],
    [Q21-61.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii)],
    [Q21-62.], [],
    [Q21-63.], [(i) (ii) (iii)],
    [Q21-64.], [(i) (ii) (iii)],
    [Q21-65.], [(i) (ii) (iii)],
    [Q21-66.], [(i) (ii)],
    [Q21-67.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii) (ix) (x) (xi)
    (xii) (xiii) (xiv)],
    [], [(xv) (xvi)],
    [Q21-68.], [],
    [Q21-69.], [(i) (ii) (iii) (iv)],
    [Q21-70.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii)],
    [Q21-71.], [(i) (ii) (iii)],
    [Q21-72.], [(i) (ii) (iii)],
    [Q21-73.], [(i) (ii) (iii)],
    [Q21-74.], [(i) (ii)],
  )]
  , caption: [正誤表]
  , kind: table
  )

] 


#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (left,left,),
    table.header([問題番号], [正誤],),
    table.hline(),
    [Q21-75.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii) (ix) (x) (xi)
    (xii) (xiii) (xiv)],
    [], [(xv) (xvi)],
    [Q21-76.], [],
    [Q21-77.], [(i) (ii) (iii) (iv)],
    [Q21-78.], [],
    [Q21-79.], [(i) (ii) (iii) (iv)],
    [Q21-80.], [],
    [Q21-81.], [(i) (ii)],
    [Q21-82.], [],
    [Q21-83.], [],
    [Q21-84.], [],
    [Q21-85.], [(i) (ii)],
    [Q21-86.], [(i) (ii) (iii) (iv) (v) (vi)],
    [Q21-87.], [],
    [Q21-88.], [],
    [Q21-89.], [(i) (ii)],
    [Q21-90.], [],
    [Q21-91.], [(i) (ii) (iii) (iv)],
    [Q21-92.], [],
    [Q21-93.], [],
    [Q21-94.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii) (ix) (x) (xi)
    (xii) (xiii) (xiv)],
    [], [(xv) (xvi) (xvii) (xviii) (xix) (xx) (xxi) (xxii) (xxiii)
    (xxiv) (xxv) (xxvi)],
    [], [(xxvii) (xxviii)],
    [Q21-95.], [(i) (ii) (iii) (iv) (v) (vi)],
    [Q21-96.], [],
    [Q21-97.], [(i) (ii) (iii) (iv)],
    [Q21-98.], [(i) (ii) (iii) (iv)],
    [Q21-99.], [(i) (ii)],
    [Q21-100.], [],
    [Q21-101.], [(i) (ii) (iii) (iv)],
    [Q21-102.], [(i) (ii) (iii) (iv) (v) (vi) (vii) (viii) (ix) (x) (xi)
    (xii)],
  )]
  , caption: [正誤表]
  , kind: table
  )

] 
このレポートでは複数の同一粒子系におけるさまざまな表現を導入することを目的とする.

= もし、量子状態の対称化の要請がなかったら？
<もし量子状態の対称化の要請がなかったら>
量子に関する実験を進めていくと複数の同一粒子はどうしても区別できないことが分かってきた.
これを理論へ組み込む為に物理学者は「いかなる粒子状態は粒子交換に関して不変である」という論理の飛躍を用いて説明した.
$  & upright("複数の同一粒子は区別できない.")\
arrow.l.r.double & upright("いかなる観測量の期待値は粒子交換に関して不変である.")\
arrow.l.double.long & upright("いかなる粒子状態は粒子交換に関して不変である.") $
この要請を「対称化の要請」と呼ぶ.
ここでは対称化の要請をせずに複数の同一粒子を区別できないという事実だけで導けることを考える.

#block[
#definition("複数の同一粒子系における Hilbert 空間")[
1 粒子状態の Hilbert 空間 $cal(H)_(s i n g l e)$ に対して $N$
個の粒子の粒子状態の Hilbert 空間はテンソル積
$cal(H)^(\( N \)) tilde.equiv cal(H)_(s i n g l e) times.o dots.h.c times.o cal(H)_(s i n g l e)$
で表現される. そして $cal(H)^(\( N \))$ の粒子状態は
$\|psi_1⟩ dots.h.c \|psi_N⟩ in cal(H)^(\( N \))$ と書き,
定数倍は同一視する. また
$\|psi_1⟩ dots.h.c \|psi_N⟩ \, \|psi_(1')⟩ dots.h.c \|psi_(N')⟩$
の内積は次のように定義する.
$ \( ⟨psi_1\| dots.h.c ⟨psi_N\| \) dot.op \( \|psi_(1')⟩ dots.h.c \|psi_(N')⟩ \) = ⟨psi_1 mid(bar.v) psi_(1')⟩ dots.h.c ⟨psi_N mid(bar.v) psi_(N')⟩ . $
]
]
異なる 1 粒子状態 $\|alpha⟩ \, \|beta⟩ in cal(H)_(s i n g l e)$
を持つ粒子による 2 つの粒子系
$cal(H)^(\( 2 \)) tilde.equiv cal(H)_(s i n g l e) times.o cal(H)_(s i n g l e)$
において次の 2 つを仮定する.

+ 2 つの粒子は区別できない.

+ 粒子の 1 個が $\|alpha⟩ in cal(H)_(s i n g l e)$ となり, もう 1 個は
  $\|beta⟩ in cal(H)_(s i n g l e)$ となる. (これを仮定 $D$ とおく)

これらの条件は次のように言い換えられる.

+ いかなる観測量の期待値は粒子交換に関して不変である.

+ 任意の粒子状態 $\|Psi⟩$ は
  $\|alpha⟩ \|beta⟩ \, \|beta⟩ \|alpha⟩ in cal(H)^(\( 2 \))$
  の重ね合わせにより表現できる.

粒子状態については規格化条件を用いて次のように表現できる.
$ \|Psi⟩ & = c_1 \|alpha⟩ \|beta⟩ + c_2 \|beta⟩ \|alpha⟩ #h(2em) \( c_1 \, c_2 in bb(C) \, \| c_1 \|^2 + \| c_2 \|^2 = 1 \) . $
今後の為に粒子交換を表す演算子を定義しておく.

#block[
#definition("交換演算子")[
Hilbert 空間
$cal(H)^(\( 2 \))$ において交換演算子 (exchange operator) $hat(E)$
を次のように定義する. $ hat(E) \|psi⟩ \|psi'⟩ & = \|psi'⟩ \|psi⟩ . $
]
]
#block[
#strong[問題 3] (Q21-1(i)). \

粒子が区別できないならば粒子状態を区別できないとは示せないが,
ここでは粒子状態を区別できないと仮定する. このとき粒子状態
$\|Psi⟩ in cal(H)^(\( 2 \))$
は粒子を交換しても不変であるから位相を考慮して次の式が成り立つ.
$ \|Psi⟩ & = hat(E) \|Psi⟩ arrow.l.r.double c_1 \|alpha⟩ \|beta⟩ + c_2 \|beta⟩ \|alpha⟩ = c_1 \|beta⟩ \|alpha⟩ + c_2 \|alpha⟩ \|beta⟩ arrow.l.r.double c_1 = plus.minus c_2 . $
よって粒子状態は次のようになる.
$ \|Psi⟩ & = 1 / sqrt(2) \( \|alpha⟩ \|beta⟩ plus.minus \|beta⟩ \|alpha⟩ \) . $
これより粒子状態を区別できないならば係数に対して条件を足さなければならないことが分かる.

] <Q21-1-i>
#block[
#proposition("Q21-1(ii)")[
粒子状態
$\|Psi_S⟩ \, \|Psi_A⟩$ を次のように定義する.
$ {\|Psi_S⟩ = 1 / sqrt(2) \( \|alpha⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \)\
\|Psi_A⟩ = 1 / sqrt(2) \( \|alpha⟩ \|beta⟩ - \|beta⟩ \|alpha⟩ \) . $
このとき $D$ を満たす任意の粒子状態 $\|Psi⟩ in cal(H)^(\( 2 \))$
は次のように表現される. $ \|Psi⟩ = c_S \|Psi_S⟩ + c_A \|Psi_A⟩ . $
]

]
#proof[
$D$ を満たす任意の粒子状態
$\|Psi⟩ in cal(H)^(\( 2 \))$ は次のように書ける.
$ \|Psi⟩ & = c_1 \|alpha⟩ \|beta⟩ + c_2 \|beta⟩ \|alpha⟩\
 & = frac(c_1 + c_2, 2) \( \|alpha⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \) + frac(c_1 - c_2, 2) \( \|alpha⟩ \|beta⟩ - \|beta⟩ \|alpha⟩ \)\
 & = frac(c_1 + c_2, sqrt(2)) \|Psi_S⟩ + frac(c_1 - c_2, sqrt(2)) \|Psi_A⟩ . $
よって次のように係数をおくことで $\|Psi⟩$ は
$\|alpha⟩ \|beta⟩ \, \|beta⟩ \|alpha⟩$ と $\|Psi_S⟩ \, \|Psi_A⟩$
のそれぞれの重ね合わせが同値な表現となることがわかる.
$ c_S & = frac(c_1 + c_2, sqrt(2)) \, quad c_A = frac(c_1 - c_2, sqrt(2))\
c_1 & = frac(c_S + c_A, sqrt(2)) \, quad c_2 = frac(c_S - c_A, sqrt(2)) . $
]

#block[
#proposition("Q21-1(iii)(iv)(v)")[
交換演算子について次の性質が認められる.
$  & hat(E) = hat(E)^dagger = hat(E)^(- 1) \, quad hat(E)^2 = hat(1)\
 & hat(E) \|Psi⟩ = c_S \|Psi_S⟩ - c_A \|Psi_A⟩ . $
]

]
#proof[
まず粒子状態
$\|psi⟩ \|psi'⟩ = \|alpha⟩ \|beta⟩ \, \|beta⟩ \|alpha⟩$ に対して演算子
$hat(E)^(- 1) \, hat(E)^dagger$ を適用する.
$ hat(E)^(- 1) \|psi⟩ \|psi'⟩ & = hat(E)^(- 1) hat(E) \|psi'⟩ \|psi⟩ = \|psi'⟩ \|psi⟩\
⟨psi\| ⟨psi'\| hat(E)^dagger hat(E) \|psi⟩ \|psi'⟩ & = ⟨psi'\| ⟨psi mid(bar.v) psi'⟩ \|psi⟩ = ⟨psi\| ⟨psi' mid(bar.v) psi⟩ \|psi'⟩ . $
これより次のことが分かる.
$ hat(E) & = hat(E)^dagger = hat(E)^(- 1) \, #h(2em) hat(E)^2 = hat(E) hat(E)^(- 1) = hat(1) . $
次に粒子状態 $\|Psi_S⟩ \, \|Psi_A⟩$ に適用すると
$ hat(E) \|Psi_S⟩ & = 1 / sqrt(2) hat(E) \( \|alpha⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \) = + 1 / sqrt(2) \( \|alpha⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \) = + \|Psi_S⟩\
hat(E) \|Psi_A⟩ & = 1 / sqrt(2) hat(E) \( \|alpha⟩ \|beta⟩ - \|beta⟩ \|alpha⟩ \) = - 1 / sqrt(2) \( \|alpha⟩ \|beta⟩ - \|beta⟩ \|alpha⟩ \) = - \|Psi_A⟩ . $
となるから任意の状態 $\|Psi⟩$ に適用すると次のようになる.
$ hat(E) \|Psi⟩ & = hat(E) \( c_S \|Psi_S⟩ + c_A \|Psi_A⟩ \) = c_S \|Psi_S⟩ - c_A \|Psi_A⟩ . $
]

#block[
#proposition("Q21-1(vi)(vii)(viii)")[
Hilbert
空間 $cal(H)^(\( 2 \))$ の任意の観測量 $hat(O)$ について 2
つの粒子を区別できないことと次の 3 つはそれぞれ同値である.

+ 期待値 $chevron.l hat(O) chevron.r$ は粒子交換に関して不変である.

+ 観測量 $hat(O)$ は粒子交換に関して不変である. つまり
  $hat(O) = hat(E) hat(O) hat(E)$ である.

+ 観測量 $hat(O)$ と交換演算子 $hat(E)$ は可換である.
]

]
#proof[
1 から 2 を示す. 期待値について
$\|Psi⟩ arrow.r hat(E) \|Psi⟩$
と状態を変更しても不変であるから次のようになる.
$ chevron.l hat(O) chevron.r & = ⟨Psi\| hat(O) \|Psi⟩ = ⟨Psi\| hat(E)^dagger hat(O) hat(E) \|Psi⟩ = ⟨Psi\| hat(E) hat(O) hat(E) \|Psi⟩ . $
これより $hat(O) = hat(E) hat(O) hat(E)$ となり, $hat(O)$
は粒子交換に関して不変であることがわかる. 念のため
$hat(E) hat(O) hat(E)$ について
$\( hat(E) hat(O) hat(E) \)^dagger = hat(E)^dagger hat(O)^dagger hat(E)^dagger = hat(E) hat(O) hat(E)$
と計算できるから $hat(E) hat(O) hat(E)$ は Hermite
演算子となり整合性は保っている. 次に 2 から 3 を示す.
$ hat(E) hat(O) & = hat(E) hat(E) hat(O) hat(E) = hat(O) hat(E) . $
つまり $\[ hat(O) \, hat(E) \] = 0$ であるから $hat(O) \, hat(E)$
は可換である. 最後に 3 から 1 は
$hat(E)^dagger hat(O) hat(E) = hat(E)^dagger hat(E) hat(O) = hat(O)$
より成り立つ. よって全て互いに同値であることは示された.
]

#block[
#proposition("Q21-1(ix)")[
観測量 $hat(O)$ の期待値
$chevron.l hat(O) chevron.r$ について次のように書ける.
$ chevron.l hat(O) chevron.r & = \| c_S \|^2 ⟨Psi_S\| hat(O) \|Psi_S⟩ + \| c_A \|^2 ⟨Psi_A\| hat(O) \|Psi_A⟩ . $
]

]
#proof[
観測量 $hat(O)$ の期待値 $chevron.l hat(O) chevron.r$
は次のように計算できる.
$ chevron.l hat(O) chevron.r & = ⟨Psi\| hat(O) \|Psi⟩\
 & = \( c_S^(\*) ⟨Psi_S\| + c_A^(\*) ⟨Psi_A\| \) hat(O) \( c_S \|Psi_S⟩ + c_A \|Psi_A⟩ \)\
 & = \| c_S \|^2 ⟨Psi_S\| hat(O) \|Psi_S⟩ + \| c_A \|^2 ⟨Psi_A\| hat(O) \|Psi_A⟩ + c_S^(\*) c_A ⟨Psi_S\| hat(O) \|Psi_A⟩ + c_A^(\*) c_S ⟨Psi_A\| hat(O) \|Psi_S⟩\
 & = \| c_S \|^2 ⟨Psi_S\| hat(O) \|Psi_S⟩ + \| c_A \|^2 ⟨Psi_A\| hat(O) \|Psi_A⟩ . $<O-expected>
ただし式 @O-expected において次のような計算をした.
$ ⟨Psi_S\| hat(O) \|Psi_A⟩ & = ⟨Psi_S\| hat(E) hat(O) hat(E) \|Psi_A⟩ = - ⟨Psi_S\| hat(O) \|Psi_A⟩ = 0\
⟨Psi_A\| hat(O) \|Psi_S⟩ & = ⟨Psi_A\| hat(E) hat(O) hat(E) \|Psi_S⟩ = - ⟨Psi_A\| hat(O) \|Psi_S⟩ = 0 . $
]

#block[
#strong[問題 8] (Q21-1(x)). \

例えば $hat(O) = 2 \|beta⟩ \|alpha⟩ ⟨alpha\| ⟨beta\|$ とすると
$ ⟨Psi_S\| hat(O) \|Psi_S⟩ & = 1 / 2 \( ⟨alpha\| ⟨beta\| + ⟨beta\| ⟨alpha\| \) hat(O) \( \|alpha⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \) = + 1\
⟨Psi_A\| hat(O) \|Psi_A⟩ & = 1 / 2 \( ⟨alpha\| ⟨beta\| - ⟨beta\| ⟨alpha\| \) hat(O) \( \|alpha⟩ \|beta⟩ - \|beta⟩ \|alpha⟩ \) = - 1 . $
より $c_S \, c_A$ は互いに依存しない.

]
#block[
#strong[問題 9] (Q21-1(xi)). \

交換演算子が Hilbert
空間の代数構造において既約元であることは直感的に成り立つので,
区別できない情報が観測量の演算子に吸収され,
粒子状態の粒子を区別できないとは示せない. 問題 #link(<Q21-1-i>)[Q21-1-i]
のようには係数は決まらず, 理論の予言能力に問題はない.

]
#block[
#axiom("対称化の要請")[
いかなる粒子状態は粒子交換に関して不変である.
]
]
= $n$ 次対称群 $frak(S)_n$
<n-次対称群-mathfraks_n>
前章の 2 粒子系で交換演算子を導入したが一般の $N$
個の粒子系において対応するものが置換演算子である.
それを導入する前段階として $n$ 次対称群を整理する.

#block[
#definition("$n$ 次対称群")[
$X$
を集合とするとき $X$ から $X$ への全単射写像 $sigma : X arrow.r X$ を
$X$ の置換という. $sigma \, tau$ を置換とするとき, その積 $sigma tau$
を写像としての合成 $sigma compose tau$ と定義する. $X$
の置換全体の集合はこの演算により群となり, これを $X$ の置換群という.
$bb(Z)_n := { 1 \, 2 \, dots.h \, n }$ の置換群を $n$ 次対称群といい
$frak(S)_n$ と書く.
]
]
繰り返すが置換の積は写像の合成であり写像は右結合である. (Q21-2(i))

#block[
#strong[問題 12] (Q21-2(ii)). \

$X = { 0 \, 1 \, 2 \, 3 }$ の置換群 $G$ に対して $sigma \, tau in G$
の積 $sigma tau$ を計算せよ.
$ sigma = mat(delim: "(", 0, 1, 2, 3; 3, 2, 0, 1) quad \, quad tau = mat(delim: "(", 0, 1, 2, 3; 3, 2, 1, 0) . $

]
#proof[
$ sigma tau = mat(delim: "(", 0, 1, 2, 3; 3, 2, 0, 1) mat(delim: "(", 0, 1, 2, 3; 3, 2, 1, 0) = mat(delim: "(", 0, 1, 2, 3; 1, 0, 2, 3) . $
]

#block[
#theorem("Q21-3(i)(ii)(iii)(iv)")[
$n$
次対称群 $frak(S)_n$ は群である.
]

]
#proof[
$sigma \, tau in frak(S)_n$ に対して
$sigma tau = sigma compose tau$ が全単射写像であることを示す. まず
$sigma tau$ の全射性について $sigma$ の全射性より任意の $c in X$
に対して $sigma \( b \) = c$ となる $b in X$ があり, $tau \( a \) = b$
となる $a in X$ がある. これより任意の $c$ に対して次を満たす $a$
がある.
$ sigma tau \( a \) = sigma compose tau \( a \) = sigma \( tau \( a \) \) = c . $
また $sigma tau$
の単射性についてはそれぞれの単射性より次のように満たされる.
$ sigma tau \( a \) = sigma tau \( b \) arrow.r.double.long tau \( a \) = tau \( b \) arrow.r.double.long a = b . $
これより積について閉じていることが分かる.

単位元は $X$ の恒等写像 $upright(i d)_X$ とすることで任意の
$sigma in frak(S)_n$ に対して
$sigma upright(i d)_X = upright(i d)_X sigma = sigma$ を満たす.

また任意の元 $sigma in frak(S)_n$ に対する逆元は逆像 $sigma^(- 1)$
とすることで $sigma sigma^(- 1) = upright(i d)_X$ を満たす.

そして定義から結合法則
$sigma_1 \( sigma_2 sigma_3 \) = \( sigma_1 sigma_2 \) sigma_3$
も満たすことが分かる.

よって $n$ 次対称群 $frak(S)_n$ は群となる.
]

#proposition("Q21-4")[
$n$ 次対称群 $frak(S)_n$ の位数は
$n !$ である.
]
#proof[
全単射写像は $X$ の順列で被覆できるから位数は $n !$
となる.
]

#block[
#proposition("Q21-5(i)(ii), Q21-6(i)(ii)")[
$sigma_0 in frak(S)_n$ とすると
$frak(S)_n = sigma_0 frak(S)_n = frak(S)_n sigma_0 = frak(S)_n^(- 1)$
である.
]

]
#proof[
$sigma_0$ を左から掛けることに対して $sigma_0^(- 1)$
を左から掛けることは逆写像となるから, 全単射となる. よって
$sigma_0 frak(S)_n = frak(S)_n$ となる. 逆も同様なので
$frak(S)_n sigma_0 = frak(S)_n$ となる.
また群の性質より各元の逆元は唯一であるから $frak(S)_n^(- 1) = frak(S)_n$
となる. これより群 $R$ に対して関数 $f : frak(S)_n arrow.r R$
があるとき次のようになる.
$ sum_(sigma in frak(S)_n) f \( sigma \) = sum_(sigma in frak(S)_n) f \( sigma_0 sigma \) = sum_(sigma in frak(S)_n) f \( sigma sigma_0 \) = sum_(sigma in frak(S)_n) f \( sigma^(- 1) \) $
]

#block[
#definition("互換, 巡回置換")[
置換
$sigma in frak(S)_n$ に対して $1 lt.eq i < j lt.eq n$ のとき
$k eq.not i \, j$ なら $sigma \( k \) = k$ で $sigma \( i \) = j$,
$sigma \( j \) = i$ であるとき $sigma$ を互換といい $\( i med j \)$
と書く. より一般に
$i_1 mapsto i_2 mapsto dots.h.c mapsto i_m mapsto i_1$ と移し,
他の元は変えない置換を巡回置換といい $\( i_1 med dots.h.c med i_m \)$
と書く.
]
]
#lemma[
任意の置換は一意の巡回置換の積で表現できる.
]
#proof[
置換 $sigma in frak(S)_n$ においてある元 $i_1 in X$
を選び, 移していくと鳩ノ巣原理より必ず
$i_1 mapsto i_2 mapsto dots.h.c mapsto i_m mapsto i_1$ と巡回する.
これより巡回置換 $\( i_1 med dots.h.c med i_m \)$ と
$i_1 \, dots.h \, i_m$ を変えず他の元を $i mapsto sigma \( i \)$
とする置換 $sigma'$ を用いて
$sigma = \( i_1 med dots.h.c med i_m \) sigma'$ と表現できる. 次は
$sigma'$ の $i_1 \, dots.h \, i_m$ ではない元に対してと,
帰納的に同様の操作をすることで置換は巡回置換の積で表せられ,
積の順番を除いて一意に定まることが分かる.
]

#block[
#theorem("Q21-7(i)")[
任意の置換は互換の積で表現できる.
]

]
#proof[
任意の置換は巡回置換の積で表現できるから,
巡回置換が互換の積で表せられることを示せればよい.
$ \( i_1 med i_2 med dots.h.c med i_m \) & = \( i_1 med i_3 med dots.h.c med i_m \) \( i_1 med i_2 \)\
 & = \( i_1 med i_4 med dots.h.c med i_m \) \( i_1 med i_3 \) \( i_1 med i_2 \)\
 & = \( i_1 med i_m \) \( i_1 med i_(m - 1) \) dots.h.c \( i_1 med i_3 \) \( i_1 med i_2 \) . $
これは上のように変形することにより示される.
]

#block[
#definition("符号")[
置換 $sigma in frak(S)_n$ の符号
$"sgn" sigma = \( - 1 \)^sigma$ を次のように定義する.
$ "sgn" sigma = \( - 1 \)^sigma = cases(delim: "{", + 1 & \( sigma "が偶数個の互換の積で表される" \), - 1 & \( sigma "が奇数個の互換の積で表される" \)) . $
]
]
#block[
#proposition("Q21-7(ii)")[
置換の符号は well-defined
である.
]

]
#proof[
次のように定義される差積
$Delta \( x_1 \, dots.h \, x_n \)$ を置換 $sigma in frak(S)_n$
用いて変数の添字を置換することを考える.
$ Delta \( x_1 \, dots.h \, x_n \) = product_(1 lt.eq i < j lt.eq n) \( x_j - x_i \) . $
互換 $sigma = \( i med j \)$ で置換するとそれぞれ次のようになるから
$Delta \( x_(sigma \( 1 \)) \, dots.h \, x_(sigma \( n \)) \) = - Delta \( x_1 \, dots.h \, x_n \)$
となる. $ \( x_j - x_i \) & mapsto - \( x_j - x_i \)\
\( x_a - x_i \) \( x_a - x_j \) & mapsto \( x_a - x_i \) \( x_a - x_j \)\
\( x_i - x_a \) \( x_a - x_j \) & mapsto \( x_i - x_a \) \( x_a - x_j \)\
\( x_i - x_a \) \( x_j - x_a \) & mapsto \( x_i - x_a \) \( x_j - x_a \) . $
これより置換 $sigma in frak(S)_n$ が異なる互換の積
$sigma = sigma_1 dots.h.c sigma_k = tau_1 dots.h.c tau_m$ で表されたとき
$ Delta \( x_(sigma \( 1 \)) \, dots.h \, x_(sigma \( n \)) \) = \( - 1 \)^k Delta \( x_1 \, dots.h \, x_n \) = \( - 1 \)^m Delta \( x_1 \, dots.h \, x_n \) . $
となる為, 互換の積の個数の偶奇は一致する.
]

#block[
#proposition("Q21-8(i)(ii)(iii)")[
置換の符号
$"sgn" : frak(S)_n arrow.r bb(Z)^times$ は準同型写像である.
]

]
#proof[
差積を用いることで
$ "sgn" \( sigma tau \) Delta \( x_1 \, dots.h \, x_n \) & = Delta \( x_(sigma tau \( 1 \)) \, dots.h \, x_(sigma tau \( n \)) \)\
 & = "sgn" \( sigma \) Delta \( x_(tau \( 1 \)) \, dots.h \, x_(tau \( n \)) \) = "sgn" \( sigma \) "sgn" \( tau \) Delta \( x_1 \, dots.h \, x_n \) . $
より準同型の性質
$"sgn" \( sigma tau \) = "sgn" \( sigma \) "sgn" \( tau \)$ が成り立つ.
準同型であるから次が成り立つ.
$ "sgn" \( upright(i d)_X \) & = "sgn" \( upright(i d)_X \) "sgn" \( upright(i d)_X \) = 1\
"sgn" \( sigma^(- 1) \) & = "sgn" \( sigma^(- 1) \) "sgn" \( sigma \) "sgn" \( sigma \)^(- 1) = "sgn" \( sigma \)^(- 1) = "sgn" \( sigma \) & \( because "sgn" \( sigma \) = plus.minus 1 \) $
]

= 完全対称な状態と完全反対称な状態の数学的取り扱い
<完全対称な状態と完全反対称な状態の数学的取り扱い>
#block[
#definition("置換演算子")[
$N$ 個の同一の粒子
$X_1 \, dots.h \, X_N$ からなる全体系の Hilbert 空間 $cal(H)^(\( N \))$
において置換 $sigma in frak(S)_N$ を用いて粒子 $X_i$ の状態を粒子
$X_(sigma \( i \))$ の状態に置き換える演算子を置換演算子
$hat(P) \( sigma \)$ とする.
]
]
#block[
#proposition("Q21-9, Q21-10(i)(ii)")[
粒子状態に対して置換演算子 $hat(P) \( sigma \)$ は次のように作用する.
$ hat(P) \( sigma \) \|psi_1⟩ dots.h.c \|psi_N⟩ & = \|psi_(sigma^(- 1) \( 1 \))⟩ dots.h.c \|psi_(sigma^(- 1) \( N \))⟩\
hat(P)^dagger \( sigma \) \|psi_1⟩ dots.h.c \|psi_N⟩ & = \|psi_(sigma \( 1 \))⟩ dots.h.c \|psi_(sigma \( N \))⟩ . $
]

]
#proof[
置換演算子の行列表示について置換演算子を適用すると粒子
$X_i$ における状態は元々 $X_(sigma^(- 1) \( i \))$
であるから次のようになる.
$ ⟨xi_1\| dots.h.c ⟨xi_N\| hat(P) \( sigma \) \|psi_1⟩ dots.h.c \|psi_N⟩ & = ⟨xi_1\| dots.h.c ⟨xi_N\| psi_(sigma^(- 1) \( 1 \)) chevron.r dots.h.c \| psi_(sigma^(- 1) \( N \)) chevron.r = chevron.l xi_(sigma \( 1 \)) \| dots.h.c chevron.l xi_(sigma \( N \)) \| psi_1 chevron.r dots.h.c \| psi_N chevron.r . $
これは波動関数表示で書けば定義通り粒子 $X_i$ の状態を粒子
$X_(sigma \( i \))$ の状態に置き換えていると解釈できる.
$ ⟨xi_1\| ⟨xi_2\| dots.h.c ⟨xi_N\| hat(P) \( sigma \) \|Psi⟩ & = ⟨xi_(sigma \( 1 \))\| ⟨xi_(sigma \( 2 \))\| dots.h.c ⟨xi_(sigma \( N \)) mid(bar.v) Psi⟩\
\( hat(P) \( sigma \) Psi \) \( xi_1 \, xi_2 \, dots.h \, xi_N \) & = Psi \( xi_(sigma \( 1 \)) \, xi_(sigma \( 2 \)) \, dots.h \, xi_(sigma \( N \)) \) . $
これより任意の粒子状態 $\|Psi⟩ in cal(H)^(\( N \))$
に置換演算子を適用すると次のようになる.
$ \|Psi⟩ & = sum_i c^(\( i \)) \|psi_1^(\( i \))⟩ dots.h.c \|psi_N^(\( i \))⟩\
hat(P) \( sigma \) \|Psi⟩ & = sum_i c^(\( i \)) \|psi_(sigma^(- 1) \( 1 \))^(\( i \))⟩ dots.h.c \|psi_(sigma^(- 1) \( N \))^(\( i \))⟩\
hat(P)^dagger \( sigma \) \|Psi⟩ & = sum_i c^(\( i \)) \|psi_(sigma \( 1 \))^(\( i \))⟩ dots.h.c \|psi_(sigma \( N \))^(\( i \))⟩ . $
]

#block[
#theorem("Q21-11(i)(ii)(iii)(iv)")[
$hat(P) \( sigma \)$ は unitary な準同型演算子である.
]

]
#proof[
まず unitary 演算子であることは次のようにして成り立つ.
$ hat(P) \( sigma \)^dagger hat(P) \( sigma \) \|Psi⟩ & = \|psi_(sigma sigma^(- 1) \( 1 \))⟩ dots.h.c \|psi_(sigma sigma^(- 1) \( N \))⟩ = \|Psi⟩\
hat(P) \( sigma \) hat(P) \( sigma \)^dagger \|Psi⟩ & = \|psi_(sigma^(- 1) sigma \( 1 \))⟩ dots.h.c \|psi_(sigma^(- 1) sigma \( N \))⟩ = \|Psi⟩ . $
そして準同型であることは次のようにして成り立つ.
$ hat(P) \( sigma tau \) \|Psi⟩ & = \|psi_(\( sigma tau \)^(- 1) \( 1 \))⟩ dots.h.c \|psi_(\( sigma tau \)^(- 1) \( N \))⟩\
 & = hat(P) \( sigma \) \|psi_(tau^(- 1) \( 1 \))⟩ dots.h.c \|psi_(tau^(- 1) \( N \))⟩\
 & = hat(P) \( sigma \) hat(P) \( tau \) \|Psi⟩ . $ よって
$hat(P) \( sigma \)$ は unitary な準同型である. 準同型の性質より
$ hat(P) \( upright(i d)_X \) & = hat(1)\
hat(P) \( sigma^(- 1) \) & = hat(P) \( sigma \)^(- 1) . $ となる.
]

#block[
#definition("完全対称, 完全反対称")[
Hilbert 空間の状態 $\|Psi⟩ in cal(H)^(\( N \))$ において任意の置換
$sigma in frak(S)_N$ に対して $hat(P) \( sigma \) \|Psi⟩ = \|Psi⟩$
となるとき完全対称,
$hat(P) \( sigma \) \|Psi⟩ = "sgn" \( sigma \) \|Psi⟩$
となるとき完全反対称であると定義する. そして完全対称,
完全反対称な状態のなす Hilbert 空間を
$cal(H)_S^(\( N \)) \, cal(H)_A^(\( N \))$ と書き, 全 Hilbert 空間
$cal(H)^(\( N \))$ から $cal(H)_S^(\( N \)) \, cal(H)_A^(\( N \))$
への射影演算子を $hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$
とする.
]
]
#block[
#lemma("Q21-12(i)(ii)")[
任意の互換
$sigma in frak(S)_N$ に対して $hat(P) \( sigma \) \|Psi⟩ = \|Psi⟩$,
$hat(P) \( sigma \) \|Psi⟩ = - \|Psi⟩$ となることは完全対称,
完全反対称であることと同値である.
]

]
#proof[
任意の置換 $sigma in frak(S)_N$
は互換の積で表現できるから互換
$sigma_1 \, dots.h \, sigma_m in frak(S)_N$ を用いて
$sigma = sigma_1 dots.h.c sigma_m$ と書け, 次のようになる.
$ hat(P) \( sigma \) \|Psi⟩ & = \|Psi⟩ = \( + 1 \)^m \|Psi⟩ & \( "完全対称" \)\
hat(P) \( sigma \) \|Psi⟩ & = "sgn" \( sigma \) \|Psi⟩ = \( - 1 \)^m \|Psi⟩ & \( "完全反対称" \) $
これより同値であることがわかる.
]

#block[
#proposition("Q21-13(i)(ii)")[
$cal(H)_S^(\( N \))$
と $cal(H)_A^(\( N \))$ は直交し, その直和について次のようになる.
$ {cal(H)_S^(\( 2 \)) xor cal(H)_A^(\( 2 \)) = cal(H)^(\( 2 \))\
cal(H)_S^(\( N \)) xor cal(H)_A^(\( N \)) subset.neq cal(H)^(\( N \)) & \( N gt.eq 3 \) $
]

]
#proof[
$\|Psi_S⟩ in cal(H)_S^(\( N \))$,
$\|Psi_A⟩ in cal(H)_A^(\( N \))$ の内積について互換 $sigma$
の演算子を挿入することで求まる.
$ ⟨Psi_S mid(bar.v) Psi_A⟩ & = ⟨Psi_S\| hat(P) \( sigma \)^dagger hat(P) \( sigma \) \|Psi_A⟩\
 & = - ⟨Psi_S mid(bar.v) Psi_A⟩ = 0 . $ これより $cal(H)_S^(\( N \))$ と
$cal(H)_A^(\( N \))$ は直交する. 次に $N = 2$ における
$cal(H)_S^(\( N \))$, $cal(H)_A^(\( N \))$ は次のように表現できる.
$ sum_i c^(\( i \)) (\|psi_1^(\( i \))⟩ \|psi_2^(\( i \))⟩ + \|psi_2^(\( i \))⟩ \|psi_1^(\( i \))⟩) in cal(H)_S^(\( 2 \))\
sum_i c^(\( i \)) (\|psi_1^(\( i \))⟩ \|psi_2^(\( i \))⟩ - \|psi_2^(\( i \))⟩ \|psi_1^(\( i \))⟩) in cal(H)_A^(\( 2 \)) . $
これよりこれらの直和は全空間 $cal(H)^(\( 2 \))$ を表現できる. $N = 3$
における $cal(H)_S^(\( N \))$, $cal(H)_A^(\( N \))$
の元は例えば次のようになる.
$ \|psi_1⟩ \|psi_2⟩ \|psi_3⟩ + \|psi_2⟩ \|psi_3⟩ \|psi_1⟩ + \|psi_3⟩ \|psi_1⟩ \|psi_2⟩ + \|psi_1⟩ \|psi_3⟩ \|psi_2⟩ + \|psi_2⟩ \|psi_1⟩ \|psi_3⟩ + \|psi_3⟩ \|psi_2⟩ \|psi_1⟩ in cal(H)_S^(\( N \))\
\|psi_1⟩ \|psi_2⟩ \|psi_3⟩ + \|psi_2⟩ \|psi_3⟩ \|psi_1⟩ + \|psi_3⟩ \|psi_1⟩ \|psi_2⟩ - \|psi_1⟩ \|psi_3⟩ \|psi_2⟩ - \|psi_2⟩ \|psi_1⟩ \|psi_3⟩ - \|psi_3⟩ \|psi_2⟩ \|psi_1⟩ in cal(H)_A^(\( N \)) . $
これよりこれらの直和でも全空間は表現できない. $N > 3$ も同様である.
]

#block[
#theorem("Q21-14(i)(ii)(iii)")[
射影演算子
$hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$ は次のように表現される.
$ hat(cal(S))^(\( N \)) & = frac(1, N !) sum_(sigma in frak(S)_N) hat(P) \( sigma \)\
hat(cal(A))^(\( N \)) & = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) hat(P) \( sigma \) . $
]

]
#proof[
演算子
$hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$ に対して置換演算子
$hat(P) \( tau \)$ を適用すると次のようになる.
$ hat(P) \( tau \) hat(cal(S))^(\( N \)) & = frac(1, N !) sum_(sigma in frak(S)_N) hat(P) \( tau sigma \) = frac(1, N !) sum_(sigma' in frak(S)_N) hat(P) \( sigma' \) = hat(cal(S))^(\( N \))\
hat(P) \( tau \) hat(cal(A))^(\( N \)) & = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) hat(P) \( tau sigma \) = "sgn" \( tau \) frac(1, N !) sum_(sigma' in frak(S)_N) "sgn" \( sigma' \) hat(P) \( sigma' \) = "sgn" \( tau \) hat(cal(A))^(\( N \)) . $
これより演算子
$hat(cal(S))^(\( N \)) : cal(H)^(\( N \)) arrow.r cal(H)_S^(\( N \)) \, hat(cal(A))^(\( N \)) : cal(H)^(\( N \)) arrow.r cal(H)_A^(\( N \))$
となる.
$ \( hat(cal(S))^(\( N \)) \)^2 & = frac(1, N !^2) sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) hat(P) \( sigma tau \) = frac(1, N !) sum_(sigma' in frak(S)_N) hat(P) \( sigma' \) = hat(cal(S))^(\( N \))\
\( hat(cal(A))^(\( N \)) \)^2 & = frac(1, N !^2) sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) "sgn" \( sigma tau \) hat(P) \( sigma tau \) = frac(1, N !) sum_(sigma' in frak(S)_N) "sgn" \( sigma' \) hat(P) \( sigma' \) = hat(cal(A))^(\( N \)) . $
これより $hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$
で何度射影しても同じ結果となる.
]

#block[
#proposition("Q21-14(iii)(iv)(v)")[
射影演算子は
Hermite 演算子であり, 積と和について次のようになる.
$  & quad hat(cal(S))^(\( N \)) hat(cal(A))^(\( N \)) = hat(cal(A))^(\( N \)) hat(cal(S))^(\( N \)) = 0\
 & {hat(cal(S))^(\( 2 \)) + hat(cal(A))^(\( 2 \)) = hat(1)_(cal(H)^(\( 2 \)))\
hat(cal(S))^(\( N \)) + hat(cal(A))^(\( N \)) eq.not hat(1)_(cal(H)^(\( N \))) #h(2em) \( N gt.eq 3 \) . $
]

]
#proof[
次に置換演算子の unitary 性より Hermite 演算子となる.
$ \( hat(cal(S))^(\( N \)) \)^dagger & = frac(1, N !) sum_(sigma in frak(S)_N) hat(P) \( sigma \)^dagger = frac(1, N !) sum_(sigma in frak(S)_N) hat(P) \( sigma^(- 1) \) = hat(cal(S))^(\( N \))\
\( hat(cal(A))^(\( N \)) \)^dagger & = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) hat(P) \( sigma \)^dagger = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) hat(P) \( sigma^(- 1) \) = hat(cal(A))^(\( N \)) . $
演算子 $hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$ の積について
$ hat(cal(S))^(\( N \)) hat(cal(A))^(\( N \)) = hat(cal(A))^(\( N \)) hat(cal(S))^(\( N \)) & = frac(1, N !^2) sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) "sgn" \( tau \) hat(P) \( sigma tau \)\
 & = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) (frac(1, N !) sum_(sigma' in frak(S)_N) "sgn" \( sigma' \) hat(P) \( sigma' \))\
 & = 0 . $ より直交することが分かる. また演算子
$hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$ の和について
$ hat(cal(S))^(\( 2 \)) + hat(cal(A))^(\( 2 \)) & = frac(1, 2 !) sum_(sigma in frak(S)_2) (hat(P) \( sigma \) + "sgn" \( sigma \) hat(P) \( sigma \)) = 1_(cal(H)^(\( 2 \)))\
hat(cal(S))^(\( N \)) + hat(cal(A))^(\( N \)) & = frac(1, N !) sum_(sigma in frak(S)_N) (hat(P) \( sigma \) + "sgn" \( sigma \) hat(P) \( sigma \)) eq.not hat(1)_(cal(H)^(\( N \))) #h(2em) \( N gt.eq 3 \) . $
とわかる.
]

#block[
#theorem("Q21-15(i)(ii)")[
$1 lt.eq mu < nu lt.eq N$
において $\|psi_mu⟩$ と $\|psi_nu⟩$ が線形従属であるならば
$hat(cal(A))^(\( N \)) \|psi_1⟩ dots.h.c \|psi_N⟩ = 0$ となる.
]

]
#proof[
任意の $sigma in frak(S)_n$ に対して
$tau \( mu \) = sigma \( nu \)$, $tau \( nu \) = sigma \( mu \)$ であり,
その他の元 $1 lt.eq i lt.eq N$ で $tau \( i \) = sigma \( i \)$ となる
$tau$ が一意に取れる. $tau$ は $sigma$ に対して符号が反転し,
$hat(P) \( sigma \) \|Psi⟩ = hat(P) \( tau \) \|Psi⟩$ となる. よって
$hat(cal(A))^(\( N \)) \|psi_1⟩ dots.h.c \|psi_N⟩ = 0$ となる.
]

#lemma[
Hilbert 空間に演算子
$hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$
を作用させるとそれぞれの部分空間となる.
$ cal(H)_S^(\( N \)) & = hat(cal(S))^(\( N \)) cal(H)^(\( N \))\
cal(H)_A^(\( N \)) & = hat(cal(A))^(\( N \)) cal(H)^(\( N \)) $
] <hilbert-corespondence>
#proof[
$hat(cal(S))^(\( N \)) \, hat(cal(A))^(\( N \))$ は
$cal(H)_S^(\( N \)) \, cal(H)_A^(\( N \))$ への射影演算子であるから
$cal(H)_S^(\( N \)) supset.eq hat(cal(S))^(\( N \)) cal(H)^(\( N \)) \, cal(H)_A^(\( N \)) supset.eq hat(cal(A))^(\( N \)) cal(H)^(\( N \))$
は成り立つ. また
$\|Psi_S⟩ in cal(H)_S^(\( N \)) \, \|Psi_A⟩ in cal(H)_A^(\( N \))$
について次が成り立つことが分かる.
$ \|Psi_S⟩ & = hat(P) \( sigma \) \|Psi_S⟩ = frac(1, N !) sum_(sigma in frak(S)_n) hat(P) \( sigma \) \|Psi_S⟩ = hat(cal(S))^(\( N \)) \|Psi_S⟩\
\|Psi_A⟩ & = "sgn" \( sigma \) hat(P) \( sigma \) \|Psi_A⟩ = frac(1, N !) sum_(sigma in frak(S)_n) "sgn" \( sigma \) hat(P) \( sigma \) \|Psi_A⟩ = hat(cal(A))^(\( N \)) \|Psi_A⟩ $
これより
$cal(H)_S^(\( N \)) subset.eq hat(cal(S))^(\( N \)) cal(H)^(\( N \)) \, cal(H)_A^(\( N \)) subset.eq hat(cal(A))^(\( N \)) cal(H)^(\( N \))$
は成り立つ. よってそれぞれ等しいことが分かる.
]

#block[
#proposition("Q21-16(i)(ii), Q21-17(i)(ii), Q21-18(i)(ii)")[
$cal(H)_(s i n g l e)$ の完全正規直交系を添字集合 $I$ を用いて
${ \|phi.alt_i⟩ }_(i in I)$ とする.
$ cal(H)_S^(\( N \)) & = "span" {hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides \( i_1 \, dots.h \, i_N \) in I_S^(\( N \))}\
cal(H)_A^(\( N \)) & = "span" {hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides \( i_1 \, dots.h \, i_N \) in I_A^(\( N \))} $
ただし添字集合 $I_S^(\( N \)) \, I_A^(\( N \))$ は次のように定義される.
$ I_S^(\( N \)) & = { \( i_1 \, dots.h \, i_N \) divides i_1 \, dots.h \, i_N in I and i_1 lt.eq dots.h.c lt.eq i_N }\
I_A^(\( N \)) & = { \( i_1 \, dots.h \, i_N \) divides i_1 \, dots.h \, i_N in I and i_1 < dots.h.c < i_N } $
]

]
#proof[
完全対称化演算子は置換に対して不変であり,
準同型である為に次のように変形できる.
$ hat(cal(S))^(\( N \)) cal(H)^(\( N \)) & = hat(cal(S))^(\( N \)) "span" {\|psi_1⟩ dots.h.c \|psi_N⟩ divides \|psi_1⟩ dots.h.c \|psi_N⟩ in cal(H)^(\( N \))}\
 & = "span" {hat(cal(S))^(\( N \)) \|psi_1⟩ dots.h.c \|psi_N⟩ divides \|psi_1⟩ dots.h.c \|psi_N⟩ in cal(H)^(\( N \))}\
 & = hat(cal(S))^(\( N \)) "span" {\|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides i_1 \, dots.h \, i_N in I}\
 & = "span" {hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides i_1 \, dots.h \, i_N in I}\
 & = "span" {hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides \( i_1 \, dots.h \, i_N \) in I_S^(\( N \))} $
同様に完全反対称についても同じ 1 粒子状態があると 0
となるから次のように変形できる.
$ hat(cal(A))^(\( N \)) cal(H)^(\( N \)) & = hat(cal(A))^(\( N \)) "span" {\|psi_1⟩ dots.h.c \|psi_N⟩ divides \|psi_1⟩ dots.h.c \|psi_N⟩ in cal(H)^(\( N \))}\
 & = "span" {hat(cal(A))^(\( N \)) \|psi_1⟩ dots.h.c \|psi_N⟩ divides \|psi_1⟩ dots.h.c \|psi_N⟩ in cal(H)^(\( N \))}\
 & = hat(cal(A))^(\( N \)) "span" {\|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides i_1 \, dots.h \, i_N in I}\
 & = "span" {hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides i_1 \, dots.h \, i_N in I}\
 & = "span" {hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides \( i_1 \, dots.h \, i_N \) in I_A^(\( N \))} $
これらに対して補題 @hilbert-corespondence を適用して示される.
]

#block[
#definition("完全対称, 完全反対称な状態の基底とその粒子数")[
Hilbert 空間 $cal(H)_S^(\( N \))$ の基底状態
$hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ quad \( i_1 \, dots.h \, i_N \) in I_S^(\( N \))$
を規格化した状態を $\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S$
と定義する. 同様に Hilbert 空間 $cal(H)_A^(\( N \))$ の基底状態
$hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ quad \( i_1 \, dots.h \, i_N \) in I_A^(\( N \))$
を規格化した状態を $\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A$
と定義する. またこれらの状態の粒子数 $n_i in bb(Z)_(gt.eq 0)$ を $i$
と等しい $i_mu$ の個数と定義する. これは占有数ともいう.
]
]
#block[
#theorem("Q21-19(i), Q21-20(i)(ii)(iii)")[
完全対称な粒子基底 $\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S$ は粒子数
$n_i$ を用いて次のように表現できる.
$ \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S & = sqrt(frac(N !, product_(i in I) n_i !)) hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ = 1 / sqrt(N ! product_(i in I) n_i !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩) . $
]

]
#proof[
まず
$hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩$
のノルムを計算すると次のようになる.
$ ∥hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩∥ & = sqrt(⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(cal(S))^(\( N \) dagger) hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩)\
 & = frac(1, N !) sqrt(sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P) \( tau \)^dagger hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩)\
 & = frac(1, N !) sqrt(sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) ⟨phi.alt_(tau^(- 1) \( i_1 \))\| dots.h.c ⟨phi.alt_(tau^(- 1) \( i_N \))\| \|phi.alt_(sigma^(- 1) \( i_1 \))⟩ dots.h.c \|phi.alt_(sigma^(- 1) \( i_N \))⟩)\
 & = sqrt(frac(product_(i in I) n_i !, N !)) . $
これより基底状態は次のように書ける.
$ \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S & = sqrt(frac(N !, product_(i in I) n_i !)) hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ . $
さらに変形を進めると次のようになる.
$ hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ & = frac(1, N !) sum_(sigma in frak(S)_N) hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩\
 & = frac(1, N !) sum_(sigma in frak(S)_N) \|phi.alt_(sigma^(- 1) \( i_1 \))⟩ dots.h.c \|phi.alt_(sigma^(- 1) \( i_N \))⟩\
 & = frac(1, N !) sum_(sigma in frak(S)_N) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩\
 & = frac(product_(i in I) n_i !, N !) sum_(\( i_1 \, dots.h \, i_N \) tilde.op \( i_(1') \, dots.h \, i_(N') \)) \|phi.alt_(i_(1'))⟩ dots.h.c \|phi.alt_(i_(N'))⟩\
 & = frac(1, N !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩^(\( 1 \)), dots.h.c, \|phi.alt_(i_N)⟩^(\( 1 \)); dots.v, dots.down, dots.v; \|phi.alt_(i_1)⟩^(\( N \)), dots.h.c, \|phi.alt_(i_N)⟩^(\( N \)))\
 & = frac(1, N !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩) . $
よって次のようになる.
$ \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S & = 1 / sqrt(N ! product_(i in I) n_i !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩) . $
]

#block[
#proposition("Q21-20(iv)(v)(vi)")[
粒子状態
$\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S$ は $cal(H)_S^(\( N \))$
の完全正規直交系となる.
]

] <symmetric-completely-orthonormal-system>
#proof[
まず正規直交関係については次のように計算できる.
$ chevron.l phi.alt_(i_1) dots.h.c phi.alt_(i_N) \| phi.alt_(i_(1')) dots.h.c phi.alt_(i_(N')) chevron.r_S & = frac(N !^(- 1), sqrt(product_(i in I) n_i ! n_(i') !)) sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P) \( sigma^(- 1) tau \) \| phi.alt_(i_(1')) chevron.r dots.h.c \| phi.alt_(i_(N')) chevron.r\
 & = 1 / sqrt(product_(i in I) n_i ! n_(i') !) sum_(sigma in frak(S)_N) ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P) \( sigma \) \| phi.alt_(i_(1')) chevron.r dots.h.c \| phi.alt_(i_(N')) chevron.r\
 & = delta_(i_1 i_(1')) dots.h.c delta_(i_N i_(N')) . $
次に完全性については係数を取り除いて次のように計算できる.
$ cal(H)_S^(\( N \)) & = "span" {hat(cal(S))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides \( i_1 \, dots.h \, i_N \) in I_S^(\( N \))}\
 & = "span" {\|phi.alt_(i_(1')) dots.h.c phi.alt_(i_(N'))⟩_S divides \( i_1 \, dots.h \, i_N \) in I_S^(\( N \))} . $
そして完備性については次のように計算できる.
$  & sum_(\( i_1 \, dots.h \, i_N \) in I_S^(\( N \))) \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S ⟨phi.alt_(i_1) dots.h.c phi.alt_(i_N)\|_S\
 & = sum_(\( i_1 \, dots.h \, i_N \) in I_S^(\( N \))) frac(1, N ! product_(i in I) n_i !) sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P)^dagger \( tau \)\
 & = sum_(\( i_1 \, dots.h \, i_N \) in I_S^(\( N \))) frac(1, product_(i in I) n_i !) sum_(sigma in frak(S)_N) hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\|\
 & = sum_(\( i_1 \, dots.h \, i_N \) in I_S^(\( N \))) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\|\
 & = hat(1)_(cal(H)_S^(\( N \))) . $ よって
$\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S$ は完全正規直交系となる.
]

#block[
#theorem("Q21-19(ii), Q21-21(i)(ii)")[
完全反対称な粒子基底 $\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A$
は粒子数 $n_i$ を用いて次のように表現できる.
$ \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A & = sqrt(N !) hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ = 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩) . $
]

]
#proof[
まず
$hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩$
のノルムを計算すると次のようになる.
$ ∥hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩∥ & = sqrt(⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(cal(A))^(\( N \) dagger) hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩)\
 & = frac(1, N !) sqrt(sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) "sgn" \( tau sigma \) ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P) \( tau \)^dagger hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩)\
 & = frac(1, N !) sqrt(sum_(sigma in frak(S)_N) "sgn" \( sigma^2 \))\
 & = 1 / sqrt(N !) . $ これより基底状態は次のように書ける.
$ \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A & = sqrt(N !) hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ . $
さらに変形を進めると次のようになる.
$ hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ & = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩\
 & = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) \|phi.alt_(sigma^(- 1) \( i_1 \))⟩ dots.h.c \|phi.alt_(sigma^(- 1) \( i_N \))⟩\
 & = frac(1, N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩\
 & = frac(1, N !) det mat(delim: "[", \|phi.alt_(i_1)⟩^(\( 1 \)), dots.h.c, \|phi.alt_(i_N)⟩^(\( 1 \)); dots.v, dots.down, dots.v; \|phi.alt_(i_1)⟩^(\( N \)), dots.h.c, \|phi.alt_(i_N)⟩^(\( N \)))\
 & = frac(1, N !) det mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩) . $
よって次のようになる.
$ \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A & = 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩) . $
]

#block[
#proposition("Q21-21(iii)(iv)(v)")[
粒子状態
$\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A$ は $cal(H)_A^(\( N \))$
の完全正規直交系となる.
]

] <asymmetric-completely-orthonormal-system>
#proof[
まず正規直交関係については次のように計算できる.
$ chevron.l phi.alt_(i_1) dots.h.c phi.alt_(i_N) \| phi.alt_(i_(1')) dots.h.c phi.alt_(i_(N')) chevron.r_A & = frac(1, N !) sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) "sgn" \( sigma^(- 1) tau \) ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P) \( sigma^(- 1) tau \) \| phi.alt_(i_(1')) chevron.r dots.h.c \| phi.alt_(i_(N')) chevron.r\
 & = sum_(sigma in frak(S)_N) "sgn" \( sigma \) ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P) \( sigma \) \| phi.alt_(i_(1')) chevron.r dots.h.c \| phi.alt_(i_(N')) chevron.r\
 & = delta_(i_1 i_(1')) dots.h.c delta_(i_N i_(N')) . $
次に完全性については係数を取り除いて次のように計算できる.
$ cal(H)_A^(\( N \)) & = "span" {hat(cal(A))^(\( N \)) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ divides \( i_1 \, dots.h \, i_N \) in I_A^(\( N \))}\
 & = "span" {\|phi.alt_(i_(1')) dots.h.c phi.alt_(i_(N'))⟩_A divides \( i_1 \, dots.h \, i_N \) in I_A^(\( N \))} . $
最後に完備性については次のように計算できる.
$  & sum_(\( i_1 \, dots.h \, i_N \) in I_A^(\( N \))) \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A ⟨phi.alt_(i_1) dots.h.c phi.alt_(i_N)\|_A\
 & = sum_(\( i_1 \, dots.h \, i_N \) in I_A^(\( N \))) frac(1, N !) sum_(sigma in frak(S)_N) sum_(tau in frak(S)_N) "sgn" \( sigma tau \) hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\| hat(P)^dagger \( tau \)\
 & = sum_(\( i_1 \, dots.h \, i_N \) in I_A^(\( N \))) sum_(sigma in frak(S)_N) "sgn" \( sigma \) hat(P) \( sigma \) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\|\
 & = sum_(\( i_1 \, dots.h \, i_N \) in I_A^(\( N \))) \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ ⟨phi.alt_(i_1)\| dots.h.c ⟨phi.alt_(i_N)\|\
 & = hat(1)_(cal(H)_A^(\( N \))) . $ よって
$\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A$ は $cal(H)_A^(\( N \))$
の完全正規直交系となる.
]

#block[
#proposition("Q21-22(i)(ii)(iii)(iv), Q21-23(i)(ii)(iii)(iv)")[
完全正規直交系
$\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S \, \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A$
についてそれぞれ完全対称性, 完全反対称性が成り立ち,
どちらも線形性が成り立つ.
$ \|phi.alt_(i_(sigma \( 1 \))) dots.h.c phi.alt_(i_(sigma \( N \)))⟩_S & = \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S\
\|phi.alt_(i_(sigma \( 1 \))) dots.h.c phi.alt_(i_(sigma \( N \)))⟩_A & = "sgn" \( sigma \) \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A\
\|phi.alt_(i_1) dots.h.c a^(\( 0 \)) phi.alt_(i_mu)^(\( 0 \)) + a^(\( 1 \)) phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_S & = a^(\( 0 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 0 \)) dots.h.c phi.alt_(i_N)⟩_S + a^(\( 1 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_S\
\|phi.alt_(i_1) dots.h.c a^(\( 0 \)) phi.alt_(i_mu)^(\( 0 \)) + a^(\( 1 \)) phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_A & = a^(\( 0 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 0 \)) dots.h.c phi.alt_(i_N)⟩_A + a^(\( 1 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_A . $
]

]
#proof[
行列に関する性質より次のようになる.
$ \|phi.alt_(i_(sigma \( 1 \))) dots.h.c phi.alt_(i_(sigma \( N \)))⟩_S & = 1 / sqrt(N ! product_(i in I) n_i !) "per" mat(delim: "[", \|phi.alt_(i_(sigma \( 1 \)))⟩, dots.h.c, \|phi.alt_(i_(sigma \( N \)))⟩)\
 & = 1 / sqrt(N ! product_(i in I) n_i !) sum_(tau in frak(S)_N) \|phi.alt_(i_(sigma tau \( 1 \)))⟩ dots.h.c \|phi.alt_(i_(sigma tau \( N \)))⟩\
 & = 1 / sqrt(N ! product_(i in I) n_i !) sum_(tau in frak(S)_N) \|phi.alt_(i_(tau \( 1 \)))⟩ dots.h.c \|phi.alt_(i_(tau \( N \)))⟩\
 & = 1 / sqrt(N ! product_(i in I) n_i !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩)\
 & = \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S . $
$ \|phi.alt_(i_(sigma \( 1 \))) dots.h.c phi.alt_(i_(sigma \( N \)))⟩_A & = 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_(sigma \( 1 \)))⟩, dots.h.c, \|phi.alt_(i_(sigma \( N \)))⟩)\
 & = 1 / sqrt(N !) sum_(tau in frak(S)_N) "sgn" \( tau \) \|phi.alt_(i_(sigma tau \( 1 \)))⟩ dots.h.c \|phi.alt_(i_(sigma tau \( N \)))⟩\
 & = 1 / sqrt(N !) sum_(tau in frak(S)_N) "sgn" \( sigma \) "sgn" \( tau \) \|phi.alt_(i_(tau \( 1 \)))⟩ dots.h.c \|phi.alt_(i_(tau \( N \)))⟩\
 & = 1 / sqrt(N !) "sgn" \( sigma \) det mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩)\
 & = "sgn" \( sigma \) \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A . $
次に線形性について順当に計算する.
$  & \|phi.alt_(i_1) dots.h.c a^(\( 0 \)) phi.alt_(i_mu)^(\( 0 \)) + a^(\( 1 \)) phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_S\
 & = 1 / sqrt(N ! product_(i in I) n_i !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, a^(\( 0 \)) \|phi.alt_(i_mu)^(\( 0 \))⟩ + a^(\( 1 \)) \|phi.alt_(i_mu)^(\( 1 \))⟩, dots.h.c, \|phi.alt_(i_N)⟩)\
 & = 1 / sqrt(N ! product_(i in I) n_i !) sum_(sigma in frak(S)_N) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c (a^(\( 0 \)) \|phi.alt_(i_mu)^(\( 0 \))⟩ + a^(\( 1 \)) \|phi.alt_(i_mu)^(\( 1 \))⟩) dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩\
 & = 1 / sqrt(N ! product_(i in I) n_i !) sum_(sigma in frak(S)_N) (a^(\( 0 \)) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c \|phi.alt_(i_mu)^(\( 0 \))⟩ dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩ + a^(\( 1 \)) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c \|phi.alt_(i_mu)^(\( 1 \))⟩ dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩)\
 & = 1 / sqrt(N ! product_(i in I) n_i !) (a^(\( 0 \)) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_mu)^(\( 0 \))⟩ dots.h.c \|phi.alt_(i_N)⟩) + a^(\( 1 \)) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_mu)^(\( 1 \))⟩ dots.h.c \|phi.alt_(i_N)⟩))\
 & = a^(\( 0 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 0 \)) dots.h.c phi.alt_(i_N)⟩_S + a^(\( 1 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_S . $
$  & \|phi.alt_(i_1) dots.h.c a^(\( 0 \)) phi.alt_(i_mu)^(\( 0 \)) + a^(\( 1 \)) phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_A\
 & = 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, a^(\( 0 \)) \|phi.alt_(i_mu)^(\( 0 \))⟩ + a^(\( 1 \)) \|phi.alt_(i_mu)^(\( 1 \))⟩, dots.h.c, \|phi.alt_(i_N)⟩)\
 & = 1 / sqrt(N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c (a^(\( 0 \)) \|phi.alt_(i_mu)^(\( 0 \))⟩ + a^(\( 1 \)) \|phi.alt_(i_mu)^(\( 1 \))⟩) dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩\
 & = 1 / sqrt(N !) sum_(sigma in frak(S)_N) "sgn" \( sigma \) (a^(\( 0 \)) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c \|phi.alt_(i_mu)^(\( 0 \))⟩ dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩ + a^(\( 1 \)) \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c \|phi.alt_(i_mu)^(\( 1 \))⟩ dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩)\
 & = 1 / sqrt(N !) (a^(\( 0 \)) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_mu)^(\( 0 \))⟩ dots.h.c \|phi.alt_(i_N)⟩) + a^(\( 1 \)) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_mu)^(\( 1 \))⟩ dots.h.c \|phi.alt_(i_N)⟩))\
 & = a^(\( 0 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 0 \)) dots.h.c phi.alt_(i_N)⟩_A + a^(\( 1 \)) \|phi.alt_(i_1) dots.h.c phi.alt_(i_mu)^(\( 1 \)) dots.h.c phi.alt_(i_N)⟩_A . $
よって成り立つ.
]

= 複数の同一粒子からなる量子系の状態に対する対称化の要請
<複数の同一粒子からなる量子系の状態に対する対称化の要請>
#block[
#definition("スピン統計定理")[
$N$
個の同一の Bose 粒子による Hilbert 空間は完全対称な Hilbert 空間
$cal(H)_S^(\( N \))$, また Fermi 粒子による Hilbert 空間は完全反対称な
Hilbert 空間 $cal(H)_A^(\( N \))$ となる. また全粒子数を固定しない Bose,
Fermi 粒子系の Hilbert 空間を $cal(H)_(B o s e) \, cal(H)_(F e r m i)$
と書き, 次のように定義する.
$ cal(H)_(B o s e) & = xor.big_(N = 0)^oo cal(H)_S^(\( N \))\
cal(H)_(F e r m i) & = xor.big_(N = 0)^oo cal(H)_A^(\( N \)) $
特に断りのない限り, 随伴関手は省略するものとする.
]
]
= 計算練習
<計算練習>
#example("Q21-25, Q21-26, Q21-27")[
互いに異なる 1 粒子状態 $\|alpha⟩ in cal(H)_(s i n g l e)$ を持つ
Hilbert 空間において 2, 3 個の同一の Bose 粒子, Fermi 粒子の Hilbert
空間は次のようになる.

#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([Bose, Fermi], [$cal(H)_(s i n g l e)$
      の基底], [全粒子数
      $N$], [$cal(H)_S^(\( N \)) \, cal(H)_A^(\( N \))$ の基底],),
    table.hline(),
    [Bose], [$\|alpha⟩$], [1], [$\|alpha⟩$],
    [Bose], [$\|alpha⟩ \, \|beta⟩$], [1], [$\|alpha⟩ \, \|beta⟩$],
    [Bose], [$\|alpha⟩$], [2], [$\|alpha⟩ \|alpha⟩$],
    [Bose], [$\|alpha⟩ \, \|beta⟩$], [2], [$display(\|alpha⟩ \|alpha⟩ \, \|beta⟩ \|beta⟩ \, 1 / sqrt(2) \( \|alpha⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \))$],
    [Bose], [$\|alpha⟩$], [3], [$\|alpha⟩ \|alpha⟩ \|alpha⟩$],
    [Bose], [$\|alpha⟩ \, \|beta⟩$], [3], [#figure(
      align(center)[#table(
        columns: 1,
        align: (center,),
        [$\|alpha⟩ \|alpha⟩ \|alpha⟩ \, \|beta⟩ \|beta⟩ \|beta⟩$,],
        [$display(1 / sqrt(3) \( \|alpha⟩ \|alpha⟩ \|beta⟩ + \|alpha⟩ \|beta⟩ \|alpha⟩ + \|beta⟩ \|alpha⟩ \|alpha⟩ \))$,],
        [$display(1 / sqrt(3) \( \|alpha⟩ \|beta⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \|beta⟩ + \|beta⟩ \|beta⟩ \|alpha⟩ \))$],
      )]
      , caption: [Bose, Fermi 粒子系の基底]
      , kind: table
      )

    ],
    [Fermi], [$\|alpha⟩$], [1], [なし],
    [Fermi], [$\|alpha⟩ \, \|beta⟩$], [1], [なし],
    [Fermi], [$\|alpha⟩$], [2], [なし],
    [Fermi], [$\|alpha⟩ \, \|beta⟩$], [2], [$display(1 / sqrt(2) \( \|alpha⟩ \|beta⟩ - \|beta⟩ \|alpha⟩ \))$],
    [Fermi], [$\|alpha⟩$], [3], [なし],
    [Fermi], [$\|alpha⟩ \, \|beta⟩$], [3], [なし],
  )]
  , caption: [Bose, Fermi 粒子系の基底]
  , kind: table
  )

互いに異なる 3 つの 1 粒子状態
$\|alpha⟩ \, \|beta⟩ \, \|gamma⟩ in cal(H)_(s i n g l e)$
を持つ場合においてそれぞれ 1 つずつある全系の状態は次のようになる.
$ 1 / sqrt(6) \( \|alpha⟩ \|beta⟩ \|gamma⟩ + \|gamma⟩ \|alpha⟩ \|beta⟩ + \|beta⟩ \|gamma⟩ \|alpha⟩ + \|gamma⟩ \|beta⟩ \|alpha⟩ + \|alpha⟩ \|gamma⟩ \|beta⟩ + \|beta⟩ \|alpha⟩ \|gamma⟩ \) in cal(H)_S^(\( 3 \))\
1 / sqrt(6) \( \|alpha⟩ \|beta⟩ \|gamma⟩ + \|gamma⟩ \|alpha⟩ \|beta⟩ + \|beta⟩ \|gamma⟩ \|alpha⟩ - \|gamma⟩ \|beta⟩ \|alpha⟩ - \|alpha⟩ \|gamma⟩ \|beta⟩ - \|beta⟩ \|alpha⟩ \|gamma⟩ \) in cal(H)_A^(\( 3 \)) $
]
= Bose, Fermi 粒子系の量子状態の粒子数表示
<bose-fermi-粒子系の量子状態の粒子数表示>
#block[
#definition("Bose, Fermi 粒子系の量子状態の粒子数表示")[
Bose, Fermi 粒子系の粒子状態は粒子数 $n_i$ を用いて次のように表現できる.
$ \|\( n_i \)_(i in I)⟩_S & = \|n_1 \, n_2 \, dots.h \, n_i \, dots.h⟩_S = \| underbrace(phi.alt_1 phi.alt_1 dots.h.c phi.alt_1, n_1) underbrace(phi.alt_2 phi.alt_2 dots.h.c phi.alt_2, n_2) dots.h.c underbrace(phi.alt_i phi.alt_i dots.h.c phi.alt_i, n_i) dots.h.c chevron.r_S\
\|\( n_i \)_(i in I)⟩_A & = \|n_1 \, n_2 \, dots.h \, n_i \, dots.h⟩_A = \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A . $
これを粒子数表示または占有数表示という.
]
]
粒子状態
$\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S \, \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A$
の粒子数をそれぞれ $n_i^(\( s \)) \, n_i^(\( a \))$
とおくと次のような性質を満たす.
$ n_i^(\( s \)) & in bb(Z)_(gt.eq 0) \, #h(2em) sum_(i in I) n_i^(\( s \)) = N\
n_i^(\( a \)) & in { 0 \, 1 } \, quad sum_(i in I) n_i^(\( a \)) = N . $

#proposition[
Bose, Fermi 粒子系の粒子数表示は well-defined
である.
] <particles-well-defined>
#proof[
Bose, Fermi
粒子系の完全正規直交系は次のようにラベル付けされていた.
$  & \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S #h(2em) \( i_1 \, dots.h \, i_N in I \, i_1 lt.eq dots.h.c lt.eq i_N \)\
 & \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A #h(2em) \( i_1 \, dots.h \, i_N in I \, i_1 < dots.h.c < i_N \) . $
これらの完全正規直交系はどちらも昇順にソートされているのである粒子数表示に対して完全正規直交系は一意に存在する.
$  & \|\( n_i \)_(i in I)⟩_S #h(2em) (n_i in bb(Z)_(gt.eq 0) \, sum_(i in I) n_i = N)\
 & \|\( n_i \)_(i in I)⟩_A #h(2em) (n_i in { 0 \, 1 } \, sum_(i in I) n_i = N) $
逆に完全正規直交系に対して条件を満たすような粒子数表示は一意に存在する.
よって同値な表現であることがわかる.
]

#theorem[
Bose, Fermi 粒子系の粒子数表示
${ \|\( n_i \)_(i in I)⟩_S divides n_i in bb(Z)_(lt.eq 0) } \, { \|\( n_i \)_(i in I)⟩_A divides n_i in { 0 \, 1 } }$
は完全正規直交系となる.
]
#proof[
まず全粒子数 $N$ の Hilbert 空間
$cal(H)_S^(\( N \)) \, cal(H)_A^(\( N \))$ の粒子数表示について命題
@particles-well-defined より粒子数表示と完全正規直交系が対応する.
よって命題 #link(<symmetric-completely-orthonormal-system>)[symmetric-completely-orthonormal-system], 命題
#link(<asymmetric-completely-orthonormal-system>)[asymmetric-completely-orthonormal-system]
より粒子数表示は完全正規直交系となる. これより次の式が成り立つ.
$  & ⟨\( n_i \)_(i in I) mid(bar.v) \( n_(i') \)_(i in I)⟩_S = product_(i in I) delta_(n_i n_(i'))\
 & ⟨\( n_i \)_(i in I) mid(bar.v) \( n_(i') \)_(i in I)⟩_A = product_(i in I) delta_(n_i n_(i'))\
 & cal(H)_S^(\( N \)) = "span" {\|\( n_i \)_(i in I)⟩_S divides n_i in bb(Z)_(gt.eq 0) \, sum_(i in I) n_i = N}\
 & cal(H)_A^(\( N \)) = "span" {\|\( n_i \)_(i in I)⟩_A divides n_i in { 0 \, 1 } \, sum_(i in I) n_i = N}\
 & sum_(n_i in bb(Z)_(gt.eq 0) \, sum_i n_i = N) \|\( n_i \)_(i in I)⟩_S ⟨\( n_i \)_(i in I)\|_S = hat(1)_(cal(H)_S^(\( N \)))\
 & sum_(n_i in { 0 \, 1 } \, sum_i n_i = N) \|\( n_i \)_(i in I)⟩_A ⟨\( n_i \)_(i in I)\|_A = hat(1)_(cal(H)_A^(\( N \))) $
次に全粒子数を固定しない Hilbert 空間
$cal(H)_(B o s e) \, cal(H)_(F e r m i)$ について考える.
まず正規直交関係について Hilbert 空間
$cal(H)_(B o s e) \, cal(H)_(F e r m i)$
の定義より異なる全粒子数の状態は直交するから次のように計算できる.
$ ⟨\( n_i \)_(i in I) mid(bar.v) \( n_(i') \)_(i in I)⟩_S & = delta_(N N') product_(i in I) delta_(n_i n_(i')) = product_(i in I) delta_(n_i n_(i'))\
⟨\( n_i \)_(i in I) mid(bar.v) \( n_(i') \)_(i in I)⟩_A & = delta_(N N') product_(i in I) delta_(n_i n_(i')) = product_(i in I) delta_(n_i n_(i')) $
次に空間全体を張ることは定義より自明.
$ "span" {\|\( n_i \)_(i in I)⟩_S divides n_i in bb(Z)_(gt.eq 0)} & = sum_(N = 0)^oo cal(H)_S^(\( N \)) = cal(H)_(B o s e)\
"span" {\|\( n_i \)_(i in I)⟩_A divides n_i in { 0 \, 1 }} & = sum_(N = 0)^oo cal(H)_A^(\( N \)) = cal(H)_(F e r m i) $
最後に完備性については次のように計算できる.
$ sum_(n_i in bb(Z)_(gt.eq 0)) \|\( n_i \)_(i in I)⟩_S ⟨\( n_i \)_(i in I)\|_S & = sum_(N = 0)^oo hat(1)_(cal(H)_S^(\( N \))) = hat(1)_(cal(H)_(B o s e))\
sum_(n_i in { 0 \, 1 }) \|\( n_i \)_(i in I)⟩_A ⟨\( n_(i') \)_(i in I)\|_A & = sum_(N = 0)^oo hat(1)_(cal(H)_A^(\( N \))) = hat(1)_(cal(H)_(F e r m i)) $
]

= Bose 粒子系の消滅演算子 $hat(a)_i$ と生成演算子 $hat(a)_i^dagger$
<bose-粒子系の消滅演算子-hata_i-と生成演算子-hata_idagger>
#block[
#definition[
Bose 粒子系の消滅演算子 $hat(a)_i$ と生成演算子
$hat(a)_i^dagger$ を次のように定義する.
$ {hat(a)_i 1 / sqrt(N !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = 1 / sqrt(\( N - 1 \) !) sum_(mu in X\
i_mu = i) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_(mu - 1))⟩, \|phi.alt_(i_(mu + 1))⟩ dots.h.c \|phi.alt_(i_N)⟩)\
hat(a)_i^dagger 1 / sqrt(N !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = 1 / sqrt(\( N + 1 \) !) "per" mat(delim: "[", \|phi.alt_i⟩, \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) $
その上で個数演算子 $hat(n)_i = hat(a)_i^dagger hat(a)$ と全粒子数演算子
$display(hat(N) = sum_(i in I) hat(n)_i)$ と定義する.
]
]
#theorem("Q21-35")[
Bose 粒子系の消滅,
生成演算子の定義と次は同値である.
$ {hat(a)_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S = sqrt(n_i) \|phi.alt_(i_1) dots.h.c phi.alt_(i_(mu - 1)) phi.alt_(i_(mu + 1)) dots.h.c phi.alt_(i_N)⟩_S\
hat(a)_i^dagger \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S = sqrt(n_i + 1) \|phi.alt_(i_1) dots.h.c phi.alt_i dots.h.c phi.alt_(i_N)⟩_S $
] <Bose-creation-and-annihilation-1>
#proof[
Bose 粒子系の粒子数表示は次のように展開できる.
$ \|phi.alt_(i_1) \, dots.h \, phi.alt_(i_N)⟩_S = 1 / sqrt(N ! product_(j in I) n_j !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) $
また permutation は置換に対して不変であるので定義と次は同値である.
$  & {hat(a)_i 1 / sqrt(N !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = n_i / sqrt(\( N - 1 \) !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_(mu - 1))⟩, \|phi.alt_(i_(mu + 1))⟩ dots.h.c \|phi.alt_(i_N)⟩)\
hat(a)_i^dagger 1 / sqrt(N !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = 1 / sqrt(\( N + 1 \) !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_i⟩ dots.h.c \|phi.alt_(i_N)⟩)\
arrow.l.r.double & {hat(a)_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S = n_i / sqrt(\( N - 1 \) ! product_(j in I) n_j !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_(mu - 1))⟩, \|phi.alt_(i_(mu + 1))⟩ dots.h.c \|phi.alt_(i_N)⟩)\
hat(a)_i^dagger \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S = 1 / sqrt(\( N + 1 \) ! product_(j in I) n_j !) "per" mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_i⟩ dots.h.c \|phi.alt_(i_N)⟩)\
arrow.l.r.double & {hat(a)_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S = sqrt(n_i) \|phi.alt_(i_1) dots.h.c phi.alt_(i_(mu - 1)) phi.alt_(i_(mu + 1)) dots.h.c phi.alt_(i_N)⟩_S\
hat(a)_i^dagger \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S = sqrt(n_i + 1) \|phi.alt_(i_1) dots.h.c phi.alt_i dots.h.c phi.alt_(i_N)⟩_S $
よって $cal(H)_S^(\( N \))$ の完全正規直交系で表現できる.
]

#theorem("Q21-36")[
Bose 粒子系の消滅,
生成演算子の定義と次は同値である.
$ {hat(a)_i \|dots.h \, n_i \, dots.h⟩ = sqrt(n_i) \|dots.h \, n_i - 1 \, dots.h⟩\
hat(a)_i^dagger \|dots.h \, n_i \, dots.h⟩ = sqrt(n_i + 1) \|dots.h \, n_i + 1 \, dots.h⟩ $
] <Bose-creation-and-annihilation-2>
#proof[
定理 @Bose-creation-and-annihilation-1
を吟味することで消滅演算子によって添字 $i$ の 1 粒子状態を消滅させ,
生成演算子によって添字 $i$ の 1 粒子状態を生成していることがわかる.
よって粒子数表示に直すことで定義と同値となる.
]

#block[
#proposition("Q21-37(i)(ii)(iii)(iv)(v)(vi)(vii)")[
Bose 粒子系における消滅, 生成演算子の交換関係は次のようになる.
$ \[ hat(a)_i \, hat(a)_j^dagger \] & = delta_(i j) \, #h(2em) \[ hat(a)_i \, hat(a)_j \] = \[ hat(a)_i^dagger \, hat(a)_j^dagger \] = 0 $
]

]
#proof[
消滅演算子 $hat(a)_i$, 生成演算子 $hat(a)_i^dagger$
を状態 $\|dots.h \, n_i \, dots.h⟩ in cal(H)_(B o s e)$ に適用すると
$ hat(a)_i hat(a)_i^dagger \|dots.h \, n_i \, dots.h⟩ & = sqrt(n_i + 1) hat(a)_i \|dots.h \, n_i + 1 \, dots.h⟩ = \( n_i + 1 \) \|dots.h \, n_i \, dots.h⟩\
hat(a)_i^dagger hat(a)_i \|dots.h \, n_i \, dots.h⟩ & = sqrt(n_i) hat(a)_i^dagger \|dots.h \, n_i - 1 \, dots.h⟩ = n_i \|dots.h \, n_i \, dots.h⟩ $
よりそれぞれの交換関係は次のようになる.
$ \[ hat(a)_i \, hat(a)_i^dagger \] & = hat(a)_i hat(a)_i^dagger - hat(a)_i^dagger hat(a)_i = \( n_i + 1 \) - n_i = 1\
\[ hat(a)_i \, hat(a)_i \] & = \[ hat(a)_i^dagger \, hat(a)_i^dagger \] = 0 $
異なる添字 $i \, j$ についても状態
$\|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩ in cal(H)_(B o s e)$
に適用すると
$ hat(a)_i hat(a)_j \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩ & = sqrt(n_i n_j) \|dots.h \, n_i - 1 \, dots.h \, n_j - 1 \, dots.h⟩\
hat(a)_i hat(a)_j^dagger \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩ & = sqrt(n_i \( n_j + 1 \)) \|dots.h \, n_i - 1 \, dots.h \, n_j + 1 \, dots.h⟩\
hat(a)_j^dagger hat(a)_i \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩ & = sqrt(n_i \( n_j + 1 \)) \|dots.h \, n_i - 1 \, dots.h \, n_j + 1 \, dots.h⟩\
hat(a)_i^dagger hat(a)_j^dagger \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩ & = sqrt(\( n_i + 1 \) \( n_j + 1 \)) \|dots.h \, n_i + 1 \, dots.h \, n_j + 1 \, dots.h⟩ $
よりそれぞれの交換関係は次のようになる.
$ \[ hat(a)_i \, hat(a)_j^dagger \] & = \[ hat(a)_i \, hat(a)_j \] = \[ hat(a)_i^dagger \, hat(a)_j^dagger \] = 0 $
よって示された.
]

#block[
#proposition("Q21-38(i)(ii)")[
Bose
粒子系における消滅, 生成演算子は互いに Hermite 共役である.
]

]
#proof[
次の計算により $hat(a)_i \, hat(a)_i^dagger$ は互いに
Hermite 共役であることがわかる.
$ \( ⟨n_1 \, dots.h \, n_i \, dots.h\| hat(a)_i \) \|n_(1') \, dots.h \, n_(i') \, dots.h⟩ & = sqrt(n_i + 1) ⟨n_1 \, dots.h \, n_i + 1 \, dots.h mid(bar.v) n_(1') \, dots.h \, n_(i') \, dots.h⟩\
 & = delta_(n_1 n_(1')) dots.h.c sqrt(n_i + 1) delta_(n_i + 1 \, n_(i')) dots.h.c\
 & = delta_(n_1 n_(1')) dots.h.c sqrt(n_(i')) delta_(n_i \, n_(i') - 1) dots.h.c\
 & = sqrt(n_(i')) ⟨n_1 \, dots.h \, n_i \, dots.h mid(bar.v) n_(1') \, dots.h \, n_(i') - 1 \, dots.h⟩\
 & = ⟨n_1 \, dots.h \, n_i \, dots.h\| \( hat(a)_i \|n_(1') \, dots.h \, n_(i') \, dots.h⟩ \) $
]

#block[
#proposition("Q21-39(i)(ii)(iii)(iv)")[
個数演算子 $hat(n)_i$ と全粒子数演算子 $hat(N)$ は Hermite 演算子であり,
固有値は $hat(n)_i = n_i \, hat(N) = N$ となる.
]

]
#proof[
個数演算子 $hat(n)_i$, 全粒子数演算子 $hat(N)$
はそれぞれ生成消滅演算子, 個数演算子に展開でき, Hermite
演算子であることがわかる.
$ hat(n)_i & = hat(a)_i^dagger hat(a)_i & hat(n)_i^dagger & = \( hat(a)_i^dagger hat(a)_i \)^dagger = hat(a)_i^dagger hat(a)_i = hat(n)\
hat(N) & = sum_(i in I) hat(n)_i & hat(N)^dagger & = sum_(i in I) hat(n)_i^dagger = sum_(i in I) hat(n)_i = hat(N) $
そして固有値は次のように計算できる.
$ hat(n)_i \|dots.h \, n_i \, dots.h⟩ & = hat(a)_i^dagger hat(a)_i \|dots.h \, n_i \, dots.h⟩ = sqrt(n_i) hat(a)_i^dagger \|dots.h \, n_i - 1 \, dots.h⟩ = n_i \|dots.h \, n_i \, dots.h⟩\
hat(N) \|\( n_i \)_(i in I)⟩ & = sum_(j in I) hat(n)_j \|\( n_i \)_(i in I)⟩ = sum_(j in I) n_j \|\( n_i \)_(i in I)⟩ = N \|\( n_i \)_(i in I)⟩ $
]

#block[
#definition[
真空状態 $\|upright(v a c)⟩$
を次のように定義する.
$ cases(delim: "{", hat(a)_i \|upright(v a c)⟩ = 0 & \( forall i in I \), ⟨upright(v a c) mid(bar.v) upright(v a c)⟩ = 1) $
]
]
#block[
#proposition("Q21-40(i)")[
真空状態 $\|upright(v a c)⟩$
は粒子が 1 個も存在しない状態 $\|0 \, dots.h \, 0 \, dots.h⟩$
と同じである.
]

] <Bose-vac-0>
#proof[
任意の個数演算子で係数が $0$ となることから分かる.
$ hat(n)_i \|upright(v a c)⟩ & = hat(a)_i^dagger hat(a)_i \|upright(v a c)⟩ = 0 $
]

#block[
#proposition("Q21-40(ii)")[
任意の完全正規直交系の元は真空状態を用いて表現できる.
$ \|\( n_i \)_(i in I)⟩ & = product_(i in I) frac(\( hat(a)_i^dagger \)^(n_i), sqrt(n_i !)) \|upright(v a c)⟩ $
]

]
#proof[
命題 #link(<Bose-vac-0>)[Bose-vac-0] より次のように変形できる.
$ product_(i in I) frac(\( hat(a)_i^dagger \)^(n_i), sqrt(n_i !)) \|upright(v a c)⟩ & = product_(i in I) frac(\( hat(a)_i^dagger \)^(n_i), sqrt(n_i !)) \|0 \, dots.h \, 0 \, dots.h⟩\
 & = product_(i in I) 1 / sqrt(n_i !) sqrt(n_i !) \|0 \, dots.h \, n_i \, dots.h⟩\
 & = \|n_1 \, dots.h \, n_i \, dots.h⟩ $
]

#block[
#theorem("Q21-41(i)")[
Bose 粒子系における消滅演算子
$hat(a)_i$ と生成演算子 $hat(a)_i^dagger$
において次の性質は定義と同値である.
$ \( hat(a)_i \)^dagger = hat(a)_i^dagger \, #h(2em) \[ hat(a)_i \, hat(a)_j^dagger \] = delta_(i j) \, #h(2em) \[ hat(a)_i \, hat(a)_j \] = \[ hat(a)_i^dagger \, hat(a)_j^dagger \] = 0 \, #h(2em) hat(n)_i = hat(a)_i^dagger hat(a)_i = n_i $
]

]
#proof[
既に定義から性質を導くことはしているので性質から定義を導く.
$ hat(n)_i hat(a)_i & = \( hat(a)_i^dagger hat(a)_i \) hat(a)_i = \( hat(a)_i hat(a)_i^dagger - 1 \) hat(a)_i = \( n_i - 1 \) hat(a)_i\
hat(n)_i hat(a)_i^dagger & = hat(a)_i^dagger \( hat(a)_i hat(a)_i^dagger \) = hat(a)_i^dagger \( hat(a)_i^dagger hat(a)_i + 1 \) = \( n_i + 1 \) hat(a)_i^dagger\
hat(n)_j hat(a)_i & = hat(a)_j^dagger hat(a)_j hat(a)_i = hat(a)_i hat(a)_j^dagger hat(a)_j = n_j hat(a)_i & \( i eq.not j \)\
hat(n)_j hat(a)_i^dagger & = hat(a)_j^dagger hat(a)_j hat(a)_i^dagger = hat(a)_i^dagger hat(a)_j^dagger hat(a)_j = n_j hat(a)_i^dagger & \( i eq.not j \) $
より $hat(a)_i \, hat(a)_i^dagger$ を適用すると状態の粒子数 $n_i$ が 1
だけ上下する. また $\( hat(a)_i \)^dagger = hat(a)_i^dagger$ より
$  & ⟨dots.h \, n_i - 1 \, dots.h\| hat(a)_i \|dots.h \, n_i \, dots.h⟩ = ⟨dots.h \, n_i \, dots.h\| hat(a)_i^dagger \|dots.h \, n_i - 1 \, dots.h⟩\
 & n_i = ⟨dots.h \, n_i \, dots.h\| hat(a)_i^dagger hat(a)_i \|dots.h \, n_i \, dots.h⟩ $
であるから次のようになる.
$ hat(a)_i \|dots.h \, n_i \, dots.h⟩ & = sqrt(n_i) \|dots.h \, n_i - 1 \, dots.h⟩\
hat(a)_i^dagger \|dots.h \, n_i \, dots.h⟩ & = sqrt(n_i + 1) \|dots.h \, n_i + 1 \, dots.h⟩ $
これらの式から定理 @Bose-creation-and-annihilation-1 より定義を導ける.
]

= Fermi 粒子系の消滅演算子 $hat(c)_i$ と生成演算子 $hat(c)_i^dagger$
<fermi-粒子系の消滅演算子-hatc_i-と生成演算子-hatc_idagger>
#block[
#definition[
Fermi 粒子系の消滅演算子 $hat(c)_i$ と生成演算子
$hat(c)_i^dagger$ を次のように定義する.
$ {hat(c)_i 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = 1 / sqrt(\( N - 1 \) !) sum_(mu in bb(Z)_N\
i_mu = i) \( - 1 \)^mu det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_(mu - 1))⟩, \|phi.alt_(i_(mu + 1))⟩ dots.h.c \|phi.alt_(i_N)⟩)\
hat(c)_i^dagger 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = 1 / sqrt(\( N + 1 \) !) det mat(delim: "[", \|phi.alt_i⟩, \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) $
その上で個数演算子 $hat(n)_i = hat(c)_i^dagger hat(c)$ と全粒子数演算子
$display(hat(N) = sum_(i in I) hat(n)_i)$ と定義する.
]
]
#theorem("Q21-50")[
Fermi 粒子系の消滅, 生成演算子
$hat(c)_i \, hat(c)_i^dagger$ の定義は次の式と同値である.
$ {hat(c)_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A = \( - 1 \)^mu n_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_(mu - 1)) phi.alt_(i_(mu + 1)) dots.h.c phi.alt_(i_N)⟩_A\
hat(c)_i^dagger \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A = \( - 1 \)^mu \|phi.alt_(i_1) dots.h.c phi.alt_i dots.h.c phi.alt_(i_N)⟩_A $
]
#proof[
Fermi 粒子系の消滅, 生成演算子の定義は
$\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A$ の粒子数 $n_i$
を用いて次のようになる.
$ hat(c)_i 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) & = frac(\( - 1 \)^mu n_i, sqrt(\( N - 1 \) !)) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_(mu - 1))⟩, \|phi.alt_(i_(mu + 1))⟩ dots.h.c \|phi.alt_(i_N)⟩)\
hat(c)_i^dagger 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) & = 1 / sqrt(\( N + 1 \) !) det mat(delim: "[", \|phi.alt_i⟩, \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩)\
 & = frac(\( - 1 \)^mu, sqrt(\( N + 1 \) !)) det mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_i⟩ dots.h.c \|phi.alt_(i_N)⟩) $
Fermi 粒子系の状態は次のように展開できる.
$ \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A & = 1 / sqrt(N !) det mat(delim: "[", \|phi.alt_(i_1)⟩, dots.h.c, \|phi.alt_(i_N)⟩) $
これより定義と次の式は同値である.
$ {hat(c)_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A = \( - 1 \)^mu n_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_(mu - 1)) phi.alt_(i_(mu + 1)) dots.h.c phi.alt_(i_N)⟩_A\
hat(c)_i^dagger \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A = \( - 1 \)^mu \|phi.alt_(i_1) dots.h.c phi.alt_i dots.h.c phi.alt_(i_N)⟩_A $
]

#theorem("Q21-51")[
Fermi 粒子系の消滅, 生成演算子
$hat(c)_i \, hat(c)_i^dagger$ の定義は次と同値である.
$ {hat(c)_i \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) n_i \|dots.h \, 1 - n_i \, dots.h⟩_A\
hat(c)_i^dagger \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) \( 1 - n_i \) \|dots.h \, 1 - n_i \, dots.h⟩_A $
]
#proof[
Fermi 粒子系の粒子数表示は次のように展開できる.
$ \|n_1 \, dots.h \, n_i \, dots.h⟩_A & = \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A $
これに加え, 粒子数が 2 以上だと零状態となることから次のように変形できる.
$  & {hat(c)_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A = \( - 1 \)^mu n_i \|phi.alt_(i_1) dots.h.c phi.alt_(i_(mu - 1)) phi.alt_(i_(mu + 1)) dots.h.c phi.alt_(i_N)⟩_A\
hat(c)_i^dagger \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_A = \( - 1 \)^mu \|phi.alt_(i_1) dots.h.c phi.alt_i dots.h.c phi.alt_(i_N)⟩_A\
arrow.l.r.double & {hat(c)_i \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) n_i \|dots.h \, n_i - 1 \, dots.h⟩_A\
hat(c)_i^dagger \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) \|dots.h \, n_i + 1 \, dots.h⟩_A\
arrow.l.r.double & {hat(c)_i \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) n_i \|dots.h \, 1 - n_i \, dots.h⟩_A\
hat(c)_i^dagger \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) \( 1 - n_i \) \|dots.h \, 1 - n_i \, dots.h⟩_A\
arrow.l.r.double & {hat(c)_i \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) n_i \|dots.h \, 0 \, dots.h⟩_A\
hat(c)_i^dagger \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) \( 1 - n_i \) \|dots.h \, 1 \, dots.h⟩_A $
よって定義と同値である.
]

#block[
#theorem("Q21-52(i)(ii)(iii)(iv)(v)(vi)(vii)(viii)(ix)(x)(xi)(xii)(xiii)(xiv)(xv)(xvi)(xvii)(xviii)(xix)(xx)")[
Fermi 粒子系における消滅演算子 $hat(c)_i$ と生成演算子 $hat(c)_i^dagger$
の反交換関係は次のようになる.
$ { hat(c)_i \, hat(c)_j^dagger } = delta_(i j) \, #h(2em) { hat(c)_i \, hat(c)_j } = { hat(c)_i^dagger \, hat(c)_j^dagger } = 0 $
]

]
#proof[
消滅演算子 $hat(c)_i$, 生成演算子 $hat(c)_i^dagger$
は次のように表現できた.
$ {hat(c)_i \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) n_i \|dots.h \, 0 \, dots.h⟩_A\
hat(c)_i^dagger \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) \( 1 - n_i \) \|dots.h \, 1 \, dots.h⟩_A $
消滅演算子 $hat(c)_i$, 生成演算子 $hat(c)_i^dagger$ を状態
$\|dots.h \, n_i \, dots.h⟩_A in cal(H)_(F e r m i)$ に適用すると
$ hat(c)_i hat(c)_i^dagger \|dots.h \, n_i \, dots.h⟩_A & = \( 1 - n_i \) \|dots.h \, 0 \, dots.h⟩_A\
hat(c)_i^dagger hat(c)_i \|dots.h \, n_i \, dots.h⟩_A & = n_i \|dots.h \, 1 \, dots.h⟩_A\
hat(c)_i hat(c)_i \|dots.h \, n_i \, dots.h⟩_A & = 0\
hat(c)_i^dagger hat(c)_i^dagger \|dots.h \, n_i \, dots.h⟩_A & = 0 $
よりそれぞれの反交換関係は次のようになる.
$ { hat(c)_i \, hat(c)_i^dagger } = 1 \, #h(2em) { hat(c)_i \, hat(c)_i } = { hat(c)_i^dagger \, hat(c)_i^dagger } = 0 $
次に異なる添字 $i \, j$ が $i < j$ の順となっているとき状態
$\|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩ in cal(H)_(B o s e)$
に適用すると次のようになる.
$ hat(c)_i hat(c)_j^dagger \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(sum_(k = i)^(j - 1) n_k) n_i \( 1 - n_j \) \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A\
hat(c)_j^dagger hat(c)_i \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(1 + sum_(k = i)^(j - 1) n_k) n_i \( 1 - n_j \) \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A\
hat(c)_i^dagger hat(c)_j \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(sum_(k = i)^(j - 1) n_k) \( 1 - n_i \) n_j \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A\
hat(c)_j hat(c)_i^dagger \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(1 + sum_(k = i)^(j - 1) n_k) \( 1 - n_i \) n_j \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A\
hat(c)_i hat(c)_j \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(sum_(k = i)^(j - 1) n_k) n_i n_j \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A\
hat(c)_j hat(c)_i \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(1 + sum_(k = i)^(j - 1) n_k) n_i n_j \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A\
hat(c)_i^dagger hat(c)_j^dagger \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(sum_(k = i)^(j - 1) n_k) \( 1 - n_i \) \( 1 - n_j \) \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A\
hat(c)_j^dagger hat(c)_i^dagger \|dots.h \, n_i \, dots.h \, n_j \, dots.h⟩_A & = \( - 1 \)^(1 + sum_(k = i)^(j - 1) n_k) \( 1 - n_i \) \( 1 - n_j \) \|dots.h \, 1 - n_i \, dots.h \, 1 - n_j \, dots.h⟩_A $
これより ${ A \, B } = { B \, A }$
も用いてそれぞれの反交換関係は次のようになる.
$ { hat(c)_i \, hat(c)_j^dagger } = { hat(c)_i \, hat(c)_j } = { hat(c)_i^dagger \, hat(c)_j^dagger } & = 0 #h(2em) \( i eq.not j \) $
よって示された.
]

#block[
#proposition("Q21-53(i)(ii)")[
Fermi
粒子系における消滅演算子 $hat(c)_i$ と生成演算子 $hat(c)_i^dagger$
は互いに Hermite 共役である.
]

]
#proof[
次のように計算することで Hermite
共役であることがわかる.
$ ⟨n_1 \, dots.h \, n_i \, dots.h\|_A \( hat(c)_i \|n_(1') \, dots.h \, n_(i') \, dots.h⟩_A \) & = \( - 1 \)^(sum_(j = 1)^(i - 1) n_(j')) n_(i') ⟨n_1 \, dots.h \, n_i \, dots.h mid(bar.v) n_(1') \, dots.h \, 1 - n_(i') \, dots.h⟩_A\
 & = \( - 1 \)^(sum_(j = 1)^(i - 1) n_(j')) n_(i') delta_(n_1 n_(1')) dots.h.c delta_(n_i \, 1 - n_(i')) dots.h.c\
 & = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) \( 1 - n_i \) delta_(n_1 n_(1')) dots.h.c delta_(1 - n_i \, n_(i')) dots.h.c\
 & = \( - 1 \)^(sum_(j = 1)^(i - 1) n_j) \( 1 - n_i \) ⟨n_1 \, dots.h \, 1 - n_i \, dots.h mid(bar.v) n_(1') \, dots.h \, n_(i') \, dots.h⟩_A\
 & = \( ⟨n_1 \, dots.h \, n_i \, dots.h\|_A hat(c)_i \) \|n_(1') \, dots.h \, n_(i') \, dots.h⟩_A $
]

#block[
#proposition("Q21-54(i)(ii)(iii)(iv)")[
個数演算子 $hat(n)_i$ と全粒子数演算子 $hat(N)$ は Hermite 演算子であり,
それぞれの固有値はそれぞれ $n_i$, $N$ となる.
]

]
#proof[
Fermi 系の個数演算子 $hat(n)_i$ と全粒子数演算子
$hat(N)$ は次のように展開でき, Hermite 演算子であることがわかる.
$ hat(n)_i & = hat(c)_i^dagger hat(c)_i & hat(n)_i^dagger & = \( hat(c)_i^dagger hat(c)_i \)^dagger = hat(c)_i^dagger hat(c)_i = hat(n)_i\
hat(N) & = sum_(i in I) hat(n)_i & hat(N)^dagger & = sum_(i in I) hat(n)_i^dagger = sum_(i in I) hat(n)_i = hat(N)\
 $ また完全正規直交系の粒子数表示 $\|\( n_i \)_(i in I)⟩_A$
の固有値は次のようになる.
$ hat(n)_i \|dots.h \, n_i \, dots.h⟩_A & = hat(c)_i^dagger hat(c)_i \|dots.h \, n_i \, dots.h⟩_A = \( - 1 \)^(2 sum_(j = 1)^(i - 1) n_j) n_i^2 \|dots.h \, n_i \, dots.h⟩_A = n_i \|dots.h \, n_i \, dots.h⟩_A\
hat(N) \|\( n_i \)_(i in I)⟩_A & = sum_(i in I) hat(n)_i \|\( n_i \)_(i in I)⟩_A = sum_(i in I) n_i \|\( n_i \)_(i in I)⟩_A = N \|\( n_i \)_(i in I)⟩_A $
]

#block[
#definition[
真空状態 $\|upright(v a c)⟩$
を次のように定義する.
$ cases(delim: "{", hat(c)_i \|upright(v a c)⟩ = 0 & \( i in I \), ⟨upright(v a c) mid(bar.v) upright(v a c)⟩ = 1) $
]
]
#block[
#proposition("Q21-55(i)")[
真空状態 $\|upright(v a c)⟩$
は粒子が 1 つもない状態 $\|0 \, dots.h \, 0 \, dots.h⟩$ と同じである.
]

]
#proof[
個数演算子 $hat(n)_i$ を適用すると $n_i = 0$ であり,
$\|0 \, dots.h \, 0 \, dots.h⟩$ であることがわかる.
$ hat(n)_i \|upright(v a c)⟩ = hat(c)_i^dagger hat(c)_i \|upright(v a c)⟩ = 0 $
]

#block[
#theorem("Q21-55(ii)")[
任意の完全正規直交系の元は真空状態を用いて表現できる.
$ \|\( n_i \)_(i in I)⟩ & = hat(c)_(i_1)^dagger dots.h.c hat(c)_(i_N)^dagger \|upright(v a c)⟩ #h(2em) \( i_1 < dots.h.c < i_N \) $
]

]
#proof[
適用する順番が大きい順である為, それ以前の粒子数は必ず
$0$ となる. これより次のように計算できる.
$ hat(c)_(i_1)^dagger dots.h.c hat(c)_(i_N)^dagger \|upright(v a c)⟩ & = hat(c)_(i_1)^dagger dots.h.c hat(c)_(i_N)^dagger \|0 \, dots.h \, 0 \, dots.h⟩ = \|\( n_i \)_(i in I)⟩ $
]

= Bose, Fermi 粒子系の消滅演算子 $hat(b)_i$ と生成演算子 $hat(b)_i^dagger$
<bose-fermi-粒子系の消滅演算子-hatb_i-と生成演算子-hatb_idagger>
#block[
#definition("Bose, Fermi 粒子系の統一")[
まず Bose 粒子系と Fermi 粒子系を統一した系の Hilbert 空間を
$cal(H)_(upright(M . P .))$ と定義する.
$ cal(H)_(upright(M . P .)) := cases(delim: "{", cal(H)_(B o s e) & \( B o s e \), cal(H)_(F e r m i) & \( F e r m i \)) $
更に消滅演算子や行列式, 交換関係の統一的な表記を次のように定義する.
$ hat(b)_i & = cases(delim: "{", hat(a)_i & \( B o s e \), hat(c)_i & \( F e r m i \)) \, quad det^(\( plus.minus \)) = cases(delim: "{", "per" & \( + \), det & \( - \)) \, quad \[ hat(A) \, hat(B) \]_minus.plus = cases(delim: "{", \[ hat(A) \, hat(B) \] & \( - \), { hat(A) \, hat(B) } & \( + \)) $
その上で個数演算子 $hat(n)_i = hat(b)_i^dagger hat(b)_i$
と全粒子数演算子 $display(hat(N) = sum_(i in I) hat(n)_i)$ を定義する.
]
]
今までの Bose, Fermi 粒子系の定義, 定理を統一的に表記する.

まず生成演算子, 消滅演算子の定義は次のように書ける.
$ {hat(b)_i 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = 1 / sqrt(\( N - 1 \) !) sum_(mu in X\
i_mu = i) \( plus.minus 1 \)^mu det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_(mu - 1))⟩, \|phi.alt_(i_(mu + 1))⟩ dots.h.c \|phi.alt_(i_N)⟩)\
hat(b)_i^dagger 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) = 1 / sqrt(\( N + 1 \) !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_i⟩, \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) $
そしてその交換関係・反交換関係は次のようになる.
$ \[ hat(b)_i \, hat(b)_j^dagger \]_minus.plus & = delta_(i j) \, quad \[ hat(b)_i \, hat(b)_j \]_minus.plus = \[ hat(b)_i^dagger \, hat(b)_j^dagger \]_minus.plus = 0 $
真空状態 $\|upright(v a c)⟩$ をこのように定義する.
$ cases(delim: "{", hat(b)_i \|upright(v a c)⟩ = 0 & \( i in I \), ⟨upright(v a c) mid(bar.v) upright(v a c)⟩ = 1) $
$ \|\( n_i \)_(i in I)⟩ & = product_(i in I) frac(\( hat(b)_i^dagger \)^(n_i), sqrt(n_i !)) \|upright(v a c)⟩ $

$ det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_(sigma \( 1 \)))⟩ dots.h.c \|phi.alt_(i_(sigma \( N \)))⟩) & = \( plus.minus 1 \)^sigma det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩)\
\|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩ & = 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩) $

$ hat(rho) \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) & = hat(phi.alt)^dagger \( bold(r) \, s_z \) hat(phi.alt) \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r)' \, s_(z') \)\
 & = plus.minus hat(phi.alt)^dagger \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) hat(phi.alt) \( bold(r) \, s_z \) + delta \( bold(r) - bold(r)' \) delta_(s_z s_(z')) hat(phi.alt)^dagger \( bold(r) \, s_z \)\
 & = hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) hat(phi.alt)^dagger \( bold(r) \, s_z \) hat(phi.alt) \( bold(r) \, s_z \) + delta \( bold(r) - bold(r)' \) delta_(s_z s_(z')) hat(phi.alt)^dagger \( bold(r)' \, s_(z') \)\
 & = hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) hat(rho) \( bold(r) \, s_z \) + delta \( bold(r) - bold(r)' \) delta_(s_z s_(z')) hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) $

= 演算子の粒子数表示: 1 粒子演算子とその和、2 粒子演算子とその和の導入
<演算子の粒子数表示-1-粒子演算子とその和2-粒子演算子とその和の導入>
現実の粒子系における観測量はある 1 つの相互作用に関して関与する粒子数は
1 個か 2 個しかない. これを 1 粒子演算子, 2 粒子演算子と呼ぶ.

#block[
#definition("$n$ 粒子演算子")[
Hilbert
空間 $cal(H)^(\( n \))$ において粒子交換に関して対称な演算子を $n$
粒子演算子と呼ぶ. このとき $n$ 粒子演算子 $hat(f)$ を Hilbert 空間
$cal(H)^(\( N \))$ の粒子 $mu_1 \, dots.h \, mu_n$
に対して埋め込んだ演算子を $hat(f)_(mu_1 dots.h.c mu_n)$ と書く. そして
$n$ 粒子演算子の粒子対に関する和 $hat(f)^(upright(t o t))$
を次のように定義する.
$ hat(f)^(upright(t o t)) = sum_(mu_1 \, dots.h \, mu_n in X\
mu_1 < dots.h.c < mu_n) hat(f)_(mu_1 dots.h.c mu_n) $
特に量子力学では今のところ 3 粒子以上が相互に作用することはない為に 1
粒子演算子と 2 粒子演算子のみが扱われる. そして $cal(H)^(\( N \))$
において明らかに状態が ${ \|phi.alt_i⟩ }_(i in I)$
を用いて表現されているならば添字を用いて表示すると定義する.
$ \|i_1 dots.h.c i_N⟩ = \|phi.alt_(i_1)⟩ dots.h.c \|phi.alt_(i_N)⟩ $
]
]
#example[
例えば Hamiltonian 演算子 $hat(H)$ は 1
粒子演算子の粒子に関する和 $hat(h)^(upright(t o t))$ と2
粒子演算子の粒子対に関する和 $hat(v)^(upright(t o t))$ で表現できる.
外部から磁場 $B$ をかけた多電子原子を考える。原子番号 $Z$
の多電子原子を考えることにします。原点に電荷 $+ Z e$
を持ち無限に重い原子核が位置しているとします。その回りに、$N$
個のそれぞれが電荷 $- e$ と質量 $m e$
を持つ電子が運動しているとします。この原子が中性原子の状態にあるならば
$N = Z$ であり、また、自然数 $n = 1 \, 2 \, dots.h$ に関して $n$
価の陽イオンの状態にあるならば $N = Z - n$ であります。この $N$
個の電子という同種粒子からなる物理系を記述する Hamiltonian 演算子
$hat(H)$ は次のように与えられます.
$hat(H) = hat(h)^(upright(t o t)) + hat(v)^(upright(t o t))$
$ hat(H) & = frac(1, 2 m_e) sum_(mu = 1)^N hat(bold(p))_mu^2 - Z e^2 sum_(mu = 1)^N frac(1, \| hat(bold(r))_mu \|) + e^2 sum_(1 lt.eq mu < nu lt.eq N) frac(1, \| hat(bold(r))_mu - hat(bold(r))_nu \|) + frac(e, 2 m_e c) \( hat(bold(L)) + 2 hat(bold(S)) \) dot.op bold(B) + frac(e^2, 8 m_e c^2) sum_(mu = 1)^N \( bold(B) times hat(bold(r))_mu \)^2\
hat(h)_mu & = frac(1, 2 m_e) hat(bold(p))_mu^2 - frac(Z e^2, \| hat(bold(r))_mu \|) + frac(e, 2 m_e c) \( hat(bold(l)_mu) + 2 hat(bold(s)_mu) \) dot.op bold(B) + frac(e^2, 8 m_e c^2) \( bold(B) times hat(bold(r))_mu \)^2\
hat(v)_(mu nu) & = frac(e^2, \| hat(bold(r))_mu - hat(bold(r))_nu \|) $
]
= $n$ 粒子演算子の和の粒子数表示
<n-粒子演算子の和の粒子数表示>
Bose, Fermi 粒子系や 1, 2 粒子演算子を分ける理由がよく分からなかったので
1 つにまとめました. これらの章の採点については難しければ 0 点でいいです.
2 粒子演算子において $alpha \, beta$ の定義がよろしくないです.

#theorem[
$n$ 粒子演算子について次のような性質が認められる.
$ hat(f)^(upright(t o t)) & = hat(P) \( sigma \) hat(f)^(upright(t o t)) hat(P)^dagger \( sigma \)\
hat(f)^(upright(t o t)) & = frac(1, n !) sum_(mu_1 \, dots.h \, mu_n in X\
mu_nu eq.not mu_xi) hat(f)_(mu_1 dots.h.c mu_n) $
]
#proof[
置換に関して対称な演算子であるから
$mu_1 \, dots.h \, mu_n$ 番目の状態の置換に対して不変であり,
その他の添字については置換しても両側で対応を取れているのでこちらも置換に対して不変である.
$ ⟨i_1 dots.h.c i_N\| hat(P) \( sigma \) hat(f)^(upright(t o t)) hat(P)^dagger \( sigma \) \|j_1 dots.h.c j_N⟩ & = sum_(mu_1 \, dots.h \, mu_n in X\
mu_1 < dots.h.c < mu_n) ⟨i_(sigma \( 1 \)) dots.h.c i_(sigma \( N \))\| hat(f)_(mu_1 dots.h.c mu_n) \|j_(sigma \( 1 \)) dots.h.c j_(sigma \( N \))⟩\
 & = sum_(mu_1 \, dots.h \, mu_n in X\
mu_1 < dots.h.c < mu_n) ⟨i_1 dots.h.c i_N\| hat(f)_(mu_1 dots.h.c mu_n) \|j_1 dots.h.c j_N⟩\
 & = ⟨i_1 dots.h.c i_N\| hat(f)^(upright(t o t)) \|j_1 dots.h.c j_N⟩ $
また置換に対して対称であるから次のようにも変形できる.
$ hat(f)^(upright(t o t)) & = sum_(mu_1 \, dots.h \, mu_n in X\
mu_1 < dots.h.c < mu_n) hat(f)_(mu_1 dots.h.c mu_n) = frac(1, n !) sum_(mu_1 \, dots.h \, mu_n in X\
mu_n eq.not mu_(n')) hat(f)_(mu_1 dots.h.c mu_n) $
]

#example("Q21-58, Q21-59, Q21-60")[
1
粒子演算子 $hat(h)$, 2 粒子演算子 $hat(v)$ についても上の定理が成り立つ.
$ hat(h) & = hat(P) \( sigma \) hat(h) hat(P)^dagger \( sigma \)\
hat(v) & = hat(P) \( sigma \) hat(v) hat(P)^dagger \( sigma \) . $
例えば 2 粒子演算子 $hat(v)$ について交換演算子で置換すると
$ ⟨j i\| v \|l k⟩ & = ⟨j i\| hat(E) hat(v) hat(E)^dagger \|l k⟩ = ⟨i j\| v \|k l⟩ $
となる.
]
#block[
#theorem("Q21-61(i)(ii)(iii)(iv)(v)(vi)(vii)(viii), Q21-62, Q21-63(i)(ii)(iii), Q21-64(i)(ii)(iii), Q21-65(i)(ii)(iii), Q21-66(i)(ii), Q21-67(i)(ii)(iii)(iv)(v)(vi)(vii)(viii)(ix)(x)(xi)(xii)(xiii)(xiv)(xv)(xvi), Q21-68, Q21-69(i)(ii)(iii)(iv), Q21-70(i)(ii)(iii)(iv)(v)(vi)(vii)(viii), Q21-71(i)(ii)(iii), Q21-72(i)(ii)(iii), Q21-73(i)(ii)(iii), Q21-74(i)(ii), \\\\ Q21-75(i)(ii)(iii)(iv)(v)(vi)(vii)(viii)(ix)(x)(xi)(xii)(xiii)(xiv)(xv)(xvi), Q21-76, Q21-77(i)(ii)(iii)(iv)")[
Bose, Fermi 粒子系の Hilbert 空間 $cal(H)_(upright(M . P .))$ において
$n$ 粒子演算子 $hat(f)$ の和 $hat(f)^(upright(t o t))$ は消滅,
生成演算子 $hat(b)_i \, hat(b)_i^dagger$ を用いて次のように表現できる.
$ hat(f)^(upright(t o t)) & = sum_(j_1 \, dots.h \, j_n in I\
k_1 \, dots.h \, k_n in I) ⟨j_1 dots.h.c j_n\| f \|k_1 dots.h.c k_n⟩ hat(b)_(j_1)^dagger dots.h.c hat(b)_(j_n)^dagger hat(b)_(k_1) dots.h.c hat(b)_(k_n) $
]

]
#proof[
$n$ 粒子演算子を適用する
$ hat(f)^(upright(t o t)) 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|i_1⟩ dots.h.c \|i_N⟩) & = 1 / sqrt(N !) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma hat(f)^(upright(t o t)) hat(P)^dagger \( sigma \) \|i_1 dots.h.c i_N⟩ $
ここで完全性を用いて次のように単位演算子の分解ができる.
$ sum_(j_1 \, dots.h \, j_n in I) \|j_1 dots.h.c j_n⟩ ⟨j_1 dots.h.c j_n\| = hat(1) $
これより $hat(f)^(upright(t o t)) hat(P) \( sigma \)$
は次のように変形できる.
$  & hat(f)^(upright(t o t)) hat(P) \( sigma \) \|i_1 dots.h.c i_N⟩\
 & = frac(1, n !) sum_(mu_1 \, dots.h \, mu_n in X\
mu_nu eq.not mu_xi) hat(f)_(mu_1 dots.h.c mu_n) \|i_(sigma \( 1 \)) dots.h.c i_(sigma \( N \))⟩\
 & = frac(1, n !) sum_(mu_1 \, dots.h \, mu_n in X\
mu_nu eq.not mu_xi) sum_(j_1 \, dots.h \, j_n in I) \|j_1 dots.h.c j_n⟩ ⟨j_1 dots.h.c j_n\| hat(f)_(mu_1 dots.h.c mu_n) \|i_(sigma \( 1 \)) dots.h.c i_(sigma \( N \))⟩\
 & = frac(1, n !) sum_(mu_1 \, dots.h \, mu_n in X\
mu_nu eq.not mu_xi) sum_(j_1 \, dots.h \, j_n in I) \|i_(sigma \( 1 \)) dots.h.c j_1 dots.h.c j_n dots.h.c i_(sigma \( N \))⟩ ⟨j_1 dots.h.c j_n\| f \|i_(sigma \( mu_1 \)) dots.h.c i_(sigma \( mu_n \))⟩\
 & = frac(1, n !) sum_(j_1 \, dots.h \, j_n in I\
k_1 \, dots.h \, k_n in I) ⟨j_1 dots.h.c j_n\| f \|k_1 dots.h.c k_n⟩ sum_(mu_1 \, dots.h \, mu_n in X\
mu_nu eq.not mu_xi\
i_(sigma \( mu_nu \)) = k_nu) \| i_(sigma \( 1 \)) dots.h.c underbrace(j_1, mu_1) dots.h.c underbrace(j_n, mu_n) dots.h.c i_(sigma \( N \)) chevron.r\
 & = frac(1, n !) sum_(j_1 \, dots.h \, j_n in I\
k_1 \, dots.h \, k_n in I) ⟨j_1 dots.h.c j_n\| f \|k_1 dots.h.c k_n⟩ sum_(mu_1 \, dots.h \, mu_n in X\
mu_nu eq.not mu_xi\
i_(sigma \( mu_nu \)) = k_nu) hat(P) \( sigma \) \| i_1 dots.h.c underbrace(j_1, sigma \( mu_1 \)) dots.h.c underbrace(j_n, sigma \( mu_n \)) dots.h.c i_N chevron.r $
そして総和の変数を $mu_nu arrow.r sigma^(- 1) \( alpha_nu \)$
と書き換えて総和の順序を交換することで permutation に変形できる.
$  & frac(1, n !) sum_(sigma in frak(S)_N) sum_(mu_1 \, dots.h \, mu_n in X\
mu_nu eq.not mu_xi\
i_(sigma \( mu_nu \)) = k_nu) \( plus.minus 1 \)^sigma hat(P)^dagger \( sigma \) \| i_1 dots.h.c underbrace(j_nu, sigma \( mu_nu \)) dots.h.c i_N chevron.r\
 & = frac(1, n !) sum_(alpha_1 \, dots.h \, alpha_n in X\
alpha_nu eq.not alpha_xi\
i_(alpha_nu) = k_nu) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma hat(P)^dagger \( sigma \) \| i_1 dots.h.c underbrace(j_nu, alpha_nu) dots.h.c i_N chevron.r\
 & = sum_(alpha_1 \, dots.h \, alpha_n in X\
alpha_1 < dots.h.c < alpha_n\
i_(alpha_nu) = k_nu) det^(\( plus.minus \)) \[ \|i_1⟩ dots.h.c underbrace(\|j_nu⟩, alpha_nu) dots.h.c \|i_N⟩ \] $
次に消滅, 生成演算子 $hat(b)_i \, hat(b)_i^dagger$
の定義を用いてそれぞれ後ろから,
前からの順番で適用していくことで次のように変形できる.
$  & sum_(alpha_1 < dots.h.c < alpha_n\
i_(alpha_nu) = k_nu) 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|i_1⟩ dots.h.c \|i_(alpha_nu - 1)⟩, \|j_nu⟩, \|i_(alpha_nu + 1)⟩ dots.h.c \|i_N⟩)\
 & = hat(b)_(k_n)^dagger dots.h.c hat(b)_(k_1)^dagger sum_(alpha_1 < dots.h.c < alpha_n\
i_(alpha_nu) = k_nu) frac(\( plus.minus 1 \)^(sum_nu alpha_nu), sqrt(\( N - n \) !)) det^(\( plus.minus \)) mat(delim: "[", \|i_1⟩ dots.h.c \|i_(alpha_nu - 1)⟩, \|i_(alpha_nu + 1)⟩ dots.h.c \|i_N⟩)\
 & = hat(b)_(k_n)^dagger dots.h.c hat(b)_(k_1)^dagger hat(b)_(k_1) dots.h.c hat(b)_(k_n) 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|i_1⟩ dots.h.c \|i_(alpha_nu - 1)⟩, \|i_(alpha_nu)⟩, \|i_(alpha_nu + 1)⟩ dots.h.c \|i_N⟩) $
結局, 次のように変形できることがわかる.
$  & hat(f)^(upright(t o t)) 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|i_1⟩ dots.h.c \|i_N⟩)\
 & = sum_(j_1 \, dots.h \, j_n in I\
k_1 \, dots.h \, k_n in I) ⟨j_1 dots.h.c j_n\| f \|k_1 dots.h.c k_n⟩ hat(b)_(j_1)^dagger dots.h.c hat(b)_(j_n)^dagger hat(b)_(k_1) dots.h.c hat(b)_(k_n) \|phi.alt_(i_1) dots.h.c phi.alt_(i_N)⟩_S 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|i_1⟩ dots.h.c \|i_N⟩) $
さらに全粒子数 $N$ の Hilbert 空間における $n$ 粒子演算子を一般の Bose
粒子系に埋め込むことで $cal(H)_(B o s e)$ 上では次のように表現できる.
$ hat(f)^(upright(t o t)) & = frac(1, n !) sum_(j_1 \, dots.h \, j_n in I\
k_1 \, dots.h \, k_n in I) ⟨j_1 dots.h.c j_n\| f \|k_1 dots.h.c k_n⟩ hat(b)_(j_1)^dagger dots.h.c hat(b)_(j_n)^dagger hat(b)_(k_n) dots.h.c hat(b)_(k_1) $
]

= 1 粒子状態の完全正規直交系の取り替え
<粒子状態の完全正規直交系の取り替え>
#block[
#theorem("Q21-79(i)(ii)(iii)")[
2
つの完全正規直交系
$\( \|phi.alt_i⟩ \)_(i in I) \, \( \|phi.alt_(i')⟩ \)_(i in I')$
に対してそれぞれの消滅, 生成演算子 $hat(b)_i \, hat(b)_i^dagger$,
$hat(b)_(i') \, hat(b)_i^(' dagger)$ は次のような関係式が成り立つ.
$ hat(b)_(i') & = sum_(j in I) ⟨phi.alt_(i') mid(bar.v) phi.alt_j⟩ hat(b)_j\
hat(b)_i^(' dagger) & = sum_(j in I) ⟨phi.alt_j mid(bar.v) phi.alt_(i')⟩ hat(b)_j^dagger $
]

]
#proof[
生成演算子の定義より次のように計算できる.
$ hat(b)_i^(' dagger) 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_1')⟩ dots.h.c \|phi.alt_(i_N')⟩) & = 1 / sqrt(\( N + 1 \) !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i')⟩, \|phi.alt_(i_1')⟩ dots.h.c \|phi.alt_(i_N')⟩)\
 & = 1 / sqrt(\( N + 1 \) !) det^(\( plus.minus \)) mat(delim: "[", sum_(j in I) \|phi.alt_j⟩ ⟨phi.alt_j mid(bar.v) phi.alt_(i')⟩, \|phi.alt_(i_1')⟩ dots.h.c \|phi.alt_(i_N')⟩)\
 & = sum_(j in I) ⟨phi.alt_j mid(bar.v) phi.alt_(i')⟩ 1 / sqrt(\( N + 1 \) !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_j⟩, \|phi.alt_(i_1')⟩ dots.h.c \|phi.alt_(i_N')⟩)\
 & = sum_(j in I) ⟨phi.alt_j mid(bar.v) phi.alt_(i')⟩ hat(b)_j^dagger 1 / sqrt(N !) det^(\( plus.minus \)) mat(delim: "[", \|phi.alt_(i_1')⟩ dots.h.c \|phi.alt_(i_N')⟩) $
Hermite 共役を取ると示される.
$ hat(b)_i^(' dagger) & = sum_(j in I) ⟨phi.alt_j mid(bar.v) phi.alt_(i')⟩ hat(b)_j^dagger\
hat(b)_i' & = sum_(j in I) ⟨phi.alt_(i') mid(bar.v) phi.alt_j⟩ hat(b)_j $
] さらに完全正規直交系を入れ替えると次のような式が成り立つ.
(Q21-79(iv))
$ hat(b)_i & = sum_(j in I) ⟨phi.alt_i mid(bar.v) phi.alt_(j')⟩ hat(b)_(j')\
hat(b)_i^dagger & = sum_(j in I) ⟨phi.alt_(j') mid(bar.v) phi.alt_i⟩ hat(b)_j^(' dagger) $

#theorem("Q21-80")[
ある完全正規直交系の生成消滅演算子について交換・反交換関係が成り立つことは他の完全正規直交系でも成り立つことと同値である.
$  & \[ hat(b)_i \, hat(b)_j^dagger \]_minus.plus = delta_(i j) \, quad \[ hat(b)_i \, hat(b)_j \]_minus.plus = \[ hat(b)_i^dagger \, hat(b)_j^dagger \]_minus.plus = 0 #h(2em) \( i \, j in I \)\
arrow.l.r.double & \[ hat(b)_(i') \, hat(b)_j^(' dagger) \]_minus.plus = delta_(i j) \, quad \[ hat(b)_(i') \, hat(b)_(j') \]_minus.plus = \[ hat(b)_i^(' dagger) \, hat(b)_j^(' dagger) \]_minus.plus = 0 #h(2em) \( i \, j in I' \) $
] <exchange-equivalent>
#proof[
十分性さえ示せば対称性より完全正規直交系を入れ替えれば逆も示せる.
$ \[ hat(b)_i \, hat(b)_j^dagger \]_minus.plus & = [sum_(k in I) ⟨phi.alt_i mid(bar.v) phi.alt_(k')⟩ hat(b)_(k') \, sum_(l in I) ⟨phi.alt_(l') mid(bar.v) phi.alt_j⟩ hat(b)_l^(' dagger)]_minus.plus = sum_(k in I) sum_(l in I) ⟨phi.alt_i mid(bar.v) phi.alt_(k')⟩ ⟨phi.alt_(l') mid(bar.v) phi.alt_j⟩ [hat(b)_(k') \, hat(b)_l^(' dagger)]_minus.plus\
 & = sum_(k in I) sum_(l in I) ⟨phi.alt_i mid(bar.v) phi.alt_(k')⟩ ⟨phi.alt_(l') mid(bar.v) phi.alt_j⟩ delta_(k l) = sum_(k in I) ⟨phi.alt_i mid(bar.v) phi.alt_(k')⟩ ⟨phi.alt_(k') mid(bar.v) phi.alt_j⟩ = ⟨phi.alt_i mid(bar.v) phi.alt_j⟩ = delta_(i j)\
\[ hat(b)_i \, hat(b)_j \]_minus.plus & = [sum_(k in I) ⟨phi.alt_i mid(bar.v) phi.alt_(k')⟩ hat(b)_(k') \, sum_(l in I) ⟨phi.alt_j mid(bar.v) phi.alt_(l')⟩ hat(b)_(l')]_minus.plus = sum_(k in I) sum_(l in I) ⟨phi.alt_i mid(bar.v) phi.alt_(k')⟩ ⟨phi.alt_j mid(bar.v) phi.alt_(l')⟩ [hat(b)_(k') \, hat(b)_(l')]_minus.plus = 0\
\[ hat(b)_i^dagger \, hat(b)_j^dagger \]_minus.plus & = [sum_(k in I) ⟨phi.alt_(k') mid(bar.v) phi.alt_i⟩ hat(b)_k^(' dagger) \, sum_(l in I) ⟨phi.alt_(l') mid(bar.v) phi.alt_j⟩ hat(b)_l^(' dagger)]_minus.plus = sum_(k in I) sum_(l in I) ⟨phi.alt_(k') mid(bar.v) phi.alt_i⟩ ⟨phi.alt_j mid(bar.v) phi.alt_(l')⟩ [hat(b)_k^(' dagger) \, hat(b)_l^(' dagger)]_minus.plus = 0 $
よって同値である.
]

= 場の演算子の導入
<場の演算子の導入>
#block[
#definition("場の演算子")[
スピン $s$ を持つ 1
粒子系について考える.

その Hilbert 空間 $cal(H)_(s i n g l e)$ の完全正規直交系を
$\( \|phi.alt_i⟩ \)_(i in I)$ とする代わりに粒子の位置座標
$bold(r) in bb(R)^3$ とスピンの $z$ 成分
$s_z in { - s \, - s + 1 \, dots.h \, s - 1 \, s }$ の固有状態
$\|bold(r) \, s_z⟩$ からなる完全正規直交系とする. このときの消滅演算子
$hat(b)_(bold(r) \, s_z')$ を場の演算子
$hat(phi.alt) \( bold(r) \, s_z \)$ と定義する. また粒子数密度演算子
$hat(rho) \( bold(r) \, s_z \)$ を次のように定義する.
$ hat(rho) \( bold(r) \, s_z \) & := hat(phi.alt)^dagger \( bold(r) \, s_z \) hat(phi.alt) \( bold(r) \, s_z \) $
]
]
今までの消滅, 生成演算子 $hat(b)_i \, hat(b)_i^dagger$
から場の演算子へ書き換える.

#block[
#theorem("Q21-81(i)(ii), Q21-82")[
ある固有状態 $\|phi.alt_i⟩$ に関して位置座標・スピンの z
成分により表示を固定した波動関数を
$phi.alt_i \( bold(r) \, s_z \) := ⟨bold(r) \, s_z mid(bar.v) phi.alt_i⟩$
とする. 場の演算子とその Hermite 共役
$hat(phi.alt) \, hat(phi.alt)^dagger$ と消滅, 生成演算子
$hat(b)_i \, hat(b)_i^dagger$ は互いに表現できる.
$ hat(phi.alt) \( bold(r) \, s_z \) & = sum_(i in I) phi.alt_i \( bold(r) \, s_z \) hat(b)_i & hat(b)_i & = sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt_i^(\*) \( bold(r) \, s_z \) hat(phi.alt) \( bold(r) \, s_z \)\
hat(phi.alt)^dagger \( bold(r) \, s_z \) & = sum_(i in I) phi.alt_i^(\*) \( bold(r) \, s_z \) hat(b)_i^dagger & hat(b)_i^dagger & = sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt_i \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r) \, s_z \) $
]

]
#proof[
まず場の演算子は消滅,
生成演算子を用いて次のように表現できる.
$ hat(phi.alt) \( bold(r) \, s_z \) & = hat(b)_(bold(r) \, s_z') = sum_(i in I) ⟨bold(r) \, s_z mid(bar.v) phi.alt_i⟩ hat(b)_i = sum_(i in I) phi.alt_i \( bold(r) \, s_z \) hat(b)_i\
hat(phi.alt)^dagger \( bold(r) \, s_z \) & = hat(b)_(bold(r) \, s_z)^(' dagger) = sum_(i in I) ⟨phi.alt_i mid(bar.v) bold(r) \, s_z⟩ hat(b)_i^dagger = sum_(i in I) phi.alt_i^(\*) \( bold(r) \, s_z \) hat(b)_i^dagger $
逆に消滅, 生成演算子は次のように表現できる.
$ hat(b)_i & = sum_(s_z = - s)^s integral thin upright(d) bold(r) ⟨phi.alt_i mid(bar.v) bold(r) \, s_z⟩ hat(b)_(bold(r) \, s_z') = sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt_i^(\*) \( bold(r) \, s_z \) hat(phi.alt) \( bold(r) \, s_z \)\
hat(b)_i^dagger & = sum_(s_z = - s)^s integral thin upright(d) bold(r) ⟨bold(r) \, s_z mid(bar.v) phi.alt_i⟩ hat(b)_(bold(r) \, s_z)^(' dagger) = sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt_i \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r) \, s_z \) $
]

#theorem("Q21-83")[
場の演算子とその Hermite
共役の交換・反交換関係
$ {\[ hat(phi.alt) \( bold(r) \, s_z \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) \]_minus.plus = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
\[ hat(phi.alt) \( bold(r) \, s_z \) \, hat(phi.alt) \( bold(r)' \, s_(z') \) \]_minus.plus = \[ hat(phi.alt)^dagger \( bold(r) \, s_z \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) \]_minus.plus = 0 $
]
#proof[
定理 @exchange-equivalent を適用することで示せる.
$  & {\[ hat(b)_i \, hat(b)_j^dagger \]_minus.plus = delta_(i j)\
\[ hat(b)_i \, hat(b)_j \]_minus.plus = \[ hat(b)_i^dagger \, hat(b)_j^dagger \]_minus.plus = 0\
arrow.l.r.double & {\[ hat(b)_(bold(r) \, s_z') \, hat(b)_(bold(r)' \, s_(z'))^(' dagger) \]_minus.plus = delta_(\( bold(r) \, s_z \) \, \( bold(r)' \, s_(z') \)) = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
\[ hat(b)_(bold(r) \, s_z') \, hat(b)_(bold(r)' \, s_(z')) \]_minus.plus = \[ hat(b)_(bold(r) \, s_z)^dagger \, hat(b)_(bold(r)' \, s_(z'))^dagger \]_minus.plus = 0\
arrow.l.r.double & {\[ hat(phi.alt) \( bold(r) \, s_z \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) \]_minus.plus = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
\[ hat(phi.alt) \( bold(r) \, s_z \) \, hat(phi.alt) \( bold(r)' \, s_(z') \) \]_minus.plus = \[ hat(phi.alt)^dagger \( bold(r) \, s_z \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) \]_minus.plus = 0 $
] Q21-84

#block[
#theorem("Q21-85(i)(ii)")[
全粒指数演算子 $hat(N)$
は粒子数密度演算子 $hat(rho) \( bold(r) \, s_z \)$
を用いて次のように表現できる.
$ hat(N) & = sum_(s_z = - s)^s integral thin upright(d) bold(r) hat(rho) \( bold(r) \, s_z \) $
これは演算子 $hat(rho) \( bold(r) \, s_z \)$ がスピンの $z$ 成分 $s_z$
を持った粒子の場所 $bold(r)$
での粒子数密度を与える演算子であることを表すことがわかる.
]

]
#proof[
全粒子数演算子は生成消滅演算子
$hat(b)_i^dagger \, hat(b)_i$
を用いて表現であるので次のように展開して示せる.
$ hat(N) & = sum_(i in I) hat(b)_i^dagger hat(b)_i\
 & = sum_(i in I) sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt_i \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r) \, s_z \) sum_(s_(z') = - s)^s integral thin upright(d) bold(r)' phi.alt_i^(\*) \( bold(r)' \, s_(z') \) hat(phi.alt) \( bold(r)' \, s_(z') \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) sum_(s_(z') = - s)^s integral thin upright(d) bold(r)' (sum_(i in I) phi.alt_i \( bold(r) \, s_z \) phi.alt_i^(\*) \( bold(r)' \, s_(z') \)) hat(phi.alt)^dagger \( bold(r) \, s_z \) hat(phi.alt) \( bold(r)' \, s_(z') \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) sum_(s_(z') = - s)^s integral thin upright(d) bold(r)' delta \( bold(r) - bold(r)' \) delta_(s_z s_(z')) hat(phi.alt)^dagger \( bold(r) \, s_z \) hat(phi.alt) \( bold(r)' \, s_(z') \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) hat(phi.alt)^dagger \( bold(r) \, s_z \) hat(phi.alt) \( bold(r) \, s_z \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) hat(rho) \( bold(r) \, s_z \) $
]

#block[
#definition("複数の同種粒子の場")[
スピン $s$ を持つ複数の同種粒子がある系を考える. まず真空状態
$\|upright(v a c)⟩$ を次のように定義する.
$ cases(delim: "{", hat(phi.alt) \( bold(r) \, s_z \) \|upright(v a c)⟩ = 0 & \( bold(r) in bb(R)^3 \, s_z = - s \, dots.h \, s \), ⟨upright(v a c) mid(bar.v) upright(v a c)⟩ = 1) $
このとき複数の粒子状態は真空状態に場の演算子の Hermite
共役を適用することで表現できる.
$ \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) & := 1 / sqrt(N !) hat(phi.alt)^dagger \( bold(r)_1 \, s_(z \, 1) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_N \, s_(z \, N) \) \|upright(v a c)⟩ $
]
]
#block[
#theorem("Q21-86(i)(iv)(v)(vi)")[
多粒子系の固有状態 $\| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \)$
はパラメータの置換に関して対称性を持ち, 粒子密度演算子
$hat(rho) \( bold(r) \, s_z \)$ や全粒子演算子 $hat(N)$
の固有値は次のようになる.
$ \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) & = \( plus.minus 1 \)^sigma \| \( bold(r)_(sigma \( mu \)) \, s_(z sigma \( mu \)) \)_(mu in X) \) = frac(1, N !) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma \| \( bold(r)_(sigma \( mu \)) \, s_(z sigma \( mu \)) \)_(mu in X) \)\
hat(rho) \( bold(r) \, s_z \) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) & = (sum_(mu in bb(Z)_N) delta \( bold(r) - bold(r)_mu \) delta_(s_z s_(z mu))) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \)\
hat(N) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) & = N \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) $
]

]
#proof[
Bose, Fermi
多粒子系の固有状態のパラメータを置換するとそれぞれ完全対称性,
完全反対称性であることがわかる.
$ \| \( bold(r)_(sigma \( mu \)) \, s_(z sigma \( mu \)) \)_(mu in X) \) & = 1 / sqrt(N !) hat(phi.alt)^dagger \( bold(r)_(sigma \( 1 \)) \, s_(z sigma \( 1 \)) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_(sigma \( N \)) \, s_(z sigma \( N \)) \) \|upright(v a c)⟩\
 & = \( plus.minus 1 \)^sigma 1 / sqrt(N !) hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_N \, s_(z N) \) \|upright(v a c)⟩\
 & = \( plus.minus 1 \)^sigma \| \( bold(r)_mu \, s_(z mu) \)_(mu in X) \) $
$\( plus.minus 1 \)^sigma$
を左辺に持ってきてそれぞれの置換に関して平均を取ることで次のようになる.
$ \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) & = \( plus.minus 1 \)^sigma \| \( bold(r)_(sigma \( mu \)) \, s_(z sigma \( mu \)) \)_(mu in X) \) = frac(1, N !) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma \| \( bold(r)_(sigma \( mu \)) \, s_(z sigma \( mu \)) \)_(mu in X) \) $
次に固有状態に粒子密度演算子 $hat(rho) \( bold(r) \, s_z \)$
を適用すると次のように計算できる.
$ hat(rho) \( bold(r) \, s_z \) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) & = 1 / sqrt(N !) hat(rho) \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r)_1 \, s_(z \, 1) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_N \, s_(z \, N) \) \|upright(v a c)⟩\
 & = 1 / sqrt(N !) hat(phi.alt)^dagger \( bold(r)_1 \, s_(z \, 1) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_N \, s_(z \, N) \) hat(rho) \( bold(r) \, s_z \) \|upright(v a c)⟩\
 & + (sum_(mu in bb(Z)_N) delta \( bold(r) - bold(r)_mu \) delta_(s_z s_(z mu))) 1 / sqrt(N !) hat(phi.alt)^dagger \( bold(r)_1 \, s_(z \, 1) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_N \, s_(z \, N) \) \|upright(v a c)⟩\
 & = (sum_(mu in bb(Z)_N) delta \( bold(r) - bold(r)_mu \) delta_(s_z s_(z mu))) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) $
また全粒子演算子 $hat(N)$ に関しても次のように計算できる.
$ hat(N) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) & = sum_(s_z = - s)^s integral thin upright(d) bold(r) hat(rho) \( bold(r) \, s_z \) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) (sum_(mu in bb(Z)_N) delta \( bold(r) - bold(r)_mu \) delta_(s_z s_(z mu))) \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \)\
 & = N \| \( bold(r)_mu \, s_(z mu) \)_(mu in bb(Z)_N) \) $
]

#block[
#theorem("Q21-86(ii)")[
多粒子系の固有状態の正規直交関係は次のようになる.
$ \( \( bold(r)_mu \, s_(z mu) \)_(mu in X) \| \( bold(r)_(mu') \, s_(z mu') \)_(mu in X') \) & = delta_(N N') frac(1, N !) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma delta \( bold(r)_1 - bold(r)_(sigma \( 1 \)') \) delta_(s_(z 1) s_(z sigma \( 1 \)')) dots.h.c delta \( bold(r)_N - bold(r)_(sigma \( N \)') \) delta_(s_(z N) s_(z sigma \( N \)')) $
]

]
#proof[
まずは $N = N'$ の場合を考える.
$  & \( \( bold(r)_mu \, s_(z mu) \)_(mu in X) \| \( bold(r)_(mu') \, s_(z mu') \)_(mu in X) \) = frac(1, N !) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma \( \( bold(r)_mu \, s_(z mu) \)_(mu in X) \| \( bold(r)_(sigma \( mu \)') \, s_(z sigma \( mu \)') \)_(mu in X) \)\
 & = frac(1, N !^2) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma ⟨upright(v a c)\| hat(phi.alt) \( bold(r)_N \, s_(z N) \) dots.h.c hat(phi.alt) \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_(sigma \( 1 \)') \, s_(z sigma \( 1 \)') \) dots.h.c hat(phi.alt)^dagger \( bold(r)_(sigma \( N \)') \, s_(z sigma \( N \)') \) \|upright(v a c)⟩ $
TODO:
$  & hat(phi.alt) \( bold(r)_N \, s_(z N) \) dots.h.c hat(phi.alt) \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_(sigma \( 1 \)') \, s_(z sigma \( 1 \)') \) dots.h.c hat(phi.alt)^dagger \( bold(r)_(sigma \( N \)') \, s_(z sigma \( N \)') \)\
 & = hat(phi.alt) \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_(sigma \( 1 \)') \, s_(z sigma \( 1 \)') \) dots.h.c hat(phi.alt) \( bold(r)_N \, s_(z N) \) hat(phi.alt)^dagger \( bold(r)_(sigma \( N \)') \, s_(z sigma \( N \)') \) $
真空状態について交換関係・反交換関係を用いて次のように計算できる.
$ hat(phi.alt) \( bold(r) \, s_z \) hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) \|upright(v a c)⟩ & = plus.minus hat(phi.alt)^dagger \( bold(r)' \, s_(z') \) hat(phi.alt) \( bold(r) \, s_z \) \|upright(v a c)⟩ + delta \( bold(r) - bold(r)' \) delta_(s_z s_(z')) \|upright(v a c)⟩ = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z')) \|upright(v a c)⟩ $
これを帰納的に適用することで次のように計算できる.
$  & ⟨upright(v a c)\| hat(phi.alt) \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_(sigma \( 1 \)') \, s_(z sigma \( 1 \)') \) dots.h.c hat(phi.alt) \( bold(r)_N \, s_(z N) \) hat(phi.alt)^dagger \( bold(r)_(sigma \( N \)') \, s_(z sigma \( N \)') \) \|upright(v a c)⟩\
 & = delta \( bold(r)_1 - bold(r)_(sigma \( 1 \)') \) delta_(s_(z 1) s_(z sigma \( 1 \)')) dots.h.c delta \( bold(r)_N - bold(r)_(sigma \( N \)') \) delta_(s_(z N) s_(z sigma \( N \)')) ⟨upright(v a c) mid(bar.v) upright(v a c)⟩\
 & = delta \( bold(r)_1 - bold(r)_(sigma \( 1 \)') \) delta_(s_(z 1) s_(z sigma \( 1 \)')) dots.h.c delta \( bold(r)_N - bold(r)_(sigma \( N \)') \) delta_(s_(z N) s_(z sigma \( N \)')) $
よって
$ \( \( bold(r)_mu \, s_(z mu) \)_(mu in X) \| \( bold(r)_(mu') \, s_(z mu') \)_(mu in X) \) & = frac(1, N !) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma delta \( bold(r)_1 - bold(r)_(sigma \( 1 \)') \) delta_(s_(z 1) s_(z sigma \( 1 \)')) dots.h.c delta \( bold(r)_N - bold(r)_(sigma \( N \)') \) delta_(s_(z N) s_(z sigma \( N \)')) $
となる. $N eq.not N'$ の場合, Bose, Fermi
粒子系どちらも粒子数が異なる状態の内積は 0 より固有状態の内積も 0
となる.
]

#block[
#theorem("Q21-86(iii)")[
単位演算子は多粒子系の固有状態を用いて分解できる.
$ hat(1) & = sum_(N = 0)^oo sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 dots.h.c sum_(s_(z N) = - s)^s integral thin upright(d) bold(r)_N \| \( bold(r)_mu \, s_(z mu) \)_(mu in X) \) \( \( bold(r)_mu \, s_(z mu) \)_(mu in X) \| $
]

]
#proof[
証明したい式の右辺を固有状態
$\| \( bold(r)_(mu') \, s_(z mu') \)_(mu in bb(Z)_(N')) \)$
に適用すると固有値が $1$ であるから単位演算子と同等であることがわかる.
$  & quad sum_(N = 0)^oo sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 dots.h.c sum_(s_(z N) = - s)^s integral thin upright(d) bold(r)_N \| \( bold(r)_mu \, s_(z mu) \)_(mu in X) \) \( \( bold(r)_mu \, s_(z mu) \)_(mu in X) \| \( bold(r)_(mu') \, s_(z mu') \)_(mu in X') \)\
 & = sum_(N = 0)^oo sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 dots.h.c sum_(s_(z N) = - s)^s integral thin upright(d) bold(r)_N \| \( bold(r)_mu \, s_(z mu) \)_(mu in X) \)\
 & quad med delta_(N N') frac(1, N !) sum_(sigma in frak(S)_N) \( plus.minus 1 \)^sigma delta \( bold(r)_1 - bold(r)_(sigma \( 1 \)') \) delta_(s_(z 1) s_(z sigma \( 1 \)')) dots.h.c delta \( bold(r)_N - bold(r)_(sigma \( N \)') \) delta_(s_(z N) s_(z sigma \( N \)'))\
 & = frac(1, N' !) sum_(sigma in frak(S)_(N')) \( plus.minus 1 \)^sigma \| \( bold(r)_(sigma \( mu \)') \, s_(z sigma \( mu \)') \)_(mu in X') \)\
 & = \| \( bold(r)_(mu') \, s_(z mu') \)_(mu in X') \) $
]

#theorem[
$n$ 粒子演算子の和 $hat(f)^(upright(t o t))$
は場の演算子によって次のように表現できる.
$ hat(f)^(upright(t o t)) & = frac(1, n !) sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 dots.h.c sum_(s_(z n) = - s)^s integral thin upright(d) bold(r)_n sum_(s_(z 1') = - s)^s integral thin upright(d) bold(r)_(1') dots.h.c sum_(s_(z n') = - s)^s integral thin upright(d) bold(r)_(n')\
 & hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_n \, s_(z n) \) ⟨bold(r)_1 \, s_(z 1) \, dots.h \, bold(r)_n \, s_(z n)\| f \|bold(r)_(1') \, s_(z 1') \, dots.h \, bold(r)_(n') \, s_(z n')⟩ hat(phi.alt) \( bold(r)_(n') \, s_(z n') \) dots.h.c hat(phi.alt) \( bold(r)_(1') \, s_(z 1') \) $
]
#proof[
$n$ 粒子演算子の和 $hat(f)^(upright(t o t))$
の定義を場の演算子で書き換えることで示せる.
$  & hat(f)^(upright(t o t)) = frac(1, n !) sum_(i_1 \, dots.h \, i_n in I\
j_1 \, dots.h \, j_n in I) ⟨phi.alt_(i_1) dots.h.c phi.alt_(i_n)\| f \|phi.alt_(j_1) dots.h.c phi.alt_(j_n)⟩ hat(b)_(i_1)^dagger dots.h.c hat(b)_(i_n)^dagger hat(b)_(j_n) dots.h.c hat(b)_(j_1)\
 & = frac(1, n !) sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 dots.h.c sum_(s_(z n) = - s)^s integral thin upright(d) bold(r)_n sum_(s_(z 1') = - s)^s integral thin upright(d) bold(r)_(1') dots.h.c sum_(s_(z n') = - s)^s integral thin upright(d) bold(r)_(n')\
 & sum_(i_1 \, dots.h \, i_n in I\
j_1 \, dots.h \, j_n in I) phi.alt_(i_1)^(\*) \( bold(r)_1 \, s_(z 1) \) dots.h.c phi.alt_(i_n)^(\*) \( bold(r)_n \, s_(z n) \) phi.alt_(j_1) \( bold(r)_(1') \, s_(z 1') \) dots.h.c phi.alt_(j_n) \( bold(r)_(n') \, s_(z n') \) ⟨bold(r)_1 \, s_(z 1) \, dots.h \, bold(r)_n \, s_(z n)\| f \|bold(r)_(1') \, s_(z 1') \, dots.h \, bold(r)_(n') \, s_(z n')⟩\
 & phi.alt_(i_1) \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) dots.h.c phi.alt_(i_n) \( bold(r)_n \, s_(z n) \) hat(phi.alt)^dagger \( bold(r)_n \, s_(z n) \) phi.alt_(j_n)^(\*) \( bold(r)_(n') \, s_(z n') \) hat(phi.alt) \( bold(r)_(n') \, s_(z n') \) dots.h.c phi.alt_(j_1)^(\*) \( bold(r)_(1') \, s_(z 1') \) hat(phi.alt) \( bold(r)_(1') \, s_(z 1') \)\
 & = frac(1, n !) sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 dots.h.c sum_(s_(z n) = - s)^s integral thin upright(d) bold(r)_n sum_(s_(z 1') = - s)^s integral thin upright(d) bold(r)_(1') dots.h.c sum_(s_(z n') = - s)^s integral thin upright(d) bold(r)_(n')\
 & quad med hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) dots.h.c hat(phi.alt)^dagger \( bold(r)_n \, s_(z n) \) ⟨bold(r)_1 \, s_(z 1) \, dots.h \, bold(r)_n \, s_(z n)\| f \|bold(r)_(1') \, s_(z 1') \, dots.h \, bold(r)_(n') \, s_(z n')⟩ hat(phi.alt) \( bold(r)_(n') \, s_(z n') \) dots.h.c hat(phi.alt) \( bold(r)_(1') \, s_(z 1') \) $
]

#block[
#example("Q21-87, Q21-88, Q21-89(i)(ii), Q21-90, Q21-91(i)(ii)(iii)(iv), Q21-92")[
よくある物理系において 1 粒子演算子 $hat(h)$, 2 粒子演算子 $hat(v)$
は次の演算子を選ぶ.
$ hat(h) & = - frac(planck^2, 2 m) nabla_(bold(r))^2 + V \( bold(r) \, hat(bold(s)) \)\
hat(v) & = V \( bold(r)_1 \, hat(bold(s))_1 \, bold(r)_2 \, hat(bold(s))_2 \) #h(2em) \( V \( bold(r)_1 \, hat(bold(s))_1 \, bold(r)_2 \, hat(bold(s))_2 \) = V \( bold(r)_2 \, hat(bold(s))_2 \, bold(r)_1 \, hat(bold(s))_1 \) \) $
このとき 1 粒子演算子の和 $hat(h)^(upright(t o t))$, 2 粒子演算子の和
$hat(v)^(upright(t o t))$ は次のように展開できる.
$ hat(h)^(upright(t o t)) & = sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 sum_(s_(z 2) = - s)^s integral thin upright(d) bold(r)_2 hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) ⟨bold(r)_1 \, s_(z 1)\| h \|bold(r)_2 \, s_(z 2)⟩ hat(phi.alt) \( bold(r)_2 \, s_(z 2) \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) sum_(s_(z') = - s)^s integral thin upright(d) bold(r)' hat(phi.alt)^dagger \( bold(r) \, s_z \) ⟨bold(r) \, s_z\| [- frac(planck^2, 2 m) nabla_(bold(r))^2 + V \( bold(r) \, hat(bold(s)) \)] \|bold(r)' \, s_(z')⟩ hat(phi.alt) \( bold(r)' \, s_(z') \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) sum_(s_(z') = - s)^s integral thin upright(d) bold(r)' hat(phi.alt)^dagger \( bold(r) \, s_z \) [- frac(planck^2, 2 m) ⟨bold(r) \, s_z mid(bar.v) bold(r)' \, s_(z')⟩ nabla_(bold(r))^2 + ⟨bold(r) mid(bar.v) bold(r)'⟩ ⟨s_z\| V \( bold(r) \, hat(bold(s)) \) \|s_(z')⟩] hat(phi.alt) \( bold(r)' \, s_(z') \)\
 & = sum_(s_z = - s)^s sum_(s_(z') = - s)^s integral thin upright(d) bold(r) hat(phi.alt)^dagger \( bold(r) \, s_z \) [- frac(planck^2, 2 m) delta_(s_z s_(z')) Delta_(bold(r)) + V_(s_z s_(z')) \( bold(r) \)] hat(phi.alt) \( bold(r) \, s_(z') \)\
hat(v)^(upright(t o t)) & = 1 / 2 sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 sum_(s_(z 2) = - s)^s integral thin upright(d) bold(r)_2 sum_(s_(z 3) = - s)^s integral thin upright(d) bold(r)_3 sum_(s_(z 4) = - s)^s integral thin upright(d) bold(r)_4\
 & quad med hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_2 \, s_(z 2) \) ⟨bold(r)_1 \, s_(z 1) \, bold(r)_2 \, s_(z 2)\| v \|bold(r)_3 \, s_(z 3) \, bold(r)_4 \, s_(z 4)⟩ hat(phi.alt) \( bold(r)_4 \, s_(z 4) \) hat(phi.alt) \( bold(r)_3 \, s_(z 3) \)\
 & = 1 / 2 sum_(s_(z 1) = - s)^s integral thin upright(d) bold(r)_1 sum_(s_(z 2) = - s)^s integral thin upright(d) bold(r)_2 sum_(s_(z 1') = - s)^s integral thin upright(d) bold(r)_(1') sum_(s_(z 2') = - s)^s integral thin upright(d) bold(r)_(2')\
 & quad med hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_2 \, s_(z 2) \) ⟨bold(r)_1 \, s_(z 1) \, bold(r)_2 \, s_(z 2)\| V \( bold(r)_1 \, hat(bold(s))_1 \, bold(r)_2 \, hat(bold(s))_2 \) \|bold(r)_(1') \, s_(z 1') \, bold(r)_(2') \, s_(z 2')⟩ hat(phi.alt) \( bold(r)_(2') \, s_(z 2') \) hat(phi.alt) \( bold(r)_(1') \, s_(z 1') \)\
 & = 1 / 2 sum_(s_(z 1) = - s)^s sum_(s_(z 1') = - s)^s integral thin upright(d) bold(r)_1 sum_(s_(z 2) = - s)^s sum_(s_(z 2') = - s)^s integral thin upright(d) bold(r)_2 hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \) hat(phi.alt)^dagger \( bold(r)_2 \, s_(z 2) \) V_(s_(z 1) \, s_(z 2) \, s_(z 1') \, s_(z 2')) \( bold(r)_1 \, bold(r)_2 \) hat(phi.alt) \( bold(r)_2 \, s_(z 2') \) hat(phi.alt) \( bold(r)_1 \, s_(z 1') \) $
ただしスピン状態を適用したポテンシャルを次のように定義した.
$ V_(s_z s_(z')) \( bold(r) \) & := ⟨s_z\| V \( bold(r) \, hat(bold(s)) \) \|s_(z')⟩\
V_(s_(z 1) \, s_(z 2) \, s_(z 1') \, s_(z 2')) \( bold(r)_1 \, bold(r)_2 \) & := ⟨s_(z 1) s_(z 2)\| V \( bold(r)_1 \, hat(bold(s))_1 \, bold(r)_2 \, hat(bold(s))_2 \) \|s_(z 1') s_(z 2')⟩ $
そしてこのポテンシャルは複素共役を取ることでスピンの交換ができる.
$ V_(s_z s_(z')) \( bold(r) \) & = ⟨s_z\| V \( bold(r) \, hat(bold(s)) \) \|s_(z')⟩ = ⟨s_(z')\| V \( bold(r) \, hat(bold(s)) \) \|s_z⟩^(\*) = V_(s_(z') s_z) \( bold(r) \)^(\*)\
V_(s_(z 1) s_(z 2) s_(z 1') s_(z 2')) \( bold(r)_1 \, bold(r)_2 \) & = ⟨s_(z 1) s_(z 2)\| V \( bold(r)_1 \, hat(bold(s))_1 \, bold(r)_2 \, hat(bold(s))_2 \) \|s_(z 1') s_(z 2')⟩\
 & = ⟨s_(z 1') s_(z 2')\| V \( bold(r)_1 \, hat(bold(s))_1 \, bold(r)_2 \, hat(bold(s))_2 \) \|s_(z 1) s_(z 2)⟩^(\*)\
 & = V_(s_(z 1') s_(z 2') s_(z 1) s_(z 2)) \( bold(r)_1 \, bold(r)_2 \)^(\*) $
]

]
#block[
#definition("省略記法")[
ある粒子 $mu$ の位置座標
$bold(r)_mu in bb(R)^3$ とスピンの $z$ 成分
$s_(z mu) = - s \, - s + 1 \, dots.h \, s - 1 \, s$ の組
$\( bold(r)_mu \, s_(z mu) \)$ を $mu$ とラベル付けする. ラベル $mu$ と
$bb(Z)$ への随伴関手は省略する.
]
]
#example("省略記法の例")[
まず場の演算子
$hat(phi.alt) \( 1 \)$ について交換・反交換関係は次のように書ける.
$ {\[ hat(phi.alt) \( I \) \, hat(phi.alt)^dagger \( J \) \]_minus.plus = delta \( I \, J \)\
\[ hat(phi.alt) \( I \) \, hat(phi.alt) \( J \) \]_minus.plus = \[ hat(phi.alt)^dagger \( I \) \, hat(phi.alt)^dagger \( J \) \]_minus.plus = 0 $
粒子数密度演算子 $hat(rho) \( 1 \)$ と全粒子数演算子 $hat(N)$
は次のように書ける.
$ hat(rho) \( I \) & = hat(phi.alt)^dagger \( I \) hat(phi.alt) \( I \)\
hat(N) & = sum_I hat(rho) \( I \)\
\[ hat(phi.alt) \( I \) \, hat(rho) \( J \) \] & = delta \( I \, J \) hat(phi.alt) \( I \) \, #h(2em) \[ hat(rho) \( I \) \, hat(rho) \( J \) \] = 0 $
次に固有状態 $\| 1 \, dots.h \, N \)$
について完全規格直交系となっていることは次のようになる.
$ \| 1 \, dots.h \, N \) & = 1 / sqrt(N !) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = \( plus.minus 1 \)^sigma \| sigma \( 1 \) \, dots.h \, sigma \( N \) \)\
\( 1 \, dots.h \, N \| 1' \, dots.h \, M' \) & = delta_(N M) delta \( 1 \, 1' \) dots.h.c delta \( N \, M' \)\
sum_(N = 0)^oo sum_(1 \, dots.h \, N) \| 1 \, dots.h \, N \) \( 1 \, dots.h \, N \| & = hat(1) $
1 粒子演算子, 2 粒子演算子の和は次のようになる.
$ hat(h)^(upright(t o t)) & = sum_(1 \, 2) hat(phi.alt)^dagger \( 1 \) ⟨1\| h \|2⟩ hat(phi.alt) \( 2 \) = sum_1 hat(phi.alt)^dagger \( 1 \) [- frac(planck^2, 2 m) Delta_1 + V \( 1 \)] hat(phi.alt) \( 1 \)\
hat(v)^(upright(t o t)) & = 1 / 2 sum_(1 \, 2 \, 3 \, 4) hat(phi.alt)^dagger \( 1 \) hat(phi.alt)^dagger \( 2 \) ⟨12\| v \|34⟩ hat(phi.alt) \( 4 \) hat(phi.alt) \( 3 \) = 1 / 2 sum_(1 \, 2) hat(phi.alt)^dagger \( 1 \) hat(phi.alt)^dagger \( 2 \) V \( 1 \, 2 \) hat(phi.alt) \( 2 \) hat(phi.alt) \( 1 \) $
]
= 量子化された場の理論は粒子数を固定しない多体系の量子力学に等しい。
<量子化された場の理論は粒子数を固定しない多体系の量子力学に等しい>
#block[
#definition("場の理論")[
このとき Schrödinger
方程式は次のように書ける.
$ i planck frac(upright(d), upright(d) t) \|Psi \( t \)⟩ & = hat(H) \|Psi \( t \)⟩ $
ただし場の理論の状態 $\|Psi \( t \)⟩$ と Hamiltonian $hat(H)$
は次のように展開できる.
$  & \|Psi \( t \)⟩ = sum_(N = 0)^oo sum_(1 \, dots.h \, N) Psi \( 1 \, dots.h \, N \; t \) \| 1 \, dots.h \, N \)\
 & hat(H) = hat(H)_(upright(o n e)) + hat(H)_(upright(t w o)) = sum_1 hat(phi.alt)^dagger \( 1 \) [- frac(planck^2, 2 m) Delta_1 + V \( 1 \)] hat(phi.alt) \( 1 \) + 1 / 2 sum_(1 \, 2) hat(phi.alt)^dagger \( 1 \) hat(phi.alt)^dagger \( 2 \) V \( 1 \, 2 \) hat(phi.alt) \( 2 \) hat(phi.alt) \( 1 \) $
$N$ 粒子の多体系の波動関数
]
]
#theorem("Q21-93")[
展開係数の粒子の置換に関する対称性
$ Psi \( sigma \( 1 \) \, dots.h \, sigma \( N \) \; t \) = \( plus.minus 1 \)^sigma Psi \( 1 \, dots.h \, N \; t \) $
]
#proof[
場の理論の状態について展開し,
総和の変数を置換することで次のように変形できる.
$ \|Psi \( t \)⟩ & = sum_(N = 0)^oo sum_(1 \, dots.h \, N) Psi \( 1 \, dots.h \, N \; t \) \| 1 \, dots.h \, N \)\
 & = sum_(N = 0)^oo sum_(1 \, dots.h \, N) Psi \( sigma \( 1 \) \, dots.h \, sigma \( N \) \; t \) \| sigma \( 1 \) \, dots.h \, sigma \( N \) \)\
 & = sum_(N = 0)^oo sum_(1 \, dots.h \, N) \( plus.minus 1 \)^sigma Psi \( sigma \( 1 \) \, dots.h \, sigma \( N \) \; t \) \| 1 \, dots.h \, N \) $
これより固有状態 $\| 1 \, dots.h \, N \)$
は完全規格直交系であるから係数は一致する.
$ Psi \( 1 \, dots.h \, N \; t \) & = \( plus.minus 1 \)^sigma Psi \( sigma \( 1 \) \, dots.h \, sigma \( N \) \; t \) $
よって示された.
]

#block[
#theorem("Q21-94(iii)(iv)")[
Hamiltonian $hat(H)$
と全粒子数について次のような関係がある. $ \[ hat(H) \, hat(N) \] & = 0\
\( 1 \, dots.h \, N \| hat(H) \| 1' \, dots.h \, M' \) & = 0 #h(2em) \( N eq.not M \) $
]

]
#proof[
まず Hamiltonian
と全粒指数演算子の交換関係を計算すると可換であることがわかる.
$ \[ hat(H)_(upright(o n e)) \, hat(N) \] & = [sum_1 hat(phi.alt)^dagger \( 1 \) (- frac(planck^2, 2 m) Delta_1 + V \( 1 \)) hat(phi.alt) \( 1 \) \, sum_2 hat(rho) \( 2 \)]\
 & = sum_(1 \, 2) (- frac(planck^2, 2 m) Delta_1 + V \( 1 \)) [hat(rho) \( 1 \) \, hat(rho) \( 2 \)] = 0\
\[ hat(H)_(upright(t w o)) \, hat(N) \] & = [1 / 2 sum_(1 \, 2) hat(phi.alt)^dagger \( 1 \) hat(phi.alt)^dagger \( 2 \) V \( 1 \, 2 \) hat(phi.alt) \( 2 \) hat(phi.alt) \( 1 \) \, sum_3 hat(rho) \( 3 \)]\
 & = 1 / 2 sum_(1 \, 2 \, 3) V \( 1 \, 2 \) [hat(phi.alt)^dagger \( 1 \) hat(phi.alt)^dagger \( 2 \) hat(phi.alt) \( 2 \) hat(phi.alt) \( 1 \) \, hat(rho) \( 3 \)]\
 & = 1 / 2 sum_(1 \, 2 \, 3) V \( 1 \, 2 \) [hat(rho) \( 1 \) hat(rho) \( 2 \) - delta \( 1 \, 2 \) hat(rho) \( 1 \) \, hat(rho) \( 3 \)] = 0\
\[ hat(H) \, hat(N) \] & = \[ hat(H)_(upright(o n e)) \, hat(N) \] + \[ hat(H)_(upright(t w o)) \, hat(N) \] = 0 $
更にこの交換関係の行列要素を考える.
$ \( 1 \, dots.h \, N \| \[ hat(H) \, hat(N) \] \| 1' \, dots.h \, M' \) & = \( 1 \, dots.h \, N \| \( M - N \) hat(H) \| 1' \, dots.h \, M' \) = 0 $
これより $M eq.not N$ のとき
$\( 1 \, dots.h \, N \| hat(H) \| 1' \, dots.h \, M' \) = 0$ となる.
]

#block[
#lemma("Q21-94(vii)(viii)(ix)(x)(xi)(xii)(xiv)(xv)(xvi)")[
Hamiltonian 中の 1 粒子演算子は次の固有値を持つ.
$ hat(H)_(upright(o n e)) \| 1 \, dots.h \, N \) & = sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I + V \( I \)] \| 1 \, dots.h \, N \) $
]

] <Hamiltonian-one-eigen>
#proof[
1 粒子演算子 $hat(H)_(upright(o n e))$
を固有状態に適用すると
$ hat(H)_(upright(o n e)) \| 1 \, dots.h \, N \) & = sum_I hat(phi.alt)^dagger \( I \) [- frac(planck^2, 2 m) Delta_I + V \( I \)] hat(phi.alt) \( I \) 1 / sqrt(N !) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = sum_I hat(phi.alt)^dagger \( I \) [- frac(planck^2, 2 m) Delta_I + V \( I \)] 1 / sqrt(N !) sum_(J = 1)^N \( plus.minus 1 \)^J delta \( I \, J \) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( J - 1 \) hat(phi.alt)^dagger \( J + 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = sum_(J = 1)^N (sum_I hat(phi.alt)^dagger \( I \) [- frac(planck^2, 2 m) Delta_I + V \( I \)] delta \( I \, J \)) \( plus.minus 1 \)^J 1 / sqrt(N !) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( J - 1 \) hat(phi.alt)^dagger \( J + 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩ $
ここで部分積分を行うと無限遠点においてエネルギーはないから次のように変形できる.
$ sum_I hat(phi.alt)^dagger \( I \) Delta_I delta \( I \, J \) & = sum_(s_(z I) \, s_(z I')) integral thin upright(d) bold(r)_I hat(phi.alt)^dagger \( I \) Delta_I delta \( I \, J \)\
 & = [sum_(s_(z I) \, s_(z I')) hat(phi.alt)^dagger \( I \) delta \( I \, J \)]_S + sum_I (Delta_I hat(phi.alt)^dagger \( I \)) delta \( I \, J \)\
 & = Delta_J hat(phi.alt)^dagger \( J \) $
これより最終的に次のように固有値が求まる.
$  & quad med hat(H)_(upright(o n e)) \| 1 \, dots.h \, N \)\
 & = sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I hat(phi.alt)^dagger \( I \) + V \( I \) hat(phi.alt)^dagger \( I \)] \( plus.minus 1 \)^I 1 / sqrt(N !) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( I - 1 \) hat(phi.alt)^dagger \( I + 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I + V \( I \)] 1 / sqrt(N !) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I + V \( I \)] \| 1 \, dots.h \, N \) $
]

#block[
#lemma("Q21-94(xviii)(xix)(xx)(xxii)(xxiii)(xxiv)")[
Hamiltonian 中の 2 粒子演算子は次の固有値を持つ.
$ hat(H)_(upright(t w o)) \| 1 \, dots.h \, N \) & = 1 / 2 sum_(I \, J) V \( I \, J \) sum_(1 lt.eq K lt.eq N\
1 lt.eq L lt.eq N\
K eq.not L) delta \( I \, K \) delta \( J \, L \) \| 1 \, dots.h \, N \) $
]

]
#proof[
順当に計算することで示せる.
$  & quad med hat(H)_(upright(t w o)) \| 1 \, dots.h \, N \)\
 & = 1 / 2 sum_(I \, J) hat(phi.alt)^dagger \( I \) hat(phi.alt)^dagger \( J \) V \( I \, J \) hat(phi.alt) \( J \) hat(phi.alt) \( I \) 1 / sqrt(N !) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = 1 / 2 sum_(I \, J) V \( I \, J \) 1 / sqrt(N !) hat(phi.alt)^dagger \( I \) hat(phi.alt)^dagger \( J \) hat(phi.alt) \( J \) hat(phi.alt) \( I \) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = 1 / 2 sum_(I \, J) V \( I \, J \) 1 / sqrt(N !) hat(phi.alt)^dagger \( I \) hat(phi.alt)^dagger \( J \) hat(phi.alt) \( J \) sum_(K = 1)^N \( plus.minus 1 \)^K delta \( I \, K \) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( K - 1 \) hat(phi.alt)^dagger \( K + 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = 1 / 2 sum_(I \, J) V \( I \, J \) 1 / sqrt(N !) hat(phi.alt)^dagger \( I \) sum_(K = 1)^N \( plus.minus 1 \)^K delta \( I \, K \) sum_(L = 1\
K eq.not L)^N delta \( J \, L \) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( K - 1 \) hat(phi.alt)^dagger \( K + 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = 1 / 2 sum_(I \, J) V \( I \, J \) 1 / sqrt(N !) sum_(1 lt.eq K lt.eq N\
1 lt.eq L lt.eq N\
K eq.not L) \( plus.minus 1 \)^K delta \( I \, K \) delta \( J \, L \) hat(phi.alt)^dagger \( K \) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( K - 1 \) hat(phi.alt)^dagger \( K + 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = 1 / 2 sum_(I \, J) V \( I \, J \) 1 / sqrt(N !) sum_(1 lt.eq K lt.eq N\
1 lt.eq L lt.eq N\
K eq.not L) delta \( I \, K \) delta \( J \, L \) hat(phi.alt)^dagger \( 1 \) dots.h.c hat(phi.alt)^dagger \( N \) \|upright(v a c)⟩\
 & = 1 / 2 sum_(I \, J) V \( I \, J \) sum_(1 lt.eq K lt.eq N\
1 lt.eq L lt.eq N\
K eq.not L) delta \( I \, K \) delta \( J \, L \) \| 1 \, dots.h \, N \) $
]

#block[
#theorem("Q21-94(i)(ii)(v)(vi)(xiii)(xvii)(xxi)(xxv)(xxvi)(xxvii)(xxviii)")[
Schrödinger 方程式は次のように書き換えられる.
$ i planck frac(partial, partial t) Psi \( 1 \, dots.h \, N \; t \) & = #scale(x: 300%, y: 300%)[\(] sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I + V \( I \)] + 1 / 2 sum_(1 lt.eq I lt.eq N\
1 lt.eq J lt.eq N\
I eq.not J) V \( I \, J \) #scale(x: 300%, y: 300%)[\)] Psi \( 1 \, dots.h \, N \; t \) $
]

]
#proof[
Schrödinger 方程式の両辺に対して左から
$\( 1 \, dots.h \, N \|$ を掛けるとそれぞれ次のように計算できる.
$ i planck frac(upright(d), upright(d) t) \( 1 \, dots.h \, N \|Psi \( t \)⟩ & = i planck frac(partial, partial t) sum_(M = 0)^oo sum_(1' \, dots.h \, M') Psi \( 1' \, dots.h \, M' \; t \) \( 1 \, dots.h \, N \| 1' \, dots.h \, M' \)\
 & = i planck frac(partial, partial t) sum_(M = 0)^oo sum_(1' \, dots.h \, M') Psi \( 1' \, dots.h \, M' \; t \) delta_(N M) delta \( 1 \, 1' \) dots.h.c delta \( N \, M' \)\
 & = i planck frac(partial, partial t) Psi \( 1 \, dots.h \, N \; t \)\
\( 1 \, dots.h \, N \| hat(H) \|Psi \( t \)⟩ & = sum_(M = 0)^oo sum_(1' \, dots.h \, M') \( 1 \, dots.h \, N \| hat(H) \| 1' \, dots.h \, M' \) Psi \( 1' \, dots.h \, M' \; t \)\
 & = sum_(1' \, dots.h \, N') \( 1 \, dots.h \, N \| hat(H) \| 1' \, dots.h \, N' \) Psi \( 1' \, dots.h \, N' \; t \) $
ここで補題 #link(<Hamiltonian-one-eigen>)[Hamiltonian-one-eigen], 補題 を用いることで Hamiltonian
の行列要素を計算できる.
$ \( 1 \, dots.h \, N \| hat(H) \| 1' \, dots.h \, N' \) & = \( 1 \, dots.h \, N \| hat(H)_(upright(o n e)) \| 1' \, dots.h \, N' \) + \( 1 \, dots.h \, N \| hat(H)_(upright(t w o)) \| 1' \, dots.h \, N' \)\
 & = sum_(I' = 1')^(N') [- frac(planck^2, 2 m) Delta_(I') + V \( I' \)] \( 1 \, dots.h \, N \| 1' \, dots.h \, N' \)\
 & + 1 / 2 sum_(I \, J) V \( I \, J \) sum_(1' lt.eq K' lt.eq N'\
1' lt.eq L' lt.eq N'\
K' eq.not L') delta \( I \, K' \) delta \( J \, L' \) \( 1 \, dots.h \, N \| 1' \, dots.h \, N' \)\
 & = sum_(I' = 1')^(N') [- frac(planck^2, 2 m) Delta_(I') + V \( I' \)] delta \( 1 \, 1' \) dots.h.c delta \( N \, N' \)\
 & + 1 / 2 sum_(I \, J) V \( I \, J \) sum_(1' lt.eq K' lt.eq N'\
1' lt.eq L' lt.eq N'\
K' eq.not L') delta \( I \, K' \) delta \( J \, L' \) delta \( 1 \, 1' \) dots.h.c delta \( N \, N' \)\
 & = #scale(x: 300%, y: 300%)[\(] sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I + V \( I \)] + 1 / 2 sum_(1 lt.eq I lt.eq N\
1 lt.eq J lt.eq N\
I eq.not J) V \( I \, J \) #scale(x: 300%, y: 300%)[\)] delta \( 1 \, 1' \) dots.h.c delta \( N \, N' \) $
よって題意となる式が示される.
$ i planck frac(partial, partial t) Psi \( 1 \, dots.h \, N \; t \) & = sum_(1' \, dots.h \, N') #scale(x: 300%, y: 300%)[\(] sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I + V \( I \)] + 1 / 2 sum_(1 lt.eq I lt.eq N\
1 lt.eq J lt.eq N\
I eq.not J) V \( I \, J \) #scale(x: 300%, y: 300%)[\)] delta \( 1 \, 1' \) dots.h.c delta \( N \, N' \) Psi \( 1' \, dots.h \, N' \; t \)\
 & = #scale(x: 300%, y: 300%)[\(] sum_(I = 1)^N [- frac(planck^2, 2 m) Delta_I + V \( I \)] + 1 / 2 sum_(1 lt.eq I lt.eq N\
1 lt.eq J lt.eq N\
I eq.not J) V \( I \, J \) #scale(x: 300%, y: 300%)[\)] Psi \( 1 \, dots.h \, N \; t \) $
]

= Heisenberg 表示での場の演算子の運動方程式
<heisenberg-表示での場の演算子の運動方程式>
#block[
#definition("Heisenberg 表示での場の演算子")[
場の演算子が時間に依存すると考えて
$hat(phi.alt) \( bold(r) \, s_z \) arrow.r hat(phi.alt) \( bold(r) \, s_z \; t \)$
と書き換える. そして次の Heisenberg の方程式を課す.
$ i planck frac(partial, partial t) hat(phi.alt) \( bold(r) \, s_z \; t \) = [hat(phi.alt) \( bold(r) \, s_z \; t \) \, hat(H)] $
省略記法も時間発展を含むものとする.
]
]
#block[
#theorem("Q21-95(iii)(iv)(v)(vi)")[
Heisenberg の方程式は次のように書き換えられる.
$ i planck frac(partial, partial t) hat(phi.alt) \( 0 \) & = (- frac(planck^2, 2 m) Delta_0 + V \( 0 \) + sum_1 hat(phi.alt)^dagger \( 1 \) V \( 1 \, 0 \) hat(phi.alt) \( 1 \)) hat(phi.alt) \( 0 \) $
]

]
#proof[
これも $V \( I \, I \) = 0$
であることに注意して順当に計算すれば示せる.
$ i planck frac(partial, partial t) hat(phi.alt) \( 0 \) & = [hat(phi.alt) \( 0 \) \, hat(H)_(upright(o n e))] + [hat(phi.alt) \( 0 \) \, hat(H)_(upright(t w o))]\
 & = [hat(phi.alt) \( 0 \) \, sum_1 hat(phi.alt)^dagger \( 1 \) [- frac(planck^2, 2 m) Delta_1 + V \( 1 \)] hat(phi.alt) \( 1 \)] + [hat(phi.alt) \( 0 \) \, 1 / 2 sum_(1 \, 2) hat(phi.alt)^dagger \( 1 \) hat(phi.alt)^dagger \( 2 \) V \( 1 \, 2 \) hat(phi.alt) \( 2 \) hat(phi.alt) \( 1 \)]\
 & = sum_1 [- frac(planck^2, 2 m) Delta_1 + V \( 1 \)] [hat(phi.alt) \( 0 \) \, hat(rho) \( 1 \)] + 1 / 2 sum_(1 \, 2) V \( 1 \, 2 \) [hat(phi.alt) \( 0 \) \, hat(rho) \( 1 \) hat(rho) \( 2 \) - hat(rho) \( 1 \) delta \( 1 \, 2 \)]\
 & = sum_1 [- frac(planck^2, 2 m) Delta_1 + V \( 1 \)] delta \( 0 \, 1 \) hat(phi.alt) \( 0 \) + 1 / 2 sum_(1 \, 2) (V \( 1 \, 2 \) {[hat(phi.alt) \( 0 \) \, hat(rho) \( 1 \)] \, hat(rho) \( 2 \)} - V \( 1 \, 1 \) [hat(phi.alt) \( 0 \) \, hat(rho) \( 1 \)])\
 & = [- frac(planck^2, 2 m) Delta_0 + V \( 0 \)] hat(phi.alt) \( 0 \) + 1 / 2 sum_1 V \( 0 \, 1 \) \( 2 hat(rho) \( 1 \) hat(phi.alt) \( 0 \) + delta \( 0 \, 1 \) hat(phi.alt) \( 0 \) \)\
 & = (- frac(planck^2, 2 m) Delta_0 + V \( 0 \) + sum_1 hat(phi.alt)^dagger \( 1 \) V \( 0 \, 1 \) hat(phi.alt) \( 1 \)) hat(phi.alt) \( 0 \) $
省略せずに記述すると次のようになる.
$ i planck frac(partial, partial t) hat(phi.alt) \( bold(r)_0 \, s_(z 0) \; t \) & = sum_(s_(z 0') = - s)^s #scale(x: 180%, y: 180%)[\(] - frac(planck^2, 2 m) delta_(s_(z 0) s_(z 0')) Delta_(bold(r)_0) + V_(s_(z 0) s_(z 0')) \( bold(r)_0 \)\
 & + sum_(s_(z 1) = - s)^s sum_(s_(z 1') = - s)^s integral thin upright(d) bold(r)_1 hat(phi.alt)^dagger \( bold(r)_1 \, s_(z 1) \; t \) V_(s_(z 0) s_(z 1) s_(z 0') s_(z 1')) \( bold(r)_0 \, bold(r)_1 \) hat(phi.alt) \( bold(r)_1 \, s_(z 1') \; t \) #scale(x: 180%, y: 180%)[\)] hat(phi.alt) \( bold(r)_0 \, s_(z 0') \; t \) $
]

= 第二量子化 - 場の正準量子化の手続き
<第二量子化---場の正準量子化の手続き>
#block[
#definition[
古典的な Schrödinger の場
$phi.alt \( bold(r) \, s_z \; t \)$ について次の Schrödinger
方程式が成り立つとする.
$ i planck frac(partial, partial t) phi.alt \( bold(r) \, s_z \; t \) & = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) $
粒子数密度 $rho \( bold(r) \, t \)$ と全粒子数 $N \( t \)$
について次のように定める.
$ N \( t \) & := integral thin upright(d) bold(r) rho \( bold(r) \, t \) \, #h(2em) rho \( bold(r) \, t \) := sum_(s_z = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) phi.alt \( bold(r) \, s_z \; t \) $
]
]
#block[
#theorem("Q21-97(ii)(iii)(iv)")[
粒子数密度
$rho \( bold(r) \, t \)$ の保存則が成り立つ.
つまり次の連続の方程式が成り立つ.
$ frac(partial rho \( bold(r) \, t \), partial t) + nabla_(bold(r)) dot.op bold(j) \( bold(r) \, t \) = 0 $
ただし粒子の流れ $bold(j) \( bold(r) \, t \)$ は次のように定義した.
$ bold(j) \( bold(r) \, t \) := frac(planck, 2 m i) sum_(s_z = - s)^s { phi.alt^(\*) \( bold(r) \, s_z \; t \) \( nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) \) - \( nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) phi.alt \( bold(r) \, s_z \; t \) } $
]

]
#proof[
Schrödinger 方程式とその複素共役は次のようであった.
$ i planck frac(partial, partial t) phi.alt \( bold(r) \, s_z \; t \) & = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)\
- i planck frac(partial, partial t) phi.alt^(\*) \( bold(r) \, s_z \; t \) & = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) + sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_(z') \; t \) V_(s_(z') s_z) \( bold(r) \) $
これより第一項を展開し, 代入すると
$ frac(partial rho \( bold(r) \, t \), partial t) & = frac(partial, partial t) sum_(s_z = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) phi.alt \( bold(r) \, s_z \; t \)\
 & = sum_(s_z = - s)^s (frac(partial, partial t) phi.alt^(\*) \( bold(r) \, s_z \; t \) phi.alt \( bold(r) \, s_z \; t \) + phi.alt^(\*) \( bold(r) \, s_z \; t \) frac(partial, partial t) phi.alt \( bold(r) \, s_z \; t \))\
 & = sum_(s_z = - s)^s #scale(x: 300%, y: 300%)[\(] (frac(planck, 2 m i) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) - frac(1, i planck) sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_(z') \; t \) V_(s_(z') s_z) \( bold(r) \)) phi.alt \( bold(r) \, s_z \; t \)\
 & + phi.alt^(\*) \( bold(r) \, s_z \; t \) (- frac(planck, 2 m i) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + frac(1, i planck) sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)) #scale(x: 300%, y: 300%)[\)]\
 & = frac(planck, 2 m i) sum_(s_z = - s)^s {\( Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) phi.alt \( bold(r) \, s_z \; t \) - phi.alt^(\*) \( bold(r) \, s_z \; t \) \( Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) \)} $
となり, 第二項については
$ nabla_(bold(r)) dot.op bold(j) \( bold(r) \, t \) & = nabla_(bold(r)) dot.op (frac(planck, 2 m i) sum_(s_z = - s)^s { phi.alt^(\*) \( bold(r) \, s_z \; t \) \( nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) \) - \( nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) phi.alt \( bold(r) \, s_z \; t \) })\
 & = frac(planck, 2 m i) sum_(s_z = - s)^s { phi.alt^(\*) \( bold(r) \, s_z \; t \) \( Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) \) - \( Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) phi.alt \( bold(r) \, s_z \; t \) } $
となるから和は $0$ となる. ちなみに全粒子数 $N \( t \)$
について時間微分することで粒子数は保存することがはっきりとわかる.
$ frac(partial, partial t) N \( t \) & = integral thin upright(d) bold(r) frac(partial rho \( bold(r) \, t \), partial t) = - integral thin upright(d) bold(r) nabla_(bold(r)) dot.op bold(j) \( bold(r) \, t \) = - integral thin upright(d) S bold(j) \( bold(r) \, t \) = 0 $
]

#block[
#definition("エネルギー")[
系の全エネルギー
$H \( t \)$ はエネルギー密度を足し上げて表される.
$ H \( t \) := integral thin upright(d) bold(r) w \( bold(r) \, t \) $
エネルギー密度 $w \( bold(r) \, t \)$ 自体は次のように表現される.
$ w \( bold(r) \, t \) := frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) $
]
]
#block[
#theorem("Q21-98(ii)(iii)(iv)")[
エネルギーの保存則が成り立つ. つまり次の連続の方程式が成り立つ.
$ frac(partial w \( bold(r) \, t \), partial t) + nabla_(bold(r)) bold(s) \( bold(r) \, t \) = 0 $
ただしエネルギーの流れ $bold(s) \( bold(r) \, t \)$
を次のように定義した.
$ bold(s) \( bold(r) \, t \) & = frac(planck^3, 4 m^2 i) sum_(s_z = - s)^s { \( nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \( nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) \) }\
 & + frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s { phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) \( nabla_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \) \) - \( nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) } $
]

]
#proof[
まず第一項について展開すると
$ frac(partial w \( bold(r) \, t \), partial t) & = frac(partial, partial t) (frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)) $
となり, 各項に Schrödinger 方程式を代入する.
$  & nabla_(bold(r)) frac(partial phi.alt^(\*) \( bold(r) \, s_z \; t \), partial t) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \)\
 & = nabla_(bold(r)) (frac(planck, 2 m i) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) - frac(1, i planck) sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_(z') \; t \) V_(s_(z') s_z) \( bold(r) \)) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \)\
 & = frac(planck, 2 m i) nabla_(bold(r)) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - frac(1, i planck) sum_(s_(z') = - s)^s V_(s_(z') s_z) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_(z') \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \)\
 & nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) frac(partial phi.alt \( bold(r) \, s_z \; t \), partial t)\
 & = nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) (- frac(planck, 2 m i) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + frac(1, i planck) sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \))\
 & = - frac(planck, 2 m i) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + frac(1, i planck) sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \)\
 & frac(partial phi.alt^(\*) \( bold(r) \, s_z \; t \), partial t) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)\
 & = (frac(planck, 2 m i) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) - frac(1, i planck) sum_(s_(z'') = - s)^s phi.alt^(\*) \( bold(r) \, s_(z'') \; t \) V_(s_(z'') s_z) \( bold(r) \)) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)\
 & = frac(planck, 2 m i) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) - frac(1, i planck) sum_(s_(z'') = - s)^s phi.alt^(\*) \( bold(r) \, s_(z'') \; t \) V_(s_(z'') s_z) \( bold(r) \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)\
 & phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) frac(partial phi.alt \( bold(r) \, s_(z') \; t \), partial t)\
 & = phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) (- frac(planck, 2 m i) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + frac(1, i planck) sum_(s_(z'') = - s)^s V_(s_z s_(z'')) \( bold(r) \) phi.alt \( bold(r) \, s_(z'') \; t \))\
 & = - frac(planck, 2 m i) phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + frac(1, i planck) sum_(s_(z'') = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) V_(s_z s_(z'')) \( bold(r) \) phi.alt \( bold(r) \, s_(z'') \; t \) $
これより総和の変数と式の対称性から相殺され, 次のようになる.
$ frac(partial w \( bold(r) \, t \), partial t) & = frac(planck^3, 4 m^2 i) sum_(s_z = - s)^s (nabla_(bold(r)) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \))\
 & - frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s (V_(s_(z') s_z) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_(z') \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - V_(s_z s_(z')) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \))\
 & + frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s (Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) - phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \))\
 & - frac(1, i planck) sum_(s_z = - s)^s sum_(s_(z') = - s)^s sum_(s_(z'') = - s)^s (phi.alt^(\*) \( bold(r) \, s_(z'') \; t \) V_(s_(z'') s_z) \( bold(r) \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) - phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) V_(s_z s_(z'')) \( bold(r) \) phi.alt \( bold(r) \, s_(z'') \; t \))\
 & = frac(planck^3, 4 m^2 i) sum_(s_z = - s)^s (nabla_(bold(r)) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \))\
 & - frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s (V_(s_(z') s_z) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_(z') \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - V_(s_z s_(z')) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \))\
 & + frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s (Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) - phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \)) $
次に第二項については次のように計算できる.
$ nabla_(bold(r)) bold(s) \( bold(r) \, t \) & = frac(planck^3, 4 m^2 i) sum_(s_z = - s)^s nabla_(bold(r)) { \( nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \( nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) \) }\
 & + frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s nabla_(bold(r)) { phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) \( nabla_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \) \) - \( nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) }\
 & = frac(planck^3, 4 m^2 i) sum_(s_z = - s)^s { \( nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) nabla_(bold(r)) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) - nabla_(bold(r)) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \( nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) \) }\
 & + frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s { V_(s_z s_(z')) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \) - V_(s_z s_(z')) \( bold(r) \) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \) }\
 & + frac(planck, 2 m i) sum_(s_z = - s)^s sum_(s_(z') = - s)^s { phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) \( Delta_(bold(r)) phi.alt \( bold(r) \, s_(z') \; t \) \) - \( Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \) } $
これより和は 0 となることがわかる. ちなみにエネルギーは無限遠点で 0
となるから次のようになり, 全エネルギーは時間変化しない.
$ frac(partial, partial t) H \( t \) & = integral thin upright(d) bold(r) frac(partial, partial t) w \( bold(r) \, t \) = - integral thin upright(d) bold(r) nabla_(bold(r)) bold(s) \( bold(r) \, t \) = - integral thin upright(d) S bold(s) \( bold(r) \, t \) = 0 $
]

#block[
#definition("古典的な Schrödinger の場")[
古典的な Schrödinger の場 $phi.alt \( bold(r) \, s_z \; t \)$
について次の Schrödinger 方程式が成り立つとする.
$ H := integral thin upright(d) bold(r) {frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)} $
更に力学変数 $Q \( bold(r) \, s_z \; t \) \, P \( bold(r) \, s_z \; t \)$
を次のように定める.
$ {Q \( bold(r) \, s_z \; t \) = phi.alt \( bold(r) \, s_z \; t \)\
P \( bold(r) \, s_z \; t \) = i planck phi.alt^(\*) \( bold(r) \, s_z \; t \) $
]
]
#block[
#theorem("Q21-99(i)(ii)")[
次の正準方程式が成り立つ.
$ {frac(partial Q \( bold(r) \, s_z \; t \), partial t) = frac(partial H, partial P \( bold(r) \, s_z \; t \))\
frac(partial P \( bold(r) \, s_z \; t \), partial t) = - frac(partial H, partial Q \( bold(r) \, s_z \; t \)) $
]

]
#proof[
変数 $z$ に対してその複素共役 $z^(\*)$
は任意の点で微分不可能であるが, この値を $0$ であると考えることにする.
このとき次のようになる.
$ frac(partial, partial phi.alt^(\*) \( bold(r) \, s_z \; t \)) nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) & = Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) $
よってそれぞれの式は Schrödinger 方程式とその複素共役であることがわかる.
$  & {frac(partial Q \( bold(r) \, s_z \; t \), partial t) = frac(partial H, partial P \( bold(r) \, s_z \; t \))\
frac(partial P \( bold(r) \, s_z \; t \), partial t) = - frac(partial H, partial Q \( bold(r) \, s_z \; t \))\
arrow.l.r.double & {i planck frac(partial, partial t) phi.alt \( bold(r) \, s_z \; t \) = frac(partial H, partial phi.alt^(\*) \( bold(r) \, s_z \; t \)) = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)\
- i planck frac(partial, partial t) phi.alt^(\*) \( bold(r) \, s_z \; t \) = frac(partial H, partial phi.alt \( bold(r) \, s_z \; t \)) = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) + sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_(z') \; t \) V_(s_(z') s_z) \( bold(r) \) $
]

#theorem("Q21-100")[
次の Poisson 括弧式が成り立つ.
$ {{ Q \( bold(r) \, s_z \; t \) \, P \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
{ Q \( bold(r) \, s_z \; t \) \, Q \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = { P \( bold(r) \, s_z \; t \) \, P \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = 0 $
]
#proof[
まず Poisson 括弧とは次のように定義される.
$ { f \, g }_(P o i s s o n) := frac(partial f, partial Q) frac(partial g, partial P) - frac(partial f, partial P) frac(partial g, partial Q) $
ここで次のような関係式が成り立つ.
$ frac(partial phi.alt \( bold(r) \, s_z \; t \), partial phi.alt \( bold(r)' \, s_(z') \; t \)) = frac(partial phi.alt^(\*) \( bold(r) \, s_z \; t \), partial phi.alt^(\*) \( bold(r)' \, s_(z') \; t \)) = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z')) \, #h(2em) frac(partial phi.alt^(\*) \( bold(r) \, s_z \; t \), partial phi.alt \( bold(r) \, s_z \; t \)) = 0 $
これより次のようになることは自明である.
$ {{ Q \( bold(r) \, s_z \; t \) \, P \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
{ Q \( bold(r) \, s_z \; t \) \, Q \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = { P \( bold(r) \, s_z \; t \) \, P \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = 0 $
]

#block[
#definition("正準量子化")[
正準量子化とは古典論から量子論へ書き換える 1 つの方法である.
具体的には次のように行う.

+ 古典論での正準変数を量子論での正準演算子に書き換える. また複素共役を
  Hermite 共役に書き換える.

+ 古典論での Poisson 括弧 ${ dot.op \, dot.op }_(P o i s s o n)$
  を量子論での
  $display(frac(1, i planck) \[ dot.op \, dot.op \]_minus.plus)$
  に書き換える.
]
]
#block[
#theorem("Q21-101(i)(ii)")[
Schrödinger の場
$phi.alt \( bold(r) \, s_z \; t \)$ の古典系の Hamiltonian
に対する正準量子化をすると次のようになる.
$ hat(H) = integral thin upright(d) bold(r) {frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) hat(phi.alt) \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) hat(phi.alt) \( bold(r) \, s_(z') \; t \)} $
これは場の理論で導出した $hat(H)_(upright(o n e))$ と同等である.
]

]
#proof[
Schrödinger の場における Hamiltonian
は次のようなものであった.
$ H = integral thin upright(d) bold(r) {frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)} $
これを正準量子化すると次のようになる.
$ hat(H) = integral thin upright(d) bold(r) {frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) hat(phi.alt) \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) hat(phi.alt) \( bold(r) \, s_(z') \; t \)} $
また場の理論での $hat(H)_(upright(o n e))$ は次のように計算できる.
$ hat(H)_(upright(o n e)) & = sum_1 hat(phi.alt)^dagger \( 1 \) [- frac(planck^2, 2 m) Delta_1 + V \( 1 \)] hat(phi.alt) \( 1 \)\
 & = sum_(s_z = - s)^s sum_(s_(z') = - s)^s integral thin upright(d) bold(r) hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) [- frac(planck^2, 2 m) Delta_(bold(r)) + V_(s_z s_(z')) \( bold(r) \)] hat(phi.alt) \( bold(r) \, s_(z') \; t \)\
 & = integral thin upright(d) bold(r) {- frac(planck^2, 2 m) sum_(s_z = - s)^s sum_(s_(z') = - s)^s hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) Delta_(bold(r)) hat(phi.alt) \( bold(r) \, s_(z') \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) hat(phi.alt) \( bold(r) \, s_(z') \; t \)}\
 & = integral thin upright(d) bold(r) {frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) hat(phi.alt) \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) hat(phi.alt) \( bold(r) \, s_(z') \; t \)} $
よって一致することがわかる.
]

#block[
#theorem("Q21-101(iii)(iv)")[
Schrödinger
の場における Poisson 括弧を正準量子化によって交換・反交換関係となる.
$ {\[ hat(phi.alt) \( bold(r) \, s_z \; t \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \; t \) \]_minus.plus = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
\[ hat(phi.alt) \( bold(r) \, s_z \; t \) \, hat(phi.alt) \( bold(r)' \, s_(z') \; t \) \]_minus.plus = \[ hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \; t \) \]_minus.plus = 0 $
これは場の理論で導出した交換・反交換関係と同等である.
]

]
#proof[
Schrödinger の場における Poisson
括弧は次のようなものであった.
$ {{ Q \( bold(r) \, s_z \; t \) \, P \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
{ Q \( bold(r) \, s_z \; t \) \, Q \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = { P \( bold(r) \, s_z \; t \) \, P \( bold(r)' \, s_(z') \; t \) }_(P o i s s o n) = 0 $
これを正準量子化すると次のようになる.
$ {\[ hat(phi.alt) \( bold(r) \, s_z \; t \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \; t \) \]_minus.plus = delta \( bold(r) - bold(r)' \) delta_(s_z s_(z'))\
\[ hat(phi.alt) \( bold(r) \, s_z \; t \) \, hat(phi.alt) \( bold(r)' \, s_(z') \; t \) \]_minus.plus = \[ hat(phi.alt)^dagger \( bold(r) \, s_z \; t \) \, hat(phi.alt)^dagger \( bold(r)' \, s_(z') \; t \) \]_minus.plus = 0 $
場の理論で導出した交換・反交換関係と同等であることは自明である.
]

= 第二量子化 - 波動描像から粒子描像へ
<第二量子化---波動描像から粒子描像へ>
外場 $V_(s_z s_(z')) \( bold(r) \)$ にさらされている 1 個の粒子を扱う.

#block[
#block[
#definition("Q21-102(ii)(iv)")[
Schrödinger
方程式を満たす Schrödinger の場 $phi.alt \( bold(r) \, s_z \; t \)$
について時間成分で Fourier 展開すると次のようになる.
$ phi.alt \( bold(r) \, s_z \; t \) & = sum_(i in I) b_i \( t \) phi.alt_i \( bold(r) \, s_z \) #h(2em) (b_i \( t \) = b_i \( 0 \) exp (- i / planck epsilon_i t)) $
このときの 1 粒子固有関数 $phi.alt_i \( bold(r) \, s_z \)$ の集合
$\( phi.alt_i \( bold(r) \, s_z \) \)_(i in I)$
は完全正規直交系となるとする.
]

]
]
#block[
#proposition("Q21-102(i)(iii)")[
Schrödinger
方程式は次のように書き換えられる.
$ epsilon_i phi.alt_i \( bold(r) \, s_z \) & = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt_i \( bold(r) \, s_z \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt_i \( bold(r) \, s_(z') \) $
]

]
#proof[
Schrödinger 方程式に代入し,
$\( phi.alt_i \( bold(r) \, s_z \) \)_(i in I)$
は完全正規直交系となっているから各係数は左右で一致することから得られる.
$ i planck frac(partial, partial t) phi.alt \( bold(r) \, s_z \; t \) & = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)\
sum_(i in I) epsilon_i b_i \( t \) phi.alt_i \( bold(r) \, s_z \) & = sum_(i in I) b_i \( t \) [- frac(planck^2, 2 m) Delta_(bold(r)) phi.alt_i \( bold(r) \, s_z \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt_i \( bold(r) \, s_(z') \)]\
epsilon_i phi.alt_i \( bold(r) \, s_z \) & = - frac(planck^2, 2 m) Delta_(bold(r)) phi.alt_i \( bold(r) \, s_z \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt_i \( bold(r) \, s_(z') \) $
]

#block[
#theorem("Q21-102(v)(vi)")[
全粒子数や Hamiltonian
は次のように書ける. $ N & = sum_(i in I) b_i^(\*) \( t \) b_i \( t \)\
H & = sum_(i in I) epsilon_i b_i \( t \) b_i \( t \) $
]

]
#proof[
それぞれ定義に代入することで得られる.
$ N & = sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt^(\*) \( bold(r) \, s_z \; t \) phi.alt \( bold(r) \, s_z \; t \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) sum_(i \, j in I) b_i^(\*) \( t \) phi.alt_i^(\*) \( bold(r) \, s_z \) b_j \( t \) phi.alt_j \( bold(r) \, s_z \)\
 & = sum_(i \, j in I) b_i^(\*) \( t \) b_j \( t \) delta_(i j)\
 & = sum_(i in I) b_i^(\*) \( t \) b_i \( t \) $
$ H & = integral thin upright(d) bold(r) {frac(planck^2, 2 m) sum_(s_z = - s)^s nabla_(bold(r)) phi.alt^(\*) \( bold(r) \, s_z \; t \) dot.op nabla_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)}\
 & = integral thin upright(d) bold(r) {frac(planck^2, 2 m) sum_(s_z = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_z = - s)^s sum_(s_(z') = - s)^s phi.alt^(\*) \( bold(r) \, s_z \; t \) V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)}\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt^(\*) \( bold(r) \, s_z \; t \) {- frac(planck^2, 2 m) Delta_(bold(r)) phi.alt \( bold(r) \, s_z \; t \) + sum_(s_(z') = - s)^s V_(s_z s_(z')) \( bold(r) \) phi.alt \( bold(r) \, s_(z') \; t \)}\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) phi.alt^(\*) \( bold(r) \, s_z \; t \) i planck frac(partial, partial t) phi.alt \( bold(r) \, s_z \; t \)\
 & = sum_(s_z = - s)^s integral thin upright(d) bold(r) sum_(i \, j in I) b_i^(\*) \( t \) phi.alt_i^(\*) \( bold(r) \, s_z \) epsilon_j b_j \( t \) phi.alt_j \( bold(r) \, s_z \)\
 & = sum_(i in I) epsilon_i b_i^(\*) \( t \) b_i \( t \) $
]

#block[
#theorem("Q21-102(vii)(viii)")[
力学変数を
$\( Q_i \( t \) \, P_i \( t \) \) = \( b_i \( t \) \, i planck b_i^(\*) \( t \) \)$
とおくと正準方程式や Poisson 括弧が成り立つ.
]

]
#proof[
Hamiltonian について $b_i^(\*) \( t \)$
で微分したものは次のように変形できる.
$ frac(partial H, partial b_i^(\*) \( t \)) & = epsilon_i b_i \( t \) = i planck frac(upright(d) b_i \( t \), upright(d) t) $
これより複素共役を取ることで正準方程式が成り立つ.
$ {frac(upright(d), upright(d) t) b_i \( t \) = frac(partial H, partial \( i planck b_i^(\*) \( t \) \))\
frac(upright(d), upright(d) t) \( i planck b_i^(\*) \( t \) \) = frac(partial H, partial b_i \( t \)) $
また係数に関して次のような関係式が成り立つ.
$ frac(partial b_i \( t \), partial b_j \( t \)) & = frac(partial b_i^(\*) \( t \), partial b_j^(\*) \( t \)) = delta_(i j) \, #h(2em) frac(partial b_i^(\*) \( t \), partial b_j \( t \)) = 0 $
これより次の Poisson 括弧式が成り立つ.
$ {{ b_i \( t \) \, i planck b_j^(\*) \( t \) }_(P o i s s o n) = delta_(i j)\
{ b_i \( t \) \, b_j \( t \) }_(P o i s s o n) = { i planck b_i^(\*) \( t \) \, i planck b_j^(\*) \( t \) }_(P o i s s o n) = 0 $
]

#block[
#theorem("Q21-102(ix)(x)(xi)(xii)")[
最後にここで示した式を正準量子化すると次のようになる.
$ hat(H) & = sum_(i in I) epsilon_i hat(b)_i^dagger \( t \) hat(b)_i \( t \)\
hat(N) & = sum_(i in I) hat(b)_i^dagger \( t \) hat(b)_i \( t \)\
hat(phi.alt) \( bold(r) \, s_z \; t \) & = sum_(i in I) phi.alt_i \( bold(r) \, s_z \) hat(b)_i \( t \) $
$ {\[ hat(b)_i \( t \) \, hat(b)_j^dagger \( t \) \]_minus.plus = delta_(i j)\
\[ hat(b)_i \( t \) \, hat(b)_j \( t \) \]_minus.plus = \[ hat(b)_i^dagger \( t \) \, hat(b)_j^dagger \( t \) \]_minus.plus = 0 $
]

]
#proof[
自明. 場の演算子や消滅,
生成演算子の交換・反交換関係は場の理論と完全に対応していることがわかる.
]
