import type { Concept } from './types.ts'
import { c } from './types.ts'

export const engineering: readonly Concept[] = [
  // --- 工学のうち、連載一本には足りなかったもの ----------------------------------
  //
  // 制御・移動現象論・構造力学は、それぞれ独立した連載になった
  // （`control.ts`、`transport.ts`、`structures.ts`）。ここに残るのは、
  // **判定だけして分量が足りなかった**もの。無理に一本にまとめない。
  c('sampling-theorem', '標本化定理', '帯域が制限されていれば、離散の標本から元の信号が完全に戻る', 'theorem', 'engineering', ['fourier-transform']),
  c('matched-filter', '整合フィルタ', '雑音の中で信号を最もよく拾う線形フィルタが一意に決まる。証明は Cauchy–Schwarz', 'theorem', 'engineering', ['sampling-theorem', 'inner-product']),
  c('tsiolkovsky', 'Tsiolkovsky のロケット方程式', '到達できる速度差が質量比の対数で決まる。**段を分ける理由がここにある**', 'theorem', 'engineering', ['conserved-quantity-reduces']),
  c('hohmann-transfer', 'Hohmann 遷移', '二回の噴射で移る軌道が、燃料の意味で最適になる条件', 'theorem', 'engineering', ['central-force-planar', 'tsiolkovsky']),
  c('metacentric-height', 'メタセンター高さ', '**浮体が倒れない条件が、断面二次モーメントと排水体積の比だけで決まる**', 'theorem', 'engineering', ['section-modulus-is-a-tensor']),
  c('mm1-queue', '待ち行列の定常分布', '到着と処理を指数と置くと、待ち人数の分布が閉じた形で出る', 'theorem', 'engineering', ['markov-chain', 'littles-law']),
  c('inventory-s-S', '在庫の $(s, S)$ 方策', '費用が K-凸なら、最適方策が二つの数だけで書ける', 'theorem', 'engineering', ['convex-set', 'expectation']),
  c('criticality-condition', '臨界条件', '中性子輸送の最大固有値が 1 になる点。**幾何が決める量と材料が決める量が釣り合う**', 'theorem', 'engineering', ['perron-frobenius', 'transport-equation-common-form']),
]
