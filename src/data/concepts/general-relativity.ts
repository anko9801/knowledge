import type { Concept } from './types.ts'
import { c } from './types.ts'

export const generalRelativity: readonly Concept[] = [
  // --- 一般相対論 -------------------------------------------------------------
  //
  // Riemann 幾何 8 本が既にあり、einstein-tensor も bianchi-identity も
  // /math/riemannian-geometry/6 に入っている。2026-08-20 に「数学の記事を
  // 物理のために書かない」と決めて Einstein 方程式を Riemann 6 から外したので、
  // その行き先がここになる。物理側は幾何を道具として使うだけでよい。
  c('equivalence-principle', '等価原理', '落ちている間は何も感じない。加速する座標へ移れば、その一点で重力は消える', 'viewpoint', 'physics', ['multivariable-calculus']),
  c('gravity-is-not-a-force', '重力は物体の性質ではない', 'すべての物体が同じ落ち方をするなら、それは物体ではなく場所について言っている', 'viewpoint', 'physics', ['equivalence-principle']),
  c('local-inertial-frame', '局所慣性系', '一点では消せる。正規座標がその表現で、消せるのは一点だけだと定理が言う', 'definition', 'physics', ['gravity-is-not-a-force', 'normal-coordinates']),
  c('tidal-force-is-curvature', '消えない残りが曲率である', '離れた二点の落ち方の差は、座標では消せない。それが測地線偏差そのもの', 'theorem', 'physics', ['local-inertial-frame', 'geodesic-deviation']),
  c('gravitational-redshift', '重力赤方偏移', '高いところの時計ほど速く進む。等価原理だけで出るので、場の方程式が要らない', 'theorem', 'physics', ['equivalence-principle']),
  c('light-deflection-factor-two', '曲がりが二倍になる', '等価原理だけだと Newton と同じ値が出る。観測はその二倍で、足りないのは空間の曲がりのぶん', 'theorem', 'physics', ['gravitational-redshift', 'tidal-force-is-curvature']),
  c('stress-energy-conservation', '右辺は発散が消えていなければならない', 'エネルギーと運動量が保存する、を曲がった場所で書き直したもの', 'definition', 'physics', ['noether-theorem', 'covariant-derivative']),
  c('einstein-equation', 'Einstein 方程式', '両辺に置けるものを絞ると、係数二つを除いて一つに決まる', 'theorem', 'physics', ['stress-energy-conservation', 'einstein-tensor', 'light-deflection-factor-two']),
  c('newtonian-limit', 'Newton 極限', '弱い場と遅い速さで Poisson 方程式に戻れ、と要求すると結合定数が決まる', 'theorem', 'physics', ['einstein-equation']),
  c('cosmological-constant', '決まらない係数', '幾何は二つ残す。片方は Newton 極限で決まり、もう片方は測るしかない', 'viewpoint', 'physics', ['newtonian-limit']),
  c('birkhoff-theorem', 'Birkhoff の定理', '真空で球対称なら解が一意に決まる。静的だと仮定していないのに静的になる', 'theorem', 'physics', ['einstein-equation']),
  c('schwarzschild-solution', 'Schwarzschild 解', '質量ひとつで外側の重力が全部決まる。星の中身は一切効かない', 'definition', 'physics', ['birkhoff-theorem']),
  c('coordinate-vs-curvature-singularity', '座標の穴と本物の穴', '計量が壊れても座標のせいのことがある。曲率の不変量を見れば区別が付く', 'theorem', 'physics', ['schwarzschild-solution', 'local-inertial-frame']),
  c('event-horizon', '事象の地平面', '光でも外へ出られない面。そこを渡る本人には何も起きない', 'definition', 'physics', ['coordinate-vs-curvature-singularity']),
  c('singularity-theorem', '特異点定理', '球対称を落としても特異点は残る。ただし証明が言うのは測地線が途切れることだけ', 'theorem', 'physics', ['event-horizon', 'causal-structure']),
  c('cosmological-principle', '一様等方を仮定する', 'どこも同じでどの向きも同じ、と置く。それだけで計量の形が三つに絞られる', 'definition', 'physics', ['schwarzschild-solution']),
  c('friedmann-equation', 'Friedmann 方程式', '一様等方を入れると、宇宙の大きさが従う式が一本だけ残る', 'theorem', 'physics', ['cosmological-principle', 'einstein-equation']),
  c('static-universe-unstable', '止まっている宇宙は保たない', '静的な解は作れるが、少し押すと崩れる。膨張か収縮しか残らない', 'theorem', 'physics', ['friedmann-equation', 'cosmological-constant']),
  c('horizon-problem', 'なぜ一様なのかは言えない', '因果的に繋がったことのない領域が同じ温度をしている。仮定を置いた側は理由を持たない', 'viewpoint', 'physics', ['cosmological-principle', 'causal-structure']),
  c('linearized-gravity', '弱い場で線形にする', '平坦からのずれを小さいとして展開すると、波動方程式が出る', 'technique', 'physics', ['einstein-equation']),
  c('gravitational-wave', '重力波', '横波で偏極が二つ。伸びる向きと縮む向きが四十五度ずれている', 'theorem', 'physics', ['linearized-gravity', 'birkhoff-theorem']),
  c('quadrupole-formula', '四重極公式', '出る量が質量分布の四重極の三階微分で決まる。だから桁が小さい', 'theorem', 'physics', ['gravitational-wave']),
]
