import type { Concept } from './types.ts'
import { c } from './types.ts'

export const algorithms: readonly Concept[] = [
  // --- アルゴリズム ------------------------------------------------------------
  //
  // 手続きを並べると事例の集積になるので、そう切らない。分割統治も動的計画も
  // 貪欲も償却も、どれにも「いつ効くか」の定理が付いていて、そちらが概念で
  // ある。貪欲が最適になるのはマトロイドのとき、そのときだけ（Rado--Edmonds）。
  // 作法ではなく定理である。
  //
  // 計算量理論と対にする。あちらが「これ以上は無理」を言う側で、こちらが
  // 届かせる側。同じ近似アルゴリズムでも、限界はあちら、作り方はこちらになる。
  c('divide-and-conquer', '分割統治', '部分問題の個数と大きさが、そのまま漸化式になる', 'technique', 'cs', ['computation-model']),
  c('master-theorem', 'Master 定理', '三つの場合。時間が根に集まるか、葉に集まるか、釣り合うか', 'theorem', 'cs', ['divide-and-conquer', 'landau-notation']),
  c('optimal-substructure', '最適部分構造', '部分問題の最適解から全体の最適解が組める条件', 'definition', 'cs', ['divide-and-conquer']),
  c('subproblem-count', '表の大きさが上界', '動的計画の計算量は部分問題の個数。メモ化が効く理由はこれだけ', 'theorem', 'cs', ['optimal-substructure']),
  c('matroid', 'マトロイド', '独立性の抽象。交換公理を満たす集合族', 'definition', 'cs', ['relation-order']),
  c('greedy-optimality', '貪欲が最適になる条件', 'Rado--Edmonds。マトロイドのとき、そのときだけ', 'theorem', 'cs', ['matroid']),
  c('amortized-analysis', '償却解析', '一手ではなく列で測る。ポテンシャル関数が一つ取れれば言える', 'technique', 'cs', ['computation-model']),
  c('union-find', 'Union--Find', '経路圧縮と併合で、逆 Ackermann 関数まで落ちる', 'theorem', 'cs', ['amortized-analysis']),
  c('randomization-as-resource', '乱択を資源に数える', '最悪ではなく期待値で測る。相手が最悪入力を選べなくなる', 'viewpoint', 'cs', ['computation-model', 'probability-space']),
  c('universal-hashing', '万能ハッシュ', '関数のほうを乱択で選ぶ。どの入力にも悪い相手がいなくなる', 'technique', 'cs', ['randomization-as-resource', 'expectation']),
  // LP 双対性は凸性を要求するのに、グラフに凸集合が一つも無かった。数学側に足す。
  c('convex-set', '凸集合', '二点を結ぶ線分が中に入る集合', 'definition', 'math', ['vector-space']),
  c('separating-hyperplane', '分離超平面', '交わらない凸集合の間には超平面が入る', 'theorem', 'math', ['convex-set', 'inner-product']),
  c('farkas-lemma', 'Farkas の補題', '解が無いなら、無いことの証明が必ず一つ書ける。二択の形', 'theorem', 'math', ['separating-hyperplane']),
  c('linear-program', '線形計画', '線形な制約の下で線形な目的を最適化する', 'definition', 'cs', ['convex-set', 'linear-map']),
  c('lp-duality', 'LP 双対性', '任意の双対実行可能解が、主問題の下界になる。証明は Farkas', 'theorem', 'cs', ['linear-program', 'farkas-lemma']),
  c('maxflow-mincut', '最大流最小カット', 'LP 双対の特別な場合。カットが流量の証明書になる', 'theorem', 'cs', ['lp-duality', 'connectedness']),
  c('matching-duality', 'マッチングと被覆の双対', 'König と Hall。同じ双対の別の顔', 'theorem', 'cs', ['maxflow-mincut']),
  c('integrality', '整数性', '緩和の解が勝手に整数になる多面体。そのときだけ丸めが要らない', 'theorem', 'cs', ['lp-duality', 'matroid']),
  c('lp-relaxation', '線形緩和', '整数条件を外すと解ける。答えは元の問題の下界になる', 'technique', 'cs', ['lp-duality']),
  c('approximation-ratio', '近似比', '最適解を知らないまま比を証明する。証拠に双対解を使う', 'definition', 'cs', ['lp-relaxation']),
  c('rounding', '丸め', '緩和の解を整数へ戻す。戻すときに払う代償が近似比になる', 'technique', 'cs', ['approximation-ratio', 'integrality']),
  c('online-competitive-ratio', '競合比', '未来を知らずに決める。全部知っている相手との比で測る', 'definition', 'cs', ['adversary-argument', 'randomization-as-resource']),
  c('work-span', 'work と span', '並列の速さは仕事量と臨界パスで決まる。Amdahl の一般形', 'theorem', 'cs', ['amdahl-law', 'instruction-dependency']),
  c('cache-oblivious', 'キャッシュ無関係', '階層のパラメータを知らずに最適になる分割の仕方', 'technique', 'cs', ['divide-and-conquer', 'memory-hierarchy']),
]
