import type { Concept } from './types.ts'
import { c } from './types.ts'

export const statisticalMechanics: readonly Concept[] = [
  // --- 統計力学 --------------------------------------------------------------
  //
  // 三つの教科書が三箇所から始めている。Pathria は数える側（$S = k ln Omega$）、
  // Kardar は熱力学から、Landau は統計的独立性と Liouville だけを課して
  // **等重率を置かずに** $ln rho$ を加法的な運動の積分の線形結合に決める。
  //
  // **どの道を通っても同じ穴に着く** ── 状態の並べ方だけは決められずに残る。
  // Jaynes 1957 p.625（本文で確認）「物理と接するのは状態の数え上げの一箇所だけ」。
  c('why-give-up-tracking', '一個ずつ追うのをやめる', '$10^23$ 本の方程式は解けない。解くのを諦めた代わりに巨視量のほうが決まる', 'viewpoint', 'physics', ['three-body-unsolvable', 'hamiltonian']),
  c('phase-space-measure', '位相空間の測度', 'Hamilton 流の下で不変な測度がこれしかない', 'definition', 'physics', ['canonical-formalism', 'symplectic-form', 'measure']),
  c('liouville-theorem', 'Liouville の定理（位相体積）', '分布関数は流れに沿って一定。位相体積が縮まない。**複素解析の同名の定理とは別物**', 'theorem', 'physics', ['phase-space-measure', 'lie-derivative']),
  c('liouville-does-not-fix-p', 'Liouville は分布を決めない', '運動の定数の任意関数が全部定常になる。一様を選ぶ理由は Liouville の外から来る', 'viewpoint', 'physics', ['liouville-theorem']),
  c('ergodic-hypothesis', 'エルゴード仮説', '時間平均と位相平均が一致する、と**仮定する**。証明されている系はごく少ない', 'definition', 'physics', ['liouville-does-not-fix-p', 'expectation']),
  c('ergodicity-is-not-the-reason', 'エルゴード性では足りない', '一致するのは無限時間の話で、実験は有限時間で終わる。使っているのは混ざる速さのほう', 'viewpoint', 'physics', ['ergodic-hypothesis']),

  // 等重率を置くと何が決まるか
  c('microstate-macrostate', '微視状態と巨視状態', '同じ巨視状態を与える微視状態を数える。個数がそのまま確率になる', 'definition', 'physics', ['phase-space-measure', 'probability-space']),
  c('equal-a-priori-probability', '等重率', 'エネルギー殻の上のどの微視状態も同じ確率。**導かれていない。ここが仮定である**', 'definition', 'physics', ['liouville-does-not-fix-p', 'microstate-macrostate']),
  c('microcanonical-ensemble', '小正準集団', 'エネルギーが決まった孤立系。殻の上の一様分布', 'definition', 'physics', ['equal-a-priori-probability']),
  c('additivity-forces-log', '対数でなければならない', '独立な二つで状態数は掛け算、エントロピーは足し算。両立するのは対数だけ', 'theorem', 'physics', ['microcanonical-ensemble', 'independence-probabilistic']),
  c('boltzmann-entropy', 'Boltzmann のエントロピー', '$S = k ln Omega$。熱力学が状態量として出しただけのものに、数える対象が付く', 'definition', 'physics', ['additivity-forces-log']),
  c('temperature-from-counting', '温度は数え方から出る', '二つの系が接するとき、状態数の積を最大にする分け方が平衡', 'theorem', 'physics', ['boltzmann-entropy']),
  c('second-law-is-counting', '第二法則は数の問題', '大きいほうへ移る。等号は状態数が等しいときだけ', 'theorem', 'physics', ['temperature-from-counting']),

  // 知らないことを書く側から
  c('gibbs-entropy', 'Gibbs エントロピー', 'Shannon エントロピーと定数倍しか違わない', 'definition', 'physics', ['entropy', 'microstate-macrostate']),
  c('entropy-uniqueness-axioms', 'エントロピーが一意に決まる三条件', '連続性、一様のとき単調、そして合成則。三つ目だけが効いている', 'theorem', 'math', ['entropy']),
  c('maximum-entropy-principle', '最大エントロピー原理', '知っていること以外は仮定しない、を最大化として書く', 'definition', 'physics', ['gibbs-entropy', 'entropy-uniqueness-axioms']),
  c('maxent-gives-exponential', '制約が指数分布を決める', '期待値をひとつ固定して最大化すると指数型が出る。制約の個数だけ乗数が付く', 'theorem', 'physics', ['maximum-entropy-principle']),
  c('multiplier-is-temperature', '乗数が温度である', 'Lagrange 乗数が逆温度になる。温度は制約に付いた値段', 'theorem', 'physics', ['maxent-gives-exponential', 'temperature-from-counting']),
  c('maxent-is-inference', '最大エントロピーは推論の規則', '出てきた分布は自然についての主張ではなく、こちらの知識についての主張', 'viewpoint', 'physics', ['maximum-entropy-principle']),
  c('maxent-needs-enumeration', '数え上げだけが物理である', '力学もエルゴード性も等重率も使わない代わりに、状態の並べ方を外から与える必要が残る', 'viewpoint', 'physics', ['maxent-is-inference']),

  // 二つの出発点が、同じ穴を残す ── 連載の山
  c('ideal-gas-from-counting', '理想気体を数えてみる', 'Sackur–Tetrode の式。$h^(3N)$ と $N!$ を手で入れないと閉じない', 'technique', 'physics', ['microcanonical-ensemble']),
  c('gibbs-paradox', 'Gibbs のパラドックス', '同じ気体を混ぜただけでエントロピーが増える。示量性が壊れる', 'theorem', 'physics', ['ideal-gas-from-counting']),
  c('indistinguishability-forced', '非区別性が強制される', '示量性を要求すると $N!$ で割ることになる。**古典力学の中に理由が無い**', 'theorem', 'physics', ['gibbs-paradox']),
  c('enumeration-is-the-hole', '穴は数え上げのほうにある', '等重率から始めても最大エントロピーから始めても、状態の並べ方だけは決められずに残る', 'viewpoint', 'physics', ['indistinguishability-forced', 'maxent-needs-enumeration']),
  c('sackur-tetrode', 'Sackur–Tetrode の式', '単原子理想気体の絶対エントロピー。第三法則の値が計算から出て、熱測定と合う', 'theorem', 'physics', ['indistinguishability-forced', 'third-law']),

  // 部分系を切り出す
  c('canonical-ensemble', '正準集団', '熱浴に接した部分系。浴の状態数の対数を展開すると指数が出る', 'definition', 'physics', ['microcanonical-ensemble', 'temperature-from-counting']),
  c('boltzmann-distribution', 'Boltzmann 分布', '二つの出発点が同じ形に着く', 'theorem', 'physics', ['canonical-ensemble', 'maxent-gives-exponential']),
  c('partition-function', '分配関数', '母関数で、対数を微分すると全部出る', 'technique', 'physics', ['boltzmann-distribution', 'characteristic-function']),
  c('free-energy-from-partition', '自由エネルギーは対数', '$F = -k T ln Z$。熱力学で Legendre 変換だったものが、ここでは母関数の対数になる', 'theorem', 'physics', ['partition-function']),
  c('fluctuation-is-second-derivative', 'ゆらぎは 2 階微分', '比熱がエネルギーのゆらぎ、圧縮率が粒子数のゆらぎ。応答とゆらぎが同じ量', 'theorem', 'physics', ['partition-function', 'moments']),
  c('energy-fluctuation', 'エネルギーのゆらぎと比熱', '比熱が分散に比例するので、非負なのは物質の性質ではなく分散だからである', 'theorem', 'physics', ['fluctuation-is-second-derivative']),

  // 集団を乗り換えても答えが変わらない条件
  c('grand-canonical-ensemble', '大正準集団', '粒子もやりとりする。化学ポテンシャルがもう一本の乗数', 'definition', 'physics', ['canonical-ensemble']),
  c('thermodynamic-limit', '熱力学極限', '相互作用が短距離なら極限が存在する。相転移はこの極限でしか起きない', 'definition', 'physics', ['free-energy-from-partition', 'extensivity']),
  c('ensemble-equivalence', '集団の同等性', '相対ゆらぎが $1 \\/ sqrt(N)$ で消える。大数の法則そのもの', 'theorem', 'physics', ['thermodynamic-limit', 'law-of-large-numbers', 'concentration-inequality']),
  c('laplace-is-legendre', '集団の乗り換えは Laplace 変換', '鞍点で評価すると熱力学の Legendre 変換になる。$N$ が大きいことが鞍点近似の正当化', 'viewpoint', 'physics', ['ensemble-equivalence', 'convex-conjugate']),
  c('equivalence-fails-at-transition', '相転移点では同等でなくなる', 'ゆらぎが $N$ に比例して育つ。同等性が成り立つ条件のほうが主題になる', 'viewpoint', 'physics', ['ensemble-equivalence']),

  // 古典が壊れるのが、熱の側から先に見える
  c('equipartition', 'エネルギー等分配則', '二次形式ひとつにつき $k T \\/ 2$。古典に限った定理', 'theorem', 'physics', ['canonical-ensemble']),
  c('equipartition-fails-solid', '固体の比熱が合わない', '低温で古典値に届かない。自由度が凍る', 'viewpoint', 'physics', ['equipartition']),
  c('equipartition-fails-radiation', '空洞の中で発散する', 'モードが無限にあるので全部に $k T \\/ 2$ を配ると総エネルギーが発散する', 'viewpoint', 'physics', ['equipartition', 'two-polarizations']),

  // 量子で数え直す
  c('density-matrix', '密度行列', '状態が一つに決まらないときの記述。純粋状態の凸結合', 'definition', 'physics', ['quantum-state', 'observable']),
  c('von-neumann-entropy', 'von Neumann エントロピー', 'Gibbs エントロピーの量子版', 'definition', 'physics', ['density-matrix', 'gibbs-entropy']),
  c('thermal-density-matrix', '熱平衡の密度行列', 'von Neumann エントロピーを最大化して出る', 'theorem', 'physics', ['von-neumann-entropy', 'maxent-gives-exponential']),
  c('identical-particles-subspace', '同種粒子の Hilbert 空間', '対称部分空間か反対称部分空間か。テンソル積の一部しか使わない', 'definition', 'physics', ['composite-system', 'indistinguishability-forced', 'symmetrization-postulate']),
  c('occupation-number-basis', '占有数表示', 'どの一粒子状態に何個入っているか。粒子に名前を付けるのをやめた基底', 'definition', 'physics', ['identical-particles-subspace']),

  // 一つの状態に何個入れるか ── 場の量子論への伏線
  c('statistics-is-an-input', '統計は外から与えている', '一つの状態に何個まで入れるか。統計力学はここを仮定として置き、理由を持たない', 'viewpoint', 'physics', ['occupation-number-basis']),
  c('bose-einstein-distribution', 'Bose–Einstein 分布', '大正準で各状態を独立に扱うと出る', 'theorem', 'physics', ['statistics-is-an-input', 'grand-canonical-ensemble']),
  c('fermi-dirac-distribution', 'Fermi–Dirac 分布', '和が二項で切れるので符号だけ変わる', 'theorem', 'physics', ['statistics-is-an-input', 'grand-canonical-ensemble']),
  c('classical-limit-of-statistics', '古典極限', '占有数が 1 より十分小さいと両方 Boltzmann に落ちる', 'theorem', 'physics', ['bose-einstein-distribution', 'fermi-dirac-distribution']),

  // 統計だけで何が出るか
  c('fermi-gas', '縮退した Fermi 気体', '絶対零度でも運動量を持つ。排他律だけで圧力が出る', 'theorem', 'physics', ['fermi-dirac-distribution', 'pauli-exclusion']),
  c('fermi-energy', 'Fermi エネルギー', '詰め終わった高さ。温度でなく密度が決める尺度', 'definition', 'physics', ['fermi-gas']),
  c('sommerfeld-expansion', 'Sommerfeld 展開', '端の $k T$ 幅だけが効く。比熱が $T$ に比例する理由', 'technique', 'physics', ['fermi-energy']),
  c('bose-einstein-condensation', 'Bose–Einstein 凝縮', '相互作用がまったく無いのに相転移が起きる。統計だけで', 'theorem', 'physics', ['bose-einstein-distribution', 'thermodynamic-limit']),
  c('condensate-is-a-limit-artifact', '凝縮は極限で初めて出る', '有限系では基底状態の占有は連続に増える。非解析性は $N arrow.r oo$ が作る', 'viewpoint', 'physics', ['bose-einstein-condensation']),
  c('photon-gas', '光子気体', '数が保存しないので化学ポテンシャルが 0。Planck 分布になる', 'theorem', 'physics', ['bose-einstein-distribution', 'equipartition-fails-radiation']),
  c('debye-model', 'Debye 模型', '格子振動をモードとして数える。低温比熱がモードの数え方から出る', 'theorem', 'physics', ['photon-gas', 'coupled-oscillation', 'equipartition-fails-solid']),
  c('ground-state-degeneracy', '基底状態の縮退', '$T arrow.r 0$ でエントロピーが $k ln g_0$ に落ちる。第三法則の値が数え上げから出る', 'theorem', 'physics', ['boltzmann-entropy', 'third-law']),

  // 相互作用を展開する
  c('cluster-expansion', 'クラスター展開', '密度のべきで展開する。各項が図と一対一に対応する', 'technique', 'physics', ['partition-function']),
  c('virial-coefficient', 'ビリアル係数', '第 2 係数がポテンシャルの積分ひとつで書ける。状態方程式の最初の補正', 'theorem', 'physics', ['cluster-expansion']),
  c('mean-field-approximation', '平均場近似', '周りを平均で置き換える。ゆらぎを捨てているのが正体', 'technique', 'physics', ['canonical-ensemble']),
  c('van-der-waals-derived', 'van der Waals は近似の結果', '平均場から出る。実験式ではない。だから壊れる条件も分かる', 'theorem', 'physics', ['mean-field-approximation', 'virial-coefficient']),
  c('gibbs-bogoliubov', 'Gibbs–Bogoliubov 不等式', '平均場が自由エネルギーの上界を与える。差はちょうど KL 情報量なので非負', 'theorem', 'physics', ['mean-field-approximation', 'kl-divergence']),

  // 有限系に相転移は無い
  c('transfer-matrix', '転送行列', '1 次元の分配関数を行列の積に書き換える', 'technique', 'physics', ['partition-function', 'perron-frobenius']),
  c('ising-model', 'Ising 模型', '向きが二つだけの変数を最近接で結ぶ。相転移を持つ最小の模型', 'definition', 'physics', ['canonical-ensemble']),
  c('one-dimension-no-transition', '1 次元に相転移は無い', '転送行列の最大固有値が縮退しないので、自由エネルギーが解析的なまま', 'theorem', 'physics', ['transfer-matrix', 'ising-model', 'analytic-function']),
  c('lee-yang-zeros', 'Lee–Yang の零点', '有限系では $Z$ の零点が実軸を外れる。極限で実軸に寄ることが相転移である', 'theorem', 'physics', ['thermodynamic-limit', 'identity-theorem']),

  // 対称性が形を決める
  c('order-parameter', '秩序変数', '対称な相で 0、破れた相で 0 でない量。何を測るかがここで決まる', 'definition', 'physics', ['ising-model']),
  c('symmetry-breaking-in-equilibrium', '極限の順序で答えが変わる', '外場を 0 にするのと $N arrow.r oo$ が交換しない。破れとはこの非可換性である', 'theorem', 'physics', ['order-parameter', 'thermodynamic-limit']),
  c('landau-expansion', 'Landau 展開', '秩序変数のべきで自由エネルギーを展開する。対称性が許す不変式しか書けない', 'technique', 'physics', ['order-parameter', 'mean-field-approximation']),
  c('landau-irrep-classification', '書ける項は既約表現が尽くす', '秩序変数が既約表現の基底で変換する。可約なら別々の転移に割れてしまう', 'theorem', 'physics', ['landau-expansion', 'irreducible-representation', 'point-group']),
  c('landau-lifshitz-conditions', '2 次転移が起こりうる対称性は列挙できる', '三次の不変式が無いことと Lifshitz 条件。群論だけで候補が有限個に絞れる', 'theorem', 'physics', ['landau-irrep-classification']),

  // 平均場が使える次元
  c('correlation-length', '相関長', 'どこまで揃っているかの長さ。臨界点で発散する', 'definition', 'physics', ['fluctuation-is-second-derivative']),
  c('critical-exponent', '臨界指数', '発散の速さ。値そのものより、指数の間の関係のほうが強い', 'definition', 'physics', ['correlation-length']),
  c('ginzburg-criterion', 'Ginzburg の判定', 'ゆらぎの寄与を平均場の答えと比べる。**どの次元で自分の近似を壊すかが式で出る**', 'theorem', 'physics', ['mean-field-approximation', 'correlation-length']),
  c('upper-critical-dimension', '上部臨界次元', '4 より上では平均場が正しい。下では指数が変わる', 'theorem', 'physics', ['ginzburg-criterion']),
  c('mermin-wagner', 'Mermin–Wagner の定理', '2 次元以下では連続対称性が破れない。Goldstone モードのゆらぎが対数で発散する', 'theorem', 'physics', ['symmetry-breaking-in-equilibrium', 'goldstone-theorem']),
  c('kosterlitz-thouless', 'Kosterlitz–Thouless 転移', '秩序変数が無いのに転移がある。渦が対で束縛されるか解けるか', 'theorem', 'physics', ['mermin-wagner', 'de-rham-cohomology']),

  // 尺度を変えると何が残るか
  c('scaling-hypothesis', 'スケーリング仮説', '自由エネルギーが斉次だと仮定する。指数の間の関係が全部出る', 'definition', 'physics', ['critical-exponent']),
  c('block-spin', 'ブロックスピン変換', '細かいところを畳んで、長さを測り直す。結合定数が動く', 'technique', 'physics', ['scaling-hypothesis', 'ising-model']),
  c('rg-fixed-point', 'くりこみ群の不動点', '畳んでも変わらない点が臨界点。指数は不動点の周りの線形化で決まる', 'theorem', 'physics', ['block-spin']),
  c('rg-relevant-irrelevant', '固有値の符号が捨てていいものを決める', '1 より小さい方向は放っておける。書き込んだ細部が消える', 'theorem', 'physics', ['rg-fixed-point']),
  c('critical-universality', '普遍性', '次元と対称性だけで決まる。同じ不動点に流れ込むものが同じ指数を持つ', 'theorem', 'physics', ['rg-relevant-irrelevant']),
  c('epsilon-expansion', '$epsilon$ 展開', '4 次元からのずれを小さい量にする。展開の助変数が次元そのもの', 'technique', 'physics', ['upper-critical-dimension', 'rg-fixed-point']),

  // 可逆から不可逆が出たように見える
  c('bbgky-hierarchy', 'BBGKY 階層', '1 体分布の式に 2 体が出る。厳密に書くと閉じない', 'theorem', 'physics', ['liouville-theorem']),
  c('molecular-chaos', '分子的混沌の仮定', '衝突する直前に相関が無い、と置く。**時間の向きはここで入る**', 'definition', 'physics', ['bbgky-hierarchy', 'independence-probabilistic']),
  c('boltzmann-equation', 'Boltzmann 方程式', '階層を 2 体で切る。閉じた式になる代わりに可逆でなくなる', 'theorem', 'physics', ['molecular-chaos']),
  c('h-theorem', 'H 定理', '$H$ が単調に減る。可逆な力学から不可逆が出たように見える', 'theorem', 'physics', ['boltzmann-equation', 'gibbs-entropy']),
  c('loschmidt-objection', 'Loschmidt の反論', '速度を全部反転すれば戻るはず。定理は力学ではなく仮定の側から来ている', 'viewpoint', 'physics', ['h-theorem']),
  c('irreversibility-from-coarse-graining', '不可逆は捨てたことから出る', 'Gibbs エントロピーは Liouville の下で厳密に不変。増えるのは粗視化したほうだけ', 'theorem', 'physics', ['loschmidt-objection', 'liouville-theorem']),

  // ゆらぎと応答は同じもの
  c('linear-response', '線形応答', '弱く突いたときの返り方。平衡の相関関数だけで書ける', 'theorem', 'physics', ['fluctuation-is-second-derivative']),
  c('fluctuation-dissipation', 'ゆらぎと散逸の定理', '散逸の大きさが、突かないときのゆらぎで決まる。測らずに済む量が一つ増える', 'theorem', 'physics', ['linear-response']),
  c('langevin-equation', 'Langevin 方程式', '見えない自由度を、摩擦と雑音の二つに畳む。両者の大きさが結ばれている', 'definition', 'physics', ['fluctuation-dissipation']),
  c('fokker-planck', 'Fokker–Planck 方程式', '同じ過程を分布の側から書く。マルチンゲールの言葉に載る', 'theorem', 'physics', ['langevin-equation', 'martingale']),
]
