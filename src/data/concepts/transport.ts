import type { Concept } from './types.ts'
import { c } from './types.ts'

export const transport: readonly Concept[] = [
  // --- 移動現象論 --------------------------------------------------------------
  //
  // **相似そのものに絞る。** Navier–Stokes・Reynolds 数・境界層の家は流体で、
  // 二度導かない。ここが持つのは「三つが同じ方程式になる」ことと、
  // **それが壊れる場所**（等熱流束壁）。
  c('gradient-flux-laws', '勾配に比例する三つの流束', 'Newton・Fourier・Fick が同じ形。流束が拡散率と勾配の積になる', 'definition', 'engineering', ['grad-div-curl']),
  c('transport-equation-common-form', '三つが同じ方程式になる', '保存則と勾配則を置くと、運動量・熱・物質が同じ移流拡散方程式に従う。**違いは拡散率だけ**', 'theorem', 'engineering', ['gradient-flux-laws', 'divergence-theorem-riemannian', 'laplacian']),
  c('buckingham-pi', 'Buckingham の $Pi$ 定理', '独立な無次元量の個数が、次元行列の階数で決まる。**階数・退化次数定理そのもの**', 'theorem', 'engineering', ['rank-nullity']),
  c('pi-says-nothing-about-f', '$Pi$ 定理は関数を決めない', '個数しか出ない。**全部が最初から無次元なら、何も減らない**', 'theorem', 'engineering', ['buckingham-pi']),
  c('three-diffusivity-ratios', '拡散率の比は二つしかない', '三つの比のうち一つは他の二つから出る。**独立なのは 2 つ**', 'theorem', 'engineering', ['transport-equation-common-form', 'buckingham-pi']),
  c('boundary-layer-thickness-ratio', '境界層の厚さの比', '比が拡散率の比だけの関数で、位置に依らない。方程式が入れ替えを除いて同一だから', 'theorem', 'engineering', ['three-diffusivity-ratios']),
  c('reynolds-colburn-analogy', 'Reynolds–Colburn の相似', '**摩擦を測れば熱伝達が計算できる**', 'theorem', 'engineering', ['boundary-layer-thickness-ratio']),
  c('analogy-breaks-at-flux-wall', '相似が壊れる場所', '等温壁では成り立つが、等熱流束壁では係数が変わり一致しない', 'viewpoint', 'engineering', ['reynolds-colburn-analogy']),
  c('similarity-transfers-experiments', '相似則が模型試験を成り立たせる', '無次元数が同じなら答えが同じ。大きさが違う二つが同じ点に乗る', 'theorem', 'engineering', ['buckingham-pi', 'three-diffusivity-ratios']),
  c('eddy-diffusivity-is-fitted', '渦拡散は導けない', '格子より小さい運動を人工粘性で置く。**値は当てはめで、導出は無い**', 'viewpoint', 'engineering', ['transport-equation-common-form']),
]
