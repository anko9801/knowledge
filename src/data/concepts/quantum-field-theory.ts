import type { Concept } from './types.ts'
import { c } from './types.ts'

export const quantumFieldTheory: readonly Concept[] = [
  // --- 場の量子論の入口 ----------------------------------------------------------
  //
  // 仮定を一本ずつ足すと、そのたびに形が決まる。その最初の一本が、
  // 「量子力学と相対論を両方認める」だけで粒子から位置を奪う。
  //
  // 構成は docs/map.md にある。ここは第 1 回が置く分だけ。
  c('localization-system', '局在系', '領域ごとに「そこに居る」を判定する射影の族。位置を持つとはこの族があること', 'definition', 'physics', ['quantum-state', 'sigma-algebra', 'poincare-group']),
  c('niws-condition', '一瞬で滲み出さない', '離れた領域へ移るには時間が要る。相対論が言う有限の速さを、確率の言葉に翻訳したもの', 'definition', 'physics', ['localization-system', 'causal-structure']),
  c('malament-theorem', 'Malament の定理', '四つを認めると、どの領域に見つかる確率も 0 になる。粒子は位置を持てない', 'theorem', 'physics', ['niws-condition', 'observable']),
  c('unsharp-localization', 'ぼやけた局在なら逃げられる', '射影をやめて POVM にすると定理は成り立たない。禁じられていたのは「そこに居る／居ない」の二値のほう', 'viewpoint', 'physics', ['malament-theorem']),
  c('cluster-decomposition', 'クラスター分解', '遠く離した実験の結果が互いに影響しない。Poincaré 不変性からもユニタリ性からも出ない、別の要請', 'definition', 'physics', ['unsharp-localization', 'poincare-group']),
  c('single-delta-condition', 'デルタ関数が一つだけ', '余分なデルタがあると、その塊を無限に遠ざけても結果が変わらなくなる。連結なら一つに決まる', 'theorem', 'physics', ['cluster-decomposition']),
  c('creation-annihilation-forced', '生成消滅演算子が強制される', 'クラスター分解を満たす書き方が、生成消滅演算子の積の和しか残らない', 'theorem', 'physics', ['single-delta-condition']),
  c('fields-are-derived', '場は結論である', '生成消滅演算子を Lorentz 共変に束ねると場になる。量子化する対象として仮定していない', 'theorem', 'physics', ['creation-annihilation-forced', 'wigner-classification']),
  c('microcausality', '微視的因果律', '空間的に離れた場は互いに影響しない。交換子が光円錐の外で消えることとして書く', 'definition', 'physics', ['fields-are-derived', 'causal-structure'], [], { aka: ['局所可換性'] }),
  c('antiparticle-required', '反粒子が要る', '消す側だけでは交換子が消えない。作る側を同じ質量で足して初めて打ち消し合う', 'theorem', 'physics', ['microcausality']),
  c('bose-fermi-alternative', '交換か反交換かの二択', '光円錐の外で消えるのは、そのどちらかのときだけ。どちらとスピンが組むかは、まだ決まらない', 'theorem', 'physics', ['antiparticle-required']),
  c('operator-valued-distribution', '場は一点で値を持てない', '試験関数と組ませて初めて演算子になる。同じ点での積が定義できない理由がここ', 'definition', 'physics', ['fields-are-derived', 'distribution-theory'], [], { aka: ['演算子値超関数'] }),
  c('positive-definite-metric', '計量が正定値', '状態のノルムが負にならない。ゴースト場はここだけを外して、スピン統計の結論を免れる', 'definition', 'physics', ['hilbert-space', 'observable']),
  c('spin-statistics-theorem', 'スピン統計定理', '整数スピンは交換関係、半整数は反交換関係。偏極の和が運動量の反転で持つ符号が決めている', 'theorem', 'physics', ['bose-fermi-alternative', 'positive-definite-metric', 'wigner-classification']),
  c('pauli-exclusion', '排他律', '反交換関係から生成演算子の二乗が 0 になる。同じ状態を二度作れない', 'theorem', 'physics', ['spin-statistics-theorem'], [], { aka: ['Pauli の排他原理'] }),
  c('antiunitary-time-reversal', '時間反転は反ユニタリ', 'ユニタリだとエネルギーの符号がひっくり返る。下に有界という仮定と衝突するので、残るのは反ユニタリの側', 'theorem', 'physics', ['positive-definite-metric', 'energy-bounded-below']),
  c('complex-lorentz-connected', '複素 Lorentz 群は連結', 'ラピディティに複素数を許すと、空間と時間の同時反転が恒等変換とつながる。行列式が +1 の側だけ', 'theorem', 'physics', ['poincare-group', 'lie-group']),
  c('cpt-theorem', 'CPT 定理', 'Poincaré 不変性・正エネルギー・局所性・真空から出る。積だけが守られ、三つは個別には守られない', 'theorem', 'physics', ['complex-lorentz-connected', 'antiunitary-time-reversal', 'microcausality']),
  c('fields-not-observable', '場は観測量ではない', '半整数スピンの場は空間的に離れた点で反交換するので、離れた測定が影響しないという要求を満たさない。偶数個の積だけが観測量になる', 'theorem', 'physics', ['spin-statistics-theorem', 'observable']),
  c('asymptotic-condition', '漸近条件', '遠い過去と未来では、場の行列要素が自由場のそれに近づく。演算子としては近づかない', 'definition', 'physics', ['fields-not-observable']),
  c('s-matrix', 'S 行列', '遠い過去に入れた状態と遠い未来に出た状態の対応。断面積も崩壊率もここから出る', 'definition', 'physics', ['asymptotic-condition']),
  c('field-redefinition-freedom', '場は一意に決まらない', '一粒子状態を拾う場ならどれでも同じ S 行列を与える。場は局所性を書き込むための座標である', 'theorem', 'physics', ['s-matrix', 'microcausality']),
  c('spectral-representation', 'スペクトル表示', '完全系を挟むだけで、2 点関数が自由場のものの重ね合わせに決まる。摂動論も相互作用の中身も使わない', 'theorem', 'physics', ['s-matrix', 'poincare-group'], [], { aka: ['Källén–Lehmann 表示'] }),
  c('spectral-density-positive', '重みは正である', '絶対値の二乗の和なので負にならない。同時刻交換関係を足すと総量が 1 に固定される', 'theorem', 'physics', ['spectral-representation']),
  c('field-strength-renormalization', '場が一粒子を拾う割合', '重みのうち一粒子の分。1 を超えられず、等号は自由場のときだけ。0 になると漸近条件が使えない', 'definition', 'physics', ['spectral-density-positive', 'asymptotic-condition'], [], { aka: ['波動関数くりこみ', 'Z 因子'] }),
  c('mass-is-a-pole', '質量は極の位置', '式に書いた文字ではなく、伝播関数の極が立つところ。切断の始まりからは崩壊が読める', 'viewpoint', 'physics', ['spectral-representation']),
  c('time-ordered-correlation', '時間順序の相関関数', '場を時間の順に並べた期待値。n を変えれば何個入って何個出る散乱でも同じ関数から読める', 'definition', 'physics', ['s-matrix'], [], { aka: ['Green 関数', 'n 点関数'] }),
  c('pole-from-one-particle', '極は一粒子から立つ', '完全系を挟むと、一粒子状態のところだけが極になる。二粒子以上は切断になる', 'theorem', 'physics', ['time-ordered-correlation', 'spectral-representation']),
  c('path-integral-correlation', '経路積分', '演算子を並べる代わりに数を足す。時間順序は被積分関数ではなく積分の作り方に入る', 'technique', 'physics', ['time-ordered-correlation', 'action-functional']),
  c('generating-functional', '生成汎関数', '作用に外から掛ける項を足したもの。汎関数微分の回数を変えると n 点関数が出る', 'technique', 'physics', ['path-integral-correlation']),
  c('measure-not-defined', '測度が定義されていない', '無限次元に平行移動不変な測度は作れない。展開した先だけが定義されていて、元の式は定義されていない', 'viewpoint', 'physics', ['path-integral-correlation']),
  c('wick-theorem', 'Wick の定理', '自由場の n 点関数は、点を二つずつ組にする分け方すべてについて伝播関数の積を足したもの。近似ではない', 'theorem', 'physics', ['generating-functional']),
  c('feynman-diagram', 'Feynman 図', '対の作り方に付けた名前。図と展開の項が一対一に対応する。規則は覚えるものではなく読み取るもの', 'technique', 'physics', ['wick-theorem']),
  c('connected-diagrams-only', '繋がった図だけが残る', '真空泡が分母で割り切れる。クラスター分解が割り算として現れたもの', 'theorem', 'physics', ['feynman-diagram', 'cluster-decomposition']),
  c('vacuum-overlap-vanishes', '真空の重なりが消える', '箱ごとの重なりを掛けると体積とともにゼロへ行く。自由な真空と相互作用のある真空は別の状態', 'theorem', 'physics', ['cluster-decomposition']),
  c('inequivalent-representations', 'ユニタリ非同値', '無限自由度だと正準交換関係の表現が一つに決まらない。Stone–von Neumann が効かなくなる', 'definition', 'physics', ['vacuum-overlap-vanishes', 'hilbert-space']),
  c('haag-theorem', 'Haag の定理', '相互作用描像が存在すると、相互作用が無いことが出る。短距離ではなく体積が無限であることから来る', 'theorem', 'physics', ['inequivalent-representations', 'wick-theorem']),
  c('lsz-reduction', 'LSZ 簡約公式', '極の留数が S 行列の要素になる。問題が「散乱を計算する」から「相関関数を計算する」に置き換わる', 'theorem', 'physics', ['pole-from-one-particle', 'field-strength-renormalization']),
]
