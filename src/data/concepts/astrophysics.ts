import type { Concept } from './types.ts'
import { c } from './types.ts'

export const astrophysics: readonly Concept[] = [
  // --- 天体物理 ----------------------------------------------------------------
  //
  // 触れない・動かせない・待てない。**それでも分かるのは、
  // 分光と釣り合いの二つが効くから**である。
  //
  // 一般相対論の結果（Schwarzschild 解、地平面、特異点定理、Friedmann 方程式）は
  // あちらに家が在る。ここは引くだけで、二度導かない。
  //
  // 出典は Pols *Stellar Structure and Evolution* と
  // Townsend *Black Holes* (gr-qc/9707012)。
  c('spectral-lines-identify-composition', '線の位置が組成を決める', '**遷移エネルギーは元素ごとに決まっている。**触れない相手の中身が、これだけで分かる', 'theorem', 'physics', ['selection-rule', 'unitary-time-evolution']),
  c('line-shape-carries-more-than-position', '線の形が、位置より多くを持つ', '幅は温度と圧力、ずれは速度、分裂は磁場。**一本の線から四つの量が出る**', 'theorem', 'physics', ['spectral-lines-identify-composition']),
  c('doppler-shift-is-a-velocity', '赤方偏移は速度とは限らない', '**Doppler と重力赤方偏移と膨張は、同じ形のずれを作る。**どれかは、別の証拠が決める', 'viewpoint', 'physics', ['line-shape-carries-more-than-position', 'gravitational-redshift']),
  c('blackbody-fixes-temperature', '連続スペクトルの形が温度を決める', 'Planck 分布は温度ひとつの族。**形を合わせれば温度が出る**', 'theorem', 'physics', ['photon-gas']),
  c('flux-distance-degeneracy', '明るさだけでは距離が出ない', '**暗いのは遠いからか、もともと暗いからか、区別が付かない。**標準光源は、その縮退を外すために置く仮定', 'viewpoint', 'physics', ['blackbody-fixes-temperature']),
  c('parallax-is-the-only-geometric-rung', '幾何で測れるのは、いちばん下の段だけ', '**距離梯子は、下の段の較正が上に全部伝わる。**系統誤差が積み上がる構造になっている', 'viewpoint', 'physics', ['flux-distance-degeneracy']),

  // 星 ── 釣り合いが構造を決める
  c('stellar-hydrostatic-balance', '星の静水圧平衡', '重力と圧力勾配が釣り合う。**これ一本で、中心の圧力が質量と半径だけで見積もれる**', 'theorem', 'physics', ['hydrostatic-balance']),
  c('virial-theorem-stellar', '自己重力系のビリアル定理', '重力エネルギーと熱エネルギーが定数比で結ばれる。**縮むと熱くなる、が定理になる**。一般のビリアル定理から、逆二乗力を入れて出る', 'theorem', 'physics', ['stellar-hydrostatic-balance', 'virial-theorem']),
  c('negative-heat-capacity', '星の比熱は負である', '**エネルギーを失うと温度が上がる。**熱平衡に落ち着かない理由がここに在る', 'theorem', 'physics', ['virial-theorem-stellar']),
  c('polytrope', 'ポリトロープ', '圧力を密度の冪と置くと、構造が一本の常微分方程式に閉じる。**組成の詳細が消える**', 'technique', 'physics', ['stellar-hydrostatic-balance', 'ode-existence']),
  c('vogt-russell', '質量と組成で構造が決まる', '**四つの方程式と境界条件から、解が一意に定まる**という主張。厳密な定理ではなく、経験的な要約である', 'viewpoint', 'physics', ['polytrope']),
  c('mass-luminosity-relation', '質量光度関係', '光度が質量の約 3.5 乗。**重い星ほど、燃料が多いのに寿命が短い**', 'theorem', 'physics', ['vogt-russell', 'transport-equation-common-form']),
  c('main-sequence-lifetime', '主系列の寿命は質量の 2.5 乗に反比例する', '燃料が質量に比例し、消費が 3.5 乗。**割り算だけで出る**', 'theorem', 'physics', ['mass-luminosity-relation']),
  c('coulomb-barrier-needs-tunneling', '核融合は古典的には起きない', '**中心温度は障壁の高さの千分の一。**トンネル効果が無ければ星は光らない', 'theorem', 'physics', ['negative-heat-capacity', 'born-rule']),
  c('gamow-peak', 'Gamow ピーク', '速い粒子は少なく、遅い粒子は抜けない。**二つの指数の積が、細い窓を作る**', 'theorem', 'physics', ['coulomb-barrier-needs-tunneling', 'boltzmann-distribution']),
  c('reaction-rate-is-steep-in-temperature', '反応率は温度の高い冪になる', 'CNO 循環では 17 乗ほど。**温度が少し上がるだけで暴走しかねない**', 'theorem', 'physics', ['gamow-peak']),
  c('thermostat-is-the-negative-heat-capacity', '暴走を止めているのは負の比熱である', '**膨らんで冷えるので反応が落ちる。**縮退した中心ではこれが効かず、実際に暴走する', 'viewpoint', 'physics', ['reaction-rate-is-steep-in-temperature', 'negative-heat-capacity']),

  // 終わり方
  c('degeneracy-pressure', '縮退圧', '**温度がゼロでも残る圧力。**Pauli 原理だけから出て、熱とは無関係', 'theorem', 'physics', ['fermi-dirac-distribution', 'symmetrization-postulate']),
  c('chandrasekhar-limit', 'Chandrasekhar 限界', '相対論的になると圧力の冪が下がり、**支えられる質量に上限が出る。**質量に依らない値が定数だけから決まる', 'theorem', 'physics', ['degeneracy-pressure', 'polytrope']),
  c('limit-is-made-of-constants', '限界質量は基本定数だけでできている', '**Planck 質量と核子質量の比で書ける。**星の性質が一つも入らない', 'viewpoint', 'physics', ['chandrasekhar-limit']),
  c('neutron-star-limit-is-unknown', '中性子星の上限は、同じようには出ない', '**状態方程式が分かっていない。**Chandrasekhar と違い、まだ定数だけでは書けない', 'viewpoint', 'physics', ['chandrasekhar-limit']),
  c('tov-equation', 'TOV 方程式', '一般相対論版の静水圧平衡。**圧力そのものが重力源になるので、圧力を上げても支えきれなくなる**', 'theorem', 'physics', ['stellar-hydrostatic-balance', 'einstein-equation']),
  c('pressure-cannot-save-it', '圧力では止められない', '**どんな状態方程式でも、質量が十分大きければ潰れる。**特異点定理が言っているのはこれ', 'theorem', 'physics', ['tov-equation', 'singularity-theorem']),
  c('no-hair', '無毛定理', '**外から見える量が、質量・角運動量・電荷の三つに尽きる。**落ちた物の履歴が全部消える', 'theorem', 'physics', ['event-horizon', 'birkhoff-theorem']),
  c('horizon-area-never-decreases', '地平面の面積は減らない', '**エントロピーと同じ向きの単調性**を、力学だけから示せる', 'theorem', 'physics', ['event-horizon', 'no-hair']),
  c('hawking-temperature', 'Hawking 温度', '面積の単調性が熱力学第二法則と同じ形なら、温度に当たる量も在るはず。**類推が定量的な予言になる**', 'theorem', 'physics', ['horizon-area-never-decreases', 'entropy-thermodynamic']),

  // 銀河と宇宙
  c('jeans-instability', 'Jeans 不安定', '重力と圧力の競り合いで、**ある長さより大きい擾乱だけが育つ**。星が生まれる大きさが決まる', 'theorem', 'physics', ['stellar-hydrostatic-balance', 'sound-speed']),
  c('rotation-curve-flat', '回転曲線が平らである', 'Kepler なら外側で落ちるはずが、落ちない。**質量が光っていない、という観測の形**', 'theorem', 'physics', ['central-force-planar']),
  c('two-readings-of-the-same-curve', '同じ曲線に、二つの読み方がある', '見えない質量が在るか、重力の法則が違うか。**回転曲線だけでは決まらない**', 'viewpoint', 'physics', ['rotation-curve-flat']),
  c('lensing-separates-them', '重力レンズが、二つを分ける', '**質量分布が光の曲がりから直接出る**ので、光っている場所とずれているかが見える', 'theorem', 'physics', ['two-readings-of-the-same-curve', 'light-deflection-factor-two']),
  c('hubble-law-is-not-a-velocity-law', 'Hubble の法則は速度の法則ではない', '**膨張は空間の計量の変化で、遠くの銀河が空間を走っているのではない。**光速を超えても矛盾しない', 'viewpoint', 'physics', ['friedmann-equation', 'doppler-shift-is-a-velocity']),
  c('cmb-is-a-surface-not-a-time', '宇宙背景放射は面である', '**最後に散乱した場所の集まり。**その先が見えないのは、遠いからではなく不透明だから', 'theorem', 'physics', ['friedmann-equation', 'photon-gas']),
  c('acoustic-peaks', '音響ピーク', '再結合までに一回だけ振動できた大きさが、角度の目盛りになる。**幾何が測れる**', 'theorem', 'physics', ['cmb-is-a-surface-not-a-time', 'jeans-instability']),
  c('what-cosmology-does-not-fix', '宇宙論が決めていないこと', '**暗黒物質と暗黒エネルギーは、どちらも「合わせるために置いた項」である。**中身は決まっていない', 'viewpoint', 'physics', ['acoustic-peaks', 'cosmological-constant']),
]
