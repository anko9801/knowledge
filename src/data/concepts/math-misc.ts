import type { Concept } from './types.ts'
import { c } from './types.ts'

export const mathMisc: readonly Concept[] = [
  // --- 位相の続き（mathlib の Topology.Separation / Order / Connected） ----------
  c('order-topology', '順序位相', '順序から位相を入れる。実数の位相の出どころ', 'definition', 'math', ['topology-basics', 'relation-order']),
  c('lattice', '束', '任意の二元に上限と下限がある順序集合。**結晶格子でも点格子でもない**（`point-lattice` は別の概念）', 'definition', 'math', ['relation-order']),
  // --- 代数の土台（mathlib の Algebra.Field / Polynomial、RingTheory） ------------
  // --- 確率の続き（mathlib の Probability.Distributions / Moments） --------------
  c('brouwer-fixed-point', 'Brouwer の不動点定理', '球体の連続自己写像は不動点を持つ', 'theorem', 'math', ['topology-basics', 'homotopy']),
]
