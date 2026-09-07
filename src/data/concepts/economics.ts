import type { Concept } from './types.ts'
import { c } from './types.ts'

export const economics: readonly Concept[] = [
  // --- 経済学 ------------------------------------------------------------------
  //
  // **2026-08-27 に一度削除した。** 理由は「分野として立っていないのに
  // `goals` があった」で、定理が無かったからではない。復元した 7 概念は
  // **どれも定理名だけで、仮定が書かれていなかった。**
  //
  // 今度は不可能性定理を軸にする ── 何を要求すると要求が両立しなくなるか。
  // `malament-theorem`・`haag-theorem`・`flp-impossibility` と同じ位置に立つ。
  //
  // **角谷は戻さない。** Nash 自身が 1951 年 Annals 版 p.288 で角谷版を捨て、
  // 「based directly on the Brouwer theorem」と書いている（本文で確認）。
  c('preference-relation', '選好関係', '完備で推移的な二項関係。ここに連続性を足すかどうかで表現定理が変わる', 'definition', 'econ', ['relation-order']),
  c('ordinal-representation', '順序効用', '可算なら弱順序だけで実数値の効用が作れる', 'theorem', 'econ', ['preference-relation']),
  c('lexicographic-no-utility', '辞書式順序に効用は無い', '連続性を落とすと実数値の表現が消える。$RR^2$ が反例', 'theorem', 'econ', ['ordinal-representation']),
  c('utility-representation', '効用による表現', '連続性を足すと連続な効用が取れる（Debreu）', 'theorem', 'econ', ['ordinal-representation', 'topology-basics']),
  c('afriat-theorem', 'Afriat の定理', '有限データが効用最大化と整合することと、ある線形不等式系が正の解を持つことが同値', 'theorem', 'econ', ['preference-relation', 'farkas-lemma']),
  c('concavity-untestable', '凹性には検証内容が無い', '有限データを有理化する効用があるなら、連続・単調・凹なものも必ず取れる', 'theorem', 'econ', ['afriat-theorem']),

  // 期待効用 ── 公理を認めると効用関数が存在する
  c('lottery', 'くじ', '結果への確率分布。混合が定義された凸集合になる', 'definition', 'econ', ['probability-space', 'convex-set']),
  c('independence-axiom', '独立性公理', '共通の第三項を混ぜても順序が変わらない、という要求', 'definition', 'econ', ['lottery', 'preference-relation']),
  c('vnm-representation', 'von Neumann–Morgenstern の表現定理', '四公理と期待効用最大化が同値。効用は正のアフィン変換を除いて一意', 'theorem', 'econ', ['independence-axiom']),
  c('allais-paradox', 'Allais のパラドックス', '観測される選好が破るのは**独立性だけ**。他の三公理は生き残る', 'theorem', 'econ', ['vnm-representation']),
  c('savage-acts', '行為・状態・帰結', '確率を外から与えず、行為への選好だけから始める', 'definition', 'econ', ['preference-relation']),
  c('sure-thing-principle', '確実事象の原理', '二つの行為が一致する事象の中身は順序に効かない', 'definition', 'econ', ['savage-acts']),
  c('savage-representation', 'Savage の表現定理', '公理から確率と効用が同時に出る。確率は一意', 'theorem', 'econ', ['sure-thing-principle', 'probability-space']),
  c('non-atomicity', '非原子性', '状態空間が無限であることを強いる。有限個では任意の確率値を作る細分ができない', 'theorem', 'econ', ['savage-representation']),
  c('ellsberg-paradox', 'Ellsberg のパラドックス', '曖昧さを嫌う選好は確実事象の原理を破り、どんな加法的確率でも表せない', 'theorem', 'econ', ['sure-thing-principle']),

  // ゲーム理論 ── 既存グラフへの辺がいちばん多い
  c('nash-equilibrium', 'Nash 均衡', '相手の手を固定したとき、誰も一人では得しない点。混合戦略で定義する', 'definition', 'econ', ['lottery', 'convex-set']),
  c('nash-existence', 'Nash 均衡の存在', '有限ゲームには必ずある。**Brouwer だけで足りる**（角谷は要らない）', 'theorem', 'econ', ['nash-equilibrium', 'brouwer-fixed-point']),
  c('regret-renormalize-map', '不満を足して割り直す写像', 'Nash の写像と価格調整の写像が同じ形。不動点は「誰も不満が無い点」', 'viewpoint', 'econ', ['nash-existence']),
  c('minimax-theorem', 'ミニマックス定理', '零和では最大保証値と最小保証損失が一致する。**相手に手の内を見せても損しない**', 'theorem', 'econ', ['lp-duality', 'nash-equilibrium']),
  c('correlated-equilibrium', '相関均衡', '線形不等式系で書けるので一つは多項式時間で出る。Nash 均衡の集合はこの中の非凸な部分', 'definition', 'econ', ['nash-equilibrium', 'linear-program']),
  c('nash-is-ppad-complete', 'Nash 均衡の計算は PPAD 完全', '解が必ずあるので NP 完全にはならない。Brouwer 不動点と互いに帰着する', 'theorem', 'econ', ['nash-existence', 'complexity-class']),
  c('minmax-payoff', 'ミニマックス利得', '相手が本気で潰しにきたときの下限。静学 Nash 均衡とは一致しない', 'definition', 'econ', ['nash-equilibrium']),
  c('folk-theorem', 'フォーク定理', '実現可能かつ狭義に個人合理的な利得は、割引率が 1 に近ければ全部が均衡で出る', 'theorem', 'econ', ['minmax-payoff', 'discounting']),
  c('evolutionarily-stable', '進化的安定戦略', '侵入に耐える混合戦略。必ず Nash 均衡だが、逆は成り立たない', 'definition', 'econ', ['nash-equilibrium']),

  // メカニズムデザイン ── 支払いがある側
  c('revelation-principle', '顕示原理', '支配戦略で実装できるなら、正直申告が支配戦略の直接機構がある。支払いまで同じ', 'theorem', 'econ', ['nash-equilibrium']),
  c('vcg-mechanism', 'VCG 機構', '厚生最大化なら、ある形の支払いで必ず耐戦略的になる。証明は三行', 'theorem', 'econ', ['revelation-principle']),
  c('clarke-pivot', 'Clarke ピボット', '自分が他人に与えた損害を払う形。正の移転が起きず、個人合理性も出る', 'technique', 'econ', ['vcg-mechanism']),
  c('roberts-theorem', 'Roberts の定理', '定義域が完全で選択肢が三つ以上なら、耐戦略的なのはアフィン最大化子だけ', 'theorem', 'econ', ['vcg-mechanism']),
  c('monotone-allocation', '配分の単調性', '単一助変数域では耐戦略性と単調性が同値。支払いは単調性から一意に決まる', 'theorem', 'econ', ['revelation-principle']),
  c('revenue-equivalence', '収入同値', '二つの条件だけで、期待収入が機構によらない。証明は包絡線定理と部分積分', 'theorem', 'econ', ['monotone-allocation', 'expectation']),
  c('virtual-valuation', '仮想評価', '任意の耐戦略機構の期待利益が、期待仮想余剰に等しくなる', 'definition', 'econ', ['revenue-equivalence']),
  c('myerson-optimal-auction', 'Myerson の最適オークション', '仮想入札に VCG を掛けて戻す。**効率的ではない**。収入と効率が正面から衝突する', 'theorem', 'econ', ['virtual-valuation', 'clarke-pivot']),
  c('myerson-satterthwaite', 'Myerson–Satterthwaite の定理', '誘因両立・個人合理・予算均衡・事後効率は同時に成り立たない。**要る補助金が、取引から出る値打ちちょうどに等しい**', 'theorem', 'econ', ['revenue-equivalence']),
  c('deferred-acceptance', '受入延期アルゴリズム', '提案側から回すと必ず安定マッチングで停止する。存在証明が手続きそのもの', 'theorem', 'econ', ['matching-duality']),
  c('matching-optimality', '提案側最適', '出力は全安定マッチングの中で提案側に最良、受ける側に最悪。両側は取れない', 'theorem', 'econ', ['deferred-acceptance']),
  c('matching-core', '安定マッチングとコア', '安定マッチングの集合がちょうどコア。二人組から一般の連合へ広げても増えない', 'theorem', 'econ', ['deferred-acceptance']),

  // 一般均衡 ── 何が決まらないか
  c('first-welfare-theorem', '厚生経済学の第一定理', '均衡は Pareto 効率的。**要るのは局所非飽和だけで、凸性は要らない**', 'theorem', 'econ', ['utility-representation']),
  c('second-welfare-theorem', '厚生経済学の第二定理', '効率的な配分は移転付きで均衡になる。こちらは凸性が要る。**証明は分離超平面**', 'theorem', 'econ', ['first-welfare-theorem', 'separating-hyperplane']),
  c('walras-existence', '一般均衡の存在', '超過需要が関数なら Brouwer、対応なら角谷。狭義凸性がその境目', 'theorem', 'econ', ['first-welfare-theorem', 'brouwer-fixed-point']),
  c('smd-theorem', 'Sonnenschein–Mantel–Debreu の定理', '斉次 0 次でワルラス法則を満たす連続関数は、すべてある経済の超過需要になる。**効用最大化は総超過需要に何の制約も課さない**', 'theorem', 'econ', ['walras-existence']),
  c('brown-matzkin', 'Brown–Matzkin の定理', '初期保有まで観測できればワルラスモデルは反証可能。SMD の「何も言えない」の外側', 'theorem', 'econ', ['smd-theorem']),

  // 金融 ── 核だけ
  c('no-arbitrage', '無裁定', 'ただで正の収入を確定させられないこと。均衡より弱い前提で価格が決まる', 'definition', 'econ', ['convex-set']),
  c('state-price', '状態価格', '無裁定と、狭義正の状態価格の存在が同値。**証明は分離超平面**', 'theorem', 'econ', ['no-arbitrage', 'separating-hyperplane']),
]
