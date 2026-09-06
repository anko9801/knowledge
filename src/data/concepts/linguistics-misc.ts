import type { Concept } from './types.ts'
import { c } from './types.ts'

export const linguisticsMisc: readonly Concept[] = [
  // --- 形式意味論（言語学のうち論理で決まる部分） ---------------------------------------------
  //
  // 「どの統語理論が正しいか」は経験的だが、
  // 「この文の意味をどう組み上げるか」は型付きλ計算で決まる。
  // λ 計算そのものは「型と計算」に置いてある。ここは言語学側の辺だけ。
  c('compositionality', '合成性', '全体の意味は部分の意味と組み方で決まる', 'viewpoint', 'linguistics', ['simply-typed-lambda']),
  c('montague-semantics', 'モンタギュー意味論', '自然文を型付き λ 項に翻訳する', 'technique', 'linguistics', ['compositionality', 'structure-semantics']),
  c('generalized-quantifier', '一般化量化子', '「すべての」「ほとんどの」を集合の集合として扱う', 'definition', 'linguistics', ['montague-semantics']),

  // Brouwer は経済学のために置いていたが、あちらを落としても残す。
  // ホモロジーの到達点として正当なので、下流 0 の葉のままでよい。
  c('brouwer-fixed-point', 'Brouwer の不動点定理', '球体の連続自己写像は不動点を持つ', 'theorem', 'math', ['topology-basics', 'homotopy']),
]
