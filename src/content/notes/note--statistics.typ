#import "/src/typst/template.typ": post

#show: post.with(
  title: "統計力学",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/statistics.tex から変換",
)

= 統計力学の基礎
<統計力学の基礎>
エルゴード理論により次の原理が成り立つこととする。

#block[
孤立系を十分に長時間放置しておくと物体の実現可能な量子状態はエネルギーのゆらぎを除いてすべて等確率で実現する。

]
2 つの系 $A \, B$ があるとする。系 $A$ のエネルギー $E_A$ と系 $B$
のエネルギー $E_B$ の和が一定で $A \, B$
の間にエネルギーのやり取りができるとする。 $ E_A + E_B = c o n s t . $

例えると子どもたちが 12 人居て $A$ と $B$ のグループにそれぞれ 4 人、8
人で分ける。そして 6 個あるリンゴを 1
人複数個もらっても良いとして等確率に配ったとき、それぞれのグループに配られるリンゴで最も確率の高いものは何か。

<table:micro>

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,left,),
    table.header([A], [B], [組合せ],),
    table.hline(),
    [0 個], [6
    個], [$zws_4 H_0 times zws_8 H_6 = zws_3 C_0 times zws_13 C_6 = 1716$],
    [1 個], [5
    個], [$zws_4 H_1 times zws_8 H_5 = zws_4 C_1 times zws_12 C_5 = 3168$],
    [2 個], [4
    個], [$zws_4 H_2 times zws_8 H_4 = zws_5 C_2 times zws_11 C_4 = 3300$],
    [3 個], [3
    個], [$zws_4 H_3 times zws_8 H_3 = zws_6 C_3 times zws_10 C_3 = 2406$],
    [4 個], [2
    個], [$zws_4 H_4 times zws_8 H_2 = zws_7 C_4 times zws_9 C_2 = 1260$],
    [5 個], [1
    個], [$zws_4 H_5 times zws_8 H_1 = zws_8 C_5 times zws_8 C_1 = 448$],
    [6 個], [0
    個], [$zws_4 H_6 times zws_8 H_0 = zws_9 C_6 times zws_7 C_0 = 84$],
  )]
  , caption: [組合せ]
  , kind: table
  )

] 
より $A$, $B$ のグループにそれぞれ 2 個、4 個で分ける確率が最も高い。
この分布を二項分布という。

#block[
二項分布の極限が正規分布である。

]


#block[
あるエネルギー $E$ のときに実現可能な量子状態数を $W \( E \)$
とおく。また状態の対数を取ったものをエントロピー $S \( E \)$ とする。
$ S \( E \) & = k_B log W \( E \)\
k_B & = 1.380658 times 10^(- 23) J \/ K $ ただし $k_B$ をボルツマン定数
(Boltzmann constant) という。ある系 $X$ のエネルギーを $E_X$、状態数を
$W_X \( E_X \)$、エントロピーを $S_X \( E_X \)$ と書くことにする。

]
状態数で計算すると指数が出がちなのでエントロピーで計算すると簡単になる。

#block[
#strong[定理 1] (). \

$N$ 次元の調和振動子で $E = M planck omega$
とおくと状態数とエントロピーは次のように書ける。
$ W \( E \) & = M + N - 1\
N - 1\
S \( E \) & approx k_B N ((1 + M / N) log \( 1 + M / N \) - M / N log M / N) $

]
$N$ 次元の調和振動子系では $\( n_1 \, dots.h \, n_N \)$
が全体の量子状態を決める量子数となる。このときのエネルギーは次のように表される。
$ E_(\( n_1 \, dots.h \, n_N \)) & = n_1 planck omega + dots.h.c + n_N planck omega $
等しいエネルギーの状態の条件は $M = n_1 + dots.h.c + n_N$
と書ける。これより状態数の組合せは次のように書ける。
$ W \( E \) & = M + N - 1\
N - 1 = frac(\( M + N - 1 \) !, \( N - 1 \) ! M !) $ またエントロピーは
Stirling の公式 $log n ! approx n \( log n - 1 \)$ を用いて
$ S \( E \) & = k_B log W \( E \)\
 & = k_B log frac(\( M + N - 1 \) !, \( N - 1 \) ! M !)\
 & approx k_B (\( N + M \) \( log \( N + M \) - 1 \) - N \( log N - 1 \) - M \( log M - 1 \))\
 & = k_B N ((1 + M / N) log (1 + M / N) - M / N log M / N) $ 

#block[
#strong[定理 2] (). \

熱平衡の条件は系 $A$ の温度 $T_A$ と系 $B$ の温度 $T_B$ が一致すること。

]
各系の状態数の積が全体系の状態数となるので各系と全体系のエントロピーの関係は
$ S \( E_A \, E_B \) & = k_B log W \( E_A \, E_B \)\
 & = k_B log W_A \( E_A \) W_B \( E_B \)\
 & = k_B log W_A \( E_A \) + k_B log W_B \( E_B \)\
 & = S_A \( E_A \) + S_B \( E_B \) $
となる。このとき熱平衡状態とはエントロピーが最大の状態であるから
\$\\diff\*{S}{E\_A} = 0\$ となるエネルギー $E_A \, E_B$ を考えると
$ frac(upright(d) S \( E_A \, E_B \), upright(d) E_A) & = frac(upright(d) S_A \( E_A \), upright(d) E_A) + frac(upright(d) S_A \( E_B \), upright(d) E_A) = frac(upright(d) S_A \( E_A \), upright(d) E_A) - frac(upright(d) S_A \( E_B \), upright(d) E_B) = 0\
arrow.l.r.double frac(upright(d) S_A \( E_A \), upright(d) E_A) & = frac(upright(d) S_A \( E_B \), upright(d) E_B) $
よりエントロピーのエネルギー微分を温度の逆数 $1 \/ T$
と定義すると温度が一致するときに熱平衡状態となる。 

#block[
絶対温度 (absolute temperature) $T$ を次のように定義する。
$ 1 / T & := frac(upright(d) S, upright(d) E) $

]
この温度の定義は理想気体で正当化される。

#block[
#strong[定理 3] (理想気体). \

理想気体、つまり 3 次元箱型ポテンシャル中の独立な区別できない $N$
個の粒子について
$ S & = N k_B (3 / 2 ln E / V + 5 / 2 ln V / N + ln alpha + cal(O) \( N^(- 1) ln N \)) & (alpha = (frac(m e, 3 pi planck^2))^(3 / 2))\
E & = 3 / 2 N k_B T $

]
部分系の固有状態と固有エネルギーが分かれば全体系のも分かる。
$ E_(\( n_(i \, a) \)_(i = 1 \, dots.h \, N \, a = x \, y \, z)) & = E_0 sum_(i = 1)^N sum_(a = x \, y \, z) n_(i \, a)^2\
psi_(\( n_(i \, a) \)_(i = 1 \, dots.h \, N \, a = x \, y \, z)) & = (2 / L)^(3 N \/ 2) product_(i = 1)^N product_(a = x \, y \, z) sin \( frac(n_(i \, a) pi, L) x_(i \, a) \) $
これよりあるエネルギー $E > 0$ 以下である区別できる固有状態数
$Omega \( E \)$ について
$ Omega \( E \) & = ("半径" sqrt(E / E_0) の 3 N "次元超球の第一象限に含まれる格子点の個数")\
 & approx 1 / 2^(3 N) sqrt(E / E_0)^(3 N) frac(pi^(3 N \/ 2), \( 3 N \/ 2 \) !)\
 & = frac(1, \( 3 N \/ 2 \) !) pi^(3 N \/ 2) / 2^(3 N) (frac(2 m L^2, pi^2 planck^2))^(3 N \/ 2) E^(3 N \/ 2)\
 & = frac(1, \( 3 N \/ 2 \) !) (frac(m, 2 pi planck^2))^(3 N \/ 2) E^(3 N \/ 2) V^N\
 & = frac(1, sqrt(3 pi N) \( 3 N \/ 2 \)^(3 N \/ 2) e^(- 3 N \/ 2)) (frac(m, 2 pi planck^2))^(3 N \/ 2) E^(3 N \/ 2) V^N\
 & = 1 / sqrt(3 pi N) N^N (frac(m e, 3 pi planck^2))^(3 N \/ 2) (E / V)^(3 N \/ 2) (V / N)^(5 N \/ 2)\
 $ これを区別しないから
$ Omega^("区別できない") \( E \) & = frac(1, N !) Omega \( E \)\
 & = frac(1, N !) 1 / sqrt(3 pi N) N^N (frac(m e, 3 pi planck^2))^(3 N \/ 2) (E / V)^(3 N \/ 2) (V / N)^(5 N \/ 2)\
 & = frac(1, sqrt(2 pi N) N^N e^(- N)) 1 / sqrt(3 pi N) N^N (frac(m e, 3 pi planck^2))^(3 N \/ 2) (E / V)^(3 N \/ 2) (V / N)^(5 N \/ 2)\
 & = frac(e^N, sqrt(6) pi N) (frac(m e, 3 pi planck^2))^(3 N \/ 2) (E / V)^(3 N \/ 2) (V / N)^(5 N \/ 2) $
これよりエントロピーは
$ S \( E \) & = k_B ln Omega^("区別できない") \( E \)\
 & = N k_B (3 / 2 ln E / V + 5 / 2 ln V / N + 3 / 2 ln \( frac(m e, 3 pi planck^2) \) - 1 / N ln \( sqrt(6) pi N \) + 1) $
よって温度を計算すると式が示せる。
$ 1 / T = frac(upright(d) S, upright(d) E) & = 3 / 2 N k_B 1 / E\
E & = 3 / 2 N k_B T $ 

= ミクロカノニカル分布
<ミクロカノニカル分布>
== ミクロカノニカルアンサンブル
<ミクロカノニカルアンサンブル>
#block[
孤立した物理系 $X$ において、外部から指定されたある狭いエネルギー範囲
$\[ U - Delta U \, U \]$ に固有エネルギー $E_i$
が属するような微視的なエネルギー固有状態 $\|phi.alt_i⟩$
のひとつひとつが実現される等しい確からしさを持っている。

]
エネルギーの低い順にエネルギーシェル $E$ から $E + Delta E$
までの中の状態を 1 つのグループでまとめてラベル付けする。
$ N = sum_l N_l \, #h(2em) E = sum_l E_l N_l \, #h(2em) W = product_l frac(M_l^(N_l), N_l !) \, #h(2em) S = k_B sum_l N_l (log M_l / N_l + 1) $

$ tilde(S) & = k_B sum_l N_l (log M_l / N_l + 1) - k_B alpha sum_l N_l - k_B beta sum_l E_l N_l\
frac(partial tilde(S), partial N_l) & = 0 arrow.l.r.double M_l / N_l = e^(alpha + beta E_l) $

$ N & = sum_l M_l e^(- alpha - beta E_l)\
E & = sum_l M_l E_l e^(- alpha - beta E_l)\
S & = k_B (\( 1 + alpha \) N + beta E) $ エネルギーで微分すると
$ 0 & = sum_l M_l (frac(upright(d) alpha, upright(d) E) + frac(upright(d) beta, upright(d) E) E_l) e^(- alpha - beta E_l) = frac(upright(d) alpha, upright(d) E) N + frac(upright(d) beta, upright(d) E) E\
frac(upright(d) S, upright(d) E) & = k_B (frac(upright(d) alpha, upright(d) E) N + frac(upright(d) beta, upright(d) E) E + beta) = k_B beta $
より $alpha \, beta$ は次のように表される。 $ beta & = frac(1, k_B T)\
e^(- alpha) & = frac(N, sum_i e^(- epsilon_i \/ k_B T)) $

== 熱と仕事
<熱と仕事>
#block[
内部エネルギー $E \( S \, V \)$ とその束縛変数を変更させたエンタルピー
$H \( S \, p \)$ と Helmholtz 自由エネルギー $F \( T \, V \)$ と Gibbs
自由エネルギー $G \( T \, p \)$ を次のように定義する。
$  & #h(2em) upright(d) E = T upright(d) S - p upright(d) V\
H = E + p V & #h(2em) upright(d) H = T upright(d) S + V upright(d) p\
F = E - T S & #h(2em) upright(d) F = - S upright(d) T - p upright(d) V\
G = F + p V & #h(2em) upright(d) G = - S upright(d) T + V upright(d) p $

]
特に扱いやすい変数 $T$, $V$ を持つ Helmholtz 自由エネルギー
$F \( T \, V \)$ は重宝される。

#block[
#strong[定理 4] (). \

定義より次の関係式を満たす。
$ 3 T & = (frac(partial E, partial S))_V & #h(2em) - p & = (frac(partial E, partial V))_S\
T & = (frac(partial H, partial S))_p & #h(2em) V & = (frac(partial H, partial p))_S\
- S & = (frac(partial F, partial T))_V & #h(2em) - p & = (frac(partial F, partial V))_T\
- S & = (frac(partial G, partial T))_p & #h(2em) V & = (frac(partial G, partial p))_T $

]
#block[
#strong[定理 5] (Maxwell の関係式). \

$C^2$ 級の関数において偏微分は交換できるから次の関係式を満たす。
$ frac(partial U, partial S \, V) = (frac(partial T, partial V))_S & = - (frac(partial p, partial S))_V\
frac(partial H, partial S \, p) = (frac(partial T, partial p))_S & = (frac(partial V, partial S))_p\
frac(partial F, partial T \, V) = - (frac(partial S, partial V))_T & = - (frac(partial p, partial T))_V\
frac(partial G, partial T \, p) = - (frac(partial S, partial p))_T & = (frac(partial V, partial T))_p $

]
#block[
#strong[定理 6] (理想気体の状態方程式). \

$ p V & = N k_B T $

]
$ S \( E \, V \) & = N k_B (3 / 2 ln E / V + 5 / 2 ln V / N + 3 / 2 ln \( frac(m e, 3 pi planck^2) \) - 1 / N ln \( sqrt(6) pi N \) + 1)\
0 & = N k_B (3 / 2 1 / E (frac(partial E, partial V))_S + 1 / V)\
p & = - (frac(partial E, partial V))_S = 2 / 3 E / V = frac(N k_B T, V)\
p V & = N k_B T $

$ C_V = 3 / 2 R $

#block[
$ C & = T frac(upright(d) S, upright(d) T)\
C_X & = (T frac(partial S, partial T))_X $

]
これ以降の話は熱力学の方で書きたい。

= カノニカル分布
<カノニカル分布>
ある温度の環境の中で理想気体や

== ミクロカノニカル分布からカノニカル分布へ
<ミクロカノニカル分布からカノニカル分布へ>
Helmholtz
自由エネルギーを計算して、後は熱力学の公式を用いて計算しましたが、

#block[
$ p_i & = frac(e^(- beta E_i), sum_i e^(- beta E_i)) #h(2em) (beta = frac(1, k_B T)) $

]
#block[
#strong[定理 7] (). \

$ Z & = sum_i e^(- beta E_i)\
F & = - k_B T ln Z\
S & = - frac(partial F, partial T) = k_B beta^2 frac(partial F, partial beta) = k_B ln Z - k_B beta 1 / Z frac(partial Z, partial beta)\
U & = - T^2 frac(partial, partial T) (F / T) = - frac(partial, partial beta) ln Z \( beta \) = frac(partial, partial beta) \( beta F \)\
C & = frac(partial U, partial T) = - k_B beta^2 frac(partial U, partial beta) = - beta frac(partial S, partial beta) = k_B beta^2 frac(partial^2, partial beta^2) ln Z \( beta \) $

]
#block[
#strong[定理 8] (). \

$N$ 個の独立な部分系からなる全体系の熱力学量は次のようになる。
$ Z \( beta \) = z \( beta \)^N \, #h(2em) F = N f \, #h(2em) S = N s \, #h(2em) U = N u \, #h(2em) C = c $

]
== 二準位系
<二準位系>
絶対温度 $T$ の熱浴に系 $X$ が浸けられている状態として、系 $X$ の
Hamilton 演算子 $hat(h)_X$ の固有状態は $\|phi_1⟩$ と $\|phi_2⟩$ の 2
つだけであり、$\|phi_1⟩$ の固有エネルギーは $E_1$ であり、$\|phi_2⟩$
の固有エネルギーは $E_2$ であるとする
$ hat(h)_X \|phi_i⟩ & = E_i \|phi_i⟩ #h(2em) \( i = 1 \, 2 \) 。 $
ただし $0 < E_1 < E_2$ $beta = 1 \/ k_B T$ とする。

#block[
低温・高温極限における近似は次のようなものが挙げられる。$x arrow.r 0$
低温の漸近領域 ($beta \( E_2 - E_1 \) gt.double 1$,
$beta E_1 gt.double 1$) と高温の漸近領域
($beta \( E_2 - E_1 \) lt.double 1$, $beta E_1 lt.double 1$)
$ frac(1, 1 + x) & approx 1 - x\
ln \( 1 + x \) & approx x\
e^x & approx 1 + x $

]
#block[
#strong[定理 9] (). \

二準位系における熱力学的量は次のようなグラフとなる。

]
$ Z & = e^(- beta E_1) + e^(- beta E_2) = cases(delim: "{", e^(- beta E_1) \( 1 + e^(- beta \( E_2 - E_1 \)) \) approx e^(- beta E_1) arrow.r 0 & \( "低温" \), e^(- 1 / 2 beta \( E_1 + E_2 \)) \( e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \)) \) arrow.r 2 & \( "高温" \))\
ln Z & = ln \( e^(- beta E_1) + e^(- beta E_2) \) approx cases(delim: "{", - beta E_1 + e^(- beta \( E_2 - E_1 \)) & \( "低温" \), ln 2 - 1 / 2 beta \( E_1 + E_2 \) & \( "高温" \))\
F & = - k_B T ln Z approx {E_1 - 1 / beta e^(- beta \( E_2 - E_1 \)) arrow.r E_1\
1 / 2 \( E_1 + E_2 \) - k_B T ln 2 arrow.r - oo\
\
S & = k_B ln \( e^(- beta E_1) + e^(- beta E_2) \) + k_B beta frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2))\
U & = F + T S = frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2)) $
$ U & = frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2))\
 & = {frac(E_1 + E_2 e^(- beta \( E_2 - E_1 \)), 1 + e^(- beta \( E_2 - E_1 \)))\
frac(E_1 e^(1 / 2 beta \( E_2 - E_1 \)) + E_2 e^(- 1 / 2 beta \( E_2 - E_1 \)), e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \)))\
 & = {(E_1 + E_2 e^(- beta \( E_2 - E_1 \))) (1 - e^(- beta \( E_2 - E_1 \)))\
1 / 2 (E_1 (1 + 1 / 2 beta \( E_2 - E_1 \)) + E_2 (1 - 1 / 2 beta \( E_2 - E_1 \)))\
 & approx {E_1 + \( E_2 - E_1 \) e^(- frac(E_2 - E_1, k_B T)) arrow.r E_1\
1 / 2 \( E_1 + E_2 \) - 1 / 4 frac(\( E_2 - E_1 \)^2, k_B T) arrow.r 1 / 2 \( E_1 + E_2 \)\
 $
$ S & approx {k_B (- beta E_1 + e^(- beta \( E_2 - E_1 \))) + k_B beta (E_1 + \( E_2 - E_1 \) e^(- frac(E_2 - E_1, k_B T)))\
k_B (ln 2 - 1 / 2 \( E_1 + E_2 \)) + k_B beta (1 / 2 \( E_1 + E_2 \) - 1 / 4 frac(\( E_2 - E_1 \)^2, k_B T))\
\
 & = cases(delim: "{", k_B frac(E_2 - E_1, k_B T) e^(- frac(E_2 - E_1, k_B T)) arrow.r 0 & \( "低温" \), k_B (ln 2 - 1 / 4 (frac(E_2 - E_1, k_B T))^2) arrow.r k_B ln 2 & \( "高温" \)) $
$ C & = - k_B beta^2 frac(partial U, partial beta) = - k_B beta^2 frac(partial, partial beta) (frac(E_1 + E_2 e^(beta \( E_1 - E_2 \)), 1 + e^(beta \( E_1 - E_2 \))))\
 & = k_B frac(beta^2 \( E_2 - E_1 \)^2 e^(beta \( E_1 - E_2 \)), \( 1 + e^(beta \( E_1 - E_2 \)) \)^2)\
 & = k_B (frac(1 / 2 beta \( E_2 - E_1 \), cosh 1 / 2 beta \( E_2 - E_1 \)))^2\
 & = {k_B (frac(beta \( E_2 - E_1 \), 1 + e^(- beta \( E_2 - E_1 \))))^2 e^(- beta \( E_2 - E_1 \))\
k_B (frac(beta \( E_2 - E_1 \), e^(1 / 2 beta \( E_2 - E_1 \)) + e^(- 1 / 2 beta \( E_2 - E_1 \))))^2\
 & approx {k_B (frac(E_2 - E_1, k_B T))^2 e^(- frac(E_2 - E_1, k_B T)) arrow.r 0\
k_B / 4 (frac(E_2 - E_1, k_B T))^2 arrow.r 0 $
各固有状態の実現確率について高温極限
($beta \( E_2 - E_1 \) lt.double 1$)
のときそれぞれの固有状態は同じ確率で実現し、低温極限
($beta \( E_2 - E_1 \) gt.double 1$)
のとき固有エネルギーの低い固有状態にほぼ確実に実現する。
$ quad p_beta \( i \) & = frac(e^(- beta \( E_i - E_1 \)), 1 + e^(- beta \( E_2 - E_1 \))) approx cases(delim: "{", e^(- beta \( E_i - E_1 \)) & \( beta \( E_2 - E_1 \) gt.double 1 \), 1 / 2 & \( beta \( E_2 - E_1 \) lt.double 1 \)) $
$F = E - T S$
の最小化を考える。低温極限でエントロピーを上げるよりエネルギーが低いものを選んだ方がエネルギーが得となる為に固有エネルギーの低い状態に集まる。高温極限でエントロピーを増大させるとエネルギーが得となる為に半々となる。


今回は正準集団の理論における固有状態の実現確率を与える確率関数
$p_beta \( i \) med \( i = 1 \, 2 \)$ を計算して、内部エネルギー $u$
とエントロピー $s$ を求める。 まず確率関数 $p_beta \( i \)$
は定義より次のようになる。
$ p_beta \( i \) & = frac(e^(- beta E_i), z \( beta \)) $ 内部エネルギー
$u$ はエネルギーの平均を取ることで分かる。
$ u & = sum_i E_i p_beta \( i \) = frac(E_1 e^(- beta E_1) + E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2)) $
エントロピー $s$ は Shannon のエントロピーの公式に代入することで求まる。
$ s & = - k_B sum_(i = 1 \, 2) p_beta \( i \) ln p_beta \( i \)\
 & = - k_B sum_(i = 1 \, 2) frac(e^(- beta E_i), z \( beta \)) \( - ln z \( beta \) - beta E_i \)\
 & = k_B (ln \( e^(- beta E_1) + e^(- beta E_2) \) + frac(beta E_1 e^(- beta E_1) + beta E_2 e^(- beta E_2), e^(- beta E_1) + e^(- beta E_2))) $
まず比熱について次のように定義した関数 $phi.alt \( x \)$
を用いて表される。 $ phi.alt \( x \) & := frac(x, cosh x)\
c & = k_B (frac(1 / 2 beta \( E_2 - E_1 \), cosh 1 / 2 beta \( E_2 - E_1 \)))^2\
 & = k_B (phi.alt (1 / 2 beta \( E_2 - E_1 \)))^2 $ ここで $x gt.eq 0$
の範囲において $phi.alt \( x \)$ が極大となる $x = x_0$ の値を考える。
$  & frac(upright(d) phi.alt, upright(d) x) \[ x = x_0 \] = 0\
arrow.l.r.double & frac(cosh x_0 - x_0 sinh x_0, cosh^2 x_0) = 0\
arrow.l.r.double & x_0 tanh x_0 = 1\
arrow.l.r.double & x_0 = 1.199678640257734 dots.h $

ただしプログラム #link(<newton>)[newton] を用いて $x gt.eq 0$ の範囲で
$x_0 tanh x_0 = 1$ は $x_0 = 1.199678640257734 dots.h$
のとき満たすことが分かる。これより比熱 $c$ は次のように定義される $T_0$
のときに極大を取る。
$  & x_0 = 1 / 2 beta_0 \( E_2 - E_1 \) = 1 / 2 frac(E_2 - E_1, k_B T_0)\
 & frac(k_B T_0, E_2 - E_1) = frac(1, 2 x_0) = 0.41677827980048 dots.h $

低温、高温で比熱が 0 となる理由は比熱が
$C = frac(upright(d) E, upright(d) T)$ であることより Q15-3, Q15-4
よりエネルギーの確率が極限的に定数となることから比熱は 0
となることが分かる。

== 調和振動子系の統計力学
<調和振動子系の統計力学>
固体における原子の熱振動について考える。各原子が格子点への復元力により独立に単振動しているものと近似するとき，系のハミルトニアンは以下のように書くことができる。
$ H = sum_(i = 1)^N [frac(1, 2 m) p_i^2 + 1 / 2 m omega^2 x_i^2] $
ここで, $i$ 番目の原子の格子点からの変位を $x_i$ とし, $p_i$
はそれに共役な運動量である。また, $m$ は原子の質量, $omega$ は角振動数,
$N$ は原子数である。温度を $T$, ボルツマン定数を $k_B$
として以下の問に答えよ。 \
(1) 原子の運動が量子力学的な場合, この系の分配関数を求めよ。ここで,
以下のハミルトニアンで与えられる質量 $m$, 角振動数 $omega$ の 1
次元調和振動子 $ H = frac(p^2, 2 m) + 1 / 2 m omega^2 x^2 $
のエネルギー準位が
$ E_n = (n + 1 / 2) planck omega #h(2em) \( n = 0 \, 1 \, 2 \, dots.h \) $
で表されることを用いてもよい。 \
低温$beta planck omega gt.double 1$

#block[
#strong[定理 10] (). \

調和振動子系のグラフ

]
$ z & = sum_(i = 0)^oo e^(- beta E_i) = sum_(i = 0)^oo e^(- beta (n + 1 / 2) planck omega) = frac(e^(- 1 / 2 beta planck omega), 1 - e^(- beta planck omega)) = frac(1, 2 sinh 1 / 2 beta planck omega)\
f & = 1 / beta ln (2 sinh 1 / 2 beta planck omega) = 1 / 2 planck omega + 1 / beta ln \( 1 - e^(- beta planck omega) \)\
u & = - 1 / z frac(partial z, partial beta) = (1 / 2 + frac(1, e^(beta planck omega) - 1)) planck omega = 1 / 2 planck omega coth 1 / 2 beta planck omega\
s & = - k_B ln (2 sinh 1 / 2 beta planck omega) + k_B beta 1 / 2 planck omega coth 1 / 2 beta planck omega\
 & = - k_B ln (1 - e^(- beta planck omega)) + k_B beta frac(planck omega, e^(beta planck omega) - 1)\
c & = frac(partial u, partial T) = - k_B beta^2 frac(partial u, partial beta) = k_B (beta planck omega frac(e^(1 / 2 beta planck omega), e^(beta planck omega) - 1))^2 = k_B (frac(1 / 2 beta planck omega, sinh 1 / 2 beta planck omega))^2 $
$ sinh x & = x + frac(x^3, 3 !) + frac(x^5, 5 !) + dots.h.c\
coth x & = 1 / x + x / 3 - x^3 / 45 + dots.h.c\
frac(1, sinh x) & = 1 / x - x / 6 + frac(7 x^3, 360) - dots.h.c $
$ s & approx {k_B (e^(- beta planck omega) + beta planck omega e^(- beta planck omega) \( 1 + e^(- beta planck omega) \))\
k_B (- ln beta planck omega + 1)\
\
 & approx {k_B frac(planck omega, k_B T) e^(- frac(planck omega, k_B T)) arrow.r 0\
k_B ln frac(k_B T, planck omega) arrow.r + oo\
\
u & approx {(1 / 2 + e^(- beta planck omega) \( 1 + e^(- beta planck omega) \)) planck omega\
1 / 2 planck omega ((frac(beta planck omega, 2))^(- 1) + 1 / 3 (frac(beta planck omega, 2)) + dots.h.c)\
\
 & approx {1 / 2 planck omega + e^(- beta planck omega) planck omega arrow.r 1 / 2 planck omega\
k_B T (1 + 1 / 12 (frac(planck omega, k_B T))^2 + dots.h.c) arrow.r + oo\
\
c & approx {k_B (beta planck omega \( e^(- 1 / 2 beta planck omega) \) \( 1 + e^(- beta planck omega) \))^2\
k_B (frac(beta planck omega, 2) ((frac(beta planck omega, 2))^(- 1) - 1 / 6 (frac(beta planck omega, 2)) + dots.h.c))^2\
\
 & approx {k_B (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T)) arrow.r 0\
k_B (1 - 1 / 24 (frac(planck omega, k_B T)) + dots.h.c)^2 = k_B (1 - 1 / 12 (frac(planck omega, k_B T)) + dots.h.c) arrow.r k_B $


== 固体の比熱の Einstein 模型
<固体の比熱の-einstein-模型>
ある元素の原子 $n$ \[mol\] からなる個体を考える。Einstein
模型では、結晶を構成するそれぞれの原子は平衡位置の回りに独立に同一の角振動数
$omega_E$ を持って調和振動すると考える。
$ hat(H) & = sum_(j = 1)^N (frac(hat(p)_j^2, 2 m) + 1 / 2 m omega_E^2 hat(x)_j^2) $

独立な調和振動子の集まりの系として記述される系 $X$ において角振動数が
$omega$ から $omega + upright(d) omega$ の範囲にある調和振動子の個数を
$g \( omega \) upright(d) omega$ と定義する。つまり $g \( omega \)$
は調和振動子の角振動数に対する個数分布関数である。

調和振動子の角振動数の個数について、各原子の自由度が $3$ であるから
Avogadro 数 $N_A = 6.02 dots.h times 10^23$ \[1/mol\]
を用いて全体の個数は $3 N = 3 n N_A$ であることが分かる。 これより
Einstein 模型における調和振動子の角振動数の個数分布関数 $g \( omega \)$
は次のように表される。
$ g \( omega \) = 3 N delta \( omega - omega_E \) $ このとき角運動量が
$omega$ である調和振動子 1 個の Helmholtz 自由エネルギー, エントロピー,
内部エネルギー, 比熱をそれぞれ
$f \( omega \) \, s \( omega \) \, u \( omega \) \, c \( omega \)$
と書くこととすると Einstein 模型は次のように書ける
$ F & = integral_0^oo upright(d) omega g \( omega \) f \( omega \) = 3 N 1 / beta ln (2 sinh 1 / 2 beta planck omega_E)\
S & = integral_0^oo upright(d) omega g \( omega \) s \( omega \) = 3 N k_B (- ln (2 sinh 1 / 2 beta planck omega_E) + 1 / 2 beta planck omega_E coth 1 / 2 beta planck omega_E)\
U & = integral_0^oo upright(d) omega g \( omega \) u \( omega \) = 3 N 1 / 2 planck omega_E coth 1 / 2 beta planck omega_E\
C & = integral_0^oo upright(d) omega g \( omega \) c \( omega \) = 3 N k_B (frac(1 / 2 beta planck omega_E, sinh 1 / 2 beta planck omega_E))^2 $

#block[
実験事実

+ (高温での固体の比熱の振る舞い : Dulong-Petit の法則)
  十分に高温では、$n$ \[mol\] の固体の比熱 $C$
  は、固体を構成する物質によらずに、$3 n R$
  の一定値を取る。ここで、$R = 8.314 dots.h$ \[J/(~mol~~K~)\]
  は気体定数である。

+ (低温での固体の比熱の大雑把な振る舞い) 温度 $T$ が $0$
  に近付くとき、固体の比熱 $C$ は小さくなっていく。温度 $T$ が $0$
  に近付く極限では、比熱 $C$ はゼロになるようだ。

+ (低温での固体の比熱の精密な振る舞い) 温度 $T$ が $0$
  に近付くとき、固体の比熱 $C$ は $C prop T^3$
  であり、$lim_(T arrow.r 0) C = 0$ となる。

]
高温の漸近領域において比熱 $C$ は次のようになる。
$ C & = 3 N k_B (frac(1 / 2 beta planck omega_E, sinh 1 / 2 beta planck omega_E))^2\
 & approx 3 N k_B (1 - 1 / 12 (frac(planck omega, k_B T))^2 + dots.h.c)\
 & arrow.r 3 n R $ 低温の漸近領域において比熱 $C$ は次のようになる。
$ C & = 3 N k_B (frac(1 / 2 beta planck omega_E, sinh 1 / 2 beta planck omega_E))^2\
 & approx 3 N k_B (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T))\
 & approx 3 n R (frac(planck omega, k_B T))^2 e^(- frac(planck omega, k_B T))\
 & prop frac(1, T^2 e^(1 / T)) arrow.r 0 $ これより $C prop T^3$
とはならない為、固体の比熱の Einstein 模型は実験事実と合致しない。

== 固体の比熱の Debye 模型
<固体の比熱の-debye-模型>
ここでは固体の比熱 $C$ の Debye 模型を学ぶ. Debye 模型は高温における
$C approx 3 n R$ と低温における $C prop T^3$ の両方を正しく説明する.

3 次元結晶を $N^3$
個の原子があり、固体を構成する各原子は隣り合った原子間力によるバネ定数
$kappa$ のバネにより結びついているとする。
$ hat(H) & = frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 $
このとき Fourier 展開して解析力学の結果により $3 N^3$
個の調和振動子の系と同等となる。
$ hat(H) & = sum_(j = 1)^N (frac(1, 2 m) P_j^2 + 1 / 2 m omega_j^2 Q_j^2)\
omega_(bold(k)) & = 2 sqrt(kappa / m) sqrt(sin^2 1 / 2 k_x a + sin^2 1 / 2 k_y a + sin^2 1 / 2 k_z a)\
bold(k) & = frac(pi, a \( N + 1 \)) \( j_x \, j_y \, j_z \) $ ただし 1
辺の長さ $L$ の立方体の固定端境界条件を持つとする。
フォノンの各振動数がデカすぎると奇妙な波となるので制約を設ける。
$ sqrt(m / kappa) frac(N + 1, pi) omega lt.eq N $

分散関係がこのままだと解析的に解けない。この困難を打開する為に分散関係を修正して解析計算ができる要請と高温極限と低温極限において
Einstein 模型と同じ結果を導くという要請をした。これを Debye 模型という。

+ 十分に高温において前節の模型と新しい模型が同じ比熱の極限値を持つには独立な調和振動子の総数について一致することが必要十分である.
  十分に高温ではエントロピーが高くなる為,
  すべての独立な調和振動子のエネルギー状態について実現確率は等分配される.
  このとき比熱は独立な調和振動子の総数のみに依存するから前節の模型と等しい総数となることが必要十分である.

+ 十分に低温において前節の模型と新しい模型が同じ比熱の漸近的な振る舞いを示すためには分散関係の関数
  $omega \( bold(k) \)$ が長波長の漸近領域 $a \| bold(k) \| lt.double 1$
  において一致することが十分である.
  十分に低温ではエントロピーが低くなり, エネルギーが低い状態,
  つまり長波長に関する状態に実現確率が集まるので,
  前節の模型と新しい模型について長波長の漸近領域において分散関係が一致するなら同じ比熱の漸近的な振る舞いとなることが言える.

$ omega_(bold(k)) & approx sqrt(kappa / m) a \| bold(k) \| + cal(O) \( \| bold(k) \|^3 \) #h(2em) \( a \| bold(k) \| lt.double 1 \)\
omega_(bold(k)) & = sqrt(kappa / m) a \| bold(k) \| = sqrt(kappa / m) frac(pi, N + 1) sqrt(j_x^2 + j_y^2 + j_z^2) $
また打ち切る角振動数 $omega_D$ を次のように定める.
$ integral_0^oo upright(d) omega g \( omega \) & = integral_0^(omega_D) upright(d) omega g \( omega \) = 3 N^3 . $
この $omega_D$ を Debye の角振動数という.

#block[
#strong[定理 11] (). \

独立な調和振動子の角振動数に関する個数分布関数 $g \( omega \)$
について幾何学的解釈で近似できる.
$ g \( omega \) & = cases(delim: "{", frac(9 N^3, omega_D) (omega / omega_D)^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \)) . $

]
$ g \( omega \) & approx 3 sqrt(m / kappa) frac(N + 1, pi) times ("半径" sqrt(m / kappa) frac(N + 1, pi) omega の 2 "次元球面" S_2 "を第" 1 "象限で切り取った曲面の表面積")\
 & = 3 sqrt(m / kappa) frac(N + 1, pi) times frac(4 pi, 8) (sqrt(m / kappa) frac(N + 1, pi) omega)^2\
 & = frac(3 pi, 2) (sqrt(m / kappa) frac(N + 1, pi))^3 omega^2 . $
正方形から球へ近似 ただし $N gt.double 1$ であることから $N + 1$ を $N$
と近似し,
$ integral_0^oo upright(d) omega g \( omega \) & = integral_0^(omega_D) upright(d) omega frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 = pi / 2 (sqrt(m / kappa) N / pi)^3 omega_D^3 = 3 N^3\
omega_D & = \( 6 pi^2 \)^(1 \/ 3) sqrt(kappa / m) $
$ g \( omega \) & = cases(delim: "{", frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \))\
 & = cases(delim: "{", frac(9 N^3, omega_D) (omega / omega_D)^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \)) . $
 現実の物質に Debye 模型を当てはめるときには, それぞれの物質は固有の
Debye 角振動数 $omega_D$ を持つことになる.

#block[
#strong[定理 12] (). \

Debye 模型における内部エネルギーの表式は次のようになる.
$ U & = U_0 + 9 N^3 planck omega_D I \( beta planck omega_D \) #h(2em) (U_0 = 3 / 8 \( 3 N^3 \) planck omega_D)\
C & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b) $
ただし $I \( b \)$ について次のように定められる.
$ I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1) . $

]
以下からは
$b = beta planck omega_D = planck omega_D \/ \( k_B T \)$
という関係を用いる。
$ U & = integral_0^oo upright(d) omega g \( omega \) u \( omega \)\
 & = integral_0^(omega_D) upright(d) omega frac(9 N^3, omega_D) (omega / omega_D)^2 (1 / 2 + frac(1, e^(beta planck omega) - 1)) planck omega\
 & = 9 N^3 planck integral_0^(omega_D) upright(d) omega (omega / omega_D)^3 (1 / 2 + frac(1, e^(beta planck omega) - 1))\
 & = 9 N^3 planck omega_D integral_0^1 upright(d) x (1 / 2 + frac(1, e^(beta planck omega_D x) - 1)) x^3\
 & = 3 / 8 \( 3 N^3 \) planck omega_D + 9 N^3 planck omega_D I \( beta planck omega_D \) $
比熱の定義式に代入することで次のようになる。
$ C & = integral_0^oo upright(d) omega g \( omega \) c \( omega \)\
 & = integral_0^(omega_D) upright(d) omega frac(9 N^3, omega_D) (omega / omega_D)^2 k_B (frac(beta planck omega e^(beta planck omega \/ 2), e^(beta planck omega) - 1))^2\
 & = 9 k_B N^3 \( beta planck omega_D \)^2 integral_0^(omega_D) frac(upright(d) omega, omega_D) (omega / omega_D)^4 frac(e^(beta planck omega), \( e^(beta planck omega) - 1 \)^2)\
 & = 3 n R dot.op 3 b^2 integral_0^1 upright(d) x frac(x^4 e^(b x), \( e^(b x) - 1 \)^2)\
 & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b) . $


#block[
#strong[定理 13] (). \

高温と低温の漸近領域における積分 $I \( b \)$ は次のように評価できる.
$ I \( b \) = cases(delim: "{", frac(1, 3 b) - 1 / 8 + 1 / 60 b - 1 / 5040 b^3 + 1 / 272160 b^5 - dots.h.c & \( b lt.double 1 \), pi^4 / 15 1 / b^4 + cal(O) \( b^(- 1) e^(- b) \) & \( b gt.double 1 \)) $

]
Bernoulli 数 $B_n$ の定義を用いて次のように計算できる。
$ I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1)\
 & = integral_0^1 upright(d) x sum_(n = 0)^oo frac(B_n b^(n - 1), n !) x^(n + 2)\
 & = sum_(n = 0)^oo frac(B_n, \( n + 3 \) n !) b^(n - 1)\
 & = frac(1, 3 b) - 1 / 8 + 1 / 60 b - 1 / 5040 b^3 + 1 / 272160 b^5 - dots.h.c . $

初項 $e^(- b x)$ 公比 $e^(- b x)$ の無限等比数列の和は
$1 \/ \( e^(b x) + 1 \)$ である. これより $I \( b \)$
は次のように表される.
$ I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1) = integral_0^1 upright(d) x x^3 sum_(n = 1)^oo e^(- n b x) = sum_(n = 1)^oo integral_0^1 upright(d) x x^3 e^(- n b x)\
 & = sum_(n = 1)^oo frac(1, \( n b \)^4) integral_0^(n b) upright(d) t t^3 e^(- t) #h(2em) \( t = n b x \)\
 & = sum_(n = 1)^oo frac(1, \( n b \)^4) gamma \( 4 \, n b \)\
 & = sum_(n = 1)^oo frac(1, \( n b \)^4) \( Gamma \( 4 \) - Gamma \( 4 \, n b \) \)\
 & = 1 / b^4 (Gamma \( 4 \) zeta \( 4 \) - sum_(n = 1)^oo 1 / n^4 Gamma \( 4 \, n b \)) $
ただし, 第一種不完全ガンマ関数 $gamma \( z \, p \)$
は次の式で定義される.第 2 種不完全ガンマ関数 $Gamma \( z \, p \)$,
ガンマ関数 $Gamma \( z \)$, ゼータ関数 $zeta \( z \)$
は次のように定義される.
$ gamma \( z \, p \) & := integral_0^p upright(d) t t^(z - 1) e^(- t) \, #h(2em) Gamma \( z \, p \) := integral_p^oo upright(d) t t^(z - 1) e^(- t)\
Gamma \( z \) & := integral_0^oo upright(d) t t^(z - 1) e^(- t) = gamma \( z \, p \) + Gamma \( z \, p \)\
zeta \( s \) & := sum_(n = 1)^oo 1 / n^s . $ ここでゼータ関数
$zeta \( 4 \)$ の値は次の通りとなる。第二種不完全ガンマ関数
$Gamma \( z \, p \)$ の $p$ の極限について積分範囲が小さくなっていき,
被積分関数は発散しないので次のようになる. $ Gamma \( 4 \) & = 6\
zeta \( 4 \) & = pi^4 / 90 $ $Gamma \( z \, p \)$
について部分積分することで次のように書ける.
$ Gamma \( z \, p \) & = integral_p^oo upright(d) t t^(z - 1) e^(- t)\
 & = sum_(m = 0)^n (- [\( z - 1 \) dots.h.c \( z - m \) t^(z - m - 1) e^(- t)]_p^oo) + integral_p^oo upright(d) t \( z - 1 \) dots.h.c \( z - n \) t^(z - n - 1) e^(- t)\
 & = sum_(m = 0)^n (\( z - 1 \) dots.h.c \( z - m \) p^(z - m - 1) e^(- p)) + integral_p^oo upright(d) t \( z - 1 \) dots.h.c \( z - n \) t^(z - n - 1) e^(- t)\
 & = p^(z - 1) e^(- p) (1 + sum_(m = 1)^oo 1 / p^m \( z - 1 \) \( z - 2 \) dots.h.c \( z - m \)) #h(2em) \( because n arrow.r oo \) . $
$z = 4$ を代入すると次のようになる.
$ Gamma \( 4 \, p \) & = p^3 e^(- p) (1 + 3 / p + 6 / p^2 + 6 / p^3)\
 & = e^(- p) (p^3 + 3 p^2 + 6 p + 6) . $ これより積分 $I \( b \)$
の第二種不完全ガンマ関数を展開することで次のようになる.
$ I \( b \) & = 1 / b^4 (pi^4 / 15 - sum_(n = 1)^oo 1 / n^4 e^(- n b) (\( n b \)^3 + 3 \( n b \)^2 + 6 n b + 6))\
 & = 1 / b^4 (pi^4 / 15 - sum_(n = 1)^oo (b^3 / n + frac(3 b^2, n^2) + frac(6 b, n^3) + 6 / n^4) e^(- n b))\
 & < 1 / b^4 (pi^4 / 15 - (b^3 + 3 b^2 + 6 b + 6) sum_(n = 1)^oo e^(- n b))\
 & = 1 / b^4 (pi^4 / 15 - (b^3 + 3 b^2 + 6 b + 6) frac(e^(- b), 1 - e^(- b)))\
 & tilde.op 1 / b^4 (pi^4 / 15 - b^3 e^(- b)) $
これより上界が指数関数的に小さくなることから $b gt.double 1$ のとき
$I \( b \)$ の最低次の漸近評価は十分正確である. 

#block[
#strong[定理 14] (). \

比熱 $C$ は次のように評価できる.
$ C = cases(delim: "{", 3 n R (1 - 1 / 20 (frac(planck omega_D, k_B T))^2 + 1 / 560 (frac(planck omega_D, k_B T))^4 - 1 / 18144 (frac(planck omega_D, k_B T))^6 + dots.h.c) & \( b lt.double 1 \), 3 n R (frac(4 pi^4, 5) (frac(k_B T, planck omega_D))^3 + cal(O) \( e^(- k_B T \/ planck omega_D) \)) & \( b gt.double 1 \)) $

]
$ C & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b) $
$ C & approx 3 n R dot.op \( - 3 \) b^2 frac(upright(d), upright(d) b) (frac(1, 3 b) - 1 / 8 + 1 / 60 b - 1 / 5040 b^3 + 1 / 272160 b^5 - dots.h.c)\
 & = 3 n R dot.op \( - 3 \) b^2 (- frac(1, 3 b^2) + 1 / 60 - 1 / 1680 b^2 + 1 / 54432 b^4 - dots.h.c)\
 & = 3 n R (1 - 1 / 20 b^2 + 1 / 560 b^4 - 1 / 18144 b^6 + dots.h.c)\
 & = 3 n R (1 - 1 / 20 (frac(planck omega_D, k_B T))^2 + 1 / 560 (frac(planck omega_D, k_B T))^4 - 1 / 18144 (frac(planck omega_D, k_B T))^6 + dots.h.c) . $

$ C & approx 3 n R dot.op \( - 3 \) b^2 (- pi^4 / 15 4 / b^5)\
 & = 3 n R times frac(4 pi^4, 5) (1 / b)^3\
 & = 3 n R times frac(4 pi^4, 5) (frac(k_B T, planck omega_D))^3 . $


よって Debye 模型の比熱は次のようにまとめられる.

#block[
Debye 模型の比熱
$ C & approx 3 n R times cases(delim: "{", 1 & \( k_B T gt.double planck omega_D \), frac(4 pi^4, 5) (frac(k_B T, planck omega_D))^3 & \( k_B T lt.double planck omega_D \)) . $

]
== 黒体輻射
<黒体輻射>
= 古典統計力学 (classical statistical mechanics) 近似
<古典統計力学-classical-statistical-mechanics-近似>
#block[
#strong[定理 15] (). \

$ Z & = frac(1, \( 2 pi planck \)^f) integral e^(- H \( p \, q \) \/ k_B T) product_(i = 1)^f upright(d) p_i upright(d) q_i $

]
== 振動子系の古典近似
<振動子系の古典近似>
== 理想気体の古典近似
<理想気体の古典近似>
== 非調和振動子系の古典近似
<非調和振動子系の古典近似>
= グランドカノニカル分布
<グランドカノニカル分布>
#block[
内部エネルギー $U \( S \, V \)$ とその束縛変数を変更させたエンタルピー
$H \( S \, p \)$ と Helmholtz 自由エネルギー $F \( T \, V \)$ と Gibbs
自由エネルギー $G \( T \, p \)$ を次のように定義する。
グランドポテンシャル (grand potential) または熱力学ポテンシャル
(thermodynamic potential) $J \( T \, V \, mu \)$
$  & #h(2em) upright(d) U = T upright(d) S - p upright(d) V + mu upright(d) N\
H = U + p V & #h(2em) upright(d) H = T upright(d) S + V upright(d) p + mu upright(d) N\
F = U - T S & #h(2em) upright(d) F = - S upright(d) T - p upright(d) V + mu upright(d) N\
G = F + p V & #h(2em) upright(d) G = - S upright(d) T + V upright(d) p + mu upright(d) N\
J = F - N mu & #h(2em) upright(d) J = - S upright(d) T - p upright(d) V - N upright(d) mu $

]
#block[
#strong[定理 16] (). \

$ 5 T & = (frac(partial U, partial S))_(V \, mu) & #h(2em) - p & = (frac(partial U, partial V))_(S \, mu) & #h(2em) mu & = (frac(partial U, partial mu))_(S \, V)\
T & = (frac(partial H, partial S))_(p \, mu) & #h(2em) V & = (frac(partial H, partial p))_(S \, mu) & #h(2em) mu & = (frac(partial H, partial mu))_(S \, p)\
- S & = (frac(partial F, partial T))_(V \, mu) & #h(2em) - p & = (frac(partial F, partial V))_(T \, mu) & #h(2em) mu & = (frac(partial F, partial mu))_(T \, V)\
- S & = (frac(partial G, partial T))_(p \, mu) & #h(2em) V & = (frac(partial G, partial p))_(T \, mu) & #h(2em) mu & = (frac(partial G, partial mu))_(T \, p)\
- S & = (frac(partial J, partial T))_(V \, mu) & #h(2em) - p & = (frac(partial J, partial V))_(T \, mu) & #h(2em) - N & = (frac(partial J, partial mu))_(T \, V) $

]
#block[
$ frac(partial U, partial S \, V) & = (frac(partial T, partial V))_(S \, N) = - (frac(partial p, partial S))_(V \, N) & frac(partial U, partial S \, N) & = (frac(partial T, partial N))_(S \, V) = (frac(partial mu, partial S))_(V \, N) & frac(partial U, partial V \, N) & = - (frac(partial p, partial N))_(S \, V) = (frac(partial mu, partial V))_(S \, N)\
frac(partial H, partial S \, p) & = (frac(partial T, partial p))_(S \, N) = (frac(partial V, partial S))_(p \, N) & frac(partial H, partial S \, N) & = (frac(partial T, partial N))_(S \, p) = (frac(partial mu, partial S))_(p \, N) & frac(partial H, partial p \, N) & = (frac(partial V, partial N))_(S \, p) = (frac(partial mu, partial p))_(S \, N)\
frac(partial F, partial T \, V) & = - (frac(partial S, partial V))_(T \, N) = - (frac(partial p, partial T))_(V \, N) & frac(partial F, partial T \, N) & = - (frac(partial S, partial N))_(T \, V) = (frac(partial mu, partial T))_(V \, N) & frac(partial F, partial V \, N) & = - (frac(partial p, partial N))_(T \, V) = (frac(partial mu, partial V))_(T \, N)\
frac(partial G, partial T \, p) & = - (frac(partial S, partial p))_(T \, N) = (frac(partial V, partial T))_(p \, N) & frac(partial G, partial T \, N) & = - (frac(partial S, partial N))_(T \, p) = (frac(partial mu, partial T))_(p \, N) & frac(partial G, partial p \, N) & = (frac(partial V, partial N))_(T \, p) = (frac(partial mu, partial p))_(T \, N)\
frac(partial J, partial T \, V) & = - (frac(partial S, partial V))_(T \, mu) = - (frac(partial p, partial T))_(V \, mu) & frac(partial J, partial T \, mu) & = - (frac(partial S, partial mu))_(T \, V) = - (frac(partial N, partial T))_(V \, mu) & frac(partial J, partial V \, mu) & = - (frac(partial p, partial mu))_(T \, V) = - (frac(partial N, partial V))_(T \, mu) $

]
#block[
#strong[定理 17] (Gibbs-Duhem の関係). \

グランドポテンシャルについて次の関係式が成り立つ。 $  & J = - p V\
 & V upright(d) p - S upright(d) T - N upright(d) mu = 0 $ 第二式を
Gibbs-Duhem の関係という。

]
グランドポテンシャル $J \( T \, V \, mu \)$ について $V$
は示量変数、$T \, mu$ は示強変数であるから系の大きさを $lambda$ 倍すると
$ J \( T \, lambda V \, mu \) & = lambda J \( T \, V \, mu \) $
となる。これに両辺 $lambda$ で微分して $lambda = 1$ を代入する。
$ frac(upright(d), upright(d) lambda) J \( T \, lambda V \, mu \)\|_(lambda = 1) & = (frac(partial \( lambda V \), partial lambda) frac(partial, partial \( lambda V \)) J \( T \, lambda V \, mu \))_(T \, mu)\|_(lambda = 1) = V (frac(partial J, partial V))_(T \, mu) = - p V $
よって $J = - p V$ となる。また定義式より Gibbs-Duhem の関係が求まる。
$ upright(d) J = upright(d) \( - p V \) = - p upright(d) V - V upright(d) p & = - S upright(d) T - p upright(d) V - N upright(d) mu\
V upright(d) p - S upright(d) T - N upright(d) mu & = 0 $ 

#block[
グランドカノニカル分布において分配関数 $Xi \( T \, V \, mu \)$
を次のように定義する。 $ Xi = sum_n e^(- beta \( E_n - mu N_n \)) $

]
#block[
#strong[定理 18] (). \

このときグランドポテンシャル $J$ や粒子数 $N$ など
$ J & = - k_B T ln Xi\
N & = 1 / beta (frac(partial ln Xi, partial mu))_(T \, V) $

]
整理して両辺を微分すると
$ upright(d) \( log Xi \) & = frac(upright(d) Xi, Xi)\
 & = - beta frac(sum_n upright(d) \( E_n - mu N_n \) e^(- beta \( E_n - mu N_n \)), sum_n e^(- beta \( E_n - mu N_n \))) - upright(d) beta frac(sum_n \( E_n - mu N_n \) e^(- beta \( E_n - mu N_n \)), sum_n e^(- beta \( E_n - mu N_n \)))\
 & = - beta \( chevron.l upright(d) E chevron.r - chevron.l N chevron.r upright(d) mu \) - upright(d) beta \( chevron.l E chevron.r - chevron.l N chevron.r mu \)\
 & = - frac(1, k_B T) \( - p upright(d) V - N upright(d) mu \) + frac(upright(d) T, k_B T^2) \( U - N mu \)\
upright(d) (frac(J, k_B T)) & = (frac(upright(d) J, k_B T)) - (frac(J, k_B T^2)) upright(d) T\
 & = (frac(- S upright(d) T - p upright(d) V - N upright(d) mu, k_B T)) - (frac(U - T S - N mu, k_B T^2)) upright(d) T\
 & = frac(1, k_B T) \( - p upright(d) V - N upright(d) mu \) - frac(upright(d) T, k_B T^2) \( U - N mu \) $



#block[
#strong[定理 19] (粒子数の揺らぎ). \

$ (frac(partial N, partial mu))_(T \, V) = beta chevron.l Delta N^2 chevron.r $

]
= Bose 統計と Fermi 統計
<bose-統計と-fermi-統計>
#block[
#strong[定理 20] (). \

2 粒子の波動関数は $phi \( bold(r)_1 \, bold(r)_2 \)$ と書かれる。
$ phi \( bold(r)_1 \, bold(r)_2 \) = plus.minus phi \( bold(r)_2 \, bold(r)_1 \) $
対称な粒子、反対称な粒子

]
添字を交換しても物理的な状態としては同一なので定数 $alpha$ を用いて
$phi \( bold(r)_1 \, bold(r)_2 \) = alpha phi \( bold(r)_2 \, bold(r)_1 \)$
と書ける。 $ alpha^2 = 1 arrow.l.r.double alpha = plus.minus 1 $ 

#block[
上の定理において $alpha = 1$ となる粒子をボース粒子またはボゾン (boson)
といい、$alpha = - 1$ となる粒子をフェルミ粒子またはフェルミオン
(fermion) という。

- Fermi 粒子: 電子・陽子

- Bose 粒子: 光子

]
- Fermi 統計:
  $e^(- beta \( epsilon_1 + epsilon_2 \)) + e^(- beta \( epsilon_2 + epsilon_3 \)) + e^(- beta \( epsilon_3 + epsilon_1 \))$

- Bose 統計:
  $e^(- 2 beta epsilon_1) + e^(- 2 beta epsilon_2) + e^(- 2 beta epsilon_3) + e^(- beta \( epsilon_1 + epsilon_2 \)) + e^(- beta \( epsilon_2 + epsilon_3 \)) + e^(- beta \( epsilon_3 + epsilon_1 \))$

- ボルツマン統計:
  $frac(1, 2 !) \( e^(- 2 beta epsilon_1) + e^(- 2 beta epsilon_2) + e^(- 2 beta epsilon_3) \)$
  \
  $1 / 2 e^(- 2 beta epsilon_1) + 1 / 2 e^(- 2 beta epsilon_2) + 1 / 2 e^(- 2 beta epsilon_3) + e^(- beta \( epsilon_1 + epsilon_2 \)) + e^(- beta \( epsilon_2 + epsilon_3 \)) + e^(- beta \( epsilon_3 + epsilon_1 \))$

$ N & = - (frac(partial J, partial mu))_T = 1 / beta (frac(partial ln Xi \( beta \, mu \), partial mu)) $

#block[
#strong[定理 21] (分配関数と分布関数). \

Fermi 統計と Bose 統計における分配関数 $Xi \( beta \, mu \)$、分布関数
$f \( epsilon \)$ は次のようになる。
$ 3 Xi_B \( beta \, mu \) & = product_(j = 1)^oo frac(1, 1 - e^(- beta \( epsilon_j - mu \))) & #h(2em) f_B \( epsilon \) & = frac(1, e^(beta \( epsilon_j - mu \)) - 1)\
Xi_F \( beta \, mu \) & = product_(j = 1)^oo (1 + e^(- beta \( epsilon_j - mu \))) & #h(2em) f_F \( epsilon \) & = frac(1, e^(beta \( epsilon_j - mu \)) + 1) $

]
Bose 統計
$ Xi_B^(\( j \)) \( beta \, mu \) & = sum_(n = 0)^oo e^(- beta \( epsilon_j - mu \) n) = frac(1, 1 - e^(- beta \( epsilon_j - mu \)))\
Xi_B \( beta \, mu \) & = product_(j = 1)^oo Xi_B^(\( j \)) \( beta \, mu \) = product_(j = 1)^oo frac(1, 1 - e^(- beta \( epsilon_j - mu \)))\
f_B \( epsilon_j \) := chevron.l n_j chevron.r & = 1 / beta (frac(partial, partial mu) ln Xi_B^(\( j \)) \( beta \, mu \)) = frac(e^(- beta \( epsilon_j - mu \)), 1 - e^(- beta \( epsilon_j - mu \))) = frac(1, e^(beta \( epsilon_j - mu \)) - 1)\
N & = sum_(j = 1)^oo frac(1, e^(beta \( epsilon_j - mu \)) - 1) $ Fermi
統計において
$ Xi_F^(\( j \)) \( beta \, mu \) & = sum_(n = 0)^1 e^(- beta \( epsilon_j - mu \) n) = 1 + e^(- beta \( epsilon_j - mu \))\
Xi_F \( beta \, mu \) & = product_(j = 1)^oo Xi_F^(\( j \)) \( beta \, mu \) = product_(j = 1)^oo (1 - e^(- beta \( epsilon_j - mu \)))\
f_F \( epsilon_j \) := chevron.l n_j chevron.r & = 1 / beta (frac(partial, partial mu) ln Xi_F^(\( j \)) \( beta \, mu \)) = frac(e^(- beta \( epsilon_j - mu \)), 1 + e^(- beta \( epsilon_j - mu \))) = frac(1, e^(beta \( epsilon_j - mu \)) + 1)\
N & = sum_(j = 1)^oo frac(1, e^(beta \( epsilon_j - mu \)) + 1) $ 

== Fermi-Dirac 統計力学
<fermi-dirac-統計力学>
Fermi 粒子において分布関数は次のようだった。
$ f_F \( epsilon \) & = frac(1, e^(beta \( epsilon - mu \)) + 1) $
これはエネルギーに対して次のような関数となる。
低温と高温の極限において考えることで
$ lim_(T arrow.r 0) f_F \( epsilon \) & = cases(delim: "{", 1 & \( epsilon < mu \), 1 \/ 2 & \( epsilon = mu \), 0 & \( epsilon > mu \))\
lim_(T arrow.r oo) f_F \( epsilon \) & approx e^(- beta \( epsilon - mu \)) $

#block[
#strong[定理 22] (ゾンマーフェルト展開). \

次の積分を次のように展開できる。
$ I \( beta \, mu \) & := integral_(- oo)^oo upright(d) epsilon g \( epsilon \) f_F \( epsilon \) = integral_(- oo)^mu g \( epsilon \) upright(d) epsilon + pi^2 / 6 g' \( mu \) \( k_B T \)^2 + O \( \( k_B T \)^4 \) $

]
$ G \( epsilon \) & = integral_(- oo)^epsilon g \( epsilon \) upright(d) epsilon $

$ I \( beta \, mu \) & = integral_(- oo)^oo upright(d) epsilon g \( epsilon \) f_F \( epsilon \)\
 & = \[ G \( epsilon \) f_F \( epsilon \) \]_(- oo)^oo - integral_(- oo)^oo upright(d) epsilon G \( epsilon \) f_(F') \( epsilon \)\
 & = - integral_(- oo)^oo upright(d) epsilon G \( epsilon \) f_(F') \( epsilon \)\
 & = - integral_(- oo)^oo upright(d) epsilon [G \( mu \) + G' \( mu \) \( epsilon - mu \) + 1 / 2 G'' \( mu \) \( epsilon - mu \)^2 + dots.h.c] f_(F') \( epsilon \) $
$x = beta \( epsilon - mu \)$ と変数変換すると奇関数性より
$ integral_(- oo)^oo upright(d) epsilon f_(F') \( epsilon \) & = \[ f_F \( epsilon \) \]_(- oo)^oo = - 1\
integral_(- oo)^oo upright(d) epsilon f_(F') \( epsilon \) \( epsilon - mu \) & = integral_(- oo)^oo upright(d) epsilon x / beta frac(e^x, \( e^x + 1 \)^2) = integral_(- oo)^oo upright(d) epsilon x / beta frac(x, 4 cosh^2 \( x \/ 2 \)) = 0\
integral_(- oo)^oo upright(d) epsilon f_(F') \( epsilon \) \( epsilon - mu \)^2 & = 1 / beta^2 integral_(- oo)^oo upright(d) epsilon x^2 frac(upright(d), upright(d) x) (frac(1, e^x + 1))\
 & = 2 / beta^2 [frac(x^2, e^x + 1)]_0^oo - 4 / beta^2 integral_0^oo upright(d) epsilon frac(x, e^x + 1)\
 & = - 4 / beta^2 integral_0^oo upright(d) epsilon x sum_(n = 1)^oo \( - 1 \)^(n - 1) e^(- n x)\
 & = - 4 / beta^2 sum_(n = 1)^oo frac(\( - 1 \)^(n - 1), 2 n^2)\
 & = - 4 / beta^2 pi^2 / 12 = - frac(pi^2, 3 beta^2) $
$ I \( beta \, mu \) & = G \( mu \) + frac(pi^2, 6 beta^2) G'' \( mu \) + O \( beta^(- 4) \)\
 & = integral_(- oo)^mu g \( epsilon \) upright(d) epsilon + pi^2 / 6 g' \( mu \) \( k_B T \)^2 + O \( \( k_B T \)^4 \) $


#block[
#strong[定理 23] (). \

$ mu & approx epsilon_F - pi^2 / 6 frac(nu' \( epsilon_F \), nu \( epsilon_F \)) \( k_B T \)^2\
c \( T \, rho \) & = pi^2 / 3 nu \( epsilon_F \) k_B^2 T $

]
$ N & = integral_(- oo)^oo upright(d) epsilon nu \( epsilon \) f_F \( epsilon \)\
 & approx integral_(- oo)^mu upright(d) epsilon nu \( epsilon \) + pi^2 / 6 nu' \( mu \) \( k_B T \)^2\
 & = integral_(- oo)^(epsilon_F) upright(d) epsilon nu \( epsilon \) + integral_(epsilon_F)^mu upright(d) epsilon nu \( epsilon \) + pi^2 / 6 nu' \( mu \) \( k_B T \)^2\
 & approx N + \( mu - epsilon_F \) nu \( epsilon_F \) + pi^2 / 6 nu' \( mu \) \( k_B T \)^2 $
$ mu approx epsilon_F - pi^2 / 6 frac(nu' \( epsilon_F \), nu \( epsilon_F \)) \( k_B T \)^2 $

$ U & = integral_(- oo)^oo upright(d) epsilon epsilon nu \( epsilon \) f_F \( epsilon \)\
 & approx integral_(- oo)^mu upright(d) epsilon epsilon nu \( epsilon \) + pi^2 / 6 \( epsilon nu \( epsilon \) \)' \|_(epsilon = mu) \( k_B T \)^2\
 & = integral_(- oo)^(epsilon_F) upright(d) epsilon epsilon nu \( epsilon \) + integral_(epsilon_F)^mu upright(d) epsilon epsilon nu \( epsilon \) + pi^2 / 6 \( epsilon nu \( epsilon \) \)' \|_(epsilon = mu) \( k_B T \)^2\
 & = integral_(- oo)^(epsilon_F) upright(d) epsilon epsilon nu \( epsilon \) + \( mu - epsilon_F \) epsilon_F nu \( epsilon_F \) + pi^2 / 6 nu \( epsilon_F \) \( k_B T \)^2 + pi^2 / 6 epsilon_F nu' \( epsilon_F \) \( k_B T \)^2\
 & approx integral_(- oo)^(epsilon_F) upright(d) epsilon epsilon nu \( epsilon \) + pi^2 / 6 nu \( epsilon_F \) \( k_B T \)^2 $

$ c \( T \, rho \) & = frac(partial U, partial T) = pi^2 / 3 nu \( epsilon_F \) k_B^2 T $


== Bose-Einstein 統計力学
<bose-einstein-統計力学>
Bose 粒子において分布関数は次のようだった。
$ f_B \( epsilon \) & = frac(1, e^(beta \( epsilon - mu \)) - 1) $
$epsilon = mu$ において発散する関数となる。通常は $mu < 0$
であるため、積分区間では被積分関数の発散が起こらないが $mu approx 0$
となると $epsilon = 0$ において離散的な値となる。

TODO: 解釈

#block[
#strong[定理 24] (). \

3 次元空間の自由なボゾンを考えてエネルギー $epsilon$
とエネルギーに対する状態密度 $nu \( epsilon \)$
が次のように与えられるとする。
$ epsilon = frac(planck^2 k^2, 2 m) \, #h(2em) nu \( epsilon \) = c sqrt(epsilon) \, #h(2em) c = frac(V, 4 pi^2) (frac(2 m, planck^2))^(3 \/ 2) $
ただしエネルギーゼロの準位の状態は 1 つとする。このとき転移温度 $T_c$
以下においてエネルギーゼロの準位に入る粒子数 $N_0$
がマクロな個数となる。これをボーズ凝縮 (Bose condensation) という。
$ T_c = frac(2 pi planck^2, m k_B) (frac(1, zeta (3 / 2)) N / V)^(2 \/ 3) approx 0.5273 frac(2 pi planck^2, m k_B) rho^(2 \/ 3) $
$ N_0 & = frac(1, e^(- beta mu) - 1) approx N (1 - (T / T_c)^(3 \/ 2))\
U_0 & = frac(3 V, 2) (frac(m, 2 pi planck^2))^(3 \/ 2) \( k_B T \)^(5 \/ 2) zeta (5 / 2)\
C_0 & = frac(15 V, 4) (frac(m T, 2 pi planck^2))^(3 \/ 2) k_B^(5 \/ 2) zeta (5 / 2) $

]
系の粒子数 $N$ に対してエネルギー準位がゼロとそれ以外の粒子数をそれぞれ
$N_0 \( beta \, mu \)$, $N' \( beta \, mu \)$
とする。それぞれ次のように計算できる。
$ N_0 \( beta \, mu \) & = frac(1, e^(- beta mu) - 1)\
N' \( beta \, mu \) & = c integral_0^oo upright(d) epsilon frac(sqrt(epsilon), e^(beta \( epsilon - mu \)) - 1) = c beta^(- 3 \/ 2) integral_0^oo upright(d) u frac(u^(1 \/ 2), e^(- beta mu) e^u - 1) $
粒子数 $N' \( beta \, mu \)$ は $mu = 0$ において最大となる。これを
$N'_max$ とおく。
$ N' \( beta \, 0 \) & = c beta^(- 3 \/ 2) integral_0^oo upright(d) u frac(u^(1 \/ 2), e^u - 1)\
 & = c beta^(- 3 \/ 2) integral_0^oo upright(d) u sum_(n = 1)^oo u^(1 \/ 2) e^(- n u)\
 & = c beta^(- 3 \/ 2) sum_(n = 1)^oo 1 / n^(3 \/ 2) Gamma (3 / 2)\
 & = c beta^(- 3 \/ 2) zeta (3 / 2) Gamma (3 / 2)\
 & = V / 8 (frac(2 m k_B T, pi planck^2))^(3 \/ 2) zeta (3 / 2) $
このとき系の粒子数 $N$ と $N'_max$ の大小関係に着目する。このとき温度
$T$ と転移温度 $T_c$ の大小関係と対応できる。
$ {N < N'_max prop T_c^(3 \/ 2) < T^(3 \/ 2) arrow.l.r.double T > T_c\
N > N'_max prop T_c^(3 \/ 2) > T^(3 \/ 2) arrow.l.r.double T < T_c #h(2em) (T_c = frac(2 pi planck^2, m k_B) (frac(1, zeta (3 / 2)) N / V)^(2 \/ 3)) $
このように

+ $N < N'_max$ つまり転移温度より高温のとき $mu$
  は非ゼロの負の値となり、$N_0 approx 0$ となる。

+ $N > N'_max$ つまり転移温度より低温のとき $mu$
  はゼロに近い負の値となり $N_0 approx N - N'_max$ となる。

$ N_0 approx N - N'_max = N - V / 8 (frac(2 m k_B T, pi planck^2))^(3 \/ 2) zeta (3 / 2) = N (1 - (T / T_c)^(3 \/ 2)) $

さらにエネルギーと比熱について
$ U & = integral_0^oo upright(d) epsilon epsilon nu \( epsilon \) frac(1, e^(beta \( epsilon - mu \)) - 1) = c integral_0^oo upright(d) epsilon frac(epsilon^(3 \/ 2), e^(beta \( epsilon - mu \)) - 1)\
 & = frac(V, 4 pi^2) (frac(2 m, planck^2))^(3 \/ 2) \( k_B T \)^(5 \/ 2) integral_0^oo upright(d) u frac(u^(3 \/ 2), e^u e^(- beta mu) - 1)\
U_0 & = frac(V, 4 pi^2) (frac(2 m, planck^2))^(3 \/ 2) \( k_B T \)^(5 \/ 2) integral_0^oo upright(d) u frac(u^(3 \/ 2), e^u - 1)\
 & = frac(V, 4 pi^2) (frac(2 m, planck^2))^(3 \/ 2) \( k_B T \)^(5 \/ 2) Gamma (5 / 2) zeta (5 / 2)\
 & = frac(3 V, 2) (frac(m, 2 pi planck^2))^(3 \/ 2) \( k_B T \)^(5 \/ 2) zeta (5 / 2) $

$ C_0 & = frac(upright(d) U_0, upright(d) T) = frac(15 V, 4) (frac(m T, 2 pi planck^2))^(3 \/ 2) k_B^(5 \/ 2) zeta (5 / 2) $


= 相転移と臨界現象
<相転移と臨界現象>
== 相と相平衡
<相と相平衡>
== Landau 理論
<landau-理論>
= イジング模型
<イジング模型>
$ chevron.l S chevron.r $


// 変換時に定義が失われた参照先。リンクを生かすための錨。
#metadata(none)<newton>
