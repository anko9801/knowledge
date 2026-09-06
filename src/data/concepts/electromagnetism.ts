import type { Concept } from './types.ts'
import { c } from './types.ts'

export const electromagnetism: readonly Concept[] = [
  // --- 電磁気 ---------------------------------------------------------------
  //
  // 式を疑うところから始まる。二つの静的な実験で決まる定数が速さになり、
  // その式に「誰から見た速さか」を書く場所が無い。
  //
  // 幾何の側（$F = d A$、4 本が 2 本になる）はベクトル解析の連載が持つ。
  // こちらは、その形だけからは出ないもの ── 境界条件、遅延、実測できる数値。
  c('electromagnetic-constants', '二つの定数が速さになる', '静電気と電流の実験で決まる定数を組み合わせると速さの次元になる。どちらの実験にも光が入っていない', 'theorem', 'physics', ['gauge-potential']),
  c('wave-from-maxwell', '式が波を出す', '電荷の無い場所で電磁場が波として伝わる。速さが二つの定数だけで決まる', 'theorem', 'physics', ['electromagnetic-constants', 'exterior-derivative']),
  c('no-frame-in-maxwell', '誰から見た速さかが書かれていない', '式に媒質を書く場所がない。定数が静的な実験で決まるので、値が動きに依れない', 'viewpoint', 'physics', ['wave-from-maxwell']),
  c('constraint-vs-evolution', '拘束と発展方程式', '時間微分の無い式は次の瞬間を教えない。初期状態に課される条件である', 'definition', 'physics', ['wave-from-maxwell']),
  c('constraint-preservation', '拘束が保たれる条件', '電荷保存が成り立たないと、次の瞬間に拘束が破れる。ただで出るのではなく、無いと理論が壊れる', 'theorem', 'physics', ['constraint-vs-evolution', 'exterior-derivative']),
  c('two-polarizations', '自由度は二つ', '四成分からゲージの自由と時間成分を引くと二つ。偏光の数を数えることが質量を測ることになる', 'theorem', 'physics', ['constraint-preservation', 'gauge-forbids-mass']),
  c('radiation-field', '加速の場', '距離の一乗で落ちる成分は加速からしか出ない。面積が二乗で増えるので、これだけが無限遠に届く', 'theorem', 'physics', ['constraint-vs-evolution', 'causal-structure']),
  c('larmor-formula', 'Larmor の公式', '出ていく仕事率が加速度の二乗に比例する。速さには依らない。加速器の設計を縛る', 'theorem', 'physics', ['radiation-field']),
  c('field-carries-momentum', '場が運動量を持つ', '力が及ぶまでに時間が掛かるので、その間の運動量を場が持つ。放射圧として測れる', 'theorem', 'physics', ['radiation-field']),
]
