import type { Concept } from './types.ts'
import { c } from './types.ts'

export const measure: readonly Concept[] = [
  // --- 測度と確率 -------------------------------------------------------------
  //
  // 依存が定義的に決まる。確率変数の定義に可測性が現れ、
  // 大数の法則の証明が測度の収束定理を引用する。
  c('sigma-algebra', 'σ 加法族', '測れる集合の族。可算合併で閉じる', 'definition', 'math', ['zfc-axioms']),
  c('measure', '測度', 'σ 加法族の上の可算加法的な非負関数', 'definition', 'math', ['sigma-algebra']),
  c('lebesgue-integral', 'Lebesgue 積分', '単関数で近似して積分を定義する', 'definition', 'math', ['measure']),
  c('convergence-theorems', '収束定理', '単調収束・優収束。極限と積分を交換する', 'theorem', 'math', ['lebesgue-integral']),
  c('probability-space', '確率空間', '全測度が 1 の測度空間', 'definition', 'math', ['measure']),
  c('random-variable', '確率変数', '可測関数。値ではなく写像である', 'definition', 'math', ['probability-space']),
  c('expectation', '期待値', '確率測度による積分', 'definition', 'math', ['random-variable', 'lebesgue-integral']),
  c('independence-probabilistic', '独立性', '同時分布が積に分かれる', 'definition', 'math', ['random-variable']),
  c('law-of-large-numbers', '大数の法則', '標本平均が期待値に収束する', 'theorem', 'math', ['expectation', 'independence-probabilistic', 'convergence-theorems', 'concentration-inequality']),
  c('characteristic-function', '特性関数', 'Fourier 変換。分布を一意に決める', 'definition', 'math', ['expectation']),
  c('central-limit-theorem', '中心極限定理', '和の分布が正規分布に近づく', 'theorem', 'math', ['characteristic-function', 'law-of-large-numbers']),
  c('conditional-expectation', '条件付き期待値', '部分 σ 加法族への射影', 'definition', 'math', ['expectation', 'sigma-algebra']),
  c('martingale', 'マルチンゲール', '条件付き期待値が現在値に等しい過程', 'definition', 'math', ['conditional-expectation']),
  c('markov-chain', 'Markov 連鎖', '次の状態が現在だけで決まる。過去をどれだけ覚えても予測が良くならない', 'definition', 'math', ['conditional-expectation', 'random-variable']),
  c('likelihood-ratio-test', 'Neyman–Pearson の補題', '大きさを決めた検定のうち、尤度比で切るものが最強力。しかも一意である', 'theorem', 'math', ['random-variable', 'probability-space']),
  c('fisher-information', 'Fisher 情報量', 'スコアの分散。KL 情報量を二階微分すると出るので、母数づけを変えると値が変わる', 'definition', 'math', ['moments', 'kl-divergence']),
  c('distribution', '分布', '確率変数が誘導する測度。正規、Poisson、指数', 'definition', 'math', ['random-variable']),
  c('moments', 'モーメント', '平均、分散、高次の積率。分布を特徴づける', 'definition', 'math', ['expectation', 'distribution']),
  c('concentration-inequality', '集中不等式', 'Markov、Chebyshev、Hoeffding。ずれの確率を抑える', 'theorem', 'math', ['moments']),
  c('lp-space', '$L^p$ 空間', '可測関数の空間。完備になる（Riesz–Fischer）', 'definition', 'math', ['function-space', 'lebesgue-integral']),
]
