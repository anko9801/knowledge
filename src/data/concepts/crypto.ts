import type { Concept } from './types.ts'
import { c } from './types.ts'

export const crypto: readonly Concept[] = [
  // --- 暗号理論 --------------------------------------------------------------
  //
  // 安全性が「帰着」で定義される。依存が定理の主張に明示的に書かれている。
  c('one-way-function', '一方向性関数', '計算は易しく反転は難しい', 'definition', 'cs', ['complexity-class']),
  c('hardness-assumption', '計算量的仮定', 'DDH、RSA、格子問題。安全性の土台', 'definition', 'cs', ['one-way-function']),
  c('security-reduction', '安全性の帰着', '「仮定が破れないなら安全」の形で証明する', 'viewpoint', 'cs', ['hardness-assumption', 'polynomial-reduction']),
  c('semantic-security', '意味的安全性', '暗号文から平文の情報が漏れない', 'definition', 'cs', ['security-reduction', 'randomized-complexity']),
  c('public-key-encryption', '公開鍵暗号', '鍵を配らずに暗号化する。**片方向だと仮定する演算が要る**ので、前提は安全性の定義だけでは足りない', 'definition', 'cs', ['semantic-security', 'discrete-log-assumption']),
  c('zero-knowledge', 'ゼロ知識証明', '正しさだけを伝え、他は何も伝えない', 'definition', 'cs', ['security-reduction', 'np-completeness']),
]
