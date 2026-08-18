#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "可換環論",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/commutative_algebra.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 環論
<環論>
#block[
#definition("環 (ring)")[
集合 $A$ が次の条件を満たす 2
つの二項演算をもつとき $A$ を環という。

+ $A$ は加法に関してアーベル群である。

+ 乗法は結合的であり、加法に対して分配的である。

+ すべての $x in A$ に対して、 $x 1 = 1 x = x$ を満たす元 $1 in A$
  が存在する。
]

]
#proposition[
$0 = 1$ のとき $A$ は唯一の元 $0$
からなる。このとき $A$ は零環 (zero ring) といい、$0$ で表される。
]
#proof[
任意の元 $x in A$ について次が成り立つ。
$ x = x 1 = x 0 = 0 $
]

#block[
#definition("環準同型写像 (ring homomorphism)")[
環 $A \, B$ に関して写像 $f : A arrow.r B$
が次の条件を満たすとき環準同型写像 (ring homomorphism) という。

+ $f \( x + y \) = f \( x \) + f \( y \)$

+ $f \( x y \) = f \( x \) f \( y \)$

+ $f \( 1 \) = 1$
]

]
#proposition[
$f : A arrow.r B$, $g : B arrow.r C$
が環準同型写像ならば合成写像 $g compose f : A arrow.r C$
も環準同型写像である。
]
具体例

+ $bb(Z) subset bb(Q) subset bb(R) subset bb(C)$ の和積は可換環となる.

+ 行列 $M_n \( bb(R) \)$ は非可換環となる.

+ 関数 $C^oo \( bb(R) \)$ の和積は可換環となる.

+ 群環 (有限群から可換環への写像の像の総和) の和積は環となる.

+ 2次の環 $bb(Z) \[ sqrt(d) \]$ は環になる.

#block[
#definition("部分環 (subring)")[
環 $A$
の部分集合 $S$ は、加法乗法に関して閉じていて $A$
の単位元を含んでいるとき $A$ の部分環 (subring) であるという。
]

]
#definition("イデアル")[
$frak(a)$ を環 $A$
の部分集合とする。$frak(a)$ が $A$ の加法部分群でかつ
$A frak(a) subset.eq frak(a)$ を満たすとき、$frak(a)$ を $A$ のイデアル
(ideal) という。 剰余群 $A \/ frak(a)$ は環 $A$
の乗法から一意的に乗法が定義され、環となる。これを剰余環 (quotient ring,
residue-class ring) $A \/ frak(a)$ という。 $A \/ frak(a)$ の元は $A$
における $frak(a)$ の剰余類であり、任意の $x in A$ に対して剰余類
$x + frak(a)$ を対応させる写像 $phi.alt : A arrow.r A frak(a)$
は全射的環準同型写像である。
]
#proposition[
$frak(a)$ を含んでいる $A$ のすべてのイデアル
$frak(b)$ の集合と、剰余環 $A \/ frak(a)$ のすべてのイデアル $frak(b)$
の集合との間には、$frak(b) = phi.alt^(- 1) \( frak(b) \)$
]
#definition[
環 $A$ の零因子 (zero divisor) とは、「$0$
を割り切る」元 $x$ のことである。すなわち $A$ のある元 $y eq.not 0$
が存在して $x y = 0$ となる元 $x in A$ のことである。
零元と異なる零因子をもたない環を整域 (integral domain) という
($0 eq.not 1$ としている)。

元 $x in A$ はある $n > 0$ に対して $x^n = 0$ となるとき、ベキ零元
(nilpotent) であるという。

$x in A$ が $1$ を割り切るとき、すなわちある元 $y in A$ が存在して
$x y = 1$ となるとき $x$ を $A$ の単元 (unit) という。このとき $y$ は
$x$ に対して一意に定まり、$x^(- 1)$ によって表す。 $A$
におけるすべての単元の集合はアーベル群をつくる。
]
#proposition[
$x$ を環 $A$ のベキ零元とする。$1 + x$ は $A$
の単元であることを示せ。これよりベキ零元と単元の和は単元であることを示せ。
]
#proof[
$x$ がベキ零元であるから $x^n = 0$ となる $n > 0$
が存在する。
$ \( 1 + x \) \( 1 + \( - x \) + dots.h.c + \( - x \)^(n - 1) \) = 1 + \( - x \)^n = 1 $
単元 $a$ を用いると $a^(- 1) x$ もベキ零元となるから $a + x$
も単元となる。 $ \( a + x \) a^(- 1) = 1 + a^(- 1) x $
]

#proposition[
$f = a_0 + a_1 x + dots.h.c + a_n x^n in A \[ x \]$ について
$ f "が単元である" & arrow.l.r.double a_0 "が単元かつ" a_1 \, dots.h \, a_n "はベキ零元である"\
f "がベキ零元である" & arrow.l.r.double a_0 \, a_1 \, dots.h \, a_n "がベキ零元である"\
f "が零因子である" & arrow.l.r.double A "のある元" a eq.not 0 "が存在して" a f = 0 "を満たす" $
]
#proof[
+ ($arrow.r.double.long$) $f^(- 1) = b_0 + b_1 x + dots.h.c + b_m x^m$
  とおくと
  $ f f^(- 1) & = \( a_0 + a_1 x + dots.h.c + a_n x^n \) \( b_0 + b_1 x + dots.h.c + b_m x^m \)\
   & = a_0 b_0 + \( a_0 b_1 + a_1 b_0 \) x + dots.h.c + a_n b_m x^(n + m)\
   & = 1\
  arrow.l.r.double a_0 b_0 & = 1 \, sum_(i + j = k) a_i b_j = 0 #h(2em) \( k > 0 \) $
  より $a_0 \, b_0$ は単元である。ここで $a_n^(r + 1) b_(m - r) = 0$
  について帰納法を用いて示す。まず $a_n b_m = 0$ である。$r - 1$
  までが成り立ち $r$ のときを考える。
  $ a_n^(r + 1) b_(m - r) & = a_n^r \( a_n b_(m - r) \)\
   & = a_n^r \( - a_(n - 1) b_(m - r + 1) - a_(n - 2) b_(m - r + 2) - dots.h.c - a_(n - r) b_m \)\
   & = - a_(n - 1) \( a_n^r b_(m - r + 1) \) + a_n a_(n - 2) \( a_n^(r - 1) b_(m - r + 2) \) + dots.h.c + a_n^(r - 1) a_(n - r) \( a_n b_m \)\
   & = 0 $ これより帰納法から $a_n^(r + 1) b_(m - r) = 0$
  が成り立つ。これより $r = m$ とすると $b_0$ は単元であるから
  $a_n^(m + 1) = 0$ より $a_n x^n$ はベキ零元である。これより
  $f - a_n x^n$ は単元である。よって帰納法から $a_1 \, dots.h \, a_n$
  はベキ零元である。

  ($arrow.l.double.long$) $g = b_0 + b_1 x + dots.h.c + b_m x^m$ とおき
  $f g = 1$ となるように $g$ を決定する。
  $ f g & = \( a_0 + a_1 x + dots.h.c + a_n x^n \) \( b_0 + b_1 x + dots.h.c + b_m x^m \)\
   & = a_0 b_0 + \( a_0 b_1 + a_1 b_0 \) x + dots.h.c + a_n b_m x^(n + m) = 1\
  arrow.l.r.double a_0 b_0 & = 1 \, sum_i a_i b_(k - i) = 0 #h(2em) \( k > 0 \)\
  arrow.l.r.double b_0 & = a_0^(- 1) \, b_k = - a_0^(- 1) (sum_(i = 1)^k a_i b_(k - i)) $
  これより $f$ は単元となる。

+ ($arrow.r.double.long$) $1 + f$ は単元であるから (1) より
  $a_1 \, dots.h \, a_n$ はベキ零元である。また $f^m = 0$ となる $m > 0$
  があり、その定数項は $a_0^m = 0$ であるから $a_0$ もベキ零元である。

  ($arrow.l.double.long$) 各 $a_i$ に対して $m_i$ を $a_i^(m_i) = 0$
  となる最小の数とする。$M = max m_i$ とおくと鳩の巣原理より
  $f^(n M) = 0$ となる。よって $f$ はベキ零元である。

+ ($arrow.r.double.long$) $g = b_0 + b_1 x + dots.h.c + b_m x^m$ を
  $f g = 0$ を満たす最小の次数の多項式 $g in A \[ x \]$ とする。ここで
  $a_n b_m = 0$ であるから $a_n g$ について $ f a_n g & = 0\
  deg a_n g & < m $ より次数の最小性から $a_n g = 0$ となる。これより
  $f g = \( a_0 + a_1 x + dots.h.c + a_(n - 1) x^(n - 1) \) g = 0$
  であるから $a_(n - 1) b_m = 0$ が成り立ち、$a_(n - 1) g = 0$
  となる。よって同様に考えて一次の係数を比較することで分かる。
  $ a_n g & = a_(n - 1) g = dots.h.c = a_0 g = 0\
  b_0 f & = 0 $

  ($arrow.l.double.long$) 自明。
]

#definition("準同型・同型")[
$A$, $B$
を環, $phi.alt : A arrow.r B$ を写像とする.

+ $phi.alt$ が準同型で逆写像が存在し, 逆写像も準同型であるとき,
  $phi.alt$ は同型であるという. また, このとき, $A$, $B$
  は同型であるといい, $A tilde.equiv B$ と書く.

+ $A = B$ なら準同型・同型を自己準同型・自己同型という. 環 $A$
  の自己同型全体の集合を $upright(A u t)^(upright(a l)) A$ と書く.
]
#proposition[
$phi.alt : A arrow.r B$ が環の準同型なら
$phi.alt \( 0_A \) = 0_B$ である. $A$, $B$, $C$ を環,
$phi.alt : A arrow.r B$, $psi : B arrow.r C$ を準同型とするとき,
その合成 $phi.alt compose psi : A arrow.r C$ も準同型である. 同様に
$phi.alt$, $psi$ が同型なら, $phi.alt compose psi$ も同型である.
]
#proof[
$ phi.alt \( 0_A \) = phi.alt \( 0_A + 0_A \) = phi.alt \( 0_A \) + phi.alt \( 0_A \) = 0_B $
$ psi compose phi.alt \( x + y \) & = psi \( phi.alt \( x + y \) \) = psi \( phi.alt \( x \) + phi.alt \( y \) \) = psi \( phi.alt \( x \) \) + psi \( phi.alt \( y \) \)\
 & = psi compose phi.alt \( x \) + psi compose phi.alt \( y \)\
psi compose phi.alt \( x y \) & = psi \( phi.alt \( x y \) \) = psi \( phi.alt \( x \) phi.alt \( y \) \) = psi \( phi.alt \( x \) \) psi \( phi.alt \( y \) \)\
 & = psi compose phi.alt \( x \) dot.op psi compose phi.alt \( y \)\
psi compose phi.alt \( 1_A \) & = psi \( phi.alt \( 1_A \) \) = psi \( 1_B \) = 1_C $
$psi compose phi.alt$ は準同型である。同型も同様。
]

#proposition[
$phi.alt : A arrow.r B$ が環の準同型ならば, 単射
$arrow.l.r.double$ \$\\mathop{\\mathrm{Ker}}{\\phi} = \\Bab{0}\$
]
#proof[
($arrow.r.double.long$) $phi.alt$
が環の準同型であるから $phi.alt \( 0_A \) = 0_B$ より
$0_A in "Ker" phi.alt$. また元 $forall x \, y in "Ker" phi.alt$ について
$phi.alt$ の単射性より
$phi.alt \( x \) = phi.alt \( y \) arrow.r.double.long x = y$ となり,
$"Ker" phi.alt$ には $0$ 以外の元は存在しない. \
($arrow.l.double.long$) $phi.alt \( x \) = phi.alt \( y \)$ となる
$x \, y$ について
$ 1 & = phi.alt \( x \) phi.alt \( y \)^(- 1) = phi.alt \( x \) phi.alt \( y^(- 1) \) = phi.alt \( x y^(- 1) \)\
1 & = x y^(- 1) $ より $x = y$ となるから $phi.alt$ は単射である.
]

#proposition[
$A eq.not 0$
を環とする。このとき次は同値である。

+ $A$ は体である。

+ $A$ のイデアルは $0$ と $\( 1 \)$ のみである。

+ $A$ から零でない環 $B$ へのすべての環準同型は単射である。
]
#proof[
($1 arrow.r.double.long 2$) $frak(a) eq.not 0$ を $A$
のイデアルとする。$frak(a)$ は零でない元 $x$ を含む。$x$
は単元であるから $frak(a) supset.eq \( x \) = \( 1 \)$ となり
$frak(a) = \( 1 \)$ を得る。

($2 arrow.r.double.long 3$) $phi.alt : A arrow.r B$
を環準同型とする。このとき $"Ker" \( phi.alt \)$ は $\( 1 \)$
と異なるイデアルであるから $"Ker" \( phi.alt \) = 0$ である。よって
$phi.alt$ は単射である。

($3 arrow.r.double.long 1$) $x$ を単元でない $A$ の元とする。すると
$\( x \) eq.not \( 1 \)$ であるから $B = A \/ \( x \)$
は零環ではない。$phi.alt : A arrow.r B$ を自然な準同型とすると
$"Ker" \( phi.alt \) = \( x \)$ である。仮定より $phi.alt$
は単射であるから $\( x \) = 0$。したがって $x = 0$ となる。
]

#definition[
$A$ のイデアル $frak(p)$ は
$frak(p) eq.not \( 1 \)$ かつ
$x y in frak(p) arrow.r.double.long x in frak(p)$ または $y in frak(p)$
という条件を満たすとき $A$ の素イデアル (prime ideal) であるという。

$A$ のイデアル $frak(m)$ は $frak(m) eq.not \( 1 \)$ かつ
$frak(m) subset.neq frak(a) subset.neq \( 1 \)$ を満たすいかなる $A$
のイデアル $frak(a)$ も存在しないとき $A$ の極大イデアル (maximal ideal)
であるという。
]
#theorem[
$ frak(p) "が素イデアルである" arrow.l.r.double A \/ frak(p) "は整域である"\
frak(m) "が極大イデアルである" arrow.l.r.double A \/ frak(m) "は体である" $
]
#proof[

]

#definition("$n$ 変数多項式")[
$A$
係数あるいは $A$ 上の $n$ 変数 $x = \( x_1 \, dots.h.c \, x_n \)$
の多項式とは, $bb(N)^n$ から $A$ への写像で有限個の
$\( i_1 \, dots.h.c \, i_n \) in bb(N)^n$ を除いて値が $0$ になるものと,
変数 $x = \( x_1 \, dots.h.c \, x_n \)$ の組のことである. この写像の
$\( i_1 \, dots.h.c \, i_n \) in bb(N)$ での値が
$a_(i_1 \, dots.h.c \, i_n)$ なら, この多項式を
$ f \( x \) = f \( x_1 \, dots.h.c \, x_n \) = sum_(i_1 \, dots.h.c \, i_n gt.eq 0) a_(i_1 \, dots.h.c \, i_n) x_1^(i_1) dots.h.c x_n^(i_n) $
などと書く. すべての $a_(i_1 \, dots.h.c \, i_n)$ が $0$ である多項式を
$0$ と書く. 各 $a_(i_1 \, dots.h.c \, i_n) x_1^(i_1) dots.h.c x_n^(i_n)$
を $f \( x \)$ の項, $a_(i_1 \, dots.h.c \, i_n)$ を係数という. 特に
$a_(0 \, dots.h.c \, 0)$ を $f \( x \)$ の定数項という.
]
#definition("$n$ 変数多項式の代入")[
$c = \( c_1 \, dots.h.c \, c_n \) in A^n$ とするとき
$ f \( c \) = f \( c_1 \, dots.h.c \, c_n \) = sum_(i_1 \, dots.h.c \, i_n) a_(i_1 \, dots.h.c \, i_n) c_1^(i_1) dots.h.c c_n^(i_n) $
とする. この値を考えることを代入という.
]
#definition("$n$ 変数多項式の次数")[
$f \( x \)$ の次数 $deg f \( x \)$ を
$ deg f \( x \) = cases(delim: "{", max { i_1 + dots.h.c + i_n divides a_(i_1 \, dots.h.c \, i_n) eq.not 0 } & \( f \( x \) eq.not 0 \), - oo & \( f \( x \) = 0 \)) $
と定義する.
]
#definition("$A$ 係数あるいは $A$ 上の $n$ 変数多項式環")[
2つの $n$ 変数多項式
$ f \( x \) = sum_(i_1 \, dots.h.c \, i_n) a_(i_1 \, dots.h.c \, i_n) x_1^(i_1) dots.h.c x_n^(i_n) \, quad g \( x \) = sum_(i_1 \, dots.h.c \, i_n) b_(i_1 \, dots.h.c \, i_n) x_1^(i_1) dots.h.c x_n^(i_n) $
は, $a_(i_1 \, dots.h.c \, i_n) = b_(i_1 \, dots.h.c \, i_n)$ がすべての
$i_1 \, dots.h.c \, i_n$ に対して成り立つとき多項式の同値関係
$f \( x \) = g \( x \)$ であると定義する.
また次のように多項式の和差積を定義する.
$ \( f plus.minus g \) \( x \) & = sum_(i_1 \, dots.h.c \, i_n) \( a_(i_1 \, dots.h.c \, i_n) plus.minus b_(i_1 \, dots.h.c \, i_n) \) x_1^(i_1) dots.h.c x_n^(i_n)\
f \( x \) g \( x \) & = sum_(i_1 \, dots.h.c \, j_n) a_(i_1 \, dots.h.c \, i_n) b_(j_1 \, dots.h.c \, j_n) x_1^(i_1 + j_1) dots.h.c x_n^(i_n + j_n) $
すると多項式全体の集合 $A \[ x \]$ は環となり, $A$ 係数あるいは $A$ 上の
$n$ 変数多項式環という.
]
#definition("無限変数多項式環")[
無限変数多項式環 $A \[ x_i \]_(i in I)$ とは $n > 0$ を整数とするとき,
$X_n$ を $bb(N)^n$ から $A$ への写像 $a$ で有限個の
$\( i_1 \, dots.h.c \, i_n \) in bb(N)^n$ を除いて値が $0$ であるものと
${ 1 \, dots.h.c \, n }$ から $I$ への単射写像 $phi.alt$
の組全体の集合とする. $X_n$ には $frak(S)_n$ が作用し, その軌道の集合を
$Y_n$ とする. $\( a \, phi.alt \) in X_n$ で代表される $Y_n$ の元に対し,
$ sum_(i_1 \, dots.h.c \, i_n in bb(N)) a \( i_1 \, dots.h.c \, i_n \) x_(phi.alt \( 1 \))^(i_1) dots.h.c x_(phi.alt \( n \))^(i_n) $
と書く. これは代表元のとりかたによらず定まる. ${ Y_n }_n$
は集合族となり, $n lt.eq m$ なら $Y_n subset.eq Y_m$ とみなせる.
$A \[ x_i \]_(i in I) = union.big_n Y_n$ と定義すればよい.
$A \[ x_i \]_(i in I)$
が集合として存在するときそれを無限変数多項式環という.
]
#proposition("素イデアルと極大イデアルの関係")[
素イデアル

+ $A$ が環なら, $A$ の任意の極大イデアルは素イデアルである.

+ $A$ が単項イデアル整域なら, $\( 0 \)$
  でない任意の素イデアルは極大イデアルである. したがって, $p$
  が素元なら, $A \/ \( p \)$ は体である.
]
#proposition("素元と既約元の関係")[
素元

+ $A$ が整域なら, $A$ の素元は既約元である.

+ $A$ が一意分解環なら, $A$ の既約元は素元である.
]
#proof[

]

#proposition[
体の多項式環はユークリッド環である.
]
#proof[
$d = deg$ とすると成り立つ.
]

#proposition("正規環")[
$f \( x \) = a_n x^n + dots.h.c + a_0 in A \[ x \]$ で
$a_0 \, a_n eq.not 0$, $alpha in K$
]
#definition[
+ ネーター環

+ アルティン環
]
= 加群
<加群>
#definition[
環 $R$ 上の行列の集合について定義する.

+ $m times n$ 行列の集合を $M_(m \, n) \( R \)$.

+ $n$ 次正方行の集合を $M_n \( R \)$.

+ $M_n \( R \)$ の乗法群(正則行列の集合)を一般線形群 $G L_n \( R \)$.

+ $G L_n \( R \)$ の $det$ の核 (行列式の値が単位元) を特殊線形群
  $S L_n \( R \)$.
]
