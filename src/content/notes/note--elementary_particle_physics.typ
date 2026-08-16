#import "/src/typst/template.typ": post

#show: post.with(
  title: "素粒子物理学",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/elementary_particle_physics.tex から変換",
)

= 始めに
<始めに>
自然単位系で行う。 エネルギー，長さ
$ planck c & approx 200 M e V dot.op f m\
c & approx 3 times 10^8 m \/ s $

= 素粒子の分類
<素粒子の分類>
素粒子とはそれ以上分割できない、内部構造を持たない粒子である。
それぞれの素粒子は対応する場のもとで生成・消滅をする。粒子は場の励起状態である。
実粒子の定常波

実粒子 (on mass shell) 仮想粒子 (off shell)

粒子加速器を用いて

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,left,left,left,),
    [クォーク], [アップ $u$], [チャーム $c$], [トップ $t$],
    [], [ダウン $d$], [ストレンジ $s$], [ボトム $b$],
    [レプトン], [電子 $e$], [ミュー粒子 $mu$], [タウ粒子 $tau$],
    [], [電子ニュートリノ $nu_e$], [ミュー粒子ニュートリノ
    $nu_mu$], [タウ粒子ニュートリノ $nu_tau$],
    [ゲージボソン], [光子 $gamma$], [グルーオン $g$], [$W$ ボソン $Z$
    ボソン],
    [], [ヒッグス粒子 $H$], [], [],
  )]
  , caption: [素粒子]
  , kind: table
  )

] <table:particles>
- 物質を構成する粒子: フェルミ粒子

- 力を構成する粒子: ボース粒子

- 粒子に質量を与える場にできる粒子 ヒッグス粒子

対称性から保存する量が作られる。

- 時間・空間並進対称性 $arrow.r$ エネルギー・運動量

- 方向対称性 $arrow.r$ 角運動量

- ゲージ不変性 $arrow.r$ 電荷保存則

レプトン数保存 バリオン数保存

== レプトン
<レプトン>
レプトン数 電子やニュートリノの粒子 $+ 1$, 反粒子 $- 1$

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,left,left,left,),
    table.header([], [電荷], [質量], [平均寿命],),
    table.hline(),
    [$nu_e$], [$0$], [$< 2$ eV], [?],
    [$nu_mu$], [$0$], [$< 0.19$ MeV], [?],
    [$nu_tau$], [$0$], [$< 18.2$ MeV], [?],
    [$e$], [$- 1$], [$0.511$ MeV], [安定],
    [$mu$], [$- 1$], [$106$ MeV], [$2.2$ ~s],
    [$tau$], [$- 1$], [$1777$ MeV], [$2.9 times 10^(- 13)$ s],
  )]
  , caption: [レプトン]
  , kind: table
  )

] <table:lepton>
== クォーク
<クォーク>
- スピン

- 電荷

- 慣性質量

- フレーバー (世代) 弱荷電アイソスピン

- カラー クォーク，グルーオン

アイソスピン $I_3$ ストレンジネス $S$ ゲルマン・西島の式 ハイパー電荷
$Y$ を定義して $ Y = B + S\
Q = I_3 + Y / 2 $ 反粒子はすべてマイナス クォーク $+ 1 \/ 3$ 反クォーク
$- 1 \/ 3$ バリオン $+ 1$

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,right,center,center,center,center,),
    table.header([], [質量], [$Q$], [$I_3$], [$S$], [$B$],),
    table.hline(),
    [$u$], [$2.3$ MeV], [$+ 2 \/ 3$], [$+ 1 \/ 2$], [$0$], [$+ 1 \/ 3$],
    [$d$], [$4.8$ MeV], [$- 1 \/ 3$], [$- 1 \/ 2$], [$0$], [$+ 1 \/ 3$],
    [$c$], [$1.28$ GeV], [$+ 2 \/ 3$], [$0$], [$0$], [$+ 1 \/ 3$],
    [$s$], [$95 plus.minus 5$
    MeV], [$- 1 \/ 3$], [$0$], [$- 1$], [$+ 1 \/ 3$],
    [$t$], [$173.5$ GeV], [$+ 2 \/ 3$], [$0$], [$0$], [$+ 1 \/ 3$],
    [$b$], [$4.2$ GeV], [$- 1 \/ 3$], [$0$], [$0$], [$+ 1 \/ 3$],
  )]
  , caption: [クォーク]
  , kind: table
  )

] <table:quark>
== ハドロン
<ハドロン>
- メソン: クォークと反クォークによるボソン

- バリオン: クォーク 3 つのフェルミオン

- ハイペロン: $S eq.not 0$ のバリオン

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([], [$macron(d)$], [$macron(u)$], [$macron(s)$], [$macron(c)$], [$macron(b)$],),
    table.hline(),
    [$d$], [$pi^0$ (135), $eta$, $eta'$], [$pi^(-)$], [$K^0$
    (498)], [$D^(-)$], [$B^0$],
    [$u$], [$pi^(+)$ (140)], [$pi^0$, $eta$, $eta'$], [$K^(+)$
    (494)], [$macron(D^0)$], [$B^(+)$],
    [$s$], [$macron(K^0)$], [$K^(-)$], [$eta \, eta'$], [$D_s^(-)$], [$B_s^0$],
    [$c$], [$D^(+)$], [$D^0$], [$D_s^(+)$], [$J \/ psi$
    (3097)], [$B_c^(+)$],
    [$b$], [$macron(B^0)$], [$B^(-)$], [$macron(B_s^0)$], [$B_c^(-)$], [$Upsilon$
    (9460)],
  )]
  , caption: [メソンとその質量 (スピン 0, 1)]
  , kind: table
  )

] <table:meson>
$\( u macron(u) - d macron(d) \) \/ sqrt(2)$
$eta^0 \, eta^(0') = c_1 \( u macron(u) + d macron(d) \) + c_2 \( s macron(s) \)$

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,left,),
    table.header([$S = 1 \/ 2$], [構成], [$I_3$], [$S$], [質量], [備考],),
    table.hline(),
    [$p$], [$u u d$], [$+ 1 \/ 2$], [$0$], [$938.3$ MeV], [安定],
    [$n$], [$u d d$], [$- 1 \/ 2$], [$0$], [$939.6$
    MeV], [$n arrow.r p + e^(-) + macron(nu_e)$],
  )]
  , caption: [バリオン]
  , kind: table
  )

] <table:baryon>
== ゲージボソン
<ゲージボソン>
#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([], [強さ], [媒介粒子], [スピン], [質量], [理論],),
    table.hline(),
    [強い相互作用], [$med 0.1$], [グルーオン], [1], [0], [QCD],
    [電磁相互作用], [$1 \/ 137$], [光子], [1], [0], [QED (GWS)],
    [弱い相互作用], [$10^(- 5)$], [$W plus.minus \, Z 0$], [1], [100
    GeV], [GWS],
    [重力相互作用], [$10^(- 38)$], [重力子], [2], [0], [一般相対論],
  )]
  , caption: [ゲージボソン]
  , kind: table
  )

] <table:guage>
== ファインマン・ダイアグラム
<ファインマンダイアグラム>
エネルギー損失 陽子全体 パウリの排他律 弱い相互作用 \$\$\\begin{aligned}
     & K^0(d\\bar{s}) \\to \\pi^+(u\\bar{d}) + \\pi^-(d\\bar{u})   &
     & \\quad K^+(u\\bar{s}) \\to \\mu^+ + \\nu\_\\mu               &
     & \\quad \\pi^+(u\\bar d) \\to \\mu^+ + \\nu\_\\mu
  \\\\
     & \\feynmandiagram \[layered layout, horizontal=a to b\] {
  c -- \[anti fermion\] f2 \[particle=\\(\\bar d\\)\],
  c -- \[fermion\] f3 \[particle=\\(u\\)\],
  b -- \[boson, edge label\'=\\(W^+\\)\] c,
  a \[particle=\\(\\bar s\\)\] -- \[anti fermion\] b -- \[anti fermion\] f1 \[particle=\\(\\bar u\\)\],
  }; &
     & \\feynmandiagram \[horizontal=a to b\] {
  i1 \[particle=\\(u\\)\] -- \[fermion\] a -- \[fermion\] i2 \[particle=\\(\\bar s\\)\],
  a -- \[photon, edge label=\\(W^+\\)\] b,
  f1 \[particle=\\(\\mu^{+}\\)\] -- \[fermion\] b -- \[fermion\] f2 \[particle=\\(\\nu\_\\mu\\)\],
  }; &
     & \\feynmandiagram \[horizontal=a to b\] {
  i1 \[particle=\\(u\\)\] -- \[fermion\] a -- \[fermion\] i2 \[particle=\\(\\bar d\\)\],
  a -- \[photon, edge label=\\(W^+\\)\] b,
  f1 \[particle=\\(\\mu^{+}\\)\] -- \[fermion\] b -- \[fermion\] f2 \[particle=\\(\\nu\_\\mu\\)\],
  };
\\end{aligned}\$\$ \$\$\\begin{aligned}
     & K^0(d\\bar{s}) \\to \\pi^+(u\\bar{d}) + \\pi^-(d\\bar{u})   &
     & \\quad n \\to p + e^- + \\bar{\\nu\_e}
  \\\\
     & \\feynmandiagram \[layered layout, horizontal=a to b\] {
  a \[particle=\\(\\mu^{-}\\)\] -- \[fermion\] b -- \[fermion\] f1 \[particle=\\(\\nu\_{\\mu}\\)\],
  b -- \[boson, edge label\'=\\(W^{-}\\)\] c,
  c -- \[anti fermion\] f2 \[particle=\\(\\overline{\\nu}\_{e}\\)\],
  c -- \[fermion\] f3 \[particle=\\(e^{-}\\)\],
  }; &
     & \\feynmandiagram \[layered layout, horizontal=a to b\] {
  a \[particle=\\(d\\)\] -- \[fermion\] b -- \[fermion\] f1 \[particle=\\(u\\)\],
  b -- \[boson, edge label\'=\\(W^{-}\\)\] c,
  c -- \[anti fermion\] f2 \[particle=\\(\\overline{\\nu}\_{e}\\)\],
  c -- \[fermion\] f3 \[particle=\\(e^{-}\\)\],
  };
\\end{aligned}\$\$ $ e^(-) e^(+) arrow.r mu^(-) mu^(+) $

#block[
;

]
#block[
]
\$\$\\feynmandiagram \[inline=(d.base), horizontal=d to b\] {
  a -- \[fermion\] b -- \[fermion\] c,
  b -- \[boson\] d \[particle=\\(\\gamma\\)\],
  };
  = i g\_{e} \\gamma^{\\mu}\$\$

弱い相互作用 FCNC バーテックス（頂点）

= 加速器と検出器
<加速器と検出器>
== 散乱断面積と加速器
<散乱断面積と加速器>
素粒子・原子核の研究でしたいこと

- 新しい粒子を調べる

- 粒子の構造を調べる

調べる方法

- 粒子の崩壊によって放出される粒子を観測する

- 高エネルギーの粒子を衝突させ、発生する粒子を観測

実験を決定付ける量

- 断面積 \
  ある事象の起こりやすさを面積で表したもの

- Luminosity $L$ \
  加速器がどのくらいの強度で粒子衝突ができるかの指標 \[個
  cm#super[−2];~sec#super[−1];\]

- エネルギー $E$ \
  衝突のエネルギーによって発生する頻度， 即ち 断面積 が変わる，
  両方を上げるのは技術的チャレンジ

$ m dot.double(bold(r)) & = q dot(bold(r)) times bold(B)\
bold(r) \( s \) & = bold(r)_0 \( s \) + x \( s \) bold(e)_x \( s \) + y \( s \) bold(e)_y \( s \) $
加速器が多段必要

- 静電型加速器 (\~100 keV)

- 線形加速器 (100\~200 MeV)

- シンクロトロン (GeV \~TeV)

シンクロトロン放射 (制動輻射) によるエネルギー損失はエネルギー/質量の 4
乗に比例する。
$ Delta E = frac(4 pi, 3) frac(alpha beta^3, R) (E / m)^4 planck c $
これより陽子衝突型の到達エネルギーは電子衝突型より一桁高い。
一方で陽子は内部構造がある為に電子衝突型の方が精密測定に向く。

- 陽子

- 電子

- 固定標的型

- 衝突型

== 粒子の検出
<粒子の検出>
電磁シャワー カスケード・シャワー

#block[
#figure(
  align(center)[#table(
    columns: 5,
    align: (center,center,center,center,left,),
    table.header([粒子], [電荷], [飛跡検出], [物質中では], [備考],),
    table.hline(),
    [光子], [$0$], [不可], [電磁シャワー], [対生成で
    $gamma arrow.r e^(-) e^(+)$ を放出],
    [電子], [荷電], [可能], [電磁シャワー], [電子が曲がることによる制動放射で
    $gamma$ 線を放射],
    [$mu$], [荷電], [可能], [透過力が強い], [],
    [$pi^plus.minus \, K^pi \, p$], [荷電], [可能], [ハドロンシャワー], [],
    [ニュートリノ], [$0$], [不可], [なし], [],
  )]
  , caption: [観測する粒子]
  , kind: table
  )

] <table:measure>
ガンマ線と物質の相互作用

- 光電吸収 \
  $gamma$ 線の全エネルギーが束縛電子を電離する。束縛エネルギー分引かれた

- コンプトン散乱 \
  $gamma$ 線と自由電子の散乱

- 電子対生成 \
  物質中電場の中で運動量保存するように $gamma arrow.r e^(+) e^(-)$

吸収係数 $mu$, 変換長 $X_p = mu^(- 1)$, 放射長 $X_0$
荷電粒子が物質中に入ると電磁相互作用で電離する。Bethe-Bloch
$ - 1 / rho frac(upright(d) E, upright(d) x) = D Z / A (z / beta)^2 (ln (frac(2 m c^2 gamma^2 beta^2, I)) - beta^2 - delta / 2) $
PDF (Parton Distribution Function)
$ sigma \( e e arrow.r mu mu \) = 4 / 3 frac(pi alpha^2, s) Q_e^2 Q_mu^2 $

- カロリーメータ吸収させてエネルギーを測る

- 磁場で曲げて運動量

- 通過時間 (Time of Flight)

- 粒子種の同定 ($M$)

気体の圧力 に反比例 ( :移動度) • の電場内で 程度 電子に較べて非常に遅い
• 電子のドリフト速度も上式に従う 高電場では 一定値 になる（例：数 ）

閉殻である希ガスの気体を円筒形容器に詰めて高電圧を印加する。 $1 \/ r$
に比例する電場 電子なだれ 電子イオン対生成 - 30 eV/pair
印加電圧によって動作モードが変わる。

- 比例計数領域: 比例

- ストリーマー領域: 線形でない増幅率が高く高頻度下でも使える

- ガイガーミュラー領域: 同じ大きさの信号、高頻度は苦手

拡散：ガス中では 熱エネルギー による運動により時間とともに広がる

= 素粒子の理論
<素粒子の理論>
== 散乱断面積
<散乱断面積>
素過程 $A + B arrow.r C + D$ において入射流束 $F_i$ と断面積
$upright(d) sigma$ の積は遷移確率 $T_(i f)$ と終状態数 $N_f$
の積と一致する。 $ F_i upright(d) sigma & = T_(i f) N_f $
衝突の重心系から見ると $p_i = \| bold(p)_A \| = \| bold(p)_B \|$,
$p_f = \| bold(p)_C \| = \| bold(p)_D \|$
$ W & = sqrt(s) = E_A + E_B = E_C + E_D = sqrt(p_C^2 + m_C^2) + sqrt(p_D^2 + m_D^2)\
bold(0) & = bold(p)_A + bold(p)_B = bold(p)_C + bold(p)_D $ Fermi
の黄金律より終状態密度 $rho_f = frac(upright(d) N, upright(d) E)$
不変振幅 $M_(i f) = ⟨f\| V \|i⟩$
$ W & = frac(2 pi, planck) \| ⟨f\| V \|i⟩ \|^2 frac(upright(d) N, upright(d) E) = frac(2 pi, planck) \| M_(i f) \|^2 rho_f $
$ T_(i f) & = \( 2 pi \)^4 delta^(\( 4 \)) \( p_A + p_B - p_C - p_D \) \| M_(i f) \|^2\
N_f & = frac(upright(d) bold(p)_C, \( 2 pi \)^3) frac(1, 2 E_C) dot.op frac(upright(d) bold(p)_D, \( 2 pi \)^3) frac(1, 2 E_D)\
F_i & = v_i n_A n_B = (p_i / E_A - frac(- p_i, E_B)) \( 2 E_A \) \( 2 E_B \) = 4 W p_i $
これより散乱断面積
$ frac(F_i upright(d) sigma, \| M_(i f) \|^2) & = frac(T_(i f) N_f, \| M_(i f) \|^2) = frac(1, \( 2 pi \)^2) frac(upright(d) bold(p)_C, 2 E_C) frac(upright(d) bold(p)_D, 2 E_D) delta^(\( 4 \)) \( p_A + p_B - p_C - p_D \)\
 & = frac(1, 16 pi^2) frac(upright(d) bold(p)_C, E_C E_D) delta \( W - E_C - E_D \)\
 & = frac(1, 16 pi^2) frac(p_C^2 upright(d) p_C upright(d) Omega, E_C E_D) delta \( W - E_C - E_D \)\
 & = frac(1, 16 pi^2) frac(p_C upright(d) W upright(d) Omega, W) delta \( W - E_C - E_D \)\
 & = frac(p_f upright(d) Omega, 16 pi^2 W) $
$ frac(upright(d) sigma, upright(d) Omega) & = frac(\| M_(i f) \|^2, 64 pi^2 s) p_f / p_i $

- 重心系エネルギーの 2 乗に反比例する

- 不変振幅の 2 乗

$ \| cal(M)_(f i) \|^2 & = lr(|\( i e macron(psi) gamma^mu psi \) (g_(mu nu) / q^2) \( i e macron(psi) gamma^nu psi \)|)^2\
 & = 2 \( 4 pi alpha \)^2 frac(t^2 + u^2, s^2) $
$ frac(upright(d) sigma, upright(d) Omega) & = frac(\| M_(f i) \|^2, 64 pi^2 s) p_f / p_i = frac(32 pi^2 alpha^2, 64 pi^2 s) frac(t^2 + u^2, s^2) = frac(alpha^2, 2 s) frac(t^2 + u^2, s^2) $
$ p_i = p_f = \| bold(k) \| = \| bold(p) \| $

== 寿命と崩壊幅
<寿命と崩壊幅>
$E = E_0 - i Gamma \/ 2$ とおくと
$ \| psi \( t \) \|^2 = \| psi_0 e^(- i E t) \|^2 = \| psi_0 e^(- i \( E_0 - i Gamma \/ 2 \) t) \|^2 = \| psi_0 \|^2 e^(- Gamma t) $
波動関数をフーリエ変換すると
$ chi \( E \) & = 1 / sqrt(2 pi) integral_0^oo upright(d) t psi \( t \) e^(i E t)\
 & = psi_0 / sqrt(2 pi) integral_0^oo upright(d) t e^(i \( E - E_0 + i Gamma \/ 2 \) t)\
 & = psi_0 / sqrt(2 pi) frac(1, i \( E - E_0 + i Gamma \/ 2 \)) $
Breit-Wigner の式
$ frac(\| chi \( E \) \|^2, \| chi \( E_0 \) \|^2) = frac(Gamma^2 \/ 4, \( E - E_0 \)^2 + Gamma^2 \/ 4) $
よりエネルギーに対して $E = E_0$ で最大で半値幅 $Gamma$ のグラフとなる。

この $Gamma$ を崩壊幅という。平均寿命 $tau$
との不確定性原理を適用することで
$ Delta E dot.op Delta t tilde.op Gamma dot.op tau = planck $

$ tau tilde.op 10^(- 8) \[ s e c \] \( "弱い相互作用" \)\
tau tilde.op 10^(- 23) \[ s e c \] \( "強い相互作用" \) $

== 
<section>
$ e^(+) e^(-) arrow.r Q macron(Q) arrow.r h a d r o n s $ 1/s 共鳴ピーク
定数倍

== 場の量子論
<場の量子論>
Klein-Gordon 方程式 $ p^mu & = (E / c \, bold(p))\
i planck partial^mu & = (i planck 1 / c frac(partial, partial t) \, - i planck nabla) $
$ () psi = 0 $ ボソンとなる。

スピン半整数のとき Dirac 方程式に従う場で、フェルミオンとなる
$ \( i gamma^mu partial_mu - m \) phi = 0 $ 負エネルギー解 Dirac の海

- ボソンには適用できない

- 無限個の電子の質量の問題

== QED
<qed>
微細構造定数
$ alpha & = frac(e^2, 4 pi epsilon_0 planck c) = frac(e^2, 4 pi) approx 1 / 137.02 $

$E$ 大 (短波長) 電子＋ニュートリノ

バーテックス(頂点)

#block[
;

]
$ q = p_1 - p_3 = p_4 - p_2 $ これより運動量保存則を満たす
$ p_1 + p_2 = p_3 + p_4 $
$ q^2 = \( p_1 - p_3 \)^2 = 2 \( m^2 - p_1 dot.op p_3 \) = 2 \( m^2 - E^2 + \| bold(p) \|^2 cos theta \) < 2 \( m^2 - E^2 + \| bold(p) \|^2 \) = 0 $

== 強い相互作用
<強い相互作用>
hadrons

Mandelstam 近似は 高エネルギー
