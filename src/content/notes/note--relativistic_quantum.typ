#import "/src/typst/template.typ": post

#show: post.with(
  title: "相対論的量子力学",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/relativistic_quantum.tex から変換",
)

== 電磁場中の荷電粒子
<電磁場中の荷電粒子>
スカラーポテンシャル $phi.alt$, ベクトルポテンシャル $bold(A)$
の中での電荷 $q$ を持つ粒子の運動は次の置き換えで記述できる。
$ H & mapsto H - q phi.alt \( bold(r) \, t \)\
bold(p) & mapsto bold(p) - q bold(A) \( bold(r) \, t \) $ 一様な磁場
$bold(B)$ の場合, ベクトルポテンシャルは
$bold(A) = 1 / 2 bold(B) times bold(r)$ (対称ゲージ)
と置くことができるので
$ frac(1, 2 m) \( bold(p) - q bold(A) \) = frac(bold(p)^2, 2 m) - frac(q, 2 m) bold(B) dot.op bold(L) + frac(q^2, 8 m) \( bold(B)^2 bold(r)^2 - \( bold(B) dot.op bold(r) \)^2 \) $
$sigma_i sigma_j = delta_(i j) + i epsilon.alt_(i j k) sigma_k$
となるので $ H & = frac(\( bold(sigma) dot.op bold(p) \)^2, 2 m)\
 & = frac(\( bold(sigma) dot.op bold(p - q bold(A)) \)^2, 2 m)\
 & = frac(1, 2 m) \( bold(p - q bold(A)) \)^2 - 2 frac(q planck, 2 m) bold(B) dot.op bold(s) & (bold(s) = bold(sigma) / 2) $
となる。 ゼーマン相互作用

= 相対論的波動方程式
<相対論的波動方程式>
== クライン・ゴルドン方程式
<クラインゴルドン方程式>
相対論的力学におけるエネルギーと運動量の関係に基づいてローレンツ変換のもとで共変となる相対論的波動方程式を構築する。
$ i planck frac(partial, partial t) psi \( t \, bold(r) \) = - frac(planck^2, 2 m) nabla^2 psi \( t \, bold(r) \) $
相対論的力学における自由粒子のエネルギーと運動量の関係
$E = plus.minus sqrt(\( m c^2 \)^2 + \( c bold(p) \)^2)$ より
$ i planck frac(partial, partial t) psi \( x \) & = plus.minus sqrt(\( m c^2 \)^2 + \( c hat(bold(p)) \)^2) psi \( x \) $
となるが

+ 時間微分と空間微分について非対称であり,
  ローレンツ変換のもとでの共変性が見えない。

+ 実際に, 光速よりも速く情報が伝播しないという, 相対論的な因果律を破る。

+ 空間微分が平方根の中に入っているため連続の方程式を導くことができず,
  波動関数の確率解釈ができない。

上記の波動方程式では, 時間に関して 1 階微分, 空間に関して 2
階微分が平方根の中に入っている. この非対称性を解消するため,
時間微分を両辺に作用させると
$ p^mu & = (E / c \, bold(p)) = (i planck 1 / c frac(partial, partial t) \, - i planck nabla) = i planck partial^mu $
$ \( m c^2 \)^2 = E^2 - \( c bold(p) \)^2 & = c^2 p_mu p^mu = - \( planck c \)^2 partial_mu partial^mu $
$ [partial_mu partial^mu + (frac(m c, planck))^2] psi \( x \) = 0 $
を得る。これをクライン・ゴルドン方程式と呼ぶ。

#block[
$ [partial_mu partial^mu + (frac(m c, planck))^2] psi \( x \) = 0 $

]
クライン・ゴルドン方程式から
$ psi^(\*) \( x \) [partial_mu partial^mu + (frac(m c, planck))^2] psi \( x \) = 0\
psi \( x \) [partial_mu partial^mu + (frac(m c, planck))^2] psi^(\*) \( x \) = 0 $
が得られるので両辺の差を取って
$  & psi^(\*) \( x \) partial_mu partial^mu psi \( x \) - psi \( x \) partial_mu partial^mu psi^(\*) \( x \) = 0\
 & partial_mu \[ psi^(\*) \( x \) partial^mu psi \( x \) - psi \( x \) partial^mu psi^(\*) \( x \) \] = 0\
 & partial_mu j^mu \( x \) = 0 $ 連続の方程式が成り立つ。
$ j^mu \( x \) := psi^(\*) \( x \) partial^mu psi \( x \) - psi \( x \) partial^mu psi^(\*) \( x \) $
これより保存則が成り立つ。 となる。ただし
$rho \( x \) = j^0 \( x \) \/ c$
は非負とは限らないため粒子の存在確率密度と解釈することはできない。

クライン・ゴルドン方程式では時間に関して 2
階微分を含むため、$j^0 \( x \)$
に時間微分が残り、確率解釈ができなかった。時間に関して 1
階微分のみを含む相対論的波動方程式を構築したい。また共変性を満足するためには空間に関しても
1 階微分のみを含む必要がある。そこで

== ディラック方程式
<ディラック方程式>
確率解釈できる相対論的波動方程式を構築する。

次の形となることを仮定する。 ただし、$alpha^i \, beta$
は次を満たす無次元の未知係数である。 これをディラック方程式という。
$ i planck frac(partial, partial t) psi \( x \) & = (c alpha^i p_i + beta m c^2) psi \( x \) $
これがクライン・ゴルドン方程式を満たすことから
$ (i planck frac(partial, partial t))^2 psi \( x \) & = (c alpha^i p_i + beta m c^2)^2 psi \( x \)\
 & = [c^2 alpha^i p_i alpha^j p_j + beta^2 \( m c^2 \)^2 + \( alpha^i beta + beta alpha^i \) p_i \( m c \)] psi \( x \)\
 & = \[ \( c bold(p) \)^2 + \( m c^2 \)^2 \] psi \( x \) $
係数を比較することによって $alpha^i$ と $beta$
は次を満たすエルミート行列であることがわかる。
$ { alpha^i \, alpha^j } = 2 delta^(i j) \, #h(2em) beta^2 = 1 \, #h(2em) { alpha^i \, beta } = 0 $<condition>
さらにガンマ行列 $gamma^mu := \( beta \, beta bold(alpha) \)$
を定義する。 両辺に左から $beta \/ c$
を掛けてディラック方程式は次のようになる。
$  & i planck gamma^0 partial_0 psi \( x \) = (- i planck gamma^i partial_i + m c) psi \( x \)\
 & (i planck gamma^mu partial_mu - m c) psi \( x \) = 0 $
ガンマ行列の同値な条件は次のようになる。
$ \( gamma^0 \)^dagger & = beta^dagger = beta = gamma^0\
\( gamma^i \)^dagger & = \( beta alpha^i \)^dagger = alpha^i beta = - beta alpha^i = - gamma^i\
{ gamma^mu \, gamma^nu } & = cases(delim: "{", beta alpha^mu beta alpha^nu + beta alpha^nu beta alpha^mu = - beta^2 \( alpha^mu alpha^nu + alpha^nu alpha^mu \) = - 2 delta^(mu nu) & \( mu > 0 \, nu > 0 \), beta beta alpha^nu + beta alpha^nu beta = beta^2 alpha^nu - beta^2 alpha^nu = 0 & \( mu = 0 \, nu > 0 \), 2 beta^2 = 2 & \( mu = nu = 0 \))\
 & = 2 g^(mu nu) $ より $gamma^0$ はエルミート行列で $gamma^i$
は反エルミート行列である。${ gamma^mu \, gamma^nu } = { gamma^nu \, gamma^mu }$
より $mu lt.eq nu$ のときを示せばよい。

#block[
$  & \( i planck gamma^mu partial_mu - m c \) psi \( x \) = 0 $
$  & \( gamma^0 \)^dagger = gamma^0 \, #h(2em) \( gamma^i \)^dagger = - gamma^i \, #h(2em) { gamma^mu \, gamma^nu } = 2 g^(mu nu) $

]
式 #link(<condition>)[condition] を満たす行列は例えばディラック表示がある。
$ alpha^i = sigma^i times.o sigma^1 = mat(delim: "(", 0, sigma^i; sigma^i, 0) \, #h(2em) beta = sigma^0 times.o sigma^3 = mat(delim: "(", sigma^0, 0; 0, - sigma^0) $
ただしパウリ行列 $bold(sigma)$ は次のように定義される。
$ sigma_0 = mat(delim: "(", 1, 0; 0, 1) \, #h(2em) sigma_1 = mat(delim: "(", 0, 1; 1, 0) \, #h(2em) sigma_2 = mat(delim: "(", 0, - i; i, 0) \, #h(2em) sigma_3 = mat(delim: "(", 1, 0; 0, - 1) $
パウリ行列は Hermite 行列 $sigma_i^dagger = sigma_i$ かつユニタリ行列
$sigma_i^dagger sigma_i = sigma_i sigma_i^dagger = I$
で次の性質を満たす。
$ sigma_i sigma_j & = delta_(i j) I + i sum_k epsilon_(i j k) sigma_k $
これより
$ \( alpha^i \)^dagger & = alpha^i \, #h(2em) beta^dagger = beta \, #h(2em) beta^2 = \( sigma^0 times.o sigma^3 \)^2 = 1\
{ alpha^i \, alpha^j } & = { sigma^i times.o sigma^1 \, sigma^j times.o sigma^1 } = \( sigma^i sigma^j + sigma^j sigma^i \) times.o \( sigma^1 \)^2 = 2 delta^(i j)\
{ alpha^i \, beta } & = { sigma^i times.o sigma^1 \, sigma^0 times.o sigma^3 } = \( sigma^i sigma^0 - sigma^0 sigma^i \) times.o \( sigma^1 sigma^3 \) = 0 $

$ i planck frac(partial, partial t) psi \( x \) & = (c bold(alpha) dot.op \( bold(p) - q bold(A) \( x \) \) + beta m c^2 + q phi.alt \( x \)) psi \( x \)\
 & = mat(delim: "(", + m c^2 + q phi.alt \( x \), c bold(sigma) dot.op \[ bold(p) - q bold(A) \( x \) \]; c bold(sigma) dot.op \[ bold(p) - q bold(A) \( x \) \], - m c^2 + q phi.alt \( x \)) vec(psi_(+) \( x \), psi_(-) \( x \)) $

== ディラック方程式の共変性
<ディラック方程式の共変性>
$ A_mu \( t \, bold(r) \) = (frac(phi.alt \( t \, bold(r) \), c) \, bold(A) \( t \, bold(r) \)) $
共変微分 $D_mu$ を次のように定義する。
$ D_mu := partial_mu - frac(q, i planck) A_mu \( x \) = (1 / c frac(partial, partial t) - frac(q, i planck) frac(phi.alt \( t \, bold(r) \), c) + frac(q, i planck) bold(A) \( t \, bold(r) \)) $
$ \( i planck gamma^mu D_mu - m c \) psi \( x \) = 0 $
まず次の式が成り立つことを確認する。
$ D_mu D_nu^dagger & = (partial_mu - frac(q, i planck) A_mu \( x \)) (partial_nu + frac(q, i planck) A_nu \( x \))\
 & = partial_mu partial_nu + frac(q, i planck) partial_mu A_nu \( x \) - frac(q, i planck) A_mu \( x \) partial_nu + q^2 / planck^2 A_mu \( x \) A_nu \( x \) $
よって次のように示せる。
$ \( bold(D) dot.op bold(sigma) \)^2 & = sum_(i \, j) \( D_i sigma^i \) \( D_j sigma^j \)^dagger\
 & = sum_(i \, j) (delta^(i j) I + i sum_k epsilon^(i j k) sigma^k) D_i D_j^dagger\
 & = sum_i D_i^2 + i sum_(i \, j \, k) epsilon^(i j k) sigma^k D_i D_j^dagger\
 & = bold(D)^2 + i sum_(i \, j \, k) epsilon^(i j k) sigma^k frac(q, i planck) partial_i A_j \( x \)\
 & = bold(D)^2 + q / planck bold(sigma) dot.op \( upright(bold(nabla)) times bold(A) \( x \) \)\
 & = bold(D)^2 + q / planck bold(B) \( x \) dot.op bold(sigma) $

慣性系 $x^mu$ と共変微分 $D_mu$
におけるローレンツ共変性は次のようになる。
$ x'^mu & = Lambda_(med nu)^mu x^nu\
D'_mu & = Lambda_mu^(med nu) D_nu $ 波動関数 $psi \( x \)$
のローレンツ共変性 $ psi' \( x' \) & = S_Lambda psi \( x \) $
このときディラック方程式は次のように変換でき、共変性を満たす。
$S_Lambda^(- 1) gamma^mu S_Lambda = Lambda_nu^mu gamma^nu$
を満たすように定めた $S_Lambda$
$ \( i planck gamma^mu D'_mu - m c \) psi' \( x' \) & = \( i planck gamma^mu Lambda_mu^nu D_mu - m c \) S_Lambda psi \( x \)\
 & = S_Lambda \( i planck S_Lambda^(- 1) gamma^mu S_Lambda Lambda_mu^nu D_mu - m c \) psi \( x \)\
 & = S_Lambda \( i planck Lambda_lambda^mu gamma^lambda Lambda_mu^nu D_mu - m c \) psi \( x \)\
 & = S_Lambda \( i planck delta_lambda^nu gamma^lambda D_mu - m c \) psi \( x \)\
 & = S_Lambda \( i planck gamma^nu D_mu - m c \) psi \( x \) = 0 $

== 無限小変換
<無限小変換>
無限小変換を考える。
$ Lambda_(med nu)^mu = delta_nu^mu + omega_(med nu)^mu $
$ omega_(med nu)^mu & = mat(delim: "(", 0, - Delta eta_x, - Delta eta_y, - Delta eta_z; - Delta eta_x, 0, Delta theta_z, - Delta theta_y; - Delta eta_y, - Delta theta_z, 0, Delta theta_x; - Delta eta_z, Delta theta_y, - Delta theta_x, 0) $
$ Lambda_(med nu)^mu Lambda_mu^(med lambda) & = delta_nu^lambda\
Lambda_(med nu)^mu Lambda_mu^(med lambda) & = \( delta_nu^mu + omega_(med nu)^mu \) \( delta_mu^lambda + omega_mu^(med lambda) \) = delta_nu^lambda + omega_nu^(med lambda) + omega_(med nu)^lambda $
$omega_(nu lambda) = - omega_(lambda nu)$ と反対称となる。 そして
$S_Lambda$ を次のように定義する。
$ S_Lambda = 1 + omega_(mu nu) Gamma^(mu nu) \, #h(2em) S_Lambda^(- 1) = 1 - omega_(mu nu) Gamma^(mu nu) $
対称と反対称だと $0$ になるから $Gamma^(mu nu)$
は反対称としても構わないが今回は $Gamma^(mu nu) = c gamma^mu gamma^nu$
とする。
$ S_Lambda^(- 1) gamma^mu S_Lambda & = Lambda_(med nu)^mu gamma^nu\
\( 1 - omega_(kappa lambda) Gamma^(kappa lambda) \) gamma^mu \( 1 + omega_(kappa lambda) Gamma^(kappa lambda) \) & = \( delta_nu^mu + omega_(med nu)^mu \) gamma^nu\
gamma^mu - omega_(kappa lambda) Gamma^(kappa lambda) gamma^mu + omega_(kappa lambda) gamma^mu Gamma^(kappa lambda) & = gamma^mu + omega_(med nu)^mu gamma^nu\
omega_(kappa lambda) gamma^mu Gamma^(kappa lambda) - omega_(kappa lambda) Gamma^(kappa lambda) gamma^mu & = omega_(med nu)^mu gamma^nu\
c omega_(kappa lambda) gamma^mu gamma^kappa gamma^lambda - c omega_(kappa lambda) gamma^kappa gamma^lambda gamma^mu & = c omega_(kappa lambda) gamma^mu gamma^kappa gamma^lambda - c omega_(kappa lambda) \( 2 g^(mu lambda) gamma^kappa - 2 g^(mu kappa) gamma^lambda + gamma^mu gamma^kappa gamma^lambda \)\
 & = c \( - 2 omega_kappa^(med mu) gamma^kappa + 2 omega_(med lambda)^mu gamma^lambda \) = 4 c omega_(med nu)^mu gamma^nu = omega_(med nu)^mu gamma^nu $
$ S_Lambda = 1 + 1 / 4 omega_(mu nu) gamma^mu gamma^nu $

== 有限ローレンツ変換
<有限ローレンツ変換>
$ N omega_(mu nu) & = N g_(mu lambda) omega_(med nu)^lambda = mat(delim: "(", 0, - eta_x, - eta_y, - eta_z; eta_x, 0, - theta_z, theta_y; eta_y, theta_z, 0, - theta_x; eta_z, - theta_y, theta_x, 0) $
$ S_Lambda & = lim_(N arrow.r oo) \[ 1 + omega_(mu nu) / 4 gamma^mu gamma^nu \]^N = lim_(N arrow.r oo) [exp (omega_(mu nu) / 4 gamma^mu gamma^nu)]^N = exp (frac(N omega_(mu nu), 4) gamma^mu gamma^nu)\
 & = exp (- eta_x / 2 gamma^0 gamma^1 - eta_y / 2 gamma^0 gamma^2 - eta_z / 2 gamma^0 gamma^3 - theta_x / 2 gamma^2 gamma^3 - theta_y / 2 gamma^3 gamma^1 - theta_z / 2 gamma^1 gamma^2)\
 & = exp (- eta_x / 2 alpha^1 - eta_y / 2 alpha^2 - eta_z / 2 alpha^3 + theta_x / 2 alpha^2 alpha^3 + theta_y / 2 alpha^3 alpha^1 + theta_z / 2 alpha^1 alpha^2)\
 & = exp (- bold(eta) / 2 dot.op bold(alpha) + i bold(theta) / 2 dot.op bold(Sigma))\
 & = [cosh (- bold(eta) / 2 dot.op bold(alpha)) - sinh (- bold(eta) / 2 dot.op bold(alpha))] + exp (i bold(theta) / 2 dot.op bold(Sigma)) $
$Sigma^i$ を次のように定義する。
$bold(Sigma) = \( Sigma^1 \, Sigma^2 \, Sigma^3 \)$ と任意の
$bold(v) = \( v^1 \, v^2 \, v^3 \)$ に対して次が成り立つことを示せ。
$ Sigma^i := - i / 2 sum_(j \, k = 1)^3 epsilon^(i j k) alpha^j alpha^k = - i \( alpha^2 alpha^3 \, alpha^3 alpha^1 \, alpha^1 alpha^2 \) $
$ \( Sigma^i \)^dagger & = - i / 2 sum_(j \, k) epsilon^(i j k) gamma^k gamma^j = Sigma^i $
$ { Sigma^i \, Sigma^j } = 2 delta^(i j) $ $i = j$ のとき、ある $k \, l$
が存在して
$ { Sigma^i \, Sigma^j } & = - 1 / 2 (sum_(a \, b) epsilon^(i a b) gamma^a gamma^b)^2\
 & = - 1 / 2 (gamma^k gamma^l - gamma^l gamma^k)^2\
 & = - 1 / 2 (gamma^k gamma^l gamma^k gamma^l - gamma^k gamma^l gamma^l gamma^k - gamma^l gamma^k gamma^k gamma^l + gamma^l gamma^k gamma^l gamma^k)\
 & = 2 $ $i eq.not j$ のとき $a \, b \, c \, d$ のいづれか 2 つ 1
組は同じであるから
$ { Sigma^i \, Sigma^j } & = - 1 / 4 sum_(a \, b) sum_(c \, d) \( epsilon^(i a b) gamma^a gamma^b epsilon^(j c d) gamma^c gamma^d + epsilon^(j c d) gamma^c gamma^d epsilon^(i a b) gamma^a gamma^b \)\
 & = - 1 / 4 sum_(a \, b) sum_(c \, d) epsilon^(i a b) epsilon^(j c d) \( 1 + \( - 1 \)^3 \) gamma^a gamma^b gamma^c gamma^d\
 & = 0 $

$ \( bold(v) dot.op bold(Sigma) \)^2 & = \( v^i Sigma^i \) \( v^j Sigma^j \)^dagger = v^i Sigma^i Sigma^j \( v^j \)^dagger = delta^(i j) v^i \( v^j \)^dagger = bold(v)^2 $

== 非相対論的極限
<非相対論的極限>
ディラック表示のディラック方程式

非相対論的極限 $m c^2 arrow.r oo$
において、シュレーディンガー方程式に帰着する。
荷電粒子に対するクライン・ゴルドン方程式
$ \[ planck^2 D^2 + \( m c \)^2 \] psi \( x \) = 0 $
$ psi \( x \) = e^(- i \( m c^2 \) t \/ planck) phi \( x \) $
とおくと
$ frac(partial, partial t) psi \( x \) & = frac(m c^2, i planck) e^(- i \( m c^2 \) t \/ planck) phi \( x \) = frac(m c^2, i planck) psi \( x \) $
$ D_mu = partial_mu - frac(q, i planck) A_mu \( x \) & = frac(1, i planck) (p_mu - q A_mu \( x \)) = frac(1, i planck) (frac(i planck, c) frac(partial, partial t) - q / c phi.alt \( x \) \, bold(p) - q bold(A) \( x \))\
D^2 = D_mu D^mu & = - 1 / planck^2 [(frac(i planck, c) frac(partial, partial t) - q / c phi.alt \( x \))^2 - (bold(p) - q bold(A) \( x \))^2]\
\[ planck^2 D^2 + \( m c \)^2 \] psi \( x \) & = [\( bold(p) - q bold(A) \( x \) \)^2 - (frac(i planck, c) frac(partial, partial t) - q / c phi.alt \( x \))^2 + \( m c \)^2] psi \( x \)\
 & = [\( bold(p) - q bold(A) \( x \) \)^2 - (m c - q / c phi.alt \( x \))^2 + \( m c \)^2] psi \( x \)\
 & = [\( bold(p) - q bold(A) \( x \) \)^2 + 2 m q phi.alt \( x \) - (q / c phi.alt \( x \))^2] psi \( x \)\
 & = 2 m [- frac(q^2 phi.alt^2, 2 m c^2) + frac(\( bold(p) - q bold(A) \( x \) \)^2, 2 m) + q phi.alt \( x \)] psi \( x \) $
非相対論的極限 $m c^2 arrow.r oo$ のとき $phi.alt \( x \)$
は時間に依存しないからシュレーディンガー方程式となる。
$ i planck frac(partial, partial t) psi \( x \) & = (frac(\( bold(p) - q bold(A) \( x \) \)^2, 2 m) + q phi.alt) psi \( x \) $

== 双線型形式の変換性
<双線型形式の変換性>
ローレンツ変換 $S_Lambda$ の中で本義ローレンツ変換 $S_L$ と空間反転
$S_P$
$ S_L & = exp (- bold(eta) / 2 dot.op bold(alpha) + i bold(theta) / 2 dot.op bold(Sigma))\
S_P & = gamma^0 $
$ S_L^dagger & = exp (- bold(eta) / 2 dot.op bold(alpha) - i bold(theta) / 2 dot.op bold(Sigma))\
gamma^0 S_L^dagger gamma^0 & = exp (+ bold(eta) / 2 dot.op bold(alpha) - i bold(theta) / 2 dot.op bold(Sigma))\
S_L^(- 1) & = exp (+ bold(eta) / 2 dot.op bold(alpha) - i bold(theta) / 2 dot.op bold(Sigma)) $
より $S_L^dagger S_L eq.not 1$ となる。
$ psi^(' dagger) \( x' \) psi' \( x' \) = psi^dagger \( x \) S_L^dagger S_L psi \( x \) eq.not psi^dagger \( x \) psi \( x \) $

#block[
$ macron(psi) \( x \) := psi^dagger \( x \) gamma^0 $

]
$  & macron(psi)' \( x' \) = psi^(' dagger) \( x' \) gamma^0 = psi^dagger \( x \) S_L^dagger gamma^0 = psi^dagger \( x \) gamma^0 S_L^(- 1) = macron(psi) \( x \) S_L^(- 1)\
 & macron(psi)' \( x' \) psi' \( x' \) = psi^dagger \( x \) S_L^(- 1) S_L psi \( x \) = psi^dagger \( x \) psi \( x \) $
カイラリティ $gamma^5$ を次のように定義する。
$ gamma^5 := i gamma^0 gamma^1 gamma^2 gamma^3 $
$ \( gamma^5 \)^dagger & = - i \( - gamma^3 \) \( - gamma^2 \) \( - gamma^1 \) gamma^0 = i gamma^3 gamma^2 gamma^1 gamma^0 = i gamma^0 gamma^1 gamma^2 gamma^3 = gamma^5\
\( gamma^5 \)^2 & = - \( gamma^0 gamma^1 gamma^2 gamma^3 \) \( gamma^0 gamma^1 gamma^2 gamma^3 \)^dagger = - \( gamma^0 \)^2 \( gamma^1 \)^2 \( gamma^2 \)^2 \( gamma^3 \)^2 = 1\
{ gamma^mu \, gamma^5 } & = i \( gamma^mu gamma^0 gamma^1 gamma^2 gamma^3 + gamma^0 gamma^1 gamma^2 gamma^3 gamma^mu \) = i \( \( - 1 \)^mu + \( - 1 \)^(3 - mu) \) gamma^0 dots.h.c \( gamma^mu \)^2 dots.h.c gamma^3 = 0 $

$ macron(psi)' \( x \) gamma^5 psi' \( x \) & = psi^dagger \( x \) S_L^(- 1) gamma^5 S_L psi \( x \) = psi^dagger \( x \) gamma^5 psi \( x \)\
macron(psi)' \( x \) gamma^5 psi' \( x \) & = psi^dagger \( x \) S_P^(- 1) gamma^5 S_P psi \( x \) = - psi^dagger \( x \) gamma^5 psi \( x \) $

荷電粒子に対するディラック方程式
$ \( i planck gamma^mu D_mu - m c \) psi \( x \) = 0 $ を用いて,
軸性ベクトル
$j_A^mu \( x \) := macron(psi) \( x \) gamma^mu gamma^5 psi \( x \)$
の発散 $partial_mu j_A^mu \( x \)$ を計算し、微分を含まない形で表せ。
まず次の式が成り立つことを確認する。
$ gamma^0 gamma^mu gamma^5 & = gamma^0 gamma^0 gamma^5 + gamma^0 gamma^i gamma^5\
 & = gamma^0 gamma^0 gamma^5 - gamma^i gamma^0 gamma^5\
 & = \( gamma^mu \)^dagger gamma^0 gamma^5 $
よってディラック方程式より次のようになる。
$  & partial_mu j_A^mu \( x \)\
 & = partial_mu \( macron(psi) \( x \) gamma^mu gamma^5 psi \( x \) \)\
 & = partial_mu \( psi^dagger \( x \) gamma^0 gamma^mu gamma^5 psi \( x \) \)\
 & = \( partial_mu psi \( x \) \)^dagger gamma^0 gamma^mu gamma^5 psi \( x \) + psi^dagger \( x \) gamma^0 gamma^mu gamma^5 partial_mu psi \( x \)\
 & = \( gamma^mu partial_mu psi \( x \) \)^dagger gamma^0 gamma^5 psi \( x \) - psi^dagger \( x \) gamma^0 gamma^5 \( gamma^mu partial_mu psi \( x \) \)\
 & = (frac(1, i planck) (gamma^mu q A_mu \( x \) + m c) psi \( x \))^dagger gamma^0 gamma^5 psi \( x \) - psi^dagger \( x \) gamma^0 gamma^5 (frac(1, i planck) (gamma^mu q A_mu \( x \) + m c) psi \( x \))\
 & = - frac(1, i planck) (q A_mu \( x \) \( psi^dagger \( x \) \( gamma^mu \)^dagger gamma^0 gamma^5 psi + psi^dagger \( x \) gamma^0 gamma^5 gamma^mu psi \( x \) \) + 2 m c psi^dagger \( x \) gamma^0 gamma^5 psi \( x \))\
 & = - frac(1, i planck) (q A_mu \( x \) \( psi^dagger \( x \) gamma^0 gamma^mu gamma^5 psi - psi^dagger \( x \) gamma^0 gamma^mu gamma^5 psi \( x \) \) + 2 m c psi^dagger \( x \) gamma^0 gamma^5 psi \( x \))\
 & = - frac(2 m c, i planck) macron(psi) \( x \) gamma^5 psi \( x \) $

#block[
中心力ポテンシャル $V \( r \)$ を持つハミルトニアン
$hat(H) = c bold(alpha) dot.op hat(bold(p)) + beta m c^2 + V \( r \)$
を考える.

]
(1) $hat(H)$ と軌道角運動量 $hat(L) = bold(r) times hat(bold(p))$
との交換関係を求めよ。

$ \[ hat(H) \, hat(L)^i \] & = \[ c bold(alpha) dot.op hat(bold(p)) + beta m c^2 + V \( r \) \, epsilon^(i j k) r^j hat(p)^k \]\
 & = epsilon^(i j k) (c \[ alpha^mu hat(p)^mu \, r^j hat(p)^k \] + m c^2 \[ beta \, r^j hat(p)^k \] + \[ V \( r \) \, r^j hat(p)^k \])\
 & = epsilon^(i j k) (c alpha^mu \( p^mu r^j p^k - r^j p^k p^mu \) + m c^2 \( beta r^j p^k - r^j p^k beta \) + \( V \( r \) r^j p^k - r^j p^k V \( r \) \))\
 & = epsilon^(i j k) (c alpha^mu \( - i planck delta^(mu j) \) p^k + 0 + r^j \( - i planck partial^k V \( r \) \))\
 & = - i planck c epsilon^(i j k) alpha^j p^k - i planck (bold(r) times frac(upright(d) V, upright(d) r) frac(partial r, partial bold(r)))_i\
 & = - i planck c epsilon^(i j k) alpha^j p^k - i planck frac(upright(d) V, upright(d) r) (bold(r) times bold(r) / r)_i\
 & = - i planck c epsilon^(i j k) alpha^j p^k $ (2)
$Sigma^i := - i / 2 sum_(j \, k) epsilon^(i j k) alpha^j alpha^k$
とするとき、$hat(H)$ とスピン角運動量
$hat(bold(S)) = planck / 2 bold(Sigma)$ との交換関係を求めよ。

$ \[ hat(H) \, hat(S)^i \] & = [c bold(alpha) dot.op hat(bold(p)) + beta m c^2 + V \( r \) \, - frac(i planck, 4) epsilon^(i j k) alpha^j alpha^k]\
 & = - frac(i planck, 4) epsilon^(i j k) (c \[ alpha^mu \, alpha^j alpha^k \] p^mu + m c^2 \[ beta \, alpha^j alpha^k \] + \[ V \( r \) \, alpha^j alpha^k \])\
 & = - frac(i planck, 4) epsilon^(i j k) (c \( alpha^mu alpha^j alpha^k - alpha^j alpha^k alpha^mu \) p^mu + m c^2 \( beta alpha^j alpha^k - alpha^j alpha^k beta \) + 0)\
 & = - frac(i planck, 4) epsilon^(i j k) (c \( \( - alpha^j alpha^mu + 2 delta^(mu j) \) alpha^k - alpha^j \( - alpha^mu alpha^k + 2 delta^(k mu) \) \) p^mu + 0 + 0)\
 & = - frac(i planck c, 2) epsilon^(i j k) \( alpha^k p^j - alpha^j p^k \)\
 & = i planck c epsilon^(i j k) alpha^j p^k $ (3)
全角運動量が保存量となることを示せ。

全角運動量がハミルトニアンと交換するから保存量となる。
$ \[ hat(H) \, hat(J)^i \] & = \[ hat(H) \, hat(L)^i + hat(S)^i \] = 0 $

#block[
$bold(sigma)$ をパウリ行列として、任意のベクトル $bold(p)$ に対する 2 行
2 列の行列 $bold(sigma) dot.op bold(p)$ を考える。

]
(1) $\( bold(sigma) dot.op bold(p) \)^2$ を求めよ。

$ \( bold(sigma) dot.op bold(p) \)^2 & = \( sigma^i p^i \) \( sigma^j p^j \)^dagger\
 & = p^i p^j (delta^(i j) I + i epsilon^(i j k) sigma^k)\
 & = bold(p)^2 $ (2) $T r \( bold(sigma) dot.op bold(p) \)$ を求めよ。

$bold(p) = \( p^1 \, p^2 \, p^3 \)$ とすると
$ T r \( bold(sigma) dot.op bold(p) \) & = T r mat(delim: "(", p^3, p^1 - i p^2; p^1 + i p^2, - p^3) = 0 $
(3) $bold(sigma) dot.op bold(p)$ の固有値を求めよ。

$bold(sigma) dot.op bold(p)$ の固有値を $lambda_1 \, lambda_2$ とおくと
$ lambda_1 + lambda_2 & = T r \( bold(sigma) dot.op bold(p) \) = 0\
lambda_1^2 = lambda_2^2 & = \( bold(sigma) dot.op bold(p) \)^2 = bold(p)^2 $
よって固有値は $plus.minus \| bold(p) \|$ である。 (4)
$bold(p) := \| bold(p) \| \( sin theta cos phi.alt \, sin theta sin phi.alt \, cos theta \)$
とするとき、固有ベクトルを求めよ。

$ \( bold(sigma) dot.op bold(p) minus.plus \| bold(p) \| I \) bold(v) & = \| bold(p) \| mat(delim: "(", cos theta minus.plus 1, sin theta cos phi.alt - i sin theta sin phi.alt; sin theta cos phi.alt + i sin theta sin phi.alt, - cos theta minus.plus 1) bold(v)\
 & = \| bold(p) \| mat(delim: "(", cos theta minus.plus 1, sin theta e^(- i phi.alt); sin theta e^(i phi.alt), - cos theta minus.plus 1) bold(v) $
より固有値 $plus.minus \| bold(p) \|$
に対する固有ベクトルはそれぞれ次のベクトルの定数倍である。

$ bold(v) = vec(sin theta e^(- i phi.alt), - cos theta plus.minus 1) $

== 2次元時空におけるディラック方程式
<次元時空におけるディラック方程式>
ガンマ行列についても
$ gamma^0 = sigma_1 \, #h(2em) gamma^1 = i sigma_2 \, #h(2em) gamma^5 = - sigma_3 $
2次元時空におけるディラック方程式は次のように考えられる。
$ \( i planck gamma^mu partial_mu - m c \) psi \( x \) = 0 $
このときガンマ行列 $gamma^0 \, gamma^1$ は次を満たす。
$ { gamma^mu \, gamma^nu } = 2 g^(mu nu) \, #h(2em) \( gamma^0 \)^dagger = gamma^0 \, #h(2em) \( gamma^1 \)^dagger = - gamma^1 $
またカイラリティ $gamma^5$ は次を満たす。
$ \( gamma^5 \)^dagger = gamma^5 \, #h(2em) \( gamma^5 \)^2 = 1 \, #h(2em) { gamma^mu \, gamma^5 } = 0 $
カイラリティ $gamma^5$
がガンマ行列の複素数係数多項式で表されるとするとガンマ行列の性質より次のように書ける。
$ gamma^5 & = sum_(e_0 \, e_1) a_(e_0 \, e_1) \( gamma^0 \)^(e_0) \( gamma^1 \)^(e_1) = alpha_0 + alpha_1 gamma^0 + alpha_2 gamma^1 + alpha_3 gamma^0 gamma^1 & (a_(e_0 \, e_1) \, alpha_i in bb(C)) $
これを代入するとガンマ行列の直交性より
$ \( gamma^5 \)^dagger = gamma^5 & arrow.l.r.double alpha_0 in bb(R) \, alpha_1 in bb(R) \, alpha_2 in i bb(R) \, alpha_3 in bb(R)\
{ gamma^mu \, gamma^5 } = 0 & arrow.r.double.long alpha_0 = alpha_1 = alpha_2 = 0\
\( gamma^5 \)^2 = 1 & arrow.r.double.long alpha_4 = plus.minus 1 $
となる。よって $gamma^5 = plus.minus gamma^0 gamma^1$
となる。ここでは特に $gamma^5 = gamma^0 gamma^1$ とする。

#block[
$gamma_plus.minus = frac(1 plus.minus gamma^5, 2)$ とするとき
$\( gamma_(+) \)^a$, $\( gamma_(-) \)^b$,
$\( gamma_(+) \)^a \( gamma_(-) \)^b$,
$\( gamma_(-) \)^b \( gamma_(+) \)^a$ ($a \, b in bb(Z)_(> 0)$) を
$gamma_plus.minus$ を用いて表わせ。

]
$ \( gamma_plus.minus \)^2 & = frac(1 plus.minus 2 gamma^5 + \( gamma^5 \)^2, 2^2) = frac(1 plus.minus gamma^5, 2) = gamma_plus.minus\
gamma_(+) gamma_(-) & = gamma_(-) gamma_(+) = frac(1 + gamma^5 - gamma^5 - \( gamma^5 \)^2, 2^2) = 0 $
より帰納法から次が示せる。
$ \( gamma_(+) \)^a = gamma_(+) \, #h(2em) \( gamma_(-) \)^b = gamma_(-) \, #h(2em) \( gamma_(+) \)^a \( gamma_(-) \)^b = 0 \, #h(2em) \( gamma_(-) \)^b \( gamma_(+) \)^a = 0 $

#block[
$psi_plus.minus \( x \) = gamma_plus.minus psi \( x \)$ は $gamma^5$
の固有関数である。それぞれの固有値を求めよ。

]
カイラリティを作用させることで固有関数 $psi_plus.minus \( x \)$
の固有値は $plus.minus 1$ となる。
$ gamma^5 psi_plus.minus \( x \) & = gamma^5 gamma_plus.minus psi \( x \) = frac(gamma^5 plus.minus 1, 2) psi \( x \) = plus.minus gamma^5 psi \( x \) $

#block[
$psi_plus.minus \( x \)$
が満たす連立微分方程式をディラック方程式から求めよ。

]
${ gamma^mu \, gamma^5 } = 0$ より
$gamma^mu gamma_plus.minus = gamma_minus.plus gamma^mu$ となる。よって
$  & {gamma_(+) \( i planck gamma^mu partial_mu - m c \) psi \( x \) = 0\
gamma_(-) \( i planck gamma^mu partial_mu - m c \) psi \( x \) = 0\
\
arrow.l.r.double & {i planck gamma^mu partial_mu psi_(-) \( x \) = m c psi_(+) \( x \)\
i planck gamma^mu partial_mu psi_(+) \( x \) = m c psi_(-) \( x \)\
 $ となる。

#block[
$m = 0$ の場合に
$psi_(+) \( x \) prop e^(- i E t \/ planck + i p x \/ planck)$
が解となるとき、$E \, p$ が満たす関係式を求めよ。

]
$m = 0$ のとき $i planck gamma^mu partial_mu psi_(+) \( x \) = 0$
となる。 $gamma^1 = gamma^0 \( gamma_(+) - gamma_(-) \)$ より
$ i planck gamma^mu partial_mu psi_(+) \( x \) & = i planck \( gamma^0 c partial_t + gamma^1 partial_x \) psi_(+) \( x \)\
 & = \( gamma^0 E c - gamma^1 p \) psi_(+) \( x \)\
 & = gamma^0 \( E c - \( gamma_(+) - gamma_(-) \) p \) psi_(+) \( x \)\
 & = gamma^0 \( E c - p \) psi_(+) \( x \) = 0 $ となる。よって
$E c = p$ を満たす。

#block[
$m = 0$ の場合に
$psi_(-) \( x \) prop e^(- i E t \/ planck + i p x \/ planck)$
が解となるとき、$E \, p$ が満たす関係式を求めよ。

]
$m = 0$ のとき $i planck gamma^mu partial_mu psi_(-) \( x \) = 0$
となる。 $gamma^1 = gamma^0 \( gamma_(+) - gamma_(-) \)$ より
$ i planck gamma^mu partial_mu psi_(-) \( x \) & = i planck \( gamma^0 c partial_t + gamma^1 partial_x \) psi_(-) \( x \)\
 & = \( gamma^0 E c - gamma^1 p \) psi_(-) \( x \)\
 & = gamma^0 \( E c - \( gamma_(+) - gamma_(-) \) p \) psi_(-) \( x \)\
 & = gamma^0 \( E c + p \) psi_(-) \( x \) = 0 $ となる。よって
$E c = - p$ を満たす。

= 指数関数
<指数関数>
#block[
次の式を示せ。
$ e^(i hat(B)) bold(A) e^(- i hat(B)) = sum_(n = 0)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, bold(A) \] \] dots.h \] $

]
$e^(i lambda hat(B)) bold(A) e^(- i lambda hat(B))$
について考える。これを $lambda$ について展開すると
$ e^(i lambda hat(B)) bold(A) e^(- i lambda hat(B)) & = sum_(n = 0)^oo frac(lambda^n, n !) [frac(upright(d)^n, upright(d) lambda^n) e^(i lambda hat(B)) bold(A) e^(i lambda hat(B))]_(lambda = 0)\
 & = sum_(n = 0)^oo frac(lambda^n, n !) [frac(upright(d)^(n - 1), upright(d) lambda^(n - 1)) e^(i lambda hat(B)) i \[ hat(B) \, bold(A) \] e^(i lambda hat(B))]_(lambda = 0)\
 & = sum_(n = 0)^oo frac(lambda^n, n !) #scale(x: 180%, y: 180%)[\[] e^(i lambda hat(B)) i^n underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, bold(A) \] \] dots.h \] e^(i lambda hat(B)) #scale(x: 180%, y: 180%)[\]]_(lambda = 0)\
 & = sum_(n = 0)^oo frac(\( i lambda \)^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, bold(A) \] \] dots.h \] $
よって $lambda = 1$ を代入することで示せる。
$ e^(i hat(B)) bold(A) e^(- i hat(B)) & = sum_(n = 0)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, bold(A) \] \] dots.h \] $

#block[
$partial$
を微分演算子とするとき、$\( partial e^(i hat(B)) \) e^(- i hat(B)) = - e^(i hat(B)) \( partial e^(- i hat(B)) \)$
を示せ。

]
$1 = e^(i hat(B)) e^(- i hat(B))$ に微分演算子を作用させることで示せる。
$ 0 = partial 1 = partial \( e^(i hat(B)) e^(- i hat(B)) \) & = \( partial e^(i hat(B)) \) e^(- i hat(B)) + e^(i hat(B)) \( partial e^(- i hat(B)) \)\
\( partial e^(i hat(B)) \) e^(- i hat(B)) & = - e^(i hat(B)) \( partial e^(- i hat(B)) \) $

#block[
次の式を示せ。
$ e^(i hat(B)) \( partial e^(- i hat(B)) \) = - sum_(n = 1)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n - 1) \, partial hat(B) \] \] dots.h \] $

]
(1) において $bold(A) = partial$ を代入して示せる。
$ e^(i hat(B)) \( partial e^(- i hat(B)) \) & = sum_(n = 0)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, partial \] \] dots.h \]\
 & = partial + sum_(n = 1)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n) \, partial \] \] dots.h \]\
 & = - sum_(n = 1)^oo frac(i^n, n !) underbrace(\[ hat(B) \, dots.h \[ hat(B) \, \[ hat(B), n - 1) \, partial hat(B) \] \] dots.h \]\
 $

= スピノル球関数
<スピノル球関数>
#block[
スピノル球関数を球面調和関数を用いて次のように定義する。
$ cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = 1 / sqrt(2 l + 1) vec(sqrt(l + 1 / 2 plus.minus m) Y_l^(m - 1 \/ 2) \( theta \, phi.alt \), plus.minus sqrt(l + 1 / 2 minus.plus m) Y_l^(m + 1 \/ 2) \( theta \, phi.alt \), )_(j = l plus.minus 1 \/ 2) $
軌道角運動量 $hat(bold(L))$, スピン角運動量 $hat(bold(S))$, 全角運動量
$hat(bold(J))$ とする。

$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$
が持つパリティを求めよ。

]
球面調和関数におけるパリティは $\( - 1 \)^l$
となるからスピノル球関数のパリティは $\( - 1 \)^l$ となる。
$ Y_l^m \( pi - theta \, pi + phi.alt \) & = \( - 1 \)^l Y_l^m \( theta \, phi.alt \)\
cal(Y)_(j \, m)^plus.minus \( pi - theta \, pi + phi.alt \) & = \( - 1 \)^l cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ $hat(J)_z$
の固有値を求めよ。

]
球面調和関数における固有値からスピノル球関数の $hat(J)_z$ の固有値は
$m planck$ となる。
$ hat(J)_z Y_l^m \( theta \, phi.alt \) & = m planck Y_l^m \( theta \, phi.alt \)\
hat(J)_z cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = m planck cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ
$hat(bold(L))^2$ の固有値を求めよ。

]
球面調和関数における固有値からスピノル球関数の $hat(bold(L))^2$
の固有値は $planck^2 l \( l + 1 \)$ となる。
$ hat(bold(L))^2 Y_l^m \( theta \, phi.alt \) & = planck^2 l \( l + 1 \) Y_l^m \( theta \, phi.alt \)\
hat(bold(L))^2 cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = planck^2 l \( l + 1 \) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ
$hat(bold(L)) dot.op hat(bold(S))$ の固有値を求めよ。

]
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ に
$hat(bold(L)) dot.op hat(bold(S))$ を作用させると
$ hat(bold(L)) dot.op hat(bold(S)) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = 1 / 2 \( hat(bold(J))^2 - hat(bold(L))^2 - hat(bold(S))^2 \) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 / 2 (j \( j + 1 \) - l \( l + 1 \) - 3 / 4) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 / 2 ((l plus.minus 1 / 2) (l plus.minus 1 / 2 + 1) - l \( l + 1 \) - 3 / 4) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 / 2 (plus.minus (l + 1 / 2) - 1 / 2) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 $ より固有値は
$frac(planck^2 l, 2) \, - frac(planck^2 \( l + 1 \), 2)$
となる。

#block[
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ が持つ
$hat(bold(J))^2$ の固有値を求めよ。

]
$cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$ に $hat(bold(J))^2$
を作用させると
$ hat(bold(J))^2 cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = planck^2 j \( j + 1 \) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 (l plus.minus 1 / 2) ((l plus.minus 1 / 2) + 1) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)\
 & = planck^2 ((l plus.minus 1 / 2 + 1 / 2)^2 - 1 / 4) cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) $
より固有値は $l^2 - 1 / 4 \, \( l + 1 \)^2 - 1 / 4$ となる。

#block[
パウリ行列 $bold(sigma)$ と位置ベクトル
$bold(r) = r \( sin theta cos phi.alt \, sin theta sin phi.alt \, cos theta \)$
に対して
$bold(sigma) dot.op bold(r) / r cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \)$
を計算し、スピノル球関数のみを用いて表せ。

]
まず演算子を計算すると
$ bold(sigma) dot.op bold(r) / r & = bold(sigma) dot.op \( sin theta cos phi.alt \, sin theta sin phi.alt \, cos theta \) = mat(delim: "(", cos theta, sin theta e^(- i phi.alt); sin theta e^(i phi.alt), - cos theta) $
となる。三角関数を球面調和関数に作用させたときの固有値は次のようになるから
$ cos theta Y_l^m \( theta \, phi.alt \) & = sqrt(frac(\( l + m + 1 \) \( l - m + 1 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^m \( theta \, phi.alt \) + sqrt(frac(\( l + m \) \( l - m \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^m \( theta \, phi.alt \)\
sin theta e^(i phi.alt) Y_l^m \( theta \, phi.alt \) & = - sqrt(frac(\( l + m + 1 \) \( l + m + 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m + 1) \( theta \, phi.alt \) + sqrt(frac(\( l - m \) \( l - m - 1 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m + 1) \( theta \, phi.alt \)\
sin theta e^(- i phi.alt) Y_l^m \( theta \, phi.alt \) & = sqrt(frac(\( l - m + 1 \) \( l - m + 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m - 1) \( theta \, phi.alt \) + sqrt(frac(\( l + m \) \( l + m - 1 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m - 1) \( theta \, phi.alt \) $
次のように計算できる。
$ 3 bold(sigma) dot.op bold(r) / r cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = 1 / sqrt(2 l + 1) &  & mat(delim: "(", cos theta, sin theta e^(- i phi.alt); sin theta e^(i phi.alt), - cos theta) vec(sqrt(l + 1 / 2 plus.minus m) Y_l^(m - 1 \/ 2) \( theta \, phi.alt \), plus.minus sqrt(l + 1 / 2 minus.plus m) Y_l^(m + 1 \/ 2) \( theta \, phi.alt \), )_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 l + 1) &  & #scale(x: 300%, y: 300%)[\(] sqrt(l + 1 / 2 plus.minus m) cos theta Y_l^(m - 1 \/ 2) \( theta \, phi.alt \) plus.minus sqrt(l + 1 / 2 minus.plus m) sin theta e^(- i phi.alt) Y_l^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, sqrt(l + 1 / 2 plus.minus m) sin theta e^(i phi.alt) Y_l^(m - 1 \/ 2) \( theta \, phi.alt \) minus.plus sqrt(l + 1 / 2 minus.plus m) cos theta Y_l^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)]_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 l + 1) &  & #scale(x: 300%, y: 300%)[\(] sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l + m + 1 / 2 \) \( l - m + 3 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & + sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l + m - 1 / 2 \) \( l - m + 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & plus.minus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l - m + 1 / 2 \) \( l - m + 3 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & plus.minus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l + m + 1 / 2 \) \( l + m - 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, - sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l + m + 1 / 2 \) \( l + m + 3 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & + sqrt(l + 1 / 2 plus.minus m) sqrt(frac(\( l - m + 1 / 2 \) \( l - m - 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & minus.plus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l + m + 3 / 2 \) \( l - m + 1 / 2 \), \( 2 l + 1 \) \( 2 l + 3 \))) Y_(l + 1)^(m + 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & minus.plus sqrt(l + 1 / 2 minus.plus m) sqrt(frac(\( l + m + 1 / 2 \) \( l - m - 1 / 2 \), \( 2 l + 1 \) \( 2 l - 1 \))) Y_(l - 1)^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)]_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 l + 1) &  & #scale(x: 300%, y: 300%)[\(] \( 2 l + 1 \) sqrt(frac(l minus.plus m + 1 / 2 plus.minus 1, \( 2 l + 1 \) \( 2 l + 1 plus.minus 2 \))) Y_(l plus.minus 1)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, minus.plus \( 2 l + 1 \) sqrt(frac(l plus.minus m + 1 / 2 plus.minus 1, \( 2 l + 1 \) \( 2 l + 1 plus.minus 2 \))) Y_(l plus.minus 1)^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)]_(j = l plus.minus 1 \/ 2)\
 & = 1 / sqrt(2 j + 1 plus.minus 1) &  & #scale(x: 300%, y: 300%)[\(] sqrt(j + 1 / 2 minus.plus (m - 1 / 2)) Y_(j plus.minus 1 \/ 2)^(m - 1 \/ 2) \( theta \, phi.alt \)\
 &  &  & \, minus.plus sqrt(j + 1 / 2 plus.minus (m + 1 / 2)) Y_(j plus.minus 1 \/ 2)^(m + 1 \/ 2) \( theta \, phi.alt \) #scale(x: 300%, y: 300%)[\)] = cal(Y)_(j \, m)^minus.plus \( theta \, phi.alt \) $
よって次の式となる。
$ bold(sigma) dot.op bold(r) / r cal(Y)_(j \, m)^plus.minus \( theta \, phi.alt \) & = cal(Y)_(j \, m)^minus.plus \( theta \, phi.alt \) $

= 水素原子における電子のエネルギー準位
<水素原子における電子のエネルギー準位>
#block[
中心力ポテンシャル $V \( r \) = - frac(alpha planck c, r)$
のもとでディラック方程式を解くことにより得られる水素原子中の電子のエネルギー準位を考える。

主量子数 $n$ が与えられたとき、全角運動量 $j$ が取り得る値を答えよ。

]
$n$ と $j$ に関して $n = j + n' + 1 \/ 2$ という関係があるから
$j = 1 \/ 2 \, dots.h \, \( 2 n - 1 \) \/ 2$ を取る。

#block[
主量子数 $n$, 全角運動量 $j$
を持つ状態のエネルギー固有値の表式を書き下せ。また、そのエネルギー固有値の縮重度を答えよ。

]
主量子数 $n$, 全角運動量 $j$
を持つ状態のエネルギー固有値の表式は次のようになる。
$ E & = frac(m c^2, sqrt(1 + frac(\( Z alpha \)^2, (n - (j + 1 / 2) + sqrt(\( j + 1 / 2 \)^2 - \( Z alpha \)^2))^2))) $
また縮重度は $j = l plus.minus 1 \/ 2$ より $n' = 0$ において
$2 j + 1$、$n' > 0$ において $2 \( 2 j + 1 \)$ となる。

#block[
主量子数 $n$ を持つ状態の総数を求めよ。

]
$n = j + n' + 1 \/ 2$ と $j = l plus.minus 1 \/ 2$ より状態の総数は
$2 n^2$ となる。
$ 2 n + 2 times sum_(n' = 1)^(n - 1) 2 \( n - n' \) & = 2 n^2 $

#block[
電子の静止エネルギーから測った束縛エネルギーの大きさが縮退を除いて 7
番目と 10 番目に大きい準位の主量子数 $n$ と全角運動量 $j$
をそれぞれ答えよ。また、それらの準位の束縛エネルギーの大きさを有効数字 6
桁で求めよ。

]
7 番目に大きい準位は $n = 4 \, j = 1 \/ 2$ で 10 番目に大きい準位は
$n = 4 \, j = 7 \/ 2$ である。 またそれぞれの束縛エネルギーは
$ cal(E) & approx - frac(alpha^2 m c^2, 2 n^2) - (frac(1, j + 1 \/ 2) - frac(3, 4 n)) frac(alpha^4 m c^2, 2 n^3)\
 & approx - 13.60569 / n^2 - (frac(1, j + 1 \/ 2) - frac(3, 4 n)) frac(7.249022 times 10^(- 4), n^3)\
cal(E)_(4 \, 1 \/ 2) & approx 0.850365\
cal(E)_(4 \, 7 \/ 2) & approx 0.850356 $ となる。

#block[
同じ主量子数 $n$ を持つ状態でも全角運動量 $j$
に依存してエネルギー準位が分裂する. この現象を表す名称を答えよ.

]
微細構造
