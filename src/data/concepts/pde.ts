import type { Concept } from './types.ts'
import { c } from './types.ts'

export const pde: readonly Concept[] = [
  // --- 偏微分方程式 ------------------------------------------------------------
  //
  // **方程式は解を決めない。決めるのは外から足す条件のほうで、
  // 何を足せば決まるかが、方程式の型そのものである。**
  //
  // 対照は既存の `ode-existence`（初期値を与えれば一意に決まる。証明は縮小写像）。
  // 常微分方程式で当たり前だったことが、ここでは全部壊れる。
  //
  // 出典は Hunter (UC Davis)、Clay の Navier--Stokes 問題文、
  // De Lellis--Székelyhidi (0712.3288)、Tao のブログ。
  c('well-posedness', '適切性', '存在・一意・データへの連続依存。三つ目だけが方程式の外から来る要求である', 'definition', 'math', ['ode-existence', 'metric-space']),
  c('cauchy-kovalevskaya', 'Cauchy–Kovalevskaya の定理', '初期面が非特性的でデータが解析的なら、局所解析解が一意に存在する', 'theorem', 'math', ['analytic-function', 'multivariable-calculus']),
  c('existence-does-not-give-stability', '存在定理は安定性を判定しない', '同じ定理が波動方程式と Laplace の Cauchy 問題に等しく効くのに、後者はどの $H^s$ でも不適切である', 'theorem', 'math', ['cauchy-kovalevskaya', 'well-posedness']),
  c('characteristic-surface', '特性曲面', '方程式が法線方向の最高階微分を決めない面。$t = 0$ は熱方程式の特性面である', 'definition', 'math', ['multivariable-calculus']),
  c('growth-condition-selects', '増大度条件が解を選ぶ', '熱方程式の解は一意でない。無限遠での大きさを足して初めて一つに決まる', 'theorem', 'math', ['characteristic-surface', 'well-posedness']),
  c('backward-heat-ill-posed', '後ろ向きには解けない', '微分ごと一様に 0 へ行く初期値の列が、どの正時刻でも発散する解を持つ。連続依存だけが単独で壊れる', 'theorem', 'math', ['well-posedness', 'fourier-transform']),

  // 一階と保存則 ── 連載の山
  c('method-of-characteristics', '特性曲線法', '偏微分方程式が、曲線に沿った常微分方程式になる。一階ならこれで解ける', 'technique', 'math', ['ode-existence', 'characteristic-surface']),
  c('wave-steepening', '特性が交わる', '非線形だと有限時間で特性線が衝突し、滑らかな解が存在しなくなる。方程式の側は何も壊れていない', 'theorem', 'math', ['method-of-characteristics']),
  c('weak-solution', '弱解', '微分を試験関数へ移す。方程式が要求する滑らかさが下がる代わりに、解が増える', 'definition', 'math', ['distribution-theory', 'lp-space']),
  c('rankine-hugoniot', 'Rankine–Hugoniot 条件', '弱解が不連続を持つなら、その速さが跳びの比に決まる', 'theorem', 'math', ['weak-solution', 'wave-steepening']),
  c('weak-solution-not-unique', '弱解は一意でない', '同じ初期値に、希薄波と衝撃波の二つの弱解が在る。方程式だけでは選べない', 'theorem', 'math', ['rankine-hugoniot']),
  c('entropy-condition', 'エントロピー条件', '不等式を一本足して一つ選ぶ。**等式ではないので、時間反転で不変にならない**', 'definition', 'math', ['weak-solution-not-unique']),
  c('vanishing-viscosity', '消失粘性の極限', '粘性を足して 0 へ送ると、その不等式が出る。外から置いた条件が、こちらでは結論になる', 'theorem', 'math', ['entropy-condition']),
  c('irreversibility-from-shocks', '衝撃波で情報が消える', '特性線が衝撃波へ吸い込まれるので過去を復元できない。方程式そのものは時間反転で不変である', 'viewpoint', 'math', ['entropy-condition']),
  c('admissibility-fails-in-2d', '条件を足しても決まらない次元がある', '非圧縮 Euler では、エネルギー等式まで満たす弱解が無限個ある初期値が存在する', 'theorem', 'math', ['entropy-condition']),

  // 二階の分類
  c('second-order-classification', '二階の分類', '主部の符号だけで楕円・放物・双曲に分かれる。座標変換で移り合わない', 'definition', 'math', ['quadratic-form', 'characteristic-surface']),
  c('type-decides-what-can-be-said', '型が言えることを決める', '有限伝播速度・時間反転・平滑化・最大値原理の四つが、双曲と放物で全部逆になる', 'theorem', 'math', ['second-order-classification']),

  // 楕円型
  c('mean-value-property', '平均値の性質', '調和関数の球面平均は半径に依らない。逆も成り立つので、これを定義にしてよい', 'theorem', 'math', ['laplacian', 'integration-in-rn']),
  c('harmonic-implies-analytic', '調和なら解析的', '二階しか仮定していないのに $C^omega$ になる。平均値の性質を軟化子で微分するだけで出る', 'theorem', 'math', ['mean-value-property', 'analytic-function', 'bump-function']),
  c('maximum-principle', '最大値原理（劣調和）', '非定数の劣調和関数は内点で最大値を取らない。**スカラーにしか無く、連立系には無い**', 'theorem', 'math', ['mean-value-property', 'connectedness']),
  c('harnack-inequality', 'Harnack 不等式', '非負な調和関数は上限が下限で抑まる。定数は領域だけで決まる。ここから関数列のコンパクト性が出る', 'theorem', 'math', ['mean-value-property']),
  c('sobolev-space', 'Sobolev 空間', '弱微分が $L^p$ に入る関数の空間。滑らかさを、微分の可積分性で測り直す', 'definition', 'math', ['weak-solution', 'lp-space']),
  c('sobolev-embedding', 'Sobolev の埋め込み', '微分が可積分なら関数がより強い可積分性を持つ。**次元が式に入る**。$p$ が次元を超えると連続になる', 'theorem', 'math', ['sobolev-space']),
  c('poincare-inequality', 'Poincaré 不等式', '境界で 0 なら、関数の大きさが微分の大きさで抑まる。最良定数が第一固有値になる', 'theorem', 'math', ['sobolev-space']),
  c('lax-milgram', 'Lax–Milgram の定理', '双線形形式が有界かつ強圧的なら弱解が一意に存在する。**解の形を何も知らずに存在だけ言える**', 'theorem', 'math', ['sobolev-space', 'hilbert-space', 'poincare-inequality']),
  c('elliptic-regularity', '楕円型の正則性', '弱解として作ったものが、実はもっと滑らかである。滑らかさを捨てて解を作り、あとで戻ってくる', 'theorem', 'math', ['lax-milgram']),
  c('fredholm-alternative-pde', 'Fredholm の択一', '解が在るか、随伴の核と直交するかのどちらか。resolvent がコンパクトであることから出る', 'theorem', 'math', ['lax-milgram', 'adjoint']),
  c('elliptic-spectrum', '楕円型作用素のスペクトルは離散', '有界領域では固有値が可算個で発散し、固有関数が $L^2$ の正規直交基底になる', 'theorem', 'math', ['fredholm-alternative-pde', 'spectral-theorem-unbounded']),

  // 放物型と双曲型
  c('heat-smoothing', '熱方程式の平滑化', '$L^p$ の初期値が正時刻で $C^infinity$ になる。高振動数が指数で潰れるだけである', 'theorem', 'math', ['fourier-transform', 'type-decides-what-can-be-said']),
  c('semigroup-not-group', '半群にしかならない', '$L^2$ 全体が稠密な部分空間へ写るので、流れを逆に回せない。Schrödinger のほうは群になる', 'theorem', 'math', ['heat-smoothing', 'stone-theorem']),
  c('finite-propagation-speed', '有限伝播速度と依存領域', 'ある時刻の値は、光円錐の内側の初期値だけで決まる。**エネルギー法で、解を作らずに言える**', 'theorem', 'math', ['type-decides-what-can-be-said']),
  c('energy-method', 'エネルギー法', '方程式に解を掛けて積分する。解を構成せずに一意性と評価だけが出る', 'technique', 'math', ['finite-propagation-speed', 'lp-space']),
  c('huygens-principle', '台が面に載るのは奇数次元だけ', '3 以上の奇数の空間次元でだけ、解の台が光円錐面に載る。偶数次元では内側に残る', 'theorem', 'math', ['finite-propagation-speed'], [], { aka: ['Huygens の原理', '強い Huygens の原理'] }),

  // 基本解 ── 超関数との境界は「どれを選ぶかは方程式が決めない」の側
  c('fundamental-solution', '基本解', '右辺をデルタにした解。畳み込みで任意の右辺の解が出る。斉次解の分だけ一意でない', 'definition', 'math', ['distribution-theory']),
  c('which-greens-function', 'どの基本解を選ぶかは、方程式が決めない', '遅延・先進・Feynman は同じ方程式の解で、差は斉次解。選ぶのは境界条件であって式からは出ない', 'theorem', 'math', ['fundamental-solution', 'causal-structure']),

  // Navier--Stokes ── 結び
  c('leray-weak-solution', 'Leray の弱解', '3 次元 Navier–Stokes は有限エネルギーの弱解を常に持つ。一意性は分かっていない', 'theorem', 'math', ['weak-solution', 'energy-method']),
  c('partial-regularity', '部分正則性', '特異集合の放物型 Hausdorff 測度が消える。特異集合は時空の曲線を含めない', 'theorem', 'math', ['leray-weak-solution', 'measure']),
  c('supercritical-scaling', 'スケーリングが優臨界', '押さえられる二つの量が、細かい尺度へ行くと効かなくなる。弱解の道も blowup 判定の道も、この一点で塞がる', 'viewpoint', 'math', ['leray-weak-solution']),
]
