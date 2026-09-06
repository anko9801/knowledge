import type { Concept } from './types.ts'
import { c } from './types.ts'

export const graphTheory: readonly Concept[] = [
  // --- グラフ ---------------------------------------------------------------
  //
  // **21 本の分野調査のうち三本が、独立に「グラフが概念グラフに無い」と報告した。**
  // アルゴリズム（探索・最短路・流れ）、社会ネットワーク（構造均衡・カスケード）、
  // 組合せ論（平面性・彩色・極値）が、全部ここを要求している。
  //
  // ここに置くのは、その三つが共有する分だけ。定理は各連載の側にある。
  c('graph', 'グラフ', '点と辺。隣接という関係だけを残して、他を全部捨てた対象', 'definition', 'math', ['relation-order']),
  c('path-and-cycle', '道と閉路', '点をたどった列。閉路が在るかどうかが、グラフの性質をほとんど決める', 'definition', 'math', ['graph']),
  c('bipartite', '二部性', '二色に塗り分けられることと、奇数長の閉路が無いことが同値', 'theorem', 'math', ['path-and-cycle']),
  c('degree-distribution', '次数分布', '点ごとの辺の本数の分布。平均だけでは形が決まらない', 'definition', 'math', ['graph', 'distribution']),
]
