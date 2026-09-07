import type { Concept } from './types.ts'
import { c } from './types.ts'

export const decisionTheory: readonly Concept[] = [
  // --- 決めることと、知っていること ---------------------------------------------
  //
  // **分離超平面に、四人が独立に着いた**（`docs/surveys.md`）。
  // 経済（無裁定 $arrow.l.r.double$ 状態価格）、工学（塑性崩壊の下界定理）、
  // 化学（Lieb の密度汎関数の凸解析的定式化）、そして**哲学** ──
  // 整合性 $=$ 裁定不可能性 $=$ 確率測度の存在。
  //
  // 経済側の効用理論（`vnm-representation`、`savage-representation`）は
  // あちらに家が在る。ここが持つのは**信念の側**と、**知識の側**。
  c('degree-of-belief', '信念の度合い', '賭けに応じる比率として測る。**数として扱えるかどうかが、まず問われる**', 'definition', 'econ', ['probability-space']),
  c('dutch-book', 'ダッチブック', 'どう転んでも損する賭けの組。**受け入れてしまう信念が、整合的でない信念である**', 'definition', 'econ', ['degree-of-belief', 'no-arbitrage']),
  c('dutch-book-theorem', '整合性と、確率の公理が同値', '**分離超平面そのもの。**損する賭けの集合と実行可能集合が交わらないことから、確率測度が一つ出る', 'theorem', 'econ', ['dutch-book', 'separating-hyperplane']),
  c('same-theorem-as-no-arbitrage', '無裁定と同じ定理である', '**金融の状態価格と、哲学の整合性が、同じ分離定理の二つの読み方**。片方を知っていれば、もう片方は証明済み', 'viewpoint', 'econ', ['dutch-book-theorem', 'state-price']),
  c('conditionalization', '条件付けによる更新', '新しい情報を得たら条件付き確率に移る。**動的なダッチブックが、これを一意に決める**', 'theorem', 'econ', ['dutch-book-theorem', 'conditional-expectation']),
  c('problem-of-old-evidence', '既に知っていることは、確率を動かさない', '**確率が 1 の事象で条件付けても何も変わらない。**説明できたことが証拠にならない、という困りごと', 'viewpoint', 'econ', ['conditionalization']),
  c('scoring-rule', 'スコアリングルール', '予測に点を付ける関数', 'definition', 'econ', ['degree-of-belief', 'expectation']),
  c('proper-scoring-rule', '正直が最適になる採点', '**自分の本当の信念を言うのが期待値を最大にする採点法**が、凸関数から作れる', 'theorem', 'econ', ['scoring-rule', 'convex-conjugate']),
  c('accuracy-argument-for-probabilism', '正確さからも同じ結論が出る', '確率の公理を破る信念は、**どの世界でも一様に不正確な別の信念に支配される**。賭けを一つも持ち出さない', 'theorem', 'econ', ['proper-scoring-rule', 'dutch-book-theorem']),

  // 決定 ── 確率が無いとき
  c('decision-under-ignorance', '確率が置けない場合', '**期待効用が使えない。**規準そのものを選ぶところから始まる', 'definition', 'econ', ['vnm-representation']),
  c('maximin-and-its-cost', 'マキシミンが払う代償', '最悪を最良にする。**一つの結果が少し悪いだけで、他が全部良くても負ける**', 'definition', 'econ', ['decision-under-ignorance']),
  c('minimax-regret', 'ミニマックス後悔', '後から見た損を最小にする。**無関係な選択肢を足すと順位が変わる**', 'definition', 'econ', ['maximin-and-its-cost', 'iia']),
  c('milnor-axioms', '規準を公理で分ける', 'どの性質を要求するかで規準が一つに決まる。**社会選択と同じ形の議論**', 'theorem', 'econ', ['minimax-regret']),
  c('ambiguity-is-not-risk', '曖昧さは危険とは別である', '確率が分かっている賭けと、分からない賭けが、**一つの確率測度では区別できない**', 'viewpoint', 'econ', ['ellsberg-paradox']),
  c('newcomb-problem', 'Newcomb 問題', '**二つの決定理論が、違う答えを出す。**どちらも一貫していて、どちらかが誤りだとは示せていない', 'viewpoint', 'econ', ['conditionalization', 'association-vs-causation']),
  c('evidential-vs-causal', '証拠と因果の分かれ目', '条件付き確率で決めるか、介入の効果で決めるか。**統計の「関連と因果」が、そのまま決定理論の分岐になる**', 'viewpoint', 'econ', ['newcomb-problem']),

  // 知識 ── 様相の側
  c('epistemic-accessibility', '到達可能性関係', '「その人にとってあり得る世界」を関係として書く。**知識の論理は、この関係の性質で決まる**', 'definition', 'math', ['relation-order', 'satisfaction']),
  c('knowledge-axioms', '公理が関係の性質と一対一に対応する', '知っていることは真、という公理が反射性に対応する。**どの公理を採るかは、どの関係を許すかである**', 'theorem', 'math', ['epistemic-accessibility']),
  c('logical-omniscience', '論理的全知の問題', '**この枠組みでは、含意されることを全部知っていることになる。**現実の主体を表せない', 'viewpoint', 'math', ['knowledge-axioms']),
  c('common-knowledge', '共有知識', '全員が知り、全員が知っていることを全員が知り、と無限に続く。**有限回では足りない**', 'definition', 'math', ['knowledge-axioms']),
  c('common-knowledge-is-not-a-limit', '共有知識は、繰り返しの極限ではない', '**到達可能関係の推移閉包として一度に定義される。**近似で作れない', 'theorem', 'math', ['common-knowledge']),
  c('coordinated-attack', '協調攻撃問題', '**通信が失われうるなら、共有知識は決して作れない。**FLP と同じ形の不可能性', 'theorem', 'math', ['common-knowledge-is-not-a-limit', 'flp-impossibility']),
  c('muddy-children', '公開の一言が状態を変える', '全員が既に知っている事実の宣言が、**共有知識にすることで結論を変える**', 'theorem', 'math', ['common-knowledge']),
  c('agreeing-to-disagree', '合意しないことに合意できない', '**事前確率が同じで、事後確率が共有知識なら、二つは一致する。**証明は情報分割の交わりだけ', 'theorem', 'math', ['common-knowledge', 'conditional-expectation']),
  c('surprise-examination', '抜き打ち試験の逆理', '後ろ向き帰納が全部を消すのに、実際には驚ける。**知識の公理のどれを落とすかで、消え方が変わる**', 'viewpoint', 'math', ['knowledge-axioms', 'transfinite-induction']),
]
