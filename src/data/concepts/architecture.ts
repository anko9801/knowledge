import type { Concept } from './types.ts'
import { c } from './types.ts'

export const architecture: readonly Concept[] = [
  // --- 計算機の構成 ------------------------------------------------------------
  //
  // 「x86 の MOV がこう動く」は Intel がそう書いたからで、概念ではなく事例。
  // 概念として載るのは「なぜその設計になるか」が言える部分だけである。
  // 制約（速い記憶は高い、依存のある命令は重ねられない）を仮定に置けば、
  // そこから先は論理で決まる。人工物そのものは本文の例に回す。
  c('locality', '参照の局所性', 'プログラムは直前に触った場所の近くを触る。観測事実', 'viewpoint', 'cs'),
  c('memory-hierarchy', 'メモリ階層', '局所性を仮定すると、平均アクセス時間は最上位のそれに近づく', 'theorem', 'cs', ['locality']),
  c('amdahl-law', 'Amdahl の法則', '逐次部分が並列化の上限を決める。純粋な算術', 'theorem', 'cs'),
  c('instruction-dependency', '命令間の依存', '実行順を縛るのはデータの依存だけ。依存グラフ', 'definition', 'cs', ['relation-order']),
  c('pipelining', 'パイプライン', '依存が無ければ重ねられる。ハザードは依存の別名', 'technique', 'cs', ['instruction-dependency']),
  c('branch-prediction', '分岐予測', '当てられる上限は分岐列のエントロピー', 'technique', 'cs', ['pipelining', 'entropy']),
  c('ilp-limit', '命令レベル並列の限界', '依存グラフのクリティカルパスより速くならない', 'theorem', 'cs', ['pipelining', 'amdahl-law']),
  c('floating-point', '浮動小数点', '実数を有限個で置き換える。丸めは相対誤差で抑えられ、桁落ちだけが抑えられない', 'definition', 'cs', ['completeness']),
  c('cache-coherence', 'キャッシュ整合性', '同じ番地の複数のコピーが一つに見えること', 'definition', 'cs', ['memory-hierarchy', 'linearizability']),
]
