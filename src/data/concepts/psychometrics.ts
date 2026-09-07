import type { Concept } from './types.ts'
import { c } from './types.ts'

export const psychometrics: readonly Concept[] = [
  // --- 測る --------------------------------------------------------------------
  //
  // **心理学全体は × だった**（経験則が本体）。◎ だったのは二つ ──
  // **信号検出**（一つの正答率が二つの数に分かれる）と
  // **心理測定**（項目と人を同じ尺度に乗せると、何が決まるか）。
  //
  // **この分野の術語を、この site 自身の学習の仕組みに使わないこと。**
  // 「較正」「想起」「認知負荷」は、心理測定の記事の中では読者の言葉だが、
  // 画面や案内に出したら**設計の語彙が漏れている**（`CLAUDE.md`）。
  //
  // `neyman-pearson` は統計に一つだけ。ここが持つのは
  // 「一つの正答率が、二つの数に分かれる条件」のほう。
  c('two-numbers-not-one', '正答率一つでは足りない', '当たりを見つける率と、無いのに在ると言う率。**片方だけでは、感度と基準が混ざる**', 'viewpoint', 'cs', ['likelihood-ratio-test']),
  c('equal-variance-gaussian', '等分散正規の仮定', '二つの分布が同じ広がりだと置く。**この仮定が、感度を一つの数にしている**', 'definition', 'cs', ['two-numbers-not-one', 'distribution']),
  c('sensitivity-index', '感度の指標', '二つの分布の隔たりを、標準偏差で測ったもの。**基準を動かしても変わらない**', 'theorem', 'cs', ['equal-variance-gaussian']),
  c('criterion-is-separable', '基準は感度と分離できる', '**同じ人が、報酬の付け方だけで別の正答率を出す。**能力が変わったのではない', 'theorem', 'cs', ['sensitivity-index']),
  c('roc-slope-is-likelihood-ratio', 'ROC の傾きが尤度比である', '**最適な基準が尤度比で切ることと同じ**。心理学の観測が、統計の定理と同じ対象を測っている', 'theorem', 'cs', ['criterion-is-separable']),
  c('unequal-variance-breaks-symmetry', '分散が違うと、指標が一つでなくなる', 'ROC が非対称になり、**感度をどう定義するかで値が変わる**。仮定が結論を作っていた', 'viewpoint', 'cs', ['sensitivity-index']),
  c('forced-choice-removes-criterion', '二択にすると基準が消える', '**どちらが強いかだけを聞けば、基準の自由が無くなる。**測り方を変えて仮定を一つ落とす', 'technique', 'cs', ['criterion-is-separable']),

  // 測定の理論
  c('true-score-decomposition', '真値と誤差に分ける', '観測値 $=$ 真値 $+$ 誤差。**これは仮定ではなく定義**で、内容は「誤差の期待値が 0」の側に入る', 'definition', 'cs', ['expectation', 'moments']),
  c('reliability-is-a-ratio', '信頼性は分散の比である', '真値の分散を全体の分散で割ったもの。**集団が変われば値が変わる**ので、道具の性質ではない', 'theorem', 'cs', ['true-score-decomposition']),
  c('spearman-brown', '長くすれば信頼性は上がる', '項目数を増やしたときの信頼性が、式で予測できる。**上限は 1 で、頭打ちになる**', 'theorem', 'cs', ['reliability-is-a-ratio']),
  c('attenuation-by-unreliability', '希薄化', '誤差のある二つの量の相関は、必ず真の相関より小さい。**「関係が無い」と「測れていない」が区別できない**', 'theorem', 'cs', ['reliability-is-a-ratio']),
  c('alpha-is-a-lower-bound', '$alpha$ は信頼性そのものではない', '**下界である。**しかも項目が一次元でなくても値が上がるので、一次元性の証拠にならない', 'viewpoint', 'cs', ['spearman-brown']),
  c('validity-is-not-a-property-of-the-test', '妥当性は道具の性質ではない', '**「この検査は妥当か」は問いとして不完全**で、何をどう使うかを言って初めて答えが決まる', 'viewpoint', 'cs', ['attenuation-by-unreliability']),

  // 項目反応
  c('item-response-function', '項目特性曲線', '能力の関数として正答確率を書く。**人と項目を同じ軸に乗せる**', 'definition', 'cs', ['logistic-model', 'true-score-decomposition']),
  c('logistic-model', 'ロジスティック模型', '対数オッズが線形。**指数型分布族なので、十分統計量が有限次元になる**', 'definition', 'cs', ['exponential-family']),
  c('rasch-separability', 'Rasch 模型でだけ、人と項目が分離できる', '素点が十分統計量になるので、**能力を消して項目だけ推定できる**。傾きを項目ごとに許すと、この性質が消える', 'theorem', 'cs', ['item-response-function', 'sufficient-statistic']),
  c('specific-objectivity', '比較が、どの項目を使ったかに依らない', '**同じ試験を受けていない二人を比べられる。**これが分離可能性の値打ちで、他の模型には無い', 'viewpoint', 'cs', ['rasch-separability']),
  c('model-choice-is-a-tradeoff', '当てはまりを良くすると、その性質を失う', '2 助変数模型はよく当てはまるが分離できない。**当てはまりと、比較の意味が交換になっている**', 'viewpoint', 'cs', ['specific-objectivity']),
  c('information-function', '情報関数', '項目が能力のどの辺りで効くかを表す。**Fisher 情報量そのもの**', 'theorem', 'cs', ['item-response-function', 'fisher-information']),
  c('adaptive-testing', '適応型テスト', '情報が最大になる項目を選ぶ。**同じ精度に、少ない項目で届く**', 'technique', 'cs', ['information-function']),
  c('differential-item-functioning', '同じ能力なのに正答率が違う項目', '能力を揃えても群で差が出るなら、項目が別のものを測っている。**平均の差とは無関係**', 'definition', 'cs', ['item-response-function']),
  c('scale-is-an-interval-at-best', '尺度は比例尺度ではない', '**能力が 2 倍、が意味を持たない。**原点は模型を決めたときに我々が置いたもの', 'viewpoint', 'cs', ['rasch-separability']),

  // 因子と、そこから出ない結論
  c('factor-model', '因子模型', '相関行列を、少ない共通因子で説明する', 'definition', 'cs', ['spectral-theorem', 'true-score-decomposition']),
  c('rotation-indeterminacy', '因子は回転で決まらない', '**当てはまりが同じ解が無限に在る。**どれを選ぶかは解釈であって、データが決めていない', 'theorem', 'cs', ['factor-model', 'orthogonal-group']),
  c('positive-manifold', '相関が全部正になる', 'どの検査どうしも正に相関する。**一つの因子で説明できる、とまでは言えない**', 'definition', 'cs', ['factor-model']),
  c('common-cause-is-one-model-among-many', '共通原因は、いくつかある説明の一つである', '**相互に助け合う模型でも同じ相関が出る。**因子分析はここを区別しない', 'viewpoint', 'cs', ['positive-manifold', 'rotation-indeterminacy']),
]
