import type { Concept } from './types.ts'
import { c } from './types.ts'

export const mathMisc: readonly Concept[] = [
  // --- 位相の続き（mathlib の Topology.Separation / Order / Connected） ----------
  c('separation-axioms', '分離公理', 'Hausdorff、正則、正規。点をどこまで区別できるか', 'definition', 'math', ['topology-basics']),
  c('second-countable', '第二可算', '可算な基底を持つ。多様体の定義に入る', 'definition', 'math', ['topology-basics']),
  c('connectedness', '連結性', '二つの開集合に分けられない。弧状連結との差', 'definition', 'math', ['topology-basics']),
  c('order-topology', '順序位相', '順序から位相を入れる。実数の位相の出どころ', 'definition', 'math', ['topology-basics', 'relation-order']),
  c('lattice', '束', '任意の二元に上限と下限がある順序集合', 'definition', 'math', ['relation-order']),
  // --- 代数の土台（mathlib の Algebra.Field / Polynomial、RingTheory） ------------
  c('ring', '環', '足し算と掛け算。掛け算に逆元を要求しない', 'definition', 'math', ['group']),
  c('ideal', 'イデアル', '環の中で割り算をするための部分集合', 'definition', 'math', ['ring']),
  c('field', '体', '零でない元がすべて可逆な環。スカラーの住む場所', 'definition', 'math', ['ring']),
  c('polynomial-ring', '多項式環', '不定元を一つ足した環', 'definition', 'math', ['ring']),
  c('characteristic-polynomial', '固有多項式', 'det(A - λI)。固有値の定義に使う', 'definition', 'math', ['polynomial-ring', 'determinant']),
  // --- 確率の続き（mathlib の Probability.Distributions / Moments） --------------
  c('distribution', '分布', '確率変数が誘導する測度。正規、Poisson、指数', 'definition', 'math', ['random-variable']),
  c('moments', 'モーメント', '平均、分散、高次の積率。分布を特徴づける', 'definition', 'math', ['expectation', 'distribution']),
  c('concentration-inequality', '集中不等式', 'Markov、Chebyshev、Hoeffding。ずれの確率を抑える', 'theorem', 'math', ['moments']),
]
