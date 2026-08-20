/**
 * 概念のデータベース。
 *
 * ここが一次データである。記事があるかどうかとは無関係に、
 * 「何を理解するには何が要るか」だけを書く。
 *
 * 記事はこのグラフへの被覆にすぎない。被覆されていない概念が執筆待ちであり、
 * それを依存順に並べたものが執筆キューになる。
 * 記事から生やしたグラフでは、まだ書いていない領域が見えないので計画に使えない。
 *
 * 辺は論理的な依存だけ。「この順で教わるのが普通」という慣習は書かない。
 * 慣習を混ぜると、計画が既存のカリキュラムをなぞるだけのものになる。
 */

export type ConceptKind =
  /** 定義。何かを名指しできるようになる */
  | 'definition'
  /** 定理。証明を伴う主張 */
  | 'theorem'
  /** 技法。計算できるようになる */
  | 'technique'
  /** 見方。同じ対象の捉え直し */
  | 'viewpoint'

export type Concept = {
  readonly id: string
  readonly label: string
  /** 一行で何か。記事を書くときの主題になる。 */
  readonly gist: string
  readonly kind: ConceptKind
  readonly field: string
  /** これを理解するのに要る概念。慣習は書かない。 */
  readonly requires: readonly string[]
}

/** 到達したい地点。執筆計画はここから逆算する。 */
export type Goal = {
  readonly id: string
  readonly label: string
  readonly needs: readonly string[]
}

const c = (
  id: string,
  label: string,
  gist: string,
  kind: ConceptKind,
  field: string,
  requires: readonly string[] = [],
): Concept => ({ id, label, gist, kind, field, requires })

export const concepts: readonly Concept[] = [
  // --- 土台。まだ記事が無い ---------------------------------------------
  c('vector-space', 'ベクトル空間', '足せてスカラー倍できる集合。基底と次元', 'definition', 'math'),
  c('linear-map', '線形写像', '和とスカラー倍を保つ写像', 'definition', 'math', ['vector-space']),
  c('quotient-space', '商空間', '部分空間で割る。同値類をベクトル空間にする', 'definition', 'math', ['vector-space']),
  c('multivariable-calculus', '多変数の微積分', '偏微分、連鎖律、重積分', 'technique', 'math'),
  c('topology-basics', '位相の基礎', '開集合、連続、コンパクト、連結', 'definition', 'math'),
  c('homotopy', 'ホモトピー', '連続変形で移り合うこと。可縮性', 'definition', 'math', ['topology-basics']),
  c('group', '群', '結合的で単位元と逆元を持つ演算', 'definition', 'math'),
  c('symmetric-group', '対称群', '置換の群。符号', 'definition', 'math', ['group']),
  c('ode-existence', '常微分方程式の解の存在と一意性', '初期値を与えれば解が一意に決まる', 'theorem', 'math', ['multivariable-calculus']),

  // --- 線形代数 ---------------------------------------------------------
  c('basis-choice', '基底の選択', '基底は無数にあり、どれも同じ資格を持つ', 'viewpoint', 'math', ['vector-space']),
  c('matrix-representation', '行列表示', '写像＋基底の記録。写像そのものではない', 'viewpoint', 'math', ['linear-map', 'basis-choice']),
  c('change-of-basis', '基底変換', '$A \\mapsto P^{-1}AP$', 'technique', 'math', ['matrix-representation']),
  c('invariants-of-a-map', '写像の不変量', '基底を替えても動かないもの。跡、行列式、固有値', 'viewpoint', 'math', ['change-of-basis']),
  c('diagonalization', '対角化', '写像が最も簡単に見える基底を探す', 'technique', 'math', ['invariants-of-a-map']),
  c('jordan-form', 'Jordan 標準形', '対角化できないときの限界', 'theorem', 'math', ['diagonalization']),
  c('dual-space', '双対空間', 'ベクトルを食って数を返す写像の全体', 'definition', 'math', ['vector-space', 'linear-map']),
  c('dual-basis', '双対基底', '$e^i(e_j) = \\delta^i_j$', 'definition', 'math', ['dual-space', 'basis-choice']),
  c('natural-isomorphism', '自然な同型', '選択を要さない同型。$V \\cong V^{**}$ はそう、$V \\cong V^*$ は違う', 'viewpoint', 'math', ['dual-basis']),
  c('dual-map', '双対写像', '$f: V \\to W$ に対し $f^*: W^* \\to V^*$。矢印が逆を向く', 'definition', 'math', ['dual-space', 'linear-map']),
  c('multilinear-map', '多重線形写像', '各引数について線形。テンソルの定義', 'definition', 'math', ['dual-space']),
  c('tensor-type', 'テンソルの型', '$(p,q)$ 型。上下の添字の本数', 'definition', 'math', ['multilinear-map', 'dual-basis']),
  c('tensor-product', 'テンソル積', '次元が積になる部屋。分解できない元がある', 'definition', 'math', ['multilinear-map']),
  c('tensor-transformation-law', 'テンソルの変換則', '定義ではなく、基底で書いたときの定理', 'theorem', 'math', ['tensor-type', 'change-of-basis']),
  c('contraction', '縮約', '上下の添字を潰す。基底に依らない。跡はこれ', 'technique', 'math', ['tensor-type']),
  c('symmetric-antisymmetric-decomposition', '対称と反対称への分解', '引き換えは対合なので固有空間に分かれる', 'theorem', 'math', ['tensor-product']),
  c('young-diagram', 'Young 図形', '3 階以上の対称性の分類。対称群の表現', 'theorem', 'math', ['symmetric-antisymmetric-decomposition', 'symmetric-group']),
  c('alternating-form', '交代形式', '入れ替えると符号が変わる多重線形写像', 'definition', 'math', ['symmetric-antisymmetric-decomposition']),
  c('binomial-dimension', '$\\dim \\Lambda^k = \\binom{n}{k}$', '交代形式の次元。$1,3,3,1$ の出どころ', 'theorem', 'math', ['alternating-form']),
  c('wedge-product', '楔積', '交代性を保つ積。$\\alpha \\wedge \\alpha = 0$', 'definition', 'math', ['alternating-form']),
  c('determinant', '行列式', '$\\Lambda^n$ が 1 次元だから定まる。基底に触れない', 'definition', 'math', ['binomial-dimension', 'linear-map']),
  c('signed-volume', '符号付き体積', '行列式は体積の拡大率', 'viewpoint', 'math', ['determinant']),
  c('orientation', '向き', '$\\Lambda^n \\setminus \\{0\\}$ が二つに分かれること', 'definition', 'math', ['determinant']),
  c('jacobian-from-wedge', 'ヤコビアン', '変数変換の行列式は楔積の反対称性から出る', 'theorem', 'math', ['wedge-product', 'determinant']),
  c('inner-product', '内積', '対称非退化な双線形形式。長さと角度', 'definition', 'math', ['multilinear-map']),
  c('signature', '符号数', 'Sylvester の慣性法則。正負の個数は基底に依らない', 'theorem', 'math', ['inner-product', 'diagonalization']),
  c('musical-isomorphism', '添字の上げ下げ', '計量が与える $V \\cong V^*$', 'technique', 'math', ['inner-product', 'natural-isomorphism']),
  c('adjoint', '随伴写像', '内積で定義される転置。基底に依らない', 'definition', 'math', ['inner-product', 'dual-map']),
  c('orthogonal-group', '直交群', '計量を保つ変換。計量を決めると群が決まる', 'definition', 'math', ['inner-product', 'group']),
  c('volume-form', '体積形式', '計量と向きから決まる $\\Lambda^n$ の元', 'definition', 'math', ['inner-product', 'orientation']),
  c('hodge-star', 'Hodge スター', '$\\Lambda^k \\cong \\Lambda^{n-k}$。計量と向きが要る', 'definition', 'math', ['volume-form', 'binomial-dimension']),
  c('self-adjoint', '自己随伴', '$f^\\dagger = f$。正規直交基底で対称行列', 'definition', 'math', ['adjoint']),
  c('spectral-theorem', 'スペクトル定理', '自己随伴なら正規直交固有基底が取れる', 'theorem', 'math', ['self-adjoint', 'diagonalization']),
  c('quadratic-form', '二次形式', '主軸への変換。二次曲面の分類', 'technique', 'math', ['spectral-theorem']),

  // --- ベクトル解析（R^3 の入口） ---------------------------------------
  c('grad-div-curl', 'grad・div・rot', '3 次元の三つの演算子', 'definition', 'math', ['multivariable-calculus']),
  c('cross-product', '外積', '$\\star(a \\wedge b)$。3 次元でしか定義できない', 'definition', 'math', ['grad-div-curl', 'hodge-star']),
  c('pseudovector', '擬ベクトル', '2 形式をベクトルと呼んだもの。鏡で符号が違う', 'viewpoint', 'math', ['cross-product', 'orientation']),
  c('integral-theorems-r3', '三つの積分定理', '勾配定理・Stokes・発散定理', 'theorem', 'math', ['grad-div-curl']),
  c('index-notation', '添字記法', '$\\epsilon_{ijk}$ と縮約で機械的に計算する', 'technique', 'math', ['grad-div-curl', 'volume-form']),
  c('levi-civita-symbol', 'Levi-Civita 記号', '$\\epsilon_{ijk}$。正体は体積形式の成分', 'definition', 'math', ['index-notation', 'volume-form']),
  c('epsilon-delta-identity', '$\\epsilon$-$\\delta$ 恒等式', '$\\star\\star = 1$ の成分表示', 'theorem', 'math', ['levi-civita-symbol', 'hodge-star']),
  c('curvilinear-coordinates', '曲線座標', '極座標や球座標での公式。$\\sqrt{g}$ から出る', 'technique', 'math', ['hodge-star', 'exterior-derivative']),
  c('laplacian', 'Laplacian', '$\\star d \\star d$。計量が要る', 'definition', 'math', ['hodge-star', 'exterior-derivative']),

  // --- 微分形式 ---------------------------------------------------------
  c('tangent-space', '接空間', '曲線の速度、あるいは微分作用素。外の空間が要らない', 'definition', 'math', ['multivariable-calculus', 'vector-space']),
  c('vector-field', 'ベクトル場', '各点に接ベクトルを滑らかに置く', 'definition', 'math', ['tangent-space']),
  c('lie-bracket', 'Lie 括弧', '$[X,Y] = XY - YX$。流れが可換か', 'definition', 'math', ['vector-field']),
  c('cotangent-space', '余接空間', '接空間の双対。1 形式が住む', 'definition', 'math', ['tangent-space', 'dual-space']),
  c('one-form', '1 形式', '曲線の上で積分できるもの。計量が要らない', 'definition', 'math', ['cotangent-space']),
  c('line-integral', '線積分', 'パラメータの取り方に依らない', 'theorem', 'math', ['one-form']),
  c('pullback', '引き戻し', '1 形式はどんな写像でも後ろへ運べる', 'definition', 'math', ['one-form']),
  c('pushforward', '押し出し', '接ベクトルは前へ運べる。ベクトル場は運べない', 'definition', 'math', ['tangent-space']),
  c('k-form', '$k$ 形式', '各点の交代形式を滑らかに並べたもの', 'definition', 'math', ['one-form', 'alternating-form', 'pullback']),
  c('exterior-derivative', '外微分', '四条件で一意に決まる。計量を使わない', 'definition', 'math', ['k-form', 'wedge-product']),
  c('dd-zero', '$d \\circ d = 0$', '偏微分の順序交換。二つの恒等式の正体', 'theorem', 'math', ['exterior-derivative']),
  c('naturality-of-d', '$d$ の自然性', '$F^* d = d F^*$。座標に依らないことの強い形', 'theorem', 'math', ['exterior-derivative', 'pullback']),
  c('interior-product', '内部積', '次数を下げる操作 $\\iota_X$', 'definition', 'math', ['k-form', 'vector-field']),
  c('lie-derivative', 'Lie 微分', '流れに沿った変化。Cartan の公式', 'definition', 'math', ['interior-product', 'exterior-derivative', 'lie-bracket']),
  c('closed-vs-exact', '閉形式と完全形式', '完全なら閉。逆は領域の形に依る', 'definition', 'math', ['dd-zero']),
  c('form-basis', '形式の基底', '$dx^{i_1} \\wedge \\cdots$ が $\\Lambda^k$ を張る', 'theorem', 'math', ['k-form', 'binomial-dimension']),
  c('manifold', '多様体', '地図の貼り合わせ。1 枚では足りない', 'definition', 'math', ['topology-basics', 'tangent-space']),
  c('atlas', 'アトラス', 'チャートの族と、滑らかな遷移関数', 'definition', 'math', ['manifold']),
  c('orientability', '向き付け可能性', '体積形式が大域的に取れるか。メビウスの帯', 'definition', 'math', ['manifold', 'orientation']),
  c('partition-of-unity', '1 の分割', '局所でできることを大域へ持ち上げる', 'technique', 'math', ['manifold']),
  c('integration-of-forms', '形式の積分', '$n$ 形式だけが積分できる。計量は要らない', 'definition', 'math', ['k-form', 'orientability', 'partition-of-unity', 'jacobian-from-wedge']),
  c('boundary', '境界と誘導される向き', '外向きを先頭に置く。$\\partial \\partial = \\emptyset$', 'definition', 'math', ['manifold', 'orientability']),
  c('stokes-theorem', '一般化された Stokes の定理', '$\\int_\\Omega d\\omega = \\int_{\\partial\\Omega} \\omega$', 'theorem', 'math', ['integration-of-forms', 'exterior-derivative', 'boundary']),
  c('poincare-lemma', 'Poincaré の補題', '可縮なら閉形式は完全。局所では必ず解ける', 'theorem', 'math', ['closed-vs-exact', 'homotopy']),
  c('de-rham-cohomology', 'de Rham コホモロジー', '閉と完全の差。空間の穴を数える', 'definition', 'math', ['closed-vs-exact', 'poincare-lemma', 'stokes-theorem']),
  c('mayer-vietoris', 'Mayer--Vietoris', '貼り合わせでコホモロジーを計算する', 'technique', 'math', ['de-rham-cohomology']),
  c('de-rham-theorem', 'de Rham の定理', '解析の $H^*_{dR}$ と位相の $H^*$ が一致する', 'theorem', 'math', ['de-rham-cohomology', 'singular-homology']),
  c('frobenius-integrability', 'Frobenius の可積分性', '$\\omega \\wedge d\\omega = 0$ なら積分因子が取れる', 'theorem', 'math', ['exterior-derivative', 'wedge-product']),
  c('symplectic-form', 'シンプレクティック形式', '閉じた非退化 2 形式。計量ではない構造', 'definition', 'math', ['k-form', 'closed-vs-exact']),

  // --- Riemann 幾何 -----------------------------------------------------
  c('riemannian-metric', 'Riemann 計量', '各点の内積。付加構造であり、常に存在する', 'definition', 'math', ['manifold', 'inner-product']),
  c('arc-length', '弧長', '曲線の長さ。計量から決まる', 'definition', 'math', ['riemannian-metric']),
  c('volume-element', '体積要素', '$\\sqrt{g}$。曲線座標の公式の出どころ', 'definition', 'math', ['riemannian-metric', 'volume-form']),
  c('isometry', '等長写像', '計量を保つ写像', 'definition', 'math', ['riemannian-metric', 'pullback']),
  c('killing-vector', 'Killing ベクトル', '計量の対称性。数えると空間が分類できる', 'definition', 'math', ['isometry', 'lie-derivative']),
  c('tensor-field', 'テンソル場', '各点にテンソルを置く', 'definition', 'math', ['tensor-type', 'manifold']),
  c('partial-is-not-a-tensor', '偏微分はテンソルにならない', '座標変換で余分な項が残る', 'theorem', 'math', ['tensor-field', 'tensor-transformation-law']),
  c('connection', '接続', '離れた点のベクトルを比べる方法。外から決める', 'definition', 'math', ['partial-is-not-a-tensor']),
  c('parallel-transport', '平行移動', '曲線に沿って運ぶ。経路に依る', 'definition', 'math', ['connection', 'ode-existence']),
  c('covariant-derivative', '共変微分', '$\\partial + \\Gamma$。テンソルでない二つを足してテンソルにする', 'technique', 'math', ['connection']),
  c('christoffel-symbol', 'Christoffel 記号', '接続の成分。テンソルではないので座標で消せる', 'definition', 'math', ['covariant-derivative']),
  c('levi-civita-connection', 'Levi-Civita 接続', '計量的かつ捩れなし。これで一意に決まる', 'theorem', 'math', ['connection', 'riemannian-metric']),
  c('normal-coordinates', '正規座標', '一点で $\\Gamma = 0$ にできる', 'theorem', 'math', ['levi-civita-connection']),
  c('geodesic', '測地線', 'まっすぐと最短が一致する', 'definition', 'math', ['levi-civita-connection', 'arc-length']),
  c('exponential-map', '指数写像', '測地線で座標を張る', 'definition', 'math', ['geodesic', 'normal-coordinates']),
  c('geodesic-deviation', '測地線偏差', '近い測地線が離れる率。座標では消せない', 'theorem', 'math', ['geodesic', 'parallel-transport']),
  c('riemann-curvature', 'Riemann 曲率', '平行移動の経路依存性。テンソルになる', 'definition', 'math', ['parallel-transport', 'geodesic-deviation']),
  c('sectional-curvature', '断面曲率', '2 次元の断面で測る。Gauss 曲率の一般化', 'definition', 'math', ['riemann-curvature']),
  c('space-forms', '定曲率空間の分類', '$S^n$、$\\mathbb{R}^n$、$H^n$ の三つしかない', 'theorem', 'math', ['sectional-curvature']),
  c('ricci-tensor', 'Ricci テンソル', '曲率の縮約。測地球の体積の変化率', 'definition', 'math', ['riemann-curvature', 'contraction']),
  c('scalar-curvature', 'スカラー曲率', 'Ricci をもう一度縮約した数', 'definition', 'math', ['ricci-tensor']),
  c('weyl-tensor', 'Weyl テンソル', '残りの成分。$n \\le 3$ では消える', 'definition', 'math', ['ricci-tensor']),
  c('bianchi-identity', 'Bianchi 恒等式', '$\\nabla^\\mu G_{\\mu\\nu} = 0$ が出る', 'theorem', 'math', ['riemann-curvature', 'covariant-derivative']),
  c('einstein-tensor', 'Einstein テンソル', '発散が恒等的に消える組み合わせ。係数は選べない', 'definition', 'math', ['bianchi-identity', 'scalar-curvature']),
  c('bonnet-myers', 'Bonnet--Myers の定理', 'Ricci の下界が直径を抑える。局所が大域を縛る', 'theorem', 'math', ['ricci-tensor', 'geodesic']),
  c('cartan-hadamard', 'Cartan--Hadamard の定理', '$K \\le 0$ なら普遍被覆は $\\mathbb{R}^n$', 'theorem', 'math', ['sectional-curvature', 'homotopy']),
  c('divergence-theorem-riemannian', '発散定理（Riemann 版）', '$\\sqrt{g}$ 込みの部分積分', 'theorem', 'math', ['volume-element', 'stokes-theorem']),
  c('gauss-bonnet', 'Gauss--Bonnet の定理', '曲率の総和が位相不変量になる', 'theorem', 'math', ['sectional-curvature', 'integration-of-forms', 'euler-characteristic']),

  // --- まだ記事の無い先 -------------------------------------------------
  c('singular-homology', '特異ホモロジー', '三角形を貼って穴を数える。位相の側', 'definition', 'math', ['topology-basics', 'homotopy']),
  c('betti-numbers', 'Betti 数', '$b_k = \\dim H^k$。穴の個数', 'definition', 'math', ['de-rham-cohomology']),
  c('euler-characteristic', 'Euler 標数', '$\\chi = \\sum (-1)^k b_k$', 'definition', 'math', ['betti-numbers']),
  c('hodge-theory', 'Hodge 理論', '各コホモロジー類に最も滑らかな代表元が一つ', 'theorem', 'math', ['de-rham-cohomology', 'hodge-star', 'riemannian-metric', 'laplacian']),
  c('vector-bundle', 'ベクトル束', '各点にベクトル空間を付ける。接束の一般化', 'definition', 'math', ['manifold', 'vector-space']),
  c('principal-bundle', '主束', '各点に群を付ける。ゲージ理論の舞台', 'definition', 'math', ['vector-bundle', 'lie-group']),
  c('bundle-connection', '束の接続', '接続を接束から一般の束へ広げる', 'definition', 'math', ['vector-bundle', 'connection']),
  c('characteristic-class', '特性類', '曲率から作った不変式が位相不変量になる', 'definition', 'math', ['bundle-connection', 'de-rham-cohomology']),
  c('lie-group', 'Lie 群', '群であり多様体でもあるもの', 'definition', 'math', ['group', 'manifold']),
  c('lie-algebra', 'Lie 代数', 'Lie 群の単位元での接空間。括弧を持つ', 'definition', 'math', ['lie-group', 'lie-bracket']),
  c('ricci-flow', 'Ricci flow', '$\\partial_t g = -2\\,\\mathrm{Ric}$ で計量を均す', 'technique', 'math', ['ricci-tensor', 'bonnet-myers']),
]

/** 到達したい地点。ここから逆算して執筆計画を作る。 */
export const goals: readonly Goal[] = [
  {
    id: 'stokes',
    label: '一般化された Stokes の定理が読める',
    needs: ['stokes-theorem'],
  },
  {
    id: 'cohomology',
    label: '空間の穴を数えられる',
    needs: ['de-rham-cohomology', 'mayer-vietoris'],
  },
  {
    id: 'curvature-topology',
    label: '曲率が位相を縛ることが分かる',
    needs: ['gauss-bonnet', 'bonnet-myers', 'cartan-hadamard'],
  },
  {
    id: 'gauge',
    label: 'ゲージ理論の幾何が読める',
    needs: ['characteristic-class', 'principal-bundle', 'lie-algebra'],
  },
  {
    id: 'hodge',
    label: 'Hodge 理論が読める',
    needs: ['hodge-theory', 'de-rham-theorem'],
  },
]
