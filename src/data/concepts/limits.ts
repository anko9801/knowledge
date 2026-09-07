import type { Limit } from './types.ts'

/**
 * 狭い設定で成り立っていたことが、広い設定では偽になる場所。
 *
 * 型の説明は `types.ts` の `Limit`。要点だけ ── **`derivations.ts` の裏返しではない。**
 * あちらは仮定が定理になる関係で、こちらは定理が偽になる関係である。
 *
 * **ここに載るものは、たいてい教科書が黙って通り過ぎる。** 前の章で証明した定理が
 * 次の章では成り立たない、と書いてある本は少ない。だから読者は自分の理解を疑う。
 * この site はそこを主題にできる。
 *
 * `requires` でも `Derivation` でも書けない ── あちらは「仮定が定理になる」で、
 * こちらは**「定理が偽になる」**。向きも内容も逆である。
 */
export const limits: readonly Limit[] = [
  {
    holds: 'spectral-theorem',
    fails: 'spectral-theorem-unbounded',
    note: '有限次元では、自己随伴なら正規直交固有基底が取れる。無限次元では位置にも運動量にも自由 Hamiltonian にも固有ベクトルが無い。射影値測度がその役を引き受け、有限次元の固有基底はその特別な場合になる',
  },
  {
    holds: 'spectral-theorem',
    fails: 'perron-frobenius',
    note: '自己随伴でなければ固有値が実である保証は無い。ところが非負で既約という別の仮定を置くと、最大固有値だけは実で単純に戻る。対称性が買っていたものを、正値性が買い直している',
  },
  {
    holds: 'curie-weiss',
    fails: 'mean-field-predicts-a-false-transition',
    note: '平均場近似は転移温度も臨界指数も出すが、一次元では在りもしない転移を予言する。転送行列で厳密に解けるので、間違いだと確定している。二次元では連続対称性について同じことが起き、四次元より下では指数を外す。外れる場所が全部次元で決まっている',
  },
  {
    holds: 'ode-existence',
    fails: 'existence-can-fail-at-the-boundary',
    note: '初期値問題では、初期値を与えれば解が必ず一意に存在する。同じ方程式でも条件を両端で与えると、解が存在しないことも、無限に存在することもある。方程式は何も変わっておらず、条件を与える場所だけが変わっている',
  },
]
