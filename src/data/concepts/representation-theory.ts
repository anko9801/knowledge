import type { Concept } from './types.ts'
import { c } from './types.ts'

export const representationTheory: readonly Concept[] = [
  // --- 表現論 ------------------------------------------------------------------
  //
  // **`schur-lemma` と `character-theory` が置かれたまま、その先が無かった。**
  // 物理側（選択則・粒子の分類・基準振動）が全部これを使っているのに、
  // 分類そのものが書かれていない。
  //
  // 軸は**「分類が本当に終わる、数少ない場所」**。
  // 有限群の既約表現は指標表で尽き、単純 Lie 環は四系列と五個の例外で尽きる。
  // **どちらも「尽きた」ことが定理である。**
  //
  // そして分類が終わるのは、**Killing 形式という一つの双線形形式**が
  // 全部を根系に翻訳するからで、そこから先は Dynkin 図形という
  // 有限個の絵の数え上げになる。
  c('maschke-theorem', 'Maschke の定理', '有限群の表現は既約の直和に分かれる。**標数が群の位数を割らないときに限る**', 'theorem', 'math', ['representation', 'finite-field']),
  c('characters-determine-the-representation', '指標が表現を決める', '**跡だけを見れば、同型かどうかが分かる。**行列の中身は要らない', 'theorem', 'math', ['character-theory', 'orthogonality-relations']),
  c('number-of-irreps-equals-classes', '既約表現の個数は、共役類の個数に等しい', '**群の元を数える問題が、表現を数える問題と一致する。**指標表が正方行列になる理由', 'theorem', 'math', ['characters-determine-the-representation']),
  c('character-table-is-complete', '指標表で、分類が終わる', '**有限群の表現論は、有限個の数の表に尽きる。**それ以上は何も無い', 'viewpoint', 'math', ['number-of-irreps-equals-classes']),
  c('sum-of-squares-of-dimensions', '次元の二乗和が、群の位数になる', '**正則表現を分解するだけで出る。**次元がどれだけ大きくなれるかが、これで縛られる', 'theorem', 'math', ['number-of-irreps-equals-classes']),
  c('induction-and-restriction', '誘導と制限', '部分群の表現を上げ、全体の表現を下げる。**互いに随伴になる**（Frobenius 相互律）', 'theorem', 'math', ['character-table-is-complete', 'subgroup-coset', 'adjunction']),
  c('young-tableaux-classify-symmetric-group', '対称群は、図形で分類される', '**分割ひとつが既約表現ひとつ。**次元まで、鉤の長さの積で計算できる', 'theorem', 'math', ['character-table-is-complete', 'young-diagram']),
  c('burnside-pa-qb', 'Burnside の定理', '**位数が二つの素数の冪の積なら、可解。**群論の主張が、表現論を経由しないと証明できなかった', 'theorem', 'math', ['sum-of-squares-of-dimensions', 'solvable-group']),

  // 連続群 ── コンパクトなら有限群とほぼ同じ
  c('haar-measure', 'Haar 測度', '群の上に、平行移動で不変な測度がただ一つ在る。**有限群の「平均を取る」を連続群へ移す道具**', 'theorem', 'math', ['lie-group', 'measure']),
  c('compactness-restores-finiteness', 'コンパクトなら、有限群の議論が全部生きる', '**Haar 測度で平均が取れるので、Maschke も直交関係もそのまま。**非コンパクトだと壊れる', 'theorem', 'math', ['haar-measure', 'maschke-theorem']),
  c('peter-weyl', 'Peter–Weyl の定理', '**既約表現の行列成分が、群上の $L^2$ の完全系をなす。**Fourier 級数が、円周群の場合である', 'theorem', 'math', ['compactness-restores-finiteness', 'orthonormal-basis-infinite']),
  c('fourier-is-representation-theory', 'Fourier 変換は表現論である', '**可換群の既約表現が一次元で、それが指数関数。**畳み込みが積になるのは、表現の直和分解だから', 'viewpoint', 'math', ['peter-weyl', 'fourier-transform']),
  c('noncompact-groups-need-infinite-dimensions', '非コンパクト群には、有限次元のユニタリ表現が無い', '**Lorentz 群がそう。**場の理論が無限次元の表現を使わざるをえない理由がここに在る', 'theorem', 'math', ['compactness-restores-finiteness', 'poincare-group']),

  // Lie 環 ── 分類が終わる
  c('lie-algebra-linearizes', 'Lie 環は群を線形化したものである', '**群の掛け算という非線形な情報が、括弧という双線形な情報に落ちる**', 'viewpoint', 'math', ['lie-algebra', 'lie-bracket']),
  c('killing-form', 'Killing 形式', '随伴表現の跡で作る対称双線形形式。**群の情報が、一つの二次形式に押し込まれる**', 'definition', 'math', ['lie-algebra-linearizes', 'quadratic-form']),
  c('cartan-criterion', 'Cartan の判定法', '**Killing 形式が非退化であることと、半単純であることが同値。**行列式ひとつで判定できる', 'theorem', 'math', ['killing-form']),
  c('cartan-subalgebra', 'Cartan 部分環', '同時対角化できる、極大な可換部分環。**そこでの固有値が、以降の全部を決める**', 'definition', 'math', ['cartan-criterion', 'diagonalization']),
  c('root-system', '根系', '固有値の集合。**Killing 形式が入るので、根が Euclid 空間のベクトルになる**', 'definition', 'math', ['cartan-subalgebra']),
  c('roots-are-severely-constrained', '根どうしの角度は、有限個しか許されない', '**整数条件から、角度が 90°、120°、135°、150° に限られる。**ここで分類が有限になる', 'theorem', 'math', ['root-system']),
  c('dynkin-diagrams', 'Dynkin 図形', '根系を、点と辺の絵にする。**分類問題が、絵の数え上げになる**', 'definition', 'math', ['roots-are-severely-constrained', 'graph']),
  c('classification-is-four-plus-five', '四系列と、五つの例外で尽きる', '**$A_n, B_n, C_n, D_n$ と $G_2, F_4, E_6, E_7, E_8$。**これで全部で、他に無いことが証明されている', 'theorem', 'math', ['dynkin-diagrams']),
  c('exceptions-are-not-errors', '例外群は、分類の失敗ではない', '**絵として許される形が、たまたま五つ余った。**それぞれ独自の構造を持ち、物理にも出てくる', 'viewpoint', 'math', ['classification-is-four-plus-five']),
  c('weyl-group', 'Weyl 群', '根に垂直な鏡映で生成される有限群。**根系の対称性が、また群になる**', 'definition', 'math', ['root-system', 'symmetry-group-of-a-pattern']),
  c('highest-weight-classifies-irreps', '最高ウェイトが既約表現を分類する', '**優整なウェイト一つに、既約表現が一つ。**無限個の表現が、格子点で番号付けされる', 'theorem', 'math', ['weyl-group', 'point-lattice']),
  c('weyl-dimension-formula', 'Weyl の次元公式', '**次元が、根の内積の積の比で書ける。**表現を作らずに次元だけ計算できる', 'theorem', 'math', ['highest-weight-classifies-irreps']),
  c('weyl-character-formula', 'Weyl の指標公式', '指標が、Weyl 群の交代和で書ける。**有限群の指標表の、連続版**', 'theorem', 'math', ['weyl-dimension-formula', 'character-table-is-complete']),

  // 使われ方 ── 既存へ繋ぐ
  c('classification-is-what-physics-uses', '物理が使っているのは、この分類である', '**Wigner の粒子の分類も、選択則も、基準振動も、既約表現を数え上げているだけ。**分野が違うのは対象で、道具は一つ', 'viewpoint', 'math', ['noncompact-groups-need-infinite-dimensions', 'wigner-classification']),
  c('selection-rules-are-decompositions', '選択則は、テンソル積の分解である', '**積の表現に自明表現が含まれるかどうか。**分子でも原子核でも、判定は同じ計算', 'viewpoint', 'math', ['weyl-character-formula', 'vanishing-integral-theorem']),
  c('clebsch-gordan', 'Clebsch–Gordan 分解', '**表現の積を、既約の直和に分ける。**角運動量の合成が、この特別な場合', 'technique', 'math', ['selection-rules-are-decompositions']),
  c('gauge-groups-come-from-the-classification', 'ゲージ群の候補は、分類が決めている', '**単純 Lie 環が有限個しかないので、選べる対称性も有限個。**標準模型の群も、その表から選ばれている', 'viewpoint', 'math', ['classification-is-four-plus-five', 'gauge-anomaly-cancellation']),
]
