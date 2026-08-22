#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": axiom, corollary, definition, example, lemma, lost-figure, proof, proposition, remark, theorem
#import "/src/typst/image.typ": web-image

#show: post.with(
  title: "原子核物理学",
  date: "2026-08-18",
  tags: ("ノート",),
  summary: "note/nuclear_physics.tex から変換",
)

// 元の LaTeX が式番号で参照していた。採番しないと @ラベル が解決できず、
// 参照がラベル名のまま本文に出る。
#set math.equation(numbering: "(1)")

= 原子核
<原子核>
物質はすべて分子や原子によって構成されている。 例えば水は \_2
の分子で出来ており水素原子と酸素原子が結合してできている。
その原子は原子核と電子で構成されており、原子核は陽子と中性子によって構成されている。
この陽子と中性子を核子と呼び、核子は核力を受けながら原子核中を飛び回っている。

その核力を解明し、核反応によって陽子と中性子が互いに遷移し合うような現象や原子核に関する魔法数、ビッグバン時や星の一生でどのように原子核が構成されるかなど、これらすべてを説明するようなモデルを構築することこそが原子核物理学である。

実験結果、描像、原子核を構成、原子核の性質

== 原子核の発見
<原子核の発見>
1897 年: 電子の発見 J.J. Thomson, 陰極線の実験

1904 年: Plum pudding model (ブドウパンモデル) J.J. Thomson が提唱

1904 年: 土星型原子モデル 長岡半太郎が提唱

1909 年: ラザフォード (Rutherford) の散乱実験により原子核の大きさ
アーネスト・ラザフォードの弟子のハンス・ガイガーとアーネスト・マースデンによる実験
$alpha$ 線を金箔に照射し、2万回に1回ほど90度以上の角度に散乱

1956 年: ホフスタッター (Robert Hofstadter)
の電子散乱実験により原子核の形状が分かった。

電荷 $Z e$ フェルミ粒子で構成→スピン半整数
窒素分子の回転バンドやラマン分光の測定→スピン整数

James Chadwick による中性子の発見
$ ""_2^4 upright(H e) +_4^9 upright(B e)_5 arrow.r_6^12 upright(C)_6 + n $
未知の中性粒子によって弾かれた陽子を検出器で観測
中性粒子の質量が陽子と同程度であることを見いだした ($gamma$
線だと仮定すると極めて高いエネルギーになる)

== 散乱理論
<散乱理論>
図が沢山必要やね
$ frac(upright(d) sigma, upright(d) Omega) = (frac(a, 4 E))^(1 / 2) sin 4 \( theta \/ 2 \) $
$ d_0 & = a / E = frac(alpha z Z \( planck c \), E)\
thin upright(d) N & = 2 pi b thin upright(d) l N\
b & = frac(a, 2 E) cot theta / 2\
thin upright(d) sigma & = frac(thin upright(d) N, N)\
frac(upright(d) sigma, upright(d) Omega) & = 1 / N frac(upright(d) N, upright(d) Omega) = $
https:\/\/www.nobelprize.org/prizes/physics/1961/hofstadter/lecture/

== 核子
<核子>
陽子と中性子はどちらもスピン 1/2 のフェルミオンである。
$ m_p & = 938.272 med M e V \/ c^2\
m_n & = 939.565 med M e V \/ c^2\
m_e & = 0.511 med M e V \/ c^2 $
核子は水素原子の電子と同じような軌道となるのか？

原子核の半径 $R$ は核子 1 個当たりの半径 $r_0 = 1.25$ fm から求まる。
$ R = r_0 A^(1 \/ 3) $ 体積が質量数 $A$
に比例することから密度の飽和性がわかる。
$ ⟨r^2⟩ & = integral r^2 rho \( bold(r) \) thin upright(d)^3 r = integral r^2 rho \( bold(r) \) 4 pi r^2 thin upright(d) r 5 / 3 $

原子核の形状はさまざまな近似方法があるが最も広く使われている Woods-Saxon
型分布 (Fermi 関数) という原子核の形状因子を紹介する。 標準核密度
$rho_0 = 0.17$ fm#super[−3] diffuseness $a approx 0.67$ fm を用いて
$ rho \( r \) & = frac(rho_0, 1 + exp (- frac(r - R, a))) $
これは次のようなグラフとなる。 平均核子間距離
$d = chevron.l rho chevron.r^(- 1 \/ 3)$

== フェルミガス模型
<フェルミガス模型>
まずは核子間で相互作用することなく自由に運動しているモデルを考える。 \
1 辺 $L$ の立方体の中に $N$ 個の中性子を入れる。
$ bold(k) & = (frac(2 pi, L) n_x \, frac(2 pi, L) n_y \, frac(2 pi, L) n_z)\
psi \( bold(r) \) & = e^(i bold(k) dot.op bold(r))\
d n & = 4 pi k^2 d k times 2 (frac(2 pi, L))^3 = V / pi^2 k^2 d k\
N & = integral_0^(k_F) frac(upright(d) n, upright(d) k) thin upright(d) k = frac(V, 3 pi^2) k_F^3\
k_F & = (frac(3 pi^2 N, V))^(1 \/ 3)\
E_F & = frac(p_F^2, 2 m) = frac(\( planck k_F \)^2, 2 m) = frac(planck^2, 2 m) (frac(3 pi^2 N, V))^(2 \/ 3)\
n & = 2 integral d bold(r) integral d bold(p) 1 / h^3 = 2 frac(Omega, \( 2 pi \)^3) integral_0^(k_F) 4 pi k^2 d k = 2 frac(Omega, \( 2 pi \)^3) 4 / 3 pi k_F^3\
k_F & = (3 pi^2 n / Omega)^(1 \/ 3) $
$ P_(F n) & = planck k_(F n) = planck (3 pi^2 rho_n)^(1 \/ 3)\
P_(F p) & = planck k_(F p) = planck (3 pi^2 rho_p)^(1 \/ 3) $

フェルミガス模型に従うことから核子が原子核中でかなり自由に動いていることがわかる。
からスピン 1/2 と -1/2 の 2 つがあり、異なるスピンとしか衝突しない。
実際光速の 20 % 程度で移動している。
陽子や中性子の平均自由行程が長くなる。 統計力学

== 独立粒子模型
<独立粒子模型>
多数の実験結果から陽子または中性子の数が 2, 8, 20, 28, 50, 82, 126
のとき結合エネルギーが大きく、安定していることが結論づけられている。
これを魔法数 (magic number) と呼ぶ。

原子核は核子の多体問題となっているが、フェルミガス模型から分かるように核子同士の相互作用を無視する独立粒子模型がよい近似となっていることがわかる。
これより他の核子からの核力の平均の場中で核子の運動を考える平均場近似をする。
その平均場でよく用いられる Woods-Saxon Potential は次のようになる。
$ V \( r \) & = - frac(U_0, 1 + exp (frac(r - R, a))) $ Woods-Saxon
Potential
はシュレーディンガー方程式で解析的に解けないので調和振動子のポテンシャルに近似する。
$ V \( r \) & = - V_0 + 1 / 2 m omega^2 r^2 #h(2em) \( V_0 = 40 med M e V \) $
このとき量子力学でやったように 3
次元極座標系の微分方程式を解くと波動関数
$psi_(n l m) \( bold(r) \) = R_(n l) \( r \) Y_(l m) \( theta \, phi \)$
に対してエネルギーは次のようになる。
$ H & = - frac(planck^2, 2 m) nabla^2 + 1 / 2 m omega^2 r^2\
E & = (2 n + l + 3 / 2) planck omega $ これより $N = 2 n + l$
とおくと表 #link(<table:oscillator>)[table:oscillator] のようになる。

#block[
#figure(
  table(
    columns: 7,
    align: (center,center,center,center,center,center,center,),
    table.header([表示], [$N$], [$n$], [$l$], [$m$], [縮退度], [殻],),
    table.hline(),
    [1s], [0], [0], [0], [0], [2], [1(2)],
    [1p], [1], [0], [1], [$- 1 \, 0 \, 1$], [6], [2(8)],
    [1d], [2], [0], [2], [$- 2 \, - 1 \, 0 \, 1 \, 2$], [10], [3(20)],
    [2s], [2], [1], [0], [0], [2], [3(20)],
    [1f], [3], [0], [3], [$- 3 \, - 2 \, - 1 \, 0 \, 1 \, 2 \, 3$], [14], [4(40)],
    [2d], [3], [1], [1], [$- 1 \, 0 \, 1$], [6], [4(40)],
  )
  , caption: [調和振動子系の縮退度]
  , kind: table
  )

] <table:oscillator>
これより平均場近似では魔法数 2, 8, 20, 28, 50, 82, 126
を説明することはできない。

統計力学を考える。核子が埋まっている
$ D & = sum_(N = 0)^(N_max) \( N + 1 \) \( N + 2 \) = 1 / 3 \( N_max + 1 \) \( N_max + 2 \) \( N_max + 3 \)\
A & = 2 D approx 2 / 3 \( N_max + 2 \)^3\
⟨N\| r^2 \|N⟩ & = ⟨N\| x^2 + y^2 + z^2 \|N⟩ = frac(planck, m omega) (N + 3 / 2)\
A ⟨r^2⟩ & = sum_(N = 0)^(N_max) frac(planck, m omega) (N + 3 / 2) 2 \( N + 1 \) \( N + 2 \)\
 & = 1 / 2 frac(planck, m omega) \( N_max + 1 \) \( N_max + 2 \)^2 \( N_max + 3 \)\
 & approx 1 / 2 frac(planck, m omega) \( N_max + 2 \)^4 approx 1 / 2 frac(planck, m omega) (3 / 2 A)^(4 \/ 3)\
⟨r^2⟩ & = frac(integral_0^R r^24 pi r^2 thin upright(d) r, integral_0^R 4 pi r^2 thin upright(d) r) = 3 / 5 R^2 = 3 / 5 r_0^2 A^(2 \/ 3)\
3 / 5 r_0^2 A^(5 \/ 3) & approx 1 / 2 frac(planck, m omega) (3 / 2 A)^(4 \/ 3)\
planck omega & approx 5 / 4 (3 / 2)^(1 \/ 3) frac(planck^2, m r_0^2) A^(- 1 \/ 3) approx 40 A^(- 1 \/ 3) med M e V $
結合エネルギーの飽和性 $V_0 approx 50$ MeV

Mayer, Jensen はスピン軌道結合力 (L-S 力)
を取り入れることで魔法数を説明した。
$ V \( r \) = - V_0 + underbrace(1 / 2 m omega^2 r^2, "調和振動" ⼦) + underbrace(V_(l s) bold(l) dot.op bold(s), "スピン軌道結合力") $
$ ⟨bold(l) dot.op bold(s)⟩ & = 1 / 2 \[ bold(j)^2 - bold(l)^2 - bold(s)^2 \] = 1 / 2 (j \( j + 1 \) - l \( l + 1 \) - s \( s + 1 \))\
 & = 1 / 2 (j \( j + 1 \) - l \( l + 1 \) - 3 / 4)\
 & = cases(delim: "{", 1 / 2 l & \( j = l + 1 \/ 2 \), 1 / 2 \( - l - 1 \) & \( j = l - 1 \/ 2 \), ) $
多数の実験結果から $V_(l s) = - 20 A^(- 2 \/ 3)$ MeV
となることが分かっている。
$ Delta epsilon_(l s) & = V_(l s) ⟨bold(l) dot.op bold(s)⟩ = cases(delim: "{", - 10 A^(- 2 \/ 3) l & \( j = l + 1 \/ 2 \), + 10 A^(- 2 \/ 3) \( l + 1 \) & \( j = l - 1 \/ 2 \), ) $
スピン軌道結合⼒よりスピンと軌道角運動量が同じ向きの方が安定する。
これが強い理由に軸性ベクトル (擬ベクトル) の話がある。
原子核の内部では力が働かず、表面において強い相互作用が働く P-inv, T-inv
となるから
$ V \( r \) = - V_0 + underbrace(1 / 2 m omega^2 r^2, "調和振動" ⼦) + underbrace(V_(l s) bold(l) dot.op bold(s), "スピン軌道結合力") + underbrace(D bold(l)^2, "表面項") $

== 核スピン
<核スピン>
各核子の波動関数は軌道 $\( n \, l \, j^pi \)$ に依存する。

#block[
#figure(
  table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([$\( n \, l \, j^pi \)$], [表示], [縮退度], [パリティ], [核
      (魔法数)],),
    table.hline(),
    [$\( 0 \, 0 \, 1 \/ 2 \)$], [$1 s_(1 \/ 2)$], [2], [$+$], [1 (2)],
    [$\( 0 \, 1 \, 3 \/ 2 \)$], [$1 p_(3 \/ 2)$], [4], [$-$], [2 (8)],
    [$\( 0 \, 1 \, 3 \/ 2 \)$], [$1 p_(1 \/ 2)$], [2], [$-$], [2 (8)],
    [$\( 0 \, 2 \, 5 \/ 2 \)$], [$1 d_(5 \/ 2)$], [6], [$+$], [3 (20)],
    [$\( 1 \, 0 \, 1 \/ 2 \)$], [$2 s_(1 \/ 2)$], [2], [$+$], [3 (20)],
    [$\( 0 \, 2 \, 3 \/ 2 \)$], [$1 d_(3 \/ 2)$], [4], [$+$], [3 (20)],
    [$\( 0 \, 3 \, 7 \/ 2 \)$], [$1 f_(7 \/ 2)$], [8], [$-$], [4 (28)],
    [$\( 1 \, 1 \, 3 \/ 2 \)$], [$2 p_(3 \/ 2)$], [4], [$-$], [5 (50)],
    [$\( 0 \, 3 \, 5 \/ 2 \)$], [$1 f_(5 \/ 2)$], [6], [$-$], [5 (50)],
    [$\( 1 \, 1 \, 1 \/ 2 \)$], [$2 p_(1 \/ 2)$], [2], [$-$], [5 (50)],
    [$\( 0 \, 4 \, 9 \/ 2 \)$], [$1 g_(9 \/ 2)$], [10], [$+$], [5 (50)],
  )
  , caption: [魔法数]
  , kind: table
  )

] <table:magic-number>
#definition("殻模型")[
Woods-Saxon
ポテンシャルと軌道スピン相互作用により核子の軌道が数 MeV
以上離れたグループ化した軌道を殻と呼ぶ。
その殻の準位数を魔法数と呼び、次のような数となる。
$ 2 \, 8 \, 20 \, 28 \, 50 \, 82 \, 126 $
ある殻までのすべての軌道が詰まっている状態を閉殻またはコア核という。真空状態ともいう。そこから核子が減った状態を空孔という。
それに対して核子がまだ埋まっていない殻をオープン殻という。
基底状態は下から順に核子が埋まっている状態、励起状態は飛ばして上の準位が埋まっている状態とする。
]
#definition("核スピンとパリティ")[
原子核において軌道角運動量 $l$, スピン角運動量 $s$
とその和の全⾓運動量を核スピン $J^pi$
$ bold(J) & = sum_(i = 1)^A bold(j)_i = sum_(i = 1)^A \( bold(l)_i + bold(s)_i \) = bold(L) + bold(S) $
パリティは $\( - \)^l$ となる。
]
対相互作⽤などのオープン殻の核⼦-核⼦間相互作⽤を残留相互作⽤と呼ぶ
同じ軌道で傾きが同じで真反対⽅向に回る 2
核⼦が対相互作⽤が⼀番強くなるから核は偶数ならスピンが逆向きになる。$\( j \, m \)$
$\( j \, - m \)$

すべての偶偶核の基底状態: $J^pi = 0^(+)$ Fermi 粒子であるから
$ psi \( J \, M \) & = 1 / 2 sum_(m \, m') \( j m j m' \| J M \) \[ phi.alt_1 \( m \) phi.alt_2 \( m' \) - phi.alt_1 \( m' \) phi.alt_2 \( m \) \]\
 & = 1 / 2 sum_(m \, m') \[ \( j m j m' \| J M \) - \( j m' j m \| J M \) \] phi.alt_1 \( m \) phi.alt_2 \( m' \)\
 & = 1 / 2 \[ 1 - \( - 1 \)^(2 j - J) \] sum_(m \, m') \( j m j m' \| J M \) phi.alt_1 \( m \) phi.alt_2 \( m' \) $
偶偶核の第⼀励起状態：ほとんど $J^pi = 2^(+)$
$ J^pi = 0^(+) \, 2^(+) \, 4^(+) \, dots.h $
奇奇核の場合も基底状態ではあまりないが、励起状態に0+がある可能性がある。
奇偶核の場合は核スピンは半整数になる。

閉殻は全ての軌道が埋まっており核スピンが $0^(+)$
で方向性を持たないから球形となる。 Finite Range Liquid Drop Model
によるとオープン核に核子があると集団的に楕円形に変形する。(自発的対称性の破れ)
Atomic Data and Nuclear Data Tables,109,1 (2016). P.Moller, A.J.Sierk,
T.Ichikawa, H.Sagawa

閉殻 $0^(+)$ に 1 核子 (中性子) をオープン核に入れることを考える。
このとき全体の核スピン $J^pi$ は核子のスピン $j^pi$ と一致する。
$ \( 原 ⼦ 核^(upright(A) + 1) upright(Z) "の波動関数" \) approx \( ⼀ 粒 ⼦ "軌道の波動関数" \) times.o \( "コア核"^(upright(A Z)) "の波動関数" \) $
$ Psi \(^(upright(A) + 1) upright(Z) \( J^pi \) \) approx phi.alt \( n \, l \, j^pi \) times.o Psi \(^(upright(A Z)) \( 0^(+) \) \) $
$ Psi \(^41 upright(C a) \( 7 \/ 2^(-) \) \) & approx phi.alt_n \( 1 f_(7 \/ 2) \) times.o Psi \(^40 upright(C a) \( 0^(+) \) \)\
Psi \(^17 upright(O) (5 \/ 2^(+)) \) & = sqrt(S_j) phi.alt_n \( 1 d_(5 \/ 2) \) times.o Psi \(^16 upright(O) \( 0^(+) \) \) + dots.h.c\
 & approx phi.alt_n \( 1 d_(5 \/ 2) \) times.o Psi \(^16 upright(O) \( 0^(+) \) \) + dots.h.c & \(^17 upright(O) : S_j approx 1 \) $
スペクトロスコピック因⼦ $S_j$ は⼀粒⼦軌道の度合いである。
閉殻＋１の場合, ⼀つの⼀粒⼦軌道が占有してるから

⼀粒⼦軌道状態はストリッピング反応 (Stripping Reaction)
により調べられる。 $ ""^16 upright(O) + d arrow.r^17 upright(O) + p $
このエネルギー保存則、運動量保存則より重陽子の運動エネルギーと出てきた陽子の運動量が分かれば
^17 の質量が分かる。

⼀空孔軌道状態はピックアップ反応 (Pickup Reaction) により
$ ""^16 upright(O) + p arrow.r^15 upright(O) + d $

$l = 0$ (s軌道)
に中性⼦が⼊るとき、⾓度分布は0度にピークを持つことを証明せよ
$bold(r) top bold(q)$
$ bold(l) & = 1 / planck bold(r) times bold(p) $

エネルギースケールが違う 超微細構造

歪曲波ボルン近似Distorted-Wave Born Approximation DWBA 平⾯波ボルン近似
Plain-Wave Born Approximation PWBA

== 核力
<核力>
湯川秀樹によって導入された媒介粒子というアイデアによって
不確定性原理で時間を十分短くするとエネルギーが不確定となる。
これにより短い時間ならエネルギー保存則を破る仮想粒子の交換も実現可能。
$Delta E = mu c^2$ $ Delta t dot.op Delta E gt.eq planck $
核子同士は強い相互作用で束縛されている。
これを核力と呼び、媒介粒子である中間子の交換
(陽子や中性子が中間子をキャッチボール) によって作用される。 核子同士で 1
秒に何回交換されるのか、交換されるときに崩壊は起こるのか？起こるとしたら原子核中のエネルギーはどうなるのか
$ Delta x = c Delta t = frac(planck c, mu c^2) approx frac(197 M e V dot.op f m, 140 M e V) approx 1.4 f m $
中間子は $pi$ 中間子, $rho$ 中間子, $omega$ 中間子の 3
つがあり、質量が異なるので、到達距離や結合定数 (⼒の強さ) が変わる。
$pi$ 中間子は $pi^(+) \, pi^(-) \, pi^0$ の 3 種類がある。
$pi^plus.minus$ は弱い相互作⽤ ニュートリノ レプトン数保存 $pi^0$
は弱い相互作⽤で崩壊しないから電磁気力的に崩壊する。これはとても速く崩壊する。

#block[
#figure(
  table(
    columns: 6,
    align: (center,center,center,center,center,center,),
    table.header([], [スピン・パリティ], [電荷], [質量], [崩壊寿命], [崩壊様式],),
    table.hline(),
    [$pi^(+)$], [$0^(-)$], [$+ e$], [$140$
    MeV/c#super[2];], [$2.60 times 10^(- 8)$ s], [^+^+ +\_],
    [$pi^(-)$], [$0^(-)$], [$- e$], [$140$
    MeV/c#super[2];], [$2.60 times 10^(- 8)$ s], [^-^- +\_],
    [$pi^0$], [$0^(-)$], [$0$], [$135$
    MeV/c#super[2];], [$0.8 times 10^(- 16)$ s], [^0$arrow.r 2 gamma$],
  )
  , caption: [$pi$ 中間子の種類]
  , kind: table
  )

] <table:pi>
宇宙線中に観測 （Lattes, Occhialini, Powell, 1947)
加速器（⽶国バークレー、シンクロサイクロトロン）(1948)

$ E^2 & = \( p c \)^2 + \( m c^2 \)^2\
(i frac(partial, partial t))^2 & = \( - i planck nabla c \)^2 + \( m c^2 \)^2 $
定常状態を考えるとコンプトン波長 $lambda - -$ を用いて
$  & [1 / c^2 frac(partial^2, partial t^2) - nabla^2 + (frac(m c, planck))^2] psi \( bold(r) \) = 0\
 & [nabla^2 - frac(1, lambda - -^2)] psi \( bold(r) \) = - 4 pi rho \( bold(r) \) = 4 pi g delta \( bold(r) \) & (lambda - - := frac(planck, m_pi c))\
 & psi \( bold(r) \) = - g e^(- r / gamma) / r\
 & V \( bold(r) \) = - g^2 e^(- r \/ gamma) / r $ 中間子場の波動関数は
$g$ は核子の持つ荷 核⼦がもつ”荷“が源となって中間⼦場ができると考える。
の質量が0の時は遠距離⼒、⾮ゼロの時は近距離⼒
$ alpha = frac(Z_0 e^2, 2 h) = 1 / 137\
frac(g^2, h c) = 0.3 $

核⼒ポテンシャル 質量が大きくなると到達距離は短くなる。 $1 pi$
交換ポテンシャル, $rho \, omega$ 交換, $2 pi$ 交換 斥力芯
(クォークパウリ効果等) -0.5fm

#block[
#figure(
  table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([力], [重力], [電磁気力], [弱い力], [強い力],),
    table.hline(),
    [長さ], [$10^8$m ～ $10^22$m], [$10^(- 10)$ m], [$< 10^(- 15)$
    m], [$< 10^(- 15)$ m],
    [力の大きさ], [～$10^(- 38)$], [～$10^(- 2)$], [～$10^(- 5)$], [～$1$],
    [仮想粒子], [重力子], [光子], [W, Z ボソン], [グルーオン (中間子)],
    [具体例], [地球-月や銀河系], [原子核-電子間], [$beta$ 崩壊], [核力],
  )
  , caption: [自然界の 4 つの力]
  , kind: table
  )

] <table:force>
荷電交換が起こる確率は 1/2

#lost-figure[陽⼦-中性⼦後⽅散乱]

低エネルギーのp+p,p+n散乱から散乱の位相差
も到達距離(ポテンシャルの形）や引⼒か斥⼒かを評価できる。

== Fermi 理論
<fermi-理論>
ニュートリノ (neutrino)

摂動論を用いてフェルミの黄金律 (Fermi' Golden Rule) が導かれる

始状態の波動関数 $\|i⟩$ と終状態の波動関数 $⟨f\|$ 相互作用演算子 $V$
遷移確率 $W$
$ W = frac(2 pi, planck) \| ⟨f\| V \|i⟩ \|^2 frac(upright(d) N, upright(d) E) $

$ H = ⟨f\| V \|i⟩ = g integral \( psi_p^(\*) tau^(-) psi_n \) \( psi_e^(\*) psi_nu \) d t d bold(r) $

$ psi_e & = e^(i bold(k) dot.op bold(r)) / sqrt(V)\
k r & = r / lambda lt.double 1\
H & = g frac(\| M_(i f) \|^2, V)\
M_(i f) & = integral \( psi_f^(\*) sum_i tau_i^(-) psi_i \) thin upright(d) tau thin upright(d) bold(r) $

$ W \( E \) thin upright(d) E & = frac(2 pi, planck) g^2 / V^2 \| M_(i f) \|^2 frac(upright(d) N, upright(d) E_0) = frac(g^2 \| M_(i f) \|^2, 2 pi^3 c^5 planck^7) p \( E_0 - E \)^2 thin upright(d) E $

$ frac(upright(d) N, upright(d) t) & = - lambda N\
N \( t \) & = N_0 exp \( - lambda t \) = N_0 exp \( - t \/ tau \) = N_02^(- t \/ T_(1 \/ 2)) $
角運動量を3変える「禁止遷移」のため起こりにくい→長寿命

== アイソスピン
<アイソスピン>
陽⼦と中性⼦の⼊れ替えても物理は変わらない (荷電対称性)
という推察から陽子と中性子は 1 つの粒子の 2
つの状態と捉えることを考える。

その為アイソスピンと呼ばれる新たな量を定義する。核子は 1/2
の大きさのアイソスピンを持ち、陽子は $T_z = - 1 \/ 2$, 中性子は
$T_z = 1 \/ 2$ と定義する。 スピンは次元量、アイソスピンは無次元量
アイソスピンの波動関数 $v$ は次のように定義し、アイソスピン演算子
$bold(tau)$ をパウリ行列 $bold(sigma)$ として 1
核子のアイソスピン演算子を $bold(T) = bold(tau) \/ 2$ とする。
$ v_n & = vec(1, 0) \, quad v_p = vec(0, 1)\
tau_x & = mat(delim: "(", 0, 1; 1, 0) \, quad tau_y = mat(delim: "(", 0, - i; i, 0) \, quad tau_z = mat(delim: "(", 1, 0; 0, - 1)\
tau_(+) & = 1 / 2 \( tau_x + i tau_y \) = mat(delim: "(", 0, 1; 0, 0) \, quad tau_(-) = 1 / 2 \( tau_x - i tau_y \) = mat(delim: "(", 0, 0; 1, 0)\
tau_(+) v_n & = 0 \, quad tau_(+) v_p = v_n \, quad tau_(-) v_n = v_p \, quad tau_(-) v_p = 0\
bold(T) dot.op bold(T) & = 1 / 4 bold(tau) dot.op bold(tau) = 1 / 4 \[ 4 tau_(+) tau_(-) + tau_z^2 - 2 tau_z \] $
このような代数が成り立つ。
$ Psi \( 1 \, 2 \) & = v_p \( 1 \) v_p \( 2 \) phi.alt_(-) \( 1 \, 2 \) $

$ Psi \( 1 \, 2 \) = underbrace(Phi_r \( 1 \, 2 \), "空間座標") underbrace(Phi_chi \( 1 \, 2 \), "スピン") underbrace(Phi_tau \( 1 \, 2 \), "アイソスピン") $
$Psi = phi.alt \( bold(r) \) chi \( sigma \) v \( tau \)$

= 原子核の分類と核反応
<原子核の分類と核反応>
== 原子核の実験的知見
<原子核の実験的知見>
原子核の大きさは 1-10fm

原子核は陽子と中性子によって構成されているからそれらの数によって核種を分類できる。
陽子数を $Z$ , 中性子数を $N$ とおいて元素記号 $X$ , 質量数 $A = Z + N$
の核種を次のように表す。
$ ""^(upright(A X)) \,_(upright(Z X))^(upright(A)) \,_(upright(Z X))^(upright(A)) ""_(upright(N)) $

- $A$ が等しい核種を同重体 (isobar)

- $Z$ が等しい核種を同位体 (isotope)

- $N$ が等しい核種を同中性子体、同調体 (isotone)

- $Z$ $N$ が逆の核種を鏡映核 (mirror nuclei)

発見された核種 3338 種類 (2022 年末時点) 6000-8000
種類の原子核の存在が予想 自然界では が陽子数最大
超ウラン元素は核融合によって人工的に生成
https:\/\/people.nscl.msu.edu/~thoennes/isotopes/

核図表 https:\/\/www.nndc.bnl.gov/nudat3/
https:\/\/people.physics.anu.edu.au/~ecs103/chart3d/

偶偶核の第一励起状態 21+ の励起エネルギー魔法数 2, 8, 20, 28, 50, 82,
126 の筋が現れる。 $1 u = M \(^12 upright(C) \) \/ 12 = 931.494$ MeV/c2

#block[
#figure(
  table(
    columns: 2,
    align: (center,left,),
    table.header([崩壊], [条件],),
    table.hline(),
    [束縛核], [強い相互作用で安定。],
    [非束縛核], [強い相互作用でも不安定。共鳴状態としてのみ存在できる。($tau tilde.op 10^(- 21) tilde.op 10^(- 22)$
    s)],
    [安定同位体], [束縛核の内、いつまでも崩壊しない安定な核種],
    [不安定核], [束縛核の内、$alpha$ 崩壊, 電子捕獲, 弱い相互作用
    ($beta$ 崩壊) などの核崩壊では不安定],
    [二重魔法数核], [陽子数と中性子数が魔法数の核種。当初安定と考えられていたが不安定核が見つかってきた為理論のベンチマークとなっている。],
  )
  , caption: [核反応]
  , kind: table
  )

] <table:>
束縛核と非束縛核の境界線をドリップラインと呼び、非束縛核、中性子ドリップラインの外：中性子放出で崩壊、陽子ドリップラインの外：陽子放出で崩壊する。

⼆重魔法数核

- 安定核の二重魔法数核 5 種 (^4, ^16, ^40, ^48, ^208)
  実験的、理論的に確⽴

- 不安定核の二重魔法数核 7 種 (^10, ^28, ^48, ^56, ^78, ^100, ^132)
  実験的、理論的に確立していないものが多い。 ^56, ^78, ^132
  は実験的、理論的に確立

^28 が難しい理由: 非束縛核 (ドリップラインの外)
であるため、特に難しい。N/Z比でも突出

- 安定同位体は 250 種類

- \_3 は安定同位体が10種類 (最多)

- \_43 と\_61 は安定同位体がない。自然界には存在。

- 現在知られている最大の安定同位体は ^208 ^209 は 2003 年に $alpha$
  崩壊が初めて観測。$T_(1 \/ 2) = 2 times 10^19$ year (2000 京年)

逆転の島 ２個の中性子が励起した殻構造àより安定に

Dirac 方程式で元素 電子のエネルギーが虚数 原子核が質点のとき 137
体積があるとき 173 真空崩壊

== 原子核の質量
<原子核の質量>
すべての現象はエネルギー (質量) が低い方へ遷移する。
核子あたりの結合エネルギー $B \/ A$ は ^56
で極大となるような曲線を描き、約 8 MeV でほぼ一定である。
これを結合エネルギーの飽和性という。
原子核の質量は結合エネルギー分低くなるから陽子と中性子がバラバラになるよりも原子核になっている方が安定である。

液滴模型のもとで原子の質量を現象論的に表す公式であるヴァイツゼッカーの質量公式
(Bethe-Weizsäcker) は次のように表される。
$ M \( A \, Z \) & = Z M \(^1 upright(H) \) + N M_n - underbrace(a_V A, "体積項") + underbrace(a_S A^(2 \/ 3), "表面項") + underbrace(a_C Z^2 / A^(1 \/ 3), "クーロン項") + underbrace(a_a frac(\( N - Z \)^2, 4 A), "非対称項") + underbrace(delta / A^(1 \/ 2), "対エネルギー項") $
$ delta & = cases(delim: "{", - Delta & \( A = upright(e v e n) \, Z = upright(e v e n) \), 0 & \( A = upright(o d d) \), + Delta & \( A = upright(e v e n) \, Z = upright(o d d) \), ) $
$ a_V & = 15.67 med M e V \/ c^2\
a_S & = 17.23 med M e V \/ c^2\
a_C & = 0.714 med M e V \/ c^2\
a_a & = 93.15 med M e V \/ c^2\
Delta & = 11.2 med M e V \/ c^2 $ 体積項
核力は長距離力ではなく近傍の核子からしか引力を受けないから平均核子間距離
$d = chevron.l rho chevron.r^(- 1 \/ 3)$ $A$ は比例

表面項は核表面にいる核子にとっては近傍の核子の数は少ない。体積項の引力を過大評価しているので質量を増やす補正が必要

クーロン項は陽子間のクーロン斥力
これがないと中性子だけで出来た原子核が最も軽く安定になってしまう。

非対称項 陽子と中性子の数が揃っている方が安定 アイソスピン1 (pp, pn, nn)
よりもアイソスピン0 (pn) のほうが引力が強い フェルミ気体模型で分かる

対エネルギー項 陽子数・中性子数がそれぞれ偶数のほうが安定
ともに奇数で安定な核種は ^2\_1\_1, ^6\_3\_3, ^10\_5\_5, ^14\_7\_7 のみ

== 核反応
<核反応>
原子核は質量が低い方へ遷移する。
これは質量が軽いことはエネルギーが低い、つまり安定であることである。
ヴァイツゼッカーの質量公式の陽子数 $Z$
に着目して振り分けると次のようになる。
$ M \( A \, Z \) & = alpha Z^2 - beta Z + gamma + delta / A^(1 \/ 2) $
弱い相互作用や電磁相互作用 $ Z = frac(beta, 2 alpha) $

$alpha$ 崩壊 鉛より原子番号の大きな放射性同位体でのみ起こりやすい。
崩壊前後で質量数を4で割った余りは変化しない。

#block[
#figure(
  table(
    columns: 3,
    align: (center,center,center,),
    table.header([崩壊], [反応式], [条件],),
    table.hline(),
    [$alpha$
    崩壊], [$\( A \, Z \) arrow.r \( A - 4 \, Z - 2 \) +^4 upright(H e)$], [],
    [$beta^(-)$
    崩壊], [$\( A \, Z \) arrow.r \( A \, Z + 1 \) + e^(-) + overline(nu)_e$], [$M \( A \, Z \) > M \( A \, Z + 1 \)$],
    [$beta^(+)$
    崩壊], [$\( A \, Z \) arrow.r \( A \, Z - 1 \) + e^(+) + nu_e$], [$M \( A \, Z \) > M \( A \, Z - 1 \) + 2 m_e$],
    [電子捕獲], [$\( A \, Z \) + e^(-) arrow.r \( A \, Z - 1 \) + nu_e$
    \+ 特性 X 線
    ($epsilon$)], [$M \( A \, Z \) > M \( A \, Z - 1 \) + epsilon$],
    [二重 $beta^(-)$
    崩壊], [$\( A \, Z \) arrow.r \( A \, Z + 2 \) + 2 e^(-) + 2 overline(nu)_e$], [],
    [二重 $beta^(+)$
    崩壊], [$\( A \, Z \) arrow.r \( A \, Z - 2 \) + 2 e^(+) + 2 nu_e$], [],
    [二重電子捕獲], [$\( A \, Z \) + 2 e^(-) arrow.r \( A \, Z - 2 \) + 2 nu_e$], [],
  )
  , caption: [核反応]
  , kind: table
  )

] <table:kernel>
電子捕獲は電子軌道 (主に K$alpha$ などの K 殻)
の電子と原子核の陽子が反応し, エネルギー $epsilon$ の特性 X 線を伴って
$ n & arrow.r p + e^(-) + overline(nu)_e\
p & arrow.r n + e^(+) + nu_e\
p + e^(-) & arrow.r n + nu_e $

#lost-figure[核反応]

ニュートリノを伴わない二重 $beta$ 崩壊 ($0 nu 2 beta$)
があるならニュートリノはディラック粒子 ($nu eq.not overline(nu)$)
ではなくマヨラナ粒子 ($nu = overline(nu)$) であることがわかる。
⼆重ベータ崩壊はニュートリノがマヨラナ粒子であるか判定する唯⼀の⽅法で
^48, ^76, ^124 でよく探索されている。 二重電子捕獲もあり ^78, ^124, ^130
に観測例があるがニュートリノレスはまだ。

これらから次のようなことが分かる。

- 安定同位体は $M \( A \, Z \)$ が極小な核種

- 安定同位体に比べて中性子が多ければ $beta^(-)$ 崩壊する。

- 安定同位体に比べて陽子が多ければ $beta^(+)$ 崩壊 / 電子捕獲する。

通常すべて基底状態でフェルミガスモデル $T = 0$
に従い、核反応時に励起状態になることがある。
すると励起状態から基底状態に遷移して $gamma$ 崩壊する。

== Nucleosynthesis
<nucleosynthesis>
まずビッグバン元素合成 $A = 5 \, 8$ のギャップによりなかなか進まない
$ ""^8 upright(B e) arrow.r 2^4 upright(H e)\
""^9 upright(B) arrow.r^8 upright(B e) + p $ と即座に崩壊するので ^8, ^9
⾮束縛核となる。

#figure([#block[
  #box(web-image("/public/notes/note/assets/nuclear.png", width: 8cm))
  ]],
  caption: [
  ]
)
<fig:2level>

#block[
#figure(
  table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([宇宙開闢からの時間], [温度], [反応式], [終了後],),
    table.hline(),
    [$10^(- 6)$ s], [1 GeV], [quauk $arrow.r p \, n$], [],
    [-1 s], [0.7
    MeV], [$n + nu_e arrow.l.r p + e^(-)$], [$p : n approx 7 : 1$
    に固定],
    [], [], [$p + overline(nu)_e arrow.l.r n + e^(+)$], [],
    [0.1 s], [0.1
    MeV], [$n + p arrow.l.r d + gamma \( 2.23 M e V \)$], [平衡状態終了後
    $d$ 増加],
    [$10^3$ s], [0.03
    MeV], [$""^4 upright(H e) + d arrow.r^6 upright(L i) + gamma$], [中性子捕獲が進み
    $n$ 枯渇, 温度低下],
    [], [], [$""^4 upright(H e) + t arrow.r^7 upright(L i) + gamma$], [],
    [], [], [$""^4 upright(H e) +^3 upright(H e) arrow.r^7 upright(B e) + gamma$], [^7,^6,^7
    少量生成],
    [その後], [], [$""^7 upright(B e) + e^(-) arrow.r^7 upright(L i) + nu_e$], [],
    [], [], [$t arrow.r^3 upright(H e) + e^(-) + nu_e$], [],
  )
  , caption: [Big Bang Nucleosynthesis (BBN)]
  , kind: table
  )

] <table:big-bang-nucleosynthesis>
^7 は 3 倍違う: ^7 問題

$ 4^1 upright(H) arrow.r^4 upright(H e) + 2 upright(e)^(+) + 2 nu $
赤色巨星の一種 AGB 星 (Asymptotic Giant Branch) sプロセス

r-プロセス (Rapid プロセス) 中性子捕獲の遷移確率 \>\>
ベータ崩壊の遷移確率 中性子星合体または超新星爆発(高密度,高温)
中性子捕獲と光吸収崩壊が平衡化する。

ベータ崩壊の寿命と
$ ""^68 upright(N i) + n & arrow.r^69 upright(N i) + gamma\
""^69 upright(N i) + n & arrow.r^70 upright(N i) + gamma\
""^70 upright(N i) + n & arrow.r^71 upright(N i) + gamma\
 & dots.v\
""^77 upright(N i) + n & arrow.r^78 upright(N i) + gamma\
""^78 upright(N i) + n & arrow.l.r^79 upright(N i) + gamma #h(2em) \( upright("Waiting point") \) $
太陽光のスペクトル＋太陽モデル

#block[
#figure(
  table(
    columns: 5,
    align: (center,center,center,center,center,),
    table.header([段階], [反応式], [時間スケール], [温度 ($T times 10^9$
      K)], [密度 (g/cm#super[3];)],),
    table.hline(),
    [水素燃焼], [$4 upright(H) arrow.r^4 upright(H e) + gamma$], [$7 times 10^6$
    y], [0.06], [5],
    [ヘリウム燃焼], [$3^4 upright(H e) arrow.r 3 alpha arrow.r^12 upright(C) + gamma$
    (ホイル状態)], [$5 times 10^5$ y], [0.23], [$7 times 10^2$],
    [炭素燃焼], [$""^12 upright(C) +^4 upright(H e) arrow.r^16 upright(O) + gamma$], [600
    y], [0.93], [$2 times 10^5$],
    [ネオン燃焼], [$""^20 upright(N e) + gamma arrow.r^16 upright(O) +^4 upright(H e)$], [1
    y], [1.7], [$4 times 10^6$],
    [酸素燃焼], [$""^16 upright(O) +^16 upright(O) arrow.r^28 upright(S i) +^4 upright(H e)$], [6
    months], [2.3], [$1 times 10^7$],
    [Si
    燃焼], [$""^28 upright(S i) +^4 upright(H e) arrow.r^32 upright(S)$], [1
    d], [4.1], [$3 times 10^7$],
    [コア崩壊], [], [seconds], [8.1], [$3 times 10^9$],
    [コア跳ね返り], [], [milliseconds], [34.8], [$3 times 10^14 tilde.op rho_0$],
    [爆発的燃焼], [], [0.1-10 s], [1.2-7.0], [],
  )
  , caption: [$25 M_(s u n)$ の星の時系列]
  , kind: table
  )

] <table:star>
= ハドロン物理学
<ハドロン物理学>
中性子数が多いからアイソスピン正 電荷との関係によるから陽子が正 $ Q $
