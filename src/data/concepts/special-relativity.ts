import type { Concept } from './types.ts'
import { c } from './types.ts'

export const specialRelativity: readonly Concept[] = [
  // --- 特殊相対論 -------------------------------------------------------------
  //
  // 場の量子論が最初の一行で要求する。あちらの「粒子＝既約表現」も
  // 「一瞬で滲み出さない」も、ここが無いと書けない。
  c('relativity-principle', '相対性原理', 'どの慣性系も対等。特別な系が無い、という要請だけを置く', 'definition', 'physics', ['group']),
  c('lorentz-transformation', 'Lorentz 変換', '慣性系どうしを繋ぐ変換。相対性原理と等方性を課すと形がほぼ決まる', 'definition', 'physics', ['relativity-principle', 'linear-map']),
  c('invariant-speed-derived', '不変な速さは結論である', '光を持ち出さなくても定数が一つ残る。有限なら Lorentz、無限大なら Galilei', 'theorem', 'physics', ['lorentz-transformation']),
  c('relativity-of-simultaneity', '同時は観測者ごとに違う', '離れた二つの出来事の前後は、走っている人と止まっている人で入れ替わりうる', 'theorem', 'physics', ['lorentz-transformation']),
  c('proper-time', '固有時', '各自の時計が刻んだ量。経路に依るので、往復すると差が残る', 'definition', 'physics', ['minkowski-metric']),
  c('four-momentum', '四元運動量', 'エネルギーと運動量を一つに束ねる。長さが質量になる', 'definition', 'physics', ['minkowski-metric', 'proper-time']),
  c('mass-energy', '質量はエネルギーの一形態', '静止していても、質量のぶんのエネルギーを持っている', 'theorem', 'physics', ['four-momentum']),
  c('minkowski-metric', 'Minkowski 計量', '符号数 $(1,3)$ の内積。時間と空間が同じ土俵に乗る代わりに、正定値ではなくなる', 'definition', 'physics', ['lorentz-transformation', 'signature'], [], { aka: ['Lorentz 計量'] }),
  c('causal-structure', '因果構造', '光円錐。順序が誰から見ても同じなのは、時間的に離れた事象だけ', 'viewpoint', 'physics', ['minkowski-metric']),
  c('poincare-group', 'Poincaré 群', 'Lorentz 変換に並進を足した群。相対論が要請する対称性の全体', 'definition', 'physics', ['lorentz-transformation', 'group-action']),
  c('wigner-classification', '粒子は既約表現である', 'Poincaré 群の既約表現を数えると、ラベルが質量とスピンの二つになる', 'theorem', 'physics', ['poincare-group', 'irreducible-representation', 'hilbert-space'], [], { aka: ['小群による分類'] }),
]
