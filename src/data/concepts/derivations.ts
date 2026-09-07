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
    assumed: 'uncertainty-relation',
    derived: 'cramer-rao-is-heisenberg-for-real-amplitudes',
    note: '量子力学は交換子から不確定性を出し、そこで止まる。統計の側は、位置母数の Cramér–Rao がまったく同じ不等式であること、そして差が Stam の不等式ちょうどであることを言う。Dembo–Cover–Thomas 1991 §IV が逐語で "exactly" と書いている',
  },
  {
    assumed: 'exchangeability-genetic',
    derived: 'de-finetti-representation',
    note: '集団遺伝学は複製に区別が無いことを中立性の定義として置く。表現定理の側は、交換可能なら独立同分布の混合として一意に書けると言う。Kingman のペイントボックスは、この de Finetti 測度そのものである',
  },
  {
    assumed: 'symmetrization-postulate',
    derived: 'quantum-de-finetti',
    note: '量子力学は同種粒子の状態が置換で不変だと要請する。表現定理の側は、その対称性だけから部分系が積状態の混合に近いことを出す。平均場近似が Hamiltonian の中身を使わずに正当化される',
  },
  {
    assumed: 'entropy-thermodynamic',
    derived: 'one-number-cannot-decide',
    note: '熱力学はエントロピーが増える向きにしか進まないと言う。優越の側は、それが必要条件でしかないことを反例で示す。増えるのに移れない状態対があり、しかもどの単調量に取り替えても直らない',
  },
  {
    assumed: 'observable',
    derived: 'spectral-theorem-bounded-selfadjoint',
    note: '量子力学は観測量を自己共役作用素と置き、固有値が測定値だと言う。関数解析の側は、固有基底が取れない場合にも関数計算が定義できることを示す。有限次元の直感がどこまで持つかが、ここで初めて言える',
  },
  {
    assumed: 'scale-is-an-interval-at-best',
    derived: 'uniqueness-theorem-measurement',
    note: '心理測定は尺度が間隔までしか定まらないことを注意として置く。測定の表現定理の側は、それがなぜかを言う ── 加法の操作が定義できないので、一意性の群が正の一次変換より狭くならない',
  },
  {
    assumed: 'just-intervals-are-a-lattice',
    derived: 'harmonics-are-eigenvalues',
    note: '音律は倍音が整数比であることを出発点に置く。音響の側は、それが一次元の境界値問題の固有値だから成り立つと言う。膜や板では比が整数にならず、そこでは格子そのものが立たない',
  },
  {
    assumed: 'linear-code',
    derived: 'gilbert-varshamov',
    note: '情報理論は符号を定義として置き、Shannon の定理で良い符号が在るとだけ言う。符号理論の側は、貪欲に選べば必ずこれだけ取れるという下界を構成で出し、同時に三つの上界で挟む。存在の主張が、具体的な数の範囲になる',
  },
  {
    assumed: 'confinement-not-derived',
    derived: 'strong-coupling-gives-confinement',
    note: '標準模型は閉じ込めを観測事実として置き、証明されていないと断る。格子の側は、強結合展開の最低次で面積則を厳密に出す。ただしそこは連続極限から遠いので、証明にはなっていない ── 何が示せて何が示せていないかの線が、ここで引ける',
  },
  {
    assumed: 'no-arbitrage',
    derived: 'ftap-first',
    note: '経済学は無裁定から状態価格の存在を出し、有限次元で止まる。数理ファイナンスの側は、連続時間で同値マルチンゲール測度の存在と同値だと言う。どちらも証明は分離超平面だが、無限次元では Hahn–Banach が要る',
  },
  {
    assumed: 'wigner-classification',
    derived: 'classification-is-what-physics-uses',
    note: '特殊相対論は Poincaré 群の既約表現を数えて、粒子のラベルが質量とスピンだけだと出す。表現論の側は、それが一般の分類の一例だと言う。選択則も基準振動も同じ数え上げで、対象が違うだけである',
  },
  {
    assumed: 'compactness-theorem',
    derived: 'ax-grothendieck',
    note: '論理はコンパクト性を完全性定理の系として出し、そこで止まる。モデル理論の側は、それを作る道具として使う。有限体で自明な命題を複素数へ移すと、代数の定理が論理から出てくる',
  },
  {
    assumed: 'incompleteness-theorem',
    derived: 'gentzen-consistency',
    note: '論理は算術が自分の無矛盾性を証明できないと言う。証明論の側は、では何を足せば証明できるかを答える。$epsilon_0$ までの超限帰納法を認めればよい ── 何に還元したかが成果物である',
  },
  {
    assumed: 'conserved-quantity-reduces',
    derived: 'noether-theorem',
    note: '力学は保存量を見つかったものとして使い、なぜ在るのかは言わない。解析力学は対称性から作る',
  },
]
