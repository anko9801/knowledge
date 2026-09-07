import type { Concept } from './types.ts'
import { c } from './types.ts'

export const mathematicalFinance: readonly Concept[] = [
  // --- 数理ファイナンス --------------------------------------------------------
  //
  // **四つの分類体系が指した**（q-fin.MF / 科研費 07060 / ISCED 0412 / Scopus）。
  // `no-arbitrage` と `state-price` が経済側に在るのに、
  // **確率過程と繋がっていなかった。**
  //
  // 軸は**「何を要求すると、価格が一意に決まるか」**。
  // 無裁定だけでは決まらない ── 決まるのは**測度が在る**ことまでで、
  // 一意になるには市場が完備であることが要る。
  // **二つの基本定理が、その二段をきれいに分ける。**
  //
  // マルチンゲール測度は分離超平面から出る（`docs/decisions.md` の四人目まで）。
  // 整合的リスク尺度が**五人目**である。
  c('self-financing', '自己資金戦略', '外から金を入れずに組み替える。**この制約が無いと、何でも複製できてしまう**', 'definition', 'econ', ['no-arbitrage', 'martingale']),
  c('numeraire-choice', '何を単位に取るかは自由である', '**価格は比でしか意味を持たない。**単位を変えると、どの過程がマルチンゲールかが変わる', 'viewpoint', 'econ', ['self-financing']),
  c('ftap-first', '資産価格付けの第一基本定理', '**無裁定であることと、同値マルチンゲール測度が存在することが同値。**証明は分離超平面', 'theorem', 'econ', ['self-financing', 'state-price', 'hahn-banach-separation']),
  c('ftap-second', '第二基本定理', '**測度が一意であることと、市場が完備であることが同値。**一意でないなら、価格は区間にしかならない', 'theorem', 'econ', ['ftap-first']),
  c('two-theorems-two-questions', '二つの定理は、別の問いに答えている', '**在るかどうかと、一つに決まるかどうか。**無裁定だけでは値段が付かない', 'viewpoint', 'econ', ['ftap-second']),
  c('risk-neutral-is-not-a-belief', 'リスク中立測度は、誰の信念でもない', '**現実の確率と同値なだけで、等しくない。**「投資家がリスク中立だと仮定する」という説明は誤り', 'viewpoint', 'econ', ['ftap-first']),
  c('binomial-model', '二項モデル', '一期間で二状態なら、二つの資産で完備になる。**複製ポートフォリオが連立一次方程式で出る**', 'technique', 'econ', ['ftap-second', 'linear-map']),
  c('replication-not-expectation', '値段は期待値ではなく、複製費用である', '**期待値で価格を決めると裁定が生まれる。**複製できる限り、選好も確率観も入らない', 'theorem', 'econ', ['binomial-model']),

  // 連続時間 ── 確率解析が要る理由
  c('brownian-motion', 'Brown 運動', '独立増分で連続、増分が正規。**ほとんど至る所で微分不可能**なので、普通の微積分が使えない', 'definition', 'econ', ['martingale', 'central-limit-theorem']),
  c('quadratic-variation', '二次変分が消えない', '**これが全部の原因である。**滑らかな関数なら 0 になる量が、Brown 運動では時間そのものになる', 'theorem', 'econ', ['brownian-motion']),
  c('ito-integral', '伊藤積分', '積分点を左端に取ると、マルチンゲールになる。**取り方で答えが変わる**ので、選択が定義の一部', 'definition', 'econ', ['quadratic-variation']),
  c('ito-vs-stratonovich', '左端か中点かは、規約ではなく仮定である', '**伊藤は先読みしないので金融向き、Stratonovich は連鎖律が普通のままなので物理向き。**同じ現象に二つの書き方', 'viewpoint', 'econ', ['ito-integral']),
  c('ito-formula', '伊藤の公式', '**連鎖律に二階の項が付く。**二次変分が消えないことの、そのままの帰結', 'theorem', 'econ', ['ito-integral']),
  c('girsanov', 'Girsanov の定理', '測度を取り替えると、ドリフトだけが変わる。**マルチンゲール測度を実際に作る道具**', 'theorem', 'econ', ['ito-formula', 'ftap-first']),
  c('black-scholes-pde', 'Black–Scholes 方程式', '複製の条件を書き下すと偏微分方程式になる。**期待収益率が式から消える**', 'theorem', 'econ', ['ito-formula', 'replication-not-expectation']),
  c('drift-disappears', '期待収益率が消えることが、この理論の全部である', '**将来の価格の予想が要らない。**予想が要らないから、誰が計算しても同じ値段になる', 'viewpoint', 'econ', ['black-scholes-pde', 'risk-neutral-is-not-a-belief']),
  c('bs-is-the-heat-equation', '変数変換すると熱方程式である', '**放物型なので、時間を逆に解くのは適切でない。**満期から遡って解くのが正しい向き', 'theorem', 'econ', ['black-scholes-pde', 'heat-smoothing']),
  c('feynman-kac', 'Feynman–Kac の公式', '偏微分方程式の解が、確率過程の期待値で書ける。**解析と確率の翻訳**', 'theorem', 'econ', ['bs-is-the-heat-equation', 'brownian-motion']),

  // 仮定が壊れる場所
  c('volatility-smile', '実際の値段は、この式に合わない', '**同じ資産なのに、行使価格ごとに別のボラティリティを入れないと合わない。**正規性の仮定が破れている証拠', 'viewpoint', 'econ', ['drift-disappears']),
  c('jumps-break-completeness', '跳びがあると、完備でなくなる', '**連続な取引では複製できない。**測度が一意でなくなるので、価格が区間になる', 'theorem', 'econ', ['volatility-smile', 'ftap-second']),
  c('incomplete-market-gives-an-interval', '完備でない市場では、価格は区間である', '**上限と下限が超複製と劣複製で決まる。**一つに絞るには、選好を持ち込むしかない', 'theorem', 'econ', ['jumps-break-completeness']),
  c('transaction-costs-make-replication-infinite', '取引費用があると、複製費用が発散する', '**連続に組み替えると、無限回の取引になる。**理想化が破れる場所が計算で見える', 'theorem', 'econ', ['quadratic-variation', 'replication-not-expectation']),

  // リスク尺度 ── 分離超平面の五人目
  c('coherent-risk-measure', '整合的リスク尺度', '単調性・並進不変性・正斉次性・劣加法性の四つを要求する。**リスクの定義を、公理から始める**', 'definition', 'econ', ['convex-set', 'expectation']),
  c('risk-measure-representation', '四公理が、表現定理を出す', '**シナリオ族の上の最悪期待値としてしか書けない。**証明は分離超平面 ── 無裁定と同じ道具', 'theorem', 'econ', ['coherent-risk-measure', 'hahn-banach-separation', 'state-price']),
  c('var-breaks-subadditivity', 'VaR は分散投資を罰する', '**四公理のうち劣加法性だけを破る。**二つに分けると合計のリスクが増える例が作れる', 'theorem', 'econ', ['coherent-risk-measure']),
  c('regulation-uses-the-broken-one', '規制が使ってきたのは、破れているほうである', '**公理を満たす代替（期待ショートフォール）が在ると分かってから、置き換えに十数年かかった**', 'viewpoint', 'econ', ['var-breaks-subadditivity']),
  c('fifth-arrival-at-separation', '分離超平面に、五人目が着いた', '無裁定・塑性崩壊・Dutch book・密度汎関数に続く。**四公理から表現定理が出る形も、同じ定理である**', 'viewpoint', 'econ', ['risk-measure-representation', 'same-theorem-as-no-arbitrage']),
]
