#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "高温超伝導",
  date: "2026-08-18",
  tags: ("レポート",),
  summary: "physics_report/superconductivity.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 実験目的
<実験目的>
量子力学が目に見える形で現れる超伝導を観察し、液体窒素で超伝導を起こせることを確認して説明できるようになること。

= 実験原理
<実験原理>
1908
年にオランダのカメリン・オネンスがヘリウムを液化することに成功し、彼はさまざまな物質を冷やしていた。
1911 年に水銀を冷やしたとき約 4.2 K 以下では電気抵抗が突如ゼロとなった。
これが超伝導の発見となる。 1957 年 Bardeen, Cooper, Schrieffer による
BCS 理論によって超伝導の仕組みが解明された。 しかし発見以来 75
年掛けても超伝導転移温度は 20 K 程度しか上昇しなかった。 1986 年
Bednortz, Muller によって \_1-\_\_4 なる銅酸化物や 1987 年 \_2\_3\_7
が発見され、爆発的に転移温度が上昇し、液体窒素温度を超えた。

このような高温超電導は共通してペロブスカイト構造 (\_3)
で銅酸化物の面が存在する。 例えば今回扱う \_2\_3\_7-
は酸素欠損が超伝導の担い手になり、さらに酸素欠損が少ないほど転移温度は高くなるとされている。

== 超伝導の性質
<超伝導の性質>
超伝導の性質で顕著な性質は次の 2 つである。

- 完全反磁性 (マイスナー効果)

- ゼロ抵抗性

まずマイスナー効果について超伝導体はある磁場以下ならば磁束が超伝導内に入らない、つまり
$ bold(B) = 0 $ となることが分かっている。
逆にある磁場以上になると部分的に超伝導が壊され磁束が入る現象
(これが起こる超伝導を第二種超伝導といい、そうでないものを第一種超伝導という)
がある。
これは入る磁束が量子化されて磁束量子となり、その周りには渦糸と呼ばれる超伝導電流が流れる構造を持ち、互いに相互作用してアブリコソフ格子という六角形の格子を形成する。
これにより結晶の構造欠陥に渦糸が形成されて安定化するというピン止め効果と呼ばれる現象も起こる。

== 熱電対
<熱電対>
熱電対はゼーベック効果によって流れる電流を用いて温度を測る機器である。
基本的には基準点と測りたい対象、気温の 3
つを端子とすることで導線の抵抗の影響を排除できる。
今回の基準点は液体窒素となる。

= 実験手法
<実験手法>
今回は \_2\_3\_7 という YBCO
系の高温の超伝導体を作製し、各性質を調べる。

== 試料の作成
<試料の作成>
高温超伝導の試料 \_2\_3\_7 を作製する方法として焼結法を用いる。
酸化イットリウム (\_2\_3), 炭酸バリウム (\_3), 酸化銅 () を用いて 930 °C
で次の反応を起こす。
$ 1 \/ 2 upright(Y)_2 upright(O)_3 + 2 upright(B a C O)_3 + 3 upright(C u O) arrow.r upright(Y B a)_2 upright(C u)_3 upright(O)_(7 - delta) + 2 upright(C O)_2 $
ここではモル比が $upright(Y) : upright(B a) : upright(C u) = 1 : 2 : 3$
となるように計 4.000 g となるように秤量する。
各物質の秤量を実際に計算すると表 #link(<table:mixture>)[table:mixture] のようになる。

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([物質], [分子量], [モル数], [重さ],),
    table.hline(),
    [\_2\_3], [225.81], [$2.68 times 10^(- 3)$ mol], [0.605 g],
    [\_3], [197.34], [$10.72 times 10^(- 3)$ mol], [2.116 g],
    [], [79.55], [$16.08 times 10^(- 3)$ mol], [1.279 g],
    [1/2\_2\_3 + 2\_3 + 3], [746.24], [$5.36 times 10^(- 3)$
    mol], [4.000 g],
  )]
  , caption: [混合比率]
  , kind: table
  )

] <table:mixture>
これらを乳鉢に入れて乳棒で撹拌しながら粉砕し、電気炉で 1
時間仮焼きをしてまた粉砕する。 その後プレス機で約 1 ton/cm#super[2]
の圧力でプレスしてペレット状の試料を 2 つ作る。 それらを再度 6
時間本焼きして徐冷で室温に戻す。
使い終わったら希塩酸を用いて乳鉢や乳棒を洗浄する。その廃液は流しに流さず、容器に入れて保管する。

== 磁気浮上効果の観察
<磁気浮上効果の観察>
ネオジム磁石 (表面磁束密度は約 0.3 T) の上に冷却した試料を乗せる。
これにはゼロ磁場冷却と磁場中冷却の 2
通りを試し、マイスナー効果およびピン止め効果が現れていることを確認する。
またアルミホイールで覆うなどの保温することで持続時間を伸ばす方法を考える。

== X 線回折による物質の同定
<x-線回折による物質の同定>
作成した試料を X
線の回折スペクトルを測定することでどのような物質が生成されているかを調べる。

X 線回折装置の全体としては電子銃から発射される電子を
に当て、その放射として出る K$alpha$ 線を用いて X
線を発射し、試料に当てて回折スペクトルを調べる。
回折の仕組みについて詳しく説明する。 この X
線は試料に当たるとそれを構成する原子の電子によって散乱される。 (Thomson
散乱)
$ A \( bold(K) \) & = integral rho \( bold(r) \) exp \( - i bold(K) dot.op bold(r) \) thin upright(d) bold(r)\
 & = sum_(n_1 = 0)^(N_1 - 1) sum_(n_2 = 0)^(N_2 - 1) sum_(n_3 = 0)^(N_3 - 1) exp \( - i bold(K) dot.op \( n_1 bold(a)_1 + n_2 bold(a)_2 + n_3 bold(a)_3 \) \) integral_(U C) rho \( bold(r) \) exp \( - i bold(K) dot.op bold(r) \) thin upright(d) bold(r)\
 & = G \( bold(K) \) F \( bold(K) \) $
$ G \( bold(K) \) & = sum_(n_1 = 0)^(N_1 - 1) sum_(n_2 = 0)^(N_2 - 1) sum_(n_3 = 0)^(N_3 - 1) exp \( - i bold(K) dot.op \( n_1 bold(a)_1 + n_2 bold(a)_2 + n_3 bold(a)_3 \) \)\
 & = exp (- i frac(N_1 - 1, 2) bold(K) dot.op bold(a)_1) frac(sin frac(N_1 bold(K) dot.op bold(a)_1, 2), sin frac(bold(K) dot.op bold(a)_1, 2)) exp (- i frac(N_2 - 1, 2) bold(K) dot.op bold(a)_2) frac(sin frac(N_2 bold(K) dot.op bold(a)_2, 2), sin frac(bold(K) dot.op bold(a)_2, 2))\
 & times exp (- i frac(N_3 - 1, 2) bold(K) dot.op bold(a)_3) frac(sin frac(N_3 bold(K) dot.op bold(a)_3, 2), sin frac(bold(K) dot.op bold(a)_3, 2))\
F \( bold(K) \) & = integral_(U C) rho \( bold(r) \) exp \( - i bold(K) dot.op bold(r) \) thin upright(d) bold(r) $
$G \( bold(K) \)$ の絶対値が大きくなる条件は次のようになる。
$ bold(K) dot.op bold(a)_1 = 2 pi m_1 \, quad bold(K) dot.op bold(a)_2 = 2 pi m_2 \, quad bold(K) dot.op bold(a)_3 = 2 pi m_3 $
これは逆格子ベクトルの定義と等しいから $bold(K) = bold(G)_m$ となる。
これを Laue の条件という。 また
$display(\| bold(K) \| = \| bold(G)_m \| = 2 \| bold(k) \| sin theta = frac(2 pi, d))$
とおくと Bragg 条件 $ 2 d sin theta = n lambda $ となる。

他にも 3 次元結晶 ($a perp b perp c$) で Miller 指数
$\[ h med k med l \]$ における面間隔 $d$ は次式を満たす。
$ 1 / d^2 & = (h / a)^2 + (k / b)^2 + (l / c)^2 $
これより次のような式が成り立つ。
$ sin theta & = 1 / 2 sqrt((lambda / a)^2 h^2 + (lambda / b)^2 k^2 + (lambda / c)^2 l^2) $
入射と回折 X 線のなす角 $2 theta$ が X 線回折装置によって出力される。
具体的な値として X 線の波長は $lambda = 1.541$ Å,
あり得る物質の結晶格子の格子定数は表 #link(<table:crystal-structure>)[table:crystal-structure] にとなる。

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([物質], [a 軸 (Å)], [b 軸 (Å)], [c 軸 (Å)],),
    table.hline(),
    [\_2\_3\_7], [3.818], [3.888], [11.80],
    [\_2\_5], [7.132], [12.181], [5.658],
    [], [4.684], [3.425], [5.129],
    [\_2\_3], [10.605], [10.605], [10.605],
  )]
  , caption: [アニールで得られうる物質の結晶構造]
  , kind: table
  )

] <table:crystal-structure>
== 電気抵抗の測定
<電気抵抗の測定>
四端子法を用いて電流と電圧を測り、電気抵抗を測定する。

まず試料を小さくカットする。 その試料の 4
ヶ所に銅線を銀ペーストを用いて付け、それぞれのリード線をホルダーにはんだ付けする。
端子の部分にテフロンテープを巻いて絶縁してからアルミホイールで包んで保温する。
電圧から定常的な電流に変換して端子へ繋ぎ、電圧を測定する。
これを熱電対で試料周辺の温度を測りながら液体窒素の中にゆっくり浸けて温度と抵抗の関係をプロットする。

#figure(web-image("/public/notes/physics_report/assets/YBCO_thermocouple.jpg", width: 10cm),
  caption: [
    熱電対の出力と温度の関係
  ]
)
<fig:thermo>

抵抗率 $rho$ については抵抗 $R$ に対して断面積 $S$ と距離 $ell$
を用いて次のように定義される。 $ rho = R S / ell = V / I S / ell $
ここでは電流 70.00 mA を流し、今回の試料については断面積
$2.4 m m times 4.1 m m$, 距離 0.8 mm となった。

== 交流帯磁率の測定
<交流帯磁率の測定>
2 つのコイルの相互インダクタンスの変化を測ることで試料の帯磁率を調べる。
$ V_(o s c) & = V_0 exp \( i omega t \)\
I & = C_0 V = C_0 V_0 exp \( i omega t \)\
V_(o u t) & = - M frac(upright(d) I, upright(d) t) = - i omega C_0 V_0 M exp \( i omega t \) $
最初にコイル 1 とコイル 2 の電圧 $V_1 \, V_2$
が等しくなるように調整しておく。 超伝導は磁束が入らない ($bold(B) = 0$)
から帯磁率は $chi = - 1$ となる。
コイル内に試料を入れることで相互インダクタンスが体積比で変化すると考える。
このときコイル内の体積に対して超伝導化した試料の体積の比 $v \/ V$
がわかる。 $ M & = mu_0 \( 1 + chi \) n_1 n_2 l_2 S_1\
V_(1') - V_2 & = - i omega C_0 V_01 {((1 - v / V) M_01 + v / V times 0) - M_01} exp \( i omega t \)\
 & = i omega C_0 V_01 M_01 v / V exp \( i omega t \)\
v / V & = frac(upright(I m) \( V_(1') - V_2 \), omega C_0 V_01 M_01) $
コイルは巻数はどちらも 1000 回であり, コイルは長さ 45 mm, 直径 20 mm
の円柱形であり, 交流周波数は 110 Hz とする。

= 実験結果
<実験結果>
== 磁気浮上効果の観察
<磁気浮上効果の観察-1>
今回作製した 2 つの試料を用いて磁気浮上効果を観察した。

まず図 @fig:mag1 のように磁石を配置したときに磁気浮上効果が確認できた。
磁気浮上効果により浮上した高さはどちらも 6 mm 程度で持続時間はそれぞれ 7
s, 13 s であった。
またアルミホイールを巻いて試料の温度を上がらないようにした状態のとき、高さは変わらず持続時間がそれぞれ
16 s, 25 s と倍程度長くなった。

次に図 @fig:mag2
のようなレール状に配置して冷却した試料を置いて力を加えたとき試料は滑走した。
曲がるときに試料は中心に対して向きが変わらないように曲がった。

さらに試料を回転させながら磁束中に入れると静止した。

磁場中冷却すると試料内の磁束の向きが固定化され、裏返すと反発した。

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/YBCO_image2.jpg", width: 8cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/YBCO_magnet.jpg", width: 4cm))
  ]],
  caption: [
    磁気浮上効果1
  ]
)
<fig:mag1>

#figure([#block[
  #box(web-image("/public/notes/physics_report/assets/YBCO_image3.jpg", width: 7cm))
  ]
  #block[
  #box(web-image("/public/notes/physics_report/assets/YBCO_mag_line.jpg", width: 6cm))
  ]],
  caption: [
    磁気浮上効果2
  ]
)
<fig:mag2>

== X 線回折による物質の同定
<x-線回折による物質の同定-1>
X 線回折装置を用いて回折による角度に対する強度は図 @fig:xray
のようになる。

#figure(web-image("/public/notes/physics_report/assets/YBCO_xray.jpg", width: 10cm),
  caption: [
    X 線回折
  ]
)
<fig:xray>

角度と対応した合成される可能性のある結晶の Miller 指数を表 #link(<table:miller>)[table:miller]
のようにまとめた。

#block[
#figure(
  align(center)[#table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([角度
      $2 theta$], [強度], [\_2\_3\_7], [\_2\_5], [], [\_2\_3],),
    table.hline(),
    [32.8°], [100 $lt.eq$], [$\[ 1 med 1 med 0 \]$
    (32.86°)], [$\[ 0 med 1 med 2 \]$ (32.47°)], [$\[ 1 med 1 med 0 \]$
    (32.36°)], [],
    [34.6°], [18], [], [$\[ 1 med 1 med 2 \]$
    (34.89°)], [], [$\[ 2 med 2 med 3 \]$ (34.86°)],
    [36.5°], [22], [$\[ 1 med 1 med 2 \]$
    (36.30°)], [$\[ 0 med 5 med 0 \]$ (36.87°)], [], [],
    [38.6°], [33], [$\[ 1 med 0 med 4 \]$
    (38.54°)], [$\[ 3 med 1 med 0 \]$ (38.56°)], [$\[ 2 med 0 med 0 \]$
    (38.42°)], [$\[ 1 med 2 med 4 \]$ (38.90°)],
    [40.4°], [35], [$\[ 1 med 1 med 3 \]$
    (40.25°)], [$\[ 0 med 5 med 1 \]$ (40.28°)], [], [],
    [42.0°], [21], [], [$\[ 2 med 4 med 1 \]$
    (42.14°)], [], [$\[ 2 med 2 med 4 \]$ (41.70°)],
    [46.7°], [48], [$\[ 0 med 2 med 0 \]$
    (46.70°)], [$\[ 2 med 3 med 2 \]$ (46.67°)], [$\[ 2 med 1 med 0 \]$
    (46.98°)], [$\[ 1 med 2 med 5 \]$ (46.90°)],
    [47.7°], [31], [$\[ 2 med 0 med 0 \]$ (47.61°)], [], [], [],
    [51.5°-51.8°], [20], [], [$\[ 4 med 1 med 0 \]$
    (51.79°)], [], [$\[ 2 med 2 med 4 \]$ (51.69°)],
    [52.3°], [24], [$\[ 1 med 0 med 6 \]$
    (52.30°)], [$\[ 1 med 2 med 3 \]$
    (52.35°)], [], [$\[ 0 med 1 med 6 \]$ (52.46°)],
    [52.8°], [24], [$\[ 1 med 2 med 0 \]$
    (52.82°)], [], [$\[ 2 med 0 med 2 \]$ (52.92°)], [],
    [58.3°], [62], [$\[ 1 med 2 med 3 \]$
    (58.16°)], [], [], [$\[ 2 med 4 med 5 \] \, \[ 0 med 3 med 6 \]$
    (58.34°)],
    [58.9°], [39], [$\[ 2 med 1 med 3 \]$
    (58.74°)], [$\[ 4 med 3 med 1 \]$ (58.84°)], [$\[ 3 med 0 med 0 \]$
    (59.14°)], [$\[ 1 med 3 med 6 \]$ (59.05°)],
  )]
  , caption: [Miller 指数]
  , kind: table
  )

] <table:miller>
== 電気抵抗の測定
<電気抵抗の測定-1>
熱電対の出力と電圧の関係は図 @fig:resistance のようになった。

#figure(web-image("/public/notes/physics_report/assets/YBCO_resistance.jpg", width: 10cm),
  caption: [
    電気抵抗
  ]
)
<fig:resistance>

== 交流帯磁率の測定
<交流帯磁率の測定-1>
熱電対の出力と電圧の関係は図 @fig:magnetic のようになった。

#figure(web-image("/public/notes/physics_report/assets/YBCO_magnetic.jpg", width: 10cm),
  caption: [
    交流帯磁率
  ]
)
<fig:magnetic>

= 考察
<考察>
== 磁気浮上
<磁気浮上>
図 @fig:mag1, 図 @fig:mag2 のような Maxwell
の応力が働くことにより試料は浮上している。ピン止め効果については実験結果でまとめたように磁束の向きや場所が固定されることで反発や回転などを引き起こした。

== X 線回折
<x-線回折>
X 線回折を見ると主成分は \_2\_3\_7 であることがわかる。また不純物として
\_2\_5 が含まれていることもあり得るが表面に緑色の物質は見えなかった。

帯磁率について超伝導となった体積 $v$ を計算する。
ただしコイルは巻数はどちらも 1000 回であり, コイルは長さ 45 mm, 直径 20
mm の円柱形であり, 交流周波数は 110 Hz とする。
$ V & = 45 m m times \( 10 m m \)^2 pi = 1.414 times 10^(- 5) m^3\
M & = \( 1.26 times 10^(- 6) N \/ A^2 \) times 1000^2 times V = 1.78 times 10^(- 5) H\
v & = frac(- 15.3 mu V, 2 pi times 110 times \( - 1 m A \/ V \) times 1 V times \( M \/ V \)) = 17.6 m m^3 $
すると 67 % は超伝導化していることがわかる。 これより超伝導体 \_2\_3\_7
は 67% 程度であるとわかる。

== 電気抵抗、交流帯磁率の測定
<電気抵抗交流帯磁率の測定>
電気抵抗については 79-83 K で超電導となり、抵抗率が転移前
$3.0 times 10^(- 5)$ Ω~m から転移後 0 Ω~m
となった。試料の転移温度と異なるが急激に冷やしてしまった為、温度に関しては熱電対と試料の温度がかけ離れて測定誤差が生まれてしまっていると考えられる。また転移する温度の幅が帯磁率に比べて短いのは端から端まで超伝導の道が出来てしまえば完全に超伝導とならなくても電流が通るからである。

帯磁率に関しては 83-93 K で超伝導となり、帯磁率が転移前 0 から転移後
$- 0.012$ となった。
幅が広いのは完全に超伝導になるまで完全反磁性を示さないことと \_2\_3\_7
が酸素欠損の量に依って転移温度が変わる為、均一でなくランダムに酸素欠損していると標準分布に従い、グラフは曲線のようになる。

グラフとしては図 @fig:graph のようになった。

#figure(web-image("/public/notes/physics_report/assets/YBCO_graph.jpg", width: 10cm),
  caption: [
    温度と抵抗率、帯磁率の関係
  ]
)
<fig:graph>

= 参考文献
<参考文献>
研究プロジェクト - 東京工業大学 物理学系
