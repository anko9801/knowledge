import type { Concept } from './types.ts'
import { c } from './types.ts'

export const differentialForms: readonly Concept[] = [
  // --- 微分形式 --------------------------------------------------------------
  c('tangent-space', '接空間', '曲線の速度、あるいは微分作用素。外の空間が要らない', 'definition', 'math', ['multivariable-calculus', 'vector-space', 'smoothness-class']),
  c('vector-field', 'ベクトル場', '各点に接ベクトルを滑らかに置く', 'definition', 'math', ['tangent-space']),
  c('lie-bracket', 'Lie 括弧', '[X,Y] = XY - YX。流れが可換か', 'definition', 'math', ['vector-field']),
  c('cotangent-space', '余接空間', '接空間の双対。1 形式が住む', 'definition', 'math', ['tangent-space', 'dual-space']),
  c('one-form', '1 形式', '曲線の上で積分できるもの。計量が要らない', 'definition', 'math', ['cotangent-space']),
  c('pullback', '引き戻し', '1 形式はどんな写像でも後ろへ運べる', 'definition', 'math', ['one-form']),
  c('pushforward', '押し出し', '接ベクトルは前へ運べる。ベクトル場は運べない', 'definition', 'math', ['tangent-space']),
  c('k-form', 'k 形式', '各点の交代形式を滑らかに並べたもの', 'definition', 'math', ['one-form', 'alternating-form']),
  c('exterior-derivative', '外微分', '四条件で一意に決まる。計量を使わない', 'definition', 'math', ['k-form', 'wedge-product']),
  c('dd-zero', 'd∘d = 0', '偏微分の順序交換。二つの恒等式の正体', 'theorem', 'math', ['exterior-derivative']),
  c('naturality-of-d', 'd の自然性', '$F^* dif = dif F^*$。座標に依らないことの強い形', 'theorem', 'math', ['exterior-derivative', 'pullback']),
  c('interior-product', '内部積', '次数を下げる操作 $iota_X$', 'definition', 'math', ['k-form', 'vector-field']),
  c('lie-derivative', 'Lie 微分', '流れに沿った変化。Cartan の公式', 'definition', 'math', ['interior-product', 'exterior-derivative', 'lie-bracket']),
  c('closed-vs-exact', '閉形式と完全形式', '完全なら閉。逆は領域の形に依る', 'definition', 'math', ['dd-zero']),
  c('form-basis', '形式の基底', '$dif x^(i_1) and dots.c$ が $Lambda^k$ を張る', 'theorem', 'math', ['k-form', 'binomial-dimension']),
  c('manifold', '多様体', '地図の貼り合わせ。1 枚では足りない', 'definition', 'math', ['topology-basics', 'tangent-space', 'smoothness-class', 'separation-axioms', 'second-countable']),
  c('atlas', 'アトラス', 'チャートの族と、滑らかな遷移関数', 'definition', 'math', ['manifold']),
  c('orientability', '向き付け可能性', '体積形式が大域的に取れるか。メビウスの帯', 'definition', 'math', ['manifold', 'orientation']),
  c('partition-of-unity', '1 の分割', '局所でできることを大域へ持ち上げる', 'technique', 'math', ['manifold', 'bump-function']),
  // R^n の領域での版と、多様体での版を分ける。同じ名前に二つの一般性を同居させると、
  // ベクトル解析（R^3 が舞台）の前提が、多様体の道具立てを指してしまう。
  // 多様体版が R^n 版を前提にするのは本物の依存で、チャートで引き戻して R^n で積分し、
  // 1 の分割で足す、という手順そのものである。
  c('integration-of-forms', '形式の積分（多様体上）', 'チャートで引き戻し、1 の分割で足す', 'definition', 'math', ['integration-in-rn', 'orientability', 'partition-of-unity']),
  c('boundary', '境界と誘導される向き（多様体）', '境界付き多様体。∂ ∂ = ∅', 'definition', 'math', ['boundary-in-rn', 'manifold', 'orientability']),
  c('stokes-theorem', '一般化された Stokes の定理', '$integral_Omega dif omega = integral_(partial Omega) omega$。多様体の上で', 'theorem', 'math', ['stokes-in-rn', 'integration-of-forms', 'boundary']),
  c('poincare-lemma', 'Poincaré の補題', '可縮なら閉形式は完全。局所では必ず解ける', 'theorem', 'math', ['closed-vs-exact', 'homotopy']),
  c('de-rham-cohomology', 'de Rham コホモロジー', '閉と完全の差。空間の穴を数える', 'definition', 'math', ['closed-vs-exact', 'poincare-lemma', 'stokes-theorem']),
  c('mayer-vietoris', 'Mayer–Vietoris', '貼り合わせでコホモロジーを計算する', 'technique', 'math', ['de-rham-cohomology']),
  c('de-rham-theorem', 'de Rham の定理', '解析の $H^*_"dR"$ と位相の $H^*$ が一致する', 'theorem', 'math', ['de-rham-cohomology', 'singular-homology']),
  c('singular-homology', '特異ホモロジー', '三角形を貼って穴を数える。位相の側', 'definition', 'math', ['topology-basics', 'homotopy']),
  c('betti-numbers', 'Betti 数', '$b_k = dim H^k$。穴の個数', 'definition', 'math', ['de-rham-cohomology']),
  c('hodge-theory', 'Hodge 理論', '各コホモロジー類に最も滑らかな代表元が一つ', 'theorem', 'math', ['de-rham-cohomology', 'hodge-star', 'riemannian-metric', 'laplacian']),
  c('wedge-product', '楔積', '交代性を保つ積。α ∧ α = 0', 'definition', 'math', ['alternating-form']),
  c('jacobian-from-wedge', 'ヤコビアン', '変数変換の行列式は楔積の反対称性から出る', 'theorem', 'math', ['wedge-product', 'determinant']),
]
