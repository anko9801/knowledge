import type { Concept } from './types.ts'
import { c } from './types.ts'

export const control: readonly Concept[] = [
  // --- 制御 --------------------------------------------------------------------
  //
  // **2026-08-27 に一度削除した。**状態空間・可制御性・Kalman の 7 概念だけでは
  // 「線形代数の応用」で、軸が無かった。
  //
  // **軸は Åström–Murray 第 14 章の側にある** ── 押さえた分だけどこかが持ち上がる。
  // 対数感度の面積が保存する（Bode の積分定理）。本人が
  // 「Bode の積分公式という保存量があり、ある周波数で感度を下げると
  // 別の周波数で上がることを意味する」と書いている。
  c('state-space-model', '状態空間表現', '内部の変数を並べて一階の方程式にする。**同じ入出力を持つ内部は一つに決まらない**', 'definition', 'engineering', ['linear-map', 'ode-existence']),
  c('linearization-at-equilibrium', '平衡点まわりの線形化', '平衡点の近くでは、非線形系の安定性が Jacobi 行列だけで決まる', 'technique', 'engineering', ['multivariable-calculus', 'state-space-model']),
  c('matrix-exponential', '行列指数関数', '線形系の解が閉じる。Jordan 形に分けると各成分が見える', 'theorem', 'engineering', ['jordan-form', 'state-space-model']),
  c('eigenvalue-stability', '固有値による安定判定', '漸近安定であることと、全固有値の実部が負であることが同値', 'theorem', 'engineering', ['matrix-exponential', 'characteristic-polynomial']),
  c('lyapunov-second-method', 'Lyapunov の第二法', '**解かずに安定性が言える**。正定値な関数が減り続けるなら安定', 'theorem', 'engineering', ['quadratic-form', 'state-space-model']),
  c('krasovski-lasalle', 'Krasovski–LaSalle の原理', '減りが止まる集合に軌道が留まれないなら漸近安定。半定値でも漸近性が出る', 'theorem', 'engineering', ['lyapunov-second-method']),
  c('reachability-rank-condition', '可到達性の階数条件', '可到達行列が正則であることと、任意の状態へ運べることが同値。**所要時間は条件に現れない**', 'theorem', 'engineering', ['state-space-model', 'determinant']),
  c('eigenvalue-assignment', '極配置', '到達可能なら、閉ループの固有値を任意の位置に置ける', 'theorem', 'engineering', ['reachability-rank-condition', 'characteristic-polynomial']),
  c('observability-rank-condition', '可観測性の階数条件', '出力の履歴から初期状態が決まる条件も、同じ形の階数条件になる', 'theorem', 'engineering', ['state-space-model', 'dual-map']),
  c('kalman-decomposition', 'Kalman 分解', '状態空間が四つに割れ、**伝達関数は両方成り立つ部分しか見ていない**。同じ入出力を持つ別の内部が存在する', 'theorem', 'engineering', ['reachability-rank-condition', 'observability-rank-condition']),
  c('separation-principle', '分離定理', '制御器と観測器の固有値は独立に置ける。二つを別々に設計してよい', 'theorem', 'engineering', ['eigenvalue-assignment', 'kalman-decomposition']),
  c('kalman-filter', 'Kalman フィルタ', '雑音を Gauss と置くと、最適な推定器が一意に決まる', 'theorem', 'engineering', ['conditional-expectation', 'observability-rank-condition']),
  c('transfer-function', '伝達関数', '入出力だけを見る。内部を捨てる代わりに、極と零点だけで振る舞いが読める', 'definition', 'engineering', ['fourier-transform', 'analytic-function']),
  c('nyquist-criterion', 'Nyquist の判定', '閉ループ極の個数が、開ループ軌跡の巻きつき数で決まる。**証明は偏角原理**', 'theorem', 'engineering', ['transfer-function', 'argument-principle']),
  c('small-gain-theorem', '小ゲイン定理', 'ループの利得が 1 未満なら安定。線形性も要らない', 'theorem', 'engineering', ['nyquist-criterion', 'banach-fixed-point']),
  c('bode-gain-phase-relation', 'ゲインと位相の関係', '最小位相なら、位相がゲイン曲線で決まる。傾きが決まれば位相も決まる', 'theorem', 'engineering', ['transfer-function', 'causality-is-analyticity']),
  c('sensitivity-complementarity', '感度と相補感度の和は 1', '外乱の抑圧と雑音の抑圧は、**代数的に**同時には良くできない', 'theorem', 'engineering', ['transfer-function']),
  c('bode-integral', 'Bode の積分定理', '**対数感度の面積が保存する。**右半面に極が無ければ和がゼロ ── 押さえた分だけどこかが持ち上がる', 'theorem', 'engineering', ['sensitivity-complementarity', 'all-pass-factorization']),
  c('all-pass-factorization', '全域通過と最小位相に分ける', '右半面の零点を Blaschke 積として括り出す。**大きさを変えずに位相だけを持つ因子**が残る', 'technique', 'engineering', ['transfer-function', 'analytic-function']),
  c('two-bode-theorems-are-different', '二つの Bode の定理は、別物である', '利得位相関係は Titchmarsh を $ln L$ に当てたもので、**最小位相を仮定する。**積分定理は右半面の零点と極を数えるので、**まさにそれを仮定しない**', 'viewpoint', 'engineering', ['bode-gain-phase-relation', 'bode-integral']),
  c('bode-integral-is-an-equality', '積分定理は不等式ではない', '**保存則である。**「押さえた分だけ持ち上がる」はその読み替えで、不確定性関係の仲間ではない ── 証明に内積も共役対も出てこない', 'viewpoint', 'engineering', ['bode-integral']),
  c('rhp-zero-limits-bandwidth', '右半面零点が帯域を縛る', '非最小位相成分の位相遅れが余裕を食い尽くす帯域は取れない', 'theorem', 'engineering', ['bode-gain-phase-relation', 'bode-integral']),
  c('strong-stabilizability', '安定な制御器が要る条件', '安定な制御器で安定化できるかは、右半面の極と零点の並び順だけで決まる', 'theorem', 'engineering', ['transfer-function']),
  c('internal-model-principle', '内部モデル原理', '消したい信号の模型を制御器の中に持たないと、定常偏差は消えない', 'theorem', 'engineering', ['transfer-function', 'eigenvalue-assignment']),
]
