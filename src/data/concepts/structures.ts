import type { Concept } from './types.ts'
import { c } from './types.ts'

export const structures: readonly Concept[] = [
  // --- 構造力学 ----------------------------------------------------------------
  //
  // 芯は**座屈に強度が現れない**こと。降伏応力が式に無いので、
  // 強い鋼にしても細長い柱は救えない。効くのは弾性率だけ。
  //
  // 塑性崩壊の下界定理は**支持超平面の不等式そのもの**で、
  // 分離超平面に独立に着いた四人のうちの一人（`docs/surveys.md`）。
  c('plane-sections-assumption', '平面保持の仮定', 'この一つを置くと曲げが曲率に比例し、**断面の形は一つの数にしか残らない**', 'definition', 'engineering', ['multivariable-calculus']),
  c('euler-buckling', 'Euler の座屈荷重', '**力の釣り合いの解ではなく、境界値問題の最小固有値である**', 'theorem', 'engineering', ['plane-sections-assumption', 'spectral-theorem', 'ode-existence']),
  c('slenderness-ratio', '細長比', '長さも断面の形も、一つの組み合わせでしか入らない', 'theorem', 'engineering', ['euler-buckling']),
  c('buckling-ignores-strength', '座屈に強度は現れない', '**降伏応力が式に無い。**強い鋼にしても細長い柱は救えない。効くのは弾性率だけ', 'viewpoint', 'engineering', ['slenderness-ratio']),
  c('second-variation-stability', '第二変分が正定値でなくなる点', '安定な平衡はポテンシャルの最小。座屈はその二次形式が正定値を失う荷重', 'viewpoint', 'engineering', ['variational-principle', 'quadratic-form', 'euler-buckling']),
  c('limit-analysis-lower-bound', '塑性崩壊の下界定理', '降伏を破らない釣り合い応力場が一つ作れれば、その荷重は崩壊荷重以下。**支持超平面の不等式そのもの**', 'theorem', 'engineering', ['separating-hyperplane', 'convex-set']),
  c('limit-analysis-duality', '極限解析は線形計画の双対', '静的定理が主問題、機構の定理が双対問題。一致すれば厳密解', 'theorem', 'engineering', ['limit-analysis-lower-bound', 'lp-duality', 'farkas-lemma']),
  c('section-modulus-is-a-tensor', '断面二次モーメントはテンソル', '断面の主軸は対称テンソルの固有ベクトル。**剛体の慣性主軸と同じ対象**', 'viewpoint', 'engineering', ['inertia-tensor', 'spectral-theorem']),
]
