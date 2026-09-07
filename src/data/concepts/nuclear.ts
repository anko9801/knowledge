import type { Concept } from './types.ts'
import { c } from './types.ts'

export const nuclear: readonly Concept[] = [
  // --- 原子核 ------------------------------------------------------------------
  //
  // **四つの分類体系が指した空白**（nucl-th / PhySH Nuclear Physics /
  // 科研費 / Scopus）。標準模型も統計力学もあるのに、その間が無かった。
  //
  // 軸は**「導けない力を、模型でどこまで代用できるか」**。
  // 核力は標準模型から導けない（格子計算でようやく手が届く段階）。
  // それでも**結合エネルギーは五項の式で 1% を切り、
  // 魔法数は一つの項を足すだけで出る**。
  //
  // だから毎回の結びが「ここは合わせ込みである」になる。
  // 液滴模型の五係数も、殻模型のスピン軌道結合の強さも、実験に合わせた数。
  c('nuclear-force-is-not-derived', '核力は導かれていない', '**標準模型から出せない。**クォークの閉じ込めが解けていないので、核子間の力は今も現象論である', 'viewpoint', 'physics', ['confinement-not-derived', 'asymptotic-freedom']),
  c('saturation-of-nuclear-force', '核力は飽和する', '結合エネルギーが核子数にほぼ比例する。**全対全なら二乗に比例するはずで、そうならないことが力の短距離性を示す**', 'theorem', 'physics', ['nuclear-force-is-not-derived']),
  c('binding-energy-per-nucleon', '核子あたりの結合エネルギー', '質量数 56 付近に極大がある。**軽い側の融合と重い側の分裂が、同じ曲線の両側**', 'definition', 'physics', ['saturation-of-nuclear-force']),
  c('liquid-drop-model', '液滴模型', '体積・表面・Coulomb・対称・対の五項。**飽和性を認めると、項の形が次元だけで決まる**', 'technique', 'physics', ['binding-energy-per-nucleon', 'buckingham-pi']),
  c('five-coefficients-are-fitted', '五つの係数は合わせ込みである', '**形は導けるが値は導けない。**1% を切る精度は、理論の正しさではなく当てはめの結果', 'viewpoint', 'physics', ['liquid-drop-model']),
  c('fission-barrier-from-two-terms', '分裂の障壁は二項の競争である', '表面エネルギーが増える分と Coulomb が減る分。**比が臨界値を超えると障壁が消える**', 'theorem', 'physics', ['liquid-drop-model']),
  c('valley-of-stability', '安定の谷', '対称項と Coulomb 項の釣り合いで、陽子中性子比が質量数とともにずれる。**谷の位置が式から出る**', 'theorem', 'physics', ['liquid-drop-model']),
  c('drip-line', 'ドリップライン', '核子の分離エネルギーが 0 になる線。**そこから先は束縛しない**という境界が予言できる', 'theorem', 'physics', ['valley-of-stability']),

  // 殻 ── 一つの項が魔法数を出す
  c('magic-numbers', '魔法数', '2、8、20、28、50、82、126 で特に安定になる。**液滴模型では説明できない**', 'definition', 'physics', ['binding-energy-per-nucleon']),
  c('mean-field-justifies-independence', '平均場が独立粒子近似を正当化する', 'Pauli 原理で衝突先が塞がるので、核子の平均自由行程が核より長くなる。**密なのに独立に扱ってよい理由**', 'theorem', 'physics', ['mean-field-approximation', 'symmetrization-postulate']),
  c('harmonic-plus-square-well-fails', '井戸型ポテンシャルだけでは魔法数が合わない', '2、8、20 までは出るが、その先が出ない。**近い数字が出てしまうので、かえって間違いに気づきにくい**', 'theorem', 'physics', ['mean-field-justifies-independence', 'magic-numbers']),
  c('spin-orbit-fixes-it', 'スピン軌道結合を一つ足すと、全部出る', '**強い項を一つ足すだけで、残りの魔法数が一度に合う。**符号も原子の場合と逆で、そこも導けていない', 'theorem', 'physics', ['harmonic-plus-square-well-fails']),
  c('shell-model-predicts-spins', '殻模型は基底状態のスピンを当てる', '**当てはめた量ではないので、これは予言である。**奇数核のスピンとパリティが最後の一個で決まる', 'theorem', 'physics', ['spin-orbit-fixes-it']),
  c('pairing-makes-even-even-zero', '偶々核のスピンは必ず 0 である', '**例外が一つも無い。**対相関が同じ準位の二個を結びつけている', 'theorem', 'physics', ['shell-model-predicts-spins']),
  c('bcs-in-the-nucleus', '核の対相関は超伝導と同じ機構である', '**BCS をそのまま核に当てる。**エネルギー間隙が、偶々核と奇核の質量差として測れる', 'theorem', 'physics', ['pairing-makes-even-even-zero', 'cooper-pairing']),
  c('collective-vs-single-particle', '集団運動と一粒子運動が同居する', '回転帯のエネルギーが慣性モーメントで決まる一方、殻の効果も残る。**二つの描像のどちらか一方では足りない**', 'viewpoint', 'physics', ['shell-model-predicts-spins', 'inertia-tensor']),

  // 崩壊 ── 三つとも別の機構
  c('alpha-decay-is-tunneling', 'アルファ崩壊はトンネル効果である', '**半減期が 20 桁以上ばらつくのに、エネルギーとの関係が一本の直線に乗る**（Geiger–Nuttall）。指数の中に入っているから', 'theorem', 'physics', ['coulomb-barrier-needs-tunneling', 'liquid-drop-model']),
  c('beta-decay-needs-a-new-force', 'ベータ崩壊は核力では起きない', '**電荷が変わるので、別の相互作用が要る。**中性子が単独で崩壊することが、その証拠', 'theorem', 'physics', ['chiral-gauge-theory']),
  c('neutrino-was-predicted-by-a-spectrum', '連続スペクトルが、見えない粒子を要求した', '**二体崩壊なら線スペクトルになるはず。**エネルギー保存を守るために粒子を一つ足した', 'viewpoint', 'physics', ['beta-decay-needs-a-new-force', 'conserved-quantity-reduces']),
  c('gamma-decay-selection-rules', 'ガンマ崩壊の選択則', '角運動量とパリティの保存で、許される多重極が決まる。**分子の選択則と同じ機構**', 'theorem', 'physics', ['shell-model-predicts-spins', 'vanishing-integral-theorem']),
  c('isomers-are-forbidden-transitions', '異性体は、禁じられた遷移である', 'スピン差が大きいと多重極が高次になり、寿命が桁で伸びる。**「禁制」が寿命の数になる**', 'theorem', 'physics', ['gamma-decay-selection-rules', 'symmetry-forbids-does-not-mean-never']),
  c('decay-is-exponential-because-memoryless', '指数則は無記憶性から出る', '**核が「いつ作られたか」を覚えていないことだけを使う。**核の中身を一つも仮定しない', 'theorem', 'physics', ['markov-chain', 'first-order-elimination']),

  // 反応と応用
  c('cross-section-is-an-area', '断面積は面積ではない', '**確率を面積の次元で書いた量。**共鳴では幾何的な大きさを桁で超える', 'definition', 'physics', ['born-rule']),
  c('breit-wigner', 'Breit–Wigner の共鳴', '**寿命と幅が反比例する。**不確定性関係を、測れる形に直したもの', 'theorem', 'physics', ['cross-section-is-an-area', 'cramer-rao-is-heisenberg-for-real-amplitudes']),
  c('compound-nucleus-forgets', '複合核は入口を忘れる', '**どう作られたかに依らず、崩壊の仕方が同じ。**統計力学の平衡と同じ仮定が入っている', 'viewpoint', 'physics', ['breit-wigner', 'ergodic-hypothesis']),
  c('four-factor-formula', '連鎖反応の四因子', '一世代あたりの中性子の増え方が、四つの比の積になる。**臨界条件がここから出る**', 'theorem', 'physics', ['criticality-condition', 'decay-is-exponential-because-memoryless']),
  c('delayed-neutrons-make-it-controllable', '遅発中性子が、制御を可能にしている', '**全体の 1% に満たないのに、応答の時定数を秒の単位に引き延ばす。**これが無ければ原子炉は制御できない', 'theorem', 'physics', ['four-factor-formula', 'stability-region']),
  c('r-process-needs-a-site', '重元素の作られ方は、まだ決まっていない', '中性子を速く捕獲する過程が要ることは分かるが、**どこで起きるかは観測で絞られている途中**', 'viewpoint', 'physics', ['drip-line', 'reaction-rate-is-steep-in-temperature']),
]
