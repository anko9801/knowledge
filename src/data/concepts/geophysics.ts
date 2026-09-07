import type { Concept } from './types.ts'
import { c } from './types.ts'

export const geophysics: readonly Concept[] = [
  // --- 地球 --------------------------------------------------------------------
  //
  // 地質学は × だった（記載が本体）。◎ だったのは三つ ──
  // **地球流体力学**（回転が方程式を変える）、**逆問題**（零空間が消えない）、
  // **地震学**（波の型が二つしか無い）。
  //
  // 逆問題の芯は「非一意性は観測不足ではない」。
  // 観測は $N$ 次元、模型空間は無限次元なので、**零空間は必ず無限次元**。
  // そして「最小ノルム解」は結論ではなく、**我々が足した仮定**である。
  //
  // 原典（Backus--Gilbert 1968/1970）には当たれていない。ここの命題は
  // 全部**自分で導いたもの**である（`docs/surveys.md`）。書くときは当たり直す。
  c('rotating-frame-terms', '回転する系で現れる二つの項', '遠心力は勾配に吸収できるが、**Coriolis は速度に依るので吸収できない**。残るのはこちらだけ', 'theorem', 'physics', ['rotating-frame', 'navier-stokes']),
  c('rossby-number', 'Rossby 数', '慣性と Coriolis の比。**小さいときに、以下の全部が成り立つ**', 'definition', 'physics', ['rotating-frame-terms', 'buckingham-pi']),
  c('geostrophic-balance', '地衡風平衡', '圧力勾配と Coriolis が釣り合うと、**流れは勾配を降りずに等圧線に沿う**。加速度が消えている', 'theorem', 'physics', ['rossby-number']),
  c('taylor-proudman', 'Taylor–Proudman の定理', '速く回る非粘性流体では、**流れが回転軸方向に変化しない**。三次元の問題が二次元に落ちる', 'theorem', 'physics', ['geostrophic-balance']),
  c('thermal-wind', '温度風', '水平の温度差が、鉛直の風の差を決める。**二つの平衡を組み合わせただけで出る**', 'theorem', 'physics', ['geostrophic-balance', 'hydrostatic-balance']),
  c('hydrostatic-balance', '静水圧平衡', '鉛直方向は重力と圧力勾配だけで釣り合う。**薄い層であることが根拠**', 'theorem', 'physics', ['navier-stokes']),
  c('potential-vorticity', 'ポテンシャル渦度', '**回転流体の保存量。**層が薄くなれば回転が速くなる、が一つの式に入る', 'theorem', 'physics', ['taylor-proudman', 'vorticity']),
  c('rossby-wave', 'Rossby 波', 'Coriolis 助変数が緯度で変わることだけから、**西向きにしか進まない波**が出る', 'theorem', 'physics', ['potential-vorticity']),
  c('ekman-layer', 'Ekman 層', '摩擦が効く薄い層で、流れの向きが深さとともに回る。**境界層が回転で捻れる**', 'theorem', 'physics', ['geostrophic-balance', 'boundary-layer-thickness-ratio']),
  c('two-dimensional-cascade-reverses', '二次元では、渦がまとまる方へ流れる', '渦度の二乗も保存するので、**エネルギーが大きい渦へ運ばれる**。三次元と向きが逆', 'theorem', 'physics', ['taylor-proudman', 'kolmogorov-cascade']),

  // 逆問題 ── 非一意性が定理として出る
  c('forward-operator', '順問題の作用素', '模型から観測を作る写像。**線形なら積分核との内積で書ける**', 'definition', 'physics', ['linear-map', 'lp-space']),
  c('data-kernel-span', '観測が張る空間は有限次元', '$N$ 回測れば $N$ 本の関数しか張れない。**模型空間は無限次元のまま**', 'theorem', 'physics', ['forward-operator', 'rank-nullity']),
  c('null-space-never-vanishes', '零空間は観測を増やしても消えない', '**非一意性は観測不足ではない。**有限個の測定と無限次元の未知数という、構造の側の話', 'theorem', 'physics', ['data-kernel-span']),
  c('minimum-norm-is-an-assumption', '最小ノルム解は結論ではない', '零空間の中から一つを選ぶのに、**我々が持ち込んだ規準**である。滑らかさを選べば別の答えになる', 'viewpoint', 'physics', ['null-space-never-vanishes']),
  c('regularization-tradeoff', '正則化のトレードオフ', '分解能を上げると分散が上がる。**両方は下げられない**', 'theorem', 'physics', ['minimum-norm-is-an-assumption', 'condition-number']),
  c('resolution-kernel', '分解能核', '推定値が真の模型のどこを平均しているかを表す。**「何が分かったか」を測る量**', 'definition', 'physics', ['regularization-tradeoff']),
  c('checkerboard-test-is-not-proof', '市松模様の復元は保証ではない', 'ある模様が戻ることは、**別の模様が戻ることを何も言わない**。線形なので重ね合わせで済む話ではない', 'viewpoint', 'physics', ['resolution-kernel']),

  // 地震 ── 波の型が二つしか無い
  c('elastic-wave-equation', '弾性体の波動方程式', '線形弾性と運動方程式を合わせるだけ。**媒質の性質は二つの定数に尽きる**（等方なら）', 'theorem', 'physics', ['second-order-classification', 'cauchy-stress']),
  c('p-and-s-waves', '体積波は二種類しか無い', 'Helmholtz 分解で発散と回転に分かれ、**それぞれ別の速さで独立に伝わる**。三つ目は無い', 'theorem', 'physics', ['elastic-wave-equation', 'helmholtz-decomposition']),
  c('s-wave-needs-shear', '液体を S 波が通らない', '**剛性率がゼロなら速度もゼロ。**外核が液体だと分かったのは、この一行から', 'theorem', 'physics', ['p-and-s-waves']),
  c('shadow-zone', '影の帯', '速度が急に下がる境界で屈折すると、届かない角度の帯ができる。**構造が観測の穴として現れる**', 'theorem', 'physics', ['s-wave-needs-shear', 'characteristic-surface']),
  c('travel-time-is-a-line-integral', '走時は経路に沿った線積分', '**だから逆問題が線形になる。**トモグラフィが成り立つ根拠がここに在る', 'theorem', 'physics', ['forward-operator', 'line-integral']),
  c('fermat-makes-it-first-order', '経路の誤差は一次では効かない', 'Fermat の原理で走時が停留値なので、**経路を少し間違えても走時は二次でしか狂わない**', 'theorem', 'physics', ['travel-time-is-a-line-integral', 'variational-principle']),
  c('moment-tensor', 'モーメントテンソル', '震源を対称テンソル一つで表す。**遠くから見ると、断層の形は六つの数にしか残らない**', 'definition', 'physics', ['elastic-wave-equation', 'inertia-tensor']),
  c('focal-mechanism-ambiguity', '断層面は二つのうちどちらか決まらない', '**同じ放射パターンを出す面が二枚ある。**波形だけでは原理的に分けられない', 'theorem', 'physics', ['moment-tensor']),
  c('gutenberg-richter', 'Gutenberg–Richter 則', '規模の対数と個数の対数が直線に乗る。**経験則だが、臨界現象の冪則と同じ形**', 'definition', 'physics', ['scaling-hypothesis']),
  c('magnitude-is-logarithmic', '規模が 1 上がると、エネルギーは 32 倍', '**定義が対数なので、線形の直感が全部外れる**', 'theorem', 'physics', ['gutenberg-richter']),

  // 気候 ── 裏取りが弱い場所を明示する
  c('energy-balance-model', '放射平衡の零次元模型', '入る日射と出る赤外だけで平均気温が出る。**大気を入れないと 33 度低い**', 'definition', 'physics', ['photon-gas']),
  c('albedo-feedback', 'アルベドのフィードバック', '氷が減ると吸収が増え、さらに氷が減る。**符号が正のループ**', 'definition', 'physics', ['energy-balance-model']),
  c('multiple-equilibria-needs-steepness', '平衡が三つになるには、急さが要る', '**「アルベドが単調減少なら三つ」は偽である。**変化が十分急でないと交点は一つ。この閾値を式で書けるかは未確認', 'viewpoint', 'physics', ['albedo-feedback']),
  c('climate-sensitivity-is-a-derivative', '気候感度は微分である', '強制と応答の比。**フィードバックが線形なうちしか意味を持たない**', 'definition', 'physics', ['albedo-feedback']),
]
