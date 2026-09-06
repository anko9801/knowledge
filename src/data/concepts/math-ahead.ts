import type { Concept } from './types.ts'
import { c } from './types.ts'

export const mathAhead: readonly Concept[] = [
  // --- まだ記事の無い先 ----------------------------------------------------------
  c('singular-homology', '特異ホモロジー', '三角形を貼って穴を数える。位相の側', 'definition', 'math', ['topology-basics', 'homotopy']),
  c('betti-numbers', 'Betti 数', '$b_k = dim H^k$。穴の個数', 'definition', 'math', ['de-rham-cohomology']),
  c('euler-characteristic', 'Euler 標数', '$chi = sum (-1)^k b_k$', 'definition', 'math', ['betti-numbers']),
  c('hodge-theory', 'Hodge 理論', '各コホモロジー類に最も滑らかな代表元が一つ', 'theorem', 'math', ['de-rham-cohomology', 'hodge-star', 'riemannian-metric', 'laplacian']),
  c('vector-bundle', 'ベクトル束', '各点にベクトル空間を付ける。接束の一般化', 'definition', 'math', ['manifold', 'vector-space']),
  c('principal-bundle', '主束', '各点に群を付ける。ゲージ理論の舞台', 'definition', 'math', ['vector-bundle', 'lie-group']),
  c('bundle-connection', '束の接続', '接続を接束から一般の束へ広げる', 'definition', 'math', ['vector-bundle', 'connection']),
  c('characteristic-class', '特性類', '曲率から作った不変式が位相不変量になる', 'definition', 'math', ['bundle-connection', 'de-rham-cohomology']),
  c('lie-group', 'Lie 群', '群であり多様体でもあるもの', 'definition', 'math', ['group', 'manifold']),
  c('lie-algebra', 'Lie 代数', 'Lie 群の単位元での接空間。括弧を持つ', 'definition', 'math', ['lie-group', 'lie-bracket']),
  c('ricci-flow', 'Ricci flow', '$partial_t g = -2 upright("Ric")$ で計量を均す', 'technique', 'math', ['ricci-tensor', 'bonnet-myers']),
]
