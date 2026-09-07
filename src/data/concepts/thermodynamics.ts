import type { Concept } from './types.ts'
import { c } from './types.ts'

export const thermodynamics: readonly Concept[] = [
  // --- 熱力学 ----------------------------------------------------------------
  //
  // 微視的な模型を一つも使わずに、経験則から状態量が存在することを出す。
  //
  // **統計力学との矢は両向きである。** 熱力学は $S$ が在ることを証明し、
  // 統計力学は $S$ が幾つかを計算する。`derivations.ts` を見ること。
  //
  // 出典は Lieb--Yngvason (cond-mat/9708200)、Fermi、Callen、Chandrasekhar 第 1 章。
  c('equilibrium-state', '平衡状態', '有限個の数で完全に指定できる状態だけを相手にする。理論の適用範囲がここで決まる', 'definition', 'physics', ['multivariable-calculus']),
  c('adiabatic-accessibility', '断熱到達可能性', '重りを上げ下げするだけで移れるか、という順序。熱も温度も使わずに定義できる', 'definition', 'physics', ['equilibrium-state', 'relation-order']),
  c('zeroth-law', '第零法則', '熱平衡が推移的。これで状態空間が等温面に分かれる', 'definition', 'physics', ['equilibrium-state']),
  c('empirical-temperature', '経験温度', '第零法則の同値類に付けた番号。目盛りの取り方は任意で、まだ物理的な意味は無い', 'definition', 'physics', ['zeroth-law']),
  c('adiabatic-work-path-independent', '断熱仕事は経路に依らない', '断熱壁で囲むと、仕事が始点と終点だけで決まる', 'theorem', 'physics', ['adiabatic-accessibility']),
  c('internal-energy', '内部エネルギー', '上の定理が存在を保証する状態量。第一法則の中身は「$U$ が在る」であって、エネルギー保存ではない', 'definition', 'physics', ['adiabatic-work-path-independent']),
  c('heat-as-residual', '熱は差として定義される', '$delta Q := dif U - delta W$。熱は原始概念ではない', 'definition', 'physics', ['internal-energy']),
  c('work-coordinates', '仕事座標', '$U$ 以外の座標。何個あるかが第二法則の内容量を決める', 'definition', 'physics', ['internal-energy']),

  // 第二法則、三つの言い方
  c('kelvin-planck-statement', 'Kelvin–Planck の言明', '一つの熱源から熱を取って全部仕事にする機関は無い', 'definition', 'physics', ['heat-as-residual']),
  c('clausius-statement', 'Clausius の言明', '低温から高温へ熱を移すだけの過程は無い', 'definition', 'physics', ['heat-as-residual']),
  c('caratheodory-principle', 'Carathéodory の原理', 'どんな近傍にも、断熱では到達できない状態がある。**定理ではなく要請である**', 'definition', 'physics', ['adiabatic-accessibility']),
  c('second-law-equivalence', '三つの言明は同値', '一方を破る機械から、他方を破る機械が組める', 'theorem', 'physics', ['kelvin-planck-statement', 'clausius-statement']),
  c('planck-principle', 'Planck の原理', '仕事座標を変えずに、断熱でエネルギーを取り出すことはできない。Carathéodory の原理より強い', 'theorem', 'physics', ['caratheodory-principle', 'work-coordinates']),

  // Carnot 路線
  c('carnot-cycle', 'Carnot サイクル', '二本の等温線と二本の断熱線で囲む。作業物質を指定しないで済む唯一のサイクル', 'definition', 'physics', ['kelvin-planck-statement']),
  c('carnot-theorem', 'Carnot の定理', '二熱源間の可逆機関の効率は、作業物質に依らない', 'theorem', 'physics', ['carnot-cycle']),
  c('absolute-temperature', '絶対温度', '効率の比で目盛りを定義する。物質を一つも指定せずに作った温度計', 'definition', 'physics', ['carnot-theorem']),
  c('clausius-theorem', 'Clausius の定理', '$integral.cont delta Q \\/ T <= 0$。可逆なら等号', 'theorem', 'physics', ['absolute-temperature']),
  c('entropy-thermodynamic', '熱力学的エントロピー', '可逆路の $integral delta Q \\/ T$ が経路に依らない。状態量が一つ増える', 'definition', 'physics', ['clausius-theorem'], [], { aka: ['Clausius エントロピー'] }),
  c('clausius-inequality-insufficient', '不等式だけではエントロピーは出ない', '$integral.cont delta Q \\/ T <= 0$ から $S$ は作れない。等号が成り立つ可逆過程が**在る**ことが別に要る', 'theorem', 'physics', ['clausius-theorem']),

  // 幾何路線 ── 山その一
  c('delta-q-as-one-form', '$delta Q$ は 1 形式である', '不完全でも半端でもない。外微分の像でないだけ。$integral.cont delta Q != 0$ が熱機関の回る理由と同じ一行', 'viewpoint', 'physics', ['heat-as-residual', 'one-form', 'closed-vs-exact']),
  c('integrating-factor-from-inaccessibility', '到達不能から積分因子が出る', 'Carathéodory の原理が $omega and dif omega = 0$ を与え、Frobenius が積分因子を出す', 'theorem', 'physics', ['caratheodory-principle', 'frobenius-integrability']),
  c('second-law-vacuous-for-simple-systems', '仕事座標 1 個なら第二法則は空である', '$Lambda^3 = 0$ なので積分因子は自動的に在る。内容が出るのは仕事座標が 2 個以上のときだけ', 'theorem', 'physics', ['integrating-factor-from-inaccessibility', 'work-coordinates']),
  c('integrating-factor-not-unique', '積分因子は一意でない', '$lambda arrow.r lambda g(S)$ の自由度が残る。幾何だけでは $1 \\/ T$ を選べない', 'theorem', 'physics', ['integrating-factor-from-inaccessibility']),
  c('universality-of-temperature', '温度の普遍性', '二つの系を熱接触させ、合成系にも積分因子を要求すると $lambda = T(theta) f(S)$ に分解し、$T$ が全物質に共通になる', 'theorem', 'physics', ['integrating-factor-not-unique', 'zeroth-law']),
  c('entropy-additivity-derived', 'エントロピーの加法性は導かれる', '合成系の積分因子が $T$ そのものになるので $S = S_1 + S_2$ が結論として出る。加法性を仮定に置かない', 'theorem', 'physics', ['universality-of-temperature']),

  // 順序路線 ── 山その二
  c('order-axioms-adiabatic', '順序の公理', '反射・推移・整合・スケール不変・分割再結合・安定性。どれも「できる」という肯定文で、「できない」を一つも含まない', 'definition', 'physics', ['adiabatic-accessibility']),
  c('comparison-hypothesis', '比較可能性', '任意の二状態が比較できる。**ここが効いている仮定である**', 'definition', 'physics', ['order-axioms-adiabatic']),
  c('entropy-principle', 'エントロピー原理', '$X prec Y <=> S(X) <= S(Y)$ を満たす加法的・示量的な $S$ が在ることは、公理と比較可能性と**同値**', 'theorem', 'physics', ['comparison-hypothesis']),
  c('canonical-entropy-construction', 'エントロピーの構成', '参照状態を二つ選ぶと目盛りが決まる。上限として明示的に書き下せる', 'technique', 'physics', ['entropy-principle']),
  c('entropy-uniqueness-affine', 'エントロピーはアフィン変換を除いて一意', '$S arrow.r a S + B$ の自由度だけが残る。目盛りと原点は熱力学では決まらない', 'theorem', 'physics', ['canonical-entropy-construction']),
  c('entropy-concavity', 'エントロピーの凹性', '凸結合の公理と同値。凹だから足し合わせが最大値を取る', 'theorem', 'physics', ['entropy-principle', 'convex-set']),
  c('transversality', '横断性', '各状態の等温面が断熱面を切る。これが比較可能性を出す鍵で、無いと状態空間が二つに割れる', 'definition', 'physics', ['comparison-hypothesis']),
  c('comparison-from-thermal-contact', '比較可能性は導ける', '熱接触の公理から、合成系の比較可能性が定理として出る。仮定を一つ減らせる', 'theorem', 'physics', ['transversality', 'zeroth-law']),
  c('temperature-from-entropy', '温度はエントロピーから出る', '$1 \\/ T = partial S \\/ partial U$。左右の微分が一致することまで示せる。「熱い」を最初に仮定しない', 'theorem', 'physics', ['entropy-principle']),

  // 測れるのは二階微分だけ
  c('thermodynamic-potentials', '熱力学ポテンシャル', '$H$、$F$、$G$。どの変数を制御できるかで選ぶ', 'definition', 'physics', ['convex-conjugate', 'entropy-thermodynamic']),
  c('massieu-functions', 'Massieu 関数', 'エントロピー表示の Legendre 変換。$F \\/ T$ の側。統計力学が実際に計算するのはこちら', 'definition', 'physics', ['thermodynamic-potentials']),
  c('maxwell-relations', 'Maxwell の関係式', '$dif dif = 0$ の成分表示。四本ではなく一本', 'theorem', 'physics', ['thermodynamic-potentials', 'dd-zero']),
  c('available-work', '取り出せる仕事の上限', '$F$ と $G$ を使う理由は便利さではない。環境を決めると、取り出せる量が状態量の差で抑えられる', 'theorem', 'physics', ['thermodynamic-potentials']),
  c('energy-equation', 'エネルギー方程式', '$(partial U \\/ partial V)_T = T (partial p \\/ partial T)_V - p$。状態方程式だけから内部エネルギーの体積依存が決まる', 'theorem', 'physics', ['maxwell-relations']),
  c('joule-law-is-derived', '理想気体の $U$ が $V$ に依らないのは実験事実ではない', '$p V = N k T$ と第二法則から出る。測る必要が無い', 'theorem', 'physics', ['energy-equation']),
  c('equation-of-state', '状態方程式', '熱力学が外から与えられる入力として扱う関係。ここだけは測るしかない', 'definition', 'physics', ['equilibrium-state']),
  c('response-functions', '応答係数', '比熱・圧縮率・熱膨張。ポテンシャルの二階微分だけが実験に掛かる', 'definition', 'physics', ['thermodynamic-potentials']),
  c('cp-minus-cv', '$C_p - C_V$ は物質に依らない', '$T V alpha^2 \\/ kappa_T$。圧縮率が正だから $C_p >= C_V$ が必ず成り立つ', 'theorem', 'physics', ['response-functions', 'maxwell-relations']),
  c('thermodynamic-stability', '熱力学的安定性', 'エントロピーの凹性が $C_V >= 0$ と $kappa_T >= 0$ と同値。比熱が正なのは物質の性質ではない', 'theorem', 'physics', ['entropy-concavity', 'response-functions']),

  // 示量性・相
  c('extensivity', '示量性', '$S(lambda X) = lambda S(X)$。相互作用が短距離であることを暗に仮定している', 'definition', 'physics', ['entropy-principle']),
  c('chemical-potential', '化学ポテンシャル', '粒子を一個足すときの自由エネルギーの増分', 'definition', 'physics', ['thermodynamic-potentials']),
  c('euler-relation', 'Euler の関係式', '$U = T S - p V + mu N$。示量性を微分しただけ', 'theorem', 'physics', ['extensivity', 'chemical-potential']),
  c('gibbs-duhem', 'Gibbs–Duhem', '$S dif T - V dif p + N dif mu = 0$。示強変数は独立でない', 'theorem', 'physics', ['euler-relation']),
  c('phase-equilibrium-conditions', '相平衡の条件', '温度・圧力・化学ポテンシャルが相のあいだで一致する。エントロピーの最大化から出る', 'theorem', 'physics', ['chemical-potential', 'entropy-concavity']),
  c('gibbs-phase-rule', '相律', '$f = c - p + 2$。何を自由に変えられるかが、数えるだけで決まる', 'theorem', 'physics', ['gibbs-duhem', 'phase-equilibrium-conditions']),
  c('clausius-clapeyron', 'Clausius–Clapeyron', '$dif p \\/ dif T = L \\/ (T Delta v)$。共存線の傾きが潜熱で決まる', 'theorem', 'physics', ['phase-equilibrium-conditions', 'gibbs-duhem']),
  c('first-order-transition', '一次相転移', 'ポテンシャルの一階微分が飛ぶ。そこで微分可能性が落ちる', 'definition', 'physics', ['clausius-clapeyron']),
  c('maxwell-construction', 'Maxwell の等面積則', '不安定枝を平坦部で置き換える。作図ではなく、凹包を取る操作そのもの', 'technique', 'physics', ['first-order-transition', 'thermodynamic-stability', 'convex-conjugate']),
  c('critical-point', '臨界点', '一次相転移の終端。二階微分が発散し、安定性の不等式が等号になる', 'definition', 'physics', ['first-order-transition', 'thermodynamic-stability']),

  // 閉じないところ
  c('third-law', '第三法則', '$T arrow.r 0$ でエントロピーが制御変数に依らない定数へ近づく。第一・第二法則から独立', 'definition', 'physics', ['entropy-uniqueness-affine']),
  c('third-law-consequences', '第三法則の帰結', '比熱も熱膨張も絶対零度で消える。どちらも測れる予言になる', 'theorem', 'physics', ['third-law', 'response-functions']),
  c('entropy-constants-undetermined', '物質ごとの加法定数は決まらない', '混合と反応の公理を足しても、出るのは弱い形だけ', 'theorem', 'physics', ['third-law', 'entropy-uniqueness-affine']),
  c('gibbs-paradox-thermo', 'Gibbs のパラドクス', '別の気体を混ぜるとエントロピーが増え、同じ気体なら増えない。示量性と両立しない', 'viewpoint', 'physics', ['extensivity', 'entropy-constants-undetermined']),
  c('local-equilibrium', '局所平衡', '各点で平衡熱力学が使えると仮定する。場に広げるための追加の仮定', 'definition', 'physics', ['equilibrium-state']),
  c('entropy-production', 'エントロピー生成', '流れと駆動力の積の和が非負。不可逆性が一つの不等式になる', 'definition', 'physics', ['local-equilibrium', 'entropy-thermodynamic']),
  c('onsager-reciprocity', 'Onsager の相反関係', '輸送係数の行列が対称。**熱力学の中では導けない。微視的可逆性が要る**', 'definition', 'physics', ['entropy-production']),

  // 何が何へ移れるか ── エントロピーひとつでは決まらない
  c('thermo-majorization', '熱浴があるときの優越', '熱浴を自由に使ってよいとすると、移れる条件が優越の一般化になる。**等温では通常の優越に戻る**', 'theorem', 'physics', ['hardy-littlewood-polya', 'entropy-thermodynamic']),
  c('second-law-is-not-one-inequality', '第二法則は、一本の不等式ではない', 'エントロピーが増えるのに移れない状態対がある。**移れるかを決めるのは半順序で、単調量の族が要る**', 'viewpoint', 'physics', ['thermo-majorization', 'one-number-cannot-decide']),
]
