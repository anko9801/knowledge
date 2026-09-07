import type { Derivation } from './types.ts'

/**
 * 仮定と、それを定理として出す場所の対応。
 *
 * この site の軸そのものである。ある連載が要請として置いたものが、
 * 別の連載では結論になる。読者にとっていちばん値打ちのある繋がりが
 * これなのに、`requires` では書けない ── 仮定を導く定理は、その仮定より
 * **後**に来るので、依存の辺にすると向きが逆さになる。
 *
 * 分野をまたぐ関係なので、概念の側には置かない。どちらのファイルが
 * 持つべきかが決まらず、片側だけ直すと壊れる。
 *
 * **同じ結論に導出が二本ある場合、結論のほうは割らない。** 割るのは仮定である。
 * 排他律は量子力学でも場の量子論でも同じ主張で、違うのは何を認めたかのほうだから、
 * 対称化の要請に名前を付けて、それを出す定理へ繋ぐ。
 *
 * **同じ結論を五箇所が別々に証明していることもある。** Cantor・Tarski・停止問題・
 * 時間階層・対角化補題は全部 Lawvere の不動点定理の対偶で、辺が一本も無かった。
 * この五本は「よその仮定を出す」の一種である ── 各連載が対角線を**手として**
 * 置いていて、それが一つの定理だとは言っていない。
 */
export const derivations: readonly Derivation[] = [
  {
    assumed: 'symmetrization-postulate',
    derived: 'spin-statistics-theorem',
    note: '量子力学は対称か反対称かを要請として置き、どちらを取るかをスピンから決められない。場の量子論は微視的因果律と正定値性から、その対応を出す',
  },
  {
    assumed: 'observable',
    derived: 'symmetric-vs-selfadjoint',
    note: '「エルミート」は内積を挟んで移せることしか言っていない。自己共役はそれに加えて定義域が一致することを言う。差が出る場所では、同じ式を書いても物理の答えが一つに決まらない',
  },
  {
    assumed: 'unitary-time-evolution',
    derived: 'stone-theorem',
    note: '時間発展がユニタリであることは要請として置かれ、生成子が Hamiltonian だとされる。定理の側は、その対応が一対一であること、そして対称なだけの作用素では時間発展が定まらないことを言う',
  },
  {
    assumed: 'hamiltonian',
    derived: 'convex-conjugate',
    note: '解析力学は Legendre 変換が戻せることを黙って置く。凸解析は $f^(**) = f$ が凸かつ閉のときだけ成り立つと言い、戻せない場合（Hesse が退化する特異ラグランジアン）が拘束系になる',
  },
  {
    assumed: 'effective-potential',
    derived: 'convex-conjugate',
    note: '場の理論は有効ポテンシャルを定義として置き、谷が二つある絵を描く。共役は元が凸でなくても必ず凸なので、厳密な有効ポテンシャルに狭義の二山は立たない。二山は近似が壊れた跡である',
  },
  {
    assumed: 'diagonal-lemma',
    derived: 'lawvere-fixed-point',
    note: '論理は対角化を技法として置く。デカルト閉圏で自己適用を許すと、同じ一行が定理になる。文の集合に入れれば対角化補題そのもの',
  },
  {
    assumed: 'cantor-theorem',
    derived: 'lawvere-fixed-point',
    note: '集合論は「対角線を取る」を証明の手として置く。不動点定理に $g = not$ を入れると出る。否定に不動点が無いことだけが使われている',
  },
  {
    assumed: 'tarski-undefinability',
    derived: 'lawvere-fixed-point',
    note: '真理述語が在るとすれば、その否定が不動点を持たないので点全射が存在しない。Cantor と同じ $g$ を、文の集合の上で使う',
  },
  {
    assumed: 'halting-problem',
    derived: 'lawvere-fixed-point',
    note: '停止判定が在るとして、答えを反転する機械を作る操作が $g$ にあたる。反転に不動点が無い',
  },
  {
    assumed: 'time-hierarchy',
    derived: 'lawvere-fixed-point',
    note: '対角化で作った言語が小さい時間の外に出ることを言う。同じ形だが、$g$ を計算するのに時間が要るので、余分に食う分が階層の隙間になる',
  },
  {
    assumed: 'ergodic-hypothesis',
    derived: 'birkhoff-ergodic-theorem',
    note: '統計力学は時間平均と位相平均が一致することを仮定として置く。力学系の側は、時間平均が収束すること**だけ**を無条件に出し、一致は不変集合が自明な場合に限ると言う。二つを一つの概念に潰すと、何が定理で何が仮定かが読めなくなる',
  },
  {
    assumed: 'conserved-quantity-reduces',
    derived: 'noether-theorem',
    note: '力学は保存量を見つかったものとして使い、なぜ在るのかは言わない。解析力学は対称性から作る',
  },
]
