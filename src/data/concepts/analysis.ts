import type { Concept } from './types.ts'
import { c } from './types.ts'

export const analysis: readonly Concept[] = [
  // --- 解析 ----------------------------------------------------------------
  //
  // mathlib の Mathlib.Geometry は外部依存の 76 本が Analysis に向いていた
  // （Topology 39、LinearAlgebra 11）。手で書いたグラフが解析を軽く見ていた
  // ので、ここを足す。滑らかさと収束の階層が、幾何のほぼ全体を支えている。
  c('metric-space', '距離空間', '距離から位相を入れる。近さを数で測る', 'definition', 'math', ['topology-basics']),
  c('completeness', '完備性', 'Cauchy 列が収束する。位相の性質ではない', 'definition', 'math', ['metric-space']),
  c('uniform-convergence', '一様収束', '各点収束より強い。極限が連続性を保つ', 'definition', 'math', ['metric-space']),
  c('banach-space', 'Banach 空間', '完備なノルム空間', 'definition', 'math', ['completeness', 'vector-space']),
  c('banach-fixed-point', '縮小写像の原理', '完備なら不動点が一意に存在する', 'theorem', 'math', ['banach-space']),
  c('function-space', '関数空間', '関数の集合をベクトル空間として扱う', 'definition', 'math', ['banach-space', 'uniform-convergence']),
  c('frechet-derivative', 'Fréchet 微分', '無限次元での最良の線形近似', 'definition', 'math', ['banach-space', 'multivariable-calculus']),
  c('smoothness-class', '滑らかさの階層', '$C^0$、$C^k$、$C^infinity$、解析的。どこまで微分できるか', 'definition', 'math', ['multivariable-calculus']),
  c('inverse-function-theorem', '逆関数定理', '微分が可逆なら局所的に可逆。証明は縮小写像', 'theorem', 'math', ['banach-fixed-point', 'frechet-derivative']),
  c('implicit-function-theorem', '陰関数定理', '逆関数定理の言い換え。部分多様体を作る道具', 'theorem', 'math', ['inverse-function-theorem']),
  c('sard-theorem', 'Sard の定理', '臨界値は測度ゼロ。横断性の議論を支える', 'theorem', 'math', ['smoothness-class', 'measure']),
  c('distribution-theory', '超関数', '微分できない対象を、試験関数との組で扱う', 'definition', 'math', ['function-space', 'dual-space']),
  // 距離空間を要求していたが、過剰だった。o と O が要るのは「小さい」を言う
  // 手段だけで、$RR^n$ なら絶対値で足りる。距離空間の概念そのものは要らない。
  // 実際この辺のせいで、Landau 記号を置く回が距離空間を置く回より前に来る、
  // という順序の逆転が出ていた（`npm run curriculum order`）。
  c('landau-notation', 'Landau 記号', 'o と O。微分の定義に使っている', 'definition', 'math'),
  c('power-series', 'べき級数', '収束半径。項別微分してよい範囲', 'definition', 'math', ['uniform-convergence']),
  c('analytic-function', '解析関数', '各点で Taylor 級数が収束して一致する。$C^omega$', 'definition', 'math', ['power-series', 'smoothness-class']),
  c('identity-theorem', '一致の定理', '解析関数は一点の近傍で決まれば全体が決まる', 'theorem', 'math', ['analytic-function']),
  c('bump-function', '山形関数', '$C^infinity$ でだけ作れる。$1$ の分割の材料', 'technique', 'math', ['smoothness-class', 'identity-theorem']),
  c('multivariable-calculus', '多変数の微積分', '偏微分、連鎖律、重積分', 'technique', 'math', ['landau-notation']),
  c('ode-existence', '常微分方程式の解の存在と一意性', '初期値を与えれば解が一意に決まる。証明は縮小写像', 'theorem', 'math', ['multivariable-calculus', 'banach-fixed-point']),
]
