import type { Concept } from './types.ts'
import { c } from './types.ts'

export const setTheory: readonly Concept[] = [
  // --- 集合論 ---------------------------------------------------------------
  c('russell-paradox', 'Russell のパラドックス', '素朴な内包公理が矛盾する', 'theorem', 'math', ['formalization']),
  c('zfc-axioms', 'ZFC 公理系', '集合を作る手続きだけを認める', 'definition', 'math', ['russell-paradox', 'first-order-syntax']),
  c('relation-order', '関係と順序', '順序を集合の言葉で書く', 'definition', 'math', ['zfc-axioms']),
  c('well-order', '整列順序', '空でない部分集合が最小元を持つ', 'definition', 'math', ['relation-order']),
  c('ordinal', '順序数', '整列順序の型。それ自身が集合', 'definition', 'math', ['well-order']),
  c('transfinite-induction', '超限帰納法', '順序数に沿って帰納する', 'technique', 'math', ['ordinal']),
  c('cardinal', '基数', '濃度。全単射があるかどうかで測る', 'definition', 'math', ['ordinal']),
  c('cantor-theorem', 'Cantor の定理', '$abs(X) < abs(2^X)$。無限に大きさの差がある', 'theorem', 'math', ['cardinal']),
  c('axiom-of-choice', '選択公理', '選び方を明示せずに選べると認める', 'definition', 'math', ['zfc-axioms']),
  c('zorn-lemma', 'Zorn の補題', '選択公理と同値。極大元の存在', 'theorem', 'math', ['axiom-of-choice', 'well-order']),
  c('cumulative-hierarchy', '累積階層', '$V_alpha$ を順序数で積み上げる', 'definition', 'math', ['ordinal', 'zfc-axioms']),
  c('relative-consistency', '相対無矛盾性', '「T が無矛盾なら T + φ も」の形の主張', 'viewpoint', 'math', ['cumulative-hierarchy', 'incompleteness-theorem']),
  c('absoluteness', '絶対性', 'モデルを移しても真偽が変わらない論理式', 'definition', 'math', ['satisfaction', 'cumulative-hierarchy']),
  c('countable-transitive-model', '可算推移モデル', '外から見れば可算な、ZFC のモデル', 'definition', 'math', ['absoluteness', 'lowenheim-skolem']),
  c('constructible-universe', '構成可能宇宙 L', '定義できる集合だけを積み上げる', 'definition', 'math', ['cumulative-hierarchy', 'absoluteness']),
  c('forcing', '強制法', '外から集合を付け加えてモデルを広げる', 'technique', 'math', ['countable-transitive-model']),
  c('truth-lemma', '真理補題', '拡大したモデルでの真偽を、元のモデルの中で判定する', 'theorem', 'math', ['forcing']),
  c('continuum-hypothesis', '連続体仮説の独立性', 'L と強制法の両方から。証明も反証もできない', 'theorem', 'math', ['constructible-universe', 'truth-lemma', 'cantor-theorem']),
  c('descriptive-set-theory', '記述集合論', '実数の部分集合を、定義の複雑さで階層に分ける', 'definition', 'math', ['ordinal', 'topology-basics']),
]
