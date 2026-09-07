import type { Concept } from './types.ts'
import { c } from './types.ts'

export const superconductivity: readonly Concept[] = [
  // --- 磁性と超伝導 ------------------------------------------------------------
  //
  // **統計力学と物性はあるのに、平均場も BCS も無かった**
  // （科研費 13030 / cond-mat.supr-con）。`mean-field-approximation` と
  // `order-parameter` と `landau-expansion` が置かれたまま、
  // それを使う場所が無い状態だった。
  //
  // 軸は**「近似が、いつ答えを変えてしまうか」**。
  // 平均場は次元を見ない。だから一次元で相転移を予言して外し、
  // 二次元でも臨界指数を外す。**外れ方が次元で決まる**ところまでが定理で、
  // そこから先（正しい指数）はくりこみ群の側にある。
  //
  // 超伝導の側は逆で、**平均場が厳密に近い**。相互作用が引力でありさえすれば、
  // どんなに弱くても Fermi 面が不安定になる ── そこだけは近似ではない。
  c('exchange-is-not-a-force', '交換相互作用は力ではない', '**Coulomb 相互作用と Pauli 原理の組み合わせ。**スピンに依る項が、スピンに依らない力から出る', 'theorem', 'physics', ['symmetrization-postulate', 'slater-determinant']),
  c('heisenberg-model', 'Heisenberg 模型', 'スピン間の内積で書く。**電子の詳細を全部捨てて、交換積分ひとつに押し込めた**', 'definition', 'physics', ['exchange-is-not-a-force', 'ising-model']),
  c('mean-field-ignores-dimension', '平均場近似は次元を見ない', '**周りを平均で置き換えると、格子の形が配位数にしか残らない。**これが以降の外れ方の全部を決める', 'theorem', 'physics', ['mean-field-approximation', 'heisenberg-model']),
  c('curie-weiss', 'Curie–Weiss 則', '自発磁化が有限温度で消え、帯磁率が転移点で発散する。**転移が在ることを言えるのは、この近似のおかげ**', 'theorem', 'physics', ['mean-field-ignores-dimension', 'order-parameter']),
  c('mean-field-predicts-a-false-transition', '一次元では、この予言が外れる', '**平均場は一次元でも転移を出すが、実際には無い。**転送行列で厳密に解けるので、間違いだと確定する', 'theorem', 'physics', ['curie-weiss', 'one-dimension-no-transition']),
  c('where-mean-field-fails-is-known', '外れる場所が、定理で決まっている', '一次元では転移そのものを間違え、二次元では連続対称性の破れを間違え、四次元より下では指数を間違える。**どれも次元だけで決まる**', 'viewpoint', 'physics', ['mean-field-predicts-a-false-transition', 'mermin-wagner', 'upper-critical-dimension']),
  c('frustration', 'フラストレーション', '全部の相互作用を同時に満たせない配置。**基底状態が一意でなくなり、残留エントロピーが出る**', 'definition', 'physics', ['heisenberg-model']),
  c('magnetism-needs-quantum-mechanics', '古典力学では磁性が出ない', '**Bohr–van Leeuwen の定理。**分配関数から磁場が消えるので、平衡磁化が恒等的に 0 になる', 'theorem', 'physics', ['ising-model', 'boltzmann-distribution']),

  // 超伝導 ── 近似でない部分
  c('meissner-effect', 'Meissner 効果', '**完全導体では説明できない。**冷やす順を変えても磁束が排除されるので、これは平衡状態の性質である', 'theorem', 'physics', ['electromagnetic-constants', 'constraint-vs-evolution']),
  c('london-equation', 'London 方程式', '磁場が指数で減衰し、侵入長が決まる。**電磁気に方程式を一本足しただけで Meissner が出る**', 'theorem', 'physics', ['meissner-effect']),
  c('ginzburg-landau', 'Ginzburg–Landau 理論', '複素秩序変数で Landau 展開を書く。**微視的な機構を一つも仮定しない**', 'technique', 'physics', ['landau-expansion', 'london-equation']),
  c('two-lengths-two-types', '二つの長さの比が、二種類に分ける', 'コヒーレンス長と侵入長の比が $1\\/sqrt(2)$ を跨ぐと、**界面エネルギーの符号が変わる**。第一種と第二種はここで分かれる', 'theorem', 'physics', ['ginzburg-landau']),
  c('flux-quantization', '磁束は量子化される', '波動関数が一価であることだけから出る。**単位は電荷の 2 倍で割れていて、対になっていることの直接の証拠**', 'theorem', 'physics', ['ginzburg-landau', 'aharonov-bohm']),
  c('cooper-pairing', 'Cooper の不安定性', '**引力がどんなに弱くても、Fermi 面の上の二電子は束縛する。**摂動では出ない ── 結合定数の指数関数になる', 'theorem', 'physics', ['fermi-dirac-distribution', 'exchange-is-not-a-force']),
  c('gap-equation', 'ギャップ方程式', '自己無撞着に解くと、間隙と転移温度の比が**物質に依らない数**になる', 'theorem', 'physics', ['cooper-pairing', 'mean-field-approximation']),
  c('bcs-mean-field-is-nearly-exact', 'ここでは平均場がほぼ厳密である', '**ゆらぎが効かないのは、対の大きさが平均間隔よりずっと大きいから。**磁性の場合と正反対', 'viewpoint', 'physics', ['gap-equation', 'where-mean-field-fails-is-known']),
  c('isotope-effect', '同位体効果が、機構を特定した', '**転移温度が質量の平方根に反比例する。**格子が関わっている証拠で、理論より先に測られていた', 'theorem', 'physics', ['gap-equation']),
  c('josephson-effect', 'Josephson 効果', '**位相差だけで電流が流れる。**電圧をかけると交流になり、その振動数が定数だけで決まる', 'theorem', 'physics', ['flux-quantization', 'unitary-time-evolution']),
  c('volt-is-defined-by-it', '電圧の定義が、この効果に乗っている', '**振動数と電圧の比が普遍定数なので、標準器になる。**理論の予言が単位系の定義に入った', 'viewpoint', 'physics', ['josephson-effect']),
  c('superconductivity-is-a-broken-gauge-symmetry', '超伝導はゲージ対称性の破れである', '**Higgs 機構と同じ構造。**光子が質量を持つことが、Meissner 効果の別の言い方', 'viewpoint', 'physics', ['higgs-mechanism', 'meissner-effect']),
  c('high-tc-is-not-explained', '高温超伝導の機構は決まっていない', '**BCS の枠に入るかどうかで意見が割れている。**同位体効果も小さく、対称性も $d$ 波', 'viewpoint', 'physics', ['isotope-effect', 'bcs-mean-field-is-nearly-exact']),
]
