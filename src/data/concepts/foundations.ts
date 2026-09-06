import type { Concept } from './types.ts'
import { c } from './types.ts'

export const foundations: readonly Concept[] = [
  // --- 土台。まだ記事が無い --------------------------------------------------------
  c('vector-space', 'ベクトル空間', '足せてスカラー倍できる集合。基底と次元', 'definition', 'math', ['field']),
  c('linear-map', '線形写像', '和とスカラー倍を保つ写像', 'definition', 'math', ['vector-space']),
  c('quotient-space', '商空間', '部分空間で割る。同値類をベクトル空間にする', 'definition', 'math', ['vector-space']),
  c('multivariable-calculus', '多変数の微積分', '偏微分、連鎖律、重積分', 'technique', 'math', ['landau-notation']),
  c('topology-basics', '位相の基礎', '開集合、連続、コンパクト、連結', 'definition', 'math'),
  c('homotopy', 'ホモトピー', '連続変形で移り合うこと。可縮性', 'definition', 'math', ['topology-basics', 'connectedness']),
  c('group', '群', '結合的で単位元と逆元を持つ演算', 'definition', 'math'),
  c('symmetric-group', '対称群', '置換の群。符号', 'definition', 'math', ['group']),
  c('ode-existence', '常微分方程式の解の存在と一意性', '初期値を与えれば解が一意に決まる。証明は縮小写像', 'theorem', 'math', ['multivariable-calculus', 'banach-fixed-point']),
]
