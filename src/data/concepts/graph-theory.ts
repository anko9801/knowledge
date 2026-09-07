import type { Concept } from './types.ts'
import { c } from './types.ts'

export const graphTheory: readonly Concept[] = [
  // --- グラフ理論と組合せ論 ------------------------------------------------------
  //
  // **21 本の分野調査のうち三本が、独立に「グラフが概念グラフに無い」と報告した。**
  // アルゴリズム（探索・最短路・流れ）、社会ネットワーク（構造均衡・カスケード）、
  // 組合せ論（平面性・彩色・極値）が、全部ここを要求している。
  //
  // **組合せ論と一本にした。** 平面性と彩色だけでは 6 回、極値と確率的方法だけでは
  // 8 回で、どちらも単独では足りない。一本の軸で繋がる ──
  // **「その形が入らない」ことは、入らない理由を一つ挙げて示す。
  // 理由が挙がらないときだけ確率が要る。**
  //
  // 流れと切断（`maxflow-mincut`）とマッチングの双対（`matching-duality`）は
  // アルゴリズムの側に家がある。ここは引く。
  c('graph', 'グラフ', '点と辺。隣接という関係だけを残して、他を全部捨てた対象', 'definition', 'math', ['relation-order']),
  c('path-and-cycle', '道と閉路', '点をたどった列。閉路が在るかどうかが、グラフの性質をほとんど決める', 'definition', 'math', ['graph']),
  c('bipartite', '二部性', '二色に塗り分けられることと、奇数長の閉路が無いことが同値', 'theorem', 'math', ['path-and-cycle']),
  c('degree-distribution', '次数分布', '点ごとの辺の本数の分布。平均だけでは形が決まらない', 'definition', 'math', ['graph', 'distribution']),
  c('handshake-lemma', '握手補題', '次数の総和は辺の数の二倍。**奇数次数の点は必ず偶数個**', 'theorem', 'math', ['graph']),
  c('tree-characterizations', '木の五つの定義が同値', '連結かつ無閉路、辺が点の数より一つ少ない、任意の二点を結ぶ道が一意 ── **どれを定義にしてもよい**', 'theorem', 'math', ['path-and-cycle', 'connectedness']),
  c('euler-circuit', 'Euler 回路が在る条件', '全ての次数が偶数であること。**必要は握手補題、十分は構成的**', 'theorem', 'math', ['handshake-lemma']),
  c('hamilton-has-no-such-criterion', 'Hamilton 閉路には、そういう条件が無い', '同じ形の問いなのに、片方は次数を数えれば終わり、片方は NP 完全。**問いの見た目は難しさを決めない**', 'viewpoint', 'math', ['euler-circuit', 'np-completeness']),

  // 平面性 ── 入らないことを、理由を挙げて示す
  c('planar-graph', '平面グラフ', '辺を交差させずに描けるグラフ', 'definition', 'math', ['graph', 'topology-basics']),
  c('euler-formula-planar', 'Euler の多面体公式', '点 $-$ 辺 $+$ 面 $= 2$。**描き方に依らない**ので、位相不変量である', 'theorem', 'math', ['planar-graph', 'euler-characteristic']),
  c('planar-edge-bound', '平面グラフの辺は $3n - 6$ を超えない', '各面が 3 辺以上で囲まれることを数え上げるだけ。**$K_5$ と $K_(3,3)$ がここで落ちる**', 'theorem', 'math', ['euler-formula-planar']),
  c('kuratowski-theorem', 'Kuratowski の定理', '平面に描けないことと、二つの形のどちらかを含むことが同値。**「入らない理由」がちょうど二つに尽きる**', 'theorem', 'math', ['planar-edge-bound']),
  c('obstruction-set-is-finite', '禁じられた形は、どの曲面でも有限個', 'Robertson–Seymour。**平面の 2 個が例外的に少ないだけで、有限性は一般に成り立つ**。ただし個数の上界は実用にならない', 'theorem', 'math', ['kuratowski-theorem']),

  // 彩色
  c('chromatic-number', '彩色数', '隣り合う点を別の色にする最小の色数', 'definition', 'math', ['graph']),
  c('greedy-coloring-bound', '貪欲彩色の上界', '最大次数に 1 を足せば必ず塗れる。**順番を選ぶ余地がここに全部入っている**', 'theorem', 'math', ['chromatic-number']),
  c('brooks-theorem', 'Brooks の定理', '完全グラフと奇閉路を除けば、最大次数だけで塗れる。**例外がちょうど二種類**', 'theorem', 'math', ['greedy-coloring-bound']),
  c('five-color-theorem', '五色定理', 'Kempe 鎖の入れ替えで出る。**四色にする最後の一歩だけが、この手では届かない**', 'theorem', 'math', ['planar-edge-bound', 'chromatic-number']),
  c('four-color-computer-proof', '四色定理の証明は場合分けである', '不可避集合と可約配置に落として、計算機が数え上げる。**「なぜ 4 なのか」は答えていない**', 'theorem', 'math', ['five-color-theorem']),
  c('chromatic-polynomial', '彩色多項式', '色数を変数にすると多項式になる。**係数の符号が交代する**ことが定理', 'theorem', 'math', ['chromatic-number', 'polynomial-ring']),
  c('perfect-graph-theorem', '完全グラフ族', '彩色数がクリーク数に等しい族。**補グラフでも保たれる**ことが定理', 'theorem', 'math', ['chromatic-number']),

  // 極値 ── 入らない理由が挙がる場合
  c('extremal-question', '極値問題の形', 'ある形を含まないグラフの辺数の最大値を問う。**答えが密度として定まる**', 'definition', 'math', ['graph']),
  c('mantel-theorem', 'Mantel の定理', '三角形が無いなら辺は半分以下。**等号は完全二部グラフだけ**', 'theorem', 'math', ['extremal-question', 'bipartite']),
  c('turan-theorem', 'Turán の定理', '$K_(r+1)$ を含まない最大辺数と、その唯一の達成例が決まる。**極大化と分類が同時に終わる**', 'theorem', 'math', ['mantel-theorem']),
  c('erdos-stone', 'Erdős–Stone の定理', '密度は禁じた形の彩色数だけで決まる。**二部グラフのときだけ密度が 0 になり、答えが分からなくなる**', 'theorem', 'math', ['turan-theorem', 'chromatic-number']),
  c('ramsey-theorem', 'Ramsey の定理', '十分大きければ、必ず単色の部分が現れる。**完全な無秩序は作れない**', 'theorem', 'math', ['extremal-question']),
  c('ramsey-number-gap', 'Ramsey 数は分かっていない', '上下界が指数の底で食い違う。**存在は易しく、値は難しい**', 'viewpoint', 'math', ['ramsey-theorem']),
  c('szemeredi-regularity', '正則性補題', 'どんなグラフも、有限個の「ほぼ乱択」な組に分けられる。**部分の個数が塔関数で、実用にならないことも定理**', 'theorem', 'math', ['erdos-stone']),

  // 確率的方法 ── 理由が挙がらないとき
  c('probabilistic-method', '確率的方法', '無作為に選んだものが条件を満たす確率が正だと示す。**一つも作らずに存在を言う**', 'technique', 'math', ['expectation', 'probability-space']),
  c('first-moment-method', '一次モーメント法', '期待値が 1 未満なら、0 になる場合が在る。**Ramsey 数の下界はこれ一行**', 'technique', 'math', ['probabilistic-method']),
  c('why-probability-is-needed-here', '確率が要るのは、理由が挙がらないときである', 'Kuratowski は「入らない理由」を二つ挙げた。Ramsey の下界には挙げる理由が無い。**構成が無いことと存在しないことは別**', 'viewpoint', 'math', ['first-moment-method', 'kuratowski-theorem']),
  c('lovasz-local-lemma', 'Lovász 局所補題', '悪い事象がまばらに依存しているだけなら、全部避けられる。**独立性を仮定しないで済む**', 'theorem', 'math', ['probabilistic-method']),
  c('alteration-method', '取り除く方法', 'まず無作為に取り、悪い部分を削る。**確率が正でない場合にも届く**', 'technique', 'math', ['first-moment-method']),
  c('second-moment-threshold', '二次モーメントと閾値', '分散が小さければ、期待値のまわりに集中する。**在るか無いかが急に切り替わる**', 'technique', 'math', ['probabilistic-method', 'moments']),
  c('random-graph-threshold', '乱択グラフの閾値現象', '辺の確率をわずかに上げただけで、性質が 0 から 1 に飛ぶ。**単調な性質には必ず閾値が在る**', 'theorem', 'math', ['second-moment-threshold', 'degree-distribution']),
  c('giant-component', '巨大成分の出現', '平均次数が 1 を越えると、点の定数割合を含む成分が現れる。**分岐過程の生存確率と同じ計算**', 'theorem', 'math', ['random-graph-threshold', 'branching-process-survival']),

  // スペクトル
  c('adjacency-spectrum', '隣接行列のスペクトル', 'グラフを対称行列にする。**固有値が閉路の数を数えている**', 'definition', 'math', ['graph', 'spectral-theorem']),
  c('graph-laplacian', 'グラフ Laplacian', '次数から隣接を引く。**半正定値で、零固有値の重複度が連結成分の個数**', 'theorem', 'math', ['adjacency-spectrum', 'quadratic-form']),
  c('matrix-tree-theorem', '行列木定理', '全域木の本数が、Laplacian の余因子で出る。**数え上げが行列式になる**', 'theorem', 'math', ['graph-laplacian', 'determinant', 'tree-characterizations']),
  c('cheeger-inequality-graph', 'Cheeger 不等式', '二番目に小さい固有値が、切りにくさを両側から挟む。**線形代数が組合せの量を近似する**', 'theorem', 'math', ['graph-laplacian']),
  c('expander-graph', '拡大グラフ', '疎なのに切りにくい。**確率的方法では在ることしか言えなかったが、いまは構成が在る**', 'definition', 'math', ['cheeger-inequality-graph', 'probabilistic-method']),
  c('spectral-gap-mixing', 'スペクトルの隙間が混合時間を決める', '乱歩が一様分布に近づく速さが、第二固有値だけで決まる', 'theorem', 'math', ['expander-graph', 'markov-chain']),
]
