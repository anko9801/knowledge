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
 * まだ二つしかない。仮定に名前が付いていない連載が多いためで、
 * 教科書の水準まで広げると増える。
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
    derived: 'cartesian-closed-category',
    note: '論理は対角化を技法として置く。デカルト閉圏で自己適用を許すと、Cantor・Tarski・停止問題・時間階層が一つの不動点定理の対偶として出る',
  },
  {
    assumed: 'conserved-quantity-reduces',
    derived: 'noether-theorem',
    note: '力学は保存量を見つかったものとして使い、なぜ在るのかは言わない。解析力学は対称性から作る',
  },
]
