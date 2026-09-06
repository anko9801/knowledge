import type { Concept } from './types.ts'
import { c } from './types.ts'

export const complexAnalysis: readonly Concept[] = [
  // --- 複素解析 ----------------------------------------------------------------
  //
  // **一回微分できるだけで、無限回微分できてしまう。この一点から全部が出る。**
  // 留数計算は結果であって、軸ではない。
  //
  // 出典の食い違いが軸を決めた。Cauchy の積分定理をホモトピーで証明する本は
  // $f'$ の連続性を仮定していて、それだと軸が循環する。**Goursat は省略できない。**
  //
  // `analytic-function`・`power-series`・`identity-theorem` は解析の連載が
  // 導いている（記事のデータで確認済み）。**二度導かない。**`derivations.ts` を見ること。
  c('complex-differentiability', '複素微分可能性', '差分商の極限が近づき方に依らない。$RR^2$ の全微分に「回転と拡大の合成であること」を足した条件', 'definition', 'math', ['multivariable-calculus', 'landau-notation']),
  c('cauchy-riemann', 'Cauchy–Riemann の方程式', '成分で書いた条件。逆向きに使うには偏微分の連続性が要る', 'theorem', 'math', ['complex-differentiability']),
  c('holomorphic-function', '正則関数', '開集合の各点で複素微分可能。一点だけでは何も言えない', 'definition', 'math', ['cauchy-riemann']),
  c('conformal-map', '等角写像', '正則で微分が消えなければ角を保つ。微分が位数 $m$ の零点なら角は $m$ 倍になる', 'theorem', 'math', ['holomorphic-function']),
  c('harmonic-conjugate', '調和共役', '正則関数の実部と虚部は調和。逆は単連結なところでだけ言える', 'theorem', 'math', ['cauchy-riemann', 'simply-connected']),

  // 積分が路に依らない
  c('contour-integral', '複素線積分', '路に沿った積分。長さと最大値で押さえる評価が全部の証明で効く', 'definition', 'math', ['holomorphic-function']),
  c('antiderivative-criterion', '原始関数があること', 'すべての閉路で積分が 0 になることと、原始関数が存在することが同値', 'theorem', 'math', ['contour-integral']),
  c('winding-number', '巻き数', '整数になる。「囲む」を Jordan 曲線定理なしで定義できる', 'definition', 'math', ['contour-integral', 'homotopy']),
  c('goursat-theorem', 'Goursat の定理', '三角形の上で積分が 0。**導関数の連続性を仮定しない**。ここを飛ばすと、この連載の軸が循環する', 'theorem', 'math', ['contour-integral']),
  c('cauchy-integral-theorem', 'Cauchy の積分定理', 'ホモトピーで移り合う二つの路の上で、積分の値が等しい', 'theorem', 'math', ['goursat-theorem', 'homotopy']),
  c('simply-connected-has-antiderivative', '単連結なら原始関数がある', '穴が無ければ必ず在る。$1 \\/ z$ が持たないことが、穴の存在の証明になる', 'theorem', 'math', ['cauchy-integral-theorem', 'antiderivative-criterion', 'simply-connected']),

  // 軸 ── 一回で、無限回になる
  c('cauchy-integral-formula', 'Cauchy の積分公式', '円周の上の値だけで、中の一点の値が決まる', 'theorem', 'math', ['cauchy-integral-theorem']),
  c('mean-value-property-complex', '平均値性質（正則関数）', '中心の値が、円周上の平均に等しい', 'theorem', 'math', ['cauchy-integral-formula']),
  c('cauchy-derivative-formula', '導関数の積分表示', '微分が積分で書ける。微分が一回増えるたびに被積分関数の次数が上がるだけ', 'theorem', 'math', ['cauchy-integral-formula']),
  c('holomorphic-is-smooth', '一回微分できれば、無限回微分できる', '**実関数には対応物が無い**', 'theorem', 'math', ['cauchy-derivative-formula']),
  c('holomorphic-is-analytic', '正則と解析的は同じもの', '実解析では $C^infinity$ と $C^omega$ の間に差があり、$e^(-1\\/x)$ が隔てている。複素では一致する', 'theorem', 'math', ['holomorphic-is-smooth', 'analytic-function', 'power-series']),
  c('radius-reaches-the-boundary', '収束半径は境界まで届く', '実では偽。$1 \\/ (1 + x^2)$ の展開が止まる理由が、**実軸に無い点**で説明される', 'theorem', 'math', ['holomorphic-is-analytic']),
  c('morera-theorem', 'Morera の定理', '連続で、すべての閉路の積分が 0 なら正則。Cauchy の積分定理の逆', 'theorem', 'math', ['antiderivative-criterion', 'holomorphic-is-smooth']),

  // 剛さの帰結
  c('cauchy-estimate', 'Cauchy の評価', '導関数が半径で抑まる。半径を大きく取れることが、そのまま定理になる', 'theorem', 'math', ['cauchy-derivative-formula']),
  c('liouville-theorem-complex', 'Liouville の定理（整関数）', '有界な整関数は定数。実の $sin$ は有界で非定数なので、実には無い', 'theorem', 'math', ['cauchy-estimate']),
  c('fundamental-theorem-of-algebra', '代数学の基本定理', '定数でない多項式は根を持つ。**証明が解析になる**', 'theorem', 'math', ['liouville-theorem-complex']),
  c('zeros-are-isolated', '零点は孤立する', '位数が一意に決まる。この位数が、極・偏角原理・Rouché・局所次数の全部に要る', 'theorem', 'math', ['holomorphic-is-analytic']),
  c('maximum-modulus', '最大値原理（絶対値）', '$|f|$ は内点で最大値を取らない。取れば定数', 'theorem', 'math', ['mean-value-property-complex', 'identity-theorem']),
  c('schwarz-lemma', 'Schwarz の補題', '円板を自分に写して原点を止めるなら伸びない。等号が一点で成り立てば回転しかない', 'theorem', 'math', ['maximum-modulus']),

  // 特異点と留数
  c('laurent-series', 'Laurent 展開', '環状領域では負のべきも要る。係数は同じ積分公式で出る', 'theorem', 'math', ['holomorphic-is-analytic']),
  c('isolated-singularity', '孤立特異点は三種類しかない', '除去可能・極・真性。Laurent 展開の負べきの個数が 0・有限・無限に対応する', 'definition', 'math', ['laurent-series']),
  c('casorati-weierstrass', 'Casorati–Weierstrass の定理', '真性特異点のどんな小さい近傍でも、像が稠密になる', 'theorem', 'math', ['isolated-singularity', 'liouville-theorem-complex']),
  c('residue-theorem', '留数定理', '閉路の積分が、内側の $-1$ 次の係数の和だけで決まる', 'theorem', 'math', ['isolated-singularity', 'cauchy-integral-theorem']),
  c('jordan-lemma', 'Jordan の補題', 'どちらの半面へ閉じるかが指数の符号で決まる。**$R$ が打ち消えるので、素朴な評価より弱い条件で足りる**', 'theorem', 'math', ['contour-integral']),
  c('principal-value', '主値と、極を避ける半円', '実軸上の極を半円で避けると、留数のちょうど半分が出る', 'theorem', 'math', ['cauchy-integral-theorem', 'distribution-theory']),
  c('argument-principle', '偏角原理', '零点と極の個数が積分になる', 'theorem', 'math', ['residue-theorem', 'zeros-are-isolated', 'winding-number']),
  c('rouche-theorem', 'Rouché の定理', '境界の上で小さい摂動は、内側の零点の個数を変えない', 'theorem', 'math', ['argument-principle']),
  c('open-mapping-theorem', '開写像定理', '定数でない正則写像は開集合を開集合に写す。$|f|$ に内点最大が無いのはこのため', 'theorem', 'math', ['rouche-theorem']),

  // 多価と接続
  c('branch-of-logarithm', '対数の枝', '一価に決まらない。単連結な領域を切り出して初めて関数になる', 'definition', 'math', ['simply-connected-has-antiderivative']),
  c('analytic-continuation', '解析接続', '重なりで一致する関数要素を繋いでいく。曲線に沿った接続は一意に決まる', 'technique', 'math', ['identity-theorem', 'holomorphic-is-analytic']),
  c('monodromy-theorem', 'モノドロミー定理', 'すべての曲線に沿って接続できて、領域が単連結なら、接続した先は一価になる', 'theorem', 'math', ['analytic-continuation', 'homotopy', 'simply-connected']),
  c('riemann-surface', 'Riemann 面', '芽を張り合わせて、多価関数が一価になる土台を作る。遷移関数が正則な曲面', 'definition', 'math', ['monodromy-theorem', 'branch-of-logarithm']),
  c('mobius-transformation', 'Möbius 変換', '線と円を線と円に写す。三点を指定すると一意に決まる', 'definition', 'math', ['conformal-map']),
  c('riemann-sphere', 'Riemann 球面', '無限遠点を一つ足すと球面になる。極は「無限大という値を取る」ことになる', 'viewpoint', 'math', ['mobius-transformation', 'isolated-singularity']),

  // 作る側 ── 結び
  c('normal-family', '正規族', 'コンパクト集合ごとに一様有界なら、収束する部分列が取れる（Montel）', 'theorem', 'math', ['cauchy-integral-formula', 'uniform-convergence']),
  c('hurwitz-theorem', 'Hurwitz の定理', '極限は零点の個数を保つ。単射関数列の極限は定数か単射', 'theorem', 'math', ['rouche-theorem', 'normal-family']),
  c('square-root-property', '平方根性質', '零点を持たない正則関数がすべて解析的平方根を持つこと。**単連結性の代わりに使える仮定**', 'definition', 'math', ['branch-of-logarithm']),
  c('riemann-mapping-theorem', 'Riemann の写像定理', '全平面でない単連結領域は、どれも単位円板と双正則。規格化を課すと一意に決まる', 'theorem', 'math', ['normal-family', 'hurwitz-theorem', 'schwarz-lemma', 'square-root-property']),
  c('runge-approximation', 'Runge の近似定理', 'コンパクト集合上の正則関数を、穴の外に極を持つ有理関数で一様近似できる', 'theorem', 'math', ['residue-theorem', 'winding-number']),
  c('weierstrass-product', 'Weierstrass の因数分解', '零点の位置を先に決めて整関数を作れる', 'theorem', 'math', ['liouville-theorem-complex', 'uniform-convergence']),
  c('mittag-leffler', 'Mittag-Leffler の定理', '主要部を先に決めて有理型関数を作れる。引く有理関数の存在が Runge から来る', 'theorem', 'math', ['laurent-series', 'runge-approximation']),

  // 元の定義域の外の値が決まる
  c('gamma-analytic-continuation', '$Gamma$ の解析接続', '積分でしか定義できないのに全平面で値が一意に決まる。極の位置と留数まで出る', 'theorem', 'math', ['analytic-continuation', 'isolated-singularity']),
  c('zeta-analytic-continuation', '$zeta$ の解析接続', '級数の外へ延び、$s = 1$ に留数 1 の単純極が立つ。**関数等式はここでは出ない**（Poisson 総和が要る）', 'theorem', 'math', ['analytic-continuation', 'normal-family']),
  c('causality-is-analyticity', '因果律は上半平面での正則性', '応答が入力より前に無いことと、応答関数が上半平面へ正則に延びることが同値', 'theorem', 'math', ['analytic-function', 'fourier-transform'], [], { aka: ['Titchmarsh の定理', '分散関係'] }),
  c('saddle-point-method', '鞍点法', '路を鞍点を通るように動かし、虚部が一定になる向きを選ぶ。実軸上の Laplace 法とは別物である', 'technique', 'math', ['cauchy-integral-theorem', 'gamma-analytic-continuation']),
]
