import type { Concept } from './types.ts'
import { c } from './types.ts'

export const complexity: readonly Concept[] = [
  // --- 計算量理論 -------------------------------------------------------------
  //
  // 依存が「還元」として明示される分野。A ≤ₚ B は requires そのもの。
  //
  // ここは「これ以上は無理」を言う側で、届かせる側（アルゴリズム）と対にする。
  // 同じ近似アルゴリズムでも、作り方はあちら、限界はこちらになる。
  //
  // 軸は一つで、何を一手と数えるかを決めると、それ以上速くならない線が
  // 決まる。比較しかできないなら n log n、鍵の中身を見てよければ線形。
  // 下界は問題の性質ではなく、許した操作の性質である。
  //
  // ところが条件を外すと、ほとんど何も証明できない。P != NP が 50 年
  // 解けていないのがそれで、だから計算量理論は「A が解ければ B も解ける」
  // という相対的な比べ方に頼ることになる。この対比が主題である。
  //
  // オートマトンは、その最も単純な例として 4 個だけ置く。有限の状態しか
  // 持てないと括弧が数えられない、が「モデルを絞ると限界が決まる」の原型
  // だからで、正規言語の閉包や構文解析まで並べると言語論の教科書になる。
  c('turing-machine', 'Turing 機械', '計算の形式的な定義', 'definition', 'cs', ['computability']),
  c('formal-language', '形式言語', '記号列の集合。問題を言語として書き直す', 'definition', 'cs', ['first-order-syntax']),
  c('finite-automaton', '有限オートマトン', '状態が有限個。読んだ文字で移るだけで、記憶は状態しかない', 'definition', 'cs', ['formal-language']),
  c('pumping-lemma', 'ポンピング補題', '状態が足りないので、長い語は必ず繰り返しを含む。鳩の巣そのもの', 'theorem', 'cs', ['finite-automaton']),
  c('chomsky-hierarchy', 'Chomsky 階層', '許す記憶の量で言語の族が決まる。正規、文脈自由、文脈依存、帰納的可算', 'theorem', 'cs', ['pumping-lemma', 'turing-machine']),
  c('computation-model', '計算のモデル', '何を一手と数えるか。決めないうちは、速さも限界も言えない', 'definition', 'cs', ['turing-machine']),
  c('decision-tree-lower-bound', '決定木の下界', '区別すべき入力が $N$ 通りなら、比較の回数は $log_2 N$ 以上', 'theorem', 'cs', ['computation-model']),
  c('comparison-sort-bound', '比較ソートの限界', '葉が $n!$ 個必要なので $Omega(n log n)$。マージソートが達成する', 'theorem', 'cs', ['decision-tree-lower-bound']),
  c('model-change-moves-bound', 'モデルを変えると限界が動く', '鍵の構造を使えば線形。下界は問題の性質ではなく、許した操作の性質', 'viewpoint', 'cs', ['comparison-sort-bound', 'chomsky-hierarchy']),
  c('adversary-argument', '敵対者論法', '答えを先に決めず、質問に応じて辻褄の合う側を返し続ける', 'technique', 'cs', ['decision-tree-lower-bound']),
  c('information-lower-bound', '情報からの下界', '区別すべき場合の数の対数。決定木の下界のエントロピー版', 'theorem', 'cs', ['decision-tree-lower-bound', 'entropy']),
  c('communication-complexity', '通信計算量', '入力を二人に分けたとき、何ビット交換すれば足りるか', 'definition', 'cs', ['computation-model', 'entropy']),
  c('streaming-space-lower-bound', '一パスの空間下界', '通信計算量からの還元。異なり数は近似しか取れない', 'theorem', 'cs', ['communication-complexity', 'space-complexity']),
  c('complexity-class', '計算量クラス', '資源で問題を分類する。P、NP、PSPACE', 'definition', 'cs', ['turing-machine']),
  c('polynomial-reduction', '多項式時間帰着', '$A <=_p B$。$B$ が解ければ $A$ も解ける', 'definition', 'cs', ['complexity-class']),
  c('np-completeness', 'NP 完全性', 'NP の中で最も難しい問題', 'definition', 'cs', ['polynomial-reduction']),
  c('cook-levin', 'Cook–Levin の定理', 'SAT は NP 完全。還元の連鎖の出発点', 'theorem', 'cs', ['np-completeness']),
  c('karp-reductions', 'Karp の 21 問題', 'SAT からの還元で NP 完全性が伝播する', 'theorem', 'cs', ['cook-levin']),
  c('time-hierarchy', '時間階層定理', '時間を増やせば解ける問題が増える。対角化', 'theorem', 'cs', ['complexity-class', 'diagonal-lemma']),
  c('space-complexity', '空間計算量', 'PSPACE、Savitch の定理', 'definition', 'cs', ['complexity-class']),
  c('randomized-complexity', '確率的計算量', 'BPP。乱択を許すとどうなるか', 'definition', 'cs', ['complexity-class', 'probability-space']),
  c('pcp-theorem', 'PCP 定理', '証明を数箇所読むだけで検査できる。近似の限界がここから出る', 'theorem', 'cs', ['np-completeness', 'randomized-complexity']),
  c('inapproximability', '近似の限界', '近似すら難しい問題がある。どこまで近づけるかに壁がある', 'theorem', 'cs', ['approximation-ratio', 'pcp-theorem']),
]
