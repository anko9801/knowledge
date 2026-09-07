import type { Concept } from './types.ts'
import { c } from './types.ts'

export const algebraicGeometry: readonly Concept[] = [
  // --- 可換環論と代数幾何 ------------------------------------------------------
  //
  // **MSC 13/14、math.AC/AG が指した空白。**代数も代数体も在るのに、
  // 「方程式の解集合を図形として見る」側が無かった。
  //
  // 軸は**「図形と環が同じものである」**。零点定理が対応を作り、
  // そこから先は**幾何の問いを環の問いに翻訳して解く**ことの繰り返しになる。
  // 次元も接空間も特異点も、全部環の言葉で定義し直せる。
  //
  // **代数体との関係が一つある。**Dedekind 環は「一次元で正則」であり、
  // 素イデアル分解は曲線上の点の話と同じ形をしている。
  // 数論と幾何が同じ道具を使う、という結びになる。
  c('affine-variety', 'アフィン代数多様体', '多項式の共通零点。**方程式の集合ではなく、生成するイデアルだけが効く**', 'definition', 'math', ['polynomial-ring', 'ideal']),
  c('zariski-topology', 'Zariski 位相', '閉集合を零点集合と定める。**開集合が異様に大きく、Hausdorff にならない**', 'definition', 'math', ['affine-variety', 'topology-basics']),
  c('why-not-hausdorff', '分離されないことが、利点である', '**既約な多様体では、空でない開集合が全部稠密。**「ほとんど至る所」が位相の言葉で書ける', 'viewpoint', 'math', ['zariski-topology']),
  c('hilbert-basis-theorem', 'Hilbert の基底定理', '**多項式環のイデアルは有限生成。**無限個の方程式を書いても、有限個で足りる', 'theorem', 'math', ['affine-variety', 'noetherian-ring']),
  c('noetherian-ring', 'Noether 環', 'イデアルの増大列が止まる。**「無限に細かくできない」ことを、環の言葉で言う**', 'definition', 'math', ['ideal', 'polynomial-ring']),
  c('nullstellensatz', 'Hilbert の零点定理', '**代数閉体の上で、根基イデアルと多様体が一対一に対応する。**図形と環が同じものになる', 'theorem', 'math', ['hilbert-basis-theorem', 'maximal-ideal-quotient-field']),
  c('algebraically-closed-is-essential', '代数閉でないと、対応が壊れる', '**実数の上では $x^2 + 1$ の零点が空。**方程式が違うのに同じ図形になってしまう', 'viewpoint', 'math', ['nullstellensatz']),
  c('coordinate-ring', '座標環', '多様体の上の多項式関数の全体。**図形を、関数の環として記憶する**', 'definition', 'math', ['nullstellensatz']),
  c('maps-are-ring-homomorphisms', '写像は、環準同型の逆向きである', '**幾何の射と代数の準同型が、矢印を逆にして一対一。**圏の同値として書ける', 'theorem', 'math', ['coordinate-ring', 'functor']),
  c('prime-ideals-are-subvarieties', '素イデアルが、既約な部分多様体である', '**極大イデアルが点、素イデアルがより大きな部分。**環の構造が図形の階層になる', 'theorem', 'math', ['coordinate-ring']),

  // 局所化と、次元
  c('localization', '局所化', '分母を許して環を大きくする。**一点の近くだけを見る操作**', 'technique', 'math', ['integral-domain', 'prime-ideals-are-subvarieties']),
  c('local-ring', '局所環', '極大イデアルが一つだけ。**「一点での様子」が、環一つに閉じ込められる**', 'definition', 'math', ['localization']),
  c('krull-dimension', 'Krull 次元', '素イデアルの鎖の長さ。**幾何的な次元を、環だけで定義できる**', 'definition', 'math', ['prime-ideals-are-subvarieties']),
  c('dimension-agrees-with-intuition', '三つの定義が一致する', '**Krull 次元・超越次数・接空間の次元（滑らかな点で）が同じ値。**一致することが定理である', 'theorem', 'math', ['krull-dimension', 'field-extension']),
  c('zariski-tangent-space', 'Zariski 接空間', '極大イデアルの二乗で割った商の双対。**微分を使わずに接空間が定義できる**', 'definition', 'math', ['local-ring', 'dual-space']),
  c('regular-point', '正則点', '接空間の次元が Krull 次元に等しい点。**そうでない点が特異点**', 'definition', 'math', ['zariski-tangent-space', 'dimension-agrees-with-intuition']),
  c('singularity-is-detected-algebraically', '特異点は、環を見れば分かる', '**尖点も自己交差も、局所環の性質として区別できる。**絵を描かずに判定できる', 'viewpoint', 'math', ['regular-point']),
  c('dedekind-is-dimension-one-regular', 'Dedekind 環は、一次元で正則な環である', '**代数体の整数環と、滑らかな曲線が同じ枠に入る。**素イデアル分解が、点での局所的な様子にあたる', 'viewpoint', 'math', ['regular-point', 'dedekind-domain']),

  // 射影と、数え上げ
  c('projective-space', '射影空間', '無限遠を足して閉じる。**平行線が交わるようにすると、例外が消える**', 'definition', 'math', ['affine-variety', 'quotient-space']),
  c('projective-is-compact', '射影多様体はコンパクトである', '**像が閉になるので、「逃げていく」場合を考えなくてよい。**存在定理が言いやすくなる', 'theorem', 'math', ['projective-space', 'zariski-topology']),
  c('bezout-theorem', 'Bézout の定理', '**次数の積だけ交わる。**重複度を数え、射影空間で考え、代数閉体を取ると、例外が一つも無くなる', 'theorem', 'math', ['projective-is-compact', 'nullstellensatz']),
  c('three-conditions-make-it-exact', '三つの条件が、等号を作っている', '**射影・代数閉・重複度。**どれを外しても不等号になる ── 定理が何を買ったかが見える', 'viewpoint', 'math', ['bezout-theorem', 'algebraically-closed-is-essential']),
  c('genus-of-a-curve', '曲線の種数', '**位相的な穴の数が、次数から計算できる。**代数の量と位相の量が結びつく', 'theorem', 'math', ['bezout-theorem', 'euler-characteristic']),
  c('divisors', '因子', '点に整数を割り当てたもの。**関数の零点と極を、形式和として扱う**', 'definition', 'math', ['prime-ideals-are-subvarieties', 'abelian-group']),
  c('riemann-roch', 'Riemann–Roch の定理', '**指定した零点と極を持つ関数の次元が、次数と種数だけで決まる。**幾何が数を出す', 'theorem', 'math', ['divisors', 'genus-of-a-curve']),
  c('riemann-roch-is-an-index-theorem', '指数定理の原型である', '**解析的な量（関数の次元）と位相的な量（種数）の差が、両者を結ぶ。**Atiyah–Singer がこの一般化', 'viewpoint', 'math', ['riemann-roch', 'fredholm-index']),
  c('elliptic-curves-are-groups', '三次曲線には、群構造が入る', '**Bézout が「三点目がただ一つ在る」を保証する。**加法が幾何の作図で定義できる', 'theorem', 'math', ['bezout-theorem', 'genus-of-a-curve', 'abelian-group']),
  c('mordell-weil', 'Mordell–Weil の定理', '**有理点の全体が有限生成。**無限個在っても、有限個の点から作れる', 'theorem', 'math', ['elliptic-curves-are-groups', 'abelian-structure-theorem']),
  c('same-shape-as-dirichlet', '単数定理と、同じ形である', '**「無限だが有限生成」という結論も、階数と捩れに分ける構造も同じ。**どちらも構造定理を経由する', 'viewpoint', 'math', ['mordell-weil', 'dirichlet-unit-theorem']),

  // 圏の言葉へ
  c('sheaf', '層', '開集合ごとに環を割り当て、貼り合わせを要求する。**局所的な情報から大域を組む**', 'definition', 'math', ['zariski-topology', 'coordinate-ring']),
  c('scheme', 'スキーム', '**素イデアルの全体を空間とする。**点でない点（生成点）を許すと、多様体で書けなかったものが書ける', 'definition', 'math', ['sheaf', 'prime-ideals-are-subvarieties']),
  c('schemes-allow-nilpotents', 'スキームは、零冪を捨てない', '**「二重に交わる点」が、環の情報として残る。**多様体では潰れていた区別が保たれる', 'viewpoint', 'math', ['scheme']),
  c('sheaf-cohomology', '層係数コホモロジー', '**貼り合わせの失敗を測る。**局所的に解けるのに大域では解けない、その差が群になる', 'definition', 'math', ['sheaf', 'de-rham-cohomology']),
  c('riemann-roch-is-euler-characteristic', 'Riemann–Roch は Euler 標数の式である', '**コホモロジーの交代和として書き直すと、定理の形が説明される**', 'viewpoint', 'math', ['sheaf-cohomology', 'riemann-roch']),
]
