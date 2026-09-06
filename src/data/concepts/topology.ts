import type { Concept } from './types.ts'
import { c } from './types.ts'

export const topology: readonly Concept[] = [
  // --- 位相 --------------------------------------------------------------
  //
  // 教科書の水準から見ると薄い。微分形式と Riemann 幾何が前提として
  // 要求している分と、点をどこまで区別できるかの分類だけが在る。
  c('topology-basics', '位相の基礎', '開集合、連続、コンパクト、連結', 'definition', 'math'),
  c('homotopy', 'ホモトピー', '連続変形で移り合うこと。可縮性', 'definition', 'math', ['topology-basics', 'connectedness']),
  c('separation-axioms', '分離公理', 'Hausdorff、正則、正規。点をどこまで区別できるか', 'definition', 'math', ['topology-basics']),
  c('second-countable', '第二可算', '可算な基底を持つ。多様体の定義に入る', 'definition', 'math', ['topology-basics']),
  c('connectedness', '連結性', '二つの開集合に分けられない。弧状連結との差', 'definition', 'math', ['topology-basics']),
]
