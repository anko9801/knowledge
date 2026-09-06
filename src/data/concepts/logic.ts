import type { Concept } from './types.ts'
import { c } from './types.ts'

export const logic: readonly Concept[] = [
  // --- 数理論理学 -------------------------------------------------------------
  c('formalization', '形式化', '証明そのものを数学の対象にする', 'viewpoint', 'math'),
  c('object-vs-metalanguage', '対象言語とメタ言語', '語る側と語られる側を分ける', 'viewpoint', 'math', ['formalization']),
  c('first-order-syntax', '一階述語論理の構文', '項と論理式。意味を与える前の形だけ', 'definition', 'math', ['formalization']),
  c('structure-semantics', '構造と解釈', '記号に具体的な集合と関係を割り当てる', 'definition', 'math', ['first-order-syntax']),
  c('satisfaction', '充足関係', 'M ⊨ φ。真であることの定義', 'definition', 'math', ['structure-semantics']),
  c('proof-system', '証明体系', '推論規則の有限な列として証明を定義する', 'definition', 'math', ['first-order-syntax']),
  c('soundness', '健全性', '証明できることは真である', 'theorem', 'math', ['proof-system', 'satisfaction']),
  c('completeness-theorem', '完全性定理', '真であることは証明できる。Henkin の構成', 'theorem', 'math', ['soundness']),
  c('compactness-theorem', 'コンパクト性定理', '有限部分が充足可能なら全体も充足可能', 'theorem', 'math', ['completeness-theorem']),
  c('nonstandard-model', '超準モデル', 'コンパクト性が生む、意図しないモデル', 'definition', 'math', ['compactness-theorem']),
  c('lowenheim-skolem', 'Löwenheim–Skolem の定理', '無限モデルがあれば任意濃度のモデルがある', 'theorem', 'math', ['compactness-theorem', 'cardinal']),
  c('elementary-substructure', '初等部分構造', '同じ論理式を満たす部分構造', 'definition', 'math', ['satisfaction']),
  c('computability', '計算可能性', '手続きで答えが出るとは何か', 'definition', 'math', ['formalization']),
  c('halting-problem', '停止問題', '決定できない問題が存在する', 'theorem', 'math', ['computability']),
  c('rice-theorem', 'Rice の定理', '非自明な意味的性質はすべて決定不能。停止問題の一般化', 'theorem', 'math', ['halting-problem']),
  c('godel-numbering', 'ゲーデル数化', '論理式と証明を自然数で符号化する', 'technique', 'math', ['first-order-syntax', 'computability']),
  c('diagonal-lemma', '対角化補題', '自分自身に言及する文が作れる', 'theorem', 'math', ['godel-numbering']),
  c('incompleteness-theorem', '不完全性定理', '無矛盾なら証明も反証もできない文がある', 'theorem', 'math', ['diagonal-lemma', 'proof-system']),
  c('tarski-undefinability', 'Tarski の定理', '真理は同じ言語の中では定義できない', 'theorem', 'math', ['diagonal-lemma', 'satisfaction']),
]
