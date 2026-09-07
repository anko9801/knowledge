import type { Concept } from './types.ts'
import { c } from './types.ts'

export const optics: readonly Concept[] = [
  // --- 光学 --------------------------------------------------------------------
  //
  // **五つの分類体系が独立に指した、いちばん太い空白**（MSC 78 / physics.optics /
  // PhySH / 科研費 30020 / Scopus）。電磁気も量子力学もあるのに、その間が空いていた。
  //
  // 軸は**「何を捨てると何が見えるか」の階段**である。位相を捨てると幾何光学、
  // 縦波を捨てると偏光、そして**捨てられないもの**が二つ残る ──
  // エタンデュ（明るさは増やせない）と、因果律から出る Kramers–Kronig。
  //
  // Kramers–Kronig は `causality-is-analyticity`（Titchmarsh）の特殊化である。
  // **制御の Bode の利得位相関係と同じ定理**で、そちらは $ln L$ に当てたもの。
  c('eikonal-limit', '波長を 0 にする極限', '位相の変化が振幅より速いと置くと、波動方程式が一階の方程式に落ちる。**幾何光学は近似であって別の理論ではない**', 'theorem', 'physics', ['wave-from-maxwell', 'method-of-characteristics']),
  c('rays-are-characteristics', '光線は特性曲線である', 'アイコナール方程式の特性曲線がそのまま光線。**「光線」に独立な定義は要らない**', 'theorem', 'physics', ['eikonal-limit']),
  c('fermat-principle', 'Fermat の原理', '光路長が停留値を取る。**最小とは限らない** ── 凹面鏡では極大になる経路がある', 'theorem', 'physics', ['rays-are-characteristics', 'variational-principle']),
  c('snell-from-fermat', '屈折の法則は境界条件である', '界面に沿う方向の位相の連続性から出る。**媒質の性質ではなく、界面が平面であることだけを使う**', 'theorem', 'physics', ['fermat-principle']),
  c('total-internal-reflection', '全反射とエバネッセント波', '透過角が実数でなくなると、界面の外に指数減衰する場が残る。**エネルギーは運ばないが、そこに在る**', 'theorem', 'physics', ['snell-from-fermat']),
  c('lagrange-invariant', 'Lagrange 不変量', '像の大きさと開き角の積が、系のどこでも同じ。**倍率を上げると、必ず角度が狭くなる**', 'theorem', 'physics', ['rays-are-characteristics', 'symplectic-form']),
  c('etendue-conservation', 'エタンデュは保存する', '面積と立体角の積が減らない。**明るさは増やせない。**位相空間の体積保存そのもので、Liouville の定理と同じ内容', 'theorem', 'physics', ['lagrange-invariant', 'liouville-theorem']),
  c('no-concentrator-beats-it', '集光に上限が出る', '**太陽より明るくはできない。**エタンデュ保存が、熱力学の第二法則と同じことを光学の言葉で言っている', 'theorem', 'physics', ['etendue-conservation', 'kelvin-planck-statement']),
  c('aberration-is-not-error', '収差は誤差ではない', '**球面で完全な結像はできない**、という定理の帰結。作りの粗さではなく、面の形が決めている', 'viewpoint', 'physics', ['snell-from-fermat', 'lagrange-invariant']),

  // 波として扱う ── 位相を戻す
  c('huygens-fresnel', 'Huygens–Fresnel 原理', '各点を二次波源と置いて足す。**Kirchhoff の回折積分として、波動方程式から導ける**', 'theorem', 'physics', ['wave-from-maxwell', 'fundamental-solution']),
  c('fraunhofer-is-a-fourier-transform', '遠方の回折像は Fourier 変換である', '**開口の形と像が Fourier 対。**光学系が積分変換を実行している', 'theorem', 'physics', ['huygens-fresnel', 'fourier-transform']),
  c('diffraction-limit', '回折限界', '開口が有限なら、点は点に写らない。**分解能が波長と開口数だけで決まり、レンズの質は関係ない**', 'theorem', 'physics', ['fraunhofer-is-a-fourier-transform']),
  c('limit-is-the-uncertainty-relation', '回折限界は不確定性関係である', '開口の広がりと角度の広がりが Fourier 共役。**同じ不等式を、光学の言葉で書いたもの**', 'viewpoint', 'physics', ['diffraction-limit', 'cramer-rao-is-heisenberg-for-real-amplitudes']),
  c('superresolution-needs-extra-assumptions', '限界を破るには、仮定を足すしかない', '点光源が疎である、蛍光が明滅する、近接場を拾う。**どれも定理を破ってはおらず、別の情報を入れている**', 'viewpoint', 'physics', ['diffraction-limit']),
  c('optical-transfer-function', '光学伝達関数', '結像を線形システムと見ると、伝達関数で書ける。**遮断周波数が回折限界そのもの**', 'definition', 'physics', ['diffraction-limit', 'transfer-function']),
  c('coherence-is-a-correlation', 'コヒーレンスは相関である', '「揃っている」ではなく、場の二点相関の大きさ。**測る二点の取り方で、時間と空間に分かれる**', 'definition', 'physics', ['huygens-fresnel', 'moments']),
  c('van-cittert-zernike', 'van Cittert–Zernike の定理', '**光源の明るさ分布と、遠方での空間コヒーレンスが Fourier 対。**干渉計で星の直径が測れる根拠', 'theorem', 'physics', ['coherence-is-a-correlation', 'fraunhofer-is-a-fourier-transform']),

  // 偏光 ── 二次元の内部自由度
  c('light-is-transverse', '光は横波である', 'Maxwell 方程式で発散が消えることから、自由空間で縦成分が無い。**内部自由度がちょうど 2 次元に決まる**', 'theorem', 'physics', ['wave-from-maxwell']),
  c('jones-calculus', 'Jones 計算', '偏光を 2 成分ベクトル、素子を 2×2 行列と置く。**量子ビットとまったく同じ数学**', 'technique', 'physics', ['light-is-transverse', 'linear-map']),
  c('poincare-sphere', 'Poincaré 球', '偏光の状態が球面上の点になる。**Bloch 球と同じもの**で、偏光子が球上の回転にあたる', 'viewpoint', 'physics', ['jones-calculus', 'quantum-state']),
  c('geometric-phase-optical', '経路が閉じると、位相が残る', '偏光を一周させると、掃いた立体角の半分だけ位相がずれる。**Berry 位相の、測りやすい実例**', 'theorem', 'physics', ['poincare-sphere', 'aharonov-bohm']),
  c('birefringence-from-tensor', '複屈折は誘電率がテンソルだから起きる', '**結晶の対称性が、独立な成分の数を決める。**立方晶では複屈折が原理的に起きない', 'theorem', 'physics', ['light-is-transverse', 'point-group', 'spectral-theorem']),

  // 物質との応答 ── 因果律が形を縛る
  c('dispersion-relation-optical', '分散は応答の遅れである', '振動子模型で、屈折率が周波数に依る。**遅れが在ることと、色が分かれることが同じ**', 'definition', 'physics', ['wave-from-maxwell', 'ode-existence']),
  c('kramers-kronig', 'Kramers–Kronig の関係', '**吸収を全周波数で測れば、屈折率が計算できる。**因果律だけから出て、物質の中身を一切使わない', 'theorem', 'physics', ['dispersion-relation-optical', 'causality-is-analyticity']),
  c('same-theorem-as-bode', '制御の利得位相関係と、同じ定理である', 'どちらも Titchmarsh を当てただけ。**片方は屈折率、片方は $ln L$。**光学を知っていれば、制御の半分は証明済み', 'viewpoint', 'physics', ['kramers-kronig', 'bode-gain-phase-relation']),
  c('sum-rules-optical', '総和則', '高周波での漸近形を足すと、吸収の積分が電子密度だけで決まる。**物質によらない量が一つ残る**', 'theorem', 'physics', ['kramers-kronig']),
  c('anomalous-dispersion-is-not-superluminal', '群速度が光速を超えても、信号は超えない', '**吸収帯の中では群速度が意味を失う。**因果律を破らないことは Kramers–Kronig が保証している', 'viewpoint', 'physics', ['kramers-kronig', 'causal-structure']),

  // 量子光学へ渡す
  c('photon-statistics', '光子数の統計が、光源を区別する', 'コヒーレント光は Poisson、熱光はより広い、単一光子源はより狭い。**平均だけでは光源が決まらない**', 'definition', 'physics', ['photon-gas', 'distribution']),
  c('antibunching-has-no-classical-model', '反バンチングは古典場では作れない', '**二次相関が 1 を下回ることが、場を古典確率過程と見なせないことの証拠**。強度の分散が負になってしまう', 'theorem', 'physics', ['photon-statistics', 'coherence-is-a-correlation']),
  c('laser-is-a-threshold', 'レーザーは閾値現象である', '利得が損失を超える点で、非線形項が振幅を止める。**Hopf 分岐と同じ形**', 'theorem', 'physics', ['dispersion-relation-optical', 'hopf-bifurcation']),
]
