import type { Concept } from './types.ts'
import { c } from './types.ts'

export const standardModel: readonly Concept[] = [
  // --- 標準模型 --------------------------------------------------------------
  //
  // どこまでが導けて、どこからが測った値なのかを分ける。閉じ込めはまだ出ていない。
  c('chiral-gauge-theory', 'カイラルゲージ理論', '左巻きと右巻きが違う変換を受ける。質量項が左右を繋ぐ項なので、物質の質量も禁じられる', 'definition', 'physics', ['gauge-forbids-mass', 'spin-statistics-theorem']),
  c('yukawa-coupling', '湯川結合', 'Higgs 場を挟むとフェルミオンの質量項が不変になる。仕組みは出るが値は出ない', 'definition', 'physics', ['chiral-gauge-theory', 'higgs-mechanism']),
  c('rho-parameter', '入れ物が比を決める', 'Higgs が二つ組なら質量比が 1 になる。値ではなく、どの表現に入っているかを試す予言', 'theorem', 'physics', ['yukawa-coupling']),
  c('asymptotic-freedom', '漸近的自由性', 'グルーオンの常磁性がクォークの寄与に勝つ。エネルギーを上げると結合が弱くなる', 'theorem', 'physics', ['gauge-self-interaction', 'running-coupling']),
  c('scaling-in-deep-inelastic', '中を覗くと自由に見える', '陽子に高エネルギーを当てると点に当たったように跳ね返る。強く結びついているのに近くでは自由', 'theorem', 'physics', ['asymptotic-freedom']),
  c('confinement-not-derived', '閉じ込めは証明されていない', '結合が大きいことと単独で取り出せないことは別の主張。格子では確かめられているが証明ではない', 'viewpoint', 'physics', ['asymptotic-freedom', 'gribov-ambiguity']),
  c('wilson-loop-area-law', '面積則', 'Wilson ループが面積に比例して落ちると、引き離すのに線形のエネルギーが要る', 'theorem', 'physics', ['confinement-not-derived', 'non-abelian-gauge']),
  c('string-breaking', '紐が切れる', '本物のクォークがいると、紐に溜まったエネルギーで対ができて切れる。面積則が使えなくなる', 'theorem', 'physics', ['wilson-loop-area-law']),
  c('kugo-ojima-criterion', '九後--小嶋の判定条件', '色を持つ状態を四つ組に入れる条件。負ノルムを閉じ込めたのと同じ仕組みを色に使う', 'theorem', 'physics', ['quartet-mechanism', 'string-breaking']),
  c('chiral-anomaly', 'カイラルアノマリー', '大域的な対称性が量子で破れる。破れているおかげで中性パイ中間子の崩壊率が合う', 'theorem', 'physics', ['regulator-breaks-something', 'chiral-gauge-theory']),
  c('gauge-anomaly-cancellation', 'ゲージアノマリーの相殺', '各点で選べる対称性が破れると確率が負になる。全部足してゼロになる粒子の並べ方しか許されない', 'theorem', 'physics', ['chiral-anomaly', 'quartet-mechanism']),
  c('charge-quantization-from-anomaly', '電荷の量子化', '重力を混ぜたアノマリーまで入れると、一世代の電荷の和がゼロという条件が出る。色の数は奇数までしか決まらない', 'theorem', 'physics', ['gauge-anomaly-cancellation']),
]
