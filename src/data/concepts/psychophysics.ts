import type { Concept } from './types.ts'
import { c } from './types.ts'

export const psychophysics: readonly Concept[] = [
  // --- 精神物理 ----------------------------------------------------------------
  //
  // **色彩と音律が既にあるのに、その下が抜けていた。**
  // あちらは「格子と群が答えを決める」の側で、刺激そのものの構造を扱う。
  // ここは**刺激と感覚を結ぶ層**で、問いが違う ──
  // 何を仮定すると、感覚の大きさが数になるのか。
  //
  // 芯は**「尺度は測定の結果ではなく、何を要求したかで決まる」**。
  // 同じデータから、比例尺度も間隔尺度も出る。どちらになるかは、
  // 一意性の群がどこまで狭いかで決まっていて、それは公理が決める。
  //
  // 心理測定（`psychometrics.ts`）とは層が違う ── あちらは項目と人、
  // こちらは刺激と感覚。信号検出はあちらに家がある。
  c('threshold-is-not-a-point', '閾は点ではない', '同じ刺激が、あるときは見え、あるときは見えない。**閾は分布の要約であって、境界ではない**', 'viewpoint', 'cs', ['two-numbers-not-one', 'distribution']),
  c('psychometric-function', '心理測定関数', '刺激の強さに対する正答率の曲線。**閾はその上の一点を、我々が選んで名前を付けたもの**', 'definition', 'cs', ['threshold-is-not-a-point', 'logistic-model']),
  c('weber-law', 'Weber の法則', '**弁別できる差が、刺激の大きさに比例する。**比が一定で、差は一定でない', 'theorem', 'cs', ['psychometric-function']),
  c('fechner-integration', 'Fechner の積分', '弁別閾を単位として積み上げると、感覚が刺激の対数になる。**Weber を仮定して積分しただけ**', 'theorem', 'cs', ['weber-law']),
  c('fechner-assumes-what-it-proves', 'Fechner は、証明したいことを仮定している', '**「弁別閾はどこでも同じ感覚差にあたる」が追加の仮定。**測っていないし、測れない', 'viewpoint', 'cs', ['fechner-integration']),
  c('stevens-power-law', 'Stevens の冪法則', '直接大きさを答えさせると、対数ではなく冪になる。**指数が感覚の種類ごとに違う**', 'theorem', 'cs', ['fechner-integration']),
  c('log-vs-power-is-about-the-task', '対数か冪かは、何を聞いたかで決まる', '**弁別を積み上げれば対数、直接答えさせれば冪。**どちらが真かではなく、別のものを測っている', 'viewpoint', 'cs', ['stevens-power-law', 'fechner-assumes-what-it-proves']),

  // 測定の表現定理 ── 尺度は要求が決める
  c('empirical-relational-structure', '経験的関係構造', '比較と結合だけを持つ構造。**まだ数は一つも出てきていない**', 'definition', 'cs', ['relation-order']),
  c('representation-theorem-measurement', '測定の表現定理', '弱順序・結合・アルキメデス性を要求すると、加法的な数値表現が存在する。**数が「在る」ことが定理になる**', 'theorem', 'cs', ['empirical-relational-structure']),
  c('uniqueness-theorem-measurement', '一意性定理', '表現が、どの変換の分だけ自由か。**比例尺度は正の定数倍、間隔尺度は一次変換まで**', 'theorem', 'cs', ['representation-theorem-measurement', 'group-action']),
  c('scale-type-is-the-uniqueness-group', '尺度の型とは、一意性の群である', '**名義・順序・間隔・比例は、許される変換の群が狭くなる順。**測り方ではなく、公理が決めている', 'viewpoint', 'cs', ['uniqueness-theorem-measurement']),
  c('meaningfulness', '有意味性', '**一意性の群で不変な命題だけが、意味を持つ。**「気温が 2 倍」が無意味なのは、原点が我々の選択だから', 'theorem', 'cs', ['scale-type-is-the-uniqueness-group']),
  c('conjoint-measurement', '加法的連結測定', '二つの属性が絡む場合。**二重相殺条件を要求すると、加法に分解できる**。結合の操作を一つも使わない', 'theorem', 'cs', ['representation-theorem-measurement']),
  c('this-is-why-scales-are-interval', '心理尺度が間隔尺度に留まる理由', '**加法の操作が定義できないので、比例尺度の一意性が出ない。**能力が 2 倍、が言えないのはここから', 'viewpoint', 'cs', ['conjoint-measurement', 'scale-is-an-interval-at-best']),
  c('utility-is-the-same-theorem', '効用の表現定理も、これである', 'von Neumann–Morgenstern は、くじの上の連結測定。**公理を課すと数が一意に出る、という同じ形**', 'viewpoint', 'cs', ['conjoint-measurement', 'vnm-representation']),

  // 感覚の側 ── 既存の色彩・音律の下
  c('opponent-coding', '反対色の符号化', '三つの錐体の応答を差に組み替える。**赤緑と青黄が同時に見えないのは、差を取っているから**', 'theorem', 'cs', ['trichromacy-is-a-projection', 'linear-map']),
  c('adaptation-is-a-gain-change', '順応は利得の変化である', '**同じ光が、直前に何を見たかで別の色に見える。**受容器ごとに独立に感度が動く（von Kries）', 'theorem', 'cs', ['opponent-coding']),
  c('color-constancy-is-underdetermined', '色恒常性は劣決定である', '**照明と反射率の積しか届かないので、二つに分けられない。**分けるには仮定を足すしかない', 'theorem', 'cs', ['adaptation-is-a-gain-change', 'metamerism-is-a-null-space']),
  c('critical-band', '臨界帯域', 'ある幅の中の音は、まとめて処理される。**周波数分解能が一定でないので、Fourier とは別の分解になる**', 'definition', 'cs', ['coherence-is-a-correlation', 'weber-law']),
  c('roughness-from-beats', '協和の一つの説明は、うなりである', '部分音の差が臨界帯域に入ると粗く聞こえる。**整数比の説明とは別の機構で、予測が食い違う場所がある**', 'theorem', 'cs', ['critical-band', 'consonance-has-two-explanations']),
  c('missing-fundamental', '基音が無くても、その高さが聞こえる', '**スペクトルに無い成分の高さを聞く。**高さは周波数の性質ではなく、パターンの性質である', 'theorem', 'cs', ['critical-band']),
  c('pitch-is-not-frequency', '高さは周波数ではない', '**同じ周波数でも、強さや文脈で聞こえる高さが動く。**音律が乗っている軸は、物理量そのものではない', 'viewpoint', 'cs', ['missing-fundamental', 'pitch-is-logarithmic']),
]
