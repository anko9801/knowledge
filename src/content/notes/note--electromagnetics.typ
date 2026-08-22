#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "電磁気学",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/electromagnetics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 真空中の電磁気学
<真空中の電磁気学>
電場 $bold(E)$ と磁束密度 $bold(B)$

== Maxwell 方程式
<maxwell-方程式>
#definition("Maxwell 方程式")[
電場 $bold(E)$
と磁束密度 $bold(B)$ に対して次のような式が成り立つ。
$  & integral_(partial V) bold(E) dot.op bold(n) thin upright(d) S = 1 / epsilon_0 integral_V rho thin upright(d) V &  & arrow.l.r.double upright(bold(nabla)) dot.op bold(E) = rho / epsilon_0\
 & integral_(partial V) bold(B) dot.op bold(n) thin upright(d) S = 0 &  & arrow.l.r.double upright(bold(nabla)) dot.op bold(B) = 0\
 & integral_(partial S) bold(E) dot.op thin upright(d) bold(l) = - frac(upright(d), upright(d) t) integral_S bold(B) dot.op bold(n) thin upright(d) S &  & arrow.l.r.double upright(bold(nabla)) times bold(E) = - frac(partial bold(B), partial t)\
 & c^2 integral_(partial S) bold(B) dot.op thin upright(d) bold(l) = 1 / epsilon_0 integral_S bold(j) dot.op bold(n) thin upright(d) S + frac(upright(d), upright(d) t) integral_S bold(E) dot.op bold(n) thin upright(d) S &  & arrow.l.r.double upright(bold(nabla)) times bold(B) = mu_0 bold(j) + 1 / c^2 frac(partial bold(E), partial t) $<Ampere>
ただし電荷密度 $rho \( t \, bold(r) \) = q n$, 電流密度
$bold(j) \( t \, bold(r) \) = q n bold(v)$ とする。
$ c = 1 / sqrt(epsilon_0 mu_0) $
]
#definition("Lorentz 力")[
電荷 $q$
の質点が電磁場から受ける力は次のように表される。
$ bold(F) & = q \( bold(E) + bold(v) times bold(B) \) $
一般に次のように表される。
$ bold(F) & = rho bold(E) + bold(j) times bold(B) $
]
これらの法則で電磁気学が完結する。

== 保存則
<保存則>
#theorem("電荷の保存則")[
連続の方程式を満たし、電荷は保存する。
$ frac(partial rho, partial t) + upright(bold(nabla)) dot.op bold(j) = 0 $
]
#proof[
式 @Ampere
の両辺の発散を計算することで連続の方程式を導出する。$upright(bold(nabla)) dot.op \( upright(bold(nabla)) times bold(B) \) = 0$
より
$ upright(bold(nabla)) dot.op \( upright(bold(nabla)) times bold(B) \) & = upright(bold(nabla)) dot.op (mu_0 bold(j) + 1 / c^2 frac(partial bold(E), partial t))\
 & = mu_0 upright(bold(nabla)) dot.op bold(j) + 1 / c^2 frac(partial, partial t) upright(bold(nabla)) dot.op bold(E)\
 & = upright(bold(nabla)) dot.op bold(j) + frac(partial rho, partial t) = 0 $
連続の方程式の両辺を空間微分することで電荷が保存することが分かる。
$  & frac(upright(d), upright(d) t) integral_V rho thin upright(d) V + integral_(partial V) bold(j) dot.op thin upright(d) bold(S) = 0 $
]

#theorem("磁荷の存在")[
磁荷は存在しない。
]
#proof[
磁場中のガウスの法則より湧き出し源がない、つまり単極の磁荷が存在しないことが分かる。
]

#theorem("エネルギー保存則")[
真空中での電磁場のエネルギー密度 $u_(E M) \( bold(r) \, t \)$
とローレンツ力の仕事率 $u_m \( bold(r) \, t \)$ の和を
$u \( bold(r) \, t \)$ とし、エネルギー流密度を
$bold(S) \( bold(r) \, t \)$ として次の連続の方程式を満たす。
$ frac(partial u, partial t) + upright(bold(nabla)) dot.op bold(S) & = 0 $
]
#proof[
まず $u_(E M)$, $u_m$, $bold(S)$ についてそれぞれ
$ u_(E M) & = epsilon_0 / 2 bold(E)^2 + frac(1, 2 mu_0) bold(B)^2\
frac(partial u_m, partial t) & = bold(F) dot.op bold(v) = \( rho bold(E) + bold(j) times bold(B) \) dot.op bold(v) = bold(j) dot.op bold(E)\
bold(S) \( bold(r) \) & = 1 / mu_0 bold(E) times bold(B) $
より連続の方程式を満たす。
$ frac(partial u, partial t) & = frac(partial, partial t) (epsilon_0 / 2 bold(E)^2 + frac(1, 2 mu_0) bold(B)^2) + bold(j) dot.op bold(E)\
 & = bold(E) dot.op epsilon_0 frac(partial bold(E), partial t) + bold(B) / mu_0 dot.op frac(partial bold(B), partial t) + bold(j) dot.op bold(E)\
 & = bold(E) dot.op (1 / mu_0 upright(bold(nabla)) times bold(B) - bold(j)) + bold(B) / mu_0 dot.op \( - upright(bold(nabla)) times bold(E) \) + bold(j) dot.op bold(E)\
 & = 1 / mu_0 (bold(E) dot.op (upright(bold(nabla)) times bold(B)) - bold(B) dot.op \( upright(bold(nabla)) times bold(E) \))\
 & = - 1 / mu_0 upright(bold(nabla)) dot.op \( bold(E) times bold(B) \) = - upright(bold(nabla)) dot.op bold(S) $
連続の方程式の両辺を空間微分することでエネルギーが保存することが分かる。
$ frac(upright(d), upright(d) t) integral u thin upright(d) V + integral_S bold(S) dot.op bold(n) thin upright(d) S & = 0 $
]

#definition("Poynting ベクトル")[
エネルギーの流れの密度, 単位時間に単位面積を通過するエネルギー
$ bold(S) \( bold(r) \) & = 1 / mu_0 bold(E) times bold(B) $
]
#theorem("運動量保存則")[
運動量密度 $g_j$
と Maxwell の応力テンソル $T_(i j)$
の反作用を電磁場の運動量流密度と考えると連続の方程式は次のようになる。
$ frac(partial bold(g), partial t) - upright(bold(nabla)) dot.op bold(T) & = 0 #h(2em) \( \( upright(bold(nabla)) dot.op bold(T) \)_j = partial_i T_(i j) \) $
つまりローレンツ力の反作用が電磁場の運動量の時間変化となる。
]
#proof[
物質の運動量密度
$bold(g)_m \( bold(r) \, t \)$、電磁場の運動量密度
$bold(g)_(E M) \( bold(r) \, t \)$、マクスウェルの応力テンソル $T_(i j)$
は次の条件を満たす。
$ frac(partial bold(g)_m, partial t) & = rho bold(E) + bold(j) times bold(B)\
bold(g)_(E M) & = epsilon_0 bold(E) times bold(B)\
T_(i j) & = epsilon_0 E_i E_j + 1 / mu_0 B_i B_j - delta_(i j) u_(E M)\
T_(i j)^(\( E \)) & = epsilon_0 mat(delim: "(", E_x^2 - 1 / 2 \| bold(E) \|^2, E_x E_y, E_x E_z; E_x E_y, E_x^2 - 1 / 2 \| bold(E) \|^2, E_x E_z; E_x E_y, E_x E_z, E_x^2 - 1 / 2 \| bold(E) \|^2) $
これより
$ frac(partial g_j, partial t) & = rho E_j + epsilon_(j i k) j_i B_k + frac(partial, partial t) \( epsilon_0 epsilon_(j i k) E_i B_k \)\
 & = \( epsilon_0 partial_i E_i \) E_j + epsilon_(j i k) (1 / mu_0 epsilon_(i l m) partial_l B_m - epsilon_0 frac(partial E_i, partial t)) B_k + epsilon_0 epsilon_(j i k) (frac(partial E_i, partial t) B_k + E_i frac(partial B_k, partial t))\
 & = epsilon_0 \( partial_i E_i \) E_j + 1 / mu_0 epsilon_(j i k) epsilon_(i l m) \( partial_l B_m \) B_k - epsilon_0 epsilon_(j i k) E_i (epsilon_(k l m) partial_l E_m)\
 & = epsilon_0 \( partial_i E_i \) E_j + 1 / mu_0 \( \( partial_i B_j \) B_i - \( partial_j B_i \) B_i \) - epsilon_0 \( E_i \( partial_j E_i \) - E_i \( partial_i E_j \) \)\
 & = partial_i (epsilon_0 E_i E_j + 1 / mu_0 B_i B_j) - partial_j (frac(1, 2 mu_0) B_i^2 + 1 / 2 epsilon_0 E_i^2) #h(2em) \( because partial_i B_i = 0 \)\
 & = partial_i T_(i j) $
連続の方程式の両辺を空間微分することで運動量が保存することが分かる。
$ frac(upright(d), upright(d) t) integral bold(g) thin upright(d) V & = integral_S T_(i j) dot.op bold(n) thin upright(d) S $
]

#theorem("角運動量保存則")[
$ frac(partial bold(L), partial t) + upright(bold(nabla)) dot.op bold(M) = 0 $
]
#proof[
$ bold(L)_(E M) & = bold(r) times bold(g)_(E M) = epsilon_0 bold(r) times \( bold(E) times bold(B) \)\
bold(L)_m & = bold(r) times bold(g)_m\
bold(M) & = bold(T) times bold(r) $
$ frac(partial bold(L), partial t) & = bold(r) times frac(partial, partial t) (bold(g)_(E M) + bold(g)_m) = bold(r) times \( upright(bold(nabla)) dot.op bold(T) \)\
 & = upright(bold(nabla)) dot.op \( bold(T) times bold(r) \)\
 & = upright(bold(nabla)) dot.op bold(M) $
]

== 電磁ポテンシャルとゲージ変換
<電磁ポテンシャルとゲージ変換>
#definition("電磁ポテンシャル")[
次を満たす $phi.alt$, $bold(A)$ が存在し、$phi.alt$ を電位、$bold(A)$
をベクトルポテンシャルという。
$ bold(E) & = - upright(bold(nabla)) phi.alt - frac(partial bold(A), partial t)\
bold(B) & = upright(bold(nabla)) times bold(A) $
]
#proof[
Maxwell 方程式に代入すると well-defined
性を満たすことが分かる。
$ upright(bold(nabla)) dot.op bold(B) & = upright(bold(nabla)) dot.op \( upright(bold(nabla)) times bold(A) \) = 0\
upright(bold(nabla)) times bold(E) + frac(partial bold(B), partial t) & = upright(bold(nabla)) times (bold(E) + frac(partial bold(A), partial t)) = upright(bold(nabla)) times (- upright(bold(nabla)) phi.alt) = 0 $
]

#theorem[
Maxwell
の方程式は電磁ポテンシャルを用いて次のように表される。
$  & - nabla^2 phi.alt - frac(partial, partial t) \( upright(bold(nabla)) dot.op bold(A) \) = rho / epsilon_0\
 & - nabla^2 bold(A) + upright(bold(nabla)) (1 / c^2 frac(partial phi.alt, partial t) + upright(bold(nabla)) dot.op bold(A)) + 1 / c^2 frac(partial^2 bold(A), partial t^2) = mu_0 bold(j) $
]
#proof[
Maxwell
の方程式に電磁ポテンシャルを代入すると次のようになる。
$ {upright(bold(nabla)) dot.op bold(E) = rho / epsilon_0\
upright(bold(nabla)) dot.op bold(B) = 0\
upright(bold(nabla)) times bold(E) = - frac(partial bold(B), partial t)\
upright(bold(nabla)) times bold(B) = mu_0 bold(j) + 1 / c^2 frac(partial bold(E), partial t) arrow.l.r.double {bold(E) = - upright(bold(nabla)) phi.alt - frac(partial bold(A), partial t)\
bold(B) = upright(bold(nabla)) times bold(A)\
- nabla^2 phi.alt - frac(partial, partial t) \( upright(bold(nabla)) dot.op bold(A) \) = rho / epsilon_0\
(1 / c^2 frac(partial^2, partial t^2) - nabla^2) bold(A) + upright(bold(nabla)) (1 / c^2 frac(partial phi.alt, partial t) + upright(bold(nabla)) dot.op bold(A)) = mu_0 bold(j) $
]

#theorem("ゲージ変換")[
任意の関数
$chi \( bold(r) \, t \)$ として次のゲージ変換は不変に保つ。
$ bold(A) & arrow.r bold(A) + upright(bold(nabla)) chi\
phi.alt & arrow.r phi.alt - frac(partial chi, partial t) $
]
#proof[
電磁場に代入すると不変に保つことがわかる。
$ bold(E) & = - upright(bold(nabla)) (phi.alt - frac(partial chi, partial t)) - frac(partial, partial t) \( bold(A) + upright(bold(nabla)) chi \)\
 & = - upright(bold(nabla)) phi.alt + upright(bold(nabla)) frac(partial chi, partial t) - frac(partial bold(A), partial t) - frac(partial, partial t) upright(bold(nabla)) chi\
 & = - upright(bold(nabla)) phi.alt - frac(partial bold(A), partial t)\
bold(B) & = upright(bold(nabla)) times \( bold(A) + upright(bold(nabla)) chi \)\
 & = upright(bold(nabla)) times bold(A) + upright(bold(nabla)) times upright(bold(nabla)) chi\
 & = upright(bold(nabla)) times bold(A) $
]

#definition("ゲージ")[
元々の電磁ポテンシャルに対して適切に $chi$
を選んでゲージ変換後の電磁ポテンシャルが満たすゲージという。
次の条件を満たすゲージをクーロンゲージ (Coulomb gauge)
と呼び、主に電磁気学で用いられる。
$ upright(bold(nabla)) dot.op bold(A) = 0 $
次の条件を満たすゲージをローレンツゲージ (Lorenz gauge)
と呼び、主に相対性理論で用いられる。
$ 1 / c^2 frac(partial phi.alt, partial t) + upright(bold(nabla)) dot.op bold(A) = 0 $
]
#proposition[
任意の状況においてクーロンゲージは存在し、静電磁場において次が成り立つ。
$ phi.alt \( bold(r) \) & = frac(1, 4 pi epsilon_0) integral_V frac(rho \( bold(r)' \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)'\
bold(A) \( bold(r) \) & = frac(mu_0, 4 pi) integral_V frac(bold(j) \( bold(r)' \, t \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)' $
]
#proof[
任意の電磁ポテンシャル $\( phi.alt \, bold(A) \)$
に対してゲージ変換し
$display(\( phi.alt - frac(partial chi, partial t) \, bold(A) + upright(bold(nabla)) chi \))$
がクーロンゲージを満たすような $chi$ の表式は次のようになる。
$ nabla^2 chi & = - upright(bold(nabla)) dot.op bold(A) arrow.l.r.double chi \( bold(r) \, t \) = frac(1, 4 pi) integral_V frac(upright(bold(nabla))_(bold(r)') dot.op bold(A) \( bold(r)' \, t \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)' $
これよりクーロンゲージは存在する。クーロンゲージにおいて静電磁場における
Maxwell 方程式に代入すると
$ - nabla^2 phi.alt = rho / epsilon_0 & arrow.l.r.double phi.alt \( bold(r) \) = frac(1, 4 pi epsilon_0) integral_V frac(rho \( bold(r)' \, t \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)'\
- nabla^2 bold(A) = mu_0 bold(j) & arrow.l.r.double bold(A) \( bold(r) \) = frac(mu_0, 4 pi) integral_V frac(bold(j) \( bold(r)' \, t \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)' $
より電磁ポテンシャルは電荷と電流により求められることが分かる。
]

#proposition[
任意の状況においてローレンツゲージは存在し、電磁ポテンシャルについて次の微分方程式が成り立つ。
$ (1 / c^2 frac(partial^2, partial t^2) - nabla^2) phi.alt & = rho / epsilon_0\
(1 / c^2 frac(partial^2, partial t^2) - nabla^2) bold(A) & = mu_0 bold(j) $
]
#proof[
任意の電磁ポテンシャル $\( phi.alt \, bold(A) \)$
に対してゲージ変換し
$display(\( phi.alt - frac(partial chi, partial t) \, bold(A) + upright(bold(nabla)) chi \))$
がローレンツゲージを満たすような $chi$ の条件は次のようになる。
$ (1 / c^2 frac(partial^2, partial t^2) - nabla^2) chi = 1 / c^2 frac(partial phi.alt, partial t) + upright(bold(nabla)) dot.op bold(A) $
また Maxwell
の方程式に代入することで電磁ポテンシャルは次の微分方程式を満たす。
$ (1 / c^2 frac(partial^2, partial t^2) - nabla^2) phi.alt & = rho / epsilon_0\
(1 / c^2 frac(partial^2, partial t^2) - nabla^2) bold(A) & = mu_0 bold(j) $
]

#block[
静電磁場まとめ
静電磁場では電荷と電流を用いて電磁ポテンシャルと電磁場が次のように分かる。
$ phi.alt \( bold(r) \) & = frac(1, 4 pi epsilon_0) integral_V frac(rho \( bold(r)' \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)'\
bold(A) \( bold(r) \) & = frac(mu_0, 4 pi) integral_V frac(bold(j) \( bold(r)' \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)'\
bold(E) \( bold(r) \) & = - upright(bold(nabla)) phi.alt\
bold(B) \( bold(r) \) & = upright(bold(nabla)) times bold(A) $

]
== 遅延ポテンシャル
<遅延ポテンシャル>
== さまざまな環境
<さまざまな環境>
#theorem("Coulomb 力")[
点電荷 $Q$ を $bold(r)'$
に配置したときに位置 $bold(r)$ での電位と電場、点電荷 $q$
に及ぼす力は次のようになる。
$ phi.alt \( bold(r) \) & = frac(Q, 4 pi epsilon_0) frac(1, \| bold(r) - bold(r)' \|)\
bold(E) \( bold(r) \) & = frac(Q, 4 pi epsilon_0) frac(bold(r) - bold(r)', \| bold(r) - bold(r)' \|^3)\
bold(F) \( bold(r) \) & = frac(Q q, 4 pi epsilon_0) frac(bold(r) - bold(r)', \| bold(r) - bold(r)' \|^3) $
]
#proof[
$ phi.alt \( bold(r) \) & = frac(1, 4 pi epsilon_0) integral_V frac(rho \( bold(r)' \), \| bold(r) - bold(r)' \|) thin upright(d) bold(r)' = frac(1, 4 pi epsilon_0) frac(Q, \| bold(r) - bold(r)' \|)\
bold(E) \( bold(r) \) & = - upright(bold(nabla)) phi.alt = frac(Q, 4 pi epsilon_0) frac(bold(r) - bold(r)', \| bold(r) - bold(r)' \|^3)\
bold(F) \( bold(r) \) & = q bold(E) = frac(Q q, 4 pi epsilon_0) frac(bold(r) - bold(r)', \| bold(r) - bold(r)' \|^3) $
]

#theorem("電気双極子")[
点電荷 $+ Q \, - Q$
をそれぞれ $bold(r)' + bold(d) \/ 2 \, bold(r)' - bold(d) \/ 2$
に配置したときに位置 $bold(r)$ での電位と電場は次のようになる。
$ phi.alt \( bold(r) \) & = frac(1, 4 pi epsilon_0) frac(bold(p) dot.op \( bold(r) - bold(r)' \), \| bold(r) - bold(r)' \|^3)\
bold(E) \( bold(r) \) & = frac(1, 4 pi epsilon_0) frac((3 bold(p) dot.op \( bold(r) - bold(r)' \)) \( bold(r) - bold(r)' \) - \( bold(r) - bold(r)' \)^2 bold(p), \| bold(r) - bold(r)' \|^5) $
ただし、電気双極子モーメントを $bold(p) = Q bold(d)$ とおく。
]
#proof[
$ phi.alt \( bold(r) \) & = frac(1, 4 pi epsilon_0) (frac(Q, \| bold(r) - bold(r)' - bold(d) \/ 2 \|) - frac(Q, \| bold(r) - bold(r)' + bold(d) \/ 2 \|))\
 & = frac(Q, 4 pi epsilon_0) (upright(bold(nabla))' frac(1, \| bold(r) - bold(r)' \|)) dot.op bold(d)\
 & = frac(1, 4 pi epsilon_0) frac(bold(p) dot.op \( bold(r) - bold(r)' \), \| bold(r) - bold(r)' \|^3)\
bold(E) \( bold(r) \) & = - upright(bold(nabla)) phi.alt \( bold(r) \)\
 & = frac(1, 4 pi epsilon_0) frac((3 bold(p) dot.op \( bold(r) - bold(r)' \)) \( bold(r) - bold(r)' \) - \( bold(r) - bold(r)' \)^2 bold(p), \| bold(r) - bold(r)' \|^5) $
$ phi.alt \( r \, theta \) & = frac(p cos theta, 4 pi epsilon_0 r^2)\
bold(E) \( r \, theta \, phi \) & = - nabla phi.alt \( r \, theta \)\
 & = (- frac(partial phi.alt, partial r) \, - 1 / r frac(partial phi.alt, partial theta) \, - frac(1, r sin theta) frac(partial phi.alt, partial phi))\
 & = (frac(p cos theta, 2 pi epsilon_0 r^3) \, frac(p sin theta, 4 pi epsilon_0 r^3) \, 0)\
 $
]

#theorem("電気双極子放射")[

]
#theorem("電気四重極子")[

]
#theorem("ビオ・サバールの法則")[
$ thin upright(d) bold(B) \( bold(r) \) & = frac(mu_0, 4 pi) frac(I thin upright(d) s times \( bold(r) - bold(r)' \), \| bold(r) - bold(r)' \|^3) $
]
#proposition("ソレノイド")[

]
= 真空中の電磁波
<真空中の電磁波>
== 電磁波の基礎
<電磁波の基礎>
#proposition[
$rho = 0$, $bold(j) = bold(0)$ において
$bold(E) \, bold(B)$ は波動方程式を満たす。
$ nabla^2 bold(E) = 1 / c^2 frac(partial^2, partial t^2) bold(E)\
nabla^2 bold(B) = 1 / c^2 frac(partial^2, partial t^2) bold(B) $
]
#proof[
$nabla times \( nabla times bold(E) \)$ を Maxwell
方程式を用いて 2 通りに計算する。$rho = 0$, $bold(j) = bold(0)$
より示せる。
$ nabla times \( nabla times bold(E) \) & = nabla \( nabla dot.op bold(E) \) - nabla^2 bold(E)\
 & = 1 / epsilon_0 nabla rho - nabla^2 bold(E)\
nabla times \( nabla times bold(E) \) & = nabla times (- frac(partial bold(B), partial t))\
 & = - frac(partial, partial t) (mu_0 bold(j) + 1 / c^2 frac(partial bold(E), partial t))\
 & = - mu_0 frac(partial bold(j), partial t) - 1 / c^2 frac(partial^2, partial t^2) bold(E)\
nabla^2 bold(E) & = 1 / c^2 frac(partial^2, partial t^2) bold(E) $
磁場に関しても同様にして計算すると
$ nabla times \( nabla times bold(B) \) & = nabla \( nabla dot.op bold(B) \) - nabla^2 bold(B)\
 & = - nabla^2 bold(B)\
nabla times \( nabla times bold(B) \) & = nabla times (mu_0 bold(j) + 1 / c^2 frac(partial bold(E), partial t))\
 & = mu_0 nabla times bold(j) + 1 / c^2 frac(partial, partial t) (- frac(partial bold(B), partial t))\
 & = mu_0 nabla times bold(j) - 1 / c^2 frac(partial^2, partial t^2) bold(B)\
nabla^2 bold(B) & = 1 / c^2 frac(partial^2, partial t^2) bold(B) $
]

#theorem("電磁波の複素数表現")[
真空中に伝搬する電磁波の複素数解は波数 $bold(k) in bb(R)^3$
を用いて次のように表される。
$ bold(E) \( t \, bold(r) \) & = integral_(bb(R)^3) thin upright(d) bold(k) bold(E)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
bold(B) \( t \, bold(r) \) & = integral_(bb(R)^3) thin upright(d) bold(k) bold(B)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $
ただし電磁波の分散関係は光速度 $c$ を用いて
$omega \( bold(k) \) = c \| bold(k) \|$ と与えられ、振動方向
$bold(E)_0 \( bold(k) \) in bb(C)^2$ は進行方向 $bold(k)$ と直交する。
なお、物理的な電磁場はそれらの複素表現の実部を取ることで求められる。$bold(E)_0$
は複素数であることに注意する。
]
#proof[
波動方程式に代入して成り立つことを示す。
$ nabla^2 bold(E) & = nabla^2 integral_(bb(R)^3) thin upright(d) bold(k) bold(E)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = integral_(bb(R)^3) thin upright(d) bold(k) bold(E)_0 \( bold(k) \) \( - \| bold(k) \|^2 \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = 1 / c^2 integral_(bb(R)^3) thin upright(d) bold(k) bold(E)_0 \( bold(k) \) \( - omega^2 \( bold(k) \) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = 1 / c^2 frac(partial^2, partial t^2) integral_(bb(R)^3) thin upright(d) bold(k) bold(E)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = 1 / c^2 frac(partial^2, partial t^2) bold(E) $
磁束密度も同様にして示せる。
]

電磁波の複素数表示について

#theorem("電磁波のエネルギー")[
電磁波のエネルギー密度と Poynting ベクトル
$ chevron.l u_(e m) chevron.r & = 1 / 2 epsilon_0 \| bold(E)_0 \|^2\
chevron.l bold(S) chevron.r & = accent(epsilon, macron) c hat(bold(k)) $
]
#proof[
$ Re bold(E) & = bold(E)_0 cos \( bold(k) dot.op bold(r) - omega t \)\
Re bold(B) & = 1 / omega \( bold(k) times bold(E)_0 \) cos \( bold(k) dot.op bold(r) - omega t \) $
これより電磁場のエネルギー密度は
$ u_e & = epsilon_0 / 2 \| Re bold(E) \|^2 = epsilon_0 / 2 lr(|bold(E)_0 cos \( bold(k) dot.op bold(r) - omega t \)|)^2 = epsilon_0 / 2 lr(|bold(E)_0|)^2 cos^2 \( bold(k) dot.op bold(r) - omega t \)\
u_m & = frac(1, 2 mu_0) \| Re bold(B) \|^2 = frac(1, 2 mu_0) lr(|1 / omega \( bold(k) times bold(E)_0 \) cos \( bold(k) dot.op bold(r) - omega t \)|)^2 = epsilon_0 / 2 lr(|bold(E)_0|)^2 cos^2 \( bold(k) dot.op bold(r) - omega t \)\
u_(e m) & = epsilon_0 lr(|bold(E)_0|)^2 cos^2 \( bold(k) dot.op bold(r) - omega t \) $
時間平均を取ると
$ 3 chevron.l u_e chevron.r & = 1 / 4 epsilon_0 \| bold(E)_0 \|^2 \, #h(2em) chevron.l u_m chevron.r = 1 / 4 epsilon_0 \| bold(E)_0 \|^2 \, #h(2em) chevron.l u_(e m) chevron.r = 1 / 2 epsilon_0 \| bold(E)_0 \|^2 $
$ bold(S) & = 1 / mu_0 Re bold(E) times Re bold(B) = frac(1, 2 mu_0) lr(|1 / omega \( bold(k) times bold(E)_0 \) cos \( bold(k) dot.op bold(r) - omega t \)|)^2 $
]

#theorem("電磁波の運動量")[
$ chevron.l bold(g) chevron.r = 1 / c^2 chevron.l bold(S) chevron.r = frac(epsilon_0 \| bold(E)_0 \|^2, 2 c) hat(bold(k)) $
]
#proof[

]

#block[
電磁波まとめ $bold(k)$ について波長 $bb(R)$ と球面のさまざまな方向 $S^2$
での電磁波の和を取ったものが電磁波全体となる。
$ bold(E) \( t \, bold(r) \) & = integral_(bb(R)^3) thin upright(d) bold(k) bold(E)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
bold(B) \( t \, bold(r) \) & = integral_(bb(R)^3) thin upright(d) bold(k) bold(B)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $

]
== 電磁波の伝搬
<電磁波の伝搬>
#theorem("Helmholtz 方程式")[
$ \( nabla^2 + k^2 \) bold(E) & = 0\
\( nabla^2 + k^2 \) bold(B) & = 0 $
]
#theorem("平行導体板")[

]
#theorem("導波管内を伝搬する電磁波")[

]
#theorem("円形断面の導波管内を伝搬する電磁波")[

]
#theorem("直方形型の導波管内を伝搬する電磁波")[

]
== 電磁波の回折
<電磁波の回折>
#theorem("Kirchhoff の積分表示")[

]
#theorem("Fresnel-Kirchhoff の回折積分の公式")[

]
#theorem("Fraunhofer 回折")[

]
#theorem("Fresnel 回折")[

]
= 物質中の電磁気学
<物質中の電磁気学>
現象論になりがち

== 導体の電磁気学
<導体の電磁気学>
#definition("導体")[
時間が経つと

+ 導体内部に電場は存在しない。

+ 導体内部に電荷はなく、表面のみに電荷が分布する。

等電位面、誘導電荷 導体全体で電位は一定、
]
#theorem[
$ E = sigma / epsilon_0 $
]
#proposition("一様に分極した誘電体球の分極電場")[

]
#proposition("一様に分極した回転楕円体形状の誘電体の分極電場")[

]
#theorem("静電誘導")[

]
#proposition("半無限導体と点電荷")[
鏡像法
]
#proposition("一様外部電場中の導体球")[

]
#definition("静電遮蔽")[
導体によって囲まれた空間内の電場は外部の電場に影響されず内部の電荷のみで決まる。
]
#theorem("表面電荷による遮蔽")[

]
#proof[
$ - upright(bold(nabla))^2 phi.alt = rho / epsilon_0 $
$ n_i $
]

== 物質中の電磁気学の一般論
<物質中の電磁気学の一般論>
#definition("誘電体")[
誘電体は外から電場を作用させると正の電荷と負の電荷は逆向きに変位し、電気的に分極して微視的な電気双極子を作る。これを電気分極
(electric polarization)
といい、電気分極によって電場は弱められる。このとき電気分極による電気モーメント密度を
$bold(P) \( bold(r) \)$ と表す。このとき電束密度 $bold(D) \( bold(r) \)$
を次のように定義する。 $ bold(D) & = epsilon_0 bold(E) + bold(P) $
誘電体に関しては仮想的な電荷を導入することで真空中の電磁気学を近似的に適用できる。これを分極電荷
(polarization charge)
という。電子やイオンに由来する自由に取り出したり、加えたりできる電荷を真電荷という。
]
#theorem("誘電体のガウスの法則")[
誘電体による分極電荷を含むガウスの法則は次のように書ける。
$ integral_(partial V) bold(D) dot.op bold(n) thin upright(d) S & = integral_V rho_e \( bold(r) \) thin upright(d) V arrow.l.r.double upright(bold(nabla)) dot.op bold(D) = rho_e $
]
#proof[
誘電体内部と誘電体表面における分極電荷の電荷密度を
$rho_P \( bold(r) \) \, sigma_P \( bold(r) \)$ とおくと、電気分極
$bold(P)$ を用いて次のように表される。
$ rho_P \( bold(r) \) & = - upright(bold(nabla)) dot.op bold(P)\
sigma_P \( bold(r) \) & = bold(n) dot.op bold(P) $
誘電体の中の巨視的な電場 $bold(E)$ は外部電場 $bold(E)_e$ と分極電場
$bold(E)_P$ からなる。
$ epsilon_0 integral_(partial V) bold(E)_P dot.op bold(n) thin upright(d) S & = integral_V rho_P thin upright(d) V + integral_(S_P) sigma_P thin upright(d) S\
 & = integral_V \( - upright(bold(nabla)) dot.op bold(P) \) thin upright(d) V - integral_(S_P) bold(P) dot.op bold(n) thin upright(d) S\
 & = - integral_(partial V + S_P) bold(P) dot.op bold(n) thin upright(d) S\
integral_(partial V) \( epsilon_0 bold(E) + bold(P) \) dot.op bold(n) thin upright(d) S & = integral_V rho_e thin upright(d) V $
これより
$bold(D) \( bold(r) \) = epsilon_0 bold(E) \( bold(r) \) + bold(P) \( bold(r) \)$
とおくことで誘電体におけるガウスの法則が求まる。
$ integral_(partial V) bold(D) dot.op bold(n) thin upright(d) S & = integral_V rho_e thin upright(d) V arrow.l.r.double upright(bold(nabla)) dot.op bold(D) = rho_e $
]

#theorem("誘電体のエネルギー")[
一般の誘電体において電場が作るエネルギー密度
$ u_e \( bold(r) \) & = integral_0^D bold(E) dot.op thin upright(d) bold(D) $
]
#proof[
電場を作ってから分極させるようにしてエネルギー差を計算する。$bold(p)$
の電気双極子について
$Delta W = - bold(F) dot.op Delta bold(r) = q bold(E) dot.op Delta bold(r) = bold(E) dot.op Delta bold(p)$
となるから $ Delta u_E & = epsilon_0 bold(E) dot.op Delta bold(E)\
Delta u_P & = bold(E) dot.op Delta bold(P)\
Delta u_e & = Delta u_E + Delta u_P = bold(E) dot.op \( epsilon_0 Delta bold(E) + Delta bold(P) \) = bold(E) dot.op Delta bold(D) $
となる。これより単位体積当たりのエネルギーは
$ u_e \( bold(r) \) & = integral_0^D bold(E) dot.op thin upright(d) bold(D) $
]

#theorem("境界条件")[
誘電体の境界面において磁場がないとき次の境界条件を満たす。
$ 2 D_(1 perp) & = D_(2 perp) \, #h(2em) E_(1 parallel) & = E_(2 parallel) $
]
#proof[
Maxwell の方程式より
$ 2 0 & = integral_S bold(D) dot.op bold(n) thin upright(d) S = D_(1 perp) Delta S + D_(2 perp) \( - Delta S \) #h(2em) & D_(1 perp) = D_(2 perp)\
0 & = integral_(partial S) bold(E) dot.op thin upright(d) bold(l) = E_(1 parallel) l - E_(2 parallel) l #h(2em) & E_(1 parallel) = E_(2 parallel) $
]

#definition("磁性体")[
磁性体は外から磁場を作用させるとスピンや原子核によって微視的な磁気双極子を作り、これを磁化
(magnetization) という。磁化 $bold(M) \( bold(r) \)$
を磁気双極子モーメント密度とし、磁場 $bold(H) \( bold(r) \)$
を次のように定義する。 $ bold(B) & = mu_0 bold(H) + bold(M) $
磁性体に関して仮想的な磁荷を導入することで真空中の電磁気学を近似的に適用できる。これを分極磁荷
(polarized magnetic charge) という。
]
#theorem("磁場におけるガウスの法則")[
磁性体による分極磁荷を含むガウスの法則は次のように書ける。
$ integral_(partial V) bold(B) dot.op bold(n) thin upright(d) S & = 0 arrow.l.r.double upright(bold(nabla)) dot.op bold(B) = 0 $
]
#proof[
磁性体内部と磁性体表面における分極磁荷の密度を
$rho_P \( bold(r) \) \, sigma_P \( bold(r) \)$ とおくと、磁化 $bold(M)$
を用いて次のように表される。
$ rho_M \( bold(r) \) & = - upright(bold(nabla)) dot.op bold(M)\
sigma_M \( bold(r) \) & = bold(n) dot.op bold(M) $
磁性体の中の巨視的な磁場 $bold(H)$ は外部磁場 $bold(H)_e$ と分極磁場
$bold(H)_M$ からなる。
$ mu_0 integral_(partial V) bold(H)_M dot.op bold(n) thin upright(d) S & = integral_V rho_M thin upright(d) V + integral_(S_M) sigma_M thin upright(d) S\
 & = integral_V \( - upright(bold(nabla)) dot.op bold(M) \) thin upright(d) V - integral_(S_M) bold(M) dot.op bold(n) thin upright(d) S\
 & = - integral_(partial V + S_M) bold(M) dot.op bold(n) thin upright(d) S\
integral_(partial V) \( mu_0 bold(H) + bold(M) \) dot.op bold(n) thin upright(d) S & = mu_0 integral_(partial V) bold(H)_e dot.op bold(n) thin upright(d) S = 0 $
これより $bold(B) = mu_0 bold(H) + bold(M)$ とおくことで
$ integral_(partial V) bold(B) dot.op bold(n) thin upright(d) S & = 0 arrow.l.r.double upright(bold(nabla)) dot.op bold(B) = 0 $
]

#theorem("ファラデーの電磁誘導の法則")[
$ integral.cont_(partial S) bold(E) dot.op thin upright(d) bold(l) = - integral_S frac(partial bold(B), partial t) dot.op thin upright(d) bold(S) & arrow.l.r.double upright(bold(nabla)) times bold(E) = - frac(partial bold(B), partial t) $
]
#proof[
$ integral_(partial S) bold(E)_P dot.op thin upright(d) bold(l) = 0\
integral_(partial S) frac(partial bold(B)_M, partial t) dot.op thin upright(d) bold(l) = 0 $
]

#theorem("物質中のマクスウェル・アンペールの法則")[
$ integral.cont_(partial S) bold(H) dot.op thin upright(d) bold(l) = integral_S (bold(j) + frac(partial bold(D), partial t)) dot.op thin upright(d) bold(S) arrow.l.r.double upright(bold(nabla)) times bold(H) = bold(j) + frac(partial bold(D), partial t) $
]
#proof[
原点 $O$ に $z$ 軸に平行な電気双極子があり，正電荷 $q$
と負電荷 $- q$ の $z$ 座標をそれぞれとする。正電荷と負電荷の間に電流
$I_P$ が流れ、$q$ の値が時間と共に変化するとする。
$ bold(H)_M \( bold(r) \) & = frac(I_P bold(d) times bold(r), 4 pi r^3) = frac(dot(bold(p)) times bold(r), 4 pi r^3)\
integral.cont_(partial S) bold(H)_M dot.op thin upright(d) bold(l) & = frac(dot(p) a^2, 2 \( a^2 + z^2 \)^(3 \/ 2))\
integral.cont_(partial S) bold(H)_M dot.op thin upright(d) bold(l) & = frac(upright(d) Psi_P, upright(d) t) $
磁化電流
$ frac(upright(d) Psi_P, upright(d) t) & = integral epsilon_0 frac(partial bold(E), partial t) dot.op thin upright(d) bold(S) $
分極電荷の移動による電流 (レントゲン電流) は
$ I_P & = integral frac(partial bold(P), partial t) dot.op thin upright(d) bold(S) $
$ integral.cont_(partial S) bold(H) dot.op thin upright(d) bold(l) & = frac(upright(d) Psi_P, upright(d) t) + I_P\
 & = integral_S (epsilon_0 frac(partial bold(E), partial t) + frac(partial bold(P), partial t) + bold(j)) dot.op thin upright(d) bold(S)\
 & = integral_S (frac(partial bold(D), partial t) + bold(j)) dot.op thin upright(d) bold(S)\
upright(bold(nabla)) times bold(H) & = bold(j) + frac(partial bold(D), partial t) $
]

#theorem("電荷の保存則")[
$ frac(partial rho, partial t) + upright(bold(nabla)) dot.op bold(j) = 0 $
]
#proof[
$ upright(bold(nabla)) dot.op \( upright(bold(nabla)) times bold(H) \) & = upright(bold(nabla)) dot.op bold(j) + frac(partial, partial t) (upright(bold(nabla)) dot.op bold(D)) = frac(partial rho, partial t) + upright(bold(nabla)) dot.op bold(j) = 0 $
]

#theorem("磁性体中のエネルギー")[
$ u_m = integral_0^B bold(H) dot.op thin upright(d) bold(B) $
]
#proof[
誘電体と同様にして
$ Delta u_M & = bold(H) dot.op \( Delta bold(M) + mu_0 Delta bold(H) \) = bold(H) dot.op Delta bold(B)\
u_M & = integral_0^B bold(H) dot.op thin upright(d) bold(B) $
]

#theorem("エネルギー保存則")[
エネルギー密度 $u_(e m)$ は次のように表される。
$ u_(e m) & = integral_0^(bold(D)) bold(E) dot.op thin upright(d) bold(D) + integral_0^(bold(B)) bold(H) dot.op thin upright(d) bold(B) $
]
#proof[

]

#theorem("運動量保存則")[
常誘電体と常磁性体においてエネルギー密度を
$u_(e m)$、マクスウェルの応力テンソル $T_(i j)$ について
$ u_(e m) & = 1 / 2 bold(E) dot.op bold(D) + 1 / 2 bold(H) dot.op bold(B)\
T_(i j) & = E_i D_j + H_i B_j - delta_(i j) u_(e m) $ 物質の運動量密度を
$bold(p)_m \( bold(r) \, t \)$、電磁場の運動量密度を
$bold(p)_(E M) \( bold(r) \, t \)$ とする。
$ frac(partial bold(p)_m, partial t) & = rho bold(E) + bold(j) times bold(B)\
bold(p)_(E M) & = bold(D) times bold(B) $ このとき応力テンソル $T_(i j)$
の反作用を電磁場の運動量流密度と考えると
$ partial_i \( - T_(i j) \) + frac(partial p_j, partial t) = 0 $
ローレンツ力の反作用が電磁場の運動量の時間変化となる。
]
#proof[
Maxwell の方程式と $bold(E) \, bold(D)$ と
$bold(B) \, bold(H)$ の関係式から次のように求まる。
$ frac(partial p_j, partial t) & = [rho bold(E) + bold(j) times bold(B) + frac(partial, partial t) \( bold(D) times bold(B) \)]_j\
 & = [\( upright(bold(nabla)) dot.op bold(D) \) bold(E) + (upright(bold(nabla)) times bold(H) - frac(partial bold(D), partial t)) times bold(B) + frac(partial bold(D), partial t) times bold(B) + bold(D) times frac(partial bold(B), partial t)]_j\
 & = [epsilon \( upright(bold(nabla)) dot.op bold(E) \) bold(E) + mu \( upright(bold(nabla)) times bold(H) \) times bold(H) - epsilon bold(E) times \( upright(bold(nabla)) times bold(E) \)]_j\
 & = epsilon \( partial_i E_i \) E_j + mu epsilon_(j i k) epsilon_(i l m) \( partial_l H_m \) H_k - epsilon epsilon_(j i k) E_i epsilon_(k l m) \( partial_l E_m \)\
 & = epsilon \( partial_i E_i \) E_j + mu \( partial_i H_j \) H_i - mu \( partial_j H_i \) H_i - epsilon E_i \( partial_j E_i \) + epsilon E_i \( partial_i E_j \)\
 & = partial_i (epsilon E_i E_j + mu H_i H_j) - partial_j (1 / 2 \( E_i^2 + H_i^2 \))\
 & = partial_i T_(i j) $ よってこれを積分形に書き直すと Gauss
の発散定理を用いて次のようになる。
$ integral.cont_(partial V) bold(j) \( bold(r) \, t \) dot.op bold(n) \( bold(r) \) thin upright(d) S + partial_t integral_V \( bold(p)_m + bold(p)_(E M) \) thin upright(d) v = 0 $
]

#block[
物質中の Maxwell 方程式 $bold(D) = epsilon_0 bold(E) + bold(P)$
$bold(B) = mu_0 bold(H) + bold(M)$
$ 3 & integral_(partial V) bold(D) dot.op thin upright(d) bold(S) = integral_V rho_e thin upright(d) V &  & arrow.l.r.double upright(bold(nabla)) dot.op bold(D) = rho_e\
 & integral_(partial V) bold(B) dot.op thin upright(d) bold(S) = 0 &  & arrow.l.r.double upright(bold(nabla)) dot.op bold(B) = 0\
 & integral_(partial S) bold(E) dot.op thin upright(d) bold(l) = - frac(upright(d), upright(d) t) integral_S bold(B) dot.op thin upright(d) bold(S) &  & arrow.l.r.double upright(bold(nabla)) times bold(E) = - frac(partial bold(B), partial t)\
 & integral_(partial S) bold(H) dot.op thin upright(d) bold(l) = integral_S bold(j) dot.op thin upright(d) bold(S) + frac(upright(d), upright(d) t) integral_S bold(D) dot.op thin upright(d) bold(S) &  & arrow.l.r.double upright(bold(nabla)) times bold(H) = bold(j) + frac(partial bold(D), partial t) $

]
== 誘電体の電磁気学
<誘電体の電磁気学>
#definition("常誘電体")[
電場に比例して電気分極が現れる場合を常誘電相 (paraelectric phase)
といい、そのような誘電体を常誘電体という。この電気分極は電気感受率
(electric susceptibility) $chi$ または誘電体の誘電率 (dielectric
constant) という。 $ bold(P) & = epsilon_0 chi bold(E)\
bold(D) & = epsilon_0 \( 1 + chi \) bold(E) = epsilon bold(E) $
電場を掛けなくても微視的な電気双極子が一方向に揃った電気分極は大きな値をとる。これを自発分極
(spontaneous polarization) といい、このような物質を強誘電体
(ferroelectrics) という。
]
#theorem("常誘電体のエネルギー密度")[
$ u_e \( bold(r) \) & = 1 / 2 bold(E) dot.op bold(D) = epsilon_0 / 2 bold(E)^2 = frac(1, 2 epsilon_0) bold(D)^2\
U_e & = 1 / 2 integral phi.alt rho_e thin upright(d) V $
]
#proof[
$ u_e \( bold(r) \) & = integral_0^D bold(E) dot.op thin upright(d) bold(D) = epsilon integral_0^E bold(E) dot.op thin upright(d) bold(E) = frac(epsilon bold(E)^2, 2) = frac(bold(D)^2, 2 epsilon) = 1 / 2 bold(E) dot.op bold(D) $
電位と電荷密度を用いると次のようになる。
$ u_e \( bold(r) \) & = 1 / 2 bold(E) dot.op bold(D) = 1 / 2 \( - upright(bold(nabla)) phi.alt \) dot.op bold(D) = 1 / 2 (- upright(bold(nabla)) dot.op \( phi.alt bold(D) \) + phi.alt upright(bold(nabla)) dot.op bold(D)) = 1 / 2 (- upright(bold(nabla)) dot.op \( phi.alt bold(D) \) + phi.alt rho_e)\
U_e & = integral 1 / 2 (- upright(bold(nabla)) dot.op \( phi.alt bold(D) \) + phi.alt rho_e) thin upright(d) V = 1 / 2 integral phi.alt rho_e thin upright(d) V $
]

#proposition("中心に点電荷のある誘電体球")[

]
#proof[
半径 $r$ の閉球面 $S$ においてガウスの法則を適用する
$ integral.cont_S bold(D) \( bold(r) \) dot.op thin upright(d) bold(S) & = 4 pi r^2 D \( r \) = Q\
D \( r \) & = frac(Q, 4 pi r^2) $ 電束密度 $D \( r \)$ から電場
$E \( r \)$, 電位 $phi.alt \( r \)$, 電気分極 $P \( r \)$ を求められる。
$ D \( r \) & = cases(delim: "{", epsilon E \( r \) & \( r < a \), epsilon_0 E \( r \) & \( r > a \))\
E \( r \) & = cases(delim: "{", frac(Q, 4 pi epsilon r^2) & \( r < a \), frac(Q, 4 pi epsilon_0 r^2) & \( r > a \))\
P \( r \) & = D \( r \) - epsilon_0 E \( r \) = cases(delim: "{", frac(epsilon - epsilon_0, epsilon) frac(Q, 4 pi r^2) & \( r < a \), 0 & \( r > a \))\
rho_P \( r \) & = - upright(bold(nabla)) dot.op bold(P) = - frac(epsilon - epsilon_0, epsilon) Q (upright(bold(nabla)) dot.op frac(bold(r), 4 pi r^2)) = - frac(epsilon - epsilon_0, epsilon) Q delta \( bold(r) \)\
sigma_P \( r \) & = bold(n) dot.op bold(P) = frac(epsilon - epsilon_0, epsilon) frac(Q, 4 pi a^2)\
phi.alt \( r \) & = integral_r^oo E \( r \) thin upright(d) r = cases(delim: "{", frac(Q, 4 pi epsilon) (1 / r - 1 / a) + frac(Q, 4 pi epsilon_0 a) & \( r < a \), frac(Q, 4 pi epsilon_0 r) & \( r > a \)) $
となる。
]

#proposition("導体と誘電体の境界")[
導体表面での真電荷の面密度を $sigma$ とすると $D = sigma$
]
#proposition("誘電体境界と鏡像法")[

]
#proposition("真電荷の周囲を誘電体で囲む")[

]
#proposition("コンデンサーの極板")[

]
圧電応答力による顕微鏡

#definition("強誘電体")[

]
#proof[
$ F \( bold(P) \) & = - bold(E) dot.op bold(P) + A \( T - T_c \) P^2 + B P^4 + C P^6 + dots.h.c $
]

== 磁性体の電磁気学
<磁性体の電磁気学>
#theorem("磁気現象")[
$ cal(H) & = frac(1, 2 m) \( bold(p) - q bold(A) \)^2 + q phi.alt + g frac(q planck, 2 m) \( bold(s) dot.op bold(B) \)\
bold(m) & = mu_0 (frac(q planck, 2 m) bold(l) - frac(q^2, 2 m) \( bold(r) times bold(A) \) + frac(g q planck, 2 m) bold(s))\
mu_B & = frac(e planck, 2 m_e) = 9.274 times 10^(- 24) J \/ T $
ただし $bold(s)$ をスピン, $g approx 2.00232 dots.h.c$ を g 因子
]
#proof[
$ chevron.l m_z chevron.r & = frac(sum_(S_z = - S)^S - G S_z e^(beta G S_z H), sum_(S_z = - S)^S e^(beta G S_z H))\
 & = frac(partial, partial beta) ln (sum_(S_z = - S)^S exp (S_z / S x)) #h(2em) \( x = beta G S H \)\
 & = frac(partial, partial beta) ln (frac(sinh (frac(2 S + 1, 2 S) x), sinh (frac(1, 2 S) x)))\
 & = G S (frac(2 S + 1, 2 S) coth (frac(2 S + 1, 2 S) x) - frac(1, 2 S) coth (frac(1, 2 S) x))\
 & = G S B_S \( x \) approx frac(G^2 S \( S + 1 \), 3 k_B T) H #h(2em) \( x arrow.r 0 \) $
$ cal(H) = - 2 J bold(S) dot.op bold(S) $
]

#definition("強磁性体")[
磁化現象において量子力学的効果である同じ向きのスピンを持つ 2
つの電子は同一の場所には存在出来ない性質が無視できない。2つの電子完のスピン相互作用はスピンが平行と反平行の場合に
$J$ 異なる交換相互作用強磁性体
]
#proof[
$ F \( bold(M) \) & = - bold(M) dot.op bold(H)_e + A \( T - T_c \) M^2 + B M^4 $
$T > T_c$ のとき $ M & = frac(H_e, 2 A \( T - T_c \)) $
]

== 超伝導体の電磁気学
<超伝導体の電磁気学>
#definition[
Cooper 対

+ 電気抵抗が0

+ 超伝導体内の磁束密度は常に 0 (完全反磁性)

+ マイスナー (Meissner) 効果

内部の磁束が 0 になるように超伝導体表面には磁束を遮蔽する磁化電流
(遮蔽電流)
が流れる。遮蔽電流は表面近くの領域に分布しているので、磁束は表面よりある距離
($lambda$) 程度侵入できる。この $lambda$ を磁束の侵入距離という。
遮蔽電流密度 $bold(j)_S$ はベクトルポテンシャル $bold(A)$
との間にロンドン方程式と呼ばれる関係がある。
$ bold(j)_S & = - frac(n_s q^2, m) bold(A) #h(2em) (q = - 2 e \, m = 2 m_e) $
]
#theorem[

]
#proof[
$ upright(bold(nabla)) times bold(j)_S & = - frac(n_s q^2, m) upright(bold(nabla)) times bold(A) = - frac(n_s q^2, m) bold(B)\
upright(bold(nabla)) times \( upright(bold(nabla)) times bold(B) \) & = upright(bold(nabla)) \( upright(bold(nabla)) dot.op bold(B) \) - nabla^2 bold(B) = - nabla^2 bold(B)\
 & = upright(bold(nabla)) times \( mu_0 bold(j)_S \) = - frac(mu_0 n_s q^2, m) bold(B)\
nabla^2 bold(B) & = frac(mu_0 n_s q^2, m) bold(B)\
bold(B) \( x \) & = bold(B) \( 0 \) exp (- x / lambda) #h(2em) (lambda = sqrt(frac(m, mu_0 n_s q^2)) approx 10^(- 8) tilde.op 10^(- 7) m) $
より
]

= 特殊相対論
<特殊相対論>
