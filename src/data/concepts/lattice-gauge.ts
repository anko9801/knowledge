import type { Concept } from './types.ts'
import { c } from './types.ts'

export const latticeGauge: readonly Concept[] = [
  // --- 格子ゲージ理論 ----------------------------------------------------------
  //
  // **規準の教科書例。** Nielsen–Ninomiya のノーゴー定理は
  // 「四つを同時に要求すると両立しない」の形そのもので、
  // しかも**どれを捨てるかで手法が分かれる**ところまで見える。
  //
  // もう一つの軸は**「近似ではなく定義である」**。
  // 格子は連続理論の近似ではなく、**場の理論に非摂動的な定義を与える唯一の方法**
  // である。積分が有限次元になり、測度が定義できる。
  //
  // **Nielsen–Ninomiya は Poincaré–Hopf ではない**（`docs/decisions.md`）。
  // 英語版 Wikipedia がそう書いているが、消えるのは Hamiltonian 束の Euler 類で、
  // 底空間の接束ではない。
  c('lattice-is-a-definition', '格子は近似ではなく定義である', '**自由度が有限になるので、積分が本当に定義できる。**連続極限を取ることで、はじめて理論が在ると言える', 'viewpoint', 'physics', ['measure-not-defined', 'lattice-regularization-cuts-momentum']),
  c('lattice-regularization-cuts-momentum', '格子が運動量に上限を与える', '**Brillouin ゾーンの外が無い。**紫外発散が、正則化としてではなく構造として消える', 'definition', 'physics', ['measure-not-defined', 'reciprocal-lattice']),
  c('wick-rotation-makes-it-statistical', 'Euclid 化すると、統計力学になる', '**振動する積分が正の重みになる。**場の理論の問題が、格子スピン系の問題に翻訳される', 'technique', 'physics', ['lattice-is-a-definition', 'boltzmann-distribution']),
  c('link-variables-keep-gauge-invariance', 'リンク変数がゲージ不変性を守る', '場を辺の上の群の元として置く。**離散化しても対称性が厳密に残る、という設計**', 'definition', 'physics', ['lattice-is-a-definition', 'principal-bundle']),
  c('wilson-action', 'Wilson の作用', 'プラケットのトレース。**連続極限で Yang–Mills の作用に戻ることが、展開して確かめられる**', 'definition', 'physics', ['link-variables-keep-gauge-invariance', 'wilson-loop-area-law']),
  c('strong-coupling-gives-confinement', '強結合では、閉じ込めが厳密に出る', '**面積則が展開の最低次で出る。**ただしそこは連続極限から遠く、そのまま結論にはできない', 'theorem', 'physics', ['wilson-action', 'confinement-not-derived']),
  c('continuum-limit-is-a-critical-point', '連続極限は臨界点である', '**相関長が格子間隔の何倍にもなる点へ寄せる。**くりこみ群の固定点に近づくこととして書ける', 'theorem', 'physics', ['wick-rotation-makes-it-statistical', 'wilsonian-renormalization', 'critical-point']),
  c('asymptotic-freedom-tells-where-to-go', 'どちらへ寄せるかは、漸近自由性が決める', '**結合定数をゼロへ送ることが、連続極限に対応する。**方向が理論から出る', 'theorem', 'physics', ['continuum-limit-is-a-critical-point', 'asymptotic-freedom']),

  // ノーゴー ── 四つを同時に要求できない
  c('naive-fermion-doubling', '素朴に離散化すると、粒子が増える', '**1 種類を置いたはずが $2^d$ 種類出る。**運動量空間で、ゾーンの端にも零点ができてしまう', 'theorem', 'physics', ['lattice-regularization-cuts-momentum', 'chiral-gauge-theory']),
  c('nielsen-ninomiya', 'Nielsen–Ninomiya のノーゴー定理', '**局所性・カイラル対称性・二重化しないこと・エルミート性の四つは、同時には満たせない。**どれか一つを必ず捨てる', 'theorem', 'physics', ['naive-fermion-doubling']),
  c('nn-is-not-poincare-hopf', '接束の Euler 標数から出るのではない', '**Wikipedia の説明は誤り。**消えるのは Hamiltonian 束の Euler 類（ファイバー次元が奇数だから）で、Bloch Hamiltonian はトーラス上の接ベクトル場ではない', 'viewpoint', 'physics', ['nielsen-ninomiya']),
  c('which-one-you-drop-names-the-method', 'どれを捨てるかが、手法の名前になる', '**Wilson はカイラル対称性を捨て、staggered は種類を減らすだけ、overlap は対称性を変形して残す。**分類が捨てたもので付く', 'viewpoint', 'physics', ['nielsen-ninomiya']),
  c('ginsparg-wilson-relation', 'Ginsparg–Wilson 関係式', '**格子の上で、変形されたカイラル対称性が厳密に成り立つ。**「捨てる」以外の道が一つだけ在る', 'theorem', 'physics', ['which-one-you-drop-names-the-method']),
  c('index-theorem-on-the-lattice', '指数定理が格子の上でも成り立つ', '**カイラルなゼロモードの数が、位相的な量に等しい。**アノマリーが連続極限を取る前から在る', 'theorem', 'physics', ['ginsparg-wilson-relation', 'chiral-anomaly', 'characteristic-class']),

  // 何が計算できて、何ができないか
  c('monte-carlo-importance-sampling', '重み付き標本抽出', '**Euclid 化で重みが正になったので、確率として扱える。**Metropolis がそのまま使える', 'technique', 'physics', ['wick-rotation-makes-it-statistical', 'markov-chain']),
  c('sign-problem', '符号問題', '**化学ポテンシャルを入れると重みが正でなくなり、標本抽出が破綻する。**誤差が体積の指数で増える', 'theorem', 'physics', ['monte-carlo-importance-sampling']),
  c('sign-problem-is-np-hard', '一般には NP 困難である', '**「もっと良い算法を探す」で解決する保証が無い、と計算量の言葉で言える**', 'theorem', 'physics', ['sign-problem', 'np-completeness']),
  c('what-lattice-computes', '格子が計算できるもの', 'ハドロン質量、崩壊定数、有限温度の転移。**核力もここでようやく手が届き始めた**', 'viewpoint', 'physics', ['monte-carlo-importance-sampling', 'nuclear-force-is-not-derived']),
  c('what-lattice-cannot-do', '計算できないもの', '**高密度（符号問題）と、実時間の発展（重みが振動する）。**中性子星の内部も衝突の動力学も、この外に在る', 'viewpoint', 'physics', ['sign-problem-is-np-hard', 'neutron-star-limit-is-unknown']),
  c('systematic-errors-must-be-quoted', '誤差は三つ数えないといけない', '**統計誤差・有限体積・格子間隔。**後ろ二つは外挿で、そこが結果の信頼性を決める', 'viewpoint', 'physics', ['continuum-limit-is-a-critical-point', 'error-splits-in-two']),
]
