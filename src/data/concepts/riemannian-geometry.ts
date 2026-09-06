import type { Concept } from './types.ts'
import { c } from './types.ts'

export const riemannianGeometry: readonly Concept[] = [
  // --- Riemann 幾何 --------------------------------------------------------
  c('riemannian-metric', 'Riemann 計量', '各点の内積。付加構造であり、常に存在する', 'definition', 'math', ['manifold', 'inner-product']),
  c('arc-length', '弧長', '曲線の長さ。計量から決まる', 'definition', 'math', ['riemannian-metric']),
  c('volume-element', '体積要素', '√g。曲線座標の公式の出どころ', 'definition', 'math', ['riemannian-metric', 'volume-form']),
  c('isometry', '等長写像', '計量を保つ写像', 'definition', 'math', ['riemannian-metric', 'pullback']),
  c('killing-vector', 'Killing ベクトル', '計量の対称性。数えると空間が分類できる', 'definition', 'math', ['isometry', 'lie-derivative']),
  c('tensor-field', 'テンソル場', '各点にテンソルを置く', 'definition', 'math', ['tensor-type', 'manifold']),
  c('partial-is-not-a-tensor', '偏微分はテンソルにならない', '座標変換で余分な項が残る', 'theorem', 'math', ['tensor-field', 'tensor-transformation-law']),
  c('connection', '接続', '離れた点のベクトルを比べる方法。外から決める', 'definition', 'math', ['partial-is-not-a-tensor']),
  c('parallel-transport', '平行移動', '曲線に沿って運ぶ。経路に依る', 'definition', 'math', ['connection', 'ode-existence']),
  c('covariant-derivative', '共変微分', '∂ + Γ。テンソルでない二つを足してテンソルにする', 'technique', 'math', ['connection']),
  c('christoffel-symbol', 'Christoffel 記号', '接続の成分。テンソルではないので座標で消せる', 'definition', 'math', ['covariant-derivative']),
  c('levi-civita-connection', 'Levi-Civita 接続', '計量的かつ捩れなし。これで一意に決まる', 'theorem', 'math', ['connection', 'riemannian-metric']),
  c('normal-coordinates', '正規座標', '一点で Γ = 0 にできる', 'theorem', 'math', ['levi-civita-connection']),
  c('geodesic', '測地線', 'まっすぐと最短が一致する', 'definition', 'math', ['levi-civita-connection', 'arc-length', 'ode-existence']),
  c('exponential-map', '指数写像', '測地線で座標を張る', 'definition', 'math', ['geodesic', 'normal-coordinates']),
  c('geodesic-deviation', '測地線偏差', '近い測地線が離れる率。座標では消せない', 'theorem', 'math', ['geodesic', 'parallel-transport']),
  c('riemann-curvature', 'Riemann 曲率', '平行移動の経路依存性。テンソルになる', 'definition', 'math', ['parallel-transport', 'geodesic-deviation']),
  c('sectional-curvature', '断面曲率', '2 次元の断面で測る。Gauss 曲率の一般化', 'definition', 'math', ['riemann-curvature']),
  c('space-forms', '定曲率空間の分類', '$S^n$、$RR^n$、$H^n$ の三つしかない', 'theorem', 'math', ['sectional-curvature']),
  c('ricci-tensor', 'Ricci テンソル', '曲率の縮約。測地球の体積の変化率', 'definition', 'math', ['riemann-curvature', 'contraction']),
  c('scalar-curvature', 'スカラー曲率', 'Ricci をもう一度縮約した数', 'definition', 'math', ['ricci-tensor']),
  c('weyl-tensor', 'Weyl テンソル', '残りの成分。n ≤ 3 では消える', 'definition', 'math', ['ricci-tensor']),
  c('bianchi-identity', 'Bianchi 恒等式', '$nabla^mu G_(mu nu) = 0$ が出る', 'theorem', 'math', ['riemann-curvature', 'covariant-derivative']),
  c('einstein-tensor', 'Einstein テンソル', '発散が恒等的に消える組み合わせ。係数は選べない', 'definition', 'math', ['bianchi-identity', 'scalar-curvature']),
  c('bonnet-myers', 'Bonnet--Myers の定理', 'Ricci の下界が直径を抑える。局所が大域を縛る', 'theorem', 'math', ['ricci-tensor', 'geodesic']),
  c('cartan-hadamard', 'Cartan--Hadamard の定理', '$K <= 0$ なら普遍被覆は $RR^n$', 'theorem', 'math', ['sectional-curvature', 'homotopy']),
  c('divergence-theorem-riemannian', '発散定理（Riemann 版）', '√g 込みの部分積分', 'theorem', 'math', ['volume-element', 'stokes-theorem']),
  c('gauss-bonnet', 'Gauss--Bonnet の定理', '曲率の総和が位相不変量になる', 'theorem', 'math', ['sectional-curvature', 'integration-of-forms', 'euler-characteristic']),
]
