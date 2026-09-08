import type { Concept } from './types.ts'
import { c } from './types.ts'

export const numericalAnalysis: readonly Concept[] = [
  // --- 数値解析 ----------------------------------------------------------------
  //
  // 軸は**「悪い答えは問題のせいか、算法のせいか」が定理で決まる**こと。
  // 線形方程式では 条件数 × 単位丸め、常微分方程式では 剛性比 × 安定性領域。
  // **同じ分解が二度出る**（`docs/surveys.md`）。
  //
  // 丸めは `rounding` ではない ── そちらは線形計画の丸めで、家が別。
  c('unit-roundoff', '単位丸め', '1 と、その次の数との隔たりの半分。**計算機の性質が、この一つの数だけに入る。**線形計画の丸め（`rounding`）とは無関係', 'definition', 'math', ['floating-point']),
  c('backward-error', '後退誤差', '「近い答え」ではなく「近い問題の厳密な答え」と見る。**算法の質を、問題の質から切り離す唯一の道具**', 'viewpoint', 'math', ['unit-roundoff']),
  c('condition-number', '条件数', '入力の相対誤差が、出力でどれだけ拡大されるか。**問題の性質で、算法とは無関係**', 'definition', 'math', ['operator-norm', 'linear-map']),
  c('error-splits-in-two', '誤差は問題と算法に分かれる', '前進誤差 $lt.eq$ 条件数 $times$ 後退誤差。**悪い答えの原因が二つに切り分けられる**', 'theorem', 'math', ['condition-number', 'backward-error']),
  c('stability-is-not-accuracy', '安定な算法でも、答えが悪いことがある', '後退安定でも条件数が大きければ前進誤差は大きい。**算法を替えても救えない**', 'viewpoint', 'math', ['error-splits-in-two']),
  c('cancellation-reveals-error', '桁落ちは誤差を作らない', '引き算そのものは正確である。**既に在った誤差が、答えが小さくなったせいで相対的に大きく見える**だけ', 'theorem', 'math', ['unit-roundoff']),

  // 線形方程式
  c('lu-factorization', 'LU 分解', '前進消去を行列の積として書き直したもの。**右辺が変わっても分解は使い回せる**', 'technique', 'math', ['linear-map', 'determinant']),
  c('pivoting-is-necessary', '枢軸選択は速さのためではない', '部分枢軸なしでは後退安定でない。**数学的には同じ操作が、有限桁では別物になる**', 'theorem', 'math', ['lu-factorization', 'backward-error']),
  c('cholesky', 'Cholesky 分解', '正定値対称なら枢軸選択が要らない。**構造が丸めを止める**', 'theorem', 'math', ['lu-factorization', 'quadratic-form']),
  c('qr-least-squares', 'QR による最小二乗', '正規方程式は条件数を二乗する。**同じ答えを別の道で計算すると、精度が変わる**', 'technique', 'math', ['inner-product', 'condition-number']),
  c('svd-numerical-rank', '数値的階数', '厳密には満階数でも、特異値が丸めの下に沈めば階数を失っている。**階数は連続量になる**', 'viewpoint', 'math', ['singular-value-decomposition', 'unit-roundoff']),
  c('krylov-subspace', 'Krylov 部分空間', '行列を掛けることしか許さないと、探せる空間が一つに決まる', 'definition', 'math', ['vector-space', 'linear-map']),
  c('conjugate-gradient-rate', '共役勾配の収束は条件数で決まる', '反復回数が条件数の平方根に比例する。**前処理は条件数を下げるためにある**', 'theorem', 'math', ['krylov-subspace', 'condition-number']),

  // 補間と求積
  c('polynomial-interpolation-unique', '補間多項式は一意', '$n+1$ 点を通る $n$ 次多項式がちょうど一つ。**Vandermonde 行列が正則**', 'theorem', 'math', ['polynomial-ring', 'determinant']),
  c('runge-phenomenon', 'Runge 現象', '等間隔の点を増やすと、端で振動が発散する。**点を増やせば良くなるとは限らない**', 'theorem', 'math', ['polynomial-interpolation-unique']),
  c('chebyshev-nodes', 'Chebyshev 点', '端を詰めた配置にすると発散が消える。**補間の可否は関数ではなく点の取り方が決めていた**', 'theorem', 'math', ['runge-phenomenon']),
  c('spline-tradeoff', 'スプラインが避けているもの', '低次を繋ぐと振動しない。**滑らかさを局所性と交換している**', 'viewpoint', 'math', ['chebyshev-nodes']),
  c('gauss-quadrature', 'Gauss 求積', '$n$ 点で $2n-1$ 次まで厳密。**点も重みも直交多項式の零点として決まる**', 'theorem', 'math', ['polynomial-interpolation-unique', 'inner-product']),
  c('quadrature-needs-smoothness', '求積の速さは滑らかさが決める', '滑らかなら指数的に速く、折れ目が一つ在れば冪でしか縮まない。**次数を上げても関数が追いつかない**', 'theorem', 'math', ['gauss-quadrature']),

  // 常微分方程式
  c('local-vs-global-error', '局所誤差と全体誤差', '一歩の誤差と、積み上がった誤差は次数が一つ違う。**足すだけでは全体誤差は出ない**', 'definition', 'math', ['ode-existence']),
  c('dahlquist-equivalence', 'Dahlquist の同値定理', '整合性と零安定性を合わせたものが収束と同値。**「一歩が正しい」だけでは収束しない**', 'theorem', 'math', ['local-vs-global-error']),
  c('stability-region', '安定性領域', '刻み幅と固有値の積が、この集合に入っている間だけ発散しない。**算法の側の性質**', 'definition', 'math', ['dahlquist-equivalence', 'matrix-exponential']),
  c('stiffness', '剛性', '時定数の比が大きいこと。**問題の側の性質で、精度ではなく安定性が刻み幅を縛る**', 'definition', 'math', ['stability-region']),
  c('same-split-again', '同じ分解が二度出る', '線形方程式は 条件数 $times$ 単位丸め、常微分方程式は 剛性比 $times$ 安定性領域。**どちらも問題 $times$ 算法**', 'viewpoint', 'math', ['stiffness', 'error-splits-in-two']),
  c('dahlquist-second-barrier', 'Dahlquist の第二障壁', '$A$ 安定な線形多段法は 2 次を超えられない。**望みを全部かなえる算法は無い、が定理として出る**', 'theorem', 'math', ['stability-region']),
  c('symplectic-integrator', 'シンプレクティック積分子', '各歩がシンプレクティック写像になる算法。**エネルギーが増えも減りもしない**', 'technique', 'math', ['symplectic-form', 'stability-region']),
  c('backward-error-for-dynamics', '長時間の計算が合う理由', '近い Hamiltonian の厳密解を追っている。**後退誤差の考えが、そのまま力学に効く**', 'theorem', 'math', ['symplectic-integrator', 'backward-error']),

  // 何が保証で、何が経験か
  c('convergence-is-not-verification', '収束したことは、正しいことの証明ではない', '残差が小さくても、条件数が大きければ解は遠い。**判定に使う量が何を測っているかを言う**', 'viewpoint', 'math', ['stability-is-not-accuracy']),
  c('interval-arithmetic', '区間演算', '誤差を包む区間ごと計算する。**保証は付くが、区間が指数的に膨らむ**', 'technique', 'math', ['unit-roundoff']),

  // --- 近似理論のうち、ここが家であるもの --------------------------------------
  //
  // 独立した連載としては ○（6〜8 回）だった。求積と条件数の側は
  // **この連載の軸（悪い答えは問題のせいか算法のせいか）そのもの**なので、
  // 二度書かずにここへ足す。最良近似の一意性の側は別に立てる。
  c('exactness-is-not-speed', '厳密次数は、速さの指標ではない', '**$n$ 次までしか厳密でない Clenshaw–Curtis が、解析的な関数では Gauss と同じ速さで収束する。**次数を見て選ぶと外す', 'theorem', 'math', ['gauss-quadrature', 'quadrature-needs-smoothness']),
  c('newton-cotes-diverges', '等間隔点の求積は、解析的な関数でも発散する', '**重みの符号が交代して絶対値の和が発散する。**Runge 現象の求積版', 'theorem', 'math', ['runge-phenomenon', 'exactness-is-not-speed']),
  c('conditioning-is-a-property-of-the-basis', '条件の悪さは、基底の性質である', '**同じ多項式でも、単項式基底なら指数的に悪く、Chebyshev 基底なら悪くない。**「多項式は不安定」は基底の話だった', 'theorem', 'math', ['condition-number', 'chebyshev-nodes']),
  c('interpolation-is-nearly-optimal', '計算できる補間は、計算できない最適解に近い', '**Chebyshev 点での補間が、最良近似の $log n$ 倍以内。**最適を求める値打ちが、そこまでしかない', 'theorem', 'math', ['chebyshev-nodes', 'conditioning-is-a-property-of-the-basis']),
]
