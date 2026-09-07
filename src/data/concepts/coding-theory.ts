import type { Concept } from './types.ts'
import { c } from './types.ts'

export const codingTheory: readonly Concept[] = [
  // --- 誤り訂正符号 ------------------------------------------------------------
  //
  // **`linear-code` が 1 概念だけ孤立していた。**情報理論に符号化定理が在り、
  // 量子情報に量子符号が在るのに、その間の古典符号が無い。
  //
  // 軸は**「長さ・次元・最小距離の三つは、同時に良くできない」**。
  // Singleton・Hamming・Plotkin が上から押さえ、Gilbert–Varshamov が
  // 下から支える。**規準にまっすぐ合う** ── 何を要求すると要求どうしが
  // 両立しなくなるか、が数として出る。
  //
  // Shannon の符号化定理との関係が、この連載の芯である ──
  // **あちらは「在る」しか言わない。**乱択の平均で示すので、
  // 作り方も、復号の速さも出ない。ここはその隙間を埋める側。
  c('hamming-distance', 'Hamming 距離', '違う位置の個数。**距離の公理を満たす**ので、球や被覆の言葉がそのまま使える', 'definition', 'cs', ['metric-space', 'finite-field']),
  c('minimum-distance-decides', '最小距離が、訂正できる数を決める', '$d$ なら $d-1$ 個を検出し、その半分を訂正できる。**符号の性能が、この一つの数に集約される**', 'theorem', 'cs', ['hamming-distance', 'linear-code']),
  c('generator-and-parity-check', '生成行列と検査行列', '**同じ符号を、像で書くか核で書くか。**二つは互いの零化空間で、双対の関係にある', 'theorem', 'cs', ['linear-code', 'dual-map']),
  c('syndrome-decoding', '症候群復号', '受信語を検査行列に通すと、**送った語に依らず誤りだけが残る。**復号が表引きになる', 'technique', 'cs', ['generator-and-parity-check']),
  c('syndrome-table-is-exponential', '表引きは実用にならない', '**症候群の数が冗長度の指数。**ここから先は、構造を入れて表を作らずに済ませる話になる', 'viewpoint', 'cs', ['syndrome-decoding']),

  // 上下から挟む
  c('singleton-bound', 'Singleton 限界', '最小距離は冗長度に 1 を足した値を超えない。**数え上げだけで出る、いちばん粗い上界**', 'theorem', 'cs', ['minimum-distance-decides']),
  c('mds-codes', '等号を達成する符号がある', 'Reed–Solomon が Singleton の等号を取る。**上界が緩いのではなく、本当に届く**', 'theorem', 'cs', ['singleton-bound']),
  c('hamming-bound', 'Hamming 限界', '訂正できる球が重ならないので、球の体積の和が全体を超えない。**球詰めの問題そのもの**', 'theorem', 'cs', ['minimum-distance-decides']),
  c('perfect-codes-are-classified', '完全符号は、数え上げると尽きている', 'Hamming 限界の等号を取る符号は、Hamming 符号と Golay 符号と自明なものに限る。**分類が終わっている**', 'theorem', 'cs', ['hamming-bound']),
  c('plotkin-bound', 'Plotkin 限界', '距離が長さの半分を超えると、符号語の数が急に制限される。**距離を欲張ると次元が潰れる**', 'theorem', 'cs', ['minimum-distance-decides']),
  c('gilbert-varshamov', 'Gilbert–Varshamov 限界', '**下から支える。**貪欲に選べば必ずこれだけ取れる、という存在の主張', 'theorem', 'cs', ['hamming-bound', 'probabilistic-method']),
  c('gap-is-still-open', '上界と下界の隙間は、埋まっていない', '**二元符号では、どちらが真の値かが 70 年決まっていない。**代数幾何符号が GV を超える場合があることだけは分かっている', 'viewpoint', 'cs', ['gilbert-varshamov', 'singleton-bound']),
  c('shannon-says-existence-only', 'Shannon の定理は、作り方を言わない', '**乱択の平均で示すので、良い符号が在ることしか出ない。**復号が速いかどうかにも触れない', 'viewpoint', 'cs', ['channel-coding-theorem', 'gilbert-varshamov']),

  // 構造を入れる
  c('cyclic-code', '巡回符号', '巡回シフトで閉じると、**符号が多項式環のイデアルになる。**生成多項式ひとつで書ける', 'definition', 'cs', ['linear-code', 'polynomial-ring', 'ideal']),
  c('bch-designed-distance', '距離を、設計して作れる', '連続する冪根を根に持たせると、**最小距離の下界が構成の段階で保証される**', 'theorem', 'cs', ['cyclic-code', 'finite-field-multiplicative-cyclic']),
  c('reed-solomon-is-evaluation', 'Reed–Solomon は多項式の評価である', '$k$ 次未満の多項式を $n$ 点で評価する。**二点で直線が決まる、の一般化**', 'definition', 'cs', ['bch-designed-distance', 'polynomial-interpolation-unique']),
  c('rs-distance-is-the-root-bound', '距離が、根の個数の限界から出る', '**$k$ 次未満の多項式は $k$ 個より多くの零点を持てない。**Singleton の等号がこの一行で出る', 'theorem', 'cs', ['reed-solomon-is-evaluation', 'mds-codes']),
  c('erasure-is-easier-than-error', '消失は誤りより易しい', '**どこが壊れたか分かっていれば、半分の冗長度で済む。**位置の情報が、そのまま符号長の節約になる', 'theorem', 'cs', ['rs-distance-is-the-root-bound']),
  c('interleaving-turns-bursts-into-random', '並べ替えが、連続誤りを散らす', '**符号を強くするのではなく、誤りの型を仮定に合わせる。**CD も QR も同じ手', 'technique', 'cs', ['erasure-is-easier-than-error']),
  c('concatenation', '連接符号', '内符号と外符号を重ねる。**多項式時間の復号で、容量に近づける最初の構成**（Forney）', 'technique', 'cs', ['reed-solomon-is-evaluation', 'shannon-says-existence-only']),

  // 疎な検査で、容量に届く
  c('ldpc-codes', '低密度パリティ検査符号', '検査行列を疎にする。**復号が二部グラフの上のメッセージ伝播になる**', 'definition', 'cs', ['generator-and-parity-check', 'bipartite']),
  c('belief-propagation-is-exact-on-trees', '木の上では、伝播が厳密である', '**閉路があると厳密でなくなる。**それでも動くのは、閉路が長ければ局所的に木に見えるから', 'theorem', 'cs', ['ldpc-codes', 'felsenstein-pruning']),
  c('density-evolution-threshold', '閾値が計算できる', '雑音がある値より小さければ誤り率が 0 へ落ちる。**符号を作る前に、性能が予測できる**', 'theorem', 'cs', ['belief-propagation-is-exact-on-trees', 'random-graph-threshold']),
  c('polar-codes-achieve-capacity', '極符号は、容量を達成すると証明されている', '**変換を繰り返すと、通信路が完全なものと無用なものに分かれる。**存在ではなく構成で容量に届いた最初の符号', 'theorem', 'cs', ['channel-capacity', 'shannon-says-existence-only']),
  c('what-coding-does-not-give', '符号が与えないもの', '**遅れは減らない。**有限長では容量に届かず、その差も定理として分かっている（有限長スケーリング）', 'viewpoint', 'cs', ['polar-codes-achieve-capacity', 'density-evolution-threshold']),
]
