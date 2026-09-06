import type { Concept } from './types.ts'
import { c } from './types.ts'

export const newtonianMechanics: readonly Concept[] = [
  // --- 力学 ----------------------------------------------------------------
  //
  // 物理の入口。運動方程式は書けても、たいてい解けない。解けるものは、
  // 対称性が一つ見つかるたびに次元が一つ落ちて、落ちきったものである。
  //
  // 解析力学の前に置く。あちらは `why-not-force`「力では理論を指定できない」
  // から始まるので、力を使ったことのない読者には否定する対象が無い。
  c('degrees-of-freedom', '自由度', '位置を決めるのに要る数の個数。解く手間はここで決まる', 'definition', 'physics', ['multivariable-calculus']),
  c('conserved-quantity-reduces', '保存量が次元を落とす', '保存する量が一つ見つかるたびに、解くべき問題が一つ小さくなる', 'viewpoint', 'physics', ['degrees-of-freedom']),
  c('central-force-planar', '中心力は平面に落ちる', '角運動量が保存するので軌道が平面に乗り、動径だけの一次元問題になる', 'theorem', 'physics', ['conserved-quantity-reduces']),
  c('inertia-tensor', '慣性テンソル', '剛体の回りにくさ。対称行列なので主軸が取れる', 'definition', 'physics', ['degrees-of-freedom', 'quadratic-form']),
  c('coupled-oscillation', '連成振動は固有値問題', '基準振動に分ければ、独立な単振動の重ね合わせになる', 'technique', 'physics', ['spectral-theorem', 'degrees-of-freedom']),
  c('three-body-unsolvable', '落ちきらない例', '三体問題は保存量が足りない。解けないことのほうが普通である', 'viewpoint', 'physics', ['central-force-planar']),
  c('harmonic-universality', '極小のまわりは二次になる', '谷の底で最初に残る項が必ず二次。Hooke の法則は材料の性質ではなく Taylor 展開である', 'theorem', 'physics', ['degrees-of-freedom']),
  c('amplitude-independence', '周期が振れ幅に依らない', '式が線形なので解を定数倍しても同じ時刻に戻る。指数が 2 のときだけ起きる', 'theorem', 'physics', ['harmonic-universality']),
]
