import type { Concept } from './types.ts'
import { c } from './types.ts'

export const fluidDynamics: readonly Concept[] = [
  // --- 流体 --------------------------------------------------------------------
  //
  // **Navier--Stokes・Reynolds 数・境界層の家はここ。**
  // 工学（移動現象論）も地球流体力学も、ここを引くだけで再定義しない。
  //
  // 弱解の一意性と部分正則性（`leray-weak-solution`、`partial-regularity`、
  // `supercritical-scaling`）は偏微分方程式の側に家が在る。ここは引く。
  c('continuum-hypothesis-fluid', '連続体近似', '分子を平均して場にする。**成り立つ条件が Knudsen 数で書ける**ので、近似であることが式に残る', 'definition', 'physics', ['tensor-field']),
  c('material-derivative', '物質微分', '流れに乗った観測者の時間変化。**非線形項はここから出るのであって、力から出るのではない**', 'definition', 'physics', ['continuum-hypothesis-fluid', 'lie-derivative']),
  c('continuity-equation-fluid', '連続の式', '質量保存。**非圧縮は密度が一定という近似ではなく、発散が消えるという条件**', 'theorem', 'physics', ['material-derivative', 'divergence-theorem-riemannian']),
  c('cauchy-stress', '応力テンソル', '面に働く力を、面の向きの線形関数と置く。**この線形性が仮定である**', 'definition', 'physics', ['continuum-hypothesis-fluid', 'inertia-tensor']),
  c('newtonian-fluid', 'Newton 流体', '応力がひずみ速度に比例する。**等方性を課すと、独立な係数が二つに減る**', 'definition', 'physics', ['cauchy-stress']),
  c('navier-stokes', 'Navier–Stokes 方程式', '運動量保存に線形の応力則を入れただけ。**新しい物理は一つも足していない**', 'theorem', 'physics', ['newtonian-fluid', 'continuity-equation-fluid']),
  c('pressure-is-not-a-variable', '非圧縮では圧力に発展方程式が無い', '**発散を消すための Lagrange 乗数**として決まる。だから瞬時に全域へ伝わる', 'theorem', 'physics', ['navier-stokes', 'fundamental-solution']),
  c('euler-equation-fluid', 'Euler 方程式', '粘性を落とす。**最高階の微分が消えるので、境界条件を一つ失う**', 'theorem', 'physics', ['navier-stokes']),
  c('dalembert-paradox', 'd’Alembert の逆理', '粘性を落とすと抗力がゼロになる。**「小さいものは無視してよい」が成り立たない例**', 'theorem', 'physics', ['euler-equation-fluid']),
  c('singular-perturbation', '特異摂動', '小さい係数が最高階に付くと、極限が一様でない。**逆理の正体はこれで、流体に限らない**', 'viewpoint', 'physics', ['dalembert-paradox']),
  c('boundary-layer', '境界層', '壁の近くにだけ粘性が効く薄い層が残る。**そこで抗力が作られる**', 'theorem', 'physics', ['singular-perturbation']),
  c('reynolds-number', 'Reynolds 数', '慣性と粘性の比。**方程式を無次元化すると、これ一つしか残らない**', 'definition', 'physics', ['navier-stokes', 'buckingham-pi']),
  c('dynamic-similarity', '力学的相似', 'Reynolds 数が同じなら、大きさが違っても同じ解。**模型実験が成り立つ根拠**', 'theorem', 'physics', ['reynolds-number', 'similarity-transfers-experiments']),
  c('stokes-flow-reversible', '遅い流れは時間反転できる', '慣性項が落ちると方程式が時間について線形になる。**帆立貝は前に進めない**', 'theorem', 'physics', ['reynolds-number']),

  // 渦
  c('vorticity', '渦度', '速度場の回転。**流体の回転を、点ごとの量として測る**', 'definition', 'physics', ['grad-div-curl', 'material-derivative']),
  c('kelvin-circulation', 'Kelvin の循環定理', '非粘性なら、流れに乗った閉曲線の循環が保存する。**渦は作れも壊せもしない**', 'theorem', 'physics', ['vorticity', 'euler-equation-fluid', 'line-integral']),
  c('vortex-stretching', '渦の引き伸ばし', '渦管が伸びると渦度が増す。**三次元でだけ在る項で、二次元では恒等的に消える**', 'theorem', 'physics', ['vorticity']),
  c('two-dimensional-is-different', '二次元流体は別の系である', '引き伸ばしが無いので渦度が輸送されるだけ。**「次元を落とした近似」ではなく、保存量が一つ増えている**', 'viewpoint', 'physics', ['vortex-stretching']),
  c('helmholtz-decomposition', 'Helmholtz 分解', '任意のベクトル場が、発散の無い部分と回転の無い部分に一意に分かれる', 'theorem', 'physics', ['grad-div-curl', 'fundamental-solution']),
  c('potential-flow', 'ポテンシャル流', '渦度も粘性も無ければ、速度が調和関数の勾配。**流体の問題が Laplace 方程式になる**', 'theorem', 'physics', ['helmholtz-decomposition', 'harmonic-implies-analytic']),
  c('kutta-joukowski', 'Kutta–Joukowski の定理', '揚力が循環に比例する。**循環の値そのものは Euler 方程式から出ず、Kutta 条件という別の仮定が決める**', 'theorem', 'physics', ['potential-flow', 'line-integral', 'contour-integral']),

  // 乱流 ── どこまでが定理か
  c('turbulence-onset', '層流から乱流へ', 'Reynolds 数がある値を超えると層流解が不安定になる。**値は方程式からは出ない**', 'definition', 'physics', ['reynolds-number', 'bifurcation']),
  c('closure-problem', '閉じない', '平均を取ると未知数が増える。**方程式の数より未知数が多い、が構造として証明できる**', 'theorem', 'physics', ['turbulence-onset']),
  c('reynolds-stress-is-not-derived', '渦粘性は導出ではない', '閉じない分を粘性の形で埋める。**値は当てはめで、方程式からは出ない**', 'viewpoint', 'physics', ['closure-problem', 'eddy-diffusivity-is-fitted']),
  c('kolmogorov-cascade', 'Kolmogorov の $-5\\/3$ 則', '**次元解析と、エネルギー流束が一定という一つの仮定だけで指数が決まる**', 'theorem', 'physics', ['closure-problem', 'buckingham-pi']),
  c('intermittency-breaks-it', '間欠性が $-5\\/3$ を少しずらす', '高次モーメントは自己相似からずれる。**仮定した一様性が、実際には成り立っていない**', 'viewpoint', 'physics', ['kolmogorov-cascade']),
  c('dissipation-does-not-vanish', '粘性を下げても散逸が残る', '**極限が滑らかでない**という強い主張で、Euler 方程式の特異性の問題に直結する', 'viewpoint', 'physics', ['kolmogorov-cascade', 'singular-perturbation']),

  // 圧縮性と波
  c('sound-speed', '音速', '圧力の密度に対する微分の平方根。**線形化した方程式から出る**', 'theorem', 'physics', ['navier-stokes', 'second-order-classification']),
  c('mach-number-changes-the-type', 'Mach 数が方程式の型を変える', '**亜音速では楕円、超音速では双曲。**同じ方程式が、係数の符号だけで別の問いになる', 'theorem', 'physics', ['sound-speed', 'type-decides-what-can-be-said']),
  c('shock-thickness-is-set-by-viscosity', '衝撃波の厚みだけが粘性で決まる', '立ち上がりは非線形の輸送が作るので、**粘性は位置も強さも決めない。**跳びの大きさは保存則だけで出る', 'theorem', 'physics', ['mach-number-changes-the-type', 'wave-steepening', 'rankine-hugoniot']),
  c('rotating-frame', '回転系', '慣性系でない座標で書き直すと、遠心力と Coriolis 力が現れる。**力ではなく座標の項**', 'definition', 'physics', ['navier-stokes', 'change-of-basis']),
]
