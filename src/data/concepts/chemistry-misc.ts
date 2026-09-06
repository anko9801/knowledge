import type { Concept } from './types.ts'
import { c } from './types.ts'

export const chemistryMisc: readonly Concept[] = [
  // --- 分子対称性と選択則（化学のうち論理で決まる部分） ------------------------------------------
  //
  // 「この反応が起きる」は経験的だが、「この遷移は禁制である」は
  // 群論から導かれる。分野ではなくサブ領域で切る例。
  c('point-group', '点群', '分子を不変にする対称操作の群', 'definition', 'chemistry', ['group-action']),
  c('symmetry-adapted-basis', '対称性に適合した基底', '既約表現ごとに軌道を分類する', 'technique', 'chemistry', ['point-group', 'irreducible-representation']),
  c('molecular-orbital', '分子軌道', '原子軌道の線形結合。対称性が混ざり方を決める', 'definition', 'chemistry', ['symmetry-adapted-basis', 'observable']),
  c('selection-rule', '選択則', '遷移積分が対称性から恒等的に 0 になる条件', 'theorem', 'chemistry', ['symmetry-adapted-basis', 'orthogonality-relations']),
  c('normal-modes', '基準振動', '振動を既約表現で分類する。赤外・Raman 活性', 'technique', 'chemistry', ['point-group', 'spectral-theorem']),
]
