import type { Concept } from './types.ts'
import { c } from './types.ts'

export const gaugeTheory: readonly Concept[] = [
  // --- ゲージ場の量子論 ----------------------------------------------------------
  //
  // 対称性を局所にすると相互作用が強制される。代償に、要らない自由度が入る。
  c('non-abelian-gauge', '非可換ゲージ理論', '各点で選べる量が数から行列に変わる。交換子が残るので場の強さに二次の項が付く', 'definition', 'physics', ['gauge-potential', 'lie-group']),
  c('field-strength-covariant', '場の強さは共変にしか変わらない', 'ゲージ変換で値が変わるので、それ自体は測れない。跡を取って初めて作用に書ける', 'theorem', 'physics', ['non-abelian-gauge']),
  c('gauge-self-interaction', 'ゲージ場が自分と相互作用する', '三点結合も四点結合も物質との結合と同じ定数で決まる。比が予言になる', 'theorem', 'physics', ['field-strength-covariant']),
  c('gauge-forbids-mass', 'ゲージ不変性は質量項を禁じる', '光子に質量が無いのは測った結果ではなく要請の帰結。W と Z に質量があることと衝突する', 'theorem', 'physics', ['non-abelian-gauge']),
  c('faddeev-popov', 'ゲージの体積を括り出す', '同じ配位を重複して数えているので割る。残る行列式は非可換だと場に依るので捨てられない', 'technique', 'physics', ['non-abelian-gauge', 'path-integral-correlation']),
  c('ghost-field', 'ゴースト', '行列式を分子に出すために入れる、反交換するスカラー。スピン統計定理を正定値計量の側で免れる', 'definition', 'physics', ['faddeev-popov', 'positive-definite-metric']),
  c('brst-symmetry', 'BRST 変換', 'ゲージを固定したあとに残る対称性。二回やるとゼロになる', 'definition', 'physics', ['ghost-field']),
  c('quartet-mechanism', '四重項機構', '冪零性から状態が一重項と四つ組に分かれ、四つ組の寄与が消える。負ノルムが閉じ込められて確率が正のまま残る', 'theorem', 'physics', ['brst-symmetry']),
  c('gribov-ambiguity', 'Gribov 複製', 'ゲージ条件が軌道と一度きり交わるという仮定が成り立たない。主束に大域切断が無いことと同じ', 'theorem', 'physics', ['faddeev-popov', 'principal-bundle']),
  c('degenerate-vacuum', '一番低い状態が一つに決まらない', '対称変換が互いに移し合う真空が並ぶ。絶対値だけが決まって位相が決まらない', 'definition', 'physics', ['effective-field-theory']),
  c('spontaneous-breaking', '自発的対称性の破れ', '式は対称なまま、選ばれた一つが対称でない。対称性が消えたのではない', 'definition', 'physics', ['degenerate-vacuum']),
  c('goldstone-theorem', 'Goldstone の定理', '破れた向きの数だけ質量ゼロの粒子が出る。対称変換が微分なしの項を禁じるので、次数にも量子補正にも依らない', 'theorem', 'physics', ['spontaneous-breaking', 'noether-theorem']),
  c('effective-potential', '有効ポテンシャル', '場の値を止めて残りを積分したエネルギー密度。形そのものは場の選び方とゲージに依るので測れない', 'definition', 'physics', ['spontaneous-breaking', 'wilsonian-renormalization']),
  c('coleman-weinberg', '量子補正で破れる', '古典的には谷が一つでも、一つ輪の対数が競り勝って谷が割れる。符号を手で入れなくてよい', 'theorem', 'physics', ['effective-potential']),
  c('dimensional-transmutation', '次元変換', '次元を持たない理論から質量が出る。無次元の助変数が有次元の量に置き換わる', 'theorem', 'physics', ['coleman-weinberg', 'running-coupling']),
  c('higgs-mechanism', 'Higgs 機構', 'ゲージ不変性の不足と自発的破れの余りが打ち消し合う。質量項は手で書き足していない', 'theorem', 'physics', ['goldstone-theorem', 'gauge-forbids-mass']),
  c('longitudinal-polarization', '縦波になって残る', '消えた質量ゼロのスカラーが、ゲージ場の三つ目の偏極になる。自由度の数が前後で一致する', 'theorem', 'physics', ['higgs-mechanism']),
  c('gauge-symmetry-not-broken', 'ゲージ対称性は破れない', '各点で選べる対称性は自発的に破れない（Elitzur）。起きているのはゲージの固め方が変わったこと', 'viewpoint', 'physics', ['higgs-mechanism', 'faddeev-popov']),
]
