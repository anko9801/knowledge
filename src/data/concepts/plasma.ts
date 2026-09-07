import type { Concept } from './types.ts'
import { c } from './types.ts'

export const plasma: readonly Concept[] = [
  // --- プラズマ ----------------------------------------------------------------
  //
  // **三つの分類体系が指した空白**（physics.plasm-ph / PhySH / 科研費 14010）。
  // 電磁気も統計力学も流体もあるのに、その三つが出会う場所が無かった。
  //
  // 軸は**「長距離力があると、統計力学の前提が壊れる」**。
  // 気体分子運動論は衝突が二体で短距離だと仮定する。Coulomb 力は長距離なので、
  // **積分が発散し、遮蔽で切らないと理論が立たない。**
  //
  // そして芯が一つある ── **衝突が無くても減衰する**（Landau 減衰）。
  // 散逸の無い方程式から不可逆な振る舞いが出るので、
  // 統計力学の「粗視化が不可逆を作る」とは別の機構である。
  c('plasma-is-not-a-gas', 'プラズマは気体ではない', '**力が長距離なので、二体衝突の描像が使えない。**一個が同時に多数と相互作用する', 'viewpoint', 'physics', ['boltzmann-distribution', 'transport-equation-common-form']),
  c('debye-shielding', 'Debye 遮蔽', '電荷のまわりに反対符号が集まり、**有限の距離で場が指数的に消える**。長距離力が有限距離になる', 'theorem', 'physics', ['plasma-is-not-a-gas', 'fundamental-solution']),
  c('plasma-parameter', 'プラズマ助変数', 'Debye 球の中の粒子数。**これが大きいことが、以降の全部の近似の前提**', 'definition', 'physics', ['debye-shielding']),
  c('coulomb-logarithm-is-a-cutoff', 'Coulomb 対数は、切り取りの跡である', '**積分が両端で発散するので、Debye 長と最接近距離で切る。**理論の中に、理論が決めない量が残る', 'viewpoint', 'physics', ['plasma-parameter']),
  c('plasma-frequency', 'プラズマ振動数', '電子が集団で振動する固有振動数。**密度だけで決まり、温度に依らない**', 'theorem', 'physics', ['debye-shielding', 'ode-existence']),
  c('cutoff-frequency', 'それより低い電波は通らない', '**電離層が短波を反射するのも、金属が光を反射するのも同じ式。**屈折率が虚数になる', 'theorem', 'physics', ['plasma-frequency', 'dispersion-relation-optical']),

  // 運動論 ── 衝突無しで減衰する
  c('vlasov-equation', 'Vlasov 方程式', '**衝突項を落として、場を自己無撞着に解く。**分布関数が位相空間で流れとして保存する', 'definition', 'physics', ['plasma-parameter', 'liouville-theorem', 'wave-from-maxwell']),
  c('landau-damping', 'Landau 減衰', '**散逸が無いのに波が減衰する。**位相速度に近い粒子が波と共鳴し、エネルギーを受け取る', 'theorem', 'physics', ['vlasov-equation', 'contour-integral']),
  c('damping-without-entropy-increase', 'エントロピーは増えていない', '**方程式が時間反転で不変なので、情報は失われていない。**位相が混ざっただけで、実際エコーとして戻せる', 'viewpoint', 'physics', ['landau-damping', 'irreversibility-from-shocks']),
  c('sign-of-the-slope-decides', '分布の傾きの符号が、増幅か減衰かを決める', '**速い粒子が多ければ波が育つ。**不安定性が、分布関数の形だけで判定できる', 'theorem', 'physics', ['landau-damping']),
  c('two-stream-instability', '二流体不安定性', 'ビームを撃ち込むと波が指数的に育つ。**平衡から離れた分布が持つエネルギーの、取り出し口**', 'theorem', 'physics', ['sign-of-the-slope-decides']),
  c('bump-on-tail-saturates', '不安定性は、分布を平らにして止まる', '**波が育つと粒子が拡散して傾きが消える。**準線形理論で、飽和の水準まで出る', 'theorem', 'physics', ['two-stream-instability', 'fokker-planck']),

  // 磁場の中 ── 流体として見る
  c('gyration-and-guiding-center', '旋回と案内中心', '磁力線のまわりを回りながら流れる。**速い旋回を平均して落とすと、遅い運動だけの方程式になる**', 'technique', 'physics', ['rotating-frame', 'quasi-steady-state']),
  c('adiabatic-invariant-magnetic', '磁気モーメントは断熱不変量である', '**場がゆっくり変われば保存する。**作用変数そのもので、力学の断熱不変量と同じ対象', 'theorem', 'physics', ['gyration-and-guiding-center', 'kam-theorem']),
  c('magnetic-mirror', '磁気鏡', '**強い場に入ると跳ね返される。**不変量の保存だけから出て、力を計算しなくてよい', 'theorem', 'physics', ['adiabatic-invariant-magnetic']),
  c('loss-cone', '閉じ込めには漏れる角度がある', '**速度空間に円錐状の穴が開き、そこに入った粒子は必ず逃げる。**閉じ込め時間の上限がここから', 'theorem', 'physics', ['magnetic-mirror']),
  c('mhd-equations', '電磁流体力学', '流体方程式に Lorentz 力を足し、Maxwell を非相対論に落とす。**変位電流を落とすのが本質的な近似**', 'definition', 'physics', ['navier-stokes', 'vlasov-equation']),
  c('frozen-in-flux', '磁力線は流体に凍結する', '**抵抗がゼロなら、磁束が物質と一緒に動く。**Kelvin の循環定理とまったく同じ形の定理', 'theorem', 'physics', ['mhd-equations', 'kelvin-circulation']),
  c('alfven-wave', 'Alfvén 波', '**磁力線が弦のように振動する。**速度が磁場と密度だけで決まり、弦の張力の式と同じ形', 'theorem', 'physics', ['frozen-in-flux']),
  c('magnetic-pressure-and-tension', '磁場は圧力と張力を持つ', '応力テンソルを見ると、磁力線に沿って張力、垂直に圧力。**「磁力線が押し合う」が式になる**', 'theorem', 'physics', ['mhd-equations', 'cauchy-stress']),
  c('beta-parameter', 'ベータ値', '熱の圧力と磁気圧の比。**閉じ込めの効率がこの一つの数で測れる**', 'definition', 'physics', ['magnetic-pressure-and-tension']),
  c('reconnection-needs-broken-freezing', '再結合は、凍結が破れないと起きない', '**抵抗が完全にゼロなら磁力線は繋ぎ変わらない。**薄い層でだけ破れるので、そこに全部が集中する', 'theorem', 'physics', ['frozen-in-flux']),
  c('reconnection-rate-problem', '速さが説明できていなかった', '**古典的な抵抗から出る速さは、太陽フレアの観測より桁で遅い。**乱流か無衝突効果を足すことになる', 'viewpoint', 'physics', ['reconnection-needs-broken-freezing']),

  // 閉じ込めの限界 ── 挟み撃ち
  c('lawson-criterion', 'Lawson 条件', '密度と閉じ込め時間と温度の積に下限がある。**核融合が成り立つ条件が、下から押す**', 'theorem', 'physics', ['beta-parameter', 'gamow-peak']),
  c('kink-and-interchange', '不安定性が上から押す', '電流を増やすとねじれ、圧力を上げると膨らむ。**下限と上限が別の物理から来る**', 'theorem', 'physics', ['beta-parameter', 'second-variation-stability']),
  c('operating-window-is-squeezed', '運転できる窓は、両側から挟まれている', '**Lawson が下から、安定性の限界が上から。**設計はその隙間を探すことになる', 'viewpoint', 'physics', ['lawson-criterion', 'kink-and-interchange']),
  c('anomalous-transport', '輸送は、古典論より速い', '**乱流が支配していて、係数は当てはめ。**渦拡散と同じ形の未解決で、そこが設計の不確かさになる', 'viewpoint', 'physics', ['eddy-diffusivity-is-fitted', 'operating-window-is-squeezed']),
]
