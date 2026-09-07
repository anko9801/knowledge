import type { Concept } from './types.ts'
import { c } from './types.ts'

export const automata: readonly Concept[] = [
  // --- 形式言語とデータベース --------------------------------------------------
  //
  // **2026-08-28 に一度外した。**「有限の状態しか持てないと括弧が数えられない」
  // 以外が生きないと判定した。今回それを覆すのは、**理由が二つ増えた**からである。
  //
  // 一つ目。言語学の側が、**閉包性を使って有限の観測を無限の定理に変えている**
  // （`closure-under-intersection-with-regular`）。閉包の一覧が要る。
  //
  // 二つ目。**Myhill--Nerode が「最小の機械が一意に決まる」を言う。**
  // 状態の数が同値類の数として定まり、しかも計算できる。
  // これは「モデルを絞ると限界が決まる」とは別の主張で、
  // **構文だけで最適な対象が一つに決まる**という形になっている。
  //
  // データベースを同じ連載に入れたのは、**同じ形の定理が出る**から ──
  // 関数従属という構文的な条件から、分解の仕方が一意に決まる。
  c('closure-properties', '閉包性', '**演算で族の外へ出るかどうか。**正規言語は補集合でも交叉でも閉じ、文脈自由は交叉で閉じない', 'definition', 'cs', ['chomsky-hierarchy', 'finite-automaton']),
  c('closure-turns-finite-into-infinite', '閉包性が、有限の観測を定理に変える', '**正規集合との交叉が閉じているので、言語全体ではなく切り出した部分を調べればよい**（スイスドイツ語の議論がこれ）', 'viewpoint', 'cs', ['closure-properties', 'closure-under-intersection-with-regular']),
  c('nondeterminism-is-free-here', '非決定性が、正規言語では無料である', '**部分集合構成で決定化できる。**ただし状態数が指数的に増えうる ── 表現力は同じでも、大きさは違う', 'theorem', 'cs', ['finite-automaton', 'closure-properties']),
  c('myhill-nerode', 'Myhill–Nerode の定理', '**最小の決定性オートマトンが、同型を除いて一意に決まる。**状態が同値類そのもの', 'theorem', 'cs', ['nondeterminism-is-free-here', 'relation-order']),
  c('minimality-is-computable', '最小の機械は、計算で求まる', '**同値類を分割していくだけ。**「一番良い実装」が探索でなく計算で出る、数少ない例', 'technique', 'cs', ['myhill-nerode']),
  c('nerode-is-a-lower-bound-tool', '同値類の数が、下界になる', '**区別できる語の組を挙げれば、状態数の下界が出る。**ポンプ補題より強く、使いやすい', 'technique', 'cs', ['myhill-nerode', 'pumping-lemma']),
  c('regular-equals-monadic-second-order', '正規性には、論理による特徴づけがある', '**Büchi–Elgot–Trakhtenbrot。**機械の言葉と論理の言葉が同じ族を切り出す', 'theorem', 'cs', ['myhill-nerode', 'satisfaction']),
  c('automata-decide-logic', 'だから、その論理が決定可能になる', '**充足可能性が、オートマトンが空かどうかの判定に化ける。**モデル検査がこの上に乗っている', 'theorem', 'cs', ['regular-equals-monadic-second-order', 'model-checking']),
  c('pushdown-and-context-free', '押し下げオートマトンと文脈自由文法', 'スタックを一本足す。**機械の側と文法の側が、同じ族を定める**', 'theorem', 'cs', ['finite-automaton', 'chomsky-hierarchy']),
  c('cfl-not-closed-under-intersection', '文脈自由は交叉で閉じない', '**二つの言語の交叉が文脈自由でない例が作れる。**閉じないことが、言語学の議論の前提になっている', 'theorem', 'cs', ['pushdown-and-context-free', 'closure-properties']),
  c('deterministic-cfl-is-smaller', '決定性の文脈自由言語は、真に小さい', '**ここでは非決定性が無料ではない。**構文解析が線形時間で回るのは、決定性の側に限る', 'theorem', 'cs', ['pushdown-and-context-free', 'nondeterminism-is-free-here']),
  c('parsing-is-where-theory-meets-practice', '構文解析の道具が、そこから決まる', '**LL と LR がどこまで扱えるかは、決定性の範囲で決まっている。**言語の設計が理論に縛られる', 'viewpoint', 'cs', ['deterministic-cfl-is-smaller']),

  // データベース ── 同じ形の一意性
  c('relational-model', '関係モデル', 'データを、集合と述語だけで書く。**物理的な並びを一つも仮定しない**', 'definition', 'cs', ['relation-order', 'satisfaction']),
  c('relational-algebra', '関係代数', '**五つの演算で閉じる。**問い合わせが、代数の式になる', 'definition', 'cs', ['relational-model']),
  c('codd-equivalence', '代数と論理が同じ表現力を持つ', '**関係代数と、安全な関係論理が同値**（Codd の定理）。手続き的な書き方と宣言的な書き方が一致する', 'theorem', 'cs', ['relational-algebra', 'regular-equals-monadic-second-order']),
  c('optimization-is-rewriting', '最適化は、式の書き換えである', '**同値な式のうち速いものを選ぶ。**等式が成り立つことが、実行計画を選ぶ自由を作っている', 'viewpoint', 'cs', ['codd-equivalence']),
  c('functional-dependency', '関数従属', '**ある列が決まれば別の列が決まる、という制約。**データの中身ではなく、構造の主張である', 'definition', 'cs', ['relational-model']),
  c('armstrong-axioms', 'Armstrong の公理', '**三つの規則が健全かつ完全。**従属から導けるものが、これで全部尽きる', 'theorem', 'cs', ['functional-dependency', 'proof-system']),
  c('normal-forms-are-theorems', '正規形は、定理である', '**どこまで分解できるかが、関数従属だけで決まる。**設計の指針ではなく、構文から出る結論', 'theorem', 'cs', ['armstrong-axioms']),
  c('lossless-join-condition', '分解して戻せる条件', '**共通の列が、どちらかの候補キーになっていること。**戻せるかどうかが判定できる', 'theorem', 'cs', ['normal-forms-are-theorems']),
  c('bcnf-loses-dependency-preservation', '第三正規形と BCNF は交換になる', '**BCNF まで分解すると、従属が保たれないことがある。**両方は満たせない場合が在る', 'theorem', 'cs', ['lossless-join-condition']),
  c('conjunctive-query-containment', '問い合わせの包含は判定できる', '**準同型が在るかどうかと同値。**NP 完全だが、決定可能である', 'theorem', 'cs', ['codd-equivalence', 'np-completeness']),
  c('serializability-is-acyclicity', '直列化可能性は、閉路が無いことである', '**競合グラフに閉路が無ければ、逐次実行と同じ結果になる。**並行性の正しさが、グラフの性質になる', 'theorem', 'cs', ['serializability', 'path-and-cycle']),
  c('two-phase-locking-is-sufficient', '二相ロックは十分条件である', '**必要ではない。**直列化可能なのにロックでは作れない実行が在る ── 安全側に倒している', 'viewpoint', 'cs', ['serializability-is-acyclicity']),
]
