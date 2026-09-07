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

  // --- 保存則と不可能性（分野ごとに一つずつ、家が無いもの） ----------------------
  //
  // **「一本の連載にまとまらないから入れない」は誤りだった。**
  // グラフは一次データで、記事があるかどうかとは無関係に立てる。
  // 連載になるかは、何が言えるかを数えてから決める。
  //
  // どれも**保存則か不可能性を一行で書ける**ことを確かめてから入れた。
  // 書けなかったものは入れていない。
  c('bode-fano-limit', 'Bode–Fano の限界', '**整合できる帯域の面積が有限。**反射を下げてよい量が、負荷の $R C$ だけで決まる ── Bode の積分定理と同じ形の面積保存', 'theorem', 'engineering', ['bode-integral', 'causality-is-analyticity']),
  c('gain-bandwidth-product', '利得帯域幅積は保存する', '**負帰還は利得を帯域に交換するだけ。**両方は増やせない', 'theorem', 'engineering', ['bode-gain-phase-relation', 'transfer-function']),
  c('tellegen-theorem', 'Tellegen の定理', '**Kirchhoff 則さえ満たせば、素子の構成則によらず電力の総和が 0。**回路のトポロジーだけから出る', 'theorem', 'engineering', ['graph-laplacian', 'divergence-theorem-riemannian']),
  c('johnson-nyquist-noise', '熱雑音は避けられない', '**抵抗があれば必ず出る。**大きさが温度と抵抗だけで決まり、回路の工夫で下げられない', 'theorem', 'engineering', ['fluctuation-dissipation', 'condition-number']),
  c('den-hartog-fixed-points', 'Den Hartog の不動点定理', '**動吸振器を付けた系の応答は、減衰の値によらず二点を必ず通る。**そこの振幅は下げられない', 'theorem', 'engineering', ['transfer-function', 'normal-modes']),
  c('brockett-obstruction', 'Brockett の不可能性', '**可制御でも、滑らかな時不変フィードバックでは原点安定化できない系がある。**非ホロノミック拘束が理由', 'theorem', 'engineering', ['reachability-rank-condition', 'lyapunov-second-method']),
  c('hashin-shtrikman-bounds', 'Hashin–Shtrikman 境界', '**微細構造を一切知らなくても、体積分率と成分の物性だけで有効物性の厳密な上下限が出る**', 'theorem', 'engineering', ['transport-equation-common-form', 'variational-principle']),
  c('minimum-separation-work', '分離の最小仕事', '**混合のエントロピーが、組成だけで下限を決める。**どんな装置でもこれを下回れない', 'theorem', 'engineering', ['entropy-thermodynamic', 'thermodynamic-potentials']),
  c('reflux-vs-stages', '還流と段数は交換になる', '**最小還流比を下回ると段数が発散する。**エネルギーと設備費の一方を減らすと他方が増える', 'theorem', 'engineering', ['minimum-separation-work']),
  c('terzaghi-effective-stress', 'Terzaghi の有効応力原理', '**応力が土骨格と間隙水に分かれ、強度は骨格側しか見ない。**水圧が上がるだけで地盤が壊れる', 'theorem', 'engineering', ['cauchy-stress']),
  c('induced-drag-minimum', '誘導抗力に下限がある', '**揚力を出す限り、必ず生じる。**最小を与える循環分布が楕円形に決まる', 'theorem', 'engineering', ['kutta-joukowski', 'variational-principle']),
  c('betz-limit', 'Betz 限界', '**風から取り出せるのは運動エネルギーの $16\\/27$ まで。**全部取ると空気が出ていけなくなる ── 質量保存だけで出る', 'theorem', 'engineering', ['induced-drag-minimum', 'conserved-quantity-reduces']),
  c('propulsive-efficiency-tradeoff', '推力と効率は交換になる', '**排気を速くすると推力は増えるが効率が落ちる。**運動量とエネルギーを同時には最適化できない', 'theorem', 'engineering', ['tsiolkovsky']),
  c('specific-energy-minimum', '比エネルギーの最小が、限界水深を与える', '**跳水では運動量は保存するがエネルギーは落ちる。**どちらを使うかで答えが変わる', 'theorem', 'engineering', ['rankine-hugoniot', 'mach-number-changes-the-type']),
  c('braess-paradox', 'Braess のパラドックス', '**道を足すと、全員の所要時間が延びることがある。**各自の最適化が全体の最適と食い違う', 'theorem', 'engineering', ['nash-equilibrium', 'graph']),
  c('price-of-anarchy-bound', '無政府状態の代償には上界がある', '**アフィンな遅延なら、最適の $4\\/3$ 倍を超えない。**「どれだけ悪くなるか」が定理で抑えられる', 'theorem', 'engineering', ['braess-paradox', 'lp-duality']),
  c('imaging-snr-scales-as-sqrt-dose', '画質を 2 倍にすると、被曝が 4 倍要る', '**光子の数え上げが Poisson なので、$sqrt(D)$ でしか良くならない。**装置の改良では変えられない', 'theorem', 'engineering', ['photon-statistics', 'cramer-rao']),
  c('radon-transform', 'Radon 変換', '**投影から断面が復元できる。**画像再構成が、逆変換の存在という一つの定理に乗っている', 'theorem', 'engineering', ['line-integral', 'fourier-transform']),
  c('missing-angles-are-a-null-space', '撮れなかった方向は、原理的に戻らない', '**零空間が消えないので、補間ではなく仮定を足していることになる**', 'viewpoint', 'engineering', ['radon-transform', 'null-space-never-vanishes']),
  c('murray-law', 'Murray の法則', '**散逸と維持コストの和を最小化すると、分岐で半径の三乗が保存する。**最適化から保存量が出る', 'theorem', 'engineering', ['poiseuille-fourth-power', 'variational-principle']),
  c('liu-layland-bound', 'Liu–Layland の利用率上界', '**周期タスクの数が増えると、保証できる利用率が $ln 2$ へ落ちる。**余裕を残さないと期限を守れない', 'theorem', 'engineering', ['mm1-queue', 'optimal-substructure']),
]
