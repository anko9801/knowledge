#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "統計力学演習レポート 2",
  date: "2026-08-18",
  tags: ("レポート",),
  summary: "physics_report/debye.tex から変換",
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
    [Q17-1.], [(i) x (ii) o],
    [Q17-2.], [o],
    [Q17-3.], [(i) o (ii) o (iii) o (iv) o (v) o (vi) o (vii) o (viii) o
    (ix) o (x) o (xi) o (xii) o (xiii) o (xiv) o (xv) o (xvi) o],
    [Q17-4.], [(i) o (ii) o (iii) o (iv) o (v) o (vi) o],
    [Q17-5.], [(i) o (ii) o],
    [Q17-6.], [o],
    [Q17-7.], [(i) o (ii) o (iii) o (iv) o],
    [Q17-8.], [(i) o (ii) o (iii) o (iv) o],
    [Q17-9.], [(i) o (ii) o],
    [Q17-10.], [△],
    [Q17-11.], [o],
    [Q17-12.], [(i) o (ii) o (iii) o (iv) o (v) o (vi) o (vii) o (viii)
    o (ix) o],
    [Q17-13.], [o],
    [Q17-14.], [o],
    [Q17-15.], [o],
    [Q17-16.], [o],
    [Q17-17.], [(i) o (ii) o],
    [Q17-18.], [(i) o (ii) o],
    [Q17-19.], [(i) o (ii) o (iii) o (iv) o (v) o (vi) o],
    [Q17-20.], [(i) o (ii) o (iii) o (iv) o],
    [Q17-21.], [o],
    [Q17A-1.], [(i) o (ii) o (iii) o],
    [Q17A-2.], [(i) o (ii) o],
    [Q17A-3.], [o],
    [Q17A-4.], [o],
    [Q17A-5.], [o],
    [Q17A-6.], [o],
    [Q17A-7.], [o],
    [Q17A-8.], [o],
    [Q17A-9.], [o],
    [Q17A-10.], [o],
    [Q17A-11.], [o],
    [Q17A-12.], [(i) o (ii) o],
    [Q17A-13.], [o],
  )]
  , caption: [正誤表]
  , kind: table
  )

] 
= その17 : 固体の比熱のDebye模型
<その17-固体の比熱のdebye模型>
ここでは固体の比熱 $C$ の Debye 模型を学ぶ. Debye 模型は高温における
$C approx 3 n R$ と低温における $C prop T^3$ の両方を正しく説明する.

== Debye 模型の基本的な考え方
<debye-模型の基本的な考え方>
Debye 模型は Einstein
模型と同様に固体の比熱を独立な調和振動子の集まりの比熱として捉える. ただ
Debye 模型は Einstein 模型に加え,
固体を構成する各原子は原子同士の原子間力によるバネにより結びついていると考える.

== 解析力学の復習：点正準変換
<解析力学の復習点正準変換>
ある $N$ 自由度の系の一般化座標を $q_1 \, dots.h \, q_N$ として Lagrange
形式では一般化座標 $q_i$ と一般化速度 $dot(q)_i$ を用いて表現される.
このとき一般化運動量 $p_i$ は次のように定められる.
$ L & = L \( q_1 \, dots.h \, q_N \, dot(q)_1 \, dots.h \, dot(q)_N \) \,\
p_i & = (frac(partial L, partial dot(q)_i))_(q_1 \, dots.h \, q_N \, dot(q)_1 \, dots.h \, dot(q)_(i - 1) \, dot(q)_(i + 1) \, dots.h \, dot(q)_N) #h(2em) \( i = 1 \, dots.h \, N \) . $
一方 Hamilton 形式では一般化座標 $q_i$ と一般化運動量 $p_i$
を用いて表現される.
$ H & = H \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) = sum_(i = 1)^N p_i dot(q)_i - L \,\
frac(upright(d) q_i, upright(d) t) & = frac(partial H, partial p_i) \, #h(2em) frac(upright(d) p_i, upright(d) t) = - frac(partial H, partial q_i) #h(2em) \( i = 1 \, dots.h \, N \) . $

#block[
Q 17-1. Lagrange 形式での一般座標変換
$\( q_1 \, dots.h \, q_N \) arrow.r \( Q_1 \, dots.h \, Q_N \)$
に対応する Hamilton 形式で正準変換を点正準変換といい,
$\( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) arrow.r \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \)$
を求める. $ q_i = f_i \( Q_1 \, dots.h \, Q_N \) . $

]
(i) 新しい運動量 $P_j$ は Lagrange 形式を用いて次のように求められる.
$ P_j & = (frac(partial L, partial dot(Q)_j))_(Q_1 \, dots.h \, Q_N \, dot(Q)_1 \, dots.h \, dot(Q)_(j - 1) \, dot(Q)_(j + 1) \, dots.h \, dot(Q)_N) #h(2em) \( j = 1 \, 2 \, dots.h \, N \)\
 & = sum_(i = 1)^N frac(partial L, partial dot(q)_i) frac(partial dot(q)_i, partial dot(Q)_j)\
 & = sum_(i = 1)^N p_i frac(partial q_i, partial Q_j)\
 & = sum_(i = 1)^N frac(partial f_i \( Q_1 \, dots.h \, Q_N \), partial Q_j) p_i . $

(ii) また新しい Hamilton 関数は定義式から古い Hamilton 関数と一致する.
$ H' = H' \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \) = sum_(j = 1)^N P_j dot(Q)_j - L = sum_(j = 1)^N sum_(i = 1)^N frac(partial f_i \( Q_1 \, dots.h \, Q_N \), partial Q_j) p_i dot(Q)_j - L = sum_(i = 1)^N p_i dot(q)_i - L = H $

== 1 次元結晶における平衡位置の回りの調和振動を記述する Hamilton 関数
<次元結晶における平衡位置の回りの調和振動を記述する-hamilton-関数>
直線上に等間隔の平衡位置を持って並んだ $N$ 個の原子からなる 1
次元結晶を物理系として記述して古典力学により考察する. $i$
番目の原子の位置座標の平衡位置からのずれを $q_i$ として, その運動量を
$p_i$ とする.

#block[
Q 17-2. 1 次元結晶の Hamilton 関数は次のように表される.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & := frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 $
ただし $kappa$ は隣り合った原子の間の原子間力のバネ定数とし,
両端の原子は固定されている $q_0 = q_(N + 1) = 0$ と仮定する.

]
$i$ 番目の原子の運動エネルギーは運動量 $p_i$ を用いて次のように表される.
$ frac(p_i^2, 2 m) . $ また隣り合う $i \, i + 1$
番目の原子の原子間力のポテンシャルエネルギーはバネ定数 $kappa$
を用いて次のように表される. $ 1 / 2 kappa \( q_i - q_(i + 1) \)^2 . $
これより Hamilton 関数は次のように表される.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & := frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 . $

== 1 次元結晶における平衡位置の回りの調和振動の基準モードの計算
<次元結晶における平衡位置の回りの調和振動の基準モードの計算>
#block[
Q 17-3. 固定端境界条件の 1 次元結晶の系を考えているので Fourier
展開した基底が基準振動となる.
$ H^(1 "次元結晶") \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \) & = sum_(j = 1)^N (frac(1, 2 m) P_j^2 + 1 / 2 m omega_j^2 Q_j^2) . $
ただし, $omega_j$ を次のように定める.
$ omega_j = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j) . $

]
固定端境界条件の 1 次元結晶の系を考えているので Fourier Sine
展開の基底が基準振動になっているとする.
$ q_i^(\( j \)) & = sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j i) . $
まず計算に必要な関数を定義する. \
(i) $alpha eq.not 0 med \( mod med 2 pi \)$ に対して
$F \( alpha \) \, G \( alpha \)$ を次のように定義する.
$ F \( alpha \) & := sum_(i = 1)^N cos \( alpha i \) \,\
G \( alpha \) & := sum_(i = 1)^N sin \( alpha i \) . $ このとき
$F \( alpha \) \, G \( alpha \) in bb(R)$ より
$F \( alpha \) + sqrt(- 1) G \( alpha \) in bb(C)$
の実部と虚部はそれぞれ $F \( alpha \) \, G \( alpha \)$
と対応した値となる. Euler の公式を用いて次のように計算できる.
$ F \( alpha \) + sqrt(- 1) G \( alpha \) & = sum_(i = 1)^N e^(sqrt(- 1) alpha i)\
 & = frac(e^(sqrt(- 1) alpha) - e^(sqrt(- 1) alpha \( N + 1 \)), 1 - e^(sqrt(- 1) alpha))\
 & = frac(2 e^(sqrt(- 1) alpha) e^(sqrt(- 1) alpha N / 2) sin alpha N / 2, 2 e^(sqrt(- 1) alpha 1 / 2) sin alpha 1 / 2)\
 & = frac(e^(sqrt(- 1) alpha / 2 \( N + 1 \)) sin alpha / 2 N, sin alpha / 2)\
 & = frac(cos (alpha / 2 \( N + 1 \)) sin alpha / 2 N, sin alpha / 2) + sqrt(- 1) frac(sin (alpha / 2 \( N + 1 \)) sin alpha / 2 N, sin alpha / 2) . $
これより実部虚部の対応から $F \( alpha \) \, G \( alpha \)$ が求まる.
$ F \( alpha \) & := sum_(i = 1)^N cos \( alpha i \) = frac(cos (alpha / 2 \( N + 1 \)) sin (alpha / 2 N), sin alpha / 2) \,\
G \( alpha \) & := sum_(i = 1)^N sin \( alpha i \) = frac(sin (alpha / 2 \( N + 1 \)) sin (alpha / 2 N), sin alpha / 2) . $

(ii) $j \, j' = 1 \, dots.h \, N$ とすると
$j - j' = - \( N - 1 \) \, dots.h \, N - 1$ かつ
$j + j' = 2 \, dots.h \, 2 N$ である. これより $j - j' = 0$
である場合に限り $j - j' = 0 med \( mod med 2 \( N + 1 \) \)$
が成り立ち, $j + j' = 0 med \( mod med 2 \( N + 1 \) \)$
が成り立つ場合は存在せず,
逆に主結合子の前件が恒偽ならばその論理式は真である.
よって次の同値関係が成り立つ.
$  & frac(pi, N + 1) \( j - j' \) = 0 med \( mod med 2 pi \) arrow.l.r.double j - j' = 0 med \( mod med 2 \( N + 1 \) \) arrow.l.r.double j = j' \,\
 & frac(pi, N + 1) \( j + j' \) = 0 med \( mod med 2 pi \) arrow.l.r.double j + j' = 0 med \( mod med 2 \( N + 1 \) \) arrow.l.r.double f a l s e . $<Q17-3-ii-1>

(iii) $j \, j' = 1 \, dots.h \, N$ に対して次のように内積を定義する.
このときこの内積の正規直交関係を示す.
$ \( q^(\( j \)) \, q^(\( j' \)) \) & := sum_(i = 1)^N q_i^(\( j \)) q_i^(\( j' \)) . $
まず (i), (ii) を用いることで次のように式変形できる.
$ \( q^(\( j \)) \, q^(\( j' \)) \) & := sum_(i = 1)^N q_i^(\( j \)) q_i^(\( j' \))\
 & = frac(2, N + 1) sum_(i = 1)^N sin (frac(pi, N + 1) j i) sin (frac(pi, N + 1) j' i)\
 & = frac(1, N + 1) sum_(i = 1)^N (cos (frac(pi, N + 1) \( j - j' \) i) - cos (frac(pi, N + 1) \( j + j' \) i))\
 & = cases(delim: "{", frac(1, N + 1) (frac(cos (pi / 2 \( j - j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j - j' \)), sin (frac(pi, 2 \( N + 1 \)) \( j - j' \))) - frac(cos (pi / 2 \( j + j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j + j' \)), sin (frac(pi, 2 \( N + 1 \)) \( j + j' \)))) & \( j eq.not j' \), frac(1, N + 1) (N - frac(cos (j pi) sin (frac(j N, N + 1) pi), sin (frac(j, N + 1) pi))) & \( j = j' \)) . $
先に $j eq.not j'$ の場合を考える.
括弧内を通分した分子の第一項と第二項についてそれぞれ計算する.
第一項について
$  & cos (pi / 2 \( j - j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j - j' \)) sin (frac(pi, 2 \( N + 1 \)) \( j + j' \))\
= & cos (frac(j - j', 2) pi) (cos (frac(\( N - 1 \) j - \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(\( N + 1 \) j - \( N - 1 \) j', 2 \( N + 1 \)) pi))\
= & cos (frac(j - j', 2) pi) cos (frac(\( N - 1 \) j - \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(j - j', 2) pi) cos (frac(\( N + 1 \) j - \( N - 1 \) j', 2 \( N + 1 \)) pi)\
= & cos (frac(j, N + 1) pi) + cos (frac(N j - \( N + 1 \) j', N + 1) pi) - cos (frac(j', N + 1) pi) - cos (frac(\( N + 1 \) j - N j', N + 1) pi) . $<Q17-3-iii-1>
第二項について
$  & cos (pi / 2 \( j + j' \)) sin (frac(N pi, 2 \( N + 1 \)) \( j + j' \)) sin (frac(pi, 2 \( N + 1 \)) \( j - j' \))\
= & cos (frac(j + j', 2) pi) (cos (frac(\( N - 1 \) j + \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(\( N + 1 \) j + \( N - 1 \) j', 2 \( N + 1 \)) pi))\
= & cos (frac(j + j', 2) pi) cos (frac(\( N - 1 \) j + \( N + 1 \) j', 2 \( N + 1 \)) pi) - cos (frac(j + j', 2) pi) cos (frac(\( N + 1 \) j + \( N - 1 \) j', 2 \( N + 1 \)) pi)\
= & cos (frac(N j + \( N + 1 \) j', N + 1) pi) + cos (frac(j, N + 1) pi) - cos (frac(\( N + 1 \) j + N j', N + 1) pi) - cos (frac(j', N + 1) pi) . $<Q17-3-iii-2>
これより分子は次のようになる.
$ upright(Q 17 - 3 . i i i 1) - upright(Q 17 - 3 . i i i 2) & = (cos frac(j, N + 1) pi + cos (frac(N j, N + 1) - j') pi - cos frac(j', N + 1) pi - cos (j - frac(N j', N + 1)) pi)\
 & - (cos (frac(N j, N + 1) + j') pi + cos frac(j, N + 1) pi - cos (j + frac(N j', N + 1)) pi - cos frac(j', N + 1) pi)\
 & = cos (frac(N j, N + 1) - j') pi - cos (frac(N j, N + 1) + j') pi + cos (j + frac(N j', N + 1)) pi - cos (j - frac(N j', N + 1)) pi\
 & = 2 sin (j' pi) sin (frac(N j, N + 1) pi) - 2 sin (j pi) sin (frac(N j', N + 1) pi)\
 & = 0 #h(2em) \( because j \, j' in bb(Z) \) . $ よって $j eq.not j'$
のときは $\( q^(\( j \)) \, q^(\( j' \)) \) = 0$ となる.

次に $j = j'$ の場合を考える. これは $j$
が奇数か偶数かで場合分けして考える.
$ frac(cos (j pi) sin (frac(j N, N + 1) pi), sin (frac(j, N + 1) pi)) & = cases(delim: "{", frac(cos (2 k pi) sin (frac(2 k N, N + 1) pi), sin (frac(2 k, N + 1) pi)) & \( j = 2 k \, k in bb(Z) \), frac(cos (\( 2 k - 1 \) pi) sin (frac(\( 2 k - 1 \) N, N + 1) pi), sin (frac(2 k - 1, N + 1) pi)) & \( j = 2 k - 1 \, k in bb(Z) \))\
 & = {frac(1 dot.op sin (2 k pi frac(N, N + 1) - 2 k pi), sin (2 k pi frac(1, N + 1)))\
frac(- 1 dot.op - sin (\( 2 k - 1 \) pi frac(N, N + 1) - \( 2 k - 1 \) pi), sin (\( 2 k - 1 \) pi frac(1, N + 1)))\
 & = - 1 . $ よって $j = j'$ のときは
$\( q^(\( j \)) \, q^(\( j' \)) \) = 1$ となる. これより,
まとめると次の式が成り立つ.
$ \( q^(\( j \)) \, q^(\( j' \)) \) = delta_(j \, j') . $

(iv) ここで行列 $A_(i j) := q_i^(\( j \))$ を定義する.
このとき次の計算から $A_(i j)$ は直交行列であるとわかる.
$ \( A^top A \)_(i j) & = sum_(k = 1)^N A_(i k)^top A_(k j) = sum_(k = 1)^N A_(k i) A_(k j) = sum_(k = 1)^N q_k^(\( i \)) q_k^(\( j \)) = \( q^(\( i \)) \, q^(\( j \)) \) = delta_(i \, j) . $

(v) また $A_(i j)$ が直交行列であるから次のような正規直交関係もある.
$ \( A A^top \)_(i j) & = sum_(k = 1)^N A_(i k) A_(k j)^top = sum_(k = 1)^N A_(i k) A_(j k) = sum_(k = 1)^N q_i^(\( k \)) q_j^(\( k \)) = delta_(i \, j) . $

(vi) ここで原子の変位を表す古い座標系 $q_1 \, dots.h \, q_N$ を
$q^(\( 1 \)) \, dots.h \, q^(\( N \))$ で離散 Fourier Sine
展開した振幅を新しい座標系 $Q_1 \, dots.h \, Q_N$ と定義する.
$ q_i = sum_(j = 1)^N Q_j q_i^(\( j \)) . $
これは点正準変換を用いて新しい運動量を古い運動量を表せられる.
$ P_j = sum_(i = 1)^N frac(partial q_i, partial Q_j) p_i = sum_(i = 1)^N q_i^(\( j \)) p_i . $

(vii) Hamilton
関数の運動エネルギーの表式の核の部分について次のように表される.
$ sum_(j = 1)^N P_j^2 = sum_(j = 1)^N (sum_(i = 1)^N q_i^(\( j \)) p_i)^2 = sum_(j = 1)^N sum_(i = 1)^N sum_(i' = 1)^N \( q_i^(\( j \)) p_i \) \( q_(i')^(\( j \)) p_(i') \) = sum_(i = 1)^N p_i^2 . $

(viii) Hamilton
関数のポテンシャルエネルギーの核の部分について次のような表される.
$ sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 & = sum_(i = 0)^N (sum_(j = 1)^N (Q_j q_i^(\( j \)) - Q_j q_(i + 1)^(\( j \))))^2\
 & = sum_(i = 0)^N sum_(j = 1)^N sum_(j' = 1)^N (Q_j q_i^(\( j \)) - Q_j q_(i + 1)^(\( j \))) (Q_(j') q_i^(\( j' \)) - Q_(j') q_(i + 1)^(\( j' \)))\
 & = sum_(j = 1)^N sum_(j' = 1)^N sum_(i = 0)^N \( q_i^(\( j \)) - q_(i + 1)^(\( j \)) \) \( q_i^(\( j' \)) - q_(i + 1)^(\( j' \)) \) Q_j Q_(j')\
 & = sum_(j = 1)^N sum_(j' = 1)^N B_(j \, j') Q_j Q_(j') . $ ただし,
$B_(j \, j')$ を次のように定める.
$ B_(j \, j') := sum_(i = 0)^N \( q_i^(\( j \)) - q_(i + 1)^(\( j \)) \) \( q_i^(\( j' \)) - q_(i + 1)^(\( j' \)) \) . $

(ix) 次に $B_(j \, j')$ を求める. まず
$q_i^(\( j \)) - q_(i + 1)^(\( j \))$ は次のように求められる.
$ q_i^(\( j \)) - q_(i + 1)^(\( j \)) & = sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j i) - sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j \( i + 1 \))\
 & = sqrt(frac(2, N + 1)) (sin (frac(pi, N + 1) j i) - sin (frac(pi, N + 1) j \( i + 1 \)))\
 & = - 2 sqrt(frac(2, N + 1)) cos (pi / 2 frac(\( 2 i + 1 \) j, N + 1)) sin (pi / 2 frac(j, N + 1)) . $

(x) これより $B_(j \, j')$ は次のように計算できる.
$ B_(j \, j') & = sum_(i = 0)^N \( q_i^(\( j \)) - q_(i + 1)^(\( j \)) \) \( q_i^(\( j' \)) - q_(i + 1)^(\( j' \)) \)\
 & = sum_(i = 0)^N (- 2 sqrt(frac(2, N + 1)) cos (pi / 2 frac(\( 2 i + 1 \) j, N + 1)) sin (pi / 2 frac(j, N + 1))) (- 2 sqrt(frac(2, N + 1)) cos (pi / 2 frac(\( 2 i + 1 \) j', N + 1)) sin (pi / 2 frac(j', N + 1)))\
 & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) frac(2, N + 1) sum_(i = 0)^N cos (frac(pi, N + 1) j (i + 1 / 2)) cos (frac(pi, N + 1) j' (i + 1 / 2))\
 & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) frac(1, N + 1) sum_(i = 0)^N (cos (frac(pi, N + 1) \( j + j' \) (i + 1 / 2)) + cos (frac(pi, N + 1) \( j - j' \) (i + 1 / 2)))\
 & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) tilde(B)_(j \, j') . $
ただし, $tilde(B)_(j \, j')$ を次のように定める.
$ tilde(B)_(j \, j') & := frac(1, N + 1) sum_(i = 0)^N (cos (frac(pi, N + 1) \( j + j' \) (i + 1 / 2)) + cos (frac(pi, N + 1) \( j - j' \) (i + 1 / 2))) . $

(xi) さらに $tilde(B)_(j \, j')$ は次のように計算できる.
$ tilde(B)_(j \, j') & = frac(1, N + 1) sum_(i = 0)^N (cos (pi frac(j + j', N + 1) (i + 1 / 2)) + cos (pi frac(j - j', N + 1) (i + 1 / 2)))\
 & med = frac(1, N + 1) sum_(i = 0)^N #scale(x: 240%, y: 240%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) cos (pi frac(j + j', N + 1) i)\
 & - sin (pi / 2 frac(j + j', N + 1)) sin (pi frac(j + j', N + 1) i)\
 & + cos (pi / 2 frac(j - j', N + 1)) cos (pi frac(j - j', N + 1) i)\
 & - sin (pi / 2 frac(j - j', N + 1)) sin (pi frac(j - j', N + 1) i) #scale(x: 240%, y: 240%)[\]]\
 & med = frac(1, N + 1) #scale(x: 240%, y: 240%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) (1 + F (pi frac(j + j', N + 1)))\
 & - sin (pi / 2 frac(j + j', N + 1)) G (pi frac(j + j', N + 1))\
 & + cos (pi / 2 frac(j - j', N + 1)) (1 + F (pi frac(j - j', N + 1)))\
 & - sin (pi / 2 frac(j - j', N + 1)) G (pi frac(j - j', N + 1)) #scale(x: 240%, y: 240%)[\]] . $

(xii) まず $tilde(B)_(j \, j')$ について $j = j'$ の場合を考える.
$ tilde(B)_(j \, j') & = tilde(B)_(j \, j)\
 & = frac(1, N + 1) [cos (frac(1, N + 1) j pi) (1 + F (frac(2, N + 1) j pi)) - sin (frac(1, N + 1) j pi) G (frac(2, N + 1) j pi) + (1 + N) - 0]\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) (1 + frac(cos (j pi) sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi))) - sin (frac(1, N + 1) j pi) frac(sin (j pi) sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi)))\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) + (cos (frac(1, N + 1) j pi) cos (j pi) - sin (frac(1, N + 1) j pi) sin (j pi)) frac(sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi)))\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) + cos (frac(N + 2, N + 1) j pi) frac(sin (frac(N, N + 1) j pi), sin (frac(1, N + 1) j pi)))\
 & = 1 + frac(1, N + 1) (cos (frac(1, N + 1) j pi) sin (frac(1, N + 1) j pi) + cos (frac(N + 2, N + 1) j pi) sin (frac(N, N + 1) j pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, N + 1) j pi)\
 & = 1 + frac(1, N + 1) (1 / 2 sin (frac(2, N + 1) j pi) + 1 / 2 sin (- frac(2, N + 1) j pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, N + 1) j pi)\
 & = 1 . $

(xiii) 次に $tilde(B)_(j \, j')$ について $j eq.not j'$ の場合を考える.
$ tilde(B)_(j \, j') & = tilde(B)_(j \, j')\
 & med = frac(1, N + 1) #scale(x: 240%, y: 240%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) (1 + F (pi frac(j + j', N + 1)))\
 & - sin (pi / 2 frac(j + j', N + 1)) G (pi frac(j + j', N + 1))\
 & + cos (pi / 2 frac(j - j', N + 1)) (1 + F (pi frac(j - j', N + 1)))\
 & - sin (pi / 2 frac(j - j', N + 1)) G (pi frac(j - j', N + 1)) #scale(x: 240%, y: 240%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) (1 + frac(cos (1 / 2 \( j + j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j + j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi)))\
 & - sin (pi / 2 frac(j + j', N + 1)) frac(sin (1 / 2 \( j + j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j + j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi))\
 & + cos (pi / 2 frac(j - j', N + 1)) (1 + frac(cos (1 / 2 \( j - j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j - j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi)))\
 & - sin (pi / 2 frac(j - j', N + 1)) frac(sin (1 / 2 \( j - j' \) pi) sin (frac(N, 2 \( N + 1 \)) \( j - j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi)) #scale(x: 300%, y: 300%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) + (cos (pi / 2 frac(j + j', N + 1)) cos (frac(j + j', 2) pi) - sin (pi / 2 frac(j + j', N + 1)) sin (frac(j + j', 2) pi)) frac(sin (frac(N \( j + j' \), 2 \( N + 1 \)) pi), sin (frac(j + j', 2 \( N + 1 \)) pi))\
 & + cos (pi / 2 frac(j - j', N + 1)) + (cos (pi / 2 frac(j - j', N + 1)) cos (frac(j - j', 2) pi) - sin (pi / 2 frac(j - j', N + 1)) sin (frac(j - j', 2) pi)) frac(sin (frac(N \( j - j' \), 2 \( N + 1 \)) pi), sin (frac(j - j', 2 \( N + 1 \)) pi)) #scale(x: 300%, y: 300%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad cos (pi / 2 frac(j + j', N + 1)) + cos (frac(N + 2, 2 \( N + 1 \)) \( j + j' \) pi) frac(sin (frac(N, 2 \( N + 1 \)) \( j + j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi))\
 & + cos (pi / 2 frac(j - j', N + 1)) + cos (frac(N + 2, 2 \( N + 1 \)) \( j - j' \) pi) frac(sin (frac(N, 2 \( N + 1 \)) \( j - j' \) pi), sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi)) #scale(x: 300%, y: 300%)[\]]\
 & med = frac(1, N + 1) #scale(x: 300%, y: 300%)[\[] & quad 1 / 2 (sin (frac(j + j', N + 1) pi) + sin (\( j + j' \) pi) + sin (- frac(j + j', N + 1) pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, 2 \( N + 1 \)) \( j + j' \) pi)\
 & + 1 / 2 (sin (frac(j - j', N + 1) pi) + sin (\( j - j' \) pi) + sin (- frac(j - j', N + 1) pi)) #scale(x: 240%, y: 240%)[\/] sin (frac(1, 2 \( N + 1 \)) \( j - j' \) pi) #scale(x: 240%, y: 240%)[\]]\
 & = 0 . $ よって (xii), (xiii) の考察から次の式が成り立つ.
$ tilde(B)_(j \, j') = delta_(j \, j') . $

(xiv) これより $B_(j \, j')$ は (x) の考察から次のようになる.
$ B_(j \, j') & = 4 sin (pi / 2 frac(j, N + 1)) sin (pi / 2 frac(j', N + 1)) tilde(B)_(j \, j')\
 & = delta_(j \, j') 4 sin^2 (frac(pi, 2 \( N + 1 \)) j) . $

(xv) ポテンシャルエネルギーの表式 (vii) に代入して次のようになる.
$ sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 & = sum_(j = 1)^N sum_(j' = 1)^N B_(j \, j') Q_j Q_(j')\
 & = sum_(j = 1)^N sum_(j' = 1)^N delta_(j \, j') 4 sin^2 (frac(pi, 2 \( N + 1 \)) j) Q_j Q_(j')\
 & = 4 sum_(j = 1)^N sin^2 (frac(pi, 2 \( N + 1 \)) j) Q_j^2 . $

(xvi) よって Hamilton 関数は (vii) (xv) から次のように表される.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & = frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2\
 & = frac(1, 2 m) sum_(j = 1)^N P_j^2 + 2 kappa sum_(j = 1)^N sin^2 (frac(pi, 2 \( N + 1 \)) j) Q_j^2\
H^(1 "次元結晶") \( Q_1 \, dots.h \, Q_N \, P_1 \, dots.h \, P_N \) & = sum_(j = 1)^N (frac(1, 2 m) P_j^2 + 1 / 2 m omega_j^2 Q_j^2) . $
ただし, $omega_j$ を次のように定めた.
$ omega_j = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j) #h(2em) \( j = 1 \, dots.h \, N \) . $

#block[
Q 17-4. 1 次元結晶中の波数 $k$ に対する分散関係 $omega \( k \)$
は次のようになる.
$ omega \( k \) & = 2 sqrt(kappa / m) sin (1 / 2 k a) approx sqrt(kappa / m) k a + cal(O) \( \( k a \)^3 \) #h(2em) \( k a lt.double 1 \) . $

]
(i) $j = 1 \, dots.h \, N$ に対して $j$ 番目の基準振動 $q_i^(\( j \))$
は次のように計算される.
$ q_i^(\( j \)) & = sqrt(frac(2, N + 1)) sin (frac(pi, N + 1) j i)\
 & = sqrt(frac(2, N + 1)) sin (pi / a frac(j, N + 1) x_i)\
 & = sqrt(frac(2, N + 1)) sin (k_j x_i) . $ ただし, $i$
番目の原子の平衡位置の座標を $x_i = a i$ とし, $j$ 番目の基準振動の波数
$k_j$ を次のように定める.
$ k_j := pi / a frac(j, N + 1) #h(2em) \( j = 1 \, dots.h \, N \) . $

(ii) 基準振動 $q_i^(\( j \))$ の角振動数 $omega_j$ を波数 $k_j$
の関数として次のように表される.
$ omega \( k_j \) & = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j)\
 & = 2 sqrt(kappa / m) sin (1 / 2 k_j a) . $ よって分散関係
$omega = omega \( k \)$ は次のように与えられる.
$ omega \( k \) & = 2 sqrt(kappa / m) sin (1 / 2 k a) . $

(iii) この 1 次元結晶を伝わる線形波動 (弾性波, 音波)
が波数ごとに異なる速さを持って伝播するということから,
1次元結晶中にこれらを重ね合わせて波束が作られたとすると次第に波束の形が変化していき最終的に崩壊する.

(iv) 十分に長波長 $k a lt.double 1$
のとき次のように近似することで分散関係 $omega \( k \)$ は線形関係となる.
$ omega \( k \) & = 2 sqrt(kappa / m) sin (1 / 2 k a)\
 & approx 2 sqrt(kappa / m) (1 / 2 k a + cal(O) \( \( k a \)^3 \))\
 & = sqrt(kappa / m) k a + cal(O) \( \( k a \)^3 \) #h(2em) \( k a lt.double 1 \) . $

(v) 長波長の極限での弾性波の速さを音速という. 固体の音速 $v$
は次のようになる.
$ v & = lim_(k a arrow.r 0) frac(omega \( k \), k) = sqrt(kappa / m) a . $

(vi) (iv), (v) の考察より十分に長波長のとき分散関係が線形関係となるので
1 次元結晶中では線形波動は音速 $v$ と等しい速さを持って伝搬する.

#block[
Q 17-5. 1 次元結晶における基準振動の角振動数 $omega_j$
の分布を明らかにする.

]
(i)(ii) $omega_j$ は次のように表されることから $j = 1 \, dots.h \, N$
に対して単調増加となる.
$ omega_j & = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \)) j) . $
これより $omega_j$ の最大値と最小値は次のようになる.
$ omega_max & := max_(1 lt.eq j lt.eq N) omega_j = omega_N = 2 sqrt(kappa / m) sin (frac(pi N, 2 \( N + 1 \))) approx 2 sqrt(kappa / m) \,\
omega_min & := min_(1 lt.eq j lt.eq N) omega_j = omega_1 = 2 sqrt(kappa / m) sin (frac(pi, 2 \( N + 1 \))) approx 2 sqrt(kappa / m) frac(pi, 2 \( N + 1 \)) = sqrt(kappa / m) frac(pi, N + 1) . $

== 3 次元結晶における平衡位置の回りの調和振動を記述する Hamilton 関数
<次元結晶における平衡位置の回りの調和振動を記述する-hamilton-関数-1>
立方格子の各点に平衡位置を持つ $N^3$ 個の原子が全体として立方体に並んだ
3 次元結晶を物理系として記述して、古典力学により考察する。任意の
$i_x \, i_y \, i_z = 1 \, dots.h \, N$ に対してラベル
$\( i_x \, i_y \, i_z \)$ を持つ原子の平衡位置は格子定数 $a$ を用いて
$\( a i_x \, a i_y \, a i_z \)$ であるとする.

#block[
Q 17-6. このとき 3 次元結晶の Hamilton 関数は次のように与えられる.
$  & H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)\
:= & frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) p_(i_x \, i_y \, i_z \, alpha)^2\
+ & 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y \, i_z + 1 \, alpha) \)^2) . $
ただし $m$ は 1 個の原子の質量であり, $kappa$
は隣り合った原子間の原子間力のバネ定数とする.
また立方体の表面は固定されているとする.
$ i_x = 0 \, N + 1 or i_y = 0 \, N + 1 or i_z = 0 \, N + 1 arrow.r.double.long q_(i_x \, i_y \, i_z \, alpha) = 0 . $

]
Q17-3 の考察から 1 次元結晶の系の Hamilton 関数は次のように与えられる.
$ H^(1 "次元結晶") \( q_1 \, dots.h \, q_N \, p_1 \, dots.h \, p_N \) & := frac(1, 2 m) sum_(i = 1)^N p_i^2 + 1 / 2 kappa sum_(i = 0)^N \( q_i - q_(i + 1) \)^2 . $
3 次元結晶の系は $N^3$ 個の原子と $3$ 個の自由度があり,
それらの原子間力は独立にそれぞれの自由度と原子に働くと考えられる.
これより 3 次元結晶の系の Hamilton 関数
$H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)$
は次のように書ける.
$  & H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)\
:= & frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) p_(i_x \, i_y \, i_z \, alpha)^2\
+ & 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y \, i_z + 1 \, alpha) \)^2) . $
ただし $m$ は 1 個の原子の質量であり, $kappa$
は隣り合った原子間の原子間力のバネ定数とする.
また立方体の表面は固定されているとする.
$ i_x = 0 \, N + 1 or i_y = 0 \, N + 1 or i_z = 0 \, N + 1 arrow.r.double.long q_(i_x \, i_y \, i_z \, alpha) = 0 . $

== 3 次元結晶における平衡位置の回りの調和振動の基準モードの計算
<次元結晶における平衡位置の回りの調和振動の基準モードの計算-1>
固定端境界条件の 3 次元結晶の系を考えているので 1 次元の Fourier Sine
展開の基底 3 つの直積が基準振動になっていると予想できる.
これより古い座標 $q_(i_x \, i_y \, i_z \, alpha)$ を基準振動
$q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))$
で展開したときの振幅を新しい座標 $Q_(j_x \, j_y \, j_z \, alpha)$
とする.
$ q_(i_x \, i_y \, i_z \, alpha) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N Q_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) . $
この新しい座標 $Q_(j_x \, j_y \, j_z \, alpha)$ に対応する新しい運動量を
$P_(j_x \, j_y \, j_z \, alpha)$ とおくと Hamilton
関数について次のように表される.

#block[
Q 17-7. 新しい座標と運動量
$Q_(j_x \, j_y \, j_z \, alpha) \, P_(j_x \, j_y \, j_z \, alpha)$
において Hamilton 関数は次のように表される.
$ H^(3 "次元結晶") \( \( Q_(j_x \, j_y \, j_z \, alpha) \, P_(j_x \, j_y \, j_z \, alpha) \)_(1 lt.eq j_x \, j_y \, j_z lt.eq N \, alpha = x \, y \, z) \) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) P_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 Q_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし, $omega_(j_x \, j_y \, j_z)$ は次のように定めた.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

]
(i) Q17-1 の考察より新しい運動量を古い運動量と座標,
新しい座標から求めることができる.
$ P_(j_x \, j_y \, j_z \, alpha) & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N frac(partial q_(i_x \, i_y \, i_z \, alpha), partial Q_(j_x \, j_y \, j_z \, alpha)) p_(i_x \, i_y \, i_z \, alpha)\
 & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) p_(i_x \, i_y \, i_z \, alpha) . $

(ii) この点正準変換に対し,
運動エネルギーは新しい運動量を用いて表せられる.
$  & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N P_(j_x \, j_y \, j_z \, alpha)^2\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N (sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) p_(i_x \, i_y \, i_z \, alpha))^2\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N (sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) p_(i_x \, i_y \, i_z \, alpha) q_(i_(x'))^(\( j_x \)) q_(i_(y'))^(\( j_y \)) q_(i_(z'))^(\( j_z \)) p_(i_(x') \, i_(y') \, i_(z') \, alpha))\
= & sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N delta_(i_x \, i_(x')) delta_(i_y \, i_(y')) delta_(i_z \, i_(z')) p_(i_x \, i_y \, i_z \, alpha) p_(i_(x') \, i_(y') \, i_(z') \, alpha)\
= & sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N p_(i_x \, i_y \, i_z \, alpha)^2 . $

(iii) またポテンシャルエネルギーについても新しい座標で表すことができる.
$  & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2\
= & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N (sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N (Q_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) - Q_(j_x \, j_y \, j_z \, alpha) q_(i_x + 1)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))))^2\
= & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N\
 & (Q_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) - Q_(j_x \, j_y \, j_z \, alpha) q_(i_x + 1)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))) (Q_(j_(x') \, j_(y') \, j_(z') \, alpha) q_(i_x)^(\( j_(x') \)) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \)) - Q_(j_(x') \, j_(y') \, j_(z') \, alpha) q_(i_x + 1)^(\( j_(x') \)) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \)))\
= & sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N Q_(j_x \, j_y \, j_z \, alpha) (q_(i_x)^(\( j_x \)) - q_(i_x + 1)^(\( j_x \))) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) Q_(j_(x') \, j_(y') \, j_(z') \, alpha) (q_(i_x)^(\( j_(x') \)) - q_(i_x + 1)^(\( j_(x') \))) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \))\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N B_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) Q_(j_x \, j_y \, j_z \, alpha) Q_(j_(x') \, j_(y') \, j_(z') \, alpha)\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N 4 sin^2 (frac(pi, 2 \( N + 1 \)) j_x) delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) Q_(j_x \, j_y \, j_z \, alpha) Q_(j_(x') \, j_(y') \, j_(z') \, alpha)\
= & 4 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sin^2 (frac(pi, 2 \( N + 1 \)) j_x) Q_(j_x \, j_y \, j_z \, alpha)^2 . $

(iv) これより Hamilton 関数は新しい座標と運動量を用いて表すことができる.
$  & H^(3 "次元結晶") \( \( q_(i_x \, i_y \, i_z \, alpha) \, p_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) \)\
:= & frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) p_(i_x \, i_y \, i_z \, alpha)^2\
+ & 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( q_(i_x \, i_y \, i_z \, alpha) - q_(i_x \, i_y \, i_z + 1 \, alpha) \)^2)\
= & frac(1, 2 m) sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) P_(j_x \, j_y \, j_z \, alpha)^2\
+ & 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (sin^2 (frac(pi, 2 \( N + 1 \)) j_x) Q_(j_x \, j_y \, j_z \, alpha)^2 + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) Q_(j_x \, j_y \, j_z \, alpha)^2 + sin^2 (frac(pi, 2 \( N + 1 \)) j_z) Q_(j_x \, j_y \, j_z \, alpha)^2)\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) P_(j_x \, j_y \, j_z \, alpha)^2 + 2 kappa (sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) Q_(j_x \, j_y \, j_z \, alpha)^2)\
= & sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) P_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 Q_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし, $omega_(j_x \, j_y \, j_z)$ は次のように定めた.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

これより 3 次元結晶の模型の基準振動は位置や運動量に独立な角振動数
$omega_(j_x \, j_y \, j_z)$ の調和振動子となることがわかった.

#block[
Q 17-8. 3 次元結晶中の波数 $k$ における分散関係 $omega \( k \)$
は次のように表される.
$ omega \( bold(k) \) & = 2 sqrt(kappa / m) sqrt(sin^2 (a / 2 k_x) + sin^2 (a / 2 k_y) + sin^2 (a / 2 k_z)) approx sqrt(kappa / m) a \| bold(k) \| + cal(O) \( \| bold(k) \|^3 \) #h(2em) \( a \| bold(k) \| lt.double 1 \) . $

]
(i) 3 次元結晶の模型の基準振動は角振動数 $omega_(j_x \, j_y \, j_z)$
に依存し, それに対する波数
$bold(k)_(j_x \, j_y \, j_z) = \( k_(j_x) \, k_(j_y) \, k_(j_z) \)$
を考えると次のようになる.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z))\
 & = 2 sqrt(kappa / m) sqrt(sin^2 (a / 2 k_(j_x)) + sin^2 (a / 2 k_(j_y)) + sin^2 (a / 2 k_(j_z))) . $
これより基準振動に対する波数 $bold(k)_(j_x \, j_y \, j_z)$
は次のように定められる.
$ bold(k)_(j_x \, j_y \, j_z) & = frac(pi, a \( N + 1 \)) \( j_x \, j_y \, j_z \) . $

(ii) このように定めた波数を連続的に捉え直すことで分散関係
$omega \( bold(k) \)$ は波数 $bold(k) = \( k_x \, k_y \, k_z \)$
を用いて次のようになる.
$ omega \( bold(k) \) & = 2 sqrt(kappa / m) sqrt(sin^2 (a / 2 k_x) + sin^2 (a / 2 k_y) + sin^2 (a / 2 k_z)) . $

(iii) このとき長波長 ($a \| bold(k) \| lt.double 1$)
では分散関係は次の線形関係となることがわかる.
$ omega \( bold(k) \) & = 2 sqrt(kappa / m) sqrt(sin^2 (a / 2 k_x) + sin^2 (a / 2 k_y) + sin^2 (a / 2 k_z))\
 & approx 2 sqrt(kappa / m) sqrt((a / 2 k_x + cal(O) \( k_x^3 \))^2 + (a / 2 k_y + cal(O) \( k_y^3 \))^2 + (a / 2 k_z + cal(O) \( k_z^3 \))^2)\
 & = 2 sqrt(kappa / m) sqrt((a / 2 \| bold(k) \|)^2 + cal(O) \( \| bold(k) \|^4 \))\
 & = 2 sqrt(kappa / m) (a / 2 \| bold(k) \| sqrt(1 + cal(O) \( \| bold(k) \|^2 \)))\
 & approx sqrt(kappa / m) a \| bold(k) \| + cal(O) \( \| bold(k) \|^3 \) #h(2em) \( a \| bold(k) \| lt.double 1 \) . $

(iv) これより音速 $v$ はその定義式から次のようになる.
$ v & = lim_(\| bold(k) \| arrow.r 0) frac(omega, \| bold(k) \|) = sqrt(kappa / m) a . $

#block[
Q 17-9. 3 次元結晶の模型における調和振動子の角振動数の個数分布関数
$g \( omega \)$ は次のように表される.
$ g \( omega \) & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \) . $

]
(i) 調和振動子の角振動数 $omega \( bold(k)_(j_x \, j_y \, j_z) \)$
の個数分布関数 $g \( omega \)$ について
$omega \( bold(k)_(j_x \, j_y \, j_z) \)$ は離散的な値を持ち,
各基準モード $\( j_x \, j_y \, j_z \, alpha \)$
によってパラメータ化されるのでデルタ関数を用いて次のように表される.
$ g \( omega \) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \) . $
また $omega \( bold(k)_(j_x \, j_y \, j_z) \)$ は
$omega \( bold(k)_(j_x \, j_y \, j_z) \) gt.eq 0$ に限られるから
$omega gt.eq 0$ となる.

(ii) これより調和振動子の総数は次のようになる.
$ integral_0^oo upright(d) omega g \( omega \) & = 3 integral_0^oo upright(d) omega sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 N^3 . $

ただこのような調和振動子の角振動数の個数分布関数 $g \( omega \)$
をさらに簡単にすることは分散関係 $omega \( bold(k) \)$
の複雑さのためにできない為,
これに統計力学を適用しても計算がすぐに行き詰まる.

Debye はこの模型を修正することでこの困難を打開した.
新しい模型には解析計算ができるという要請と十分に低温であるか,
あるいは十分に高温であるかという温度に関する両極端な漸近領域においてこれまでの模型と同じ結果を導くという要請をした.

== Debye模型
<debye模型>
以下では独立な調和振動子の角振動数に関する個数分布関数 $g \( omega \)$
を解析的に計算できるよう分散関係を修正した新しい模型を考える. これを
Debye 模型という.

#block[
Q 17-10.
十分に高温において前節の模型と新しい模型が同じ比熱の極限値を持つには独立な調和振動子の総数について一致することが必要十分である.

]
十分に高温ではエントロピーが高くなる為,
すべての独立な調和振動子のエネルギー状態について実現確率は等分配される.
このとき比熱は独立な調和振動子の総数のみに依存するから前節の模型と等しい総数となることが必要十分である.

#block[
Q 17-11.
十分に低温において前節の模型と新しい模型が同じ比熱の漸近的な振る舞いを示すためには分散関係の関数
$omega \( bold(k) \)$ が長波長の漸近領域 $a \| bold(k) \| lt.double 1$
において一致することが十分である.

]
十分に低温ではエントロピーが低くなり, エネルギーが低い状態,
つまり長波長に関する状態に実現確率が集まるので,
前節の模型と新しい模型について長波長の漸近領域において分散関係が一致するなら同じ比熱の漸近的な振る舞いとなることが言える.
\
これらより Debye 模型では独立な調和振動子の総数が $3 N^3$
で調和振動子の角振動数 $omega \( bold(k) \)$ は次のように定義する.
$ omega \( bold(k) \) & := sqrt(kappa / m) a \| bold(k) \| . $
また新しい模型の固有モードのラベルは前節と同じく
$\( j_x \, j_y \, j_z \, alpha \)$
$\( j_x \, j_y \, j_x = 1 \, dots.h \, N \, alpha = x \, y \, z \)$
とし, 固有モード $\( j_x \, j_y \, j_z \, alpha \)$ の空間的な波数
$bold(k)_(j_x \, j_y \, j_z)$ は次のように与えられる.
$ bold(k)_(j_x \, j_y \, j_z) & = frac(pi, a \( N + 1 \)) \( j_x \, j_y \, j_z \) . $

#block[
Q 17-12. Debye 模型における調和振動子の角振動数の個数分布関数
$g \( omega \)$ は次のように表される.
$ g \( omega \) & = cases(delim: "{", frac(9 N^3, omega_D) (omega / omega_D)^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \))\
omega_D & = \( 6 pi^2 \)^(1 \/ 3) sqrt(kappa / m) . $

]
(i) Debye 模型における調和振動子の角振動数の個数分布関数 $g \( omega \)$
は $omega \( bold(k)_(j_x \, j_y \, j_z) \)$ が固有モード
$\( j_x \, j_y \, j_z \, alpha \)$
によってパラメータ化されるのでデルタ関数を用いて次のように表される.
$ g \( omega \) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \) #h(2em) \( omega gt.eq 0 \) . $

(ii) また調和振動子の総数は 3 次元結晶の模型と同様に $3 N^3$ となる.
$ integral_0^oo upright(d) omega g \( omega \) & = 3 integral_0^oo upright(d) omega sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 N^3 . $

(iii) ここでDebye 模型における調和振動子の角振動数の個数分布関数
$g \( omega \)$ を具体的に計算すると次のようになる.
$ g \( omega \) & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta \( omega - omega \( bold(k)_(j_x \, j_y \, j_z) \) \)\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (omega - sqrt(kappa / m) a lr(|frac(pi, a \( N + 1 \)) \( j_x \, j_y \, j_z \)|))\
 & = 3 sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (omega - sqrt(kappa / m) frac(pi, N + 1) sqrt(j_x^2 + j_y^2 + j_z^2))\
 & = 3 sqrt(m / kappa) frac(N + 1, pi) sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2)) . $

(iv) またデルタ関数を少し広がった有限の Gauss 分布とすることで
$g \( omega \)$ を滑らかな分布として近似できる.
これより総和は次のように積分で置き換えられることが言える.
$ g \( omega \) & = 3 sqrt(m / kappa) frac(N + 1, pi) sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2))\
 & approx 3 sqrt(m / kappa) frac(N + 1, pi) integral_1^N upright(d) j_x integral_1^N upright(d) j_y integral_1^N upright(d) j_z delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2)) . $

(v) ここで $omega$ に関する次の条件が成り立つとする.
$ sqrt(m / kappa) frac(N + 1, pi) omega lt.eq N . $<omega_condition>
特に $g \( omega \)$
の被積分関数の積分値は次のような幾何学的解釈で近似できる.
$  & integral_1^N upright(d) j_x integral_1^N upright(d) j_y integral_1^N upright(d) j_z delta (sqrt(m / kappa) frac(N + 1, pi) omega - sqrt(j_x^2 + j_y^2 + j_z^2))\
= & integral_V upright(d) bold(r) delta (\| bold(r) \| - sqrt(m / kappa) frac(N + 1, pi) omega) #h(2em) (V := { \( x \, y \, z \) divides 1 lt.eq x lt.eq N \, 1 lt.eq y lt.eq N \, 1 lt.eq z lt.eq N })\
approx & ("半径" sqrt(m / kappa) frac(N + 1, pi) omega の 2 "次元球面" S_2 "を第" 1 "象限で切り取った曲面の表面積") . $
これより $g \( omega \)$ は次のように書ける.
$ g \( omega \) & approx 3 sqrt(m / kappa) frac(N + 1, pi) times ("半径" sqrt(m / kappa) frac(N + 1, pi) omega の 2 "次元球面" S_2 "を第" 1 "象限で切り取った曲面の表面積") . $

(vi) それを具体的に計算すると次のようになる.
$ g \( omega \) & approx 3 sqrt(m / kappa) frac(N + 1, pi) times ("半径" sqrt(m / kappa) frac(N + 1, pi) omega の 2 "次元球面" S_2 "を第" 1 "象限で切り取った曲面の表面積")\
 & = 3 sqrt(m / kappa) frac(N + 1, pi) times frac(4 pi, 8) (sqrt(m / kappa) frac(N + 1, pi) omega)^2\
 & = frac(3 pi, 2) (sqrt(m / kappa) frac(N + 1, pi))^3 omega^2 . $

(vii) $omega$ に関する条件 @omega_condition
が成り立たない場合は立方体の積分範囲と球面の表面の共通部分の面積となるので複雑な式となってしまう.
ただ Debye 模型は低温における比熱の振る舞いからの要請により
$omega \( bold(k) \)$ が大きいときは気にしなくて良い模型でした. これより
$g \( omega \)$ の $\( j_x \, j_y \, j_z \)$
に関する積分範囲を立方体から球へ修正することが許され, 次のように
$g \( omega \)$ は表される.
$ g \( omega \) & = cases(delim: "{", frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \)) . $
ただし $N gt.double 1$ であることから $N + 1$ を $N$ と近似し,
また打ち切る角振動数 $omega_D$ を次のように定める.
$ integral_0^oo upright(d) omega g \( omega \) & = integral_0^(omega_D) upright(d) omega g \( omega \) = 3 N^3 . $
この $omega_D$ を Debye の角振動数という.

(viii) これより Debye の角振動数 $omega_D$ は次のように計算される.
$ integral_0^(omega_D) upright(d) omega g \( omega \) & = integral_0^(omega_D) upright(d) omega frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 = pi / 2 (sqrt(m / kappa) N / pi)^3 omega_D^3 = 3 N^3 \,\
omega_D & = (3 N^3 2 / pi)^(1 \/ 3) sqrt(kappa / m) pi / N = \( 6 pi^2 \)^(1 \/ 3) sqrt(kappa / m) . $

(ix) また Debye の角振動数 $omega_D$ を用いて $g \( omega \)$
は次のように表される.
$ g \( omega \) & = cases(delim: "{", frac(3 pi, 2) (sqrt(m / kappa) N / pi)^3 omega^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \))\
 & = cases(delim: "{", frac(9 N^3, omega_D) (omega / omega_D)^2 & \( omega lt.eq omega_D \), 0 & \( omega > omega_D \)) . $

現実の物質に Debye 模型を当てはめるときには, それぞれの物質は固有の
Debye 角振動数 $omega_D$ を持つことになる.

== 量子論での基準モード
<量子論での基準モード>
今まで古典力学により行ってきた考察を量子力学に翻訳する. まず Debye
模型の Hamilton 関数は次のように与えられる.
$ hat(H) & = frac(1, 2 m) sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(alpha = x \, y \, z) hat(p)_(i_x \, i_y \, i_z \, alpha)^2\
 & + 1 / 2 kappa sum_(i_x = 0)^N sum_(i_y = 0)^N sum_(i_z = 0)^N sum_(alpha = x \, y \, z) (\( hat(q)_(i_x \, i_y \, i_z \, alpha) - hat(q)_(i_x + 1 \, i_y \, i_z \, alpha) \)^2 + \( hat(q)_(i_x \, i_y \, i_z \, alpha) - hat(q)_(i_x \, i_y + 1 \, i_z \, alpha) \)^2 + \( hat(q)_(i_x \, i_y \, i_z \, alpha) - hat(q)_(i_x \, i_y \, i_z + 1 \, alpha) \)^2) . $
ただし $m$ は 1 個の原子の質量であり, $kappa$
は隣り合った原子間の原子間力のバネ定数とする.
また立方体の表面は固定されているとする.
$ i_x = 0 \, N + 1 or i_y = 0 \, N + 1 or i_z = 0 \, N + 1 arrow.r.double.long hat(q)_(i_x \, i_y \, i_z \, alpha) = 0 . $
また位置演算子 $hat(q)_(i_x \, i_y \, i_z \, alpha)$ と運動量演算子
$hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')$ は正準交換関係を満たす.
$ [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')] & = sqrt(- 1) planck delta_(i_x \, i_(x')) delta_(i_y \, i_(y')) delta_(i_z \, i_(z')) delta_(alpha \, alpha') \,\
[hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(q)_(i_(x') \, i_(y') \, i_(z') \, alpha')] & = [hat(p)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')] = 0\
\( 1 lt.eq i_x \, i_y \, i_z \, i_(x') \, i_(y') \, i_(z') & lt.eq N \, alpha \, alpha' = x \, y \, z \) . $
古典論での点正準変換を量子論でも行う.
$\( hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_x \, i_y \, i_z \, alpha) \)_(1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z) arrow.r \( hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_x \, j_y \, j_z \, alpha) \)_(1 lt.eq j_x \, j_y \, j_z lt.eq N \, alpha = x \, y \, z)$
を次のように定める.
$ hat(q)_(i_x \, i_y \, i_z \, alpha) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N hat(Q)_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) #h(2em) \( 1 lt.eq i_x \, i_y \, i_z lt.eq N \, alpha = x \, y \, z \) \,\
hat(P)_(j_x \, j_y \, j_z \, alpha) & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N hat(p)_(i_x \, i_y \, i_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) #h(2em) \( 1 lt.eq j_x \, j_y \, j_z lt.eq N \, alpha = x \, y \, z \) . $

#block[
Q 17-13. 新しい位置演算子 $hat(Q)_(j_x \, j_y \, j_z \, alpha)$
と運動量演算子 $hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')$
について正準交換関係を満たす.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = sqrt(- 1) planck delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) delta_(alpha \, alpha') \,\
[hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = 0\
\( 1 lt.eq j_x \, j_y \, j_z \, j_(x') \, j_(y') \, j_(z') & lt.eq N \, alpha \, alpha' = x \, y \, z \) . $

]
まず $hat(q)_(i_x \, i_y \, i_z \, alpha)$,
$hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')$
の交換関係について左を展開するものと右を展開するもので分けて計算すると次のようになる.
$ [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [hat(q)_(i_x \, i_y \, i_z \, alpha) \, sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha') q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))]\
 & = sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha')] q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N sqrt(- 1) planck delta_(i_x \, i_(x')) delta_(i_y \, i_(y')) delta_(i_z \, i_(z')) delta_(alpha \, alpha') q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = sqrt(- 1) planck delta_(alpha \, alpha') q_(i_x)^(\( j_(x') \)) q_(i_y)^(\( j_(y') \)) q_(i_z)^(\( j_(z') \)) \,\
[hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N hat(Q)_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')]\
 & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) . $
これより $q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \))$
の直交性から次のことがわかる.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = sqrt(- 1) planck delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) delta_(alpha \, alpha') . $
同様に $hat(q)_(i_x \, i_y \, i_z \, alpha)$ 同士,
$hat(P)_(j_x \, j_y \, j_z \, alpha)$
同士の交換関係について計算すると次のようになる.
$ [hat(q)_(i_x \, i_y \, i_z \, alpha) \, hat(q)_(i_(x') \, i_(y') \, i_(z') \, alpha')] & = [sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N hat(Q)_(j_x \, j_y \, j_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) \, sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha') q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))]\
 & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(j_(x') = 1)^N sum_(j_(y') = 1)^N sum_(j_(z') = 1)^N [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = 0 \,\
[hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N hat(p)_(i_x \, i_y \, i_z \, alpha) q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) \, sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))]\
 & = sum_(i_x = 1)^N sum_(i_y = 1)^N sum_(i_z = 1)^N sum_(i_(x') = 1)^N sum_(i_(y') = 1)^N sum_(i_(z') = 1)^N [hat(p)_(i_x \, i_y \, i_z \, alpha) \, hat(p)_(i_(x') \, i_(y') \, i_(z') \, alpha)] q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))\
 & = 0 . $ これより
$q_(i_x)^(\( j_x \)) q_(i_y)^(\( j_y \)) q_(i_z)^(\( j_z \)) q_(i_(x'))^(\( j_(x') \)) q_(i_(y'))^(\( j_(y') \)) q_(i_(z'))^(\( j_(z') \))$
の直交性から次のことがわかる.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = [hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = 0 . $
よって示された.
$ [hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = sqrt(- 1) planck delta_(j_x \, j_(x')) delta_(j_y \, j_(y')) delta_(j_z \, j_(z')) delta_(alpha \, alpha') \,\
[hat(Q)_(j_x \, j_y \, j_z \, alpha) \, hat(Q)_(j_(x') \, j_(y') \, j_(z') \, alpha')] & = [hat(P)_(j_x \, j_y \, j_z \, alpha) \, hat(P)_(j_(x') \, j_(y') \, j_(z') \, alpha')] = 0\
\( 1 lt.eq j_x \, j_y \, j_z \, j_(x') \, j_(y') \, j_(z') & lt.eq N \, alpha \, alpha' = x \, y \, z \) . $

#block[
Q 17-14. Hamilton 演算子 $hat(H)$ は独立な調和振動子の Hamilton
演算子の和となる.
$ hat(H) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) hat(P)_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 hat(Q)_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし $omega_(j_x \, j_y \, j_z)$ は次のように与えられる.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

]
Q 17-7 で位置,
運動量が演算子だとしても同様に計算できるよう書いたので同じ結果が得られる.
よって Hamilton 演算子は次のように書ける.
$ hat(H) & = sum_(j_x = 1)^N sum_(j_y = 1)^N sum_(j_z = 1)^N sum_(alpha = x \, y \, z) (frac(1, 2 m) hat(P)_(j_x \, j_y \, j_z \, alpha)^2 + 1 / 2 m omega_(j_x \, j_y \, j_z)^2 hat(Q)_(j_x \, j_y \, j_z \, alpha)^2) . $
ただし $omega_(j_x \, j_y \, j_z)$ は次のように与えられる.
$ omega_(j_x \, j_y \, j_z) & = 2 sqrt(kappa / m) sqrt(sin^2 (frac(pi, 2 \( N + 1 \)) j_x) + sin^2 (frac(pi, 2 \( N + 1 \)) j_y) + sin^2 (frac(pi, 2 \( N + 1 \)) j_z)) . $

== Debye 模型による固体の比熱 $C$
<debye-模型による固体の比熱-c>
#block[
Q 17-15. Debye 模型における内部エネルギーの表式は次のようになる.
$ U & = U_0 + 9 N^3 planck omega_D I \( beta planck omega_D \) . $
ただし温度 $T$ に依存しない定数のエネルギー $U_0$, $I \( b \)$
について次のように定められる.
$ U_0 & = 3 / 8 \( 3 N^3 \) planck omega_D \,\
I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1) . $

]
$ U & = integral_0^oo upright(d) omega g \( omega \) u \( omega \)\
 & = integral_0^(omega_D) upright(d) omega frac(9 N^3, omega_D) (omega / omega_D)^2 (1 / 2 + frac(1, e^(beta planck omega) - 1)) planck omega\
 & = 9 N^3 planck integral_0^(omega_D) upright(d) omega (omega / omega_D)^3 (1 / 2 + frac(1, e^(beta planck omega) - 1))\
 & = 9 N^3 planck omega_D integral_0^1 upright(d) x (1 / 2 + frac(1, e^(beta planck omega_D x) - 1)) x^3\
 & = 3 / 8 \( 3 N^3 \) planck omega_D + 9 N^3 planck omega_D I \( beta planck omega_D \)\
 & = U_0 + 9 N^3 planck omega_D I \( beta planck omega_D \) . $
ただし温度 $T$ に依存しない定数のエネルギー $U_0$, $I \( b \)$
について次のように定められる.
$ U_0 & = 3 / 8 \( 3 N^3 \) planck omega_D \,\
I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1) . $

以下からは
$b = beta planck omega_D = planck omega_D \/ \( k_B T \)$
という関係を用いる.

#block[
Q 17-16. Debye 模型における比熱 $C$ の表式は次のようになる.
$ C & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b) . $

]
比熱の定義式に代入することで次のようになる.
$ C & = integral_0^oo upright(d) omega g \( omega \) c \( omega \)\
 & = integral_0^(omega_D) upright(d) omega frac(9 N^3, omega_D) (omega / omega_D)^2 k_B (frac(beta planck omega e^(beta planck omega \/ 2), e^(beta planck omega) - 1))^2\
 & = 9 k_B N^3 \( beta planck omega_D \)^2 integral_0^(omega_D) frac(upright(d) omega, omega_D) (omega / omega_D)^4 frac(e^(beta planck omega), \( e^(beta planck omega) - 1 \)^2)\
 & = 3 n R dot.op 3 b^2 integral_0^1 upright(d) x frac(x^4 e^(b x), \( e^(b x) - 1 \)^2)\
 & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b) . $

#block[
Q 17-17. 高温の漸近領域 $b lt.double 1$ における積分 $I \( b \)$
は次のように評価できる.
$ I \( b \) & = frac(1, 3 b) - 1 / 8 + 1 / 60 b - 1 / 5040 b^3 + 1 / 272160 b^5 - dots.h.c . $

]
(i) $x lt.double 1$ において $e^x approx 1 + x$ と近似できる.
これより高温の漸近領域 $b lt.double 1$ において $b x lt.double 1$
であるから $I \( b \)$ は次のように近似できる.
$ I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1) approx integral_0^1 upright(d) x frac(x^3, b x) = integral_0^1 upright(d) x x^2 / b = frac(1, 3 b) . $

(ii) Bernoulli 数 $B_n$ の定義を用いて次のように計算できる.
$ I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1)\
 & = integral_0^1 upright(d) x sum_(n = 0)^oo frac(B_n b^(n - 1), n !) x^(n + 2)\
 & = sum_(n = 0)^oo frac(B_n, \( n + 3 \) n !) b^(n - 1)\
 & = frac(1, 3 b) - 1 / 8 + 1 / 60 b - 1 / 5040 b^3 + 1 / 272160 b^5 - dots.h.c . $

#block[
Q 17-18. 高温の漸近領域 $b lt.double 1$ における比熱 $C$
は次のように評価できる.
$ C & = 3 n R (1 - 1 / 20 (frac(planck omega_D, k_B T))^2 + 1 / 560 (frac(planck omega_D, k_B T))^4 - 1 / 18144 (frac(planck omega_D, k_B T))^6 + dots.h.c) . $

]
(i) まず Q 17-17(i) の結果を比熱の表式に適用すると次のようになる.
$ C & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b) approx 3 n R dot.op \( - 3 \) b^2 frac(upright(d), upright(d) b) \( frac(1, 3 b) \) = 3 n R . $

(ii) 次に Q 17-17(ii) の結果を比熱の表式に適用すると次のようになる.
$ C & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b)\
 & approx 3 n R dot.op \( - 3 \) b^2 frac(upright(d), upright(d) b) \( frac(1, 3 b) - 1 / 8 + 1 / 60 b - 1 / 5040 b^3 + 1 / 272160 b^5 - dots.h.c \)\
 & = 3 n R dot.op \( - 3 \) b^2 (- frac(1, 3 b^2) + 1 / 60 - 1 / 1680 b^2 + 1 / 54432 b^4 - dots.h.c)\
 & = 3 n R (1 - 1 / 20 b^2 + 1 / 560 b^4 - 1 / 18144 b^6 + dots.h.c)\
 & = 3 n R (1 - 1 / 20 (frac(planck omega_D, k_B T))^2 + 1 / 560 (frac(planck omega_D, k_B T))^4 - 1 / 18144 (frac(planck omega_D, k_B T))^6 + dots.h.c) . $

#block[
Q 17-19. 低温の漸近領域 $b gt.double 1$ における積分 $I \( b \)$
は次のように評価できる. $ I \( b \) & approx pi^4 / 15 1 / b^4 . $

]
(i) 初項 $e^(- b x)$ 公比 $e^(- b x)$ の無限等比数列の和は
$1 \/ \( e^(b x) + 1 \)$ である. これより $I \( b \)$
は次のように表される.
$ I \( b \) & = integral_0^1 upright(d) x frac(x^3, e^(b x) - 1) = integral_0^1 upright(d) x x^3 sum_(n = 1)^oo e^(- n b x) = sum_(n = 1)^oo integral_0^1 upright(d) x x^3 e^(- n b x) . $

(ii) これより
$ I \( b \) & = sum_(n = 1)^oo integral_0^1 upright(d) x x^3 e^(- n b x)\
 & = sum_(n = 1)^oo frac(1, \( n b \)^4) integral_0^(n b) upright(d) t t^3 e^(- t) #h(2em) \( t = n b x \)\
 & = sum_(n = 1)^oo frac(1, \( n b \)^4) gamma \( 4 \, n b \) . $
ただし, 第一種不完全ガンマ関数 $gamma \( z \, p \)$
は次の式で定義される.
$ gamma \( z \, p \) & := integral_0^p upright(d) t t^(z - 1) e^(- t) . $

(iii) さらに $I \( b \)$ は次のように式変形できる.
$ I \( b \) & = sum_(n = 1)^oo frac(1, \( n b \)^4) gamma \( 4 \, n b \)\
 & = sum_(n = 1)^oo frac(1, \( n b \)^4) \( Gamma \( 4 \) - Gamma \( 4 \, n b \) \)\
 & = 1 / b^4 (6 sum_(n = 1)^oo 1 / n^4 - sum_(n = 1)^oo 1 / n^4 Gamma \( 4 \, n b \))\
 & = 1 / b^4 (6 zeta \( 4 \) - sum_(n = 1)^oo 1 / n^4 Gamma \( 4 \, n b \)) . $
ただし, 第 2 種不完全ガンマ関数 $Gamma \( z \, p \)$, ガンマ関数
$Gamma \( z \)$, ゼータ関数 $zeta \( z \)$ は次のように定義される.
$ Gamma \( z \, p \) & := integral_p^oo upright(d) t t^(z - 1) e^(- t)\
Gamma \( z \) & := integral_0^oo upright(d) t t^(z - 1) e^(- t) = gamma \( z \, p \) + Gamma \( z \, p \)\
zeta \( s \) & := sum_(n = 1)^oo 1 / n^s . $

(iv) ここでゼータ関数 $zeta \( 4 \)$ の値は次の通りとなる.
$ zeta \( 4 \) & = pi^4 / 90 . $ よって $I \( b \)$ は次のようになる.
$ I \( b \) & = 1 / b^4 (6 zeta \( 4 \) - sum_(n = 1)^oo 1 / n^4 Gamma \( 4 \, n b \))\
 & = 1 / b^4 (pi^4 / 15 - sum_(n = 1)^oo 1 / n^4 Gamma \( 4 \, n b \)) . $

(v) 第二種不完全ガンマ関数 $Gamma \( z \, p \)$ の $p$
の極限について積分範囲が小さくなっていき,
被積分関数は発散しないので次のようになる.
$ lim_(p arrow.r + oo) Gamma \( z \, p \) & = lim_(p arrow.r + oo) integral_p^oo upright(d) t t^(z - 1) e^(- t) = 0 . $

(vi) 低温の漸近領域 $b gt.double 1$ において (v)
の考察から第二項を無視した近似を行えることがいえる. よって $I \( b \)$
は次の値となる.
$ I \( b \) & = 1 / b^4 (pi^4 / 15 - sum_(n = 1)^oo 1 / n^4 Gamma \( 4 \, n b \)) approx pi^4 / 15 1 / b^4 . $

#block[
Q 17-20. 低温の漸近領域 $b gt.double 1$ における積分 $I \( b \)$
はより精密に次のように評価される.
$ I \( b \) & approx pi^4 / 15 1 / b^4 - b^3 e^(- b) . $

]
(i) $Gamma \( z \, p \)$ について部分積分することで次のように書ける.
$  & quad Gamma \( z \, p \)\
 & = integral_p^oo upright(d) t t^(z - 1) e^(- t)\
 & = - [t^(z - 1) e^(- t)]_p^oo - [\( z - 1 \) t^(z - 2) e^(- t)]_p^oo - dots.h.c - [\( z - 1 \) dots.h.c \( z - n \) t^(z - n - 1) e^(- t)]_p^oo + integral_p^oo upright(d) t \( z - 1 \) dots.h.c \( z - n \) t^(z - n - 1) e^(- t)\
 & = p^(z - 1) e^(- p) + \( z - 1 \) p^(z - 2) e^(- p) + dots.h.c + \( z - 1 \) dots.h.c \( z - n \) p^(z - n - 1) e^(- p) + integral_p^oo upright(d) t \( z - 1 \) \( z - 2 \) dots.h.c \( z - n \) t^(z - n - 1) e^(- t)\
 & = p^(z - 1) e^(- p) (1 + sum_(m = 1)^oo 1 / p^m \( z - 1 \) \( z - 2 \) dots.h.c \( z - m \)) #h(2em) \( because n arrow.r oo \) . $

(ii) (i) の結果を用いて $z = 4$ を代入すると次のようになる.
$ Gamma \( 4 \, p \) & = p^3 e^(- p) (1 + 3 / p + 6 / p^2 + 6 / p^3)\
 & = e^(- p) (p^3 + 3 p^2 + 6 p + 6) . $

(iii) これより積分 $I \( b \)$
の第二種不完全ガンマ関数を展開することで次のようになる.
$ I \( b \) & = 1 / b^4 (pi^4 / 15 - sum_(n = 1)^oo 1 / n^4 Gamma \( 4 \, n b \))\
 & = 1 / b^4 (pi^4 / 15 - sum_(n = 1)^oo 1 / n^4 e^(- n b) (\( n b \)^3 + 3 \( n b \)^2 + 6 n b + 6))\
 & = 1 / b^4 (pi^4 / 15 - sum_(n = 1)^oo (b^3 / n + frac(3 b^2, n^2) + frac(6 b, n^3) + 6 / n^4) e^(- n b)) . $

(iv) この補正項について次のような不等式が成り立つ.
$ 0 < sum_(n = 1)^oo (b^3 / n + frac(3 b^2, n^2) + frac(6 b, n^3) + 6 / n^4) e^(- n b) < \( b^3 + 3 b^2 + 6 b + 6 \) sum_(n = 1)^oo e^(- n b) = \( b^3 + 3 b^2 + 6 b + 6 \) frac(e^(- b), 1 - e^(- b)) tilde.op b^3 e^(- b) . $
これより上界が指数関数的に小さくなることから $b gt.double 1$ のとき
$I \( b \)$ の最低次の漸近評価は十分正確である.

#block[
Q 17-21. 低温の漸近領域 $b gt.double 1$ における比熱 $C$
は次のように評価される.
$ C & approx 3 n R times frac(4 pi^4, 5) (frac(k_B T, planck omega_D))^3 . $

]
Q 17-19, Q 17-20 で考察したように比熱 $C$ に $I \( b \)$
の値を代入すると次のようになる.
$ C & = 3 n R dot.op \( - 3 \) b^2 frac(upright(d) I \( b \), upright(d) b)\
 & = 3 n R dot.op \( - 3 \) b^2 (- pi^4 / 15 4 / b^5)\
 & = 3 n R times frac(4 pi^4, 5) (1 / b)^3\
 & = 3 n R times frac(4 pi^4, 5) (frac(k_B T, planck omega_D))^3 . $

よって Debye 模型の比熱は次のようにまとめられる.

#block[
Debye 模型の比熱
$ C & approx 3 n R times cases(delim: "{", 1 & \( k_B T gt.double planck omega_D \), frac(4 pi^4, 5) (frac(k_B T, planck omega_D))^3 & \( k_B T lt.double planck omega_D \)) . $

]
= その17-A: ゼータ関数 $zeta \( s \)$ 入門
<その17-a-ゼータ関数-zetas-入門>
== Bernoulli 数
<bernoulli-数>
Bernoulli 数 $B_n$ を次のように定義する.

#block[
Definition. Bernoulli 数 Bernoulli 数 $B_n$
は以下の正則関数の多項式展開の係数として定義される.
$ frac(x, e^x - 1) = sum_(n = 0)^oo frac(B_n, n !) x^n . $

]
#block[
Q 17A-1.
$ B_1 = - 1 / 2 \, B_(2 n + 1) = 0 #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) . $

]
(i) まず Bernoulli の定義式の左辺に $x \/ 2$ を加えると次のようになる.
$ frac(x, e^x - 1) + x / 2 & = frac(x \( e^x + 1 \), 2 \( e^x - 1 \)) = x / 2 frac(e^(x \/ 2) + e^(- x \/ 2), e^(x \/ 2) - e^(- x \/ 2)) = x / 2 coth \( x / 2 \) . $

(ii) ここでこの関数は偶関数であることがわかる.
$ frac(- x, 2) coth \( frac(- x, 2) \) & = frac(- x, 2) frac(e^(- x \/ 2) + e^(x \/ 2), e^(- x \/ 2) - e^(x \/ 2)) = x / 2 frac(e^(x \/ 2) + e^(- x \/ 2), e^(x \/ 2) - e^(- x \/ 2)) = x / 2 coth \( x / 2 \) . $
これより次の右辺は偶関数であることがわかり,
一致の定理から右辺について奇数次の項は現れない.
$ x / 2 coth \( x / 2 \) = x / 2 + sum_(n = 0)^oo frac(B_n, n !) x^n . $
よって 3 以上の奇数を添え字に持つ Bernoulli 数はゼロとなる.
$ B_(2 n + 1) = 0 #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) . $

(iii) また 1 次の項もゼロとなる為, $B_1$ について次のようになる.
$ B_1 = - 1 / 2 . $

#block[
Q 17A-2.
$ sum_(m = 0)^(n - 1) frac(B_n, \( n - m \) ! m !) x^n = delta_(n \, 1) #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) . $

]
(i) 左辺の分母を払うと次のようになる.
$ x & = \( e^x - 1 \) sum_(n = 0)^oo frac(B_n, n !) x^n\
 & = (sum_(k = 1)^oo frac(x^k, k !)) (sum_(n = 0)^oo frac(B_n, n !) x^n)\
 & = sum_(k = 1)^oo sum_(n = 0)^oo frac(B_n, k ! n !) x^(k + n)\
 & = sum_(n = 1)^oo sum_(m = 0)^(n - 1) frac(B_n, \( n - m \) ! m !) x^n . $
よって両辺の係数を比較することで次のようになる.
$ sum_(m = 0)^(n - 1) frac(B_n, \( n - m \) ! m !) x^n = delta_(n \, 1) #h(2em) \( n = 1 \, 2 \, 3 \, dots.h \) . $

(ii) これを小さな値の場合について具体的な式で表すと次のようになる.
$ {B_0 = 1\
1 / 2 B_0 + B_1 = 0\
1 / 6 B_0 + 1 / 2 B_1 + 1 / 2 B_2 = 0\
1 / 24 B_0 + 1 / 6 B_1 + 1 / 4 B_2 + 1 / 6 B_3 = 0\
1 / 120 B_0 + 1 / 24 B_1 + 1 / 12 B_2 + 1 / 12 B_3 + 1 / 24 B_4 = 0\
1 / 720 B_0 + 1 / 120 B_1 + 1 / 48 B_2 + 1 / 36 B_3 + 1 / 48 B_4 + 1 / 120 B_5 = 0\
1 / 5040 B_0 + 1 / 720 B_1 + 1 / 240 B_2 + 1 / 144 B_3 + 1 / 144 B_4 + 1 / 240 B_5 + 1 / 720 B_6 = 0\
dots.h.c . $

#block[
Q 17A-3.
$ B_0 = 1 \, B_1 = - 1 / 2 \, B_2 = 1 / 6 \, B_3 = 0 \, B_4 = - 1 / 30 \, B_5 = 0 \, B_6 = 1 / 42 \, dots.h.c . $

]
Q 17A-2 (ii) より $B_0 = 1$ であることがわかる. そして既に求めた添字が 0
と奇数のものを代入すると次のようになる. $ {1 = 1\
1 / 2 - 1 / 2 = 0\
1 / 6 - 1 / 4 + 1 / 2 B_2 = 0\
1 / 24 - 1 / 12 + 1 / 4 B_2 = 0\
1 / 120 - 1 / 48 + 1 / 12 B_2 + 1 / 24 B_4 = 0\
1 / 720 - 1 / 240 + 1 / 48 B_2 + 1 / 48 B_4 = 0\
1 / 5040 - 1 / 1440 + 1 / 240 B_2 + 1 / 144 B_4 + 1 / 720 B_6 = 0\
dots.h.c . $ これより $B_2 \, B_4 \, B_6$
について上の数式から求められる.
$ B_2 = 1 / 6 \, quad B_4 = - 1 / 30 \, quad B_6 = 1 / 42 . $
よってこれまでの結果をまとめると次のようになる.
$ B_0 = 1 \, B_1 = - 1 / 2 \, B_2 = 1 / 6 \, B_3 = 0 \, B_4 = - 1 / 30 \, B_5 = 0 \, B_6 = 1 / 42 \, dots.h.c . $

== ガンマ関数 $Gamma \( s \)$ のまとめ
<ガンマ関数-gammas-のまとめ>
ガンマ関数 $Gamma \( s \)$ について次のような性質が知られている.
$ Gamma \( s \) & = integral_0^oo upright(d) x x^(s - 1) e^(- x) #h(2em) \( "Re" s > 0 \) \,\
Gamma \( s + 1 \) & = s Gamma \( s \) \,\
Gamma \( 1 \) & = 1 \, quad Gamma (1 / 2) = sqrt(pi) \,\
Gamma \( n + 1 \) & = n ! #h(2em) \( n = 0 \, 1 \, 2 \, dots.h \) \,\
"Res" \[ Gamma \( s \) ; s = - n \] & = frac(\( - 1 \)^n, n !) #h(2em) \( n = 0 \, 1 \, 2 \, dots.h \) \,\
{ Gamma \( s \) = 0 divides \| s \| < oo } & = nothing \,\
Gamma \( s \) Gamma \( 1 - s \) & = frac(pi, sin pi s) \,\
Gamma \( 2 s \) & = frac(2^(2 s), 2 sqrt(pi)) Gamma \( s \) Gamma (s + 1 / 2) . $

== ゼータ関数 $zeta \( s \)$ の定義と基礎的性質
<ゼータ関数-zetas-の定義と基礎的性質>
#block[
Definition. ゼータ関数 ゼータ関数 $zeta \( s \)$ は次のように定義される.
$ zeta \( s \) & := sum_(n = 1)^oo 1 / n^s #h(2em) \( "Re" s > 1 \) . $

]
#block[
Q 17A-4. $zeta \( s \)$ が $"Re" s > 1$
において一様絶対収束することを示す.

]
$s = a + b i med \( a > 1 \)$ とおく. すると次のようになる.
$ \| zeta \( s \) \| & lt.eq sum_(n = 1)^oo lr(|1 / n^s|) = sum_(n = 1)^oo 1 / n^a approx integral_1^oo upright(d) x x^(- a) = [frac(1, 1 - a) x^(1 - a)]_1^oo < oo . $
よってゼータ関数 $zeta \( s \)$ は一様絶対収束する.

#block[
Q 17A-5.
$ zeta \( s \) & = product_(p : p r i m e) frac(1, 1 - p^(- s)) #h(2em) \( "Re" s > 1 \) . $

]
素因数分解の一意性より次のようにゼータ関数 $zeta \( s \)$
は式変形できる. $ zeta \( s \) & = sum_(n = 1)^oo 1 / n^s\
 & = 1 / 1^s + 1 / 2^s + 1 / 3^s + 1 / 2^(2 s) + 1 / 5^s + frac(1, \( 2 dot.op 3 \)^s) + dots.h.c\
 & = (1 + 2^(- s) + 2^(- 2 s) + dots.h.c) (1 + 3^(- s) + 3^(- 2 s) + dots.h.c) (1 + 5^(- s) + 5^(- 2 s) + dots.h.c) dots.h.c\
 & = product_(p : p r i m e) \( 1 + p^(- s) + p^(- 2 s) + dots.h.c \)\
 & = product_(p : p r i m e) frac(1, 1 - p^(- s)) . $

#block[
Q 17A-6. $ zeta \( s \) & = 0 arrow.r.double.long "Re" s lt.eq 1 . $

]
$"Re" s > 1$ において $s = a + b sqrt(- 1) med \( a > 1 \)$ とおくと
$p^(- s)$ の大きさは次のように評価される.
$ \| p^(- s) \| = \| p^(- a - b sqrt(- 1)) \| = \| p^(- a) \| dot.op \| e^(- sqrt(- 1) b ln p) \| = p^(- a) . $
これより $zeta \( s \)$ の大きさは次のように評価される.
$ \| zeta \( s \) \| & = lr(|product_(p : p r i m e) frac(1, 1 - p^(- s))|) gt.eq product_(p : p r i m e) frac(1, 1 - \| p^(- s) \|) = product_(p : p r i m e) frac(1, 1 - p^(- a)) > 0 . $
よって $"Re" s > 1$ において $zeta \( s \)$ はゼロとならない.
つまり次のようになる.
$ zeta \( s \) & = 0 arrow.r.double.long "Re" s lt.eq 1 . $

#block[
Q 17A-7. 素数が無限に存在することを示す.

]
ゼータ関数 $zeta \( s \) med \( "Re" s > 1 \)$ について $s arrow.r 1$
の極限を取ると発散する.
$ lim_(s arrow.r 1) zeta \( s \) & = lim_(s arrow.r 1) sum_(n = 1)^oo 1 / n^s = oo . $
また Euler 積表示についても極限を取る.
$ lim_(s arrow.r 1) zeta \( s \) & = product_(p : p r i m e) frac(1, 1 - 1 \/ p) . $
ここで素数が有限個しかないならば発散しない.
ただゼータ関数は極限を取ると発散するので素数は無限個存在する.

== ゼータ関数 $zeta \( s \)$ の基本的性質 : 関数等式ほか
<ゼータ関数-zetas-の基本的性質-関数等式ほか>
#block[
Q 17A-8.
$ Gamma \( s \) zeta \( s \) = integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) #h(2em) \( "Re" s > 1 \) . $

]
ガンマ関数の定義式について $x := n x$
と置換積分することで次のように式変形できる.
$ Gamma \( s \) & = integral_0^oo upright(d) x x^(s - 1) e^(- x)\
 & = integral_0^oo n upright(d) x (n x)^(s - 1) e^(- n x) \,\
Gamma \( s \) zeta \( s \) & = sum_(n = 1)^oo frac(Gamma \( s \), n^s)\
 & = sum_(n = 1)^oo integral_0^oo upright(d) x x^(s - 1) e^(- n x)\
 & = integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) . $
この積分値を求める為に複素解析を用いる. 積分路 $C$ を
$C = C \( delta \) = C_(+) \( delta \) + C_0 \( delta \) + C_(+) \( delta \)$
として $C_(+) \( delta \)$ は実軸上無限遠から原点から $delta$
の距離にある点まで, $C_0 \( delta \)$ は中心を原点とする半径 $delta$
の円を反時計回りに 1 周し, $C_(-) \( delta \)$ は実軸上原点から $delta$
の距離にある点から無限遠までを積分する. また次の関数 $I \( s \; C \)$
を定義しておく.
$ I \( s \; C \) & := integral_C upright(d) z frac(z^(s - 1), e^z - 1) . $

#block[
Q 17A-9. $0 < delta < 2 pi$ を満たす範囲で $delta$
を動かしても積分値は一定である.

]
被積分関数は $2 n pi sqrt(- 1)$ について 1 位の極がある.
これより留数定理から積分路の内部の極の数が変化しないなら積分値は一定である.
よって $0 < delta < 2 pi$ を満たす範囲で $delta$
を動かしても極の数は変化しないから積分値は一定である.

#block[
Q 17A-10. $"Re" s > 1$ のとき $delta arrow.r 0$ とすると
$C_0 \( delta \)$ に沿った積分 $I \( s \; C_0 \( delta \) \)$
がゼロになる.

]
$ \| I \( s \; C_0 \( delta \) \) \| & = lr(|integral_(C_0 \( delta \)) upright(d) z frac(z^(s - 1), e^z - 1)|)\
 & = lr(|integral_0^(2 pi) delta i e^(i theta) upright(d) theta frac(\( delta e^(i theta) \)^(s - 1), e^(delta \( cos theta + i sin theta \)) - 1)|)\
 & lt.eq integral_0^(2 pi) upright(d) theta frac(\| delta^s \|, e^(delta cos theta) - 1)\
 & < \| delta^(s - 1) \| pi . $ これより $delta arrow.r 0$ のとき積分値
$I \( s \; C_0 \( delta \) \)$ は $0$ となる.

#block[
Q 17A-11.
$ I \( s \; C \) & = \( e^(2 pi i s) - 1 \) integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) . $

]
Q 17A-10 の考察から $delta arrow.r 0$ の極限において積分 $I \( s \; C \)$
を考える.
$ I \( s \; C \) & = integral_(C \( delta \)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = integral_(C_(-) + C_0 + C_(+)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = integral_(C_(-)) upright(d) z frac(z^(s - 1), e^z - 1) + integral_(C_0) upright(d) z frac(z^(s - 1), e^z - 1) + integral_(C_(+)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = e^(2 pi i s) integral_(C_(+)) upright(d) z frac(z^(s - 1), e^z - 1) + 0 + integral_(C_(+)) upright(d) z frac(z^(s - 1), e^z - 1)\
 & = \( e^(2 pi i s) - 1 \) integral_0^oo upright(d) x frac(x^(s - 1), e^x - 1) . $

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
