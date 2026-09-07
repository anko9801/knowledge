import type { Concept } from './types.ts'
import { c } from './types.ts'

export const statistics: readonly Concept[] = [
  // --- 統計と因果推論 ------------------------------------------------------------
  //
  // **データから何が言えるかは、何を仮定したかで決まる。**
  // 同じ数字が、無作為化を仮定すれば因果を言い、しなければ相関しか言わない。
  // **「観察から因果は出ない」が定理として書ける**のが、この分野の値打ちである。
  //
  // 同定は疫学、推定は統計 ── この線は Hernán--Robins 自身が引いている
  // （§10.1 の節題が "Identification versus estimation"、Part I が
  // "causal inference without models"、Part II が "with models"）。
  //
  // 学習理論を一度外した理由（「中核が数学で閉じる」）は、cs か math かの話だった。
  // **統計として置けば理由が消える。**
  c('sufficient-statistic', '十分統計量', '分解できれば、それだけ残しても母数について何も失わない', 'definition', 'math', ['probability-space', 'conditional-expectation']),
  c('exponential-family', '指数型分布族', '有限次元の十分統計量を持つ。対数分配関数の勾配が平均になる', 'definition', 'math', ['sufficient-statistic', 'convex-conjugate']),
  c('log-partition-convex', '対数分配関数は凸', '二階微分が共分散なので必ず非負。**Fisher 情報量と揺らぎと率関数の曲率が、同じ量の三つの名前になる**', 'theorem', 'math', ['exponential-family', 'moments']),
  c('natural-mean-duality', '自然母数と平均母数', '二つは Legendre 対。最尤推定がモーメント合わせになるのはそのため', 'theorem', 'math', ['log-partition-convex', 'convex-conjugate']),
  c('kl-hessian-is-fisher', 'KL の二階微分が Fisher 情報量', '一階が消えるので二階が主項になる。**情報幾何の出発点**', 'theorem', 'math', ['fisher-information', 'kl-divergence']),
  c('cramer-rao', 'Cramér–Rao の下界', '不偏推定量の分散に越えられない線がある。等号は指数型のときだけ', 'theorem', 'math', ['fisher-information', 'lp-space']),
  c('rao-blackwell', 'Rao–Blackwell の定理', '十分統計量で条件付けると分散が下がる。改善が機械的に効く', 'theorem', 'math', ['sufficient-statistic', 'conditional-expectation']),
  c('test-confidence-duality', '検定と信頼区間は双対', '有意でない値の集まりが信頼区間。同じ一つのことを二通りに言っている', 'theorem', 'math', ['likelihood-ratio-test']),
  c('p-value-says-little', 'p 値が言っていないこと', '仮説が正しい確率でも、効果の大きさでもない。**データが仮説の下でどれだけ極端かだけ**', 'viewpoint', 'math', ['likelihood-ratio-test']),
  c('de-finetti-representation', 'de Finetti の表現定理', '交換可能な信念は独立同分布の混合として書ける。**客観確率を仮定せずに、あるかのように振る舞える**', 'theorem', 'math', ['independence-probabilistic', 'conditional-expectation']),
  c('stein-paradox', 'Stein のパラドックス', '3 次元以上では標本平均が非許容になる。互いに無関係な母数でも、まとめると改善できる', 'theorem', 'math', ['cramer-rao', 'expectation']),

  // 因果推論 ── 同定
  c('potential-outcome', '潜在結果', '各個体に両方の結果があり、片方しか観測されない。**個体因果効果は原理的に観測できない**', 'definition', 'math', ['random-variable']),
  c('association-vs-causation', '関連と因果', '同じ記号で書けない。条件付き確率と、介入したときの確率は別物である', 'viewpoint', 'math', ['potential-outcome', 'conditional-expectation']),
  c('exchangeability', '交換可能性', '潜在結果が処置と独立。**データからは検証できない側の仮定**', 'definition', 'math', ['potential-outcome', 'independence-probabilistic']),
  c('randomization-gives-exchangeability', '無作為化が保証するもの', '無作為割付は交換可能性を設計から導く。仮定ではなく定理になる', 'theorem', 'math', ['exchangeability']),
  c('positivity', '正値性', 'すべての層で処置を受ける確率が正。**三条件のうち唯一、経験的に検証できる**', 'definition', 'math', ['exchangeability']),
  c('counterfactual-consistency', '一貫性', '反事実を定義する段と、観測データに繋ぐ段の二段ある', 'definition', 'math', ['potential-outcome']),
  c('identifiability', '識別可能性', '三条件が揃えば因果効果が観測分布の関数になる。**モデルを一切置かない**', 'theorem', 'math', ['exchangeability', 'positivity', 'counterfactual-consistency']),
  c('g-formula', 'g 公式（標準化）', '層ごとの効果を層の分布で重み付けて足す', 'technique', 'math', ['identifiability']),
  c('ip-weighting', '逆確率重み付け', '処置確率の逆数で重み付けると仮想母集団ができる', 'technique', 'math', ['identifiability']),
  c('ipw-standardization-equality', 'IP 重み付けと標準化の一致', '**正値性だけで恒等的に等しい。**証明は反事実に一切言及しない ── どの仮定がどの等号を支えているかが一対一に対応する', 'theorem', 'math', ['g-formula', 'ip-weighting']),
  c('causal-dag', '因果ダイアグラム', '矢印は「介入したら変わる」の意味。非巡回有向グラフ', 'definition', 'math', ['graph', 'independence-probabilistic']),
  c('d-separation', 'd 分離', '経路が塞がる規則。**合流点だけ向きが逆に効く**', 'theorem', 'math', ['causal-dag']),
  c('faithfulness', '忠実性', 'd 分離から独立は無条件。逆向きにだけ追加の仮定が要る', 'definition', 'math', ['d-separation']),
  c('backdoor-criterion', 'バックドア基準', 'バックドア経路を全部塞ぎ子孫を含まないなら、条件付き交換可能性が**定理になる**', 'theorem', 'math', ['d-separation', 'exchangeability']),
  c('collider-selection-bias', '合流点で条件付けるバイアス', '選択バイアスと交絡は「開いた経路」の別種。同じ図で書ける', 'theorem', 'math', ['d-separation']),
  c('simpsons-paradox', 'Simpson の逆理', '層別で向きが反転する。共通原因か共通結果かで、正しい処置が逆になる', 'theorem', 'math', ['collider-selection-bias', 'backdoor-criterion']),
  c('hazard-ratio-selection-bias', 'ハザード比の内在的選択バイアス', '生存で条件付けるのは合流点で条件付けること。**害が無くてもハザードは交差する**', 'theorem', 'math', ['collider-selection-bias', 'martingale']),
  c('treatment-confounder-feedback', '治療–交絡因子フィードバック', '過去の処置に影響された交絡因子で層別すると、必ず別のバイアスが立つ。**「やり方が下手」ではなく「直せない」**', 'theorem', 'math', ['collider-selection-bias', 'g-formula']),
  c('sequential-exchangeability', '逐次交換可能性', '各時点で条件付き交換可能なら、時変処置の g 公式が識別を与える', 'theorem', 'math', ['treatment-confounder-feedback', 'sigma-algebra']),
  c('g-null-paradox', 'g-null パラドックス', '帰無仮説が真でフィードバックがあると、変分独立なパラメトリックモデルを全部同時に正しくできない。**モデルの置き方の集合そのものが空になる**', 'theorem', 'math', ['treatment-confounder-feedback']),
  c('instrumental-variable', '操作変数', '未測定交絡があっても使える。ただし三条件では点識別しない', 'definition', 'math', ['causal-dag']),
  c('iv-fourth-condition', '操作変数の第四条件', '同質性か単調性を足して初めて推定量が決まる。三条件だけなら区間しか出ない', 'theorem', 'math', ['instrumental-variable', 'identifiability']),
  c('iv-conditions-unfalsifiable', '操作変数の条件は検証できない', '処置で条件付けると合流点になるので、除外制約は原理的に確かめられない', 'theorem', 'math', ['iv-fourth-condition', 'collider-selection-bias']),
  c('propensity-score', '傾向スコア', '一次元で層別しても、共変量で層別したのと同じ調整になる', 'theorem', 'math', ['ip-weighting']),
  c('doubly-robust', '二重頑健性', '処置模型か結果模型の**どちらか片方**が正しければ一致する', 'theorem', 'math', ['propensity-score', 'g-formula']),
  c('identification-vs-estimation', '識別と推定は別の段', '識別は仮定の関数、推定は標本数の関数。**識別できない量は $n arrow.r oo$ でも出ない**', 'viewpoint', 'math', ['identifiability', 'law-of-large-numbers']),
  c('target-trial', '標的試験', '観測研究の曖昧さは「どの無作為化試験を模倣しているか」を書けば消える', 'viewpoint', 'math', ['exchangeability', 'counterfactual-consistency']),

  // 実験計画
  c('randomization-test', '無作為化検定', '割付の仕方だけから厳密な分布が出る。**模型を一つも置かない**', 'technique', 'math', ['randomization-gives-exchangeability']),
  c('blocking-and-replication', '反復と局所管理', '誤差の分散を下げる二つの手。何を比べたいかで、どちらを使うかが決まる', 'definition', 'math', ['randomization-test']),
  c('orthogonal-design', '直交計画', '要因の効果を独立に推定できる配置。列が直交すると分散共分散が対角になる', 'technique', 'math', ['blocking-and-replication', 'inner-product']),

  // 統計的学習理論
  c('empirical-risk-minimization', '経験リスク最小化', '訓練誤差を最小にする仮説を選ぶ。制限が無いと過適合する', 'technique', 'math', ['expectation']),
  c('pac-learnability', 'PAC 学習可能性', '精度と確信を決めると、必要標本数が決まる、という形の定義', 'definition', 'math', ['empirical-risk-minimization', 'concentration-inequality']),
  c('agnostic-pac', 'agnostic PAC', '実現可能性を捨てる。クラス内最良との差を抑える', 'definition', 'math', ['pac-learnability']),
  c('uniform-convergence-suffices', '一様収束は十分', 'クラス上で経験誤差が一様に真誤差へ近づけば、経験リスク最小化が成功する', 'theorem', 'math', ['agnostic-pac', 'uniform-convergence']),
  c('no-free-lunch', 'ノーフリーランチ', '標本が足りなければ、どの算法にも失敗させる分布がある。**万能学習器は存在しない**', 'theorem', 'math', ['uniform-convergence-suffices']),
  c('bias-complexity-tradeoff', '近似誤差と推定誤差', 'クラスを広げると片方が減り片方が増える。同時には減らない', 'theorem', 'math', ['no-free-lunch']),
  c('vc-dimension', 'VC 次元', '完全に分割できる点集合の最大の大きさ', 'definition', 'math', ['no-free-lunch']),
  c('vc-is-not-parameter-count', 'VC 次元は母数の個数ではない', '一母数で無限の VC 次元を持つ族がある', 'theorem', 'math', ['vc-dimension']),
  c('sauer-shelah-perles', 'Sauer–Shelah–Perles', 'VC 次元が有限なら成長関数が多項式に落ちる。**指数から多項式へ**', 'theorem', 'math', ['vc-dimension']),
  c('fundamental-theorem-of-pac', 'PAC 学習の基本定理', '一様収束・agnostic PAC・PAC・VC 有限、が全部同値', 'theorem', 'math', ['sauer-shelah-perles', 'uniform-convergence-suffices']),
  c('sample-complexity-from-vc', '標本複雑度が VC で決まる', '定数倍を除いて上下から挟まる。**必要な標本数が決まる**', 'theorem', 'math', ['fundamental-theorem-of-pac']),
  c('structural-risk-minimization', '構造リスク最小化と MDL', '非一様学習可能性は、可算個の有限 VC クラスの合併であることと同値。Occam の剃刀が定理になる', 'theorem', 'math', ['fundamental-theorem-of-pac', 'kolmogorov-complexity']),
  c('hardness-of-learning', '標本は足りるが時間が足りない', '標本複雑度が有限でも、その仮説を多項式時間で見つけられないことがある', 'theorem', 'math', ['sample-complexity-from-vc', 'np-completeness']),

  // 生存時間
  c('censoring', '打ち切り', '観測が途中で切れる。**打ち切りは時変処置の一種として同じ g 公式で扱える**', 'definition', 'math', ['random-variable', 'sequential-exchangeability']),
  c('kaplan-meier', 'Kaplan–Meier 推定', '条件付き生存確率の積。打ち切りを無情報と仮定して初めて一致する', 'technique', 'math', ['censoring', 'conditional-expectation']),
  c('proportional-hazards', '比例ハザード', 'ハザード比が時間に依らないと置く。部分尤度で基準ハザードを消せる', 'technique', 'math', ['kaplan-meier', 'hazard-ratio-selection-bias']),
]
