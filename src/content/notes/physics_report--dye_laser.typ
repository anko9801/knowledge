#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "色素レーザー",
  date: "2026-08-18",
  tags: ("レポート",),
  summary: "physics_report/dye_laser.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 実験目的
<実験目的>
レーザー (LASER; Light Amplification by Stimulated Emission of
Radiation) は現代では科学技術から日常生活まで幅広く使われている。
本実験ではパルス色素レーザーを組み立てて原理を理解するとともにレーザー発振の過程を追跡することにある。

このレポートでは実験の章で課題を中心に実験原理、実験結果、考察をまとめて記述する。実験手法は記述せず、研究プロジェクトのテキストに任せることにする。

= 実験原理
<実験原理>
Einstein
の光の遷移理論では共鳴条件を満たす光子のやりとりによって準位状態が変化する。
このモデルにおいて光と物質の相互作用は次の 3 つがあるとされる。

+ 吸収過程: 光子が当たると下準位から上準位へ励起する。

+ 誘導放出過程:
  光子が当たると上準位から下準位へ遷移して方向、位相の同じ光が誘導されて放出される。

+ 自然放出過程:
  上準位から下準位へ遷移して同時に方向、位相が同じとは限らない光が放出される。

まず 2 準位系について準位 1, 2
において誘導励起させる。吸収、放出過程の確率 $P_(a b s) \, P_(e m i)$
とすると次の等式が成り立つ。
$ P_(a b s) & = planck omega B_12 W \( omega \) N_1\
P_(e m i) & = planck omega \( A + B_21 W \( omega \) \) N_2\
Delta P & = P_(a b s) - P_(e m i) = \( N_1 - N_2 \) planck omega B W \( omega \)\
 & = \( N_1 - N_2 \) planck omega B P / c\
frac(upright(d), upright(d) z) P \( z \) & = - Delta P = - \( N_1 - N_2 \) frac(planck omega, c) B P \( z \) $
熱平衡状態において次の等式が成り立つ。
$ N_2 / N_1 & = exp (- frac(E_2 - E_1, k_B T)) < 1\
N_2 & < N_1 $ 反転分布 $N_1 < N_2$ となるためには $T < 0$
とならなければならず、これを負温度という。
そして基本的に吸収過程を強くすることで負温度となり反転分布となる。

次に 3 準位系を考える。 準位 1, 2
間で誘導励起するとする。このとき次のように表現できる。
$ frac(upright(d), upright(d) t) vec(N_1, N_2, N_3) = vec(- Gamma N_1, 0, Gamma N_1) + mat(delim: "(", - \( gamma_12 + gamma_13 \), gamma_21, gamma_31; gamma_12, - \( gamma_21 + gamma_23 \), gamma_32; gamma_13, gamma_23, - \( gamma_31 + gamma_32 \)) vec(N_1, N_2, N_3) $
次のような定常状態を考える。 $ frac(upright(d) N_i, upright(d) t) = 0 $
このとき $N = N_1 + N_2 + N_3$ とおくと
$ N_1 & = frac(gamma_21 \( gamma_31 + gamma_32 \), gamma_21 \( gamma_31 + gamma_32 \) + \( gamma_21 + gamma_32 \) Gamma) N\
N_2 & = frac(gamma_32 Gamma, gamma_21 \( gamma_31 + gamma_32 \) + \( gamma_21 + gamma_32 \) Gamma) N $
となるから反転分布 $N_1 < N_2$ となる条件は次のようになる。
$ Gamma > gamma_31 (1 + gamma_31 / gamma_32) $

最後に 4 準位系を考える。 準位 1, 2 間で誘導励起を起こす。 準位 0
から準位 1
へは熱のやりとりによって励起が起こりそれ以外は自然に励起することはないとする。
すると次のように表現できる。
$ frac(upright(d), upright(d) t) vec(N_0, N_1, N_2, N_3) = vec(- Gamma N_0, 0, 0, Gamma N_0) + mat(delim: "(", - gamma_01, gamma_10, gamma_20, gamma_30; gamma_01, - gamma_10, gamma_21, gamma_31; 0, 0, - gamma_2, gamma_32; 0, 0, 0, - gamma_3) vec(N_0, N_1, N_2, N_3) $
ただし $gamma_2 = gamma_20 + gamma_21$,
$gamma_3 = gamma_30 + gamma_31 + gamma_32$ とおいた。 これより
$N = N_0 + N_1 + N_2 + N_3$ であるから定常状態のとき次のように解ける。
$ N_0 & = frac(gamma_10 gamma_2 gamma_3, \( gamma_10 + gamma_01 \) gamma_2 gamma_3 + gamma_32 \( gamma_21 + gamma_10 \) Gamma + gamma_2 \( gamma_31 + gamma_10 \) Gamma) N\
N_1 & = (gamma_01 / gamma_10 + frac(gamma_21 gamma_32 + \( gamma_20 + gamma_21 \) gamma_31, gamma_10 \( gamma_20 + gamma_21 \) \( gamma_32 + gamma_31 + gamma_30 \)) Gamma) N_0\
N_2 & = frac(gamma_32 Gamma, \( gamma_21 + gamma_20 \) \( gamma_32 + gamma_31 + gamma_30 \)) N_0\
N_3 & = frac(Gamma, gamma_32 + gamma_31 + gamma_30) N_0 $
これより反転分布 $N_2 > N_1$ となる条件は次のようになる。
$ Gamma > frac(gamma_01 gamma_2 gamma_3, gamma_32 gamma_10 - gamma_21 gamma_32 - gamma_2 gamma_31) $

どの準位系でも吸収過程においてある閾値を超えることで反転分布となる。 \
2
準位系では確率分布が分配するようなラビ振動が起こってしまい、安定しない固有状態となってしまう。
(課題 0.1.1) \
コヒーレント光とは位相が時間的に不変で一定に保たれているような光でレーザー光はこれに近い光である。
(課題 0.1.2)

= 実験
<実験>
== 光の周波数軸測定
<光の周波数軸測定>
本実験で使う分光器は Spectral Products 社製小型分光器 (SM240) である。

SM240 には入力フィルターとして 530 nm のローパスフィルターが入っている。
まずこれに裸電球の光を当てると図 @fig:bare-light のようになった。

#figure(web-image("/public/notes/physics_report/assets/bare_light_bulb.png", width: 14cm),
  caption: [
    裸電球のスペクトル
  ]
)
<fig:bare-light>

裸電球はフィラメントを約 2500 K
にまで熱して黒体輻射により発光する。黒体輻射の光強度は次のプランクの法則に従うので裸電球は波長
500-4000nm で強く発光することがわかる。
$ E & = frac(8 pi h nu^3, c^3) frac(1, exp (frac(h nu, k_B T)) - 1) $
そして 530 nm
以下の波長の光はローパスフィルターにより削られるので正しいグラフが得られていることがわかる。
(課題 1.1.1) \
次に Ne ランプを分光器に当てると図  のようになった。 Ne
の輝線スペクトルは図 @fig:Ne-spectre のようになり, 633 nm
近くのスペクトル線は表 #link(<table:spectre>)[table:spectre] のように対応していることがわかる。
(課題 1.1.2) \

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/ne_lump.png", width: 8cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/Neon-Calibration.jpg", width: 8cm))
  ]],
  caption: [
    Ne の輝線スペクトル
  ]
)
<fig:Ne-spectre>

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (center,center,),
    table.header([Ne ランプのピーク], [Ne の輝線スペクトルの波長],),
    table.hline(),
    [627.8798 ch], [630.479 nm],
    [630.6506 ch], [633.442 nm],
    [635.3986 ch], [638.299 nm],
  )]
  , caption: [スペクトル]
  , kind: table
  )

] <table:spectre>
HeNe
レーザーを分光器に当てることについては半値全幅を測定したと思われるがデータが見つからず、レポートに載せることが出来なかった。
(課題 1.1.3) \
また表 #link(<table:spectre>)[table:spectre] を元にキャリブレーションすると
$lambda = upright(c h) + 2.75$ 程度に調整すればよいことがわかる。 (課題
1.1.4)

== 光の時間軸測定の習得
<光の時間軸測定の習得>
本実験ではフォトダイオードで光検出し、オシロスコープで表示する。 \
HeNe レーザーの光を白い紙に照射しスポットを作る。これをすべての光が
$2 pi$ 方向に一様に散乱される点光源と近似する。
フォトダイオードと点光源の距離は $d = 39 m m$
であり、フォトダイオードの受光面は円形でその半径は $r = 2.5 m m$
であるとする。 このとき受光面の立体角を考えることで HeNe レーザーが 1
秒当たりに放出する光子数 $N_p$ は次のようになる。
$ I & = V / R = frac(0.31 V, 1 M upright("Ω")) = 3.1 times 10^(- 7) A\
 & = alpha n_p e = alpha (frac(4 pi d^2, 4 pi r^2) N_p) e = (d / r)^2 alpha N_p e\
N_p & = (r / d)^2 frac(I, alpha e) = (frac(2.5 m m, 39 m m))^2 frac(3.1 times 10^(- 7) A, 1.0 times 1.602 times 10^(- 19) C) = 7.95 times 10^9 $
よって $8.0 times 10^9$ 個程度となる。 (課題 1.2.1) \
また Si フォトダイオードの HeNe レーザーの波長に対する受光感度は 400
mA/W であるから量子効率 $alpha = n_e \/ n_p$ は次のようになる。
$ E & = frac(h c, lambda) = frac(6.626 times 10^(- 34) J dot.op s times 3.00 times 10^8 m \/ s, 632.991 n m) = 3.14 times 10^(- 19) J\
n_p & = frac(1 W, E) = 3.18 times 10^18\
n_e & = frac(1 W times 400 m A \/ W, e) = 2.5 times 10^17\
alpha & = n_e / n_p approx 0.785 $ これより HeNe
レーザーの波長での量子効率は 79 % となる。 (課題 1.2.2) \
Ne ランプの電極の向きを受光に対して縦向きか横向きかで図 , 図
@ne-lamp-2 ように変わった。 Ne ランプの構造として 50 Hz
の交流の電気が流れて $+$, $-$ に対して片方の電極が光る。
そして光の強度は距離に対して逆 2
乗で減っていくから横向きだと交互に光強度の強弱 (課題 1.2.3) \

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/ne_lamp1.jpg", width: 6cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/ne_lamp2.jpg", width: 6cm))
  ]],
  caption: [
    縦向き Ne ランプ
  ]
)
<ne-lamp-2>

これよりオシロスコープに 50Ω の終端抵抗をおくと図 @noise
のように電圧がノイズのオーダーに近くなってしまい、観測しづらい。 (課題
1.2.4)

#figure(web-image("/public/notes/physics_report/assets/noise.jpg", width: 6cm),
  caption: [
    50 Ω の終端抵抗における Ne ランプ
  ]
)
<noise>

== 波長固定色素レーザーの実験
<波長固定色素レーザーの実験>
色素レーザーとは量子効率の高い蛍光物質を用いたレーザーである。
今回はローダミン 6G と呼ばれる蛍光物質をメタノールで $0.0001 m o l \/ L$
まで希釈した溶液を扱う。 ローダミン 6G は図 
のような構造式で図 @rhodamine_spectrum のように波長 500-550 nm
に強い光吸収スペクトルを持ち, 560-600 nm で蛍光する物質である。 \

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/rhodamine6G.jpg", width: 6cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/rhodamine6G_wave.jpg", width: 6cm))
  ]],
  caption: [
    吸収スペクトルと蛍光スペクトル (Handai Nanophotonics Volume3 2.3
    より)
  ]
)
<rhodamine_spectrum>

実際に実験で用いる色素溶液を 100
倍希釈したものに緑、赤のレーザーポインタの光や白色 LED
を当ててみるとそれぞれ図 , 図 @red, 図 @white のようになった。
これらを観察してみると緑色や白色の光を当てると黄色に蛍光することが分かる。
これはローダミン 6G の性質と一致している。(課題 2.1.1) \

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/green.jpg", width: 6cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/red.jpg", width: 6cm))
  ]],
  caption: [
    ローダミン 6G 希釈溶液に赤色のレーザー光を当てた場合
  ]
)
<red>

#figure(web-image("/public/notes/physics_report/assets/white.jpg", width: 6cm),
  caption: [
    ローダミン 6G 希釈溶液に白色のレーザー光を当てた場合
  ]
)
<white>

そしてローダミン 6G の蛍光原理は電子励起、振動励起による。

電子励起状態とは電子の軌道のエネルギー準位が基底状態よりも高くなった状態のことである。
この電子励起が全体のエネルギー準位に大きく関わる。

振動励起における振動とは系の温度が高くなることで分子中の原子間距離が振動することである。
この振動エネルギーは飛び飛びの値を取り、その値を振動準位と呼ぶ。
振動励起とは振動準位が基底状態よりも高くなった状態のことである。
本実験で扱うローダミン 6G は分子式 \_28\_31\_2\_3 と原子数 65
個の多原子分子である。 この為, 振動の自由度は
$3 N - 6 = 3 times 65 - 6 = 189$ であり, 振動モードも約 190 個となる。
(課題 2.1.2) \
このように光子のエネルギー以外に熱のやりとりによる多数のモードがある為,
全体のエネルギー準位はバンド構造となるから吸収,
蛍光スペクトルは連続的なスペクトルとなっている。 \
発振成功率が 50 % となる放電電圧の閾値は 3.35V となった。 (課題 2.2.1) \
フラッシュランプ、蛍光、色素レーザー光のスペクトルはそれぞれ図
@flush-lamp, 図 , 図 @dye-laser, 時間波形はそれぞれ図
#link(<flush-lamp-oscillo>)[flush-lamp-oscillo], 図 , 図 @dye-laser-oscillo
のようになった。 これらを観察すると表 #link(<table:light>)[table:light]
のようにまとめられる。
オシロスコープで得られた電圧に関しては距離や立体角などに依存して定量的で話せないことに注意する。
(課題 2.2.2, 2.2.3) \

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,left,left,),
    table.header([対象の光], [スペクトル], [時間波形],),
    table.hline(),
    [環境光], [673 nm のピーク], [なし],
    [フラッシュランプ], [570-610 nm の範囲で強くなる], [5~s
    で上がってから 29~s で下がる],
    [蛍光], [611 nm と 546 nm のピーク], [フラッシュランプの 2~s
    後に発光],
    [色素レーザー], [600 nm のピーク], [フラッシュランプが閾値を超えて
    1~s 後に発光],
  )]
  , caption: [色素レーザーに関する光のスペクトルと時間波形について]
  , kind: table
  )

] <table:light>
#figure(web-image("/public/notes/physics_report/assets/flush_lamp_true.png", width: 14cm),
  caption: [
    フラッシュランプのスペクトル
  ]
)
<flush-lamp>

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/fluorescence.png", width: 8cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/dye_laser.png", width: 8cm))
  ]],
  caption: [
    色素レーザーのスペクトル
  ]
)
<dye-laser>

#text(fill: gray)[（画像なし）],
  caption: [
    フラッシュランプの時間波形
  ]
)
<flush-lamp-oscillo>

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/fluorescence_oscillo.jpg", width: 8cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/dye_laser_oscillo.jpg", width: 8cm))
  ]],
  caption: [
    色素レーザーの時間波形
  ]
)
<dye-laser-oscillo>

偏光特性についてはフラッシュランプ、蛍光、色素レーザー光のどれも見つけられなかった。
(課題 2.2.4) \

== 波長可変色素レーザーの実験
<波長可変色素レーザーの実験>
最も出力が強くなる発振波長において発振するための放電電圧の閾値は 3.5 V
となった。 これはプリズムによって波長を選択することによって課題 2.2.1
に比べて光量が減っているから必要な電圧が高まっていると考えられる。 (課題
3.1.1) \
分光器を用いてプリズムの傾きを変えたときの色素レーザー光の波長のピークを調べる。
このとき最強となる波長は 600 nm で発振の成功率が 50 %
となる最短と最長の波長はそれぞれ 588 nm, 611 nm となった。 課題 2.2.2 の
600 nm の鋭いピークに対して 10nm ほど長短に拡がっている。
これは波長を選択することによって誘導放出がしやすくなったことによると考えられる。
(課題 3.1.2) \
最も強い発振スペクトルは図 @prism-strongest
のようになった。プリズムを挟まなかった図 @dye-laser
と比べると線幅は変わらず、ピーク自体が振動しているように見える。 (課題
3.1.3) \

#figure(web-image("/public/notes/physics_report/assets/prism_strongest.png", width: 12cm),
  caption: [
    最も強い発振スペクトル
  ]
)
<prism-strongest>

ここで共振器長 $l$ と共振器中で振動した周期数 $n$ を用いて波長
$lambda_n$ とそれらの波長の間隔 $Delta lambda$ は次のように書ける。
$ lambda_n & = frac(2 l, n)\
Delta lambda & = lambda_(n + 1) - lambda_n = 2 l (1 / n - frac(1, n + 1)) approx frac(2 l, n^2) $
波長 $lambda = 600 n m$ 共振器長 $l = 3.0 times 10^2 m m$
であったので波長の間隔 $Delta lambda$ は次のようになる。
$ n & = frac(2 l, lambda_n) = frac(2 times 300 m m, 600 n m) = 1.0 times 10^6\
Delta lambda & = 2 times 300 m m times frac(1, \( 1.0 times 10^6 \)^2) = 6.0 times 10^(- 4) n m $
これより $6.0 times 10^(- 4) n m$ ごとに共振する。
$ m & = frac(lambda_max - lambda_min, Delta lambda) = frac(23 n m, 6.0 times 10^(- 4) n m) = 3.83 times 10^4 $
更に $3.8 times 10^4$ 個程度のモード数がある。 (課題 3.1.4, 0.1.3) \
最も強く発振する波長での時間波形は図 @dye-laser-prism-oscillo
のようになった。 これは図 @dye-laser-oscillo
に比べて色素レーザー光の強度が弱くなっている。 (課題 3.1.5) \

#figure(web-image("/public/notes/physics_report/assets/dye_laser_prism.jpg", width: 12cm),
  caption: [
    プリズムを通した色素レーザーの時間波形
  ]
)
<dye-laser-prism-oscillo>

偏光フィルターがある特定の角度で光強度がゼロとなるような偏光特性があった。
s 偏光はどんな角度でも光強度があり、偏光特性はあまり見られない。
それに対し p 偏光は約 60°
で光強度がゼロとなるため、偏光板がその傾きのときそれから出てくる光強度はゼロとなる。
これより課題 2.2.4 は s 偏光、課題 3.1.6 は p
偏光と対応することがわかる。 (課題 3.1.6) \
色素レーザー光は距離 1.7m に対して半径は $6 m m$
となった。これより立体角 $Omega$ は次のようになる。
$ Omega = 4 pi frac(pi r^2, pi R^2) = 4 pi 6^2 / 1700^2 = 4 pi times 1.2 times 10^(- 5) $
これより立体角 $4 pi$ の比は $1.2 times 10^(- 5)$ となった。 (課題
3.1.7) \
共振器長は $l = 300 m m$ であるから往復数は次より 1.18
回であることがわかる。
$ frac(1700 m m, 12 m m) times 5 m m & approx 708.3 m m\
frac(708.3 m m, 2 l) & approx 1.18 $
ミラーの反射率から考えるに反射可能な往復回数は 4.48
回であることがわかる。 $ 1 / e & = (4 / 5)^x\
x & approx 4.48 $ またフラッシュランプが光ってから発振するまでに
$2.1 mu s$ 掛かったことから 1050 回往復していることがわかる。
$ frac(c Delta t, 2 l) = frac(3.0 times 10^8 m times 2.1 mu s, 2 times 300 m m) = 1050 $
これらを総合してビームの拡散が一番大きく反射回数に影響する。 (課題
3.1.8) \
色素レーザー光 1 パルスのエネルギー $V_(upright(s u m))$
を三角形で近似すると
$ V_(upright(s u m)) & = 2.5 V times 4.0 mu s times 1 / 2 = 5.0 times 10^(- 6) V dot.op s $
より光子数 $n_p$ については次のようになる。
$ V_(upright(s u m)) & = n_p times frac(pi r^2, 2 pi l^2) times alpha e R\
 & = n_p times frac(\( 2.5 m m \)^2, 2 times \( 40 m m \)^2) times 0.78 times 1.602 times 10^(- 19) C times 50 upright("Ω")\
 & = 1.95 times 10^(- 19) times n_p\
n_p & = 2.56 times 10^13 $ よって色素レーザー光 1 パルス当たり
$2.6 times 10^13$ 個の光子数が発射される。 (課題 3.1.9) \
1 モード当たりの増幅率 $A$ は次のようになる。 $ A & = (n_p / m)^(1 / n)\
 & = (frac(2.56 times 10^13, 3.84 times 10^4))^(1 / 4.48)\
 & = 93.2 $ よって 1 パルスあたりの光の増幅率は 93 倍となる。 (課題
3.1.10) \

= 参考文献
<参考文献>
Neon https:\/\/www.oceaninsight.jp/Products/2series.html
