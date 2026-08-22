#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "光学",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/optics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 光学 (Optics)
<光学-optics>
== 単色波と完全偏光
<単色波と完全偏光>
#definition("単色波")[
単色波 (monochromatic wave)
とは1つの振動数しか持たない波のことである。
$ bold(E) \( t \, bold(r) \) & = bold(E)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $
]
#definition("偏光")[
振動方向 $bold(E)_0 \( bold(k) \)$
に関して振幅 $a_1 \( bold(k) \) \, a_2 \( bold(k) \) in bb(R)_(gt.eq 0)$
と位相 $epsilon_1 \( bold(k) \) \, epsilon_2 \( bold(k) \) in bb(R)$
を用いてベクトル表現する。位相差については向かって来る光を観測する立場で見たときと進んで行く光子の立場で見たときでそれぞれ
$epsilon \( bold(k) \) \, delta \( bold(k) \)$ を用いる。
$ bold(E) \( bold(r) \, t \) & = bold(E)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) = vec(E_1 \( bold(k) \), E_2 \( bold(k) \))\
 & = vec(a_1 \( bold(k) \) e^(i epsilon_1 \( bold(k) \)), a_2 \( bold(k) \) e^(i epsilon_2 \( bold(k) \))) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) = vec(a_1 \( bold(k) \), a_2 \( bold(k) \) e^(i epsilon \( bold(k) \))) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1 \( bold(k) \) \))\
 & = vec(a_1 \( bold(k) \) e^(i delta_1 \( bold(k) \)), a_2 \( bold(k) \) e^(i delta_2 \( bold(k) \))) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) = vec(a_1 \( bold(k) \), a_2 \( bold(k) \) e^(i delta \( bold(k) \))) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) + delta_1 \( bold(k) \) \)) $
ただし $delta_i = - epsilon_i$ とする。
電場ベクトルの振動方向と電磁場の進行方向で定まる平面を電場の振動面という。
$  & sin epsilon > 0 arrow.l.r.double sin delta < 0 arrow.l.r.double upright("「楕円偏光は左偏光である。」")\
 & arrow.l.r.double upright("「円偏光の helicity は ") + 1 upright(" である。」")\
 & sin epsilon < 0 arrow.l.r.double sin delta > 0 arrow.l.r.double upright("「楕円偏光は右偏光である。」")\
 & arrow.l.r.double upright("「円偏光の helicity は ") - 1 upright(" である。」") $
]
#proposition[
場所 $bold(r)$ に留まり、時間 $t$
の経過とともに、電場ベクトルの波動を観測する立場から見て、「$E_2$ は
$E_1$ より $epsilon$ だけ位相が遅れている。」または「$E_1$ は $E_2$ より
$epsilon$ だけ位相が進んでいる。」といえる。位相差 $delta$
について「$E_2$ は $E_1$ より $delta$
だけ位相が進んでいる。」つまり「$E_1$ は $E_2$ より $delta$
だけ位相が遅れている。」と言える。
]
#proposition[
位置 $bold(r)$ を固定し、時間 $t$
を動かしたときに $\( E_1 \, E_2 \)$ が作る軌跡の図形は Lissajous
図形、特に楕円となる。
$ (E_1 / a_1)^2 + (E_2 / a_2)^2 - 2 cos epsilon E_1 / a_1 E_2 / a_2 & = sin^2 epsilon $
]
#figure(
  table(
    columns: 2,
    align: (center,center,),
    table.header([偏光状態], [$epsilon$],),
    table.hline(),
    [直線偏光], [$0 \, pi$],
    [円偏光(右回転)], [$display(- pi / 2)$],
    [円偏光(左回転)], [$display(+ pi / 2)$],
  )
  , caption: [偏光状態]
  , kind: table
  )

#definition[
光学では伝統的に楕円の傾きを記述するパラメータ
$psi$ と楕円の形と偏光の回転の向きを記述するパラメータ $chi$
が用いられている。

+ パラメータ $psi$ は $\( E_1 \, E_2 \)$ 面において $E_1$
  軸から計った偏光楕円の長軸の角度である。これより $0 lt.eq psi < pi$
  の範囲の値を取る。偏光楕円が円に縮退していない場合は、パラメータ $psi$
  の値は一意に定まる。偏光楕円が円に縮退している場合は、パラメータ $psi$
  の値は定まらない。

+ パラメータ $chi$ は偏光楕円の短半径 $a_eta$ と長半径 $a_xi$
  を用いて次のように書ける。
  $ tan \| chi \| & = a_eta / a_xi #h(2em) (- pi / 4 lt.eq chi lt.eq pi / 4) $
  ただし $chi$ が正ならば右偏光、負ならば左偏光である。特に
  $display(chi = plus.minus pi / 4)$ が円偏光、$chi = 0$ が直線偏光である。
]
== Stokes パラメータ
<stokes-パラメータ>
波数 $bold(k) in bb(R)^3$ を持つ一般の単色波の電場は 4つのパラメータ
$a_1 \, a_2 gt.eq 0 ; epsilon = - delta_1 \, epsilon = - delta in bb(R)$
によって記述される. これらは関係式 $tilde(E)_i = a_i e^(i epsilon_i)$
によって結びついている. 一般の単色波の電場の状態を記述する 4
個のパラメータは, 上手く用意すれば, 次のように異なる役割を持つ 3
個のグループに分けられる.

+ 時間の原点を指定する実パラメータ 1 個.場所 $bold(r) in bb(R)^3$
  に留まって観測するとします. 特定の時刻 $t in bb(R)$ において, 電場の 1
  成分と 2 成分で指定される点 $\( E_1 \, E_2 \)$ が Lissajous
  図形である偏光楕円上のどこにあるのかを,
  この実パラメータが指定します.このパラメータは $epsilon_1$ あるいは
  $delta_1$ に取ることができます.

+ 電場のスケールを指定する実パラメータ 1
  個.このパラメータを大きくすることは, $\( E_1 \, E_2 \)$ 面上の
  Lissajous 図形である偏光楕円の傾きと形を保って,
  楕円を相似に大きくすることに対応します.このパラメータは電場の強度
  $\| E \|^2 = a_1^2 + a_2^2$
  に取ることができます.これから見るよう後者の方が便利です.

+ 電場の偏光状態を指定する実パラメータ 2 個.電場の偏光状態は
  $\( E_1 \, E_2 \)$ 面上の Lissajous 図形である偏光楕円の傾きと形,
  加えて, 周回の向きにより記述されます.これを記述するパラメータは,
  偏光楕円の傾きを指定する角度 $psi$ と,
  偏光楕円の形と周回の向きを絶対値と符号で指定する角度 $chi$
  によって用意できます.

これらは互いに独立であることが明白であるから十分性は成り立つ.
必要性に関しては電場の定義となる実パラメータが4つと等しい数であることから成り立つ.
よってこれら4つのパラメータで電場を表現できる.

#proposition[
さらに電場の強度 $\| E \|^2$
のパラメータ空間は非負実数空間 $bb(R)_(gt.eq 0)$ であり,
電場の強度と偏光状態は独立である為,
電場の強度を半径と見なすことができる. よって強度と偏光のパラメータ空間は
3 次元実 Euclid 空間 $bb(R)^3$ と同相である.
$ bb(R)_(gt.eq 0) times S^2 tilde.equiv bb(R)^3 $
このことから強度と偏光状態のパラメータを 3 次元空間 $bb(R)^3$
上の点と対応させて考える. その点を極座標 $\( s_0 \, theta \, phi.alt \)$
で表すこととする. 上での対応させ方から次のように定義できる.
]
#proof[
$psi = pi$ のとき $psi = 0$ と比べて,
軸の正の向きは逆であるが主軸の方向は同じなので偏光楕円の軌跡は等しく,
同一視できる. また, $display(chi = plus.minus pi / 4)$ のとき,
偏光楕円が円に縮退している為,
楕円偏光の長軸の角度を変えても楕円偏光の軌跡は等しく, 同一視できる.
これより偏光楕円において同一視できる関係を $tilde.op$ とおくと,
次のように書ける.
$ \( psi = 0 \, chi \) & tilde.op \( psi = pi \, chi \) & \( - pi / 4 lt.eq chi lt.eq pi / 4 \)\
\( psi \, chi = pi / 4 \) & tilde.op \( psi' \, chi = pi / 4 \) & \( 0 lt.eq psi \, psi' lt.eq pi \)\
\( psi \, chi = - pi / 4 \) & tilde.op \( psi' \, chi = - pi / 4 \) & \( 0 lt.eq psi \, psi' lt.eq pi \) $
これより $psi$ を球面の経度, $chi$ を球面の緯度と捉えると $tilde.op$
による同値類は2次元球面 $S^2$ と同相になる. 例えば $display(chi = pi / 4)$
は北極, $chi = 0$ は赤道, $display(chi = - pi / 4)$ は南極と対応する. また,
$psi = 0 \, pi$ が Greenwich 子午線として同一視される.
$ {\( psi \, chi \) : 0 lt.eq psi lt.eq pi and - pi / 4 lt.eq chi lt.eq pi / 4} \/ tilde.op med tilde.equiv S^2 $
さらに電場の強度 $\| E \|^2$ のパラメータ空間は非負実数空間
$bb(R)_(gt.eq 0)$ であり, 電場の強度と偏光状態は独立である為,
電場の強度を半径と見なすことができる. よって強度と偏光のパラメータ空間は
3 次元実 Euclid 空間 $bb(R)^3$ と同相である.
$ bb(R)_(gt.eq 0) times S^2 tilde.equiv bb(R)^3 $
このことから強度と偏光状態のパラメータを 3 次元空間 $bb(R)^3$
上の点と対応させて考える. その点を極座標 $\( s_0 \, theta \, phi.alt \)$
で表すこととする. 上での対応させ方から次のように定義できる.
$ s_0 & = a_1^2 + a_2^2\
theta & = pi / 2 - 2 chi\
phi.alt & = 2 psi $ これより右手系の直交座標 $\( s_1 \, s_2 \, s_3 \)$
で表すと $ s_1 & = s_0 cos 2 psi cos 2 chi\
s_2 & = s_0 sin 2 psi cos 2 chi\
s_3 & = s_0 sin 2 chi $ である.
このようにして用意された電場の強度と偏光を記述する 4
つの実パラメータの組 $\( s_0 \, s_1 \, s_2 \, s_3 \)$
は「Stokesパラメータ」と呼ばれる. Stokesパラメータはパラメータ
$a_1 \, a_2 \, psi \, chi$ を用いて次のように表される.
$ s_0 & = a_1^2 + a_2^2\
s_1 & = s_0 cos 2 psi cos 2 chi\
s_2 & = s_0 sin 2 psi cos 2 chi\
s_3 & = s_0 sin 2 chi $<s1-def> このような状況を「完全偏光」と呼び,
より一般的な「部分偏光」をこれから考える. また完全偏光において関係式
$s_0^2 = s_1^2 + s_2^2 + s_3^2$ を満たす. このように点
$\( s_1 \, s_2 \, s_3 \)$ は原点を中心とする半径 $s_0$ の球面上にある.
この球面を「Poincaré 球面」と呼ぶ. \
]

#definition("Stokes パラメータ")[
このように用意された電場の強度と偏光を記述する 4 つの実パラメータの組
$\( s_0 \, s_1 \, s_2 \, s_3 \)$
は「Stokesパラメータ」と呼ばれる。Stokesパラメータはパラメータ
$a_1 \, a_2 \, psi \, chi$ を用いて次のように表される。
$ s_0 & = a_1^2 + a_2^2\
s_1 & = s_0 cos 2 psi cos 2 chi\
s_2 & = s_0 sin 2 psi cos 2 chi\
s_3 & = s_0 sin 2 chi $ 次のベクトルを「Stokesベクトル」と呼ぶ。
$ bold(S) = vec(s_0, s_1, s_2, s_3) $
]
#definition("Jones ベクトル")[
電場の複素表示の複素共役 $cal(bold(E)) \( bold(r) \, t \)$ を定義する。
$ cal(bold(E)) \( bold(r) \, t \) = bold(E)^(\*) \( bold(r) \, t \) $
これを「光学の流儀の複素表示」と呼ぶこととする。
$ cal(bold(E)) \( bold(r) \, t \) = vec(cal(E)_1 \( bold(r) \, t \), cal(E)_2 \( bold(r) \, t \)) = vec(cal(E)_1, cal(E)_2) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) $
このとき次のベクトルを Jones ベクトルと呼び、それに作用する行列を Jones
行列という。 $ bold(J) = vec(cal(E)_1, cal(E)_2) in bb(C)^2 $
]
アメリカの物理学者 R.C.Jones が Jones ベクトルと Jones
行列を提案したのは 1941 年のことです。

このとき具体的な例として以下のようなものがある。

<table:Stokes-Jones>

#block[
#figure(
  table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([偏光状態], [呼び名], [Stokesベクトル
      $bold(S)$], [Jonesベクトル $bold(J)$],),
    table.hline(),
    [直線偏光(水平)], [水平 $cal(P)$ 状態:
    LHP], [$mat(delim: "(", 1, 1, 0, 0)^top$], [$mat(delim: "(", 1, 0)^top$],
    [直線偏光(垂直)], [鉛直 $cal(P)$ 状態:
    LNP], [$mat(delim: "(", 1, - 1, 0, 0)^top$], [$mat(delim: "(", 0, 1)^top$],
    [直線偏光($+ 45$°)], [+45° の $cal(P)$ 状態:
    L+45P], [$mat(delim: "(", 1, 0, 1, 0)^top$], [$1 / sqrt(2) mat(delim: "(", 1, 1)^top$],
    [直線偏光($- 45$°)], [$- 45$° の $cal(P)$ 状態:
    L-45P], [$mat(delim: "(", 1, 0, - 1, 0)^top$], [$1 / sqrt(2) mat(delim: "(", 1, - 1)^top$],
    [円偏光(右回転)], [$cal(R)$ 状態:
    RCP], [$mat(delim: "(", 1, 0, 0, 1)^top$], [$1 / sqrt(2) mat(delim: "(", 1, i)^top$],
    [円偏光(左回転)], [$cal(L)$ 状態:
    LCP], [$mat(delim: "(", 1, 0, 0, - 1)^top$], [$1 / sqrt(2) mat(delim: "(", 1, - i)^top$],
  )
  , caption: [重要な偏光状態の Stokes ベクトル]
  , kind: table
  )

] 
#block[
#proposition("(直線偏光の) Stokes パラメータの Jones ベクトルによる表現")[
Stokes パラメータは Jones ベクトルを用いて次のように表される。
$ s_0 & = \| cal(E)_1 \|^2 + \| cal(E)_2 \|^2\
s_1 & = \| cal(E)_1 \|^2 - \| cal(E)_2 \|^2\
s_2 & = 2 Re \( cal(E)_1^(\*) cal(E)_2 \)\
s_3 & = 2 Im \( cal(E)_1^(\*) cal(E)_2 \) $
]

]
#proof[
$ s_0 & = a_1^2 + a_2^2\
 & = lr(|bold(epsilon.alt)_1 \( bold(k) \) dot.op tilde(bold(E))|)^2 + lr(|bold(epsilon.alt)_2 \( bold(k) \) dot.op tilde(bold(E))|)^2\
 & = \| bold(epsilon.alt)_1 \( bold(k) \) dot.op cal(bold(E)) \|^2 + \| bold(epsilon.alt)_2 \( bold(k) \) dot.op cal(bold(E)) \|^2\
 & = \| cal(E)_1 \|^2 + \| cal(E)_2 \|^2\
s_1 & = s_0 cos 2 psi cos 2 chi = a_1^2 - a_2^2\
 & = lr(|bold(epsilon.alt)_1 \( bold(k) \) dot.op tilde(bold(E))|)^2 - lr(|bold(epsilon.alt)_2 \( bold(k) \) dot.op tilde(bold(E))|)^2\
 & = \| bold(epsilon.alt)_1 \( bold(k) \) dot.op cal(bold(E)) \|^2 - \| bold(epsilon.alt)_2 \( bold(k) \) dot.op cal(bold(E)) \|^2\
 & = \| cal(E)_1 \|^2 - \| cal(E)_2 \|^2\
s_2 & = s_0 sin 2 psi cos 2 chi = s_0 cos 2 psi cos 2 chi dot.op tan 2 psi\
 & = 2 a_1 a_2 cos delta = 2 a_1 a_2 cos epsilon = 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \)\
 & = 2 Re {(bold(epsilon.alt)_1 \( bold(k) \) dot.op tilde(bold(E)))^(\*) (bold(epsilon.alt)_2 \( bold(k) \) dot.op tilde(bold(E)))}\
 & = 2 Re {(bold(epsilon.alt)_1 \( bold(k) \) dot.op cal(bold(E)))^(\*) (bold(epsilon.alt)_2 \( bold(k) \) dot.op cal(bold(E)))}\
 & = 2 Re \( cal(E)_1^(\*) cal(E)_2 \)\
s_3 & = s_0 sin 2 chi\
 & = 2 a_1 a_2 sin delta = - 2 a_1 a_2 sin epsilon = - 2 a_1 a_2 sin \( epsilon_2 - epsilon_1 \)\
 & = - 2 Im {(bold(epsilon.alt)_1 \( bold(k) \) dot.op tilde(bold(E)))^(\*) (bold(epsilon.alt)_2 \( bold(k) \) dot.op tilde(bold(E)))}\
 & = 2 Im {(bold(epsilon.alt)_1 \( bold(k) \) dot.op cal(bold(E)))^(\*) (bold(epsilon.alt)_2 \( bold(k) \) dot.op cal(bold(E)))}\
 & = 2 Im \( cal(E)_1^(\*) cal(E)_2 \) $
]

#proposition("円偏光の Stokes パラメータの Jones ベクトルによる表現")[
$ s_0 & = lr(|bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2 + lr(|bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2\
s_1 & = 2 Re {(bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E)))^(\*) (bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E)))}\
s_2 & = 2 Im {(bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E)))^(\*) (bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E)))}\
s_3 & = lr(|bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2 - lr(|bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2 $
]
#proof[
$ s_0 & = a_1^2 + a_2^2\
 & = 1 / 2 (\| a_1 e^(i epsilon_1) - i a_2 e^(i epsilon_2) \|^2 + \| a_1 e^(i epsilon_1) + i a_2 e^(i epsilon_2) \|^2)\
 & = \| tilde(E)_(+) \|^2 + \| tilde(E)_(+) \|^2\
 & = a_(+)^2 + a_(-)^2\
 & = lr(|bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2 + lr(|bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2\
 & = lr(|bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2 + lr(|bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2\
s_1 & = a_1^2 - a_2^2\
 & = Re \( \( a_1^2 - a_2^2 \) + i \( 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \) \) \)\
 & = Re \( 2 tilde(E)_(-) tilde(E)_(+)^(\*) \)\
 & = 2 a_(+) a_(-) cos \( epsilon_(-) - epsilon_(+) \)\
 & = 2 Re {(bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) (bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E)))}\
 & = 2 Re {(bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E)))^(\*) (bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E)))}\
s_2 & = 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \)\
 & = Im \( \( a_1^2 - a_2^2 \) + i \( 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \) \) \)\
 & = Im \( 2 tilde(E)_(-) tilde(E)_(+)^(\*) \)\
 & = 2 a_(+) a_(-) sin \( epsilon_(-) - epsilon_(+) \)\
 & = 2 Im {(bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) (bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E)))}\
 & = 2 Im {(bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E)))^(\*) (bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E)))}\
s_3 & = 2 a_1 a_2 sin \( epsilon_2 - epsilon_1 \)\
 & = 1 / 2 (\| a_1 e^(i epsilon_1) - i a_2 e^(i epsilon_2) \|^2 - \| a_1 e^(i epsilon_1) + i a_2 e^(i epsilon_2) \|^2)\
 & = \| tilde(E)_(+) \|^2 - \| tilde(E)_(+) \|^2\
 & = - (a_(+)^2 - a_(-)^2)\
 & = - {lr(|bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2 - lr(|bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2}\
 & = lr(|bold(epsilon.alt)_(+) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2 - lr(|bold(epsilon.alt)_(-) \( bold(k) \)^(\*) dot.op cal(bold(E))|)^2 $
]

また上式の考察より次のように偏光の向きも逆転する.
$ cal(bold(E)) \( bold(r) \, t \) = cal(E)_(+) bold(epsilon.alt)_(+) \( bold(k) \) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) & arrow.l.r.double upright("「円偏光は右偏光である。」")\
 & arrow.l.r.double upright("「helicity が ") - 1 upright(" である。」")\
cal(bold(E)) \( bold(r) \, t \) = cal(E)_(-) bold(epsilon.alt)_(-) \( bold(k) \) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) & arrow.l.r.double upright("「円偏光は左偏光である。」")\
 & arrow.l.r.double upright("「helicity が ") + 1 upright(" である。」") $
となる. 特に直線偏光の基底ベクトル
$bold(epsilon.alt)_1 \, bold(epsilon.alt)_2 in bb(R)^3$ より,
$bold(epsilon.alt)_i = bold(epsilon.alt)_i^(\*) quad \( i = 1 \, 2 \)$
となる.
$ cal(bold(E)) \( bold(r) \, t \) & = cal(E)_1 bold(epsilon.alt)_1 \( bold(k) \) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) + cal(E)_2 bold(epsilon.alt)_2 \( bold(k) \) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \))\
cal(E)_i & = tilde(E)_i^(\*) = a_i e^(i delta_i) #h(2em) \( i = 1 \, 2 \)\
cal(bold(E)) \( bold(r) \, t \) & = cal(E)_(+) bold(epsilon.alt)_(+) \( bold(k) \) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) + cal(E)_(-) bold(epsilon.alt)_(-) \( bold(k) \) e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \))\
cal(E)_plus.minus & = tilde(E)_minus.plus^(\*) = cal(A)_plus.minus e^(i delta_plus.minus) quad \( cal(A)_plus.minus = a_minus.plus \, delta_plus.minus = - epsilon_minus.plus \) $
円偏光において新しい複素振幅 $cal(E)_plus.minus$ と古い複素振幅
$tilde(E)_plus.minus$ は成分の添字の $+$ と $-$
が反転して結びついていることに注意すべきである. また,
これより次の式を導ける.
$ bold(epsilon.alt)_i \( bold(k) \) dot.op cal(bold(E)) & = cal(E)_i e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) = (tilde(E)_i e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)))^(\*) = (bold(epsilon.alt)_i \( bold(k) \) dot.op tilde(bold(E)))^(\*)\
bold(epsilon.alt)_plus.minus \( bold(k) \)^(\*) dot.op cal(bold(E)) & = cal(E)_plus.minus e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) = (tilde(E)_minus.plus e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)))^(\*) = (bold(epsilon.alt)_minus.plus \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) $<EC-ET-converter-12>

また光の強度 $I$ について Jones ベクトル $bold(J)$
の絶対値の二乗に比例することが分かる.
$ I & = ⟨bold(E) \( bold(r) \, t \)⟩\
 & = ⟨{Re cal(bold(E)) \( bold(r) \, t \)}^2⟩\
 & = 1 / 2 ⟨lr(|cal(bold(E)) \( bold(r) \, t \)|)^2⟩\
 & = 1 / 2 \| bold(J) \|^2 $<Jones-strength>

== Stokes パラメータの測定
<stokes-パラメータの測定>
#definition("光学素子")[
直線偏光子 (linear
polarizer) とは、入力の電磁波をその透過軸 (transmission asix)
とそれに垂直な軸に沿った 2
つの直線偏光の成分に分解したとき、出力においては、前者の成分を透過するのに、後者の成分を遮断するような光学素子です。この作用は線形です。ですから、直線偏光子は対応する
Jones 行列によって数学的には表現されます。
物理的に原理が最も単純な直線偏光子は「針金格子偏光子」（wire grid
polarizer）でしょう。電磁波の波長 λ
よりもずっと細い直径を持つ直線状の伝導性の良い金属の針金を多数用意します。その多数の針金を波長
$lambda$
よりもずっと狭い間隔だけ離して等間隔に平行に板状に並べます。この多数の針金が並べられた「すだれ」あるいは「牢屋の鉄格子」のような板状の物体が「針金格子偏光子」です。
]
可視光の領域での具体的な直線偏光子として便利なのは、「ポラロイド」のプラスチック板でしょう。ポラロイドは針金格子偏光子を近似的に実現していると考えることができます。最初のポラロイドはヨウ素を含む化合物である過ヨウ化硫酸キニーネ（ヘラパタイト）の多数の小さな針状結晶を方向を揃えて酢酸セルロースのフィルムに埋め込んだものです。ヘラパタイトの中のヨウ素が伝導性を担い、特定の方向の伝導性が高い針金のような状況が出来ていると考えられます。この「ポラロイド
J 板」が E.H.Land によってつくられたのは 1928 年のことです。さらに、1938
年に Land は改良された「ポラロイド H
板」をつくり出しました。透明なポリビニルアルコールの板を熱してある方向に引き延ばします。すると、ポリビニルアルコールの高分子は伸ばした方向に整列します。その後、板を高濃度のヨウ素のインク液に浸します。すると、高分子が多数のヨウ素で修飾されます。取り込まれた多数のヨウ素は高分子の整列の方向につながって、１次元的な伝導性をもたらします。これは微視的な針金です。このようにしてできた「ポラロイド
H 板」は針金格子を近似していると考えられます。ポラロイド H
板の透過軸はポリビニルアルコールの板を伸ばした方向に垂直になります。

Stokes パラメータ $s_0 \, s_1 \, s_2 \, s_3$
の最も重要な性質はこれらが直接的に観測可能な物理量であることである.
どのように測定可能なのかを学習する.

任意の光学素子を取り上げると, Jones ベクトルの変換は表現論より行列
$M \( 2 \; bb(C) \)$ で書ける. これを Jones 行列と呼ぶ.
また素子の1つとして直線偏光子があり,
最も単純な直線偏光子は針金格子偏光子 (wire grid polarizer) でしょう.
電磁場の波よりもずっと細い直径を持つ直線状の伝導性の良い金属の針金を多数用意し,
それらを波長 $lambda$
よりずっと狭い間隔だけ離して等間隔に並行に板状に並べる.このような板状の物体が「針金格子偏光子」である.
\
すきまと並行な成分において定常波を作ることができない為,
電磁波を通さない. よって「針金格子偏光子の透過軸は,
針金が並べられた面内で, すきまと垂直な方向である」

#proposition[
Jones 行列が $T$ の光学素子 $d$ について角度
$theta$ だけ回転させた光学素子を $d \( theta \)$ として, その Jones 行列
$T \( theta \)$ について回転させた座標系で $T$
を適用していると考えられる為, 次のような関係式が成り立つ.
$ T \( theta \) = R \( theta \) T R \( - theta \) $
]
#theorem[
直線偏光子は同じ角度で何度通しても同じ結果となる。
また次のように行列 $T^(upright("直線偏光子")) \( theta \)$
は射影演算子を表す行列であることが分かる.
]
#proof[
$ T^(upright("直線偏光子")) \( theta \) & = R \( theta \) T^(upright("直線偏光子")) \( 0 \) R \( - theta \)\
 & = mat(delim: "(", cos theta, - sin theta; sin theta, cos theta) mat(delim: "(", 1, 0; 0, 0) mat(delim: "(", cos theta, sin theta; - sin theta, cos theta)\
 & = mat(delim: "(", cos^2 theta, cos theta sin theta; sin theta cos theta, sin^2 theta)\
{T^(upright("直線偏光子")) \( theta \)}^2 & = mat(delim: "(", cos^2 theta, cos theta sin theta; sin theta cos theta, sin^2 theta)\
 & = T^(upright("直線偏光子")) \( theta \) $
]

#theorem[
一般の偏光状態
$bold(J) = \[ cal(E)_1 \, cal(E)_2 \]^t in bb(C)^2$ の光を直線偏光子
$T^(upright("直線偏光子")) \( theta \)$ に通したときの出力の光の強度
$I \( theta \)$ を考える.
$ I \( theta \) & = 1 / 2 (\| cal(E)_1 \|^2 cos^2 theta + \| cal(E)_2 \|^2 sin^2 theta + \( cal(E)_1^(\*) cal(E)_2 + cal(E)_1 cal(E)_2^(\*) \) cos theta sin theta)\
 & = 1 / 4 (s_0 + sqrt(s_1^2 + s_2^2) cos \( 2 theta - phi \)) $
特に水平状態 $bold(J) = \[ cal(E) \, 0 \]^t in bb(C)^2$ の光のとき Malus
の法則と呼ぶ $ I \( theta \) & = 1 / 2 \| cal(E) \|^2 cos^2 theta $
]
#proof[
$ I \( theta \) & = 1 / 2 lr(|T^(upright("直線偏光子")) \( theta \) bold(J)|)^2\
 & = 1 / 2 bold(J)^dagger {T^(upright("直線偏光子")) \( theta \)}^dagger T^(upright("直線偏光子")) \( theta \) bold(J)\
 & = 1 / 2 bold(J)^dagger T^(upright("直線偏光子")) \( theta \) bold(J)\
 & = 1 / 2 (\| cal(E)_1 \|^2 cos^2 theta + \| cal(E)_2 \|^2 sin^2 theta + \( cal(E)_1^(\*) cal(E)_2 + cal(E)_1 cal(E)_2^(\*) \) cos theta sin theta)\
 & = 1 / 4 (\| cal(E)_1 \|^2 + \| cal(E)_2 \|^2) + 1 / 4 (\| cal(E)_1 \|^2 - \| cal(E)_2 \|^2) cos 2 theta + 1 / 2 Re \( cal(E)_1^(\*) cal(E)_2 \) sin 2 theta\
 & = 1 / 4 (s_0 + s_1 cos 2 theta + s_2 sin 2 theta)\
 & = 1 / 4 (s_0 + sqrt(s_1^2 + s_2^2) cos \( 2 theta - phi \)) $
ただし、
$ cos phi = s_1 / sqrt(s_1^2 + s_2^2) \, sin phi = s_2 / sqrt(s_1^2 + s_2^2) $
である。
] これらは次の極めて重要な事実を教えてくれている。
「与えられた単色光の Stokes パラメータのうちの 3 個 $s_0 \, s_1 \, s_2$
は、その光をいろいろな角度 $theta$
に傾けた直線偏光子に透過して強度を測定することによって決定できる。」

#theorem[
$ s_0 & prop \( upright("全強度") \)\
s_1 & prop \( upright("水平偏光成分の強度") \) - \( upright("鉛直偏光成分の強度") \)\
s_2 & prop \( + 45 upright("° 偏光成分の強度") \) - \( - 45 upright("° 偏光成分の強度") \) $
]
#proof[
$ I \( 0 \) & = s_0 + s_1 \, #h(2em) I (pi / 4) = s_0 + s_2 \, #h(2em) I (pi / 2) = s_0 - s_1 \, #h(2em) I (frac(3 pi, 4)) = s_0 - s_2 $
よって Stokes パラメータ $s_0 \, s_1 \, s_2$ は次のように表される。
$ s_0 & = 2 {I \( 0 \) + I (pi / 2)}\
 & = 2 {I (pi / 4) + I (pi / 2)}\
s_1 & = 2 {I \( 0 \) - I (pi / 2)}\
s_2 & = 2 {I (pi / 4) - I (frac(3 pi, 4))} $ これらは次の意味を表す。
]

$ s_3 prop \( upright("右円偏光成分の強度") \) - \( upright("左円偏光成分の強度") \) $
これを測定するにはどうすればよいのか?
これは円偏光成分を直線偏光成分に変換できれば測定できる. この変換が
$1 \/ 4$ 波長板を用いて実行できることをここで学ぶ. \

#definition[
遅相子 (wave retarder)
は直線偏光成分のうちの片方をもう片方に対して一定の位相だけ遅らせる変換を行い出力する光学素子である.
$ T^(upright("遅相子")) \( phi.alt \) = mat(delim: "(", e^(i phi.alt / 2), 0; 0, e^(- i phi.alt / 2)) = mat(delim: "(", 1, 0; 0, e^(- i phi.alt)) e^(i phi.alt / 2) $
$1 \/ 2$ 波長板と $1 \/ 4$ 波長板の Jones 行列を次のように定義する。
$ T^(1 \/ 2 upright("波長板")) & = T^(upright("遅相子")) \( pi \) = mat(delim: "(", i, 0; 0, - i)\
T^(1 \/ 4 upright("波長板")) & = T^(upright("遅相子")) (pi / 2) = mat(delim: "(", e^(i pi / 4), 0; 0, e^(- i pi / 4)) = mat(delim: "(", frac(1 + i, sqrt(2)), 0; 0, frac(1 - i, sqrt(2))) $
]
#proposition[
#figure(
  table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([偏光状態], [Jones ベクトル], [1/2波長板], [1/4波長板],),
    table.hline(),
    [直線偏光], [$vec(1, 0)$], [$i vec(1, 0)$], [$display(e^(i pi / 4) vec(1, 0))$],
    [直線偏光], [$vec(0, 1)$], [$- i vec(0, 1)$], [$display(e^(- i pi / 4) vec(0, 1))$],
    [直線偏光 ($+ 45$°
    方向)], [$display(1 / sqrt(2) vec(1, 1))$], [$display(1 / sqrt(2) vec(1, - 1))$], [$display(frac(1 + i, 2) vec(1, - i))$],
    [直線偏光 ($- 45$°
    方向)], [$display(1 / sqrt(2) vec(1, - 1))$], [$display(1 / sqrt(2) vec(1, 1))$], [$display(frac(1 + i, 2) vec(1, - 1))$],
    [円偏光
    (左回転)], [$display(1 / sqrt(2) vec(1, i))$], [$display(i / sqrt(2) vec(1, - i))$], [],
    [円偏光
    (右回転)], [$display(1 / sqrt(2) vec(1, - i))$], [$display(i / sqrt(2) vec(1, i))$], [],
  )
  , caption: [偏光状態]
  , kind: table
  )
]
#proof[
遅相子に純粋に直線偏光した光を入れることを考える.
$ T^(upright("遅相子")) \( phi.alt \) vec(1, 0) & = vec(e^(i phi.alt / 2), 0)\
T^(upright("遅相子")) \( phi.alt \) vec(0, 1) & = vec(0, e^(- i phi.alt / 2)) $
これらは回転する操作を行えば何も変化しないことが分かる。

これに $+ 45$° 方向に直線偏光した光と $- 45$°
方向に直線偏光した光を通すと
$ T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) vec(1, 1) & = i / sqrt(2) vec(1, - 1)\
T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) vec(1, - 1) & = i / sqrt(2) vec(1, 1) $
となり, これは $1 \/ 2$ 波長板によって L+45P と L-45P は相互変換する. \
また 右円偏光した光と左円偏光した光を通すと
$ T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) vec(1, i) & = i / sqrt(2) vec(1, - i)\
T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) vec(1, - i) & = i / sqrt(2) vec(1, i) $
となり, これは $1 \/ 2$ 波長板によって RCP と LCP は相互変換する. \
これに L+45P, L-45P を通すとそれぞれ LCP, RCP へ変換されることが分かる.
$ T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) vec(1, 1) & = frac(1 + i, 2) vec(1, - i)\
T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) vec(1, - 1) & = frac(1 + i, 2) vec(1, i) $
同様に RCP, LCP を通すとそれぞれ L+45P, L-45P へ変換されることが分かる.
$ T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) vec(1, i) & = frac(1 + i, 2) vec(1, 1)\
T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) vec(1, - i) & = frac(1 + i, 2) vec(1, - 1) $
光学領域での $1 \/ 4$
波長板はサランラップを半ダースほど向きを揃えて重ねることにより自作できるらしい.
\
] 円偏光した光は $1 \/ 4$ 波長板により直線偏光に変換し,
その光強度を求めることで右偏光, 左偏光の光強度が求まる。$s_3$ が求まる。

== 準単色光と部分偏光
<準単色光と部分偏光>
今まで単色光のときを考えていたが,
波数や角振動数に広がりを持つ場合を考える. 波数, スペクトル線の幅,
角振動数の広がり $Delta k \, Delta nu \, Delta omega$ とおく. \
#strong[Q 21B-48.] 波数 $bold(k) in bb(R)^3$ を中心にして, 広がり
$\| Delta bold(k) \| tilde.op Delta k = c^(- 1) Delta nu$
を持つ準単色光を考える. このとき電場の複素表示
$cal(bold(E)) \( bold(r) \, t \)$ は次のように Fourier 変換される.
$ cal(bold(E)) \( bold(r) \, t \) & = integral_(\| bold(k)' - bold(k) \| lt.eq Delta k) d i f f \( bold(k)' \) {cal(E)_1 \( bold(k)' \) bold(epsilon.alt)_1 \( bold(k)' \) + cal(E)_2 \( bold(k)' \) bold(epsilon.alt)_2 \( bold(k)' \)} e^(i \( omega \( bold(k)' \) t - bold(k)' dot.op bold(r) \))\
 & = integral_(\| delta bold(k) \| lt.eq Delta k) d i f f \( delta bold(k) \) {cal(E)_1 \( bold(k) + delta bold(k) \) bold(epsilon.alt)_1 \( bold(k) + delta bold(k) \) + cal(E)_2 \( bold(k) + delta bold(k) \) bold(epsilon.alt)_2 \( bold(k) + delta bold(k) \)} e^(i \( omega \( bold(k) + delta bold(k) \) t - \( bold(k) + delta bold(k) \) dot.op bold(r) \))\
 & = e^(i \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) integral_(\| delta bold(k) \| lt.eq Delta k) d i f f \( delta bold(k) \) {cal(E)_1 \( bold(k) + delta bold(k) \) bold(epsilon.alt)_1 \( bold(k) + delta bold(k) \) + cal(E)_2 \( bold(k) + delta bold(k) \) bold(epsilon.alt)_2 \( bold(k) + delta bold(k) \)} e^(i {\( omega \( bold(k) + delta bold(k) \) - omega \( bold(k) \) \) t - delta bold(k) dot.op bold(r)})\
 $<EC-fourier> ここでコヒーレンス時間 $t_c = Delta nu^(- 1)$
より十分短い時間間隔 $Delta t lt.double t_c$ のとき
$\( omega \( bold(k) + delta bold(k) \) - omega \( bold(k) \) \) Delta t tilde.op Delta nu t_c lt.double 1$
となるので式 @EC-fourier は単色光と見なすことができる. \
#strong[Q 21B-49.]
コヒーレンス時間を超える時間スケールではコヒーレンス時間 $t_c$
程度の時間間毎ごとに定まる Stokes
パラメータの時間平均を取ることによって, 準単色波の Stokes パラメータ
$s_0 \, s_1 \, s_2 \, s_3$ を定義することが出来る. これより1,
2軸の複素振幅を $a_1 e^(i delta_1) \, a_2 e^(i delta_2)$
とおくと平均値の線形性より
$ s_0 & = chevron.l a_1^2 chevron.r + chevron.l a_2^2 chevron.r\
s_1 & = chevron.l a_1^2 chevron.r - chevron.l a_2^2 chevron.r\
s_2 & = 2 chevron.l a_1 a_2 cos delta chevron.r\
s_3 & = 2 chevron.l a_1 a_2 sin delta chevron.r $ と書ける.
完全偏光において関係式 $s_0^2 = s_1^2 + s_2^2 + s_3^2$ を満たしていたが,
準単色波のとき
$ s_0^2 & = (chevron.l a_1^2 chevron.r + chevron.l a_2^2 chevron.r)^2\
 & = s_1^2 + 4 chevron.l a_1^2 chevron.r chevron.l a_2^2 chevron.r\
 & gt.eq s_1^2 + 4 chevron.l a_1 a_2 chevron.r^2\
 & = s_1^2 + 4 chevron.l a_1 a_2 chevron.r^2 chevron.l cos^2 delta + sin^2 delta chevron.r\
 & gt.eq s_1^2 + \( 2 chevron.l a_1 a_2 cos delta chevron.r \)^2 + \( 2 chevron.l a_1 a_2 sin delta chevron.r \)^2\
 & = s_1^2 + s_2^2 + s_3^2 $ このような不等式となるので新しいパラメータ
$p in \[ 0 \, 1 \]$ を用いて式 @s1-def   を修正する.
$ s_0 & = chevron.l a_1^2 chevron.r + chevron.l a_2^2 chevron.r\
s_1 & = p s_0 cos 2 psi cos 2 chi\
s_2 & = p s_0 sin 2 psi cos 2 chi\
s_3 & = p s_0 sin 2 chi $ パラメータ $p$ は準単色光の「偏光度」(degree
of polarization) と呼ばれる.

準単色光の偏光度 $p$ に関するいくつかの用語と重要な性質をまとめる.

+ $p = 1$ の光は「完全偏光」状態にあると言われます. また, $p = 0$
  の光は「まったく偏光していない」(completely unpolarized)
  あるいは「自然光」(natural light) と呼ばれます. それに対して, 一般の
  $0 lt.eq p lt.eq 1$ の光は「部分偏光」状態にあると言われます.

+ 本物の単色光は完全偏光状態 ($p = 1$) にあります.そして, 完全偏光状態
  ($p = 1$) は必ず単色光です. つまり,
  単色光と完全偏光状態はまったく同義です.

+ 部分偏光状態にある光の状態点は半径 $s_0$ の Poincaré
  球面の内部の点に対応します. Poincaré
  球面の表面の各点が完全偏光状態に対応します. Poincaré
  球面の中心の点がまったく偏光していない状態に対応します.

+ 太陽の光や白熱電球の光はまったく偏光していない状態 ($p = 0$)
  にあります. それに比べて, レーザーの光は完全偏光状態にごく近いです
  ($p approx 1$).

== 電磁波の角運動量
<電磁波の角運動量>
#theorem[
電磁波の角運動量 $bold(L)$ はスピン角運動量
$bold(L)_(s p i n)$ と軌道角運動量 $bold(L)_(o r b i t)$
の和で表される。
]
#proof[
$ bold(L) & = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) bold(r) times \( bold(E) times bold(B) \)\
 & = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) bold(r) times \( bold(E) times \( upright(bold(nabla)) times bold(A) \) \)\
 & = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) bold(r) times \( upright(bold(nabla)) \( bold(E) dot.op bold(A) \) - \( bold(E) dot.op upright(bold(nabla)) \) bold(A) \)\
 & = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) (bold(E) times bold(A) + bold(E)_j \( bold(r) times upright(bold(nabla)) \) A_j)\
 & = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) bold(E) times bold(A) + frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) bold(E)_j \( bold(r) times upright(bold(nabla)) \) A_j\
 & = bold(L)_(s p i n) + bold(L)_(o r b i t) $
]

#theorem[
スピン角運動量 $bold(L)_(s p i n)$
の期待値は次のように表される。
$ chevron.l bold(L)_(s p i n) chevron.r & = frac(1, 2 pi c) integral_(bb(R)^3) frac(thin upright(d) bold(k), \( 2 pi \)^3) bold(k) (\| a_(+) \( bold(k) \) \|^2 - \| a_(-) \( bold(k) \) \|^2) $
これより次のようなことを教えてくれる.

+ 電磁場の角運動量のスピン部分 $L_(s p i n)$ の時間平均
  $chevron.l bold(L)_(s p i n) chevron.r$ に対して、各 Fourier モード
  $\( k \, plus.minus \)$ は波数ベクトル $bold(k)$
  に重みづけをした形で寄与する。つまり、各 Fourier モードは縦波として
  $chevron.l bold(L)_(s p i n) chevron.r$ へ寄与する。

+ 波数 $bold(k)$ のモードの寄与する重みは、左円偏光の強度
  $\| a_(+) \( bold(k) \) \|^2$ から右円偏光の強度
  $\| a_(-) \( bold(k) \) \|^2$ を引いた差
  $\| a_(+) \( bold(k) \) \|^2 - \| a_(-) \( bold(k) \) \|^2$
  に比例する。

+ つまり、波数 $bold(k)$ の左円偏光のモードは方向
  $bold(k) \/ \| bold(k) \|$
  のスピン角運動量にプラスの寄与をする。一方、波数 $bold(k)$
  の右円偏光のモードは方向 $bold(k) \/ \| bold(k) \|$
  のスピン角運動量にマイナスの寄与をする。

+ (直線偏光ではなく)円偏光による分解が、電磁波の角運動量に直結している。
]
#proof[
$bold(A)$ について Fourier 変換すると次のようになる。
$ bold(A) \( bold(r) \, t \) & = sum_(j = plus.minus) integral_(bb(R)^3) frac(thin upright(d) bold(k), \( 2 pi \)^3) (bold(a)_j \( bold(k) \) e^(i bold(k) dot.op bold(r)) + bold(a)_j^(\*) \( bold(k) \) e^(- i bold(k) dot.op bold(r)))\
bold(a)_j \( bold(k) \) & = bold(epsilon.alt)_j \( bold(k) \) a_j \( bold(k) \) e^(- i omega \( bold(k) \) t) $
波数 $bold(k)$
について対称性が成り立つようにすることで矛盾なく次のように定義できる.
$ bold(epsilon.alt)_1 \( - bold(k) \) = bold(epsilon.alt)_2 \( bold(k) \) \, bold(epsilon.alt)_2 \( - bold(k) \) = bold(epsilon.alt)_1 \( bold(k) \) $
このとき次の式が導かれる.
$  & bold(epsilon.alt)_plus.minus \( bold(k) \) times bold(epsilon.alt)_plus.minus \( bold(k) \) = 0 \, #h(2em) bold(epsilon.alt)_plus.minus \( bold(k) \) times bold(epsilon.alt)_minus.plus \( bold(k) \) = minus.plus i frac(bold(k), \| bold(k) \|)\
 & bold(epsilon.alt)_minus.plus \( bold(k) \) = bold(epsilon.alt)_plus.minus^(\*) \( bold(k) \) \, #h(2em) bold(epsilon.alt)_plus.minus \( - bold(k) \) = plus.minus i bold(epsilon.alt)_minus.plus \( bold(k) \)\
 & frac(1, \( 2 pi \)^3) integral_(bb(R)^3) thin upright(d) bold(r) e^(i \( bold(k) - bold(k)' \) dot.op bold(r)) = delta \( bold(k) - bold(k)' \)\
 & upright(bold(nabla)) dot.op bold(A) = 0 $ Dirac
のデルタ関数の公式より角運動量のスピン成分 $bold(L)_(s p i n)$
は次のようになる.
$  & bold(L)_(s p i n) = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) bold(E) times bold(A) = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) (- 1 / c frac(partial bold(A), partial t)) times bold(A)\
 & = frac(1, 4 pi c) integral_(bb(R)^3) thin upright(d) bold(r) (sum_(j = plus.minus) integral_(bb(R)^3) frac(i \| bold(k) \| thin upright(d) bold(k), \( 2 pi \)^3) (bold(a)_j \( bold(k) \) e^(i bold(k) dot.op bold(r)) - bold(a)_j^(\*) \( bold(k) \) e^(- i bold(k) dot.op bold(r)))) times (sum_(j' = plus.minus) integral_(bb(R)^3) frac(thin upright(d) bold(k)', \( 2 pi \)^3) (bold(a)_(j') \( bold(k)' \) e^(i bold(k)' dot.op bold(r)) + bold(a)_(j')^(\*) \( bold(k)' \) e^(- i bold(k)' dot.op bold(r))))\
 & = frac(1, 4 pi c) integral frac(thin upright(d) bold(r) thin upright(d) bold(k) thin upright(d) bold(k)', \( 2 pi \)^6) i \| bold(k) \| sum_(j = plus.minus) sum_(j' = plus.minus) #scale(x: 120%, y: 120%)[\(] bold(a)_j \( bold(k) \) times bold(a)_(j') \( bold(k)' \) e^(i \( bold(k) + bold(k)' \) dot.op bold(r))\
 & + bold(a)_j \( bold(k) \) times bold(a)_(j')^(\*) \( bold(k)' \) e^(i \( bold(k) - bold(k)' \) dot.op bold(r)) - bold(a)_j^(\*) \( bold(k) \) times bold(a)_(j') \( bold(k)' \) e^(- i \( bold(k) - bold(k)' \) dot.op bold(r)) - bold(a)_j^(\*) \( bold(k) \) times bold(a)_(j')^(\*) \( bold(k)' \) e^(- i \( bold(k) + bold(k)' \) dot.op bold(r)) #scale(x: 120%, y: 120%)[\)]\
 & = frac(1, 4 pi c) integral frac(thin upright(d) bold(k) thin upright(d) bold(k)', \( 2 pi \)^3) i \| bold(k) \| sum_(j = plus.minus) sum_(j' = plus.minus) #scale(x: 120%, y: 120%)[\(] bold(a)_j \( bold(k) \) times bold(a)_(j') \( bold(k)' \) delta \( bold(k) + bold(k)' \)\
 & + bold(a)_j \( bold(k) \) times bold(a)_(j')^(\*) \( bold(k)' \) delta \( bold(k) - bold(k)' \) - bold(a)_j^(\*) \( bold(k) \) times bold(a)_(j') \( bold(k)' \) delta \( bold(k) - bold(k)' \) + bold(a)_j^(\*) \( bold(k) \) times bold(a)_(j')^(\*) \( bold(k)' \) delta \( bold(k) + bold(k)' \) #scale(x: 120%, y: 120%)[\)]\
 & = frac(1, 4 pi c) integral frac(thin upright(d) bold(k), \( 2 pi \)^3) i \| bold(k) \| sum_(j = plus.minus \, j' = plus.minus) (bold(a)_j \( bold(k) \) times bold(a)_(j') \( - bold(k) \) + bold(a)_j \( bold(k) \) times bold(a)_(j')^(\*) \( bold(k) \) - bold(a)_j^(\*) \( bold(k) \) times bold(a)_(j') \( bold(k) \) + bold(a)_j^(\*) \( bold(k) \) times bold(a)_(j')^(\*) \( - bold(k) \))\
 & = frac(1, 4 pi c) integral frac(thin upright(d) bold(k), \( 2 pi \)^3) i \| bold(k) \| sum_(j = plus.minus) (bold(a)_j \( bold(k) \) times bold(a)_j \( - bold(k) \) + bold(a)_j \( bold(k) \) times bold(a)_j^(\*) \( bold(k) \) - bold(a)_j^(\*) \( bold(k) \) times bold(a)_j \( bold(k) \) + bold(a)_j^(\*) \( bold(k) \) times bold(a)_j^(\*) \( - bold(k) \))\
 & = frac(1, 4 pi c) integral frac(thin upright(d) bold(k), \( 2 pi \)^3) \| bold(k) \| frac(bold(k), \| bold(k) \|) sum_(j = plus.minus) (i a_j \( bold(k) \) a_j \( - bold(k) \) e^(- 2 i omega \( bold(k) \) t) + j \| a_j \( bold(k) \) \|^2 + j \| a_j \( bold(k) \) \|^2 - i a_j^(\*) \( bold(k) \) a_j^(\*) \( - bold(k) \) e^(2 i omega \( bold(k) \) t))\
 & = frac(1, 4 pi c) integral frac(thin upright(d) bold(k), \( 2 pi \)^3) bold(k) sum_(j = plus.minus) (2 j \| a_j \( bold(k) \) \|^2 + i a_j \( bold(k) \) a_j \( - bold(k) \) e^(- 2 i omega \( bold(k) \) t) - i a_j^(\*) \( bold(k) \) a_j^(\*) \( - bold(k) \) e^(2 i omega \( bold(k) \) t)) $
時間平均を取ると次のようになる。
]

== 有限の広がりを持つ円偏光の近似的平面波の角運動量
<有限の広がりを持つ円偏光の近似的平面波の角運動量>
積分値が発散しないように波長 $lambda = 2 pi \/ k$ よりずっと大きな $L$
程度の有限の領域 $D subset.eq bb(R)^2$ だけで振幅がゼロでなく,
ほぼ一定であるような近似的平面波を考える. \

#proposition("円筒対称性")[

]
#strong[Q21B-55.] このとき円偏光の近似的平面波の電場の複素表示
$tilde(bold(E)) \( x \, y \, z \, t \)$ を次のように与える.
$ tilde(bold(E)) \( x \, y \, z \, t \) & = {f \( x \, y \) \( bold(e)_x plus.minus i bold(e)_y \) + g \( x \, y \) bold(e)_z} e^(i \( bold(k) z - omega t \)) $<def-ET-D>
また, 復号 $plus.minus$ により, 2つの円偏光を同時に考察する.
$ plus.minus arrow.l.r.double upright(h e l i c i t y) = plus.minus 1 arrow.l.r.double {"左円偏光"\
"右円偏光" $ このとき $f \( x \, y \) \, g \( x \, y \)$
にはMaxwellの方程式より次のような関係がある.
$ nabla dot.op tilde(bold(E)) \( x \, y \, z \, t \) & = frac(partial f \( x \, y \), partial x) plus.minus i frac(partial f \( x \, y \), partial y) - i k g \( x \, y \) = 0\
g \( x \, y \) & = i / k {frac(partial f \( x \, y \), partial x) plus.minus i frac(partial f \( x \, y \), partial y)} $
これより両辺を領域 D で積分すると近似によって
$ g tilde.op frac(1, k L) f $ となることがわかり, $L arrow.r oo$
で縦成分 $g$ は消える. \
#strong[Q 21B-56.] Coulomb ゲージよりベクトルポテンシャル
$tilde(bold(A))$ について次の式が成り立つ.
$ tilde(bold(E)) & = - 1 / c frac(partial tilde(bold(A)), partial t)\
tilde(bold(A)) & = - c integral tilde(bold(E)) d t = frac(c, i omega) tilde(bold(E)) $

#strong[Q 21B-57.] 同様に Coulomb ゲージより磁場 $tilde(bold(B))$
について次の式が成り立つ.
$ tilde(bold(B)) & = upright(bold(nabla)) times tilde(bold(A)) = frac(c, i omega) upright(bold(nabla)) times tilde(bold(E))\
 & = (plus.minus k f + frac(partial g, partial y) \, i k f - frac(partial g, partial x) \, plus.minus i frac(partial f, partial x) - frac(partial f, partial y)) e^(i \( k z - omega t \))\
 & tilde.op plus.minus k tilde(bold(E)) $ ただしオーダー
$display(O \( \( frac(1, k L) \)^2 \))$ の項は無視する近似を用いた. \
プリント間違っていそう. \
#strong[Q 21B-58.] 物理的な電場を $bold(E) = Re tilde(bold(E))$
とおくと上で議論したことから
$ bold(B) & = plus.minus k Im tilde(bold(E))\
bold(A) & = c / omega Im tilde(bold(E)) $<B-tilde-E> となる. \
#strong[Q 21B-59.] 関数 $f \( x \, y \)$ が円筒対称性を持つときを考える.
つまり $f \( x \, y \)$ は xy 平面の極座標 $\( rho \, phi \)$ として
$rho = sqrt(x^2 + y^2)$ のみの関数となる. このとき関数 $g \( x \, y \)$
は次のように表される.
$ g & = i / k (frac(partial f, partial rho) frac(partial rho, partial x) plus.minus i frac(partial f, partial rho) frac(partial rho, partial y))\
 & = i / k e^(plus.minus i phi) frac(upright(d) f, upright(d) rho) $<def-g>

#strong[Q 21B-60.] 角運動量のスピン部分 $bold(L)_(s p i n)$ を求める.
$ bold(E) times bold(A) & = c / omega Re tilde(bold(E)) times Im tilde(bold(E))\
 & = frac(c, 2 omega) Im (tilde(bold(E))^(\*) times tilde(bold(E)))\
 & = frac(c, 2 omega) Im ((minus.plus 2 i Re \( f^(\*) g \) \, - 2 i Im \( f^(\*) g \) \, plus.minus 2 i \| f \|^2))\
 & = frac(c, 2 omega) (minus.plus 2 Re \( f^(\*) g \) \, - 2 Im \( f^(\*) g \) \, plus.minus 2 \| f \|^2)\
Re \( f^(\*) g \) & = Re (f^(\*) (i / k e^(plus.minus i phi) frac(upright(d) f, upright(d) rho))) = 1 / k {minus.plus sin phi Re (f^(\*) frac(upright(d) f, upright(d) rho)) - cos phi Im (f^(\*) frac(upright(d) f, upright(d) rho))}\
Im \( f^(\*) g \) & = Im (f^(\*) (i / k e^(plus.minus i phi) frac(upright(d) f, upright(d) rho))) = 1 / k {cos phi Re (f^(\*) frac(upright(d) f, upright(d) rho)) minus.plus sin phi Im (f^(\*) frac(upright(d) f, upright(d) rho))} $
ここで $x y$ 面内では電磁波が実質的にゼロでない領域を内部に含み, $z$
方向には十分に長い体積 $V$ を取る. このとき $x y$
面内では円筒対称に近似的平面波となっているので相殺して十分小さくなる,
よって次のようになる.
$ bold(L)_(s p i n) & = frac(1, 4 pi c) integral_V d i f f \( bold(r) \) bold(E) times bold(A)\
 & = plus.minus frac(1, 4 pi omega) (integral_V d i f f \( bold(r) \) \| f \|^2) bold(e)_z $

#strong[Q 21B-61.] 角運動量の軌道部分 $bold(L)_(o r b i t)$ を求める.
Einsteinの縮約を用いて
$ E_j \( bold(r) times upright(bold(nabla)) \) A_j & = c / omega {Re \( tilde(E)_j \) \( bold(r) times upright(bold(nabla)) \) Im \( tilde(E)_j \)}\
 & = frac(c, 2 omega) {Im (tilde(E)_j \( bold(r) times upright(bold(nabla)) \) tilde(E)_j) + Im (tilde(E)_j^(\*) \( bold(r) times upright(bold(nabla)) \) tilde(E)_j)}\
tilde(E)_j \( bold(r) times upright(bold(nabla)) \) tilde(E)_j & = f mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), i k f) e^(2 i \( bold(k) z - omega t \)) + i f mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; i frac(partial f, partial y), i frac(partial f, partial y), - k f) e^(2 i \( bold(k) z - omega t \)) + g mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), i k g) e^(2 i \( bold(k) z - omega t \))\
 & = g mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), i k g) e^(2 i \( bold(k) z - omega t \))\
tilde(E)_j^(\*) \( bold(r) times upright(bold(nabla)) \) tilde(E)_j & = f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), i k f) - i f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; i frac(partial f, partial y), i frac(partial f, partial y), - k f) + g^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), i k g)\
 & = 2 f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), i k f) + g^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), i k g)\
g mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), i k g) & = i / k frac(upright(d) f, upright(d) rho) e^(plus.minus i phi) i / k [i k y frac(upright(d) f, upright(d) rho) e^(plus.minus i phi) - z {frac(partial, partial y) frac(upright(d) f, upright(d) rho) e^(plus.minus i phi)} \, z {frac(partial, partial x) frac(upright(d) f, upright(d) rho) e^(plus.minus i phi)} - i k x frac(upright(d) f, upright(d) rho) e^(plus.minus i phi) \, plus.minus i frac(upright(d) f, upright(d) rho) e^(plus.minus i phi)]^t\
 & = - 1 / k^2 frac(upright(d) f, upright(d) rho) e^(plus.minus 2 i phi) \[i k rho sin phi frac(upright(d) f, upright(d) rho) - z {sin phi frac(upright(d)^2 f, upright(d) rho^2) plus.minus frac(i cos phi, rho) frac(upright(d) f, upright(d) rho)} \,\
 & quad z {cos phi frac(upright(d)^2 f, upright(d) rho^2) minus.plus frac(i sin phi, rho) frac(upright(d) f, upright(d) rho)} - i k rho cos phi frac(upright(d) f, upright(d) rho) \, plus.minus i frac(upright(d) f, upright(d) rho)\]^t\
g^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), i k g) & = 1 / k^2 (frac(upright(d) f, upright(d) rho))^(\*) \[i k rho sin phi frac(upright(d) f, upright(d) rho) - z {sin phi frac(upright(d)^2 f, upright(d) rho^2) plus.minus frac(i cos phi, rho) frac(upright(d) f, upright(d) rho)} \,\
 & quad z {cos phi frac(upright(d)^2 f, upright(d) rho^2) minus.plus frac(i sin phi, rho) frac(upright(d) f, upright(d) rho)} - i k rho cos phi frac(upright(d) f, upright(d) rho) \, plus.minus i frac(upright(d) f, upright(d) rho)\]^t\
f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), i k f) & = f^(\*) [i k y f - z frac(partial f, partial y) \, z frac(partial f, partial x) - i k x f \, x frac(partial f, partial y) - y frac(partial f, partial x)]^t\
 & = f^(\*) (i k rho f - z frac(upright(d) f, upright(d) rho)) [sin phi \, - cos phi \, 0]^t $
となる. これらを角運動量の軌道部分の定義式に代入して
$sin psi \, cos psi \, e^(i z)$
の依存性があるとき積分すると相殺されることから
$ bold(L)_(o r b i t) & = frac(1, 4 pi c) integral_V d i f f \( bold(r) \) E_j \( bold(r) times nabla \) A_j\
 & = frac(1, 8 pi omega) integral_V d i f f \( bold(r) \) {Im (tilde(E)_j \( bold(r) times upright(bold(nabla)) \) tilde(E)_j) + Im (tilde(E)_j^(\*) \( bold(r) times upright(bold(nabla)) \) tilde(E)_j)}\
 & = frac(1, 8 pi omega) integral_V d i f f \( bold(r) \) {Im (plus.minus 1 / k^2 (frac(upright(d) f, upright(d) rho))^(\*) i frac(upright(d) f, upright(d) rho))}\
 & = plus.minus frac(1, 8 pi omega) 1 / k^2 (integral_V d i f f \( bold(r) \) lr(|frac(upright(d) f, upright(d) rho)|)^2) bold(e)_z $
となる. \
#strong[Q 21B-62.] 以下は式を見る事で分かる.

+ 角運動量のスピン部分 $bold(L)_(s p i n)$ と軌道部分
  $bold(L)_(o r b i t)$ の両者ともに、電磁波の伝播方向 $+ z$
  に平行な成分しか持たない。

+ 軌道部分 $bold(L)_(o r b i t)$ はスピン部分 $bold(L)_(s p i n)$
  に比較して大きさが小さい。両者の大きさの比は小さいパラメータ
  $1 \/ \( k L \)$の 2 乗のスケールである:
  $ frac(\| bold(L)_(o r b i t) \|, \| bold(L)_(s p i n) \|) tilde.op (frac(1, k L))^2 $

+ よって、xy 平面内での電磁波の広がりを大きくする極限
  $1 \/ \( k L \) arrow.r 0$ において、角運動量の軌道部分
  $bold(L)_(o r b i t)$ はスピン部分 $bold(L)_(s p i n)$
  に比べて無視できるようになって、電磁波の全角運動量
  $bold(L) = bold(L)_(s p i n) + bold(L)_(o r b i t)$ はスピン部分
  $bold(L)_(s p i n)$ だけからなるようになる:
  $ bold(L) arrow.r bold(L)_(s p i n) = plus.minus frac(1, 4 pi omega) (integral_V thin upright(d) V \( bold(r) \) \| f \|^2) bold(e)_z $<L-limit>

+ この結果を見る限り、「平面波の角運動量ベクトルの方向は、偏光状態が左円偏光ならば進行方向に平行であり、偏光状態が右円偏光ならば進行方向に反平行である。」と言える。

#strong[Q 21B-63.] CGSガウス単位系でのエネルギー密度の総和を考えると
$ U = frac(1, 8 pi) integral_V d i f f \( bold(r) \) (lr(|bold(E)|)^2 + lr(|bold(B)|)^2) $
式 @def-ET-D, @B-tilde-E, @def-g より
$ lr(|tilde(bold(E))|)^2 & = \| bold(E) \|^2 + \| bold(B) \|^2\
 & = 2 \| f \|^2 + \| g \|^2\
 & = 2 \| f \|^2 + 1 / k^2 lr(|frac(upright(d) f, upright(d) rho)|)^2 $
となるので $ U & = U_(s p i n) + U_(o r b i t)\
U_(s p i n) & = frac(1, 4 pi) integral_V thin upright(d) V \( bold(r) \) \| f \|^2\
U_(o r b i t) & = frac(1, 8 k^2 pi) integral_V thin upright(d) V \( bold(r) \) lr(|frac(upright(d) f, upright(d) rho)|)^2\
 $ 次の式より電磁場の広がりを十分大きくすると $U_(s p i n)$
が主要項となる.
$ U_(o r b i t) / U_(s p i n) & tilde.op (frac(1, k L))^2\
U & = U_(s p i n) #h(2em) (frac(1, k L) arrow.r 0) $<U-limit>

#strong[Q 21B-64.] 式 @L-limit, @U-limit より次の式が導かれる.
$ L_z = plus.minus 1 / omega U $

#strong[Q 21B-65.] 電磁波を担う実体が光子 (photon) であることを認めると,
1個の光子のエネルギーは
$planck omega med \( omega = c \| bold(k) \| \)$, 運動量は
$planck bold(k)$ である事実が知られている. Q21B-64
の結果と対応原理を組み合わせて光子の角運動量の進行方向の成分が次のようにわかる.
$ upright("1個の光子の角運動量 ") bold(L) upright(" の ") bold(k) \/ \| bold(k) \| upright(" 方向の成分") = cases(delim: "{", + planck & "左円偏光状態", - planck & "右円偏光状態") $
このように helicity とは光子の角運動量の進行方向の成分を $planck$
単位で測った量である.

= Ray Tracing
<ray-tracing>
#definition[
可視光
]
#definition[
視点から仮想の光線レイをシーンに向けて飛ばし、さらに反射・屈折して光源へ飛ばす。
$ bold(r) = bold(r)_0 + t bold(d) $
]
#definition("ガンマ補正")[
$ gamma : \( R \, G \, B \) mapsto \( R^(1 \/ 2.2) \, G^(1 \/ 2.2) \, B^(1 \/ 2.2) \) $
]
#definition("影")[
太陽の方向を $bold(l)$ とすると光の強さを
$max \( bold(l) dot.op bold(n) \, 0 \)$ とする。
]
= 物理ベースレンダリング理論
<物理ベースレンダリング理論>
#definition[
光の方向を一方向に絞り、
$ bold(E) \( t \, bold(r) \) & = integral_(bb(R)) thin upright(d) bold(k) bold(E)_0 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $
放射束
$ E_lambda & = n frac(h c, lambda) \, #h(2em) Phi_lambda = frac(upright(d) E_lambda, upright(d) t) \, #h(2em) Phi = integral_(bb(R)) Phi_lambda thin upright(d) lambda $
放射輝度
$ L \( x \, bold(omega) \) = frac(1, cos theta) frac(upright(d) Phi, upright(d) A \, bold(omega)) $
RGB それぞれの放射束をそのまま画像にすればいい。
本来は可視光領域全てのスペクトルなので荒い近似になる。
全波長考慮したレンダリングはフルスペクトラムレンダリングと呼ぶ。
]
#block[
#definition("双方向反射率分布関数 (BRDF)")[
発光 $L_e \( x \, bold(omega)_r \)$
$ L_r \( x \, bold(omega)_r \) & = integral_Omega f \( x \, bold(omega)_i \, bold(omega)_r \) L_i \( x \, bold(omega)_i \) cos theta thin upright(d) bold(omega)_i\
thin upright(d) L_r \( x \, bold(omega)_r \) & = f \( x \, bold(omega)_i \, bold(omega)_r \) L_i \( x \, bold(omega)_i \) cos theta thin upright(d) bold(omega)_i\
 $
]

]
#definition("レンダリング方程式")[
$ L_o \( x \, bold(omega)_r \) & = L_e \( x \, bold(omega)_r \) + L_r \( x \, bold(omega)_r \)\
L_i \( x \, bold(omega)_i \) & = L_o \( t \( x \, bold(omega)_i \) \, bold(omega)_i \) $
]
#proposition[
$ L_r \( x \, bold(omega)_r \) & = s L_i \( x \, bold(omega)_i \) $
]
#definition[

]
