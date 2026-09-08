import type { Concept } from './types.ts'
import { c } from './types.ts'

export const harmonicAnalysis: readonly Concept[] = [
  // --- 調和解析 ----------------------------------------------------------------
  //
  // **表現論との線を、最初に引かないと成立しない。**
  // `fourier-is-representation-theory` が答えているのは「なぜ指数関数なのか」で、
  // 答えは群の構造（可換群の既約表現が一次元）。ここが答えるのは
  // **「その分解を作用素として使ったとき、$L^p$ で有界か」**である。
  //
  // 決定的なのは、**表現論の側は $p = 2$ から一歩も出ないこと。**
  // Peter--Weyl も Plancherel も内積の主張で、直交性で閉じる。
  // Hausdorff--Young から先には内積が無く、補間・被覆補題・停止時刻・
  // Kakeya 集合という**別の道具しか使わない**。
  //
  // 重複に注意する場所が三つある。
  // 1. **`causality-is-analyticity` と Hilbert 変換は同じ作用素**である。
  //    あちらは正則接続の側、ここは $L^p$ 有界性の側だけを書く
  // 2. **不確定性は分散型が四つ埋まっている。**台の話だけが新しい
  // 3. `heat-smoothing` は乗数のいちばん易しい例として引くだけにする
  c('lp-boundedness-is-the-question', '問いは、作用素が $L^p$ で有界かである', '**$p = 2$ なら直交性で片が付く。**そこを出ると内積が無くなり、別の道具が要る', 'viewpoint', 'math', ['lp-space', 'fourier-is-representation-theory']),
  c('riesz-thorin', 'Riesz–Thorin の補間', '**両端で有界なら、間の $p$ で全部有界。**定数が対数凸になる。証明は複素解析の最大値原理', 'theorem', 'math', ['lp-boundedness-is-the-question', 'maximum-modulus']),
  c('marcinkiewicz-interpolation', '弱い評価からでも、間は出る', '端点で**弱型**しか無くても内部では強型になる。**分布関数を高さで切るだけ**', 'theorem', 'math', ['riesz-thorin']),
  c('hausdorff-young', 'Hausdorff–Young の不等式', '$1 <= p <= 2$ で Fourier 変換が有界。**$p > 2$ では偽** ── 像が関数ですらなくなる', 'theorem', 'math', ['riesz-thorin', 'fourier-transform']),

  // 収束が壊れる場所
  c('convergence-is-uniform-boundedness', '各点収束は、作用素の一様有界性と同値である', '**収束の問題が、作用素ノルムの問題に翻訳される**', 'theorem', 'math', ['uniform-boundedness', 'fourier-series-is-a-basis-expansion']),
  c('dirichlet-kernel-grows', 'Dirichlet 核のノルムは対数で増える', '**核が正でないことが原因。**これ一つで、次の結論が出る', 'theorem', 'math', ['convergence-is-uniform-boundedness']),
  c('divergent-fourier-series-exist', 'Fourier 級数が発散する連続関数が在る', '**一つも構成せずに存在が言える。**どの関数かは言えない', 'theorem', 'math', ['dirichlet-kernel-grows', 'baire-category']),
  c('gibbs-phenomenon', 'Gibbs 現象', '跳びのそばで部分和が行き過ぎ、**項を増やしても超過の割合が消えない。**値が積分で書ける', 'theorem', 'math', ['dirichlet-kernel-grows']),
  c('positive-kernels-fix-it', '核が正なら、全部戻る', 'Cesàro 平均を取ると一様収束し、Gibbs も消える（Fejér）。**変えたのは核の正値性だけ**', 'theorem', 'math', ['gibbs-phenomenon', 'uniform-convergence']),
  c('weierstrass-from-fejer', 'Weierstrass の近似定理が、そこから出る', '**三角多項式で一様近似できる。**近似の存在が、核の正値性から', 'theorem', 'math', ['positive-kernels-fix-it']),
  c('carleson-theorem', 'ほとんど至る所では、収束する', '$p > 1$ で真、$p = 1$ で偽。**各点で失敗する集合が測度 0 に抑えられる**', 'theorem', 'math', ['convergence-is-uniform-boundedness', 'maximal-function']),

  // 極大関数 ── 幾何だけから出る
  c('maximal-function', 'Hardy–Littlewood 極大関数', '球で平均を取って、その上限を見る。**弱 $(1,1)$ にしかならない**', 'definition', 'math', ['lp-boundedness-is-the-question', 'measure']),
  c('vitali-covering', 'Vitali の被覆補題', '**重なった球から、交わらない部分族を取れる。**幾何だけで、解析を一つも使わない', 'theorem', 'math', ['maximal-function']),
  c('lebesgue-differentiation', 'Lebesgue の微分定理', '**「ほとんど至る所」の主張が、極大作用素の評価と同じものになる**', 'theorem', 'math', ['vitali-covering', 'marcinkiewicz-interpolation']),

  // 特異積分
  c('hilbert-transform-lp', 'Hilbert 変換の $L^p$ 有界性', '$L^2$ は乗数の絶対値が 1 だから一行。**$1 < p < oo$ が M. Riesz で、両端では偽**', 'theorem', 'math', ['hausdorff-young', 'causality-is-analyticity']),
  c('same-operator-two-faces', 'これは因果律の定理と、同じ作用素である', '**片方は上半平面への正則接続、片方は乗数の絶対値。**Kramers–Kronig と同じものを別の顔で見ている', 'viewpoint', 'math', ['hilbert-transform-lp', 'kramers-kronig']),
  c('calderon-zygmund-decomposition', 'Calderón–Zygmund 分解', '**$L^1$ の関数が、有界な部分と平均 0 の塊の和に分かれる。**停止時刻で二進立方体を切る', 'technique', 'math', ['maximal-function', 'vitali-covering']),
  c('cz-theorem', '核の条件だけで、$L^p$ 全部が出る', 'サイズと滑らかさ、そして $L^2$ 有界性を仮定すると、$1 < p < oo$ が従う', 'theorem', 'math', ['calderon-zygmund-decomposition', 'marcinkiewicz-interpolation']),
  c('bmo-replaces-l-infinity', '端点では、$L^oo$ が BMO に置き換わる', '**$p = oo$ で壊れるのを、行き先を変えて拾い直す**（John–Nirenberg）', 'theorem', 'math', ['cz-theorem']),
  c('t1-theorem', '$L^2$ 有界性の側にも、条件が付く', '**核の条件だけでは $L^2$ が出ない。**$T1$ 定理が、残っていた仮定を検証できる条件に直す', 'theorem', 'math', ['bmo-replaces-l-infinity']),

  // 乗数 ── 幾何が解析を否定する
  c('multiplier-problem', '乗数', '**$L^2$ では $L^oo$ に尽きるが、$p != 2$ では真に狭い。**どれが乗数かが問題になる', 'definition', 'math', ['hausdorff-young', 'heat-smoothing']),
  c('littlewood-paley', 'Littlewood–Paley 分解', '周波数を二進の帯に切ると、**$L^p$ ノルムが二乗和で書ける**', 'theorem', 'math', ['multiplier-problem', 'concentration-inequality']),
  c('mikhlin-condition', '導関数の減衰だけで、乗数と分かる', '**核を見ずに判定できる**（Hörmander–Mikhlin）', 'theorem', 'math', ['littlewood-paley', 'cz-theorem']),
  c('ball-is-not-a-multiplier', '球の指示関数は、乗数ではない', '**$p != 2$ で偽**（Fefferman）。だから高次元の球状部分和は $L^p$ で収束しない', 'theorem', 'math', ['multiplier-problem', 'besicovitch-set']),
  c('besicovitch-set', '測度 0 なのに、全ての向きの線分を含む集合がある', '**幾何の対象が、解析の否定を出す。**これが上の証明の中身', 'theorem', 'math', ['measure', 'hausdorff-dimension']),
  c('bochner-riesz-open', '球を丸めると、どこまで許せるか', '**次元と $p$ で決まる境界があり、三次元以上は未解決**', 'viewpoint', 'math', ['ball-is-not-a-multiplier']),

  // Poisson 総和 ── 一行から四つ出る
  c('poisson-summation', 'Poisson 総和公式', '**格子の上の和が、双対格子の上の和に等しい。**周期化して Fourier 級数を書くだけ', 'theorem', 'math', ['fourier-series-is-a-basis-expansion', 'point-lattice']),
  c('sampling-is-a-corollary', '標本化定理は、その系である', '**折り返しは、双対格子が重なることそのもの**', 'theorem', 'math', ['poisson-summation', 'sampling-theorem']),
  c('theta-and-functional-equation', '$zeta$ の関数等式が、そこから出る', '**Gauss 核に当てると $theta$ の変換則が出て、解析接続だけでは出なかった等式が付く**', 'theorem', 'math', ['poisson-summation', 'zeta-analytic-continuation']),
  c('packing-bound-from-summation', '球充填の上界も、そこから出る', '**正定値性を使うと線形計画になる**（Cohn–Elkies）。八次元と二十四次元はこれで解けた', 'theorem', 'math', ['poisson-summation', 'sphere-packing-density']),
  c('support-uncertainty', '台の側の不確定性', '**両方の台が有限測度なら、関数は 0。**既存の四つは全部「分散」の話で、これは「台」の話', 'theorem', 'math', ['poisson-summation', 'entropic-uncertainty']),

  // 曲率が効く
  c('restriction-needs-curvature', '曲率があると、測度 0 の上でも値が持てる', '**$L^2$ の関数は本来そんなことができない。**平面では偽で、球面では真', 'theorem', 'math', ['hausdorff-young', 'sectional-curvature']),
  c('restriction-implies-kakeya', '制限予想は、Kakeya 予想を含む', '**三次元の Kakeya は 2025 年に解けた。**制限のほうは三次元以上で未解決', 'viewpoint', 'math', ['restriction-needs-curvature', 'besicovitch-set']),
]
