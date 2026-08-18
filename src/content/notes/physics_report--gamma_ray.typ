#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "線と宇宙線の計測",
  date: "2026-08-18",
  tags: ("レポート",),
  summary: "physics_report/gamma_ray.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 実験目的
<実験目的>
素粒子・原子核と宇宙線の研究において高エネルギー粒子の位置、時刻、エネルギー、電荷などを正確に測定する実験技術の習得を目的とする。

今回は $gamma$ 線や宇宙線を検出する為に GAGG
と呼ばれる無機シンチレータと MPPC を用いる。 前回 (物理学実験 B)
扱った無機シンチレータや光電子増倍管に対して、これらがどのような特性を持つのかを理解する。
更に MPPC
からの信号を伝搬する為の同軸ケーブルや信号を処理する回路についての理解も深める。

= 実験原理
<実験原理>
== $gamma$ 線と宇宙線
<gamma-線と宇宙線>
今回観測する $gamma$ 線と宇宙線について説明する。

まず $gamma$ 線とは数 MeV 以上のエネルギーを持つ電磁波である。
高エネルギーの電磁波は粒子的性質が強く現象に現れる為、フォトン (photon)
とも呼ばれる。 フォトンはスピン 1
のボゾンで質量はゼロであり、次のような物質と相互反応する性質を持つ。

- 光電吸収

- コンプトン散乱 \
  原子核に当たることでフォトンが散乱される

- 電子対生成 \
  それぞれ 511 keV の電子と陽電子が互いに反対方向に生成する

光電吸収は軌道上に拡がった電子にフォトンが衝突して、フォトンのエネルギーが全吸収される現象である。断面積は次のようにして
$Z^5$ に比例することがわかる。
$ sigma prop lr(|integral upright(d)^3 x psi_(1 s) \( r \)|)^2 & tilde.op lr(|integral upright(d)^3 x frac(exp \( - r \/ delta \), delta^(3 \/ 2))|)^2 tilde.op Z^5 & \( delta = a_0 \/ Z \) $

次に宇宙線とは宇宙空間から飛来する高エネルギー放射線である。現代でも起源はよく分かっていない。
まず地球大気に入射する宇宙線を一次宇宙線といい、これは高エネルギーの陽子が主成分である。
そして一次宇宙線が大気の原子核と衝突すると原子核を破壊するとともに主成分を
$pi$ 粒子とする中間子がシャワーのように生成される。
これらの核子や中間子やそこから生成される $mu$
粒子や電子、光子など、地球上で発生した粒子を二次宇宙線という。 具体的に
$pi$ 中間子や $mu$ 粒子は次のように崩壊する。
(簡単の為、ニュートリノをマヨラナ粒子と仮定している。)
$ pi^0 & arrow.r gamma + gamma\
pi^plus.minus & arrow.r nu_mu + mu^plus.minus\
mu^plus.minus & arrow.r e^plus.minus + nu_e + nu_mu $
これらの二次宇宙線は 1 cm#super[2] 当たり毎分 1 個程度降ってくる。

== シンチレータ
<シンチレータ>
シンチレータとは高エネルギーの放射線を吸収して蛍光 (シンチレーション)
する材料である。 シンチレータは大きく分けて $gamma$
線検出に適した無機シンチレータと荷電粒子検出に適したプラスチックシンチレータに分けられる。

- 無機結晶シンチレータ \
  ハロゲン化アルカリ金属結晶に微量の活性化物質を加えたものである。性質としてよく知られている物質は潮解性がある扱いにくいということが挙げられる。

  - タリウム添加ヨウ化ナトリウム ()

  - タリウム添加ヨウ化セシウム ()

  - セリウム添加 GAGG 結晶 \_3\_2\_3\_12()

- プラスチック・シンチレータ \
  プラスチック (ポリビニルトルエンやポリスチレンなど)
  中にベンゼン環を多く含む有機溶媒を溶かした固融体である。性質としてレスポンスが高速、安価で加工しやすく大型化できる。ただ密度が低い為、$gamma$
  線と反応しにくい。

  - p-テルフェニル

  - POPOP

今回は比較的最近開発された潮解性の無いセリウム添加 GAGG
結晶の無機結晶シンチレータを用いる。

== MPPC
<mppc>
物理学実験 B では光電子増倍管 PMT (Photo Multiplier Tube)
を用いていた。これはカミオカンデで使われるように大型化しやすいが、ガラス管や微細な電極構造を有するため磁場や衝撃に弱く小型化、軽量化が困難であった。

今回は小型な半導体の光センサーであるマルチピクセル光子カウンタ MPPC
(Multi-Pixel Photon Counter) を用いる。 MPPC は半導体の pn
接合で作られる空乏層において、高エネルギー粒子がそこに入ると反応を起こして電子とホールが生成される。
それらを電場を掛けて分離し、回収した量を計測することで放射線を検出する。

光電子増倍管と比較すると次の表のようになる。

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,center,center,),
    table.header([性質], [光電子増倍管], [MPPC],),
    table.hline(),
    [量子効率], [約 $20 %$], [約 $30 % tilde.op 70 %$],
    [増倍率], [$10^6 tilde.op 10^8$], [$10^5 tilde.op 10^6$],
    [H.V.], [$tilde.op 1000 V$], [$30 tilde.op 60 V$],
    [小型化], [難しい], [可能 ($3 m m times 3 m m$)],
    [大型化], [可能 (ex. カミオカンデ)], [高価],
    [特性], [磁場、衝撃に弱い], [],
  )]
  , caption: [光電子増倍管と MPPC の比較]
  , kind: table
  )

] <table:PMT-MPPC>
より詳細の仕組みについて説明する。 pn
接合に電圧を掛けると空乏層が広がり、感受領域が増える。
電圧を増やすと電子が更に新たな電子・ホール対を生成し、増幅される。
$ e^(-) & arrow.r e^(-) + \( e^(-) \, h^(+) \) $
更に電圧を掛けるとホールについても新たな電子・ホール対を生成し、これによりループが作られるので大きな増幅を作ることが出来る。
これをガイガーモードという。
$ e^(-) & arrow.r e^(-) + \( e^(-) \, h^(+) \)\
h^(+) & arrow.r h^(+) + \( e^(-) \, h^(+) \) $ また MPPC
の観測結果は必ずしも放射線のエネルギー、量と対応している訳ではなく 1
粒子で複数回検出されるクロストークや半導体の構造欠陥部分に電子がトラップされ、少し時間が経った後に放出されるアフターパルスによって信号が乱されることがある。

== 同軸ケーブル
<同軸ケーブル>
信号の波形を歪めることなく回路間を伝搬する為に使われるのが伝送線であり、最もポピュラーなものが同軸線あるいは同軸ケーブル
(coaxial cable) と呼ばれるケーブルである。

まず同軸ケーブルは図 @fig:coaxial-cable
のような仕組みとなっている。それぞれの部品は表 #link(<table:coaxial-cable>)[table:coaxial-cable]
にまとめた。

#figure(web-image("/public/notes/physics_report/assets/coaxial_cable.jpg", width: 14cm),
  caption: [
    終端抵抗
  ]
)
<fig:coaxial-cable>

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (center,left,),
    table.header([構成部品], [説明],),
    table.hline(),
    [Conductor], [芯線と呼ばれる信号を流す導体],
    [Dielectric], [ポリエチレンやテフロンなどの絶縁体],
    [Screen], [同心円筒上に取り囲む外部導体],
    [Sheath], [プラスチックのシールド],
  )]
  , caption: [同軸ケーブルの構成]
  , kind: table
  )

] <table:coaxial-cable>
同軸ケーブルの回路的側面の性質として芯線の半径を $a$、シールドの半径を
$b$ とし、同軸ケーブルの静電容量 $C$ とインダクタンス
$L$、並びに特性インピーダンス $Z_0$ と位相速度 $v$ は次のようになる。
$ C & = frac(2 pi epsilon, ln \( b \/ a \)) tilde.op frac(55.6 epsilon_r, ln \( b \/ a \)) tilde.eq 100 p F \/ m\
L & = frac(mu, 2 pi) ln b / a tilde.op 0.2 mu_r ln b / a tilde.eq 0.2 mu H \/ m\
Z_0 & = sqrt(L / C) tilde.op 60 sqrt(mu_r / epsilon_r) ln b / a tilde.eq 50 upright("Ω")\
v & = omega / k = 1 / sqrt(L C) = 1 / sqrt(mu epsilon) = c $
市販されている最も標準的なケーブル $b \/ a tilde.eq 3.6$,
$epsilon_r tilde.eq 2.3$, $mu_r = 1$ として計算した。

信号を正しく伝送するときに重要なこととしてインピーダンス整合が挙げられる。
インピーダンス整合とは同軸ケーブルの特性インピーダンスと終端抵抗を合わせることである。
インピーダンス整合をしていないと反射が起きる。その比率として電圧反射率
$r$ は次のように与えられる。
$ r = V_r / V_0 = frac(Z_L - Z_0, Z_L + Z_0) $

= 実験手法
<実験手法>
今回行う実験における実験手法を説明する。
まず今回の実験で使う実験装置について観測部分と情報処理部分に分けて紹介する。

観測部分では $gamma$
線や宇宙線がシンチレータに入ることでシンチレーション光が発せられ、MPPC
でそれを観測する。 シンチレータは基本的に無機シンチレータである GAGG
結晶を用い、比較としてプラスチックシンチレータである
p-テルフェニルも用いる。 MPPC については $3 m m times 3 m m$ の SN:68219
と $6 m m times 6 m m$ の No.89-91 を用いる。

情報処理部分では観測部分で得られた信号を整形してオシロスコープや PC
で表示する。
アンプで増幅や整形し、ディスクリミネータやコインシデンスで不要な情報をフィルタする。
実験装置の機器は表 #link(<table:machine>)[table:machine] のものを用いた。

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,left,left,),
    table.header([実験装置], [機器名], [説明],),
    table.hline(),
    [MPPC], [No.89-91, SN:68219], [光検出器の一種。],
    [無機シンチレータ], [GAGG], [シンチレータの一種。],
    [プラスチックシンチレータ], [p-テルフェニル], [シンチレータの一種。],
    [HV 電源], [Agilent E3612A], [電圧を掛ける装置。],
    [アンプ], [Phillips 777], [入力信号を増幅させて出力する。],
    [SiPM プリアンプ], [Model 5035], [入力信号を増幅させて出力する。],
    [波形整形アンプ], [ORTEC
    571], [あるゲイン以上のパルス波を整形された正弦波に変換する。],
    [ディスクリミネータ], [\-], [あるゲイン以下のパルスをカットする。],
    [コインシデンス], [\-], [複数の入力がすべて上がっているときに出力される回路。],
    [AD コンバータ], [CP 1114A], [アナログからデジタルへ変換する。],
    [スケーラー], [], [],
  )]
  , caption: [実験装置の機器名]
  , kind: table
  )

] <table:machine>
== 同軸ケーブル
<同軸ケーブル-1>
まず次のような手順で同軸ケーブル内の信号伝搬速度を調べる。

+ パルス発生装置からオシロスコープの 1ch に繋げる。

+ 同軸ケーブルの長さを測り, オシロスコープの 1ch から 2ch に繋げる。

+ オシロスコープで 1ch と 2ch の位相差を調べる。

次に以下の手順で信号の反射を調べる。

+ パルス発生装置からオシロスコープの 1ch に繋げる。

+ 3m の同軸ケーブルの端を抵抗でショートする。

実験 1-(3) については何らかの故障により実験が行えなかった。

== MPPC のダークレート測定
<mppc-のダークレート測定>
+ $3 m m times 3 m m$ の MPPC (SN:68219) を遮光し、HV に接続する。

+ HV 電源を 72.7 V として HV
  電源からアンプ、ディスクリミネータに繋いでオシロスコープで波形を観測する。

+ ディスクリミネータのスレッショルドを 2-3 mV ずつ変えながらスケーラーで
  30 秒間の計数を測定する。

== $gamma$ 線の計測
<gamma-線の計測>
ここではを用いて線源から出る $gamma$ 線を検出する。

次のような手順で実験する。

+ シンチレータに MPPC
  を貼り付け、気泡が入らないようにテフロンテープで巻く。

+ シンチレータと MPPC をブラックシートで覆って遮光する。

+ MPPC を HV 供給アダプタに繋げる。

+ 電源を 40.2 V に設定して電源から HV 供給アダプタ, SiPM アンプ,
  波形整形アンプ, AD コンバータ, PC の順に繋げる。

+ PC で 5 分間、チャンネルに対応するパルス数を観測する。

そうして得られたグラフによって光電ピークが見られるのでそれを用いてチャンネルとエネルギーの単位換算ができる。

== 宇宙線の計測
<宇宙線の計測>
+ プラスチックシンチレータに MPPC を貼り付けたものを 2
  つ用意し上下に重ね、HV 供給アダプタの Ch1, Ch2 に繋げる。

+ アンプ、ディスクリミネータ、コインシデンス、スケーラを繋げてパルス数を観測する。

= 実験結果
<実験結果>
== 同軸ケーブル
<同軸ケーブル-2>
長さ $99.9 c m$ の同軸ケーブルに対し、$5.8 n s$ で信号が到達した。

#figure(web-image("/public/notes/physics_report/assets/cable_diff_time.jpg", width: 10cm),
  caption: [
    ケーブル
  ]
)
<fig:cable-diff-time>

終端抵抗を変えたときのパルス波の強度は表 #link(<table:resistance>)[table:resistance]
のようになり、パルス波の様子は図 @fig:reflection のようになった。

#block[
#figure(
  align(center)[#table(
    columns: 2,
    align: (center,center,),
    table.header([終端抵抗値], [パルス波の強度],),
    table.hline(),
    [1 Ω], [20 mV],
    [50 Ω], [100 mV],
    [100 Ω], [130 mV],
    [$oo$ Ω], [200 mV],
  )]
  , caption: [終端抵抗に対するパルス波の強さ]
  , kind: table
  )

] <table:resistance>
#figure(web-image("/public/notes/physics_report/assets/reflection.jpg", width: 10cm),
  caption: [
    終端抵抗
  ]
)
<fig:reflection>

== MPPC のダークレート測定
<mppc-のダークレート測定-1>
ディスクリミネータの閾値を少しずつ変えて計数を比較する実験については図
@fig:darkrate-discriminator のようになった。

#figure(web-image("/public/notes/physics_report/assets/discriminator.png", width: 12cm),
  caption: [
    ダークレートにおいて閾値に対する計数
  ]
)
<fig:darkrate-discriminator>

またオシロスコープでは図 @fig:trigger-1 のような波形が見られた。

#figure(web-image("/public/notes/physics_report/assets/trigger1.jpg", width: 12cm),
  caption: [
    ダークレート測定におけるオシロスコープの観察
  ]
)
<fig:trigger-1>

== $gamma$ 線の計測
<gamma-線の計測-1>
線源 ^60, ^22, ^137, ^133 のガンマ線の計測結果をそれぞれ図
@fig:Co60-gamma, @fig:Na22-gamma, @fig:Cs137-gamma, @fig:Ba133-gamma
に示す。

#figure(web-image("/public/notes/physics_report/assets/Co60_gamma.jpg", width: 14cm),
  caption: [
    線源 ^60 のガンマ線の計測結果
  ]
)
<fig:Co60-gamma>

#figure(web-image("/public/notes/physics_report/assets/Na22_gamma.png", width: 12cm),
  caption: [
    線源 ^22 のガンマ線の計測結果
  ]
)
<fig:Na22-gamma>

#figure(web-image("/public/notes/physics_report/assets/Cs137_gamma.png", width: 12cm),
  caption: [
    線源 ^137 のガンマ線の計測結果
  ]
)
<fig:Cs137-gamma>

#figure(web-image("/public/notes/physics_report/assets/Ba133_gamma.png", width: 12cm),
  caption: [
    線源 ^133 のガンマ線の計測結果
  ]
)
<fig:Ba133-gamma>

#figure(web-image("/public/notes/physics_report/assets/plastic.png", width: 12cm),
  caption: [
    線源 ^133 のガンマ線のプラスチックシンチレータによる計測結果
  ]
)
<fig:Ba133-plastic>

またオシロスコープでは図 @fig:trigger-2 のような波形が見られた。

#figure(web-image("/public/notes/physics_report/assets/trigger2.jpg", width: 12cm),
  caption: [
    $gamma$ 線の計測におけるオシロスコープの観察
  ]
)
<fig:trigger-2>

== 宇宙線の計測
<宇宙線の計測-1>
$40 m m times 40 m m$ のシンチレータに対して平均毎分 14.7
個の宇宙線が観測された。 また 2
つのシンチレータを十分離すと宇宙線が観測されなくなった。

#figure(web-image("/public/notes/physics_report/assets/trigger3.jpg", width: 12cm),
  caption: [
    宇宙線の計測におけるオシロスコープの観察
  ]
)
<fig:trigger-3>

仰角に対する宇宙線は図 @fig:cosmic-ray-angle のように観測された。

#figure(web-image("/public/notes/physics_report/assets/cosmic_ray_elevation_angle.png", width: 14cm),
  caption: [
    宇宙線の天頂角分布
  ]
)
<fig:cosmic-ray-angle>

= 考察
<考察>
== 同軸ケーブル
<同軸ケーブル-3>
同軸ケーブルの長さは $99.9 c m$ に対し、$5.8 n s$
で信号到達したことから信号伝達速度は次のようになる。
$ frac(99.9 c m, 5.8 n s) approx 1.72 times 10^5 k m \/ s $
これは光速の約 $57 %$
である。同軸ケーブルの信号伝搬速度は光速であるからオーダーとしては一致している。

特性インピーダンスが $Z_0 = 50 upright("Ω")$ の同軸ケーブルの終端抵抗
$Z_L$ を変更すると次のように電圧反射率 $r$ が変動する。
$ r & = V_r / V_0 = frac(Z_L - Z_0, Z_L + Z_0) = cases(delim: "{", - 0.96 & \( 1 upright("Ω") \), 0 & \( 50 upright("Ω") \), 0.33 & \( 100 upright("Ω") \), 1 & \( oo upright("Ω") \), ) $
これより $100 m V$ に対してそれぞれ 4 mV, 100 mV, 133 mV, 200 mV
となる。 これは 1 Ω の終端抵抗以外は実験結果と一致している。
この違いの具体的な原因は消去法としてオシロスコープのインピーダンスによるものと思われる。
オシロスコープのインピーダンスにより位相などのパラメータが変化し 4 Ω
程度の余分なインピーダンスが入ってしまったと考えられる。

== MPPC のダークレート測定
<mppc-のダークレート測定-2>
図 @fig:darkrate-discriminator
の対数グラフを見ると大方直線となっているのに対して 25 mV
毎に上下していることが分かる。
これにはクロストークが原因であると考えられる。 すべてが 1
回の入射に対して 25 mV
程度出るのであればクロストークによりその倍数だけ観測される。
これによりグラフが階段状になると考えられる。
その性質が顕著には現れなかったのはノイズが多く正確に測れなかったからだと考えられる。

== $gamma$ 線の計測
<gamma-線の計測-2>
観測した光電ピークとチャンネルとエネルギーの対応が分かっているので図
@fig:energy-ch のように線形近似して関係式を導ける。

#figure(web-image("/public/notes/physics_report/assets/gamma_energy_ch.png", width: 14cm),
  caption: [
    エネルギーとチャンネルの対応
  ]
)
<fig:energy-ch>

これより表 #link(<table:peak>)[table:peak] のようなピークが観測された。

#block[
#figure(
  align(center)[#table(
    columns: 3,
    align: (center,left,left,),
    table.header([線源], [観測されたピーク (keV)], [理論的な光電ピーク
      (keV)],),
    table.hline(),
    [Co], [215.6, 921.4, 1172, 1338], [1170, 1360],
    [Cs], [157.9, 419.3, 637.5], [662],
    [Na], [162.7, 303.9, 528.4, 1034, 1306, 1385], [1274],
    [Ba], [119.4, 279.8, 334.3], [80, 303, 356],
  )]
  , caption: [ガンマ線のピーク位置]
  , kind: table
  )

] <table:peak>
光電効果による光電ピークに対してコンプトン散乱とその後方散乱のピークのエネルギー和が等しくなっていることがわかる。また
^22 では 511 keV の $beta^(+)$ 崩壊による陽電子と電子の電子対消滅による
$gamma$ 線が出ていることが分かる。
プラスチックシンチレータについては正しくエネルギーを変換できておらず
$gamma$ 線には向いていないという資料の内容と一致していることが分かる。

== 宇宙線の計測
<宇宙線の計測-2>
今回観測した量は $1 upright("cm") ""^2$ 当たりに換算すると
$0.91 c o u n t \/ c m^2 dot.op s$ と $1$ に近く資料と一致している。
また宇宙線は天頂に近いほど多く観測されたことに関しては $mu$
粒子は大気によって指数的に減衰するということを示唆していると考えられる。

= レポート問題
<レポート問題>
== 基礎問題
<基礎問題>
#block[
$planck c = 197 M e V dot.op f m$ であることを確かめよ。1 GeV
のフォトンの波長を調べよ。

]
#proof[
$ planck c & approx \( 6.582 times 10^(- 16) e V dot.op s \) times \( 2.998 times 10^8 m \/ s \)\
 & approx 1.973 times 10^(- 7) e V dot.op m\
 & approx 197.3 med M e V dot.op f m $ $ E & = frac(h c, lambda)\
lambda & = frac(2 pi planck c, E) = frac(6.28 times 197 M e V dot.op f m, 1 G e V) = 1.24 f m $
よって波長は $1.24 f m$ となる。
]

#block[
特殊相対論の次の式を用いて $beta \, gamma \, gamma beta$ を計算せよ。
$ E^2 - \( p c \)^2 & = \( m c^2 \)^2 \, #h(2em) p = frac(E v, c^2) $

]
#proof[
$ beta & := v / c = frac(p c, E)\
gamma & := 1 / sqrt(1 - beta^2) = 1 / sqrt(1 - (frac(p c, E))^2) = frac(E, m c^2)\
gamma beta & = frac(p, m c) $
]

#block[
2.2~s で崩壊する $mu$ 粒子がなぜ地表 20 km に到達するのか？
ただし静止質量 105.6 MeV/c#super[2];, 運動量 3 GeV/c とする。

]
#proof[
$ E & = sqrt(\( m c^2 \)^2 + \( p c \)^2) = sqrt(\( 105.6 M e V \)^2 + \( 3 G e V \)^2) = 3.001858 G e V\
gamma & = frac(E, m c^2) = 28.43 $ よって $2.2 mu s$ で
$660 m times gamma = 18.8 k m$ まで進めることが分かる.
]

#block[
2
個の電子を無限遠方から徐々に近づけると静電ポテンシャルが徐々に増加していき,
静電ポテンシャルが電子の質量エネルギー $m_e c^2$
に等しくなるとき古典電子半径に一致することを示せ。$4 pi r_e^2$ が 1barn
に一致することを示せ。

]
#proof[
2
個の電子を無限遠方から徐々に近づけると静電ポテンシャルが徐々に増加していき,
静電ポテンシャルが電子の質量エネルギー $m_e c^2$ に等しくなるとき
$  & frac(e^2, 4 pi epsilon_0 r) = m_e c^2\
 & r = frac(e^2, 4 pi epsilon_0 m_e c^2) $ より電子間の距離 $r$
は古典電子半径 $r_e$ に一致する. そして次のように計算できる。
$ r_e & = frac(e^2, 4 pi epsilon_0 m_e c^2) approx frac(\( 1.602 times 10^(- 19) C \)^2, 12.56 times \( 8.85 times 10^(- 12) F \/ m \) times \( 8.19 times 10^(- 14) J \)) = 2.818 times 10^(- 15) m\
4 pi r_e^2 & approx 0.998 times 10^(- 28) m^2 = 10^(- 24) c m^2 = 1 b a r n $
]

== MPPC の原理
<mppc-の原理>
ダイオードとは $n$ 型の半導体と $p$
型の半導体を接合した構造の素子である。
$ - frac(upright(d)^2, upright(d) x^2) phi.alt \( x \) = frac(rho \( x \), epsilon) $
$n$ 型半導体と $p$ 型半導体の空乏層の位置 $x_n \, x_p$
を次のように定義する。 これより空乏層の厚さ $D$ は $D = x_p - x_n$
と書ける。

#figure([],
  caption: [
    半導体中の電気密度
  ]
)
<fig:kubosou-rho>

これよりポアソン方程式を解くことで電位は次のようになる。
$ phi.alt \( x \) = cases(delim: "{", V_0 & \( x < x_n \), - frac(rho_n, 2 epsilon) x^2 + A_n x + B_n & \( x_n < x < 0 \), frac(rho_p, 2 epsilon) x^2 + A_p x + B_p & \( 0 < x < x_p \), 0 & \( x_p < x \)) $
電位の連続性から次のようになる。
$ A_n & = A_p = frac(rho_n x_n, epsilon) = - frac(rho_p x_p, epsilon) = - frac(rho_n rho_p, epsilon \( rho_n + rho_p \)) D \, #h(2em) B_n = B_p\
phi.alt \( x_n \) - phi.alt \( x_p \) & = (- 1 / 2 A_n x_n + B_n) - (- 1 / 2 A_p x_p + B_p) = frac(rho_n rho_p, 2 epsilon \( rho_n + rho_p \)) D^2 = V_0 $
これより空乏層の厚さが求まる。
$ D & = sqrt(frac(2 epsilon \( rho_n + rho_p \), rho_n rho_p) V_0) $
空乏層内の電場は $E \( x \) = - nabla phi.alt$ と表せるから計算すると図
@fig:kubosou-E のようなグラフとなる。

#figure([],
  caption: [
    空乏層内の電場
  ]
)
<fig:kubosou-E>

$ E \( 0 \) & = frac(rho_n x_n, epsilon) = - frac(rho_n rho_p, epsilon \( rho_n + rho_p \)) D = - sqrt(frac(2 rho_n rho_p, epsilon \( rho_n + rho_p \)) V_0) $
これより $rho_n \, rho_p$
を出来る限り大きくすれば強い電場を作り出すことができ、アバランシェが起こるようになる。

== 同軸ケーブル
<同軸ケーブル-4>
芯線とスクリーンでは互いに逆向きに電流が流れており、これにより同軸ケーブルは内部でコンデンサかつコイルを成す。
芯線の半径を $a$、シールドの半径を $b$
とし、これらの静電容量とインダクタンスを求める。
ちなみに市販されている最も標準的なケーブルは $b \/ a tilde.eq 3.6$,
$epsilon_r tilde.eq 2.3$, $mu_r = 1$ である。

まず円筒座標系におけるポアソン方程式 $nabla^2 phi.alt \( r \) = 0$
を解くことで電位, 電場が分かる。
$ nabla^2 & = 1 / r frac(partial, partial r) (r frac(partial, partial r)) + 1 / r^2 frac(partial^2, partial theta^2) + frac(partial^2, partial z^2)\
nabla^2 phi.alt & = 1 / r frac(partial, partial r) (r frac(partial, partial r)) phi.alt = 0 arrow.l.r.double phi.alt \( r \) = V frac(ln \( r \/ b \), ln \( a \/ b \)) & \( phi.alt \( a \) = V \, phi.alt \( b \) = 0 \)\
E \( r \) & = frac(V, r ln \( b \/ a \)) & \( E \( r \) = - nabla phi.alt \) $
ここでガウスの法則より $2 pi r epsilon E \( r \) = Q = C V$
となるから単位長さあたりの静電容量 $C$ は次のようになる。
$ C & = frac(2 pi epsilon, ln \( b \/ a \)) $

次に絶縁体内の磁場からインダクタンスの定義より次のように求まる。
$ B \( r \) & = frac(mu I, 2 pi r)\
L I & = integral_a^b B \( r \) upright(d) r = frac(mu I, 2 pi) ln b / a\
L & = frac(mu, 2 pi) ln b / a $
これより静電容量とインダクタンスが求まった。
$ C & = frac(2 pi epsilon, ln \( b \/ a \))\
L & = frac(mu, 2 pi) ln b / a $ これらについて同軸ケーブルの等価回路の図
@fig:circuit を参考に微小長さ $Delta z$ に対して電圧, 電流の差分
$Delta V \, Delta I$ の関係式を導く。

#figure(web-image("/public/notes/physics_report/assets/circuit.jpg", width: 10cm),
  caption: [
    同軸ケーブルの等価回路
  ]
)
<fig:circuit>

$ Delta V & = - Delta z L frac(partial I, partial t)\
Delta I & = - Delta z C frac(partial V, partial t) $
これより極限を取ると次の微分方程式が成り立つ。
$ frac(partial V, partial z) & = - L frac(partial I, partial t)\
frac(partial I, partial z) & = - C frac(partial V, partial t) $
よって電圧 $V$ について波動方程式が求まる。
$ frac(partial^2 V, partial z^2) = - L frac(partial I, partial z \, t) = L C frac(partial^2 V, partial t^2) $
この一般解については次のようになる。
$ V \( z \, t \) & = integral_0^oo upright(d) k (V_(+) \( k \) e^(i k \( z - v t \)) + V_(-) \( k \) e^(i k \( z + v t \)))\
I \( z \, t \) & = integral_0^oo upright(d) k (I_(+) \( k \) e^(i k \( z - v t \)) + I_(-) \( k \) e^(i k \( z + v t \))) $
この進行波について上の微分方程式より次のような関係式が成り立つ。
$ i k V_(+) \( k \) & = i omega L I_(+) \( k \)\
i omega C V_(+) \( k \) & = i k I_(+) \( k \)\
frac(V_(+) \( k \), I_(+) \( k \)) & = frac(omega L, k) = frac(k, omega C) = sqrt(L / C) $
これはこの回路の特性インピーダンスを示す。

T
コネクタについては同軸ケーブルの特性インピーダンスと同じインピーダンスを持つ抵抗または回路を並列にすべての終端に置くことで全体として反射を防ぐことができると思われる。

== 授業の感想
<授業の感想>
物理学実験 B
で光電子増倍管やシンチレータ、半導体によるセンサといった実験装置や回路などによる観測技術については一通り学んでいたのでそれを少し応用するだけで実験が出来た。
こうして実験することでさまざまな概念がちゃんと紐づくような感じがして面白かったです。
ただレポートを書いているときに他の実験の文献を漁っているとそれを更に応用して様々な実験を行っていてもう少し応用のある実験でも良さそうと思いました。

= 参考文献
<参考文献>
- 宇宙線ミューオンの観測
  #link("https://www-he.scphys.kyoto-u.ac.jp/gakubu/A1/reports/a1report16b.pdf")
