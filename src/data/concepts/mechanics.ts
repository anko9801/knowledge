import type { Concept } from './types.ts'
import { c } from './types.ts'

export const mechanics: readonly Concept[] = [
  // --- 解析力学（物理） ----------------------------------------------------------
  c('why-not-force', '力では理論を指定できない', '座標に縛られ、対称性を課す文が書けない', 'viewpoint', 'physics', ['multivariable-calculus']),
  c('action-functional', '作用', '経路に数を割り当てる。局所性から積分の形しか残らない', 'definition', 'physics', ['why-not-force']),
  c('variational-principle', '変分原理', '停留する経路が実現する', 'definition', 'physics', ['action-functional'], [], { aka: ['最小作用の原理', 'Hamilton の原理'] }),
  c('euler-lagrange', 'Euler–Lagrange 方程式', '停留条件を書き下したもの', 'theorem', 'physics', ['variational-principle'], [], { aka: ['Lagrange 方程式'] }),
  c('lagrangian', 'ラグランジアン', '関数 1 本が理論のすべてを決める', 'definition', 'physics', ['euler-lagrange']),
  c('noether-theorem', 'Noether の定理', '対称性があれば保存量がある', 'theorem', 'physics', ['lagrangian', 'lie-group']),
  c('generalized-coordinates', '一般化座標', '拘束を座標の選び方に吸収する', 'definition', 'physics', ['euler-lagrange']),
  c('dalembert-principle', "d'Alembert の原理", '拘束力は仮想変位に仕事をしない。追加の仮定', 'definition', 'physics', ['generalized-coordinates']),
  c('hamiltonian', 'ハミルトニアン', 'Legendre 変換で L から作る、もう一つの書き方', 'definition', 'physics', ['lagrangian']),
  c('canonical-formalism', '正準形式', '相空間の上の流れとして運動を書く', 'viewpoint', 'physics', ['hamiltonian', 'symplectic-form'], [], { aka: ['Hamilton 形式'] }),
  c('gauge-potential', 'ゲージポテンシャル', '$A_mu$。観測量は $F$ だが理論を決めるのは $A$', 'definition', 'physics', ['lagrangian', 'one-form']),
  c('aharonov-bohm', 'Aharonov–Bohm 効果', '力が無いのに位相がずれる。作用の差が測れる', 'theorem', 'physics', ['gauge-potential', 'de-rham-cohomology']),
]
