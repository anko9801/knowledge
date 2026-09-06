import type { Concept } from './types.ts'
import { c } from './types.ts'

export const mathMisc: readonly Concept[] = [
  // --- 位相の続き（mathlib の Topology.Separation / Order / Connected） ----------
  c('order-topology', '順序位相', '順序から位相を入れる。実数の位相の出どころ', 'definition', 'math', ['topology-basics', 'relation-order']),
  c('lattice', '束', '任意の二元に上限と下限がある順序集合', 'definition', 'math', ['relation-order']),
  // --- 代数の土台（mathlib の Algebra.Field / Polynomial、RingTheory） ------------
  c('ring', '環', '足し算と掛け算。掛け算に逆元を要求しない', 'definition', 'math', ['group']),
  c('ideal', 'イデアル', '環の中で割り算をするための部分集合', 'definition', 'math', ['ring']),
  c('field', '体', '零でない元がすべて可逆な環。スカラーの住む場所', 'definition', 'math', ['ring']),
  c('polynomial-ring', '多項式環', '不定元を一つ足した環', 'definition', 'math', ['ring']),
  c('characteristic-polynomial', '固有多項式', 'det(A - λI)。固有値の定義に使う', 'definition', 'math', ['polynomial-ring', 'determinant']),
  // --- 確率の続き（mathlib の Probability.Distributions / Moments） --------------
  c('brouwer-fixed-point', 'Brouwer の不動点定理', '球体の連続自己写像は不動点を持つ', 'theorem', 'math', ['topology-basics', 'homotopy']),
]
