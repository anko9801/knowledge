import type { Concept } from './types.ts'
import { c } from './types.ts'

export const mechanics: readonly Concept[] = [
  // --- 解析力学（物理） ----------------------------------------------------------
  c('why-not-force', '力では理論を指定できない', '座標に縛られ、対称性を課す文が書けない', 'viewpoint', 'physics', ['multivariable-calculus']),
  c('action-functional', '作用', '経路に数を割り当てる。局所性から積分の形しか残らない', 'definition', 'physics', ['why-not-force']),
  c('variational-principle', '変分原理', '停留する経路が実現する', 'definition', 'physics', ['action-functional'], [], { aka: ['最小作用の原理', 'Hamilton の原理'] }),
  c('euler-lagrange', 'Euler–Lagrange 方程式', '停留条件を書き下したもの', 'theorem', 'physics', ['variational-principle'], [], { aka: ['Lagrange 方程式'] }),
  c('lagrangian', 'ラグランジアン', '関数 1 本が理論のすべてを決める', 'definition', 'physics', ['euler-lagrange']),
  c('noether-theorem', 'Noether の定理', '対称性があれば保存量がある', 'theorem', 'physics', ['lagrangian', 'lie-group']),
  c('generalized-coordinates', '一般化座標', '拘束を座標の選び方に吸収する', 'definition', 'physics', ['euler-lagrange']),
  c('dalembert-principle', "d'Alembert の原理", '拘束力は仮想変位に仕事をしない。追加の仮定', 'definition', 'physics', ['generalized-coordinates']),
  c('hamiltonian', 'ハミルトニアン', 'Legendre 変換で L から作る、もう一つの書き方', 'definition', 'physics', ['lagrangian']),
  c('canonical-formalism', '正準形式', '相空間の上の流れとして運動を書く', 'viewpoint', 'physics', ['hamiltonian', 'symplectic-form'], [], { aka: ['Hamilton 形式'] }),
  // 正準形式の中身 ── ここが空だった
  //
  // `canonical-formalism` が「相空間の上の流れ」の一行だけで、
  // **Poisson 括弧がグラフ全体に一件も無かった。**
  // KAM も可積分系も、ここが無いと前提を書けない。
  c('poisson-bracket', 'Poisson 括弧', '相空間の二つの関数から、もう一つ作る。**シンプレクティック形式を関数の側から書いたもの**', 'definition', 'physics', ['canonical-formalism', 'symplectic-form']),
  c('everything-is-a-bracket', '運動方程式が、括弧一つで書ける', '**どの量の時間変化も、それと Hamiltonian の括弧に等しい。**位置と運動量を区別しない形になる', 'theorem', 'physics', ['poisson-bracket']),
  c('conserved-means-commuting', '保存量とは、Hamiltonian と括弧が消えるもののことである', '**「見つかった」保存量に、判定条件が付く**', 'theorem', 'physics', ['everything-is-a-bracket', 'conserved-quantity-reduces']),
  c('jacobi-identity-closes-it', 'Jacobi 恒等式が、保存量を閉じさせる', '**二つの保存量の括弧も保存量になる。**新しい保存量が、計算だけで出ることがある', 'theorem', 'physics', ['poisson-bracket', 'lie-bracket']),
  c('canonical-transformation', '正準変換', '括弧の形を変えない座標変換。**位置と運動量を混ぜてよい**', 'definition', 'physics', ['poisson-bracket']),
  c('generating-function', '母関数', '正準変換を関数一つで指定する。四つの型は Legendre 変換で移り合う', 'technique', 'physics', ['canonical-transformation', 'convex-conjugate']),
  c('hamilton-jacobi-equation', 'Hamilton–Jacobi 方程式', '**Hamiltonian を消す変換を探す。**見つかれば、運動が全部定数になる', 'theorem', 'physics', ['generating-function']),
  c('solving-is-separating', '解けるのは、変数が分離するときである', '**分離できる座標が在るかどうかが、解けるかどうかを決める。**座標系の選択が本質的に効く', 'viewpoint', 'physics', ['hamilton-jacobi-equation']),
  c('action-angle-variables', '作用・角変数', '**作用を新しい運動量に取ると、角が一定の速さで進む。**運動が完全に書き下せる', 'definition', 'physics', ['hamilton-jacobi-equation', 'solving-is-separating']),
  c('frequencies-from-actions', '振動数は作用だけの関数になる', '**Hamiltonian を作用で微分すると出る。**共鳴の条件が、整数の関係式として書ける', 'theorem', 'physics', ['action-angle-variables']),
  c('adiabatic-invariant', '断熱不変量', '**助変数をゆっくり変えても、作用は変わらない。**エネルギーは変わるのに', 'theorem', 'physics', ['action-angle-variables']),
  c('gauge-potential', 'ゲージポテンシャル', '$A_mu$。観測量は $F$ だが理論を決めるのは $A$', 'definition', 'physics', ['lagrangian', 'one-form']),
  c('aharonov-bohm', 'Aharonov–Bohm 効果', '力が無いのに位相がずれる。作用の差が測れる', 'theorem', 'physics', ['gauge-potential', 'de-rham-cohomology']),
]
