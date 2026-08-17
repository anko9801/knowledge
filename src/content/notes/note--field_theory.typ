#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem

#show: post.with(
  title: "体論",
  date: "2026-08-17",
  tags: ("ノート",),
  summary: "note/field_theory.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

#definition[
体 $K$ について自然な環準同型
$phi.alt : bb(Z) in.rev n mapsto n dot.op 1 in K$ の核
$upright(K e r) \( phi.alt \) subset bb(Z)$ は準同型定理
$bb(Z) \/ upright(K e r) \( phi.alt \) tilde.equiv Im \( phi.alt \)$ と
$Im \( phi.alt \)$ は整域であることから素イデアルである. $bb(Z)$
の素イデアルは $\( 0 \)$ または素数 $p$ があり $\( p \)$ であるから
$upright(K e r) \( phi.alt \)$ も $\( 0 \)$ または $\( p \)$ である.
このとき標数 $upright(c h) med K$ は それぞれ $0$, $p$ であるという.
]
#theorem[
標数に対応する体の性質

+ 標数 $0$ の体なら, $bb(Q)$ を含む.

+ 標数 $p > 0$ の体なら, $bb(F)_p$ を含む.
]
#definition[
$K$ が標数 $p > 0$ の体, $n$ が正の整数で
$q = p^n$ とおくと $upright(F r o b)_q : K in.rev x mapsto x^q in K$
をフロベニウス準同型という.
]
#theorem[
フロベニウス準同型は体の準同型である.
]
#proof[
$ upright(F r o b)_q \( x + y \) & = \( x + y \)^q = x^q + y^q = upright(F r o b)_q \( x \) + upright(F r o b)_q \( y \)\
upright(F r o b)_q \( x y \) & = \( x y \)^q = x^q y^q = upright(F r o b)_q \( x \) upright(F r o b)_q \( y \)\
upright(F r o b)_q \( 0 \) & = 0\
upright(F r o b)_q \( 1 \) & = 1 $
]

#definition[
体の拡大の定義

+ $L \/ K$ が体の拡大とする. $L$ の $K$ 上のベクトル空間としての次元を
  $\[ L : K \]$ と書く. 拡大次数 $\[ L : K \]$ が有限なら $L \/ K$
  を有限次拡大, そうでなければ無限次拡大という.

+ $n$ 変数有理式. $alpha in L$ により $K \( alpha \)$ となるとき, $L$ を
  $K$ の単拡大という. 有限個の元 $alpha_1 \, dots.h.c \, alpha_n in L$
  により $L = K \( alpha_1 \, dots.h.c \, alpha_n \)$ となるとき, $L$ は
  $K$ 上有限生成であるという.

+ $L \/ K$ が体の拡大とする. $L$ のすべての元が $K$ 上代数的なら
  $L \/ K$ は代数拡大という. そうでなければ, 超越拡大という.

+ $K$ を任意の定数でない1変数多項式 $f \( x \) in K \[ x \]$ に対し
  $alpha in K$ があり, $f \( alpha \) = 0$ となるとき, $K$
  を代数閉体という. $L \/ K$ が代数拡大であり $L$ が代数閉体であるとき,
  $L$ を $K$ の代数閉包という.

+ $L \/ K$ が代数拡大とする. $L$ のすべての元が $K$ 上分離的なら
  $L \/ K$ を分離拡大という.

+ $L \/ K$ が代数拡大とする. $alpha in L$ なら $alpha$ の $K$
  上の最小多項式が $L$ 上では1次式の積になるとき, $L \/ K$
  を正規拡大という.

+ $L \/ K$ が分離拡大かつ正規拡大ならガロア拡大という.
]
#proposition[
$L \/ M$, $M \/ K$ が有限次拡大なら $L \/ K$
も有限次拡大で $\[ L : K \] = \[ L : M \] \[ M : K \]$ となる.
]
#proof[
$l = \[ L : M \]$, $m = \[ M : K \]$,
${ x_1 \, dots.h.c \, x_l }$ を $L$ の $M$ 上の基底,
${ y_1 \, dots.h.c \, y_m }$ を $M$ の $K$ 上の基底とする. \
このとき $z in L$ なら $a_i in M$ があり, $z = sum_i a_i x_i$ となる.
また $b_(i j) in K$ があり $z = sum_(i \, j) b_(i j) x_i y_j$ となる.
よって,
$B = { x_i y_j divides i = 1 \, dots.h.c \, l \, j = 1 \, dots.h.c \, m }$
は $K$ 加群として $L$ を生成する.
]

#proposition[
既約な最小多項式

+ $L = K \[ x \] \/ \( f \( x \) \)$ は体で
  $\[ L : K \] = deg f \( x \)$ である.
]
#proof[

]

#theorem[
以下は互いに同値である.

+ $L \/ K$ が有限生成かつ代数拡大である.

+ $L \/ K$ が有限個の代数的な元から生成している.

+ $L \/ K$ が有限次拡大である.
]
#proof[
(1$arrow.r.double.long$2) \
代数的でない元から生成すれば超越拡大となることから代数的な元から生成している.
\
(2$arrow.r.double.long$3) \
代数的な元から生成するとその最小多項式の次数が拡大次数となることから $n$
に関する帰納法を用いて $L \/ K$ は有限次拡大である. \
(3$arrow.r.double.long$1) \
$n = \[ L : K \]$ として $x in L$ なら $1 \, x \, dots.h.c \, x^n$
は一次従属である. よって, $a_0 + dots.h.c + a_n x^n = 0$ となる
$a_0 \, dots.h.c \, a_n$ が存在する. つまり, $x$ は代数的な元である.
これより $L \/ K$ は代数拡大である. \
また, 無限生成ならば無限次拡大であるから有限生成である. \
]

#proposition[
$L \/ K$ が代数拡大, $alpha in L$ で,
$L supset M supset K$ を中間体とする. $alpha$ が $K$ 上分離的なら $M$
上でも分離的である.
]
#proof[
$alpha in overline(K)$ の $K$ 上の最小多項式
$f \( x \)$ が分離多項式であり, $overline(K) = overline(M)$ かつ $M$
上の最小多項式は $f \( x \)$ を割り切るから分離多項式となり, $M$
上でも分離的である.
]

#proposition[
$f \( x \) in K \[ x \]$ を $K$
上既約な多項式とする. このとき以下は互いに同値である.

+ $f \( x \)$ は $overline(K)$ 上で重根を持つ

+ $f' \( x \) = 0$

+ $"ch" K = p > 0$ であり, $K$ 上既約な分離多項式 $g \( x \)$ と $n > 0$
  があり, $f \( x \) = g \( x^(p^n) \)$ となる.
]
#proof[
($1 arrow.l.r.double 2$) \
$f' \( x \) = 0$ ならば \
($2 arrow.l.r.double 3$)
]

#theorem[
Steinitzの定理

+ $K$ の代数拡大 $L$ で, 代数閉体であるものが存在する.

+ $L_1 supset.eq M_1 supset.eq K$, $L_2 supset.eq M_2 supset.eq K$
]
#proof[

]
