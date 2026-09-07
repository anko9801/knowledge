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
  c('vector-bundle', 'ベクトル束', '各点にベクトル空間を付ける。接束の一般化', 'definition', 'math', ['manifold', 'vector-space']),
  c('principal-bundle', '主束', '各点に群を付ける。ゲージ理論の舞台', 'definition', 'math', ['vector-bundle', 'lie-group']),
  c('bundle-connection', '束の接続', '接続を接束から一般の束へ広げる', 'definition', 'math', ['vector-bundle', 'connection']),
  c('characteristic-class', '特性類', '曲率から作った不変式が位相不変量になる', 'definition', 'math', ['bundle-connection', 'de-rham-cohomology']),
  c('lie-group', 'Lie 群', '群であり多様体でもあるもの', 'definition', 'math', ['group', 'manifold']),
  c('lie-algebra', 'Lie 代数', 'Lie 群の単位元での接空間。括弧を持つ', 'definition', 'math', ['lie-group', 'lie-bracket']),
]
