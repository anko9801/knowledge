#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "統計力学",
  date: "2026-08-18",
  tags: ("レポート",),
  summary: "physics_report/statistic.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 構成要素である 1 個の二準位系の統計力学
<構成要素である-1-個の二準位系の統計力学>
絶対温度 $T$ の熱浴に系 $X$ が浸けられている状態として、系 $X$ の
Hamilton 演算子 $hat(h)_X$ の固有状態は $\|phi_1⟩$ と $\|phi_2⟩$ の 2
つだけであり、$\|phi_1⟩$ の固有エネルギーは $E_1$ であり、$\|phi_2⟩$
の固有エネルギーは $E_2$ であるとする：
$ hat(h)_X \|phi_i⟩ & = E_i \|phi_i⟩ #h(2em) \( i = 1 \, 2 \) 。 $
ただし $0 < E_1 < E_2$ $beta = 1 \/ k_B T$ とする。

#block[
Q 15-1.
このとき正準集団にもとづく統計力学を用いて解析を進めなさい。具体的には分配関数
$z \( beta \)$, Helmholtz 自由エネルギー $f$, エントロピー $s$,
内部エネルギー $u$, 比熱 $c$ を求めよ。

]
まず分配関数 $z \( beta \)$ について定義より次のようになる。
$ z \( beta \) & = sum_i e^(- beta E_i) = e^(- beta E_1) + e^(- beta E_2) . $
これより Helmholtz 自由エネルギー $f$ は次のようになる。
$ f & = - k_B T ln z \( beta \) = - 1 / beta ln \( e^(- beta E_1) + e^(- beta E_2) \) . $
Helmholtz 自由エネルギーが求まれば後は熱力学の公式を用いてエントロピー
$s$, 内部エネルギー $u$, 比熱 $c$ は次のように求まる。
$ s & = - (frac(partial f, partial T))_(V \, N) = - (frac(partial f, partial beta) frac(partial beta, partial T))_(V \, N) = k_B beta^2 (frac(partial f, partial beta))_(V \, N)\
 & = k_B beta^2 (1 / beta^2 ln \( e^(- beta E_1) + e^(- beta E_2) \) - 1 / beta frac(- E_1 e^(- beta E_1) - E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2)))\
 & = k_B (ln \( e^(- beta E_1) + e^(- beta E_2) \) + frac(beta E_1 e^(- beta E_1) + beta E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2))) $
$ u & = f + T s = frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2)) . $
$ c & = frac(partial u, partial T) = frac(partial u, partial beta) frac(partial beta, partial T) = - k_B beta^2 frac(partial u, partial beta)\
 & = - k_B beta^2 frac(partial, partial beta) (frac(E_1 + E_2 e^(beta \( E_1 - E_2 \)), 1 + e^(beta \( E_1 - E_2 \))))\
 & = - k_B beta^2 frac(E_2 \( E_1 - E_2 \) e^(beta \( E_1 - E_2 \)) \( 1 + e^(beta \( E_1 - E_2 \)) \) - \( E_1 + E_2 e^(beta \( E_1 - E_2 \)) \) \( E_1 - E_2 \) e^(beta \( E_1 - E_2 \)), \( 1 + e^(beta \( E_1 - E_2 \)) \)^2)\
 & = k_B beta^2 frac(\( E_2 - E_1 \)^2 e^(beta \( E_1 - E_2 \)), \( 1 + e^(beta \( E_1 - E_2 \)) \)^2)\
 & = k_B (frac(1 / 2 beta \( E_2 - E_1 \), cosh 1 / 2 beta \( E_2 - E_1 \)))^2 . $
$square.stroked$ a

#block[
Q 15-2. Q 15-1.では Helmholtz
自由エネルギーを計算して、後は熱力学の公式を用いて計算しましたが、今回は正準集団の理論における固有状態の実現確率を与える確率関数
$p_beta^("正準") \( i \) med \( i = 1 \, 2 \)$ を計算して、内部エネルギー
$u$ とエントロピー $s$ を求める。

]
まず確率関数 $p_beta^("正準") \( i \)$ は定義より次のようになる。
$ p_beta^("正準") \( i \) & = frac(e^(- beta E_i), z \( beta \)) . $
内部エネルギー $u$ はエネルギーの平均を取ることで分かる。
$ u & = sum_i E_i p_beta^("正準") \( i \) = frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2)) . $
比熱も Q15-1.と同様に求まる。

エントロピー $s$ は Shannon のエントロピーの公式に代入することで求まる。
$ s & = - k_B sum_(i = 1 \, 2) p_beta^("正準") \( i \) ln p_beta^("正準") \( i \)\
 & = - k_B sum_(i = 1 \, 2) frac(e^(- beta E_i), z \( beta \)) \( - ln z \( beta \) - beta E_i \)\
 & = k_B (ln \( e^(- beta E_1) + e^(- beta E_2) \) + frac(beta E_1 e^(- beta E_1) + beta E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2))) . $

#block[
Q 15-3. 低温極限 ($beta \( E_2 - E_1 \) gt.double 1$)
において系は固有エネルギーのより小さい固有状態 1
にほぼ確実に実現され、より大きい固有状態 2
に実現されることはほぼないことを説明せよ。

]
低温極限では $F = E - T S$
よりエントロピーを上げるよりエネルギーが低いものを選んだ方がエネルギーが得となる為に固有エネルギーの低い状態に集まる。実際式でも次のように計算できる。

実際式でも次のようになる。
$  & quad p_beta^("正準") \( i \) = frac(e^(- beta E_i), z \( beta \)) = frac(e^(- beta \( E_i - E_1 \)), 1 + e^(- beta \( E_2 - E_1 \))) approx e^(- beta \( E_i - E_1 \))\
 & {p_beta^("正準") \( 1 \) approx 1\
p_beta^("正準") \( 2 \) approx e^(- beta \( E_2 - E_1 \)) lt.double 1 $

#block[
Q 15-4. 高温極限 ($beta \( E_2 - E_1 \) lt.double 1$)
において系は固有状態 1, 2 にほぼ同じ確率 $1 \/ 2$
で実現されることを説明せよ。

]
高温極限では $F = E - T S$
よりエントロピーを増大させるとエネルギーが得となる為に半々となる。実際式でも次のように計算できる。

$  & quad p_beta^("正準") \( i \) = frac(e^(- beta E_i), z \( beta \)) = frac(e^(- beta \( E_i - E_1 \)), 1 + e^(- beta \( E_2 - E_1 \))) approx e^(- beta \( E_i - E_1 \)) / 2\
 & {p_beta^("正準") \( 1 \) approx 1 / 2\
p_beta^("正準") \( 2 \) approx e^(- beta \( E_2 - E_1 \)) / 2 approx 1 / 2 $

#block[
Q 15-5. 低温の漸近領域 ($beta \( E_2 - E_1 \) gt.double 1$,
$beta E_1 gt.double 1$) において解析せよ。

]
$x arrow.r 0$ において $\( 1 + x \)^(- 1) approx 1 - x$
と近似できることを用いて、それぞれの熱力学量は次のように計算できる。
$ z & = e^(- beta E_1) + e^(- beta E_2)\
 & = e^(- beta E_1) \( 1 + e^(- beta \( E_2 - E_1 \)) \)\
 & approx e^(- frac(E_1, k_B T))\
 & arrow.r 0\
f & = - 1 / beta ln \( e^(- beta E_1) + e^(- beta E_2) \)\
 & = - 1 / beta ln e^(- beta E_1) \( 1 + e^(- beta \( E_2 - E_1 \)) \)\
 & approx E_1 - 1 / beta e^(- beta \( E_2 - E_1 \))\
 & approx E_1 - k_B T e^(- frac(E_2 - E_1, k_B T))\
 & arrow.r E_1\
s & = k_B (ln \( e^(- beta E_1) + e^(- beta E_2) \) + frac(beta E_1 e^(- beta E_1) + beta E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2)))\
 & = k_B (ln e^(- beta E_1) \( 1 + e^(- beta \( E_2 - E_1 \)) \) + frac(beta E_1 + beta E_2 e^(- beta \( E_2 - E_1 \)), 1 + e^(- beta \( E_2 - E_1 \))))\
 & approx k_B (- beta E_1 + e^(- beta \( E_2 - E_1 \)) + \( beta E_1 + beta E_2 e^(- beta \( E_2 - E_1 \)) \) \( 1 - e^(- beta \( E_2 - E_1 \)) \))\
 & approx k_B frac(E_2 - E_1, k_B T) e^(- frac(E_2 - E_1, k_B T))\
 & arrow.r 0\
u & = frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2))\
 & = frac(E_1 + E_2 e^(- beta \( E_2 - E_1 \)), 1 + e^(- beta \( E_2 - E_1 \)))\
 & approx \( E_1 + E_2 e^(- beta \( E_2 - E_1 \)) \) \( 1 - e^(- beta \( E_2 - E_1 \)) \)\
 & approx E_1 + \( E_2 - E_1 \) e^(- frac(E_2 - E_1, k_B T))\
 & arrow.r E_1\
c & = k_B (frac(1 / 2 beta \( E_2 - E_1 \), cosh 1 / 2 beta \( E_2 - E_1 \)))^2\
 & = k_B (frac(beta \( E_2 - E_1 \), 1 + e^(- beta \( E_2 - E_1 \))))^2 e^(- beta \( E_2 - E_1 \))\
 & approx k_B (frac(E_2 - E_1, k_B T))^2 e^(- frac(E_2 - E_1, k_B T))\
 & arrow.r 0 $

#block[
Q 15-6. 高温の漸近領域 ($beta \( E_2 - E_1 \) lt.double 1$,
$beta E_1 lt.double 1$) において解析せよ。

]
$x arrow.r 0$ において $e^x approx 1 + x$
と近似できることを用いて、それぞれの熱力学量は次のように計算できる。
$ z & = e^(- beta E_1) \( 1 + e^(- beta \( E_2 - E_1 \)) \)\
 & approx \( 1 - beta E_1 \) \( 2 - beta \( E_2 - E_1 \) \)\
 & approx 2 - frac(E_1 + E_2, k_B T)\
 & arrow.r 2\
f & = - 1 / beta ln e^(- 1 / 2 beta \( E_1 + E_2 \)) \( e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \)) \)\
 & approx 1 / 2 \( E_1 + E_2 \) - k_B T ln 2\
 & arrow.r - oo\
s & = k_B (ln e^(- 1 / 2 beta \( E_1 + E_2 \)) \( e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \)) \) + frac(beta E_1 e^(1 / 2 beta \( E_2 - E_1 \)) + beta E_2 e^(- 1 / 2 beta \( E_2 - E_1 \)), e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \))))\
 & approx k_B (ln 2 - 1 / 2 beta \( E_1 + E_2 \) + beta / 2 (E_1 (1 + 1 / 2 beta \( E_2 - E_1 \)) + E_2 (1 - 1 / 2 beta \( E_2 - E_1 \))))\
 & approx k_B (ln 2 - 1 / 4 (frac(E_2 - E_1, k_B T))^2)\
 & arrow.r k_B ln 2\
u & = frac(E_1 e^(1 / 2 beta \( E_2 - E_1 \)) + E_2 e^(- 1 / 2 beta \( E_2 - E_1 \)), e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \)))\
 & approx 1 / 2 (E_1 (1 + 1 / 2 beta \( E_2 - E_1 \)) + E_2 (1 - 1 / 2 beta \( E_2 - E_1 \)))\
 & approx 1 / 2 \( E_1 + E_2 \) - 1 / 4 frac(\( E_2 - E_1 \)^2, k_B T)\
 & arrow.r 1 / 2 \( E_1 + E_2 \)\
c & = k_B (frac(beta \( E_2 - E_1 \), e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \))))^2\
 & approx k_B 1 / 4 (frac(E_2 - E_1, k_B T))^2\
 & arrow.r 0 $

#block[
Q 15-7. 比熱について解析せよ。

]
まず比熱について次のように定義した関数 $phi.alt \( x \)$
を用いて表される。 $ phi.alt \( x \) & := frac(x, cosh x)\
c & = k_B (frac(1 / 2 beta \( E_2 - E_1 \), cosh 1 / 2 beta \( E_2 - E_1 \)))^2\
 & = k_B (phi.alt (1 / 2 beta \( E_2 - E_1 \)))^2 $ ここで $x gt.eq 0$
の範囲において $phi.alt \( x \)$ が極大となる $x = x_0$ の値を考える。
$  & frac(upright(d) phi.alt, upright(d) x)\|_(x = x_0) = 0\
arrow.l.r.double & frac(cosh x_0 - x_0 sinh x_0, cosh^2 x_0) = 0\
arrow.l.r.double & x_0 tanh x_0 = 1\
arrow.l.r.double & x_0 = 1.199678640257734 dots.h $

ただしプログラム  を用いて $x gt.eq 0$ の範囲で
$x_0 tanh x_0 = 1$ は $x_0 = 1.199678640257734 dots.h$
のとき満たすことが分かる。これより比熱 $c$ は次のように定義される $T_0$
のときに極大を取る。
$  & x_0 = 1 / 2 beta_0 \( E_2 - E_1 \) = 1 / 2 frac(E_2 - E_1, k_B T_0)\
 & frac(k_B T_0, E_2 - E_1) = frac(1, 2 x_0) = 0.41677827980048 dots.h $

低温、高温で比熱が 0 となる理由は比熱が
$C = frac(upright(d) E, upright(d) T)$ であることより Q15-3, Q15-4
よりエネルギーの確率が極限的に定数となることから比熱は 0
となることが分かる。

```
fn main() {
    let x0 = newton();
    println!("{}", x0);
    println!("{}", 1.0 / (2.0 * x0));
}

fn newton() -> f64 {
    let mut x = 1.0;
    for _i in 0..5 {
        x = _newton(x);
    }
    x
}

fn _newton(x: f64) -> f64 {
    x - f(x) / _f(x)
}

// f(x) = x tanh x - 1
fn f(x: f64) -> f64 {
    x * x.tanh() - 1.0
}

// f'(x) = x / cosh^2 x + tanh x
fn _f(x: f64) -> f64 {
    x * x.cosh().powi(-2) + x.tanh()
}
```

#block[
Q 15-8. 二準位系の熱力学量のグラフを描け。

]
図 @fig:2level のように描ける。

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/2level_system.jpg", height: 8cm))
  ]],
  caption: [
    二準位系におけるそれぞれの熱力学量の温度 $T$ に関するグラフ
  ]
)
<fig:2level>

#block[
Q 15-9. $N$ 個の独立な二準位系からなる系の熱力学量を求めよ。

]
独立な部分系からなる全体系に対する正準集団の理論を用いて次のようになることが分かる。
$ Z \( beta \) & = z \( beta \)^N = \( e^(- beta E_1) + e^(- beta E_2) \)^N\
F & = N f = - N / beta ln \( e^(- beta E_1) + e^(- beta E_2) \)\
S & = N s = N k_B (ln \( e^(- beta E_1) + e^(- beta E_2) \) + frac(beta E_1 e^(- beta E_1) + beta E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2)))\
U & = N u = N frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2))\
C & = c = k_B (frac(1 / 2 beta \( E_2 - E_1 \), cosh 1 / 2 beta \( E_2 - E_1 \)))^2 . $

= 調和振動子の量子力学のまとめ
<調和振動子の量子力学のまとめ>
1次元の空間を運動する粒子が、次の調和振動子の Hamilton 演算子 $hat(H)$
に従っているとします：
$ hat(H) & = frac(1, 2 m) hat(p)^2 + 1 / 2 m omega^2 hat(q)^2 . $
ここで、$m$ は粒子の質量であり、$omega$
は調和振動の角振動数です。また、$hat(q)$
は粒子の位置座標演算子であり、$hat(p)$
は運動量演算子です。それらは、次の正準交換関係を満たします：
$ \[ hat(q) \, hat(p) \] = hat(q) hat(p) - hat(p) hat(q) = bold(i) planck $
ここで、$planck$ は Planck 定数です。

この 1 次元調和振動子の固有エネルギー $E_h$ と固有状態 $\|n⟩$
は固有方程式 $ hat(H) \|n⟩ = E_n \|n⟩ $
を解くことにより定まります。解いた結果は $n = 0 \, 1 \, 2 \, dots.h$
に対して次のとおりです： $ {E_n = (n + 1 / 2) planck omega\
Psi_n \( q \) = ⟨q⟩ n = (frac(m omega, 2^(2 n) \( n ! \)^2 pi planck))^(1 / 4) e^(- frac(m omega, 2 planck) q^2) H_n (sqrt(frac(m omega, planck)) q) . $
ここで、Hermite 多項式 $H_n \( x \)$ は次の Rodrigues
公式により定義されます：
$ H_n \( x \) = \( - 1 \)^n e^(x^2) frac(upright(d)^n, upright(d) x^n) e^(- x^2) . $

= 1 個の調和振動子の統計力学
<個の調和振動子の統計力学>
#block[
Q 16-1. 1 個の調和振動子の統計力学における熱力学量を明らかにせよ。

]
熱力学量である分配関数 $z \( beta \)$、Helmholtz 自由エネルギー
$f$、エントロピー $s$、内部エネルギー $u$、比熱 $c$
について定義や熱力学の公式を用いて次のように求まる。

$ z \( beta \) & = sum_(i = 0)^oo e^(- beta E_i) = sum_(i = 0)^oo e^(- beta (n + 1 / 2) planck omega)\
 & = frac(e^(- 1 / 2 beta planck omega), 1 - e^(- beta planck omega))\
 & = frac(1, 2 sinh 1 / 2 beta planck omega)\
f & = - k_B T ln z \( beta \)\
 & = - 1 / beta ln frac(e^(- 1 / 2 beta planck omega), 1 - e^(- beta planck omega))\
 & = - 1 / beta ln frac(1, 2 sinh 1 / 2 beta planck omega)\
 & = 1 / beta ln \( 1 - e^(- beta planck omega) \) + 1 / 2 planck omega\
 & = 1 / beta ln (2 sinh 1 / 2 beta planck omega)\
s & = - (frac(partial f, partial T))_(V \, N) = k_B beta^2 (frac(partial f, partial beta))_(V \, N)\
 & = k_B beta^2 (- 1 / beta^2 ln \( 1 - e^(- beta planck omega) \) + frac(planck omega, beta \( 1 - e^(- beta planck omega) \)))\
 & = k_B beta^2 (- 1 / beta^2 ln (2 sinh 1 / 2 beta planck omega) + frac(1 / 2 planck omega cosh 1 / 2 beta planck omega, beta sinh 1 / 2 beta planck omega))\
 & = k_B (- ln \( 1 - e^(- beta planck omega) \) + frac(beta planck omega, e^(beta planck omega) - 1))\
 & = k_B (- ln (2 sinh 1 / 2 beta planck omega) + 1 / 2 beta planck omega coth 1 / 2 beta planck omega)\
 $ $ u & = f + T s\
 & = 1 / beta ln \( 1 - e^(- beta planck omega) \) + 1 / 2 planck omega + 1 / beta (- ln \( 1 - e^(- beta planck omega) \) + frac(beta planck omega, e^(beta planck omega) - 1))\
 & = 1 / beta ln (2 sinh 1 / 2 beta planck omega) + 1 / beta (- ln (2 sinh 1 / 2 beta planck omega) + 1 / 2 beta planck omega coth 1 / 2 beta planck omega)\
 & = (1 / 2 + frac(1, e^(beta planck omega) - 1)) planck omega\
 & = 1 / 2 planck omega coth 1 / 2 beta planck omega\
c & = frac(partial u, partial T) = - k_B beta^2 frac(partial u, partial beta)\
 & = - k_B beta^2 (- frac(planck omega e^(beta planck omega), \( e^(beta planck omega) - 1 \)^2)) planck omega\
 & = k_B (beta planck omega frac(e^(1 / 2 beta planck omega), e^(beta planck omega) - 1))^2\
 & = k_B (frac(1 / 2 beta planck omega, sinh 1 / 2 beta planck omega))^2 . $

これより求まった。 $square.stroked$

#block[
Q 16-2. 低温の漸近領域 ($beta planck omega gt.double 1$)
において解析せよ。

]
低温の漸近領域において Q 16-1
の結果は次のように近似できる。ただし、$x arrow.r 0$ のとき
$e^x approx 1 + x$, $\( 1 + x \)^(- 1) approx 1 - x$
と近似できることを用いる。

$ z \( beta \) & = frac(e^(- 1 / 2 beta planck omega), 1 - e^(- beta planck omega))\
 & approx e^(- frac(planck omega, 2 k_B T))\
 & arrow.r 0\
f & = 1 / beta ln \( 1 - e^(- beta planck omega) \) + 1 / 2 planck omega\
 & approx 1 / beta \( - e^(- beta planck omega) \) + 1 / 2 planck omega\
 & approx 1 / 2 planck omega - k_B T e^(- frac(planck omega, k_B T))\
 & arrow.r 1 / 2 planck omega\
s & = k_B (- ln \( 1 - e^(- beta planck omega) \) + frac(beta planck omega, e^(beta planck omega) - 1))\
 & approx k_B (e^(- beta planck omega) + beta planck omega e^(- beta planck omega) \( 1 + e^(- beta planck omega) \))\
 & approx k_B frac(planck omega, k_B T) e^(- frac(planck omega, k_B T))\
 & arrow.r 0\
 $
$ u & = (1 / 2 + frac(1, e^(beta planck omega) - 1)) planck omega\
 & approx (1 / 2 + e^(- beta planck omega) \( 1 + e^(- beta planck omega) \)) planck omega\
 & approx 1 / 2 planck omega + e^(- beta planck omega) planck omega\
 & arrow.r 1 / 2 planck omega\
c & = k_B (beta planck omega frac(e^(1 / 2 beta planck omega), e^(beta planck omega) - 1))^2\
 & approx k_B (beta planck omega \( e^(- 1 / 2 beta planck omega) \) \( 1 + e^(- beta planck omega) \))^2\
 & approx k_B (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T))\
 & arrow.r 0 $

#block[
Q 16-3. 高温の漸近領域 ($beta planck omega lt.double 1$)
において解析せよ。

]
高温の漸近領域において Q 16-1
の結果は次のように近似できる。ただし、$x arrow.r 0$ のとき
$ln \( 1 + x \) approx x$ と近似できることとテイラー展開を用いる。

$ z \( beta \) & = frac(e^(- 1 / 2 beta planck omega), 1 - e^(- beta planck omega))\
 & approx frac(1 - 1 / 2 beta planck omega, beta planck omega)\
 & approx frac(k_B T, planck omega) - 1 / 2\
 & arrow.r + oo\
f & = 1 / beta ln \( 1 - e^(- beta planck omega) \) + 1 / 2 planck omega\
 & approx 1 / beta (ln beta planck omega + 1 / 2 beta planck omega)\
 & approx - k_B T ln frac(k_B T, planck omega)\
 & arrow.r - oo\
s & = k_B (- ln \( 1 - e^(- beta planck omega) \) + frac(beta planck omega, e^(beta planck omega) - 1))\
 & approx k_B (- ln beta planck omega + 1)\
 & approx k_B ln frac(k_B T, planck omega)\
 & arrow.r + oo\
u & = 1 / 2 planck omega coth frac(beta planck omega, 2)\
 & approx 1 / 2 planck omega ((frac(beta planck omega, 2))^(- 1) + 1 / 3 (frac(beta planck omega, 2)) + dots.h.c)\
 & = k_B T (1 + 1 / 12 (frac(planck omega, k_B T))^2 + dots.h.c)\
 & arrow.r + oo\
 $
$ c & = k_B (frac(1 / 2 beta planck omega, sinh 1 / 2 beta planck omega))^2\
 & approx k_B (frac(beta planck omega, 2) ((frac(beta planck omega, 2))^(- 1) - 1 / 6 (frac(beta planck omega, 2)) + dots.h.c))^2\
 & = k_B (1 - 1 / 24 (frac(planck omega, k_B T)) + dots.h.c)^2\
 & = k_B (1 - 1 / 12 (frac(planck omega, k_B T)) + dots.h.c)\
 & arrow.r k_B $

これより求まった。 $square.stroked$

#block[
Q 16-4. 熱力学量のグラフを描け。

]
図 @fig:oscillator のように描ける。

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/oscillator_system.jpg", height: 8cm))
  ]],
  caption: [
    振動子系におけるそれぞれの熱力学量の温度 $T$ に関するグラフ
  ]
)
<fig:oscillator>

= 固体の比熱の Einstein 模型
<固体の比熱の-einstein-模型>
#block[
Q 16-5. 独立な調和振動子の集まりの系として記述される系 $X$
において$thin upright(d) omega$ が十分小さいとして、角振動数が $omega$
から $omega + thin upright(d) omega$ の範囲にある調和振動子の個数を
$g \( omega \) thin upright(d) omega$ と定義する。つまり $g \( omega \)$
は調和振動子の角振動数の個数分布関数である。

]
このとき角運動量が $omega$ である調和振動子 1 個の Helmholtz
自由エネルギー, エントロピー, 内部エネルギー, 比熱をそれぞれ
$f \( omega \) \, s \( omega \) \, u \( omega \) \, c \( omega \)$
と書くこととすると、$thin upright(d) omega$
が十分小さいことから近い角運動量の変数を個数倍して積分することで元の変数と一致する。これより次のような式が成り立つ。
$ F & = integral_0^oo thin upright(d) omega g \( omega \) f \( omega \)\
S & = integral_0^oo thin upright(d) omega g \( omega \) s \( omega \)\
U & = integral_0^oo thin upright(d) omega g \( omega \) u \( omega \)\
C & = integral_0^oo thin upright(d) omega g \( omega \) c \( omega \) $

#block[
Q 16-6. ある元素の原子 $n$ \[mol\] からなる個体を考える。Einstein
模型では、結晶を構成するそれぞれの原子は平衡位置の回りに独立に同一の角振動数
$omega_E$ を持って調和振動すると考える。ここで次の観測結果に対して
Einstein 模型は妥当性があることを説明せよ。

+ (高温での固体の比熱の振る舞い : Dulong-Petit の法則)
  十分に高温では、$n$ \[mol\] の固体の比熱 $C$
  は、固体を構成する物質によらずに、$3 n R$
  の一定値を取る。ここで、$R = 8.314 dots.h$ \[J/(~mol~~K~)\]
  は気体定数である。

+ (低温での固体の比熱の大雑把な振る舞い) 温度 $T$ が $0$
  に近付くとき、固体の比熱 $C$ は小さくなっていく。温度 $T$ が $0$
  に近付く極限では、比熱 $C$ はゼロになるようだ。

]
調和振動子の角振動数の個数について、各原子の自由度が $3$ であるから
Avogadro 数 $N_A = 6.02 dots.h times 10^23$ \[1/mol\]
を用いて全体の個数は $3 N = 3 n N_A$ であることが分かる。 これより
Einstein 模型における調和振動子の角振動数の個数分布関数 $g \( omega \)$
は次のように表される。
$ g \( omega \) = 3 N delta \( omega - omega_E \) . $

これより比熱は次のように表される。
$ C & = integral_0^oo thin upright(d) omega g \( omega \) c \( omega \)\
 & = integral_0^oo thin upright(d) omega 3 N delta \( omega - omega_E \) c \( omega \)\
 & = 3 N c \( omega_E \)\
 & = 3 N k_B (frac(1 / 2 beta planck omega_E, sinh 1 / 2 beta planck omega_E))^2 $
高温の漸近領域において比熱 $C$ は次のようになる。
$ C & = 3 N k_B (frac(1 / 2 beta planck omega_E, sinh 1 / 2 beta planck omega_E))^2\
 & approx 3 N k_B (1 - 1 / 12 (frac(planck omega, k_B T))^2 + dots.h.c)\
 & approx 3 n R $ 低温の漸近領域において比熱 $C$ は次のようになる。
$ C & = 3 N k_B (frac(1 / 2 beta planck omega_E, sinh 1 / 2 beta planck omega_E))^2\
 & approx 3 N k_B (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T))\
 & approx 3 n R (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T)) $
よって低温領域で温度 $T$ が小さくなっていくとき、比熱 $C$ が小さくなる。
$ lim_(T arrow.r 0) C & = lim_(T arrow.r 0) 3 n R (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T)) = 0 . $
これらの結果は観測結果と一致している為、妥当性がある。

#block[
Q 16-7. 固体の比熱の Einstein
模型は次の実験事実と合致しないことを確認せよ。

+ (低温での固体の比熱の精密な振る舞い) 温度 $T$ が $0$
  に近付くとき、固体の比熱 $C$ は $C prop T^3$
  であり、$lim_(T arrow.r 0) C = 0$ となる。

]
低温領域で温度 $T$ が小さくなっていくとき、比熱 $C$
は次のように小さくなる。
$ C & approx 3 n R (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T))\
 & prop frac(1, T^2 e^(1 / T)) $ これより $C prop T^3$
とはならない為、固体の比熱の Einstein 模型は実験事実と合致しない。
