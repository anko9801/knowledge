import type { Concept } from './types.ts'
import { c } from './types.ts'

export const information: readonly Concept[] = [
  // --- 情報理論 --------------------------------------------------------------
  //
  // Shannon の符号化定理は確率論から導かれる。経験則ではない。
  c('entropy', 'Shannon エントロピー', '-Σ p log p。不確かさの量', 'definition', 'cs', ['expectation']),
  c('kl-divergence', 'KL 情報量', '二つの分布の隔たり。非負性は Jensen から', 'definition', 'cs', ['entropy']),
  c('mutual-information', '相互情報量', '片方を知ると他方の不確かさがどれだけ減るか', 'definition', 'cs', ['entropy', 'independence-probabilistic']),
  c('aep', '漸近等分割性', '典型列の個数が $2^(n H)$ に集中する', 'theorem', 'cs', ['entropy', 'law-of-large-numbers']),
  c('source-coding-theorem', '情報源符号化定理', '圧縮の限界はエントロピー', 'theorem', 'cs', ['aep']),
  c('channel-capacity', '通信路容量', '相互情報量の最大値', 'definition', 'cs', ['mutual-information']),
  c('channel-coding-theorem', '通信路符号化定理', '容量以下なら誤り率を任意に小さくできる', 'theorem', 'cs', ['channel-capacity', 'aep']),
]
