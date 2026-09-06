import type { Concept } from './types.ts'
import { c } from './types.ts'

export const concurrency: readonly Concept[] = [
  // --- 並行と分散 -------------------------------------------------------------
  //
  // OS もカーネルも人工物だが、「なぜプロセスを分けるのか」「並行の正しさとは
  // 何か」は定理として言える。Linux は事例、相互排除と合意が概念である。
  c('interleaving', 'インタリーブ', '並行実行とは、逐次実行の交錯の全体である', 'definition', 'cs', ['turing-machine']),
  c('mutual-exclusion', '相互排除', '同時に入れない区間。共有メモリだけで作れる（Peterson）', 'theorem', 'cs', ['interleaving']),
  c('deadlock', 'デッドロック', '待ちのグラフに閉路ができること。Coffman の四条件', 'theorem', 'cs', ['mutual-exclusion', 'relation-order']),
  c('linearizability', '線形化可能性', '並行な履歴の正しさを、逐次の履歴に写せるかで定義する', 'definition', 'cs', ['interleaving']),
  c('memory-model', 'メモリモデル', '書き込みがどの順で見えてよいか。逐次一貫性は高くつく', 'definition', 'cs', ['linearizability']),
  c('consensus', '合意', '全員が同じ値を選ぶ。並行の難しさはここに集まる', 'definition', 'cs', ['linearizability']),
  c('consensus-number', '合意数', 'Herlihy の階層。CAS は無限、読み書きだけでは 2 に届かない', 'theorem', 'cs', ['consensus', 'mutual-exclusion']),
  c('flp-impossibility', 'FLP 不可能性', '非同期で 1 台落ちるなら、合意する手続きは存在しない', 'theorem', 'cs', ['consensus']),
  c('process-isolation', 'プロセス分離', '互いに壊せないことを要請すると、アドレス空間を分けることになる', 'viewpoint', 'cs', ['interleaving']),
  c('virtual-memory', '仮想記憶', '番地を写像にする。分離と多重化が同時に手に入る', 'technique', 'cs', ['process-isolation', 'memory-hierarchy']),
  c('crash-consistency', 'クラッシュ整合性', 'いつ落ちても壊れないこと。ログは順序の保証で買う', 'technique', 'cs', ['linearizability']),
  c('read-copy-update', '読む側が何も書かない更新', '更新を差し替えと片付けに割ると、読む側は共有される語に一切書かずに済む', 'technique', 'cs', ['immutability', 'mutual-exclusion']),
  c('quiescent-state', '静穏状態', '読み取り区間の中に居ないことが確実な点。居るかを聞かずに、居ないほうを見る', 'definition', 'cs', ['read-copy-update']),
  c('grace-period', '猶予期間', '全 CPU が一度ずつ静穏状態を通れば、古い参照を持つ者はいない。何度通ったかは要らない', 'theorem', 'cs', ['quiescent-state']),
  c('guarantee-splitting', '保証を割る', 'ロックを外すと正しさを一つの機構では買えなくなる。番地の生存と値の一貫性が別々になる', 'viewpoint', 'cs', ['grace-period', 'linearizability']),
  c('optimistic-fallback', '楽観と落ち先', '速い経路を試し、駄目だと分かった時点で確実な経路へ落ちる。落ち先が無い楽観は使えない', 'technique', 'cs', ['guarantee-splitting']),

  // 正しさを機械に確かめさせる側。形式手法の連載を外したので、こちらへ寄せた。
  // 道具の内部（抽象解釈、SAT、SMT、分離論理）は落として、既にある定理の
  // 続きになる 6 個だけ残してある。「停止する検査器は必ず近似になる」
  // （soundness-completeness-tradeoff）に対して、有限なら全部試せる、
  // ただし有限でも指数で試し切れない、という一本の線がここで閉じる。
  c('transition-system', '遷移系', '状態と遷移だけで書く。プログラムも回路も同じ形に落ちる', 'definition', 'cs', ['interleaving']),
  c('temporal-logic', '時相論理', 'いつかは、ずっと、次に。時間についての述語を書く言葉', 'definition', 'cs', ['transition-system', 'satisfaction']),
  c('safety-vs-liveness', '安全性と活性', '悪いことが起きない、と、良いことがいつか起きる。反例の形が違う', 'definition', 'cs', ['temporal-logic']),
  c('model-checking', 'モデル検査', '状態が有限なら全部試せる。反例が実行の列として出てくる', 'technique', 'cs', ['temporal-logic', 'soundness-completeness-tradeoff']),
  c('state-explosion', '状態爆発', '状態数は変数の個数に対して指数。有限でも試し切れない', 'theorem', 'cs', ['model-checking']),
  c('bisimulation', '双模倣', '外から区別できないこと。互いに真似し合える関係として定義する', 'definition', 'cs', ['transition-system', 'representation-independence']),

  // 取引の正しさ。関係理論の連載を外したので、こちらへ寄せてある。
  // linearizability の上に乗る話なので、もともとこちら側である。
  c('serializability', '直列化可能性', '同時に走る取引の正しさを、逐次の並びに写せるかで定義する', 'definition', 'cs', ['linearizability']),
  c('two-phase-locking', '二相ロック', '取り終わるまで放さない。直列化可能性の十分条件', 'theorem', 'cs', ['serializability', 'mutual-exclusion']),
  c('isolation-levels', '分離水準', '直列化可能性を捨てると、読める嘘の種類が決まる', 'definition', 'cs', ['serializability']),
]
