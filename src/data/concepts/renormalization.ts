import type { Concept } from './types.ts'
import { c } from './types.ts'

export const renormalization: readonly Concept[] = [
  // --- くりこみ --------------------------------------------------------------
  //
  // 無限大を消す話ではない。定義されていない量に、測った値で定義を与える話である。
  c('regularization', '正則化', '発散する式に助変数を一つ入れて有限にする。答えを出す操作ではなく、発散を一箇所に集めるだけ', 'technique', 'physics', ['operator-valued-distribution', 'feynman-diagram']),
  c('dimensional-regularization', '次元正則化', '4 次元ではなく d 次元で積分し、答えを d の関数として延長する。発散がガンマ関数の極として捕まる', 'technique', 'physics', ['regularization']),
  c('regulator-breaks-something', '正則化は何かを壊す', '全部の対称性を保つ正則化は無い。どの正則化でも保てない対称性が、アノマリーになる', 'viewpoint', 'physics', ['regularization']),
  c('power-counting', '次数を数える', '発散の次数が外線の本数から出る。四次の相互作用では発散する構造が二通りしかなく、何次まで行っても増えない', 'technique', 'physics', ['regularization']),
  c('coupling-dimension', '結合定数の次元', '質量次元の符号で、超くりこみ可能・くりこみ可能・くりこみ不可能が決まる。図を数えなくてよい', 'theorem', 'physics', ['power-counting']),
  c('renormalization-conditions', 'くりこみ条件', 'どこで何を合わせるかの指定。こちらで選ぶもので、測れる量は選び方に依らない', 'definition', 'physics', ['coupling-dimension', 'field-strength-renormalization']),
  c('beta-function', 'ベータ関数', '合わせる場所を動かしたときの結合定数の動き方。中身は「答えが合わせる場所に依らない」だけ', 'definition', 'physics', ['renormalization-conditions']),
  c('running-coupling', '走る結合定数', '電荷が距離とともに変わる。真空が誘電体として振る舞うので、近づくほど大きく見える', 'theorem', 'physics', ['beta-function']),
  c('landau-pole', 'Landau 極', 'ベータ関数が正だと有限のエネルギーで結合が発散する。理論がそこまで通用しない', 'theorem', 'physics', ['running-coupling']),
  c('wilsonian-renormalization', 'くりこみ変換', '細かい自由度を実際に積分して消す。書ける項すべての空間の上の写像になり、消すと項が増える', 'technique', 'physics', ['beta-function', 'regularization']),
  c('irrelevant-operator', '効かない項', '次元が 4 を超える項は、低いエネルギーで (E/Λ) の冪で抑えられる。消えるのではなく見えなくなる', 'theorem', 'physics', ['wilsonian-renormalization', 'coupling-dimension']),
  c('effective-field-theory', '有効場の理論', 'ある尺度までで閉じた理論。くりこみ可能性は原理ではなく、低いエネルギーを見ていることの帰結', 'viewpoint', 'physics', ['irrelevant-operator']),
]
