import type { Concept } from './types.ts'
import { c } from './types.ts'

export const groups: readonly Concept[] = [
  // --- 群の表現論 -------------------------------------------------------------
  c('group-action', '群作用', '群が集合に作用する。軌道と固定部分群', 'definition', 'math', ['group']),
  c('representation', '表現', '群を線形写像として実現する', 'definition', 'math', ['group-action', 'linear-map']),
  c('irreducible-representation', '既約表現', 'それ以上分解できない表現', 'definition', 'math', ['representation', 'quotient-space']),
  c('schur-lemma', 'Schur の補題', '既約表現の間の準同型は 0 かスカラー倍', 'theorem', 'math', ['irreducible-representation']),
  c('character-theory', '指標', '表現の跡。基底に依らないので分類に使える', 'definition', 'math', ['irreducible-representation', 'contraction']),
  c('orthogonality-relations', '指標の直交関係', '既約指標が直交基底をなす', 'theorem', 'math', ['character-theory', 'schur-lemma', 'inner-product']),
]
