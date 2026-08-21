#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "フーリエ解析",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/fourier_analysis.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= フーリエ解析
<フーリエ解析>
== フーリエ級数
<フーリエ級数>
#definition("内積")[
関数の正規直交関数系による展開 区間
$\[ a \, b \]$ 上の
]
#definition("複素フーリエ級数")[
$bb(T) = bb(R) \/ \( 2 pi bb(Z) \)$ 上 関数 $f : bb(T) arrow.r bb(C)$
に対し 区間 $\[ - pi \, pi \]$ において定義された実数値関数 $f \( x \)$
が連続かつ区分的に $C^1$ 級かつ周期的である
($f \( - pi \) = f \( pi \)$) ならば $f \( x \)$ は
$ f \( x \) & = sum_(n in bb(Z)) c_n e^(i n x)\
c_n & := frac(1, 2 pi) integral_(- pi)^pi f \( x \) e^(- i n x) thin upright(d) x $
]
例

#theorem("Bessel の不等式")[
$ sum_(n in bb(Z)) \| hat(f) \( n \) \|^2 lt.eq parallel f parallel_2^2 $
]
#theorem("平均値の定理")[
区間
$\[ a \, b \]$ で連続、 $\( a \, b \)$ で微分可能な関数 $f \( x \)$
について $a < c < b$ となる $c$ が存在して次のようになる。
$ frac(f \( b \) - f \( a \), b - a) = f' \( c \) $
]
#proposition[
$  & integral_(- pi)^pi sin \( m x \) cos \( n x \) thin upright(d) x = 0\
 & integral_(- pi)^pi cos \( m x \) cos \( n x \) thin upright(d) x = pi delta_(m \, n)\
 & integral_(- pi)^pi sin \( m x \) sin \( n x \) thin upright(d) x = pi delta_(m \, n)\
 & integral_(- pi)^pi cos \( n x \) thin upright(d) x = 2 pi delta_(n \, 0)\
 & integral_(- pi)^pi sin \( n x \) thin upright(d) x = 0 $
]
#proof[
$ integral_(- pi)^pi sin \( m x \) cos \( n x \) thin upright(d) x & = 1 / 2 integral_(- pi)^pi [sin \( m + n \) x + sin \( m - n \) x] thin upright(d) x\
 & = 1 / 2 [- frac(cos \( m + n \) x, m + n) - frac(cos \( m - n \) x, m - n)]_(- pi)^pi\
 & = 0\
integral_(- pi)^pi cos \( m x \) cos \( n x \) thin upright(d) x & = 1 / 2 integral_(- pi)^pi [cos \( m - n \) x + cos \( m + n \) x] thin upright(d) x\
 & = cases(delim: "{", 1 / 2 [frac(sin \( m - n \) x, m - n) + frac(sin \( m + n \) x, m + n)]_(- pi)^pi & \( m eq.not n \), 1 / 2 [x + frac(sin \( m + n \) x, m + n)]_(- pi)^pi & \( m = n \))\
 & = pi delta_(m \, n)\
integral_(- pi)^pi sin \( m x \) sin \( n x \) thin upright(d) x & = 1 / 2 integral_(- pi)^pi [cos \( m - n \) x - cos \( m + n \) x] thin upright(d) x\
 & = cases(delim: "{", 1 / 2 [frac(sin \( m - n \) x, m - n) - frac(sin \( m + n \) x, m + n)]_(- pi)^pi & \( m eq.not n \), 1 / 2 [x - frac(sin \( m + n \) x, m + n)]_(- pi)^pi & \( m = n \))\
 & = pi delta_(m \, n) $
$ integral_(- pi)^pi cos \( n x \) thin upright(d) x & = cases(delim: "{", [frac(sin \( n x \), n)]_(- pi)^pi & \( n eq.not 0 \), [x]_(- pi)^pi & \( n = 0 \))\
 & = 2 pi delta_(n \, 0)\
integral_(- pi)^pi sin \( n x \) thin upright(d) x & = cases(delim: "{", [- frac(cos \( n x \), n)]_(- pi)^pi & \( n eq.not 0 \), [0]_(- pi)^pi & \( n = 0 \))\
 & = 0 $
] 

#definition("2π の周期をもつ関数のフーリエ級数")[
$ f \( x \) & tilde.op a_0 / 2 + sum_(n = 1)^oo \( a_n cos \( n x \) + b_n sin \( n x \) \)\
a_n & := 1 / pi integral_(- pi)^pi f \( x \) cos \( n x \) thin upright(d) x\
b_n & := 1 / pi integral_(- pi)^pi f \( x \) sin \( n x \) thin upright(d) x $
]
#definition("2π の周期をもつ関数の複素フーリエ級数")[
$ f \( x \) & = sum_(n = - oo)^oo c_n e^(i n x)\
c_n & := frac(1, 2 pi) integral_(- pi)^pi f \( x \) e^(- i n x) thin upright(d) x $
]
#proof[
$ f \( x \) & tilde.op a_0 / 2 + sum_(n = 1)^oo \( a_n cos \( n x \) + b_n sin \( n x \) \)\
 & = a_0 / 2 + sum_(n = 1)^oo (a_n / 2 \( e^(i n x) + e^(- i n x) \) + frac(b_n, 2 i) \( e^(i n x) - e^(- i n x) \))\
 & = a_0 / 2 + sum_(n = 1)^oo (frac(a_n - i b_n, 2) e^(i n x) + frac(a_n + i b_n, 2) e^(- i n x))\
 & = sum_(n = - oo)^oo c_n e^(i n x) $ ただし $c_n$ は次のように定める。
$ c_n & := cases(delim: "{", frac(a_n - i b_n, 2) & \( n > 0 \), a_0 / 2 & \( n = 0 \), frac(a_n - i b_n, 2) & \( n < 0 \)) $
$ frac(1, 2 pi) integral_(- pi)^pi f \( x \) e^(- i n x) thin upright(d) x & = frac(1, 2 pi) integral_(- pi)^pi sum_(m = - oo)^oo c_m e^(i m x) e^(- i n x) thin upright(d) x\
 & = frac(1, 2 pi) sum_(m = - oo)^oo c_m integral_(- pi)^pi e^(i \( m - n \) x) thin upright(d) x\
 & = frac(1, 2 pi) sum_(m = - oo)^oo c_m 2 pi delta_(m \, n)\
 & = c_n $
] 

#definition("一般の周期をもつ関数のフーリエ級数")[
$ f \( x \) & tilde.op a_0 / 2 + sum_(n = 1)^oo (a_n cos frac(n pi x, L) + b_n sin frac(n pi x, L))\
a_n & := 1 / L integral_(- L)^pi f \( x \) cos frac(n pi x, L) thin upright(d) x\
b_n & := 1 / L integral_(- L)^pi f \( x \) sin frac(n pi x, L) thin upright(d) x $
]
#definition("一般の周期をもつ関数の複素フーリエ級数")[
$ f \( x \) & = sum_(n = - oo)^oo c_n e^(i frac(n pi, L) x)\
c_n & := frac(1, 2 L) integral_(- L)^L f \( x \) e^(- i frac(n pi, L) x) thin upright(d) x $
]
#theorem[
$ lim_(n arrow.r oo) a_n = 0 $
]
#lemma("コーシーの不等式")[
実数の数列 ${ p_n }_n \, { q_n }_n$ について次の不等式が成立する。
$ (sum_(n = 1)^N p_n^2) (sum_(n = 1)^N q_n^2) gt.eq (sum_(n = 1)^N p_n q_n)^2 $
]
#proof[
$x$ について次の 2
次関数の判別式を考えることで求まる。
$ sum_(n = 1)^N \( p_n x + q_n \)^2 gt.eq 0 $
] 

#theorem("ワイエルシュトラスの M テスト")[
区間 $\[ a \, b \]$ で定義された関数列の無限級数 $s \( x \)$
の各項の絶対値が上界 $M_n$ をもち、 $M_n$
の総和が収束するならばもとの級数は $\[ a \, b \]$ で一様収束する。
$ s \( x \) = sum_(n = 1)^oo f_n \( x \) $
]
#proof[

] 

#theorem[
$f \( x \) = x^n$ を $\[ - 1 \, 1 \]$ で Fourier
変換を行うことで $zeta$ 関数の値がわかる
]
#proof[
偶関数のとき $f \( x \) = x^(2 n)$ となる。
$ f \( x \) & = a_0 / 2 + sum_(n = 1)^oo (a_n cos \( n pi x \)) $
$ a_0 & = integral_(- 1)^1 x^(2 m) thin upright(d) x = frac(2, 2 m + 1)\
a_n & = integral_(- 1)^1 x^(2 m) cos \( n pi x \) thin upright(d) x\
 & = 2 integral_0^1 x^(2 m) cos \( n pi x \) thin upright(d) x\
 & = 2 sum_(k = 0)^(2 m) \( - 1 \)^k [\( x^(2 m) \)^(\( k \)) \( cos \( n pi x \) \)^(\( - k - 1 \))]_0^1 $
$k$ が偶数のとき $sin \( n pi x \)$ があるから $x = 0 \, 1$ 両方で $0$
となる。 また $k eq.not 2 m$ のとき $x = 0$ で $0$ となる。 これより $k$
が奇数 ($2 s - 1$) かつ $x = 1$ のときのみを考えればよい。
$ a_n & = - 2 sum_(s = 1)^m [frac(\( 2 m \) !, \( 2 m - k \) !) x^(2 m - k) frac(\( - 1 \)^s, \( n pi \)^(k + 1)) cos \( n pi x \)]_0^1\
 & = - 2 sum_(s = 1)^m frac(\( 2 m \) !, \( 2 m - 2 s + 1 \) !) frac(\( - 1 \)^(s + n), \( n pi \)^(2 s)) $
$ x^(2 m) & = frac(1, 2 m + 1) - 2 sum_(n = 1)^oo sum_(s = 1)^m frac(\( 2 m \) !, \( 2 m - 2 s + 1 \) !) frac(\( - 1 \)^(s + n), \( n pi \)^(2 s)) cos \( n pi x \) $
$m = 1$ のとき
$ x^2 & = 1 / 3 + 4 sum_(n = 1)^oo \( - 1 \)^n frac(cos \( n pi x \), \( n pi \)^2) $
$ 0^2 & = 1 / 3 + 4 / pi^2 sum_(n = 1)^oo frac(\( - 1 \)^n, n^2)\
1^2 & = 1 / 3 + 4 / pi^2 sum_(n = 1)^oo 1 / n^2 $
$ eta \( 2 \) & = pi^2 / 12\
zeta \( 2 \) & = pi^2 / 6 $
$ 1 / L integral_L^(- L) \( f \( x \) \)^2 thin upright(d) x & = a_0^2 / 2 + sum_(n = 1)^oo \( a_n^2 + b_n^2 \) $
$ zeta \( 4 \) = pi^4 / 90 $ 奇関数 $f \( x \) = x^(2 m - 1)$
$ f \( x \) & = sum_(n = 1)^oo (b_n sin \( n pi x \))\
b_n & = integral_(- 1)^1 x^(2 m - 1) sin \( n pi x \) thin upright(d) x\
 & = sum_(k = 0)^(2 m - 1) \( - 1 \)^k [\( x^(2 m - 1) \)^(\( k \)) \( sin \( n pi x \) \)^(\( - k - 1 \))]_(- 1)^1 $
$k$ が奇数のとき $sin$ でどちらも $0$ $k = 2 s$
$ b_n & = sum_(s = 0)^(m - 1) [frac(\( 2 m - 1 \) !, \( 2 m - 1 - k \) !) x^(2 m - 1 - k) frac(\( - 1 \)^(s + 1), \( n pi \)^(k + 1)) cos \( n pi x \)]_(- 1)^1\
 & = sum_(s = 0)^(m - 1) frac(\( 2 m - 1 \) !, \( 2 m - 1 - 2 s \) !) frac(\( - 1 \)^(s + 1), \( n pi \)^(2 s + 1)) (\( - 1 \)^n - \( - 1 \)^(2 m - 1 - 2 s + n))\
 & = 2 sum_(s = 0)^(m - 1) frac(\( 2 m - 1 \) !, \( 2 m - 1 - 2 s \) !) frac(\( - 1 \)^(s + n + 1), \( n pi \)^(2 s + 1)) $
$ f \( x \) & = 2 sum_(n = 1)^oo sum_(s = 0)^(m - 1) frac(\( 2 m - 1 \) !, \( 2 m - 1 - 2 s \) !) frac(\( - 1 \)^(s + n + 1), \( n pi \)^(2 s + 1)) sin \( n pi x \) $

$m = 2$ のとき
$ x^3 & = sum_(n = 1)^oo \( - 1 \)^n (- frac(2, n pi) + frac(12, \( n pi \)^3)) sin \( n pi x \) $
$ (1 / 2)^3 & = sum_(n = 1)^oo \( - 1 \)^n (- frac(2, n pi) + frac(12, \( n pi \)^3)) sin (frac(n pi, 2))\
 & = - sum_(n = 1)^oo (- frac(2, \( 2 n - 1 \) pi) + frac(12, \( \( 2 n - 1 \) pi \)^3)) \( - 1 \)^n\
 & = 2 / pi epsilon \( 1 \) - 12 / pi^3 epsilon \( 3 \)\
 $ パーバセル $ zeta \( 6 \) $
] 
