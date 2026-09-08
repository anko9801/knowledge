import type { Concept } from './types.ts'
import { c } from './types.ts'

export const integrableSystems: readonly Concept[] = [
  // --- 可積分系 ----------------------------------------------------------------
  //
  // **`ode.ts` の冒頭に書いた三分法の、三つ目である。**
  // 「線形か、対称性で階数が落ちるか、可積分性という強い条件があるか」と
  // 書いておいて、三つ目に対応するノードが一つも無かった。
  //
  // 軸は**「解けた」と言うために何を仮定したかが毎回違う**こと。
  // 数えると七通りあり、包含関係が定理か反例で決まる ──
  // 求積で解ける／初等関数で書ける／変換で線形化できる／保存量が無限個／
  // 動く分岐点が無い／代数幾何的に閉じた形／次数増大が多項式的。
  //
  // **Lax 対と Liouville 可積分性と逆散乱法は、同じことの言い換えではない。**
  // Lax 対は固有値の保存しか言わず、対合性は $r$ 行列から別に来る。
  // 逆散乱法が作用・角変数だと分かったのは、発見から四年後である。
  //
  // 力学系（`dynamical-systems.ts`）とは切り口が正反対で、対になる ──
  // あちらは解けないときに軌道の形を見る側、ここは解けるものには理由がある側。
  // **摂動で壊れる話（KAM、Arnold 拡散）は向こうの家なので、取らない。**
  c('fput-recurrence', '等分配を確かめる実験が、等分配を否定した', '弱非線形なばね鎖にエネルギーを一つの基準振動に入れると、**散らばらずに戻ってくる**', 'theorem', 'math', ['equipartition', 'normal-modes', 'ergodicity-is-not-the-reason']),

  // 有限次元 ── なぜ半分でいいのか
  c('involution', '保存量が交換する', '**独立なだけでは足りない。**Poisson 括弧が消えることが、追加の要求である', 'definition', 'math', ['poisson-bracket', 'conserved-means-commuting']),
  c('involution-gives-integrability', '対合的なら、分布が積分可能になる', 'Hamilton ベクトル場の交換子が括弧の場になるので、**Frobenius の条件がそのまま満たされる**', 'theorem', 'math', ['involution', 'frobenius-integrability']),
  c('liouville-arnold', 'Liouville–Arnold の定理', '共通レベル集合がコンパクト連結なら**トーラスになり、その上で流れが直線運動**になる。作用・角変数が取れる', 'theorem', 'math', ['involution-gives-integrability', 'action-angle-variables']),
  c('compactness-is-needed', 'コンパクト性を落とすと、巻かない', '**円筒になる。**トーラスという結論は、有界性から来ている', 'viewpoint', 'math', ['liouville-arnold']),
  c('half-is-the-maximum', 'なぜ半分でよいのか', '**共通レベル集合が等方的なので、次元がちょうど半分で止まる。**$n+1$ 個の対合的な積分は存在しない', 'theorem', 'math', ['liouville-arnold', 'symplectic-form']),
  c('nonintegrability-can-be-proven', '積分が「無い」ことは、証明できる', 'Bruns は代数的な積分を、Poincaré は解析的な積分を排除した。**見つからないのではなく、無い**', 'theorem', 'math', ['half-is-the-maximum', 'three-body-unsolvable']),
  c('differential-galois-obstruction', '可解性が、群の性質に翻訳される', '求積で解けるなら変分方程式の微分 Galois 群の単位成分が可換。**Abel–Ruffini と同じ形**', 'theorem', 'math', ['nonintegrability-can-be-proven', 'abel-ruffini', 'why-most-odes-are-unsolvable']),

  // Lax ── 固有値は保存するが、対合性は言っていない
  c('lax-pair', 'Lax 対', '$dot(L) = [M, L]$ と書けると、**$L$ のスペクトルが動かない。**跡の冪が全部保存する', 'definition', 'math', ['lie-bracket', 'spectral-theorem']),
  c('lax-does-not-give-involution', 'Lax 対だけでは、Liouville に届かない', '**保存量が交換するとは一言も言っていない。**古典 $r$ 行列を足してはじめて対合性が出る', 'viewpoint', 'math', ['lax-pair', 'involution']),
  c('classical-r-matrix', '古典 $r$ 行列', '**固有値が Poisson 交換するための条件。**Lax 対と合わせて、はじめて Liouville–Arnold の仮定が揃う', 'definition', 'math', ['lax-does-not-give-involution']),
  c('toda-is-qr', 'Toda 格子の流れは、QR 算法である', '**整数時刻での値が反復と一致する。**可積分系と数値線形代数が同じ対象だった', 'theorem', 'math', ['lax-pair', 'qr-least-squares']),

  // 無限次元 ── 分散で正則化するとどうなるか
  c('dispersion-versus-dissipation', '分散で均すと、散逸とは別の極限になる', '**散逸は衝撃波を作り情報を消す。分散は振動する帯を作り、情報を消さない**', 'viewpoint', 'math', ['wave-steepening', 'vanishing-viscosity', 'irreversibility-from-shocks']),
  c('kdv-equation', 'KdV 方程式', '非線形が波面を立て、分散が均す。**釣り合った所に出る**', 'definition', 'math', ['dispersion-versus-dissipation', 'method-of-characteristics']),
  c('miura-transform', 'Miura 変換', 'mKdV の解を KdV の解に移す。**Riccati として読み直すと、Schrödinger 作用素が出てくる**', 'theorem', 'math', ['kdv-equation', 'sturm-liouville-problem']),
  c('schrodinger-operator-is-not-imposed', 'Schrödinger 作用素は天下りではない', '**Miura 変換から出る。**なぜ量子力学の作用素が波の方程式に現れるのかに、答えが付く', 'viewpoint', 'math', ['miura-transform']),
  c('infinitely-many-conserved-quantities', '保存量が無限個ある', 'Gardner 展開の各次数が保存量になる。**有限次元との、いちばん見やすい違い**', 'theorem', 'math', ['miura-transform']),
  c('kdv-lax-pair', 'KdV の Lax 対', '$L$ を Schrödinger 作用素に取ると、**固有値が時間に依らない**', 'theorem', 'math', ['lax-pair', 'schrodinger-operator-is-not-imposed']),
  c('scattering-data-evolves-linearly', '散乱データは、線形に時間発展する', '**非線形方程式を、線形の問題に移し替えられた。**指数関数が掛かるだけ', 'theorem', 'math', ['kdv-lax-pair']),
  c('inverse-scattering-transform', '逆散乱法', '散乱データへ移し、線形に進め、Gelfand–Levitan–Marchenko で戻す。**非線形の Fourier 変換**', 'technique', 'math', ['scattering-data-evolves-linearly', 'fredholm-alternative-functional', 'green-function-ode']),
  c('reflectionless-is-a-soliton', '反射が無いポテンシャルが、ソリトンである', '行列式で明示的に書ける。**離散固有値の個数が、ソリトンの個数**', 'theorem', 'math', ['inverse-scattering-transform']),
  c('solitons-keep-shape-because-eigenvalues-do', '形が戻るのは、固有値が動かないからである', '**エネルギー保存からではない。**衝突で変われるのは規格化定数だけで、それが位置のずれとして出る', 'theorem', 'math', ['reflectionless-is-a-soliton']),
  c('existing-is-not-surviving', '孤立波が在ることと、衝突しても戻ることは、別である', '**前者は非線形と分散の釣り合いだけで、可積分でなくても起きる。**弾性衝突だけが可積分性に由来する', 'viewpoint', 'math', ['solitons-keep-shape-because-eigenvalues-do']),
  c('scattering-data-are-action-angle', '散乱データが、作用・角変数である', '**逆散乱法は無限次元の Liouville–Arnold だった。**発見から四年後に分かった', 'theorem', 'math', ['inverse-scattering-transform', 'liouville-arnold']),

  // 別の道 ── 同じ結論に、Lax を使わずに着く
  c('zero-curvature', '零曲率条件', '**平坦接続そのもの。**同じ枠から KdV も NLS も sine-Gordon も出て、保存量がモノドロミーから来る', 'definition', 'math', ['lax-pair', 'connection', 'monodromy-theorem']),
  c('bi-hamiltonian', '両立する Poisson 構造が二つあると', '再帰作用素が階層を生み、**対合性が Lax を使わずに出る。**三つ目の機構', 'theorem', 'math', ['poisson-bracket', 'involution']),
  c('finite-gap-solutions', '周期問題では、隙間が有限個であることが効く', '**Hill 作用素のスペクトル隙間が有限なら、解が theta 関数で書ける。**トーラスが Jacobi 多様体になる', 'theorem', 'math', ['scattering-data-are-action-angle', 'stability-tongues', 'riemann-surface']),
  c('mathieu-is-not-finite-gap', 'Mathieu の舌は、無限個ある', '**だから有限帯ではない。**既に書いてある不安定な帯が、そのままこの隙間である', 'viewpoint', 'math', ['finite-gap-solutions', 'floquet-theory']),

  // 判定 ── 「解ける」の意味が変わっていく
  c('painleve-property', '動く特異点が極に限る', '**この一つを要求すると、五十個の標準形のうち四十四個が既知関数に落ちる**', 'definition', 'math', ['irregular-singular-point', 'why-there-are-so-few']),
  c('six-new-transcendents', '残る六つだけが、新しい超越関数になる', '**「特殊関数はなぜ数えるほどしか無いのか」の非線形版。**線形では特異点の配置が決めていた', 'theorem', 'math', ['painleve-property', 'special-functions-are-classified']),
  c('painleve-test-is-a-criterion', '可積分性の判定に使える', '逆散乱で解ける方程式の簡約は、この性質を持つ。**ただし必要条件であって十分ではない**', 'technique', 'math', ['six-new-transcendents']),
  c('isomonodromy', 'モノドロミーを保つ変形', 'Painlevé の保存量はモノドロミーデータで、**逆散乱の積分方程式が Riemann–Hilbert 問題に替わる**', 'viewpoint', 'math', ['painleve-property', 'monodromy-theorem', 'inverse-scattering-transform']),
  c('solvable-changes-meaning-again', 'ここで「解ける」の意味が、また変わる', '**閉じた形では書けないが、保存されるものが特定できる。**七通りのうちの、また別の一つ', 'viewpoint', 'math', ['isomonodromy']),
  c('algebraic-entropy', '離散では、次数の増え方が判定になる', '多項式的なら可積分、指数的なら違う。**特異点閉じ込めは必要条件どまりで、反例がある**', 'technique', 'math', ['painleve-test-is-a-criterion', 'symplectic-integrator']),
  c('yang-baxter', 'Yang–Baxter 方程式', '転送行列が助変数をまたいで交換し、**保存量が無限個出る。**古典 $r$ 行列はその古典極限', 'theorem', 'math', ['transfer-matrix', 'classical-r-matrix']),
  c('bethe-ansatz', 'Bethe 仮設', '同時固有ベクトルを、粒子の散乱の積として書く', 'technique', 'math', ['yang-baxter', 'heisenberg-model']),
  c('quantum-integrability-has-no-definition', '量子では、その定義が立っていない', '**「交換する保存量が無限個」は射影子で自明に作れてしまう。**判定として機能しない', 'viewpoint', 'math', ['bethe-ansatz', 'spectral-theorem-unbounded']),
]
