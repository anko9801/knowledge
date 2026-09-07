import type { Concept } from './types.ts'
import { c } from './types.ts'

export const optimalControl: readonly Concept[] = [
  // --- 最適化の力学 ------------------------------------------------------------
  //
  // **横断の調査が ◎ を付けた二つを、一つの連載に畳んだ。**
  // 根が同じだからである ── どちらも変分問題を、経路の側から見るか
  // 値の側から見るかの違いでしかない。
  //
  // 一つ目。**Noether は力学の外で三度使われている** ──
  // 破壊力学の J 積分、最適制御の保存量、最適成長の資本産出比。
  // 帰属に注意（`docs/decisions.md`）── J 積分の Noether 解釈は
  // **Günther 1962 と Knowles--Sternberg 1972** であって、Rice でも Eshelby でもない。
  // Samuelson 1970 は自分では Noether と言っていない。
  //
  // 二つ目。**Bellman 方程式は Hamilton--Jacobi 方程式である。**
  // 特性曲線が正準方程式、共状態が価値関数の勾配、$L$ と $H$ を繋ぐのが
  // Legendre 変換。min-plus 半環に落とすと、Bellman--Ford が線形代数になる。
  //
  // **ただし「全部同じ」と書かないこと。** 個々の対応は定理だが、
  // 統一原理そのものは定理ではない ── Litvinov 自身が対応原理を
  // "clearly, a heuristic one" と書いている。そこを曖昧にすると、
  // 「平文で言えることに記号を被せない」に触れる。
  c('control-as-a-variational-problem', '制御は変分問題である', '経路を選ぶのではなく、**入力を選ぶと経路が決まる。**拘束の付いた変分問題になる', 'viewpoint', 'math', ['variational-principle', 'state-space-model']),
  c('costate', '共状態', '拘束に付く Lagrange 乗数。**力学の運動量と同じ位置に立つ**', 'definition', 'math', ['control-as-a-variational-problem', 'hamiltonian']),
  c('pontryagin-maximum-principle', 'Pontryagin の最大原理', '最適な入力は、各時刻で制御 Hamiltonian を最大にする。**入力が範囲の端にしか行けない場合も扱える**', 'theorem', 'math', ['costate']),
  c('bang-bang', '端で切り替わる', '**Hamiltonian が入力に線形なら、最適解は最大と最小しか取らない。**中間の値が最適になることが無い', 'theorem', 'math', ['pontryagin-maximum-principle']),
  c('euler-lagrange-is-the-interior-case', 'Euler–Lagrange は内点の場合である', '**入力に制限が無いときだけ、停留条件で足りる。**制限があると停留点が範囲の外に落ちる', 'viewpoint', 'math', ['pontryagin-maximum-principle', 'lagrangian']),
  c('noether-in-optimal-control', '制御 Hamiltonian が対称なら、保存量がある', '**Noether の定理がそのまま効く。**力学の証明を一字も変えずに使える', 'theorem', 'math', ['pontryagin-maximum-principle', 'noether-theorem']),
  c('samuelson-conservation', '最適成長にも保存量がある', 'Samuelson 1970。被積分関数が時間を陽に含まなければ、資本産出比が一定になる。**本人は Noether と呼んでいない**', 'theorem', 'math', ['noether-in-optimal-control']),
  c('eshelby-tensor', 'エネルギー運動量テンソル（弾性体）', '弾性エネルギー汎関数の並進不変性から出る Noether カレント', 'definition', 'math', ['noether-theorem', 'cauchy-stress']),
  c('j-integral-is-a-noether-current', 'J 積分の経路独立性は Noether である', '**亀裂を囲むどの経路でも同じ値になる。**遠方の弾性場から先端の駆動力が読める（Günther 1962、Knowles–Sternberg 1972）', 'theorem', 'math', ['eshelby-tensor', 'limit-analysis-lower-bound']),
  c('noether-outside-mechanics', 'Noether は力学の定理ではない', '**変分構造さえあれば効く。**破壊力学・最適制御・最適成長の三つが、力学を経由せずに同じ定理を使っている', 'viewpoint', 'math', ['j-integral-is-a-noether-current', 'samuelson-conservation']),

  // 値の側から見る
  c('value-function', '価値関数', '**そこから先の最適値を、状態の関数として書く。**経路ではなく点に数を割り当てる', 'definition', 'math', ['control-as-a-variational-problem', 'optimal-substructure']),
  c('bellman-equation', 'Bellman 方程式', '最適性の原理を式にしたもの。**部分問題の最適解から全体が組める、という条件そのもの**', 'theorem', 'math', ['value-function']),
  c('hjb-equation', 'Hamilton–Jacobi–Bellman 方程式', '連続時間にすると、価値関数の偏微分方程式になる', 'theorem', 'math', ['bellman-equation', 'method-of-characteristics']),
  c('hjb-is-hamilton-jacobi', 'これは Hamilton–Jacobi 方程式である', '**特性曲線が正準方程式、共状態が価値関数の勾配。**力学と制御が、同じ方程式の二つの読み方になる', 'theorem', 'math', ['hjb-equation', 'canonical-formalism']),
  c('legendre-joins-the-two-sides', '二つの側を繋ぐのは Legendre 変換である', '**Lagrangian と Hamiltonian を移すのと同じ変換が、経路の側と値の側を移す**', 'viewpoint', 'math', ['hjb-is-hamilton-jacobi', 'convex-conjugate']),
  c('value-function-is-not-smooth', '価値関数は、微分できるとは限らない', '**折れ目が出るので、古典解が存在しない場合がある。**粘性解を使うことで一意性が戻る', 'theorem', 'math', ['hjb-equation', 'weak-solution-not-unique']),
  c('verification-theorem', '検証定理', '**HJB を満たす滑らかな関数が一つ見つかれば、それが最適値である。**十分条件のほうは易しい', 'theorem', 'math', ['hjb-equation']),
  c('curse-of-dimensionality', '状態が増えると、値の側が破綻する', '**格子の点数が次元の指数。**経路の側（Pontryagin）は次元に耐えるので、そこで使い分ける', 'viewpoint', 'math', ['value-function', 'hjb-equation']),

  // 半環へ落とす
  c('min-plus-semiring', 'min-plus 半環', '足し算を min、掛け算を $+$ と読み替える。**分配律が成り立つので、線形代数の言葉が使える**', 'definition', 'math', ['ring', 'bellman-equation']),
  c('shortest-path-is-linear', '最短路は線形方程式である', '**Bellman–Ford が Jacobi 反復、Floyd–Warshall が Gauss–Jordan。**同じ算法が二つの名前を持っていた', 'theorem', 'math', ['min-plus-semiring', 'graph']),
  c('viterbi-is-the-same-algorithm', 'Viterbi も同じものである', '**確率の積を対数に取ると min-plus になる。**最尤系列と最短路が同じ計算', 'viewpoint', 'math', ['shortest-path-is-linear', 'markov-chain']),
  c('max-plus-perron-frobenius', 'max-plus の Perron–Frobenius', '固有値が最大巡回平均に等しい。**一歩あたりの最適費用が、固有値として出る**', 'theorem', 'math', ['min-plus-semiring', 'perron-frobenius']),
  c('zero-temperature-limit', '転送行列を冷やすと、そこへ落ちる', '$beta arrow oo$ で $(1\\/beta) log$ を取ると、Perron 固有値が max-plus の固有値になる。**統計力学と最適化が繋がる**', 'theorem', 'math', ['max-plus-perron-frobenius', 'transfer-matrix']),
  c('correspondence-is-heuristic', 'この対応原理は、定理ではない', '**個々の場合はどれも定理だが、「全部同じ」を言う定理は無い。**Litvinov 自身が発見法だと書いている', 'viewpoint', 'math', ['zero-temperature-limit', 'legendre-joins-the-two-sides']),
]
