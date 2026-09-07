import type { Concept } from './types.ts'
import { c } from './types.ts'

export const clinical: readonly Concept[] = [
  // --- 医学の数理 --------------------------------------------------------------
  //
  // **生理学は × だが、循環と呼吸の定量は ◎。薬理学は × だが、薬物動態は ◎。**
  // 分けているのは同じ線 ── 「何に効くか」は経験、
  // 「質量保存と一次速度論を仮定したとき濃度がどうなるか」は線形常微分方程式を
  // 解いて出る（`docs/surveys.md`）。
  //
  // **`neyman-pearson` は統計に一つだけ置く。** ここが持つのは
  // 「その定理のどこに動作点を置くか」で、定理そのものではない。
  // 三つの調査が同じものを別々に挙げていた。
  c('compartment-model', '区画モデル', '体を数個のよく混ざった箱と置く。**この仮定が線形性を作っている**', 'definition', 'biology', ['ode-existence', 'quasi-steady-state']),
  c('first-order-elimination', '一次消失', '消える速さが濃度に比例する。**指数関数はここから出るのであって、当てはめではない**', 'theorem', 'biology', ['compartment-model']),
  c('volume-of-distribution', '分布容積', '実在の体積ではない。**投与量と濃度を結ぶ比例定数**で、脂溶性が高いと体積より大きくなる', 'definition', 'biology', ['compartment-model']),
  c('clearance-is-primary', 'クリアランスが基本量である', '半減期は分布容積とクリアランスの比で、**独立に決まる量ではない**。腎機能で動くのはクリアランスのほう', 'theorem', 'biology', ['first-order-elimination', 'volume-of-distribution']),
  c('steady-state-dose-rate', '定常濃度は投与速度とクリアランスだけで決まる', '**半減期は定常値に入らない。**半減期が決めるのは、そこへ届くまでの時間', 'theorem', 'biology', ['clearance-is-primary']),
  c('loading-dose', '負荷投与量', '定常に届く時間は半減期の数倍かかる。**それが待てないとき、分布容積ぶんを先に入れる**', 'technique', 'biology', ['steady-state-dose-rate']),
  c('michaelis-menten-elimination', '飽和すると線形でなくなる', '酵素が飽和すると消失が定数になり、**投与量を少し増やしただけで濃度が発散する**。フェニトインとエタノール', 'theorem', 'biology', ['first-order-elimination', 'michaelis-menten']),
  c('flow-vs-capacity-limited', '肝抽出は二つの型に割れる', '抽出率が高い薬は血流が律速、低い薬は酵素量が律速。**同じ式の二つの極限で、効く介入が逆になる**', 'theorem', 'biology', ['clearance-is-primary']),

  // 循環と呼吸 ── 保存則で閉じる分だけ
  c('fick-principle', 'Fick の原理', '取り込み量を動静脈差で割ると流量が出る。**質量保存だけで、生理の仮定を一つも使わない**', 'theorem', 'biology', ['gradient-flux-laws']),
  c('indicator-dilution', '指示薬希釈法', '注入量を濃度曲線の面積で割る。**Fick の非定常版**', 'technique', 'biology', ['fick-principle']),
  c('cardiac-output-identity', '心拍出量は恒等式である', '一回拍出量と心拍数の積。**測るまでもなく成り立つ**ので、これ自体は何も予測しない', 'viewpoint', 'biology', ['fick-principle']),
  c('starling-mechanism', '前負荷が拍出量を決める', '伸びた分だけ強く縮む。**恒等式に、はじめて経験的な内容が入る場所**', 'definition', 'biology', ['cardiac-output-identity']),
  c('windkessel', 'Windkessel 模型', '弾性と抵抗で拡張期の圧が指数で落ちる。**RC 回路と同じ方程式**', 'theorem', 'biology', ['compartment-model']),
  c('poiseuille-fourth-power', '抵抗は半径の四乗に反比例する', '**半径が 16% 縮むと流量が半分になる。**血管の狭窄が急に効く理由がここに在る', 'theorem', 'biology', ['transport-equation-common-form']),
  c('dead-space-equation', '死腔の式', '呼気の二酸化炭素分圧と動脈の分圧の差から、換気の無駄が出る。**やはり質量保存だけ**', 'theorem', 'biology', ['fick-principle']),
  c('alveolar-gas-equation', '肺胞気式', '吸入酸素分圧から、肺胞での分圧が予測できる。**測った値との差が、拡散か短絡かを分ける**', 'theorem', 'biology', ['dead-space-equation']),
  c('shunt-does-not-respond-to-oxygen', '短絡は酸素を上げても改善しない', '**混ざる血が肺を通らないので、通った側をいくら濃くしても限界が在る。**換気血流不均等とはここで区別が付く', 'theorem', 'biology', ['alveolar-gas-equation']),

  // 診断 ── 定理は統計に在り、ここは動作点の話
  c('prevalence-shifts-posterior', '同じ検査が、集団が変わると別の意味を持つ', '感度と特異度は変わらないのに、陽性的中率が変わる。**検査の性能ではなく事前確率の話**', 'theorem', 'biology', ['conditional-expectation', 'likelihood-ratio-test']),
  c('likelihood-ratio-is-the-invariant', '尤度比は有病率に依らない', '感度と特異度から作れて、事前オッズに掛けるだけで事後オッズになる。**持ち運べる量はこれだけ**', 'theorem', 'biology', ['prevalence-shifts-posterior']),
  c('roc-curve', 'ROC 曲線', '閾値を動かした軌跡。**曲線は検査の性質で、Neyman–Pearson が形を決める。その上のどこに立つかは決めない**', 'definition', 'biology', ['likelihood-ratio-test']),
  c('operating-point-is-a-value-judgment', '動作点は価値判断である', '見逃しと過剰診断の重みが決めるので、**統計の定理からは出ない**。定理が言うのは曲線の形まで', 'viewpoint', 'biology', ['roc-curve']),
  c('screening-changes-the-numerator', '検診は分母も分子も動かす', '早期発見が生存を延ばしたのか、測り始めが早まっただけなのかが、**生存期間だけでは区別できない**', 'viewpoint', 'biology', ['prevalence-shifts-posterior', 'kaplan-meier']),
  c('lead-time-bias', 'リードタイムバイアス', '診断が早まった分だけ生存期間が長く見える。**死亡率で見ないと消えない**', 'theorem', 'biology', ['screening-changes-the-numerator']),
  c('length-bias', '長さバイアス', '進行の遅いものほど検診で捕まりやすい。**捕まえた集団が、もともと予後の良い集団になっている**', 'theorem', 'biology', ['screening-changes-the-numerator']),
  c('immortal-time-bias', '不死時間バイアス', '曝露が定義されるまで死ねない期間を曝露群に数えると、効果が出る。**時間の扱いだけで結論が反転する**', 'theorem', 'biology', ['causal-dag', 'censoring']),
  c('number-needed-to-treat', '治療必要数', '絶対リスク差の逆数。**相対危険度は基準の大きさを隠す**ので、同じ比でも意味が桁違いに変わる', 'definition', 'biology', ['identifiability']),
  c('competing-risks', '競合リスク', '他の原因で死ぬと、目的の事象は起こらない。**打ち切りとして扱うと過大評価になる**', 'theorem', 'biology', ['censoring', 'kaplan-meier']),

  // 感染症
  c('mass-action-incidence', '出会いの仮定', '新規感染が感受性者と感染者の積に比例する。**よく混ざっていることを置いている**', 'definition', 'biology', ['ode-existence', 'compartment-model']),
  c('basic-reproduction-number', '基本再生産数', '次世代行列の最大固有値。**平均ではなく固有値で、構造のある集団では平均と一致しない**', 'definition', 'biology', ['mass-action-incidence', 'perron-frobenius']),
  c('threshold-theorem', '流行の閾値定理', '$R_0$ が 1 を超えるかどうかだけで、流行するかが決まる', 'theorem', 'biology', ['basic-reproduction-number']),
  c('herd-immunity-threshold', '集団免疫閾値', '$1 - 1\\/R_0$ を免疫化すれば実効再生産数が 1 を切る。**全員に届かせる必要は無い**', 'theorem', 'biology', ['threshold-theorem']),
  c('final-size-equation', '最終規模方程式', '**時間を消去すると、最後に何割が感染したかが $R_0$ だけで決まる。**流行曲線の形に依らない', 'theorem', 'biology', ['threshold-theorem']),
  c('overshoot', '行き過ぎ', '閾値に達した時点で流行は止まらない。**最終規模は集団免疫閾値を必ず超える**', 'theorem', 'biology', ['final-size-equation']),
  c('heterogeneity-lowers-the-threshold', '接触の不均一が閾値を下げる', '接触の多い人から先に感染するので、**同じ $R_0$ でも最終規模が小さくなる**。二次モーメントが効く', 'theorem', 'biology', ['basic-reproduction-number', 'degree-distribution']),
  c('r0-is-not-a-property-of-the-pathogen', '$R_0$ は病原体の性質ではない', '接触構造と行動が入っている。**別の集団に持ち込むと別の値になる**', 'viewpoint', 'biology', ['heterogeneity-lowers-the-threshold']),
]
