import type { Concept } from './types.ts'
import { c } from './types.ts'

export const categories: readonly Concept[] = [
  // --- 意味論と圏論 ------------------------------------------------------------
  //
  // λ 項に数学的な対象を割り当てようとすると、Sets では詰まる。D ≅ D^D を
  // 満たす集合が一点しかないからである。そこを回避した二つの道が、そのまま
  // 「型を付ける」と「集合をやめる」に対応する。歴史的な偶然ではなく、
  // 同じ 1 つの障害への二つの応答である。
  //
  // 圏論は数学側にも要る（ホモロジー、代数幾何の講義ノートが待っている）が、
  // ここでは Curry--Howard--Lambek まで通す最短の骨だけを置く。
  c('domain-theory', 'ドメイン理論', '$D tilde.equiv D^D$ を満たす対象を作る。底を持つ完備半順序と最小不動点。Scott 1969', 'definition', 'math', ['relation-order', 'lambda-calculus']),
  c('denotational-semantics', '表示的意味論', 'プログラムに数学的対象を割り当てる。構文ではなく指す先で意味を決める', 'viewpoint', 'cs', ['domain-theory']),
  c('category', '圏', '対象と射、恒等射と結合律。中身を見ずに関係だけで話す', 'definition', 'math'),
  c('functor', '関手', '圏から圏への写像。恒等射と合成を保つ', 'definition', 'math', ['category']),
  c('adjunction', '随伴', 'Hom(FA, B) ≅ Hom(A, GB)。自由と忘却の対', 'definition', 'math', ['functor']),
  c('cartesian-closed-category', 'デカルト閉圏', '終対象・積・指数対象を持つ。カリー化は積と冪の随伴', 'definition', 'math', ['adjunction']),
  c('curry-howard-lambek', 'Curry–Howard–Lambek 対応', '型付き λ 計算＝直観主義論理＝デカルト閉圏。三つは同じもの', 'theorem', 'cs', ['cartesian-closed-category', 'curry-howard']),
]
