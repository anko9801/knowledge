import type { Concept } from './types.ts'
import { c } from './types.ts'

export const socialChoice: readonly Concept[] = [
  // --- 社会選択と社会科学の数理 ---------------------------------------------------
  //
  // **経済学と分ける線は「貨幣が無いこと」である。** Arrow も中位投票者も
  // Balinski--Young も Banzhaf も、**仮定が順序だけ**で、効用も予算制約も要らない。
  // 支払いがあるもの（メカニズムデザイン、VCG、オークション）は `economics.ts`。
  //
  // **不可能性定理が二つあり、しかも別の不可能性である** ── Arrow は全会一致と
  // IIA、Balinski--Young は quota rule と人口単調性。片方は実在の議会が
  // 200 年ぶつかり続けている。
  c('social-welfare-function', '社会厚生関数', '個人の順序の組を一つの順序へ写す。ここに何を要求するかが問題', 'definition', 'econ', ['relation-order']),
  c('may-theorem', 'May の定理', '選択肢が二つなら、匿名・中立・正の反応性を満たす規則は多数決ただ一つ', 'theorem', 'econ', ['social-welfare-function']),
  c('condorcet-cycle', 'Condorcet の巡回', '推移的な個人選好から、非推移的な集団選好が出る', 'theorem', 'econ', ['social-welfare-function']),
  c('agenda-control', '対戦順が結果を決める', '同じ選好から、対戦の組み方を変えるだけで違う勝者が作れる', 'theorem', 'econ', ['condorcet-cycle']),
  c('iia', '無関係な選択肢からの独立', '二つの順位は、その二つの相対順位だけで決まるべきだという要求', 'definition', 'econ', ['relation-order']),
  c('decisive-coalition', '決定的連合', '「この人たちが揃えば社会もそう決める」集合。場拡張と分割の二補題で閉じる', 'definition', 'econ', ['social-welfare-function']),
  c('arrow-impossibility', 'Arrow の不可能性定理', '弱パレートと IIA を満たす集約は、選択肢が三つ以上なら独裁だけ', 'theorem', 'econ', ['decisive-coalition', 'iia', 'condorcet-cycle']),
  c('decisive-ultrafilter', '決定的集合は超フィルターをなす', '有限だから単項になり、独裁者が出る。**無限有権者では定理が落ちる**（非単項超フィルターの存在に選択公理が要る）', 'viewpoint', 'econ', ['decisive-coalition', 'cardinal', 'axiom-of-choice']),
  c('gibbard-satterthwaite', 'Gibbard–Satterthwaite の定理', '決定的・非賦課・戦略耐性を満たす規則は独裁だけ', 'theorem', 'econ', ['arrow-impossibility']),
  c('maskin-monotonicity', 'Maskin 単調性', '戦略耐性から単調性への含意の鎖。どこで切れるかが分かる', 'definition', 'econ', ['gibbard-satterthwaite']),
  c('single-peaked', '単峰選好', '一本の軸の上で、自分の位置から遠いほど嫌い。域の制限で不可能性を抜ける', 'definition', 'econ', ['relation-order']),
  c('median-voter', '中位投票者定理', '単峰なら、個人の最上位の中央値が対多数決で他のすべてに勝つ', 'theorem', 'econ', ['single-peaked', 'may-theorem']),
  c('value-restriction', '価値制限', '推移性を保証する必要十分条件。単峰性より広い', 'theorem', 'econ', ['single-peaked']),
  c('scoring-rule-characterization', 'スコア規則の特徴づけ', '匿名・中立・強化性を満たすのは複合スコア規則ちょうど。**可能性の側**', 'theorem', 'econ', ['social-welfare-function']),
  c('condorcet-vs-reinforcement', 'Condorcet 拡張は強化性を破る', '二つの選挙で同じ勝者なら合わせても同じ、が成り立たない', 'theorem', 'econ', ['scoring-rule-characterization', 'condorcet-cycle']),
  c('condorcet-jury', 'Condorcet の陪審定理', '各人の正答率が半分を超えて独立なら、多数決の正答率は 1 へ行く', 'theorem', 'econ', ['law-of-large-numbers']),
  c('pivotal-conditioning', '決定票である場合を条件付ける', '自分が結果を変える場合だけを見ると、誠実投票が均衡でなくなる', 'viewpoint', 'econ', ['condorcet-jury', 'conditional-expectation']),

  // 議席配分 ── 二つ目の不可能性
  c('quota-rule', 'quota rule', '各者の議席は、自分の割当の床か天井のいずれか', 'definition', 'econ', ['integrality']),
  c('alabama-paradox', 'Alabama パラドクス', '**議席の総数を増やすと、ある者の議席が減る。**最大剰余法で起きる', 'theorem', 'econ', ['quota-rule']),
  c('divisor-method', '除数法', '共通の除数で割って丸める。Alabama も人口パラドクスも起こさない', 'technique', 'econ', ['quota-rule']),
  c('balinski-young', 'Balinski–Young の不可能性', '4 者以上では、quota rule と人口単調性が両立しない。**Arrow とは別の不可能性である**', 'theorem', 'econ', ['alabama-paradox', 'divisor-method']),
  c('simple-game', '単純ゲーム', '勝利連合の族。重みではなく、どの集合が勝つかだけが中身', 'definition', 'econ', ['relation-order']),
  c('banzhaf-index', 'Banzhaf 指数', '自分が抜けると負ける連合の数。**重みに比例しない**', 'definition', 'econ', ['simple-game']),
  c('dummy-player', 'ダミー投票者', '重みを持つのに一度も決定票にならない。EEC 理事会 1958 年のルクセンブルク', 'theorem', 'econ', ['banzhaf-index']),
  c('shapley-shubik', 'Shapley–Shubik 指数', '効率性・対称性・ヌル・加法性を課すと配分が一意に決まる', 'theorem', 'econ', ['simple-game']),

  // 形式人口学 ── 線形代数だけで閉じる
  c('life-table', '生命表', '死力から生存関数が決まる', 'definition', 'econ', ['lebesgue-integral']),
  c('leslie-matrix', 'Leslie 行列', '年齢別の出生と生存だけを成分に持つ非負行列。第一行と副対角しか無い', 'definition', 'econ', ['matrix-representation', 'life-table']),
  c('euler-lotka', 'Euler–Lotka 方程式', 'Leslie 行列の特性方程式が、割り算一つでこの形になる', 'theorem', 'econ', ['leslie-matrix', 'characteristic-polynomial']),
  c('unique-positive-root', '正根の一意性', '左辺が狭義単調減少なので、正の実固有値はちょうど一つ', 'theorem', 'econ', ['euler-lotka']),
  c('net-reproduction-rate', '純再生産率', '成長率が 1 を超えることと、純再生産率が 1 を超えることが同値。一行で出る', 'theorem', 'econ', ['unique-positive-root']),
  c('stable-population', '安定人口定理', '年齢構成が初期条件に依らない極限を持つ。**忘れられる**', 'theorem', 'econ', ['leslie-matrix', 'perron-frobenius']),
  c('stable-age-structure', '安定年齢構造', '右固有ベクトルが、生存曲線と成長率だけで書ける', 'theorem', 'econ', ['stable-population']),
  c('reproductive-value', '生殖価値', '左固有ベクトル。将来の人口規模が初期人口のスカラー一つで決まる', 'theorem', 'econ', ['stable-population', 'dual-space']),
  c('convergence-oscillation', '収束の振動', '減衰率は第二固有値との比。複素なら振動して収束する', 'theorem', 'econ', ['stable-population', 'jordan-form']),
  c('population-momentum', '人口モメンタム', '出生率が今日置換水準へ落ちても、生殖価値の比だけ増え続ける', 'theorem', 'econ', ['reproductive-value', 'net-reproduction-rate']),

  // 社会ネットワーク
  c('signed-graph', '符号付きグラフ', '辺に友と敵の印が付いたグラフ', 'definition', 'econ', ['graph']),
  c('structural-balance', '構造均衡', 'すべての三角形で、負の辺が 0 本か 2 本', 'definition', 'econ', ['signed-graph']),
  c('balance-theorem', '均衡定理', '完全グラフが均衡なら、全員が友か、二派に割れて派内は友・派間は敵', 'theorem', 'econ', ['structural-balance']),
  c('weak-balance', '弱い均衡', '負の辺がちょうど 1 本の三角形が無いことと、任意個の派閥に分かれることが同値', 'theorem', 'econ', ['balance-theorem']),
  c('balance-odd-cycle', '一般グラフの均衡判定', '負の辺が奇数本の閉路が無いことと同値。**二部性定理の言い換えである**', 'theorem', 'econ', ['structural-balance', 'bipartite']),
  c('strong-triadic-closure', '強い三者閉包', '強い紐帯を二本持つなら、その二人の間に辺がある', 'definition', 'econ', ['graph']),
  c('weak-tie-bridge', '弱い紐帯は橋になる', '強い三者閉包を課すと、局所橋はすべて弱い紐帯になる', 'theorem', 'econ', ['strong-triadic-closure']),
  c('cluster-density', 'クラスタ密度', '各点が自分の隣人の一定割合以上を集合内に持つ集合', 'definition', 'econ', ['graph']),
  c('cascade-cluster-duality', 'カスケードとクラスタの二択', '完全カスケードが起きないことと、十分密なクラスタが残ることが同値', 'theorem', 'econ', ['cluster-density']),
  c('cascade-capacity', 'カスケード容量', '次数有界な無限グラフではどれも半分以下', 'theorem', 'econ', ['cascade-cluster-duality']),
  c('centrality-axioms', '中心性の公理', '公理をすべて満たす中心性は調和中心性ただ一つ', 'theorem', 'econ', ['graph']),
  c('nash-bargaining-outside-option', '外部選択肢が力を決める', '力の差は外部選択肢の差からしか出ない', 'theorem', 'econ', ['expectation']),

  // 分離と閾値
  c('schelling-segregation', 'Schelling の分離模型', '各人が同色の隣人を一定割合欲しがるだけで、配置が凍結する条件が決まる', 'definition', 'econ', ['graph']),
  c('segregation-threshold-half', '分離の閾値は半分ちょうど', '半分なら連の長さで凍結条件が書け、半分を超えると**凍結配置が一つも無い**', 'theorem', 'econ', ['schelling-segregation']),
  c('segregation-is-dynamic', '分離は不動点からは出ない', '凍結配置の異色対の上界が、ランダム配置の期待値とちょうど等しい。効いているのは遷移の非対称性', 'theorem', 'econ', ['segregation-threshold-half']),
  c('granovetter-threshold', '閾値模型', '各人が「何人が動いたら動くか」の数だけを持つ。閾値分布が結果を決める', 'definition', 'econ', ['distribution']),

  // 法と経済学
  c('hand-rule-marginal', 'Hand ルールの限界版', '注意の限界費用と期待損害の限界減少が釣り合う。**全額で比べると一階条件にならない**', 'theorem', 'econ', ['convex-set']),
  c('negligence-first-best', '過失責任は第一最善を実装する', '義務水準で私的費用が不連続に落ちるので、そこが狭義最適になる', 'theorem', 'econ', ['hand-rule-marginal']),
  c('residual-claimant-uniqueness', '残余請求者は一人しか置けない', '片側の責任規則で両側の注意を効率化できない。寄与過失が要る理由', 'theorem', 'econ', ['negligence-first-best']),
  c('prosecutors-fallacy', '検察官の誤謬', '容疑者集団の大きさと一致確率の積が支配する。一致確率だけでは何も言えない', 'theorem', 'econ', ['conditional-expectation']),
  c('coase-theorem', 'Coase 定理', '取引費用がゼロで権利が明確なら、初期の権利配分に依らず効率的な結果になる', 'theorem', 'econ', ['hand-rule-marginal']),

  // 平等さの測り方 ── 優越は半順序である
  c('pigou-dalton', 'Pigou–Dalton の移転原理', '豊かな側から貧しい側へ、順位を入れ替えない範囲で移すと、平等になったと数える。**これだけを要請する**', 'definition', 'econ', ['majorization']),
  c('lorenz-dominance', 'Lorenz 優越', '累積の取り分の曲線が、どこでも上にあること。**移転原理を満たす全ての指標が同じ順に並べるのは、曲線が交わらないときだけ**', 'theorem', 'econ', ['pigou-dalton', 'hardy-littlewood-polya']),
  c('curves-cross-so-indices-disagree', '曲線が交わると、指標が食い違う', 'ジニ係数と Atkinson 指数が逆の順を出す。**どちらが誤りでもない。半順序を全順序に潰した代償である**', 'viewpoint', 'econ', ['lorenz-dominance', 'one-number-cannot-decide']),
]
