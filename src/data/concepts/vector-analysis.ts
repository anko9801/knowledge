import type { Concept } from './types.ts'
import { c } from './types.ts'

export const vectorAnalysis: readonly Concept[] = [
  // --- ベクトル解析（R^3 の入口） ---------------------------------------------------
  c('grad-div-curl', 'grad・div・rot', '3 次元の三つの演算子', 'definition', 'math', ['multivariable-calculus']),
  c('cross-product', '外積', '⋆(a ∧ b)。3 次元でしか定義できない', 'definition', 'math', ['grad-div-curl', 'hodge-star']),
  c('pseudovector', '擬ベクトル', '2 形式をベクトルと呼んだもの。鏡で符号が違う', 'viewpoint', 'math', ['cross-product', 'orientation']),
  c('integral-theorems-r3', '三つの積分定理', '勾配定理・Stokes・発散定理', 'theorem', 'math', ['grad-div-curl']),
  c('index-notation', '添字記法', '$epsilon_(i j k)$ と縮約で機械的に計算する', 'technique', 'math', ['grad-div-curl', 'volume-form']),
  c('levi-civita-symbol', 'Levi-Civita 記号', '$epsilon_(i j k)$。正体は体積形式の成分', 'definition', 'math', ['index-notation', 'volume-form']),
  c('epsilon-delta-identity', 'ε-δ 恒等式', '⋆⋆ = 1 の成分表示', 'theorem', 'math', ['levi-civita-symbol', 'hodge-star']),
  c('curvilinear-coordinates', '曲線座標', '極座標や球座標での公式。√g から出る', 'technique', 'math', ['hodge-star', 'exterior-derivative']),
  c('laplacian', 'Laplacian', '⋆ d ⋆ d。計量が要る', 'definition', 'math', ['hodge-star', 'exterior-derivative']),
  c('line-integral', '線積分', 'パラメータの取り方に依らない', 'theorem', 'math', ['one-form']),
  c('integration-in-rn', '$RR^n$ の領域上の積分', '領域を立方体に分けて足す。多様体も 1 の分割も要らない', 'definition', 'math', ['k-form', 'orientation', 'jacobian-from-wedge']),
  c('boundary-in-rn', '領域の境界と誘導される向き', '外向きを先頭に置く。∂ ∂ = ∅', 'definition', 'math', ['orientation']),
  c('stokes-in-rn', 'Stokes の定理（領域版）', '$integral_Omega dif omega = integral_(partial Omega) omega$。立方体で示して貼り合わせる', 'theorem', 'math', ['integration-in-rn', 'exterior-derivative', 'boundary-in-rn']),
  c('frobenius-integrability', 'Frobenius の可積分性', 'ω ∧ dω = 0 なら積分因子が取れる', 'theorem', 'math', ['exterior-derivative', 'wedge-product']),
  c('symplectic-form', 'シンプレクティック形式', '閉じた非退化 2 形式。計量ではない構造', 'definition', 'math', ['k-form', 'closed-vs-exact']),
]
