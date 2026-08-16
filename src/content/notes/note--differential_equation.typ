#import "/src/typst/template.typ": post

#show: post.with(
  title: "微分方程式",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/differential_equation.tex から変換",
)

= ラプラス変換
<ラプラス変換>
#block[
$ F \( s \) = cal(L) \[ f \( t \) \] & = integral_0^oo f \( t \) e^(- s t) upright(d) t\
f \( t \) = cal(L)^(- 1) \[ F \( s \) \] & = lim_(p arrow.r oo) frac(1, 2 pi i) integral_(c - i p)^(c + i p) F \( s \) e^(s t) upright(d) s $

]
#block[
#strong[定理 1] (). \

$ cal(L) \[ f' \( t \) \] & = s cal(L) \[ f \( t \) \] - f \( 0 \)\
cal(L) [integral_0^t f \( u \) upright(d) u] & = $

]
テスト
$ cal(L) \[ f' \( t \) \] & = integral_0^oo f' \( t \) e^(- s t) upright(d) t = [f \( t \) e^(- s t)]_0^oo + s integral_0^oo f \( t \) e^(- s t) upright(d) t = s cal(L) \[ f \( t \) \] - f \( 0 \)\
cal(L) [integral_0^t f \( u \) upright(d) u] & = $ 0◻ 例えば
$ cal(L) \[ 1 \] & = integral_0^oo e^(- s t) upright(d) t = [frac(e^(- s t), - s)]_0^oo = 1 / s\
cal(L) \[ t \] & = integral_0^oo t e^(- s t) upright(d) t = [t frac(e^(- s t), - s) - frac(e^(- s t), \( - s \)^2)]_0^oo = 1 / s^2\
cal(L) \[ t^2 \] & = integral_0^oo t^2 e^(- s t) upright(d) t = [t^2 frac(e^(- s t), - s) - 2 t frac(e^(- s t), \( - s \)^2) + 2 frac(e^(- s t), \( - s \)^3)]_0^oo = 2 / s^3\
cal(L) \[ t^3 \] & = integral_0^oo t^3 e^(- s t) upright(d) t = [t^3 frac(e^(- s t), - s) - 3 t^2 frac(e^(- s t), \( - s \)^2) + 6 t frac(e^(- s t), \( - s \)^3) - 6 frac(e^(- s t), \( - s \)^4)]_0^oo = 6 / s^4\
cal(L) \[ t^n \] & = integral_0^oo t^n e^(- s t) upright(d) t = sum_(i = 0)^n \( - 1 \)^i [frac(upright(d)^i t^n, upright(d) t^i) frac(e^(- s t), \( - s \)^(i + 1))]_0^oo = frac(n !, s^(n + 1)) $

$ cal(L) \[ e^(s_0 t) \] & = integral_0^oo e^(\( s_0 - s \) t) upright(d) t = frac(1, s - s_0) $
$ cal(L) \[ sin omega t \] & = integral_0^oo sin omega t e^(- s t) upright(d) t = frac(1, 2 i) integral_0^oo (e^(i omega t) - e^(- i omega t)) e^(- s t) upright(d) t\
 & = - frac(1, 2 i) (frac(1, i omega - s) - frac(1, - i omega - s)) = frac(omega, s^2 + omega^2)\
cal(L) \[ cos omega t \] & = integral_0^oo cos omega t e^(- s t) upright(d) t = 1 / 2 integral_0^oo (e^(i omega t) + e^(- i omega t)) e^(- s t) upright(d) t\
 & = - 1 / 2 (frac(1, i omega - s) + frac(1, - i omega - s)) = frac(s, s^2 + omega^2) $
$ cal(L) \[ sinh a t \] & = integral_0^oo sinh a t e^(- s t) upright(d) t = 1 / 2 integral_0^oo (e^(a t) - e^(- a t)) e^(- s t) upright(d) t\
 & = - 1 / 2 (frac(1, a - s) - frac(1, - a - s)) = frac(a, s^2 - a^2)\
cal(L) \[ cosh a t \] & = integral_0^oo cosh a t e^(- s t) upright(d) t = 1 / 2 integral_0^oo (e^(a t) + e^(- a t)) e^(- s t) upright(d) t\
 & = - 1 / 2 (frac(1, a - s) + frac(1, - a - s)) = frac(s, s^2 - a^2) $
$ cal(L) \[ delta \( t - a \) \] & = integral_0^oo delta \( t - a \) e^(- s t) upright(d) t = e^(- s a) $

= 特殊関数
<特殊関数>
== ガウス積分
<ガウス積分>
#block[
#strong[定理 2] (Gauss 積分). \

$ integral_(- oo)^oo e^(- alpha x^2) upright(d) x = sqrt(pi / alpha) #h(2em) \( "Re" a > 0 \) $

]
まず積分値を $I$ とおく。
$ I & := integral_(- oo)^oo e^(- alpha x^2) upright(d) x $ ここで $I^2$
を変数変換して計算する。
$ I^2 & = integral_(- oo)^oo e^(- alpha x^2) upright(d) x integral_(- oo)^oo e^(- alpha y^2) upright(d) y\
 & = integral_(- oo)^oo integral_(- oo)^oo e^(- alpha \( x^2 + y^2 \)) upright(d) x upright(d) y\
 & = integral_0^oo integral_0^(2 pi) e^(- alpha r^2) r upright(d) theta upright(d) r\
 & = 2 pi [frac(e^(- alpha r^2), - 2 alpha)]_0^oo\
 & = pi / alpha $ よって示される。
$ integral_(- oo)^oo e^(- alpha x^2) upright(d) x = sqrt(pi / alpha) $
0◻

#block[
#strong[定理 3] (Gauss 積分). \

$  & integral_0^oo x^(2 n) e^(- x^2 \/ a^2) upright(d) x = sqrt(pi) \( 2 n - 1 \) ! ! a^(2 n + 1) / 2^(n + 1)\
 & integral_0^oo x^(2 n + 1) e^(- x^2 \/ a^2) upright(d) x = frac(n !, 2) a^(2 n + 2)\
 & integral_(- oo)^oo e^(- k^2 \/ 4) e^(i k x) upright(d) k = 2 sqrt(pi) e^(- x^2) $

]
\$\$\\begin{aligned}
    \\int\_0^{\\infty} x^{2n}e^{-\\alpha x^2}\\mathrm{d} x & = (-1)^n\\int\_0^{\\infty} \\diffp\[n\]{\\alpha}e^{-\\alpha x^2}\\mathrm{d} x     \\\\
                                                & = (-1)^n\\diffp\[n\]{\\alpha}\\int\_0^{\\infty} e^{-\\alpha x^2}\\mathrm{d} x     \\\\
                                                & = (-1)^n\\diffp\[n\]{\\alpha}\\left(\\frac{1}{2}\\sqrt{\\frac{\\pi}{\\alpha}}\\right) \\\\
                                                & = \\sqrt{\\pi}\\frac{(2n - 1)!!}{2^{n+1}}\\alpha^{-(2n + 1)/2}
  
\\end{aligned}\$\$
$ integral_0^oo x^(2 n + 1) e^(- alpha x^2) upright(d) x & = \( - 1 \)^n integral_0^oo frac(partial^n, partial alpha^n) x e^(- alpha x^2) upright(d) x\
 & = \( - 1 \)^n frac(partial^n, partial alpha^n) integral_0^oo x e^(- alpha x^2) upright(d) x\
 & = \( - 1 \)^n frac(partial^n, partial alpha^n) frac(1, 2 alpha)\
 & = frac(n !, 2) alpha^(- \( n + 1 \)) $ 0◻

== ガンマ関数
<ガンマ関数>
#block[
複素平面上で $Re z > 1$ を満たす領域内にある閉曲線 $C$ 上の点 $z$
に対して次の関数は一様収束し正則な関数となる.
$ Gamma \( z \) := integral_0^oo t^(z - 1) e^(- t) upright(d) t $

]
#block[
$ Gamma \( z + 1 \) & = z Gamma \( z \) \, #h(2em) Gamma \( n + 1 \) = n ! \, #h(2em) Gamma \( 1 \) = 1 \, #h(2em) Gamma (1 / 2) = sqrt(pi) $

]
$ Gamma \( z + 1 \) & = integral_0^oo t^z e^(- t) upright(d) t\
 & = \[ - t^z e^(- t) \]_0^oo + z integral_0^oo t^(z - 1) e^(- t) upright(d) t\
 & = z Gamma \( z \)\
Gamma \( 1 \) & = integral_0^oo e^(- t) upright(d) t\
 & = \[ - e^(- t) \]_0^oo\
 & = 1\
Gamma (1 / 2) & = integral_0^oo t^(- 1 \/ 2) e^(- t) upright(d) t\
 & = integral_0^oo s^(- 1) e^(- s^2) 2 s upright(d) s\
 & = 2 integral_0^oo e^(- s^2) upright(d) s\
 & = sqrt(pi) $ 0◻

#block[
$ Gamma \( x + 1 \) & = sqrt(2 pi x) e^(- x) x^x #h(2em) \( x gt.double 1 \) $

]
$ Gamma \( x \) & = integral_0^oo t^(x - 1) e^(- t) upright(d) t\
 & = integral_0^oo e^(s \( x - 1 \)) e^(- e^s) e^s upright(d) s\
 & = integral_0^oo e^(s x - e^s) upright(d) s\
 & approx integral_0^oo e^(\( x ln x - x \) - x / 2 \( s - ln x \)^2) upright(d) s #h(2em) \( x gt.double 1 \)\
 & = x^x e^(- x) integral_0^oo e^(- x / 2 \( s - ln x \)^2) upright(d) s\
 & = x^x e^(- x) integral_0^oo e^(- x / 2 s^2) upright(d) s\
 & = sqrt(frac(2 pi, x)) x^x e^(- x) $ これより
$ Gamma \( x + 1 \) & = x Gamma \( x \) = sqrt(2 pi x) x^x e^(- x) $ 0◻

#block[
$ Gamma \( z \) & = oo arrow.l.r.double z = 0 \, - 1 \, - 2 \, dots.h\
"Res" \[ Gamma \( z \) ; z = - n \] & = frac(\( - 1 \)^n, n !) #h(2em) \( n = 0 \, 1 \, 2 \, dots.h \)\
{ Gamma \( s \) = 0 divides \| s \| < oo } & = nothing $

]
#block[
$gamma$ はオイラーの定数 (Euler's constant) とする.
$ frac(1, Gamma \( z \)) & = z e^(gamma z) product_(n = 1)^oo (1 + z / n) e^(- z \/ n)\
gamma & := lim_(n arrow.r oo) (sum_(m = 1)^n 1 / m - log n) = 0.577216 dots.h.c $

]
== ベータ関数
<ベータ関数>
#block[
ベータ関数 (Beta function)
$ B \( m \, n \) := integral_0^1 t^(m - 1) \( 1 - t \)^(n - 1) upright(d) t $

]
#block[
$ B \( m \, n \) & = B \( n \, m \)\
B \( m \, n \) & = 2 integral_0^(pi \/ 2) sin^(2 m - 1) theta cos^(2 n - 1) theta upright(d) theta\
B \( m \, n \) & = integral_0^oo frac(u^(m - 1), \( 1 + u \)^(m + n)) upright(d) theta $

]
$ B \( m \, n \) & = integral_0^1 t^(m - 1) \( 1 - t \)^(n - 1) upright(d) t\
 & = integral_1^0 \( 1 - s \)^(m - 1) s^(n - 1) \( - upright(d) t \) #h(2em) \( s = 1 - t \)\
 & = integral_0^1 s^(n - 1) \( 1 - s \)^(m - 1) upright(d) t\
 & = B \( n \, m \)\
B \( m \, n \) & = integral_0^1 t^(m - 1) \( 1 - t \)^(n - 1) upright(d) t\
 & = integral_0^(pi \/ 2) sin^(2 \( m - 1 \)) theta cos^(2 \( n - 1 \)) theta 2 sin theta cos theta upright(d) theta #h(2em) \( t = sin^2 theta \)\
 & = 2 integral_0^(pi \/ 2) sin^(2 m - 1) theta cos^(2 n - 1) theta upright(d) theta\
B \( m \, n \) & = integral_0^1 t^(m - 1) \( 1 - t \)^(n - 1) upright(d) t\
 $ 0◻

#block[
#strong[定理 4] (). \

$ B \( m \, n \) & = frac(n - 1, m) B \( m + 1 \, n - 1 \)\
B \( m \, n + 1 \) & = frac(n !, product_(k = 0)^n \( m + k \)) $

]
$ B \( m \, n \) & = integral_0^1 t^(m - 1) \( 1 - t \)^(n - 1) upright(d) t\
 & = [1 / m t^m \( 1 - t \)^(n - 1)]_0^1 + frac(n - 1, m) integral_0^1 t^m \( 1 - t \)^(n - 2) upright(d) t\
 & = frac(n - 1, m) B \( m + 1 \, n - 1 \)\
B \( m \, n + 1 \) & = frac(n dot.op \( n - 1 \) dots.h.c 1, a dot.op \( m + 1 \) dots.h.c \( m + n - 1 \)) B \( m + n \, 1 \)\
 & = frac(n !, product_(k = 0)^(n - 1) \( m + k \)) frac(1, m + n)\
 & = frac(n !, product_(k = 0)^n \( m + k \)) $ 0◻

#block[
$ B \( m \, n \) & = frac(Gamma \( m \) Gamma \( n \), Gamma \( m + n \))\
Gamma \( z \) Gamma \( 1 - z \) & = frac(pi, sin pi z) $

]
$ Gamma \( m \) Gamma \( n \) & = integral_0^oo s^(m - 1) e^(- s) upright(d) s integral_0^oo t^(n - 1) e^(- t) upright(d) t\
 & = integral_0^oo q^(2 \( m - 1 \)) e^(- q^2) 2 q upright(d) q integral_0^oo p^(2 \( n - 1 \)) e^(- p^2) 2 p upright(d) p & \( s = q^2 \, t = p^2 \)\
 & = 4 integral_0^oo integral_0^oo e^(- \( q^2 + p^2 \)) q^(2 m - 1) p^(2 n - 1) upright(d) p upright(d) q\
 & = 4 integral_0^(pi / 2) integral_0^oo e^(- r^2) r^(2 \( m + n - 1 \)) cos^(2 m - 1) theta sin^(2 n - 1) theta r upright(d) r upright(d) theta & \( q = r cos theta \, p = r sin theta \)\
 & = 4 integral_0^oo e^(- r^2) r^(2 \( m + n \) - 1) upright(d) r integral_0^(pi / 2) cos^(2 m - 1) theta sin^(2 n - 1) theta upright(d) theta\
 & = 2 integral_0^oo e^(- R) R^(m + n - 1) r frac(1, 2 r) upright(d) R B \( m \, n \) & \( R = r^2 \)\
 & = integral_0^oo e^(- R) R^(m + n - 1) upright(d) R B \( m \, n \)\
 & = Gamma \( m + n \) B \( m \, n \) $ これより
$ B \( m \, n \) & = frac(Gamma \( m \) Gamma \( n \), Gamma \( m + n \)) $
$ Gamma \( z \) Gamma \( 1 - z \) & = Gamma \( 1 \) B \( z \, 1 - z \)\
 & = integral_0^1 t^(z - 1) \( 1 - t \)^(- z) upright(d) t\
 & = frac(pi, sin pi z) $ 0◻

#block[
$ Gamma \( z \) & = lim_(n arrow.r oo) frac(n ! n^z, z \( z + 1 \) dots.h.c \( z + n \))\
 $

]
0◻

#block[
$ Gamma \( 2 z \) & = frac(2^(2 z), 2 sqrt(pi)) Gamma \( z \) Gamma (z + 1 / 2) $

]
== $n$ 次元超球の体積と表面積
<n-次元超球の体積と表面積>
#block[
#strong[定理 5] (). \

$ V_n \( R \) & = R^n frac(pi^(n / 2), Gamma \( n / 2 + 1 \)) = R^n frac(pi^(n / 2), \( n / 2 \) !) $

]
$n$ 次元超球の体積は次のように表現できる。
$ V_n \( R \) = integral_(x_1^2 + x_2^2 + dots.h.c + x_n^2 lt.eq R^2) upright(d) x_1 upright(d) x_2 dots.h.c upright(d) x_n $
各 $x_i$ を $R$ 倍することで
$ V_n \( R \) & = integral_(x_1^2 + x_2^2 + dots.h.c + x_n^2 lt.eq R^2) upright(d) x_1 upright(d) x_2 dots.h.c upright(d) x_n\
 & = R^n integral_(x_1^2 + x_2^2 + dots.h.c + x_n^2 lt.eq 1) upright(d) x_1 upright(d) x_2 dots.h.c upright(d) x_n\
 & = R^n V_n \( 1 \) $ これより $V_n \( 1 \)$
を求めればよい。$V_n \( 1 \)$ と $V_(n - 1) \( 1 \)$ の関係を求める。
$ V_n \( 1 \) & = integral_(x_1^2 + x_2^2 + dots.h.c + x_(n - 1)^2 lt.eq 1 - x_n^2) upright(d) x_1 upright(d) x_2 dots.h.c upright(d) x_n\
 & = V_(n - 1) \( 1 \) integral_(- 1)^1 (1 - x_n^2)^(frac(n - 1, 2)) upright(d) x_n\
 & = 2 V_(n - 1) \( 1 \) integral_0^(pi \/ 2) cos^n theta upright(d) theta\
 & = V_(n - 1) \( 1 \) B (1 / 2 \, frac(n + 1, 2))\
 & = V_(n - 1) \( 1 \) frac(Gamma \( 1 / 2 \) Gamma \( frac(n + 1, 2) \), Gamma \( n / 2 + 1 \))\
 & = V_(n - 1) \( 1 \) sqrt(pi) frac(Gamma \( frac(n + 1, 2) \), Gamma \( frac(n + 2, 2) \)) $
これより連続に適用することで
$ V_n \( 1 \) & = V_1 \( 1 \) pi^(frac(n - 1, 2)) frac(Gamma \( 3 / 2 \), Gamma \( 4 / 2 \)) frac(Gamma \( 4 / 2 \), Gamma \( 5 / 2 \)) dots.h.c frac(Gamma \( frac(n + 1, 2) \), Gamma \( frac(n + 2, 2) \))\
 & = 2 pi^(frac(n - 1, 2)) frac(Gamma \( 3 / 2 \), Gamma \( frac(n + 2, 2) \))\
 & = frac(pi^(n / 2), Gamma \( n / 2 + 1 \)) = frac(pi^(n / 2), \( n / 2 \) !) $
となり、超球の体積は
$ V_n \( R \) & = R^n frac(pi^(n / 2), Gamma \( n / 2 + 1 \)) = R^n frac(pi^(n / 2), \( n / 2 \) !) $
0◻

#block[
#strong[定理 6] (). \

表面積
$ S_n \( R \) = R^(n - 1) frac(2 pi^(pi / 2), Gamma \( n / 2 \)) $

]
0◻

#block[
]
== 超幾何関数
<超幾何関数>
#block[
超幾何関数
$ x \( 1 - x \) y'' + \[ c - \( a + b + 1 \) x \] y' - a b y = 0 $

]
#block[
$ e^x & = lim_(b arrow.r oo) zws_2 F_1 (1 \, b \, 1 ; x / b)\
log \( 1 + x \) & = x dot.op zws_2 F_1 \( 1 \, 1 \, 2 \; - x \) $

]
== Bernoulli 数
<bernoulli-数>
#block[
Bernoulli 数 $B_n$ は以下の正則関数の多項式展開の係数として定義される.
$ frac(x, e^x - 1) = sum_(n = 0)^oo frac(B_n, n !) x^n . $

]
#block[
$ B_1 = - 1 / 2 \, B_(2 n + 1) = 0 #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) . $

]
まず Bernoulli の定義式の両辺に $x \/ 2$ を加える。
$ frac(x, e^x - 1) + x / 2 = x / 2 + sum_(n = 0)^oo frac(B_n, n !) x^n $
このとき左辺は偶関数となる。
$ frac(x, e^x - 1) + x / 2 & = frac(x \( e^x + 1 \), 2 \( e^x - 1 \)) = x / 2 frac(e^(x \/ 2) + e^(- x \/ 2), e^(x \/ 2) - e^(- x \/ 2)) = x / 2 coth \( x / 2 \)\
frac(- x, 2) coth \( frac(- x, 2) \) & = frac(- x, 2) frac(e^(- x \/ 2) + e^(x \/ 2), e^(- x \/ 2) - e^(x \/ 2)) = x / 2 frac(e^(x \/ 2) + e^(- x \/ 2), e^(x \/ 2) - e^(- x \/ 2)) = x / 2 coth \( x / 2 \) $
これより次の右辺も偶関数であることがわかり、一致の定理から右辺について奇数次の項は現れない。よって
3 以上の奇数を添え字に持つ Bernoulli 数はゼロとなる。
$ B_1 & = - 1 / 2 \, #h(2em) B_(2 n + 1) = 0 #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) $
0◻

#block[
#strong[定理 7] (). \

$ sum_(m = 0)^(n - 1) frac(B_n, \( n - m \) ! m !) x^n = delta_(n \, 1) #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) . $

]
定義式の左辺の分母を払って展開すると
$ x & = \( e^x - 1 \) sum_(n = 0)^oo frac(B_n, n !) x^n\
 & = (sum_(k = 1)^oo frac(x^k, k !)) (sum_(n = 0)^oo frac(B_n, n !) x^n)\
 & = sum_(k = 1)^oo sum_(n = 0)^oo frac(B_n, k ! n !) x^(k + n)\
 & = sum_(n = 1)^oo sum_(m = 0)^(n - 1) frac(B_n, \( n - m \) ! m !) x^n . $
となり両辺の係数を比較することで次のようになる。
$ sum_(m = 0)^(n - 1) frac(B_n, \( n - m \) ! m !) x^n = delta_(n \, 1) #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) . $
0◻

#block[
$ B_0 = 1 \, B_1 = - 1 / 2 \, B_2 = 1 / 6 \, B_3 = 0 \, B_4 = - 1 / 30 \, B_5 = 0 \, B_6 = 1 / 42 \, dots.h.c $

]
上の定理について具体的式を求めると $  & B_0 = 1\
 & 1 / 2 B_0 + B_1 = 0\
 & 1 / 6 B_0 + 1 / 2 B_1 + 1 / 2 B_2 = 0\
 & 1 / 24 B_0 + 1 / 6 B_1 + 1 / 4 B_2 + 1 / 6 B_3 = 0\
 & 1 / 120 B_0 + 1 / 24 B_1 + 1 / 12 B_2 + 1 / 12 B_3 + 1 / 24 B_4 = 0\
 & 1 / 720 B_0 + 1 / 120 B_1 + 1 / 48 B_2 + 1 / 36 B_3 + 1 / 48 B_4 + 1 / 120 B_5 = 0\
 & 1 / 5040 B_0 + 1 / 720 B_1 + 1 / 240 B_2 + 1 / 144 B_3 + 1 / 144 B_4 + 1 / 240 B_5 + 1 / 720 B_6 = 0\
 & dots.h.c $ より添字が奇数のときを代入することで求まる。
$ B_0 = 1 \, B_1 = - 1 / 2 \, B_2 = 1 / 6 \, B_3 = 0 \, B_4 = - 1 / 30 \, B_5 = 0 \, B_6 = 1 / 42 \, dots.h.c . $
0◻

== ゼータ関数 $zeta \( s \)$
<ゼータ関数-zetas>
#block[
ゼータ関数 $zeta \( s \)$ は次のように定義される.
$ zeta \( s \) & := sum_(n = 1)^oo 1 / n^s #h(2em) \( "Re" s > 1 \) . $

]
#block[
$zeta \( s \)$ が $"Re" s > 1$ において一様絶対収束することを示す.

]
$s = a + b i med \( a > 1 \)$ とおく. すると次のようになる.
$ \| zeta \( s \) \| & lt.eq sum_(n = 1)^oo lr(|1 / n^s|) = sum_(n = 1)^oo 1 / n^a approx integral_1^oo upright(d) x x^(- a) = [frac(1, 1 - a) x^(1 - a)]_1^oo < oo . $
よってゼータ関数 $zeta \( s \)$ は一様絶対収束する. 0◻

#block[
$ zeta \( s \) & = product_(p : p r i m e) frac(1, 1 - p^(- s)) #h(2em) \( "Re" s > 1 \) . $

]
素因数分解の一意性より次のようにゼータ関数 $zeta \( s \)$
は式変形できる. $ zeta \( s \) & = sum_(n = 1)^oo 1 / n^s\
 & = 1 / 1^s + 1 / 2^s + 1 / 3^s + 1 / 2^(2 s) + 1 / 5^s + frac(1, \( 2 dot.op 3 \)^s) + dots.h.c\
 & = (1 + 2^(- s) + 2^(- 2 s) + dots.h.c) (1 + 3^(- s) + 3^(- 2 s) + dots.h.c) (1 + 5^(- s) + 5^(- 2 s) + dots.h.c) dots.h.c\
 & = product_(p : p r i m e) \( 1 + p^(- s) + p^(- 2 s) + dots.h.c \)\
 & = product_(p : p r i m e) frac(1, 1 - p^(- s)) . $ 0◻

#block[
$ zeta \( s \) & = 0 arrow.r.double.long "Re" s lt.eq 1 . $

]
$"Re" s > 1$ において $s = a + b sqrt(- 1) med \( a > 1 \)$ とおくと
$p^(- s)$ の大きさは次のように評価される.
$ \| p^(- s) \| = \| p^(- a - b sqrt(- 1)) \| = \| p^(- a) \| dot.op \| e^(- sqrt(- 1) b ln p) \| = p^(- a) . $
これより $zeta \( s \)$ の大きさは次のように評価される.
$ \| zeta \( s \) \| & = lr(|product_(p : p r i m e) frac(1, 1 - p^(- s))|) gt.eq product_(p : p r i m e) frac(1, 1 - \| p^(- s) \|) = product_(p : p r i m e) frac(1, 1 - p^(- a)) > 0 . $
よって $"Re" s > 1$ において $zeta \( s \)$ はゼロとならない.
つまり次のようになる.
$ zeta \( s \) & = 0 arrow.r.double.long "Re" s lt.eq 1 . $ 0◻

#block[
素数が無限に存在することを示す.

]
ゼータ関数 $zeta \( s \) med \( "Re" s > 1 \)$ について $s arrow.r 1$
の極限を取ると発散する.
$ lim_(s arrow.r 1) zeta \( s \) & = lim_(s arrow.r 1) sum_(n = 1)^oo 1 / n^s = oo . $
また Euler 積表示についても極限を取る.
$ lim_(s arrow.r 1) zeta \( s \) & = product_(p : p r i m e) frac(1, 1 - 1 \/ p) . $
ここで素数が有限個しかないならば発散しない.
ただゼータ関数は極限を取ると発散するので素数は無限個存在する. 0◻

#block[
$ Gamma \( s \) zeta \( s \) = integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) #h(2em) \( "Re" s > 1 \) . $

]
ガンマ関数の定義式について $x := n x$
と置換積分することで次のように式変形できる.
$ Gamma \( s \) & = integral_0^oo upright(d) x x^(s - 1) e^(- x)\
 & = integral_0^oo n upright(d) x (n x)^(s - 1) e^(- n x) \,\
Gamma \( s \) zeta \( s \) & = sum_(n = 1)^oo frac(Gamma \( s \), n^s)\
 & = sum_(n = 1)^oo integral_0^oo upright(d) x x^(s - 1) e^(- n x)\
 & = integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) . $ 0◻

#block[
この積分値を求める為に複素解析を用いる. 積分路 $C$ を
$C = C \( delta \) = C_(+) \( delta \) + C_0 \( delta \) + C_(+) \( delta \)$
として $C_(+) \( delta \)$ は実軸上無限遠から原点から $delta$
の距離にある点まで, $C_0 \( delta \)$ は中心を原点とする半径 $delta$
の円を反時計回りに 1 周し, $C_(-) \( delta \)$ は実軸上原点から $delta$
の距離にある点から無限遠までを積分する. また次の関数 $I \( s \; C \)$
を定義しておく.
$ I \( s \; C \) & := integral_C upright(d) z frac(z^(s - 1), e^z - 1) . $
$0 < delta < 2 pi$ を満たす範囲で $delta$
を動かしても積分値は一定である. $"Re" s > 1$ のとき $delta arrow.r 0$
とすると $C_0 \( delta \)$ に沿った積分 $I \( s \; C_0 \( delta \) \)$
がゼロになる.

]
被積分関数は $2 n pi sqrt(- 1)$ について 1 位の極がある.
これより留数定理から積分路の内部の極の数が変化しないなら積分値は一定である.
よって $0 < delta < 2 pi$ を満たす範囲で $delta$
を動かしても極の数は変化しないから積分値は一定である.
$ \| I \( s \; C_0 \( delta \) \) \| & = lr(|integral_(C_0 \( delta \)) upright(d) z frac(z^(s - 1), e^z - 1)|)\
 & = lr(|integral_0^(2 pi) delta i e^(i theta) upright(d) theta frac(\( delta e^(i theta) \)^(s - 1), e^(delta \( cos theta + i sin theta \)) - 1)|)\
 & lt.eq integral_0^(2 pi) upright(d) theta frac(\| delta^s \|, e^(delta cos theta) - 1)\
 & < \| delta^(s - 1) \| pi . $ これより $delta arrow.r 0$ のとき積分値
$I \( s \; C_0 \( delta \) \)$ は $0$ となる. 0◻

#block[
$ I \( s \; C \) & = \( e^(2 pi i s) - 1 \) integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) . $

]
Q 17A-10 の考察から $delta arrow.r 0$ の極限において積分 $I \( s \; C \)$
を考える.
$ I \( s \; C \) & = integral_(C \( delta \)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = integral_(C_(-) + C_0 + C_(+)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = integral_(C_(-)) upright(d) z frac(z^(s - 1), e^z - 1) + integral_(C_0) upright(d) z frac(z^(s - 1), e^z - 1) + integral_(C_(+)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = e^(2 pi i s) integral_(C_(+)) upright(d) z frac(z^(s - 1), e^z - 1) + 0 + integral_(C_(+)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = \( e^(2 pi i s) - 1 \) integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) . $
0◻

#block[
Q 17A-12.
$ zeta \( s \) & = frac(1, \( e^(2 pi i s) - 1 \) Gamma \( s \)) I \( s \; C \) . $

]
(i) 17A-11 より$"Re" s > 1$ において次が成り立つ.
$ Gamma \( s \) zeta \( s \) & = integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1)\
 & = frac(I \( s \; C \), e^(2 pi i s) - 1) \,\
zeta \( s \) & = frac(1, \( e^(2 pi i s) - 1 \) Gamma \( s \)) I \( s \; C \) #h(2em) \( "Re" s > 1 \) . $

(ii) $I \( s \; C \)$ は次のように定義された.
$ I \( s \; C \) & = integral_(C \( delta \)) upright(d) z frac(z^(s - 1), e^z - 1) . $
これは複素平面全体 $s in bb(C)$ に対して正則である. よって (i)
で求めた式は $"Re" s > 1$ の条件を取り外すことができ, 解析接続となる.

#block[
Q 17A-13.
$ zeta \( s \) & = e^(- pi i s) Gamma \( 1 - s \) frac(1, 2 pi i) I \( s \; C \) . $

]
さらに次のガンマ関数 $Gamma \( s \)$ の反転公式より
$ Gamma \( s \) Gamma \( 1 - s \) & = frac(pi, sin pi s) . $
ゼータ関数は次のように表される.
$ zeta \( s \) & = frac(1, \( e^(2 pi i s) - 1 \) Gamma \( s \)) I \( s \; C \)\
 & = frac(sin pi s, pi \( e^(2 pi i s) - 1 \)) Gamma \( 1 - s \) I \( s \; C \)\
 & = frac(e^(i pi s) - e^(- i pi s), e^(2 pi i s) - 1) Gamma \( 1 - s \) frac(1, 2 pi i) I \( s \; C \)\
 & = e^(- pi i s) Gamma \( 1 - s \) frac(1, 2 pi i) I \( s \; C \) . $

= 微分方程式
<微分方程式>
== エルミート多項式
<エルミート多項式>
#block[
次の級数展開の右辺に現れる $H_n \( x \)$ をエルミート多項式 (Hermite
polynomials) という。
$ e^(- t^2 + 2 t x) & = sum_(n = 0)^oo frac(1, n !) H_n \( x \) t^n $
また左辺の関数はエルミート多項式の母関数 (generating function) という。

]
#block[
#strong[定理 8] (ロドリグの公式 (Rodrigues's formula)). \

\$\$\\begin{aligned}
    H\_n(x) & = (-1)^ne^{x^2}\\diff\[n\]{x}e^{-x^2}
  
\\end{aligned}\$\$

]
両辺を $t$ で $n$ 階微分する。 \$\$\\begin{aligned}
    \\diffp\[n\]{t}(左辺) & = e^{x^2}\\diffp\[n\]{t}e^{-(t - x)^2} = -e^{x^2}\\diffp\[n\]{x}e^{-(t - x)^2} \\\\
    \\diffp\[n\]{t}(右辺) & = \\sum\_{m=n}^{\\infty}\\frac{1}{(m-n)!}H\_{m}(x)t^{m-n}
  
\\end{aligned}\$\$ $t = 0$ とすると示せる。 \$\$\\begin{aligned}
    H\_{n}(x) = -e^{x^2}\\diffp\[n\]{x}e^{-x^2}
  
\\end{aligned}\$\$ 0◻

#block[
$ H_n \( x \) & = frac(n !, 2 pi i) integral_C e^(- z^2 + 2 z x) / z^(n + 1) upright(d) z\
H_n \( x \) & = frac(1, 2 sqrt(pi)) \( - i \)^n integral_(- oo + 2 i x)^(oo + 2 i x) e^(- q^2 \/ 4) \( q + 2 i x \)^n upright(d) q\
H_n \( x \) & = sum_(l = 0)^(\[ n \/ 2 \]) \( - 1 \)^l frac(n !, \( n - 2 l \) ! l !) \( 2 x \)^(n - 2 l) $

]
#block[
$ H_(n') \( x \) & = 2 x H_n \( x \) - H_(n + 1) \( x \)\
H_(n + 1) \( x \) & = 2 x H_n \( x \) - 2 n H_(n - 1) \( x \)\
H_(n') \( x \) & = 2 n H_(n - 1) \( x \) $

]
0◻

#block[
#strong[定理 9] (). \

\$\$\\begin{aligned}
    \\diff\[2\]{x}f(x) - 2x\\diff{x}f(x) + 2nf(x) = 0
  
\\end{aligned}\$\$

]
0◻

#block[
#strong[定理 10] (). \

$ integral_(- oo)^oo H_m \( x \) H_n \( x \) e^(- x^2) upright(d) x & = 2^n n ! sqrt(pi) delta_(m n) $

]
0◻

== ルジャンドル微分方程式
<ルジャンドル微分方程式>
#block[
$ \( 1 - x^2 \) y'' - 2 x y' + lambda y = 0 $

]
$ y = sum_(j = 0)^oo a_j x^j $

#block[
ルジャンドルの陪微分方程式
$ \( 1 - x^2 \) y'' - 2 x y' + (n \( n + 1 \) - frac(m^2, 1 - x^2)) y = 0 $
これを満たす独立な 2 つの解 $P_n^m \( x \)$ と $Q_n^m \( x \)$
を第一種および第二種ルジャンドル陪関数はルジャンドル関数で表される。

]
== ベッセルの微分方程式
<ベッセルの微分方程式>
#block[
ベッセルの微分方程式 (Bessel's equation)
$ x^2 y'' + x y' + \( x^2 - nu^2 \) y = 0 $

]
#block[
ベッセルの微分方程式 (Bessel's equation)
$ x^2 y'' + x y' + \( x^2 - nu^2 \) y = 0 $

]
== ラゲール多項式
<ラゲール多項式>
#block[
ラゲール多項式
$ frac(e^(- x z \/ \( 1 - z \)), 1 - z) & = sum_(n = 0)^oo L_n \( x \) frac(z^n, n !) $

]
#block[
\$\$\\begin{aligned}
    L\_n(x)     & = e^x\\diff\[n\]{x}(x^ne^{-x})                          \\\\
    L\_n(x)     & = \\sum\_{l=0}^{n}\\frac{(-1)^l(n!)^2}{(l!)^2(n-l)!}x^l \\\\
    L\_{n+1}(x) & = (2n + 1 - x)L\_n(x) - n^2L\_{n-1}(x)                 \\\\
    xL\_n\'(x)   & = nL\_n(x) - n^2L\_{n-1}(x)                            \\\\
    L\_n(0)     & = n!
  
\\end{aligned}\$\$

]
== ポアソン方程式
<ポアソン方程式>
== 変数分離
<変数分離>
== 境界値問題
<境界値問題>
#block[
ラプラス方程式 (Laplace equation)
$ frac(partial^2 u, partial x^2) + frac(partial^2 u, partial y^2) = 0 $
ポアソン方程式 (Poisson equation)
$ frac(partial^2 u, partial x^2) + frac(partial^2 u, partial y^2) = - rho \( x \, y \) $
波動方程式 (wave equation)
$ 1 / c^2 frac(partial^2 u, partial t^2) = frac(partial^2 u, partial x^2) $
熱伝導方程式 (heat conduction equation) \
$kappa$ を熱伝導率 (thermal conductivity)
$ frac(partial u, partial t) & = kappa frac(partial^2 u, partial x^2) + q \( x \) $

]
#block[
ラプラス方程式を満たし
$ frac(partial^2 u, partial x^2) + frac(partial^2 u, partial y^2) = 0 $
次の境界条件を満たす関数 $u \( x \, y \)$ を求める。
$ u \( 0 \, y \) = 0 \, u \( a \, y \) = 0 \, u \( x \, 0 \) = f \( x \) \, u \( x \, b \) = 0 $

]
これは変数分離法が使えないと思う。
$ u \( x \, y \) = X \( x \) Y \( y \) $ ラプラス方程式
$ X'' \( x \) Y \( y \) & + X \( x \) Y'' \( y \) = 0\
frac(X'' \( x \), X \( x \)) & = - frac(Y'' \( y \), Y \( y \))\
X'' \( x \) & = - lambda^2 X \( x \)\
Y'' \( y \) & = lambda^2 Y \( y \)\
X \( x \) & = sin \( frac(n pi x, a) \)\
lambda & = frac(n pi, a)\
f \( x \) & = sum_(n = 1)^oo A_n sin \( frac(n pi x, a) \) sinh \( frac(n pi b, a) \) $
0◻
