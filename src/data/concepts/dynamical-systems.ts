import type { Concept } from './types.ts'
import { c } from './types.ts'

export const dynamicalSystems: readonly Concept[] = [
  // --- 力学系とカオス ----------------------------------------------------------
  //
  // **エルゴード理論は三つに割る**（`docs/surveys.md`）。
  // 「時間平均は必ず収束する」（Birkhoff。ここ）と、
  // 「その極限が位相平均に等しい」（要請。統計力学）を一つの概念に潰すと、
  // **`observable` を有限次元スペクトル定理に繋いでいたのと同じ失敗**になる。
  //
  // **Feigenbaum はくりこみ群である。** 倍加作用素の双曲的固定点で、
  // 単位円の外に出る固有値がちょうど一つ。粗視化写像・固定点・線形化・
  // relevant な方向の数、が Wilson の骨格と一字一句同じ。
  //
  // 名前の衝突: エルゴードのほうは `birkhoff-ergodic-theorem`
  // （`birkhoff-theorem` は一般相対論の球対称真空解）。
  c('flow-and-map', '流れと写像', '連続時間と離散時間。**Poincaré 断面で片方がもう片方になる**ので、離散のほうだけ調べれば足りることが多い', 'definition', 'math', ['ode-existence']),
  c('phase-portrait', '相図', '解を一本ずつ描かず、軌道の集まりの形を見る。**解けない方程式でも描ける**', 'viewpoint', 'math', ['flow-and-map']),
  c('hartman-grobman', 'Hartman–Grobman の定理', '双曲的な平衡点の近くでは、非線形系と線形化が位相共役。**固有値が虚軸に乗っていないことだけが条件**', 'theorem', 'math', ['phase-portrait', 'eigenvalue-stability']),
  c('center-manifold', '中心多様体', '虚軸に乗った方向だけを残すと、次元が落ちた系になる。**分岐は全部この上で起きる**', 'theorem', 'math', ['hartman-grobman']),
  c('poincare-bendixson', 'Poincaré–Bendixson の定理', '平面では、有界な軌道は平衡点か閉軌道に行き着く。**カオスは 2 次元には入らない**', 'theorem', 'math', ['phase-portrait', 'topology-basics']),
  c('dimension-three-is-the-threshold', 'カオスに要る次元は 3', '平面で閉じるのは Jordan 曲線定理が軌道の交差を禁じるから。**次元が制約を作っている**', 'viewpoint', 'math', ['poincare-bendixson']),
  c('structural-stability', '構造安定性', '方程式を少し変えても相図が変わらないこと。**「解が安定」とは別の概念**', 'definition', 'math', ['hartman-grobman']),

  // 分岐
  c('bifurcation', '分岐', '助変数を動かすと、平衡点の個数か安定性が変わる点', 'definition', 'math', ['center-manifold']),
  c('saddle-node-transcritical-pitchfork', '一次元の分岐は三つに尽きる', '中心多様体に落とすと、標準形が有限個。**何が起きるかは、どの対称性を課したかで決まる**', 'theorem', 'math', ['bifurcation']),
  c('hopf-bifurcation', 'Hopf 分岐', '一対の固有値が虚軸を横切ると、閉軌道が生まれる。**振動が「始まる」瞬間の唯一の一般形**', 'theorem', 'math', ['bifurcation']),
  c('period-doubling-cascade', '周期倍分岐の連鎖', '周期が 2 倍ずつ増える分岐が、有限の助変数値に集積する', 'theorem', 'math', ['bifurcation']),
  c('feigenbaum-constant', 'Feigenbaum 定数', '**分岐の間隔の比が、写像の形に依らない値に収束する。**二次の極大を持つことしか使っていない', 'theorem', 'math', ['period-doubling-cascade']),
  c('doubling-operator', '倍加作用素', '写像を二回合成して縮尺を直す操作。**これが粗視化写像そのもの**', 'definition', 'math', ['feigenbaum-constant']),
  c('feigenbaum-is-rg', 'Feigenbaum はくりこみ群である', '倍加作用素の双曲的固定点で、**単位円の外に出る固有値がちょうど一つ。それが $delta$**。余次元 1 が「一つ調整すれば届く」に対応する', 'viewpoint', 'math', ['doubling-operator', 'wilsonian-renormalization']),
  c('universality-needs-no-physics', '普遍性は物理を必要としない', '同じ骨格が、粒子も場も持たない一次元写像で立つ。**普遍性が言っているのは、細部が固定点の近傍で減衰することだけ**', 'viewpoint', 'math', ['feigenbaum-is-rg']),
  c('sharkovskii', 'Sharkovskii の定理', '周期の間に順序が在り、周期 3 が在れば全部の周期が在る。**連続性だけから出る**', 'theorem', 'math', ['flow-and-map']),

  // カオス
  c('sensitive-dependence', '初期値鋭敏性', '近い二点が指数的に離れる。**決定論と予測可能性が別だと分かる**', 'definition', 'math', ['flow-and-map', 'metric-space']),
  c('lyapunov-exponent', 'Lyapunov 指数', '離れる速さの平均。**正であることが、カオスの操作的な定義に使われる**', 'definition', 'math', ['sensitive-dependence']),
  c('horseshoe', '馬蹄写像', '引き伸ばして折り返す。**Cantor 集合上の記号力学と同型で、周期軌道が数えられる**', 'definition', 'math', ['sensitive-dependence', 'cantor-theorem']),
  c('symbolic-dynamics', '記号力学', '軌道を記号列に翻訳する。**力学の問いが、文字列の組合せ論の問いになる**', 'technique', 'math', ['horseshoe']),
  c('homoclinic-tangle', 'ホモクリニック絡み', '安定多様体と不安定多様体が一度交われば無限回交わる。**馬蹄がそこに埋まっている**', 'theorem', 'math', ['horseshoe']),
  c('strange-attractor', 'ストレンジアトラクタ', '体積が縮むのに、その中で伸びている集合。**縮小と伸長が両立できる**', 'definition', 'math', ['lyapunov-exponent', 'hausdorff-dimension']),
  c('hausdorff-dimension', 'Hausdorff 次元', '被覆の大きさの冪で測る次元。**整数とは限らない**', 'definition', 'math', ['measure', 'metric-space']),
  c('predictability-horizon', '予測の限界は対数でしか伸びない', '初期精度を 10 倍にしても、読める時間は Lyapunov 時間ぶんしか延びない。**測り直しでは解決しない**', 'theorem', 'math', ['lyapunov-exponent']),

  // 保存系とエルゴード
  c('measure-preserving-map', '測度を保つ写像', '体積を変えない変換。**Liouville の定理が、Hamilton 系をここに入れる**', 'definition', 'math', ['measure', 'flow-and-map']),
  c('poincare-recurrence', 'Poincaré の再帰定理', '有限測度なら、ほとんど全ての点がいくらでも近くに戻る。**時間の向きを一つも仮定していない**', 'theorem', 'math', ['measure-preserving-map']),
  c('birkhoff-ergodic-theorem', 'Birkhoff のエルゴード定理', '**時間平均は、ほとんど至る所で収束する。**極限が定数かどうかは、まだ言っていない', 'theorem', 'math', ['measure-preserving-map', 'conditional-expectation']),
  c('ergodicity-is-a-property-of-invariant-sets', 'エルゴード性は不変集合の条件である', '極限が定数になるのは、測度 0 か 1 の不変集合しか無いときに限る。**「時間平均＝位相平均」は結論で、定義ではない**', 'theorem', 'math', ['birkhoff-ergodic-theorem']),
  c('mixing-is-stronger', '混合はエルゴード性より強い', '混合ならエルゴードだが逆は偽。**回転は平均を取れるが、混ざらない**', 'theorem', 'math', ['ergodicity-is-a-property-of-invariant-sets']),
  c('kam-theorem', 'KAM 定理', '摂動を受けても、無理数比のトーラスの多くは生き残る。**可積分性は急には壊れない**', 'theorem', 'math', ['measure-preserving-map', 'frequencies-from-actions']),
  c('arnold-diffusion', '壊れた隙間から漏れる', '3 自由度以上ではトーラスが空間を分けないので、隙間を通って遠くへ行ける。**次元が閉じ込めを決める**', 'viewpoint', 'math', ['kam-theorem']),
  c('kolmogorov-sinai-entropy', 'Kolmogorov–Sinai エントロピー', '単位時間あたりに生み出される情報。**正の Lyapunov 指数の和に等しい**（Pesin）', 'theorem', 'math', ['birkhoff-ergodic-theorem', 'entropy', 'lyapunov-exponent']),
]
