#import "/src/typst/template.typ": post

#show: post.with(
  title: "統計力学",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/statistics_middle_exam.tex から変換",
)

#heading(level: 1, numbering: none)[問 1]
<問-1>
固体において原子の取りうる量子状態が二つある二準位系について考える。それぞれのエネルギーレベルは
$plus.minus epsilon.alt med \( epsilon.alt > 0 \)$
である。固体における原子数が $N$
で与えられ、その数は非常に大きいとき、以下の問いに答えよ。 \
(1) エネルギー ($- epsilon.alt$) をとる数を $N_1$、$epsilon.alt$
を取る数を $N_2$ と置き、エントロピー $S \( N_1 \, N_2 \)$ を求めよ。

まず $N = N_1 + N_2$ とおくと量子状態数 $W$ は次のようになる。
$ W = zws_N C_(N_1) = frac(N !, N_1 ! N_2 !) $ これよりエントロピー
$S \( N_1 \, N_2 \)$ はスターリングの公式を用いると
$ S \( N_1 \, N_2 \) & = k_B ln W\
 & = k_B ln frac(N !, N_1 ! N_2 !)\
 & approx k_B (\( N ln N - N \) - \( N_1 ln N_1 - N_1 \) - \( N_2 ln N_2 - N_2 \))\
 & = k_B (N ln N - N_1 ln N_1 - N_2 ln N_2) $ となる。 \
(2) 系全体のエネルギーを $E$ とするとき、エネルギー $E$ を温度 $T$
の関数として求めよ。

$E = - epsilon.alt N_1 + epsilon.alt N_2 = epsilon.alt \( N_2 - N_1 \)$
よりエントロピーはエネルギーの関数として表される。
$ S \( N_1 \, N_2 \) & = S (1 / 2 (N - E / epsilon.alt) \, 1 / 2 (N + E / epsilon.alt))\
 & approx k_B (N ln N - 1 / 2 (N - E / epsilon.alt) ln 1 / 2 (N - E / epsilon.alt) - 1 / 2 (N + E / epsilon.alt) ln 1 / 2 (N + E / epsilon.alt))\
 & = k_B / 2 (2 N ln 2 N - (N - E / epsilon.alt) ln (N - E / epsilon.alt) - (N + E / epsilon.alt) ln (N + E / epsilon.alt)) $
これを用いて温度 $T$ を計算すると次のようになる。
$ T & = (frac(partial E, partial S))_V\
 & approx (k_B / 2 (1 / epsilon.alt + 1 / epsilon.alt ln (N - E / epsilon.alt) - 1 / epsilon.alt - 1 / epsilon.alt ln (N + E / epsilon.alt)))^(- 1)\
 & = (frac(k_B, 2 epsilon.alt) ln (frac(N - E / epsilon.alt, N + E / epsilon.alt)))^(- 1) $
よって $T$ はエネルギー $E$
の関数となったので逆写像とすることでエネルギー $E$ を $T$ で表される。
$ E & = epsilon.alt N frac(e^(- frac(2 epsilon.alt, k_B T)) - 1, e^(- frac(2 epsilon.alt, k_B T)) + 1) $
\
(3) 比熱を求め、高温極限と低温極限の漸近形を求めよ。

比熱を計算すると
$ C & = (frac(partial E, partial T))_V = frac(4 epsilon.alt^2 N, k_B T^2) e^(- frac(2 epsilon.alt, k_B T)) / (1 + e^(- frac(2 epsilon.alt, k_B T)))^2 = k_B N (frac(2 epsilon.alt, k_B T))^2 e^(- frac(2 epsilon.alt, k_B T)) / (1 + e^(- frac(2 epsilon.alt, k_B T)))^2 $
となるから高温極限 ($2 epsilon.alt \/ k_B T lt.double 1$) と低温極限
($2 epsilon.alt \/ k_B T gt.double 1$) の比熱 $C_(h i g h) \, C_(l o w)$
は次のようになる。
$ C_(h i g h) & approx frac(k_B N, 4) (frac(2 epsilon.alt, k_B T))^2 arrow.r 0\
C_(l o w) & approx k_B N (frac(2 epsilon.alt, k_B T))^2 e^(- frac(2 epsilon.alt, k_B T)) arrow.r 0 $
