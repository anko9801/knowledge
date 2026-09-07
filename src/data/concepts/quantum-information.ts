import type { Concept } from './types.ts'
import { c } from './types.ts'

export const quantumInformation: readonly Concept[] = [
  // --- 量子情報 ----------------------------------------------------------------
  //
  // **できないことが先に決まる。** 複製できない・見分けられない・盗み見を隠せない ──
  // 禁止のほうが構成より少ない仮定で出て、**その禁止から構成の限界が数として出る**
  // （複製不可能 $arrow.r$ 符号長の下界）。
  //
  // 四つの既存連載に跨る。`quantum`（合成系・もつれ・Born 則）、
  // `information`（エントロピー・容量）、`complexity`、`crypto` は
  // `requires` で指すだけで、再定義しない。
  c('quantum-state-mixed', '混合状態', '密度作用素。純粋状態の混合と、大きな系の一部が区別できない', 'definition', 'cs', ['composite-system', 'probability-space']),
  c('partial-trace', '部分トレース', '手元の系だけで決まる記述。相手が何をしても、これは変わらない', 'definition', 'cs', ['quantum-state-mixed', 'tensor-product']),
  c('purification', '純粋化', 'どんな混合状態も、大きな系の純粋状態の一部として書ける。書き方の自由はユニタリの分だけ', 'theorem', 'cs', ['partial-trace', 'spectral-theorem']),
  c('schmidt-decomposition', 'Schmidt 分解', '二体の純粋状態は対角に書ける。**両側の縮約が同じ固有値を持つ**', 'theorem', 'cs', ['composite-system', 'spectral-theorem']),
  c('no-cloning', '複製不可能定理', '未知の状態を二つにする線形写像は無い。**線形性だけから出る**（三行）', 'theorem', 'cs', ['composite-system']),
  c('orthogonal-states-are-copyable', '直交する状態は複製できる', '内積が保存するので重なりは 0 か 1 しかない。**禁止の境目がここで決まる**。BB84 が 4 状態を使う理由', 'theorem', 'cs', ['no-cloning', 'unitary-time-evolution']),
  c('no-signaling', '局所操作では伝わらない', '相手の縮約は自分が何をしても変わらない。部分トレースの巡回性だけで、力学の仮定を使わない', 'theorem', 'cs', ['partial-trace']),
  c('povm', '一般の測定', '正値作用素への分解。射影に限らない', 'definition', 'cs', ['born-rule', 'quantum-state-mixed'], [], { aka: ['POVM', '正作用素値測度'] }),
  c('naimark-dilation', 'Naimark の拡大', '一般の測定は、大きな系での射影測定に書き直せる。射影に限る要請が落ちる', 'theorem', 'cs', ['povm', 'purification']),
  c('complete-positivity', '完全正値性', '何もしない系を横に付けても正値のまま、と要求する。正値だけでは足りない', 'definition', 'cs', ['quantum-state-mixed', 'partial-trace']),
  c('stinespring-dilation', 'Stinespring 表現', '完全正値かつトレース保存な写像は、等長写像と部分トレースに分解する', 'theorem', 'cs', ['complete-positivity', 'purification']),
  c('trace-distance', 'トレース距離', '区別しやすさそのもの。通信路を通すと必ず縮む', 'definition', 'cs', ['quantum-state-mixed', 'quantum-channel']),
  c('state-discrimination', '状態の識別', '二つの状態を最もよく見分ける確率が、トレース距離で決まる', 'theorem', 'cs', ['povm', 'trace-distance']),

  // エントロピーと容量
  c('von-neumann-entropy-qi', 'von Neumann エントロピー（量子情報）', '固有値の Shannon エントロピー。純粋状態では 0 になる', 'definition', 'cs', ['entropy', 'quantum-state-mixed']),
  c('negative-conditional-entropy', '条件付きエントロピーが負になる', 'もつれた状態では、全体のほうが部分より確かである。**古典では起きない**', 'theorem', 'cs', ['von-neumann-entropy-qi', 'entanglement']),
  c('strong-subadditivity', '強劣加法性', '相互情報量の単調性と同値。証明は難しい', 'theorem', 'cs', ['von-neumann-entropy-qi']),
  c('schumacher-compression', 'Schumacher 圧縮', '1 文字あたり von Neumann エントロピーまで縮み、それ以上は縮まない', 'theorem', 'cs', ['von-neumann-entropy-qi', 'aep', 'source-coding-theorem']),
  c('holevo-bound', 'Holevo 限界', '$n$ 量子ビットに古典情報は $n$ ビットしか入らない。相互情報量の単調性から出る', 'theorem', 'cs', ['von-neumann-entropy-qi', 'mutual-information']),
  c('hsw-theorem', 'HSW 定理', '量子通信路の古典容量は、Holevo 量の正則化に等しい', 'theorem', 'cs', ['holevo-bound', 'channel-capacity', 'channel-coding-theorem']),
  c('capacity-non-additivity', '容量が加法的でない', '一文字あたりの最大値では容量が決まらない。**古典との一番の違い**', 'theorem', 'cs', ['hsw-theorem']),
  c('coherent-information', 'コヒーレント情報', '量子容量を測る量。正則化が要る点は古典容量と同じ', 'definition', 'cs', ['von-neumann-entropy-qi', 'quantum-channel']),
  c('superactivation', '容量の超活性化', '容量 0 の通信路を二本並べると、容量が正になる', 'theorem', 'cs', ['coherent-information', 'capacity-non-additivity']),

  // 非局所性
  c('bell-inequality', 'Bell/CHSH 不等式', '局所的な隠れた変数があるなら値が 2 を超えない', 'theorem', 'cs', ['probability-space', 'entanglement']),
  c('tsirelson-bound', 'Tsirelson 限界', '量子でも $2 sqrt(2)$ を超えない。**局所性が交換子の消滅として入り、束縛が消えない交換子から出る**', 'theorem', 'cs', ['bell-inequality', 'uncertainty-relation'], [], { aka: ['Cirelson の不等式'] }),
  c('kochen-specker', 'Kochen–Specker の定理', '測る組み合わせに依らない値の割り当ては、そもそも作れない', 'theorem', 'cs', ['bell-inequality', 'observable']),
  c('monogamy-of-entanglement', 'もつれの一夫一婦性', '最大にもつれた相手は一つしか持てない', 'theorem', 'cs', ['entanglement', 'strong-subadditivity']),
  c('teleportation', '量子テレポーテーション', '1 ebit と 2 古典ビットで 1 量子ビットが移る。**無信号性は破れない**', 'technique', 'cs', ['entanglement', 'no-signaling']),
  c('dense-coding', '超密度符号', '1 ebit があれば、1 量子ビットで 2 古典ビット送れる。Holevo 限界と矛盾しない', 'technique', 'cs', ['entanglement', 'holevo-bound']),
  c('locc', '局所操作と古典通信', '何を無料と数えるかを決める。もつれはこの下で増えない', 'definition', 'cs', ['quantum-channel', 'no-signaling']),
  c('nielsen-majorization', 'Nielsen の優越定理', '**縮約密度行列の固有値**（Schmidt 係数の二乗）が優越されるときに限り、変換できる。**経済の Lorenz 優越と同じ半順序**', 'theorem', 'cs', ['locc', 'schmidt-decomposition', 'hardy-littlewood-polya']),
  c('quantum-de-finetti', '量子 de Finetti 表現', '置換対称な $N$ 体状態の部分系は、積状態の混合に近い。**Hamiltonian の中身を一つも使わずに平均場極限が出る**', 'theorem', 'cs', ['de-finetti-representation', 'purification', 'partial-trace']),
  c('finite-quantum-version-needs-dimension', '量子版は次元に依らざるをえない', '古典の有限版は経験測度で作れるが、**経験測度に量子の対応物が無い。**誤差が次元に依る形でしか書けない', 'viewpoint', 'cs', ['quantum-de-finetti', 'de-finetti-fails-for-finite-sequences']),
  c('security-proofs-use-it', 'QKD の安全性証明が、この表現定理に乗っている', '盗聴者が系全体に何をしてもよい場合を、独立な攻撃の混合に落とす。**対称性だけから、攻撃の一般性が畳める**', 'theorem', 'cs', ['quantum-de-finetti', 'bb84']),
  c('bound-entanglement', '束縛されたもつれ', '取り出せないもつれがある。作るのに要る量と取り出せる量が食い違う', 'theorem', 'cs', ['nielsen-majorization']),
  c('bb84', 'BB84', '直交しない 4 状態を送る。盗み見ると必ず乱れ、しかも**計算量的仮定を一つも使わない**', 'technique', 'cs', ['no-cloning', 'orthogonal-states-are-copyable', 'security-reduction']),

  // 誤り訂正
  c('knill-laflamme-condition', '誤り訂正の条件', '誤りが符号語の重なりを動かさないことと、直せることが同値', 'theorem', 'cs', ['povm', 'quantum-channel']),
  c('error-discretization', '誤りは離散化してよい', '連続な誤りも Pauli で展開すれば、有限個の直し方で足りる', 'theorem', 'cs', ['knill-laflamme-condition']),
  c('stabilizer-formalism', '安定化符号', 'Pauli 群の可換な部分群で符号を決める。症候群は測るだけで得られる', 'technique', 'cs', ['knill-laflamme-condition', 'group-action']),
  c('css-construction', 'CSS 構成', '入れ子の古典符号から量子符号を作る', 'technique', 'cs', ['linear-code', 'stabilizer-formalism']),
  c('no-cloning-code-bound', '複製できないことから出る符号の下界', '半分ずつに割って直せてしまうと、複製したことになる。**禁止が符号長の数になる**', 'theorem', 'cs', ['no-cloning', 'stabilizer-formalism']),
  c('quantum-singleton-bound', '量子 Singleton 限界', '1 量子ビットを 1 誤りから守るには 5 個要る', 'theorem', 'cs', ['no-cloning-code-bound']),
  c('toric-code', 'トーリック符号', '論理演算子が鎖複体のホモロジー類になる。**生成子の可換性が $partial compose partial = 0$ そのもの**', 'definition', 'cs', ['css-construction', 'singular-homology']),
  c('accuracy-threshold', '閾値定理', '誤り率がある正の値より小さければ、いくらでも長い計算ができる。**値は定理からは出ない**', 'theorem', 'cs', ['toric-code', 'concentration-inequality']),

  // 計算
  c('quantum-circuit-model', '量子回路', '何を一手と数えるかを決める。ユニタリは連続なので、正確には作れない', 'definition', 'cs', ['computation-model', 'unitary-time-evolution']),
  c('solovay-kitaev', 'Solovay–Kitaev', '有限個の門で、任意のユニタリを対数の冪だけの門で近似できる', 'theorem', 'cs', ['quantum-circuit-model']),
  c('bqp', 'BQP', '量子でも PSPACE の外へは出ない', 'definition', 'cs', ['quantum-circuit-model', 'randomized-complexity']),
  c('grover-optimality', 'Grover の最適性', 'オラクルの呼び出し回数が平方根より少なくできない。**二乗より速くはならない**', 'theorem', 'cs', ['bqp', 'decision-tree-lower-bound']),
  c('local-hamiltonian-qma', '局所ハミルトニアン問題', 'QMA 完全。Cook–Levin の量子版だが、制約が可換でない', 'theorem', 'cs', ['bqp', 'cook-levin']),
]
