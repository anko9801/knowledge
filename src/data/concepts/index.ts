/**
 * 概念グラフの索引。
 *
 * 本体は連載ごとのファイルに分かれている。**1 ファイルに戻さないこと。**
 * 2026-09-02 に分けた。41 連載ぶんを教科書の水準まで広げるとき、
 * 1 ファイルだと並列で作業できない。
 *
 * 型とヘルパは `types.ts`。到達目標は下に置いてある。
 */
import type { Concept, Goal } from './types.ts'
import { foundations } from './foundations.ts'
import { linearAlgebra } from './linear-algebra.ts'
import { vectorAnalysis } from './vector-analysis.ts'
import { differentialForms } from './differential-forms.ts'
import { riemannianGeometry } from './riemannian-geometry.ts'
import { mathAhead } from './math-ahead.ts'
import { logic } from './logic.ts'
import { setTheory } from './set-theory.ts'
import { mechanics } from './mechanics.ts'
import { measure } from './measure.ts'
import { information } from './information.ts'
import { complexity } from './complexity.ts'
import { algorithms } from './algorithms.ts'
import { crypto } from './crypto.ts'
import { typesAndComputation } from './types-and-computation.ts'
import { categories } from './categories.ts'
import { cognitionMisc } from './cognition-misc.ts'
import { csMisc } from './cs-misc.ts'
import { architecture } from './architecture.ts'
import { concurrency } from './concurrency.ts'
import { quantum } from './quantum.ts'
import { newtonianMechanics } from './newtonian-mechanics.ts'
import { generalRelativity } from './general-relativity.ts'
import { specialRelativity } from './special-relativity.ts'
import { quantumFieldTheory } from './quantum-field-theory.ts'
import { analysis } from './analysis.ts'
import { mathMisc } from './math-misc.ts'
import { groups } from './groups.ts'
import { chemistryMisc } from './chemistry-misc.ts'
import { linguisticsMisc } from './linguistics-misc.ts'

export type { Concept, ConceptKind, Goal } from './types.ts'

export const concepts: readonly Concept[] = [
  ...foundations,
  ...linearAlgebra,
  ...vectorAnalysis,
  ...differentialForms,
  ...riemannianGeometry,
  ...mathAhead,
  ...logic,
  ...setTheory,
  ...mechanics,
  ...measure,
  ...information,
  ...complexity,
  ...algorithms,
  ...crypto,
  ...typesAndComputation,
  ...categories,
  ...cognitionMisc,
  ...csMisc,
  ...architecture,
  ...concurrency,
  ...quantum,
  ...newtonianMechanics,
  ...generalRelativity,
  ...specialRelativity,
  ...quantumFieldTheory,
  ...analysis,
  ...mathMisc,
  ...groups,
  ...chemistryMisc,
  ...linguisticsMisc,
]

/** 到達したい地点。ここから逆算して執筆計画を作る。 */
export const goals: readonly Goal[] = [
  {
    id: 'stokes',
    label: '一般化された Stokes の定理が読める',
    needs: ['stokes-theorem'],
  },
  {
    id: 'cohomology',
    label: '空間の穴を数えられる',
    needs: ['de-rham-cohomology', 'mayer-vietoris'],
  },
  {
    id: 'curvature-topology',
    label: '曲率が位相を縛ることが分かる',
    needs: ['gauss-bonnet', 'bonnet-myers', 'cartan-hadamard'],
  },
  {
    id: 'gauge',
    label: 'ゲージ理論の幾何が読める',
    needs: ['characteristic-class', 'principal-bundle', 'lie-algebra'],
  },
  {
    id: 'hodge',
    label: 'Hodge 理論が読める',
    needs: ['hodge-theory', 'de-rham-theorem'],
  },
  {
    id: 'incompleteness',
    label: '不完全性定理が読める',
    needs: ['incompleteness-theorem', 'tarski-undefinability'],
  },
  {
    id: 'independence',
    label: '連続体仮説の独立性が読める',
    needs: ['continuum-hypothesis'],
  },
  {
    id: 'analytical-mechanics',
    label: '解析力学が読める',
    needs: ['noether-theorem', 'canonical-formalism'],
  },
  {
    id: 'ab-effect',
    label: 'Aharonov--Bohm 効果が幾何として読める',
    needs: ['aharonov-bohm'],
  },
  {
    id: 'clt',
    label: '中心極限定理が測度論から読める',
    needs: ['central-limit-theorem'],
  },
  {
    id: 'shannon',
    label: 'Shannon の符号化定理が読める',
    needs: ['source-coding-theorem', 'channel-coding-theorem'],
  },
  {
    id: 'np-complete',
    label: 'NP 完全性が読める',
    needs: ['karp-reductions', 'time-hierarchy'],
  },
  {
    id: 'lower-bounds',
    label: 'これ以上速くならない線が、許した操作で決まると分かる',
    needs: ['model-change-moves-bound', 'streaming-space-lower-bound', 'inapproximability'],
  },
  {
    id: 'algorithms',
    label: 'どの作法がいつ効くかを、定理として言える',
    needs: ['master-theorem', 'greedy-optimality', 'maxflow-mincut', 'rounding'],
  },
  {
    id: 'named-architecture',
    label: '名前の付いた設計論が、どの定理の別名か分かる',
    needs: ['concentric-layers', 'behavioral-subtyping', 'coverage-limit'],
  },
  {
    id: 'crypto',
    label: '公開鍵暗号の安全性証明が読める',
    needs: ['public-key-encryption', 'zero-knowledge'],
  },
  {
    id: 'types',
    label: '型が命題であることが分かる',
    needs: ['curry-howard', 'parametricity', 'type-inference'],
  },
  {
    id: 'programs',
    label: 'プログラムの設計が三つの制約から読める',
    needs: ['representation-independence', 'referential-transparency', 'load-tradeoff', 'stable-dependency'],
  },
  {
    id: 'functional',
    label: '関数型が三つの制約から独立に導けると分かる',
    needs: ['mutable-state-as-goto', 'illegal-states-unrepresentable', 'purity-and-concurrency'],
  },
  {
    id: 'checking',
    label: '静的検査の限界が決定可能性から読める',
    needs: ['soundness-completeness-tradeoff', 'deliberate-unsoundness'],
  },
  {
    id: 'lambek',
    label: '型と論理と圏が同じものだと読める',
    needs: ['curry-howard-lambek', 'denotational-semantics'],
  },
  {
    id: 'architecture',
    label: '計算機の設計が制約から読める',
    needs: ['ilp-limit', 'virtual-memory', 'cache-coherence'],
  },
  {
    id: 'concurrency',
    label: '並行の正しさが定義できる',
    needs: ['flp-impossibility', 'consensus-number', 'memory-model'],
  },
  {
    id: 'quantum',
    label: '量子力学の公理が線形代数から読める',
    needs: ['born-rule', 'entanglement', 'uncertainty-relation'],
  },
  {
    id: 'selection-rules',
    label: '分子の選択則が群論から読める',
    needs: ['selection-rule', 'normal-modes'],
  },
  {
    id: 'formal-semantics',
    label: '自然言語の意味を型で組み上げられる',
    needs: ['montague-semantics', 'generalized-quantifier'],
  },
]
