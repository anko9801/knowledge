import type { Concept } from './types.ts'
import { c } from './types.ts'

export const quantum: readonly Concept[] = [
  // --- 量子力学（線形代数から論理的に決まる部分） ---------------------------------------------
  //
  // 「観測量はエルミート作用素」という要請は、測定値が実数で確率が 1 に
  // 足りてほしいという要求をスペクトル定理に翻訳したもの。導出的な依存である。
  c('hilbert-space', 'Hilbert 空間', '完備な内積空間。無限次元を扱う', 'definition', 'math', ['inner-product', 'completeness']),
  c('quantum-state', '量子状態', 'Hilbert 空間の単位ベクトル', 'definition', 'physics', ['hilbert-space']),
  c('observable', '観測量', '自己随伴作用素。実固有値と正規直交固有基底が要る', 'definition', 'physics', ['quantum-state', 'spectral-theorem']),
  c('born-rule', 'Born 則', '固有状態への射影の 2 乗が確率', 'definition', 'physics', ['observable', 'probability-space']),
  c('uncertainty-relation', '不確定性関係', '交換しない観測量は同時に確定しない', 'theorem', 'physics', ['observable', 'lie-bracket']),
  c('composite-system', '合成系', '状態空間はテンソル積。分解できない状態が残る', 'definition', 'physics', ['quantum-state', 'tensor-product']),
  c('entanglement', '量子もつれ', '単純テンソルでない状態', 'definition', 'physics', ['composite-system']),
  c('symmetrization-postulate', '対称化の要請', '同種粒子の状態は入れ替えで対称か反対称かのどちらか、と置く。どちらになるかは、ここでは決まらない', 'definition', 'physics', ['composite-system'], [], { aka: ['不可弁別性の要請'] }),
  c('quantum-channel', '量子通信路', '完全正値写像。古典の通信路の一般化', 'definition', 'cs', ['composite-system', 'channel-capacity']),
]
