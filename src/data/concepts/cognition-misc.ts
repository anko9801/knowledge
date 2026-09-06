import type { Concept } from './types.ts'
import { c } from './types.ts'

export const cognitionMisc: readonly Concept[] = [
  // --- 認知の制約（プログラムの構成への外部入力、その 1） ----------------------------------------
  //
  // 実験結果であって定理ではない。requires は張らず、設計側からは empirical
  // でだけ参照する。既定の経路探索に出てこないのは正しい。「作業記憶は 4±1」
  // から「goto をやめろ」は導けないからである。
  //
  // それでも節点として置くのは、Dijkstra 1968 も Parnas 1972 も Brooks 1986 も、
  // 一次資料が明示的に認知の言葉で書かれているためである。事後の解釈ではない。
  //
  // ここは 1 本ではなく 2 本ある。容量（同時に何個置けるか）と誤り（人は間違え、
  // その間違いは遅く見つかるほど高くつく）は別の事実である。混ぜると、健全性の
  // 動機を容量で説明することになって外れる。型を付ける理由は「忘れるから」では
  // なく「間違えるから」で、実際、依存型は容量をはっきり食う方に倒れている。
  //
  // 誤りの側を認知負荷理論に求めても出てこない。CLT は誤り率を負荷の**指標**
  // として使うだけで、誤りをモデル化していない。誤りの分類は Reason と
  // Rasmussen と Norman、検査器の取捨は Rice の定理の側にある。分けて置く。
  c('working-memory-limit', '作業記憶の限界', '同時に保持できるチャンクは 4±1。Miller の 7±2 から Cowan へ', 'viewpoint', 'cognition'),
  c('chunking', 'チャンク化', '熟達は記憶容量ではなく、まとまりの認識で決まる。Chase–Simon のチェス実験', 'viewpoint', 'cognition', ['working-memory-limit']),
  c('nesting-depth', '分岐は条件の倍を数えさせる', '深さ d では、成り立つ条件 d 個と開いている区画 d 個を保持する', 'theorem', 'cs', ['working-memory-limit']),
  c('early-return', '先に閉じて戻る', '区画を開かずに条件だけを足す。保持する個数が半分になる代わりに、命題が残り全体へ効き続ける', 'viewpoint', 'cs', ['nesting-depth']),
  c('cognitive-load', '認知負荷', '課題本来の負荷と、表現のせいで増えた負荷を分ける。Sweller', 'viewpoint', 'cognition', ['working-memory-limit']),
  c('element-interactivity', '要素間相互作用', 'CLT で唯一の量に近い概念。同時に噛み合う要素の数が本来の難しさを決める', 'definition', 'cognition', ['cognitive-load']),
  c('expertise-reversal', '熟達逆転効果', '初心者を助ける支援が、熟練者には妨げになる。負荷は読み手に相対的', 'theorem', 'cognition', ['chunking', 'cognitive-load']),
  c('simple-vs-easy', '単純と容易', 'Hickey。単純は要素間相互作用が少ないこと、容易は自分のスキーマに合うこと', 'viewpoint', 'cs', ['element-interactivity', 'expertise-reversal']),
  c('error-proneness', '誤りは混じる', '容量とは別の事実。すべて覚えていられても、混入する率は 0 にならない', 'viewpoint', 'cognition'),
  c('error-taxonomy', '誤りの分類', 'Rasmussen の技能・規則・知識、Reason の slip と mistake。CLT の外にある', 'definition', 'cognition', ['error-proneness']),
  c('feedback-delay', '発覚の遅れ', '同じ誤りでも、遅く見つかるほど直す費用が上がる。認知と経済の継ぎ目', 'viewpoint', 'cognition', ['error-proneness']),
]
