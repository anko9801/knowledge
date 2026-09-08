import type { Concept } from './types.ts'
import { c } from './types.ts'

export const computationalGeometry: readonly Concept[] = [
  // --- 計算幾何 ----------------------------------------------------------------
  //
  // **穴を埋める順ではなく、既にある定理が実例を得る順に書ける連載である。**
  // `model-change-moves-bound`、`upper-bound-theorem`、`euler-formula-planar`、
  // `vc-dimension`、`condition-number` が、それぞれここで実例を得る。
  //
  // 軸は**「下界は、問題ではなく許した操作が決める」**。
  // しかも凸包では、模型を変えずに**測る量を変えるだけ**で下界が動く ──
  // $n log n$ から $n log h$ へ動いて、しかも両方が達成される。
  //
  // 凸幾何（`convex-geometry.ts`）とは切り口を分ける。
  // **あちらは凸性から何が出るか、ここはそれを計算するのに何が要るか。**
  //
  // 持ち上げが二度出るのが、この連載の形である ── 放物線への持ち上げが、
  // 第 1 回では**下界の道具**、Delaunay では**構成の道具**になる。
  c('orientation-predicate', '向き判定', '三点が左回りか右回りか。**行列式の符号だけ。**計算幾何の算法は、ほぼこれしか使わない', 'definition', 'cs', ['determinant', 'convex-hull']),
  c('hull-lower-bound', '凸包は $Omega(n log n)$ かかる', '**放物線の上に載せると、凸包の順序がソートの答えになる。**ソートの下界がそのまま移る', 'theorem', 'cs', ['orientation-predicate', 'comparison-sort-bound']),
  c('output-sensitive-bound', '出力の大きさを数に入れると、下界が動く', '**$Omega(n log h)$ になり、しかも達成される**（Chan）。模型は変えていない ── 測る量を変えただけ', 'theorem', 'cs', ['hull-lower-bound', 'model-change-moves-bound']),
  c('same-problem-two-bounds', '同じ問題に、二つの正しい下界がある', '**どちらが真かではない。**何を入力の大きさと数えるかを決めた時点で、答えが決まっている', 'viewpoint', 'cs', ['output-sensitive-bound']),
  c('geometric-duality', '点と直線を入れ替える', '**接続関係と上下の順序が保たれる。**凸包が包絡線になり、問題が別の問題に化ける', 'definition', 'cs', ['orientation-predicate', 'dual-space']),
  c('halfplane-intersection-is-a-hull', '半平面の共通部分は、双対では凸包である', '**線形計画の実行可能領域を作る問題が、凸包の問題になる**', 'theorem', 'cs', ['geometric-duality', 'polytope-two-descriptions']),
  c('arrangement-complexity', '直線の配置は、二次のセルを作る', '**$n$ 本で $Theta(n^2)$。**ただし一本のゾーンは $O(n)$ に収まる', 'theorem', 'cs', ['geometric-duality', 'euler-formula-planar']),
  c('dimension-jumps-at-four', '次元四で、複雑さが跳ぶ', '半空間 $n$ 個の共通部分の頂点数が $O(n^(floor(d\\/2)))$。**三次元までは線形、四次元から二乗**', 'theorem', 'cs', ['halfplane-intersection-is-a-hull', 'upper-bound-theorem']),

  // 近さの構造
  c('voronoi-diagram', 'Voronoi 図', '**どの点がいちばん近いかで平面を分ける。**セルは凸である', 'definition', 'cs', ['convex-hull', 'metric-space']),
  c('voronoi-size-from-euler', '大きさが、Euler の公式だけで決まる', '**頂点の次数が三であることと多面体公式から、頂点が $2n - 4$。**幾何を一つも使わない', 'theorem', 'cs', ['voronoi-diagram', 'euler-formula-planar', 'planar-edge-bound']),
  c('delaunay-is-a-projected-hull', 'Delaunay 三角形分割は、下凸包の射影である', '**放物面へ持ち上げるだけ。**距離の問題が、一次元上げると凸性の問題になる', 'theorem', 'cs', ['voronoi-diagram', 'hull-lower-bound']),
  c('lifting-appears-twice', '持ち上げが、二度出てくる', '**第 1 回では下界を証明する道具、ここでは構成する道具。**同じ操作が逆向きに効く', 'viewpoint', 'cs', ['delaunay-is-a-projected-hull', 'same-split-again']),
  c('empty-circle-property', '空円性質', 'Delaunay の辺であることと、その二点を通る空円が在ることが同値', 'theorem', 'cs', ['delaunay-is-a-projected-hull']),
  c('delaunay-contains-emst', '最小全域木が、その中に含まれる', '**辺の候補が $O(n)$ に絞れるので、Euclid 最小全域木が $O(n log n)$ で出る**', 'theorem', 'cs', ['empty-circle-property', 'greedy-optimality']),
  c('delaunay-maximizes-the-min-angle', '最小角を最大にする', '**痩せた三角形を避ける。**数値計算の網としてこれが選ばれる理由', 'theorem', 'cs', ['empty-circle-property']),
  c('not-everything-comes-from-it', '最小重み三角形分割は、そこから出ない', '**近さの構造で解ける問題と、解けない問題の境目**', 'viewpoint', 'cs', ['delaunay-contains-emst']),

  // 無作為化と、次元がどこに入るか
  c('backward-analysis', '後ろ向き解析', '**最後に入れた点が、どれであってもよかったと考える。**期待値が数え上げだけで出る', 'technique', 'cs', ['randomized-complexity', 'expectation']),
  c('lp-in-fixed-dimension-is-linear', '次元が定数なら、線形計画は期待線形時間', '**単体法とは別の算法。**証明は後ろ向き解析', 'theorem', 'cs', ['backward-analysis', 'linear-program']),
  c('the-constant-is-factorial', 'ただし定数が階乗で増える', '**次元は消えたのではなく、定数へ移った。**どこに入るかを見ないと「線形」に騙される', 'viewpoint', 'cs', ['lp-in-fixed-dimension-is-linear']),
  c('epsilon-net', '$epsilon$ ネット', '**VC 次元が有限なら、標本の大きさが点の個数に依らない。**幾何でない量が、幾何の計算量を決める', 'theorem', 'cs', ['vc-dimension', 'sample-complexity-from-vc']),
  c('net-versus-sample', 'ネットと標本では、要る大きさが違う', '**$1\\/epsilon$ の対数倍で足りるか、$1\\/epsilon^2$ 要るか。**保証したいものが違う', 'theorem', 'cs', ['epsilon-net']),

  // 述語が壊れると、算法が壊れる
  c('degenerate-input', '退化した入力', '三点が同一直線、四点が同一円周。**一般の位置という仮定が、証明では暗黙に使われている**', 'definition', 'cs', ['orientation-predicate']),
  c('symbolic-perturbation', '記号的摂動', '**入力を無限小だけずらしたことにする。**退化を場合分けせずに消す', 'technique', 'cs', ['degenerate-input']),
  c('predicates-are-discrete', '述語の値は離散である', '**符号が三通りしかないので、誤差が「小さい」では済まない。**後退誤差の言葉が使えない', 'viewpoint', 'cs', ['orientation-predicate', 'backward-error']),
  c('wrong-sign-breaks-the-algorithm', '符号を一つ間違えると、答えではなく算法が壊れる', '**無限ループ、多様体でない出力、異常終了。**数値解析の「精度が落ちる」とは別の壊れ方', 'theorem', 'cs', ['predicates-are-discrete', 'error-splits-in-two']),
  c('exact-predicates-are-the-fix', '直し方は、述語だけを厳密にすること', '**全部を多倍長にする必要は無い。**符号が確定するまで精度を上げる（適応的評価）', 'technique', 'cs', ['wrong-sign-breaks-the-algorithm', 'interval-arithmetic']),
]
