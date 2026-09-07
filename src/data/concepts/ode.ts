import type { Concept } from './types.ts'
import { c } from './types.ts'

export const ode: readonly Concept[] = [
  // --- 常微分方程式 ------------------------------------------------------------
  //
  // **`ode-existence` は 17 箇所から参照されているのに、その下が空だった。**
  // 関数解析・精神物理と同じ形の穴で、既にある建物の土台が無い。
  //
  // 軸は**「解けないほうが普通で、解けるものには理由がある」**。
  // 存在と一意性は縮小写像で出るが、**それは解が書けることを一つも言っていない。**
  // 書ける場合は、線形であるか、対称性で次数が落ちるか、
  // 可積分性という強い条件があるかのどれかに限られる。
  //
  // 結びは境界値問題である ── **初期値問題では必ず解けたものが、
  // 境界値問題では解が無いことも、無限にあることもある。**
  // 同じ方程式で、条件を与える場所を変えただけで結論が変わる。
  //
  // 力学系（`dynamical-systems.ts`）とは切り口が違う。あちらは解かずに
  // 軌道の形を見る側で、ここは解けるかどうかを見る側。
  c('linear-ode-is-a-vector-space', '線形なら、解が空間をなす', '**斉次解の全体が次元 $n$ のベクトル空間。**解を全部見つけたことが、次元を数えるだけで確認できる', 'theorem', 'math', ['ode-existence', 'vector-space']),
  c('wronskian', 'Wronskian', '**一点で 0 でなければ、どこでも 0 でない**（Abel の恒等式）。独立性の判定が一点で済む', 'theorem', 'math', ['linear-ode-is-a-vector-space', 'determinant']),
  c('variation-of-parameters', '定数変化法', '斉次解が全部あれば、非斉次解が積分で出る。**構造が分かれば、残りは計算になる**', 'technique', 'math', ['wronskian']),
  c('constant-coefficients-reduce-to-algebra', '定数係数なら、代数の問題になる', '**指数関数を入れると特性多項式が出る。**重根のときだけ $t$ が掛かるのは、Jordan 形の対角化不能性が理由', 'theorem', 'math', ['linear-ode-is-a-vector-space', 'jordan-form']),
  c('resonance-is-a-repeated-root', '共鳴は重根である', '**強制項の振動数が固有振動数に一致すると、特性根が重なる。**振幅が時間に比例して伸びる', 'theorem', 'math', ['constant-coefficients-reduce-to-algebra']),
  c('why-most-odes-are-unsolvable', 'たいていは解けない', '**存在定理は解を書けるとは言っていない。**Liouville は、簡単な形の方程式でも初等関数で書けないことを示した', 'viewpoint', 'math', ['ode-existence', 'constant-coefficients-reduce-to-algebra']),
  c('symmetry-reduces-order', '対称性があれば、階数が落ちる', '**Lie が見つけた。**求積法の個々の手口（変数分離、同次形、完全微分）が、全部一つの原理の特別な場合になる', 'theorem', 'math', ['why-most-odes-are-unsolvable', 'noether-theorem']),
  c('integrating-factor-is-a-symmetry', '積分因子は対称性である', '**「掛けると完全になる関数」を探すことと、対称性を探すことが同じ。**技法の寄せ集めが一つの理論になる', 'viewpoint', 'math', ['symmetry-reduces-order']),

  // 特異点のまわり ── 特殊関数が出てくる場所
  c('regular-singular-point', '確定特異点', '係数が発散しても、発散の速さが弱ければ級数解が作れる', 'definition', 'math', ['linear-ode-is-a-vector-space', 'laurent-series']),
  c('frobenius-method', 'Frobenius の方法', '指数を未知数にして級数を入れる。**決定方程式の根が、解の振る舞いを決める**', 'technique', 'math', ['regular-singular-point']),
  c('special-functions-are-classified', '特殊関数は、特異点の配置で分類される', '**確定特異点が 3 つなら超幾何方程式に帰着する。**Bessel も Legendre もその特別な場合', 'theorem', 'math', ['frobenius-method']),
  c('why-there-are-so-few', 'なぜ特殊関数は数えるほどしか無いのか', '**特異点の個数と位置に自由が少ないから。**「たまたま名前が付いた」のではなく、分類の結果である', 'viewpoint', 'math', ['special-functions-are-classified']),
  c('irregular-singular-point', '不確定特異点では、級数が収束しない', '**漸近展開しか作れない。**発散する級数が、それでも良い近似を与える', 'theorem', 'math', ['regular-singular-point', 'landau-notation']),

  // 定性的な情報 ── 解かずに言えること
  c('gronwall-inequality', 'Grönwall の不等式', '**微分不等式から、関数そのものの評価が出る。**一意性も連続依存も、これ一本で言える', 'theorem', 'math', ['ode-existence']),
  c('continuous-dependence', '初期値への連続依存', 'Grönwall から出るが、**評価が指数的に悪くなる。**カオスはこの指数の中に在る', 'theorem', 'math', ['gronwall-inequality', 'well-posedness']),
  c('maximal-interval-of-existence', '解は有限時間で消えることがある', '**方程式が滑らかでも、解が無限大へ飛ぶ。**大域的に在ることは、局所的な存在からは出ない', 'theorem', 'math', ['ode-existence']),
  c('comparison-theorem-ode', '比較定理', '解かずに、別の解と大小を比べる。**上から抑える方程式が解ければ、それで足りる**', 'theorem', 'math', ['gronwall-inequality']),
  c('sturm-comparison', 'Sturm の比較定理', '**係数が大きいほど、零点が詰まる。**振動するかどうかが、係数の比較だけで決まる', 'theorem', 'math', ['comparison-theorem-ode']),
  c('sturm-separation', '零点は交互に現れる', '独立な二解の零点が、互いに挟み合う。**解を書かずに、根の並びが言える**', 'theorem', 'math', ['sturm-comparison']),

  // 境界値問題 ── 初期値問題との違いが結び
  c('boundary-value-problem', '境界値問題', '**条件を両端で与える。**初期値問題と同じ方程式なのに、性質がまったく違う', 'definition', 'math', ['ode-existence']),
  c('existence-can-fail-at-the-boundary', '解が無いことも、無限にあることもある', '**初期値問題では必ず一意に在ったのに。**条件を与える場所を変えただけで、一意性が壊れる', 'theorem', 'math', ['boundary-value-problem']),
  c('sturm-liouville-problem', 'Sturm–Liouville 問題', '**自己共役な形に書き直すと、固有値問題になる。**そこから先は線形代数の言葉が使える', 'definition', 'math', ['boundary-value-problem', 'spectral-theorem-bounded-selfadjoint']),
  c('eigenvalues-are-real-and-simple', '固有値は実で、単純で、無限へ発散する', '**自己共役性だけから出る。**Sturm–Liouville の形に直せたことが、全部を買っている', 'theorem', 'math', ['sturm-liouville-problem']),
  c('eigenfunctions-form-a-basis', '固有関数が完全系をなす', '**任意の関数を級数に展開できる。**Fourier 級数はこの特別な場合である', 'theorem', 'math', ['eigenvalues-are-real-and-simple', 'orthonormal-basis-infinite']),
  c('nth-eigenfunction-has-n-zeros', '$n$ 番目の固有関数は、零点をちょうど $n$ 個持つ', '**Sturm の振動定理。**固有値の番号という代数的な量と、零点の個数という幾何的な量が一致する', 'theorem', 'math', ['eigenfunctions-form-a-basis', 'sturm-separation']),
  c('green-function-ode', 'Green 関数（常微分方程式）', '**逆作用素の積分核。**境界値問題を解く操作が、一つの関数を掛けて積分することになる', 'definition', 'math', ['sturm-liouville-problem', 'fundamental-solution']),
  c('separation-of-variables-needs-this', '変数分離が成り立つ根拠が、ここに在る', '**偏微分方程式を常微分方程式に分けたあと、展開できるのは完全系だから。**そこを飛ばすと、なぜ級数で書けるのかが言えない', 'viewpoint', 'math', ['eigenfunctions-form-a-basis', 'elliptic-spectrum']),

  // 周期係数
  c('floquet-theory', 'Floquet 理論', '係数が周期的なら、解が「周期関数 × 指数関数」に書ける。**周期系が定数係数系に化ける**', 'theorem', 'math', ['linear-ode-is-a-vector-space', 'matrix-exponential']),
  c('parametric-resonance', '助変数共鳴', '**振動数を周期的に揺らすだけで、振幅が指数的に育つ。**外から力を加えていないのに不安定になる', 'theorem', 'math', ['floquet-theory', 'resonance-is-a-repeated-root']),
  c('stability-tongues', '不安定になる帯が、舌の形に並ぶ', '**Mathieu 方程式の安定図。**どの振動数比で共鳴するかが、整数の比で決まる', 'theorem', 'math', ['parametric-resonance', 'bifurcation']),
]
