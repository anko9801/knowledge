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
  /**
   * 論理的な依存。定義に現れるか、証明が引用する。文献で確かめられる。
   * 「この順で教わるのが普通」という慣習はここに書かない。
   */
  readonly requires: readonly string[]
  /**
   * 経験的な依存。分野の慣行として必要だが、論理的必然ではない。
   * requires と混ぜると最短経路が慣習で汚染されるので、別の辺にする。
   */
  readonly empirical?: readonly string[]
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
  empirical: readonly string[] = [],
): Concept => ({ id, label, gist, kind, field, requires, empirical })

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
  c('ode-existence', '常微分方程式の解の存在と一意性', '初期値を与えれば解が一意に決まる。証明は縮小写像', 'theorem', 'math', ['multivariable-calculus', 'banach-fixed-point']),

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
  c('tangent-space', '接空間', '曲線の速度、あるいは微分作用素。外の空間が要らない', 'definition', 'math', ['multivariable-calculus', 'vector-space', 'smoothness-class']),
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
  c('manifold', '多様体', '地図の貼り合わせ。1 枚では足りない', 'definition', 'math', ['topology-basics', 'tangent-space', 'smoothness-class']),
  c('atlas', 'アトラス', 'チャートの族と、滑らかな遷移関数', 'definition', 'math', ['manifold']),
  c('orientability', '向き付け可能性', '体積形式が大域的に取れるか。メビウスの帯', 'definition', 'math', ['manifold', 'orientation']),
  c('partition-of-unity', '1 の分割', '局所でできることを大域へ持ち上げる', 'technique', 'math', ['manifold', 'smoothness-class']),
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
  c('geodesic', '測地線', 'まっすぐと最短が一致する', 'definition', 'math', ['levi-civita-connection', 'arc-length', 'ode-existence']),
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

  // --- 数理論理学 -------------------------------------------------------
  c('formalization', '形式化', '証明そのものを数学の対象にする', 'viewpoint', 'math'),
  c('object-vs-metalanguage', '対象言語とメタ言語', '語る側と語られる側を分ける', 'viewpoint', 'math', ['formalization']),
  c('first-order-syntax', '一階述語論理の構文', '項と論理式。意味を与える前の形だけ', 'definition', 'math', ['formalization']),
  c('structure-semantics', '構造と解釈', '記号に具体的な集合と関係を割り当てる', 'definition', 'math', ['first-order-syntax']),
  c('satisfaction', '充足関係', '$M \\models \\varphi$。真であることの定義', 'definition', 'math', ['structure-semantics']),
  c('proof-system', '証明体系', '推論規則の有限な列として証明を定義する', 'definition', 'math', ['first-order-syntax']),
  c('soundness', '健全性', '証明できることは真である', 'theorem', 'math', ['proof-system', 'satisfaction']),
  c('completeness-theorem', '完全性定理', '真であることは証明できる。Henkin の構成', 'theorem', 'math', ['soundness']),
  c('compactness-theorem', 'コンパクト性定理', '有限部分が充足可能なら全体も充足可能', 'theorem', 'math', ['completeness-theorem']),
  c('nonstandard-model', '超準モデル', 'コンパクト性が生む、意図しないモデル', 'definition', 'math', ['compactness-theorem']),
  c('lowenheim-skolem', 'Löwenheim--Skolem の定理', '無限モデルがあれば任意濃度のモデルがある', 'theorem', 'math', ['compactness-theorem', 'cardinal']),
  c('elementary-substructure', '初等部分構造', '同じ論理式を満たす部分構造', 'definition', 'math', ['satisfaction']),
  c('computability', '計算可能性', '手続きで答えが出るとは何か', 'definition', 'math', ['formalization']),
  c('halting-problem', '停止問題', '決定できない問題が存在する', 'theorem', 'math', ['computability']),
  c('godel-numbering', 'ゲーデル数化', '論理式と証明を自然数で符号化する', 'technique', 'math', ['first-order-syntax', 'computability']),
  c('diagonal-lemma', '対角化補題', '自分自身に言及する文が作れる', 'theorem', 'math', ['godel-numbering']),
  c('incompleteness-theorem', '不完全性定理', '無矛盾なら証明も反証もできない文がある', 'theorem', 'math', ['diagonal-lemma', 'proof-system']),
  c('tarski-undefinability', 'Tarski の定理', '真理は同じ言語の中では定義できない', 'theorem', 'math', ['diagonal-lemma', 'satisfaction']),

  // --- 集合論 -----------------------------------------------------------
  c('russell-paradox', 'Russell のパラドックス', '素朴な内包公理が矛盾する', 'theorem', 'math', ['formalization']),
  c('zfc-axioms', 'ZFC 公理系', '集合を作る手続きだけを認める', 'definition', 'math', ['russell-paradox', 'first-order-syntax']),
  c('relation-order', '関係と順序', '順序を集合の言葉で書く', 'definition', 'math', ['zfc-axioms']),
  c('well-order', '整列順序', '空でない部分集合が最小元を持つ', 'definition', 'math', ['relation-order']),
  c('ordinal', '順序数', '整列順序の型。それ自身が集合', 'definition', 'math', ['well-order']),
  c('transfinite-induction', '超限帰納法', '順序数に沿って帰納する', 'technique', 'math', ['ordinal']),
  c('cardinal', '基数', '濃度。全単射があるかどうかで測る', 'definition', 'math', ['ordinal']),
  c('cantor-theorem', 'Cantor の定理', '$|X| < |2^X|$。無限に大きさの差がある', 'theorem', 'math', ['cardinal']),
  c('axiom-of-choice', '選択公理', '選び方を明示せずに選べると認める', 'definition', 'math', ['zfc-axioms']),
  c('zorn-lemma', 'Zorn の補題', '選択公理と同値。極大元の存在', 'theorem', 'math', ['axiom-of-choice', 'well-order']),
  c('cumulative-hierarchy', '累積階層', '$V_\\alpha$ を順序数で積み上げる', 'definition', 'math', ['ordinal', 'zfc-axioms']),
  c('relative-consistency', '相対無矛盾性', '「$T$ が無矛盾なら $T + \\varphi$ も」の形の主張', 'viewpoint', 'math', ['cumulative-hierarchy', 'incompleteness-theorem']),
  c('absoluteness', '絶対性', 'モデルを移しても真偽が変わらない論理式', 'definition', 'math', ['satisfaction', 'cumulative-hierarchy']),
  c('countable-transitive-model', '可算推移モデル', '外から見れば可算な、ZFC のモデル', 'definition', 'math', ['absoluteness', 'lowenheim-skolem']),
  c('constructible-universe', '構成可能宇宙 $L$', '定義できる集合だけを積み上げる', 'definition', 'math', ['cumulative-hierarchy', 'absoluteness']),
  c('forcing', '強制法', '外から集合を付け加えてモデルを広げる', 'technique', 'math', ['countable-transitive-model']),
  c('truth-lemma', '真理補題', '拡大したモデルでの真偽を、元のモデルの中で判定する', 'theorem', 'math', ['forcing']),
  c('continuum-hypothesis', '連続体仮説の独立性', '$L$ と強制法の両方から。証明も反証もできない', 'theorem', 'math', ['constructible-universe', 'truth-lemma', 'cantor-theorem']),
  c('descriptive-set-theory', '記述集合論', '実数の部分集合を、定義の複雑さで階層に分ける', 'definition', 'math', ['ordinal', 'topology-basics']),

  // --- 解析力学（物理） -------------------------------------------------
  c('why-not-force', '力では理論を指定できない', '座標に縛られ、対称性を課す文が書けない', 'viewpoint', 'physics', ['multivariable-calculus']),
  c('action-functional', '作用', '経路に数を割り当てる。局所性から積分の形しか残らない', 'definition', 'physics', ['why-not-force']),
  c('variational-principle', '変分原理', '停留する経路が実現する', 'definition', 'physics', ['action-functional']),
  c('euler-lagrange', 'Euler--Lagrange 方程式', '停留条件を書き下したもの', 'theorem', 'physics', ['variational-principle']),
  c('lagrangian', 'ラグランジアン', '関数 1 本が理論のすべてを決める', 'definition', 'physics', ['euler-lagrange']),
  c('noether-theorem', 'Noether の定理', '対称性があれば保存量がある', 'theorem', 'physics', ['lagrangian', 'lie-group']),
  c('generalized-coordinates', '一般化座標', '拘束を座標の選び方に吸収する', 'definition', 'physics', ['euler-lagrange']),
  c('dalembert-principle', "d'Alembert の原理", '拘束力は仮想変位に仕事をしない。追加の仮定', 'definition', 'physics', ['generalized-coordinates']),
  c('hamiltonian', 'ハミルトニアン', 'Legendre 変換で $L$ から作る、もう一つの書き方', 'definition', 'physics', ['lagrangian']),
  c('canonical-formalism', '正準形式', '相空間の上の流れとして運動を書く', 'viewpoint', 'physics', ['hamiltonian', 'symplectic-form']),
  c('gauge-potential', 'ゲージポテンシャル', '$A_\\mu$。観測量は $F$ だが理論を決めるのは $A$', 'definition', 'physics', ['lagrangian', 'one-form']),
  c('aharonov-bohm', 'Aharonov--Bohm 効果', '力が無いのに位相がずれる。作用の差が測れる', 'theorem', 'physics', ['gauge-potential', 'de-rham-cohomology']),

  // --- 測度と確率 -------------------------------------------------------
  //
  // 依存が定義的に決まる。確率変数の定義に可測性が現れ、
  // 大数の法則の証明が測度の収束定理を引用する。
  c('sigma-algebra', '$\\sigma$ 加法族', '測れる集合の族。可算合併で閉じる', 'definition', 'math', ['zfc-axioms']),
  c('measure', '測度', '$\\sigma$ 加法族の上の可算加法的な非負関数', 'definition', 'math', ['sigma-algebra']),
  c('lebesgue-integral', 'Lebesgue 積分', '単関数で近似して積分を定義する', 'definition', 'math', ['measure']),
  c('convergence-theorems', '収束定理', '単調収束・優収束。極限と積分を交換する', 'theorem', 'math', ['lebesgue-integral']),
  c('probability-space', '確率空間', '全測度が 1 の測度空間', 'definition', 'math', ['measure']),
  c('random-variable', '確率変数', '可測関数。値ではなく写像である', 'definition', 'math', ['probability-space']),
  c('expectation', '期待値', '確率測度による積分', 'definition', 'math', ['random-variable', 'lebesgue-integral']),
  c('independence-probabilistic', '独立性', '同時分布が積に分かれる', 'definition', 'math', ['random-variable']),
  c('law-of-large-numbers', '大数の法則', '標本平均が期待値に収束する', 'theorem', 'math', ['expectation', 'independence-probabilistic', 'convergence-theorems']),
  c('characteristic-function', '特性関数', 'Fourier 変換。分布を一意に決める', 'definition', 'math', ['expectation']),
  c('central-limit-theorem', '中心極限定理', '和の分布が正規分布に近づく', 'theorem', 'math', ['characteristic-function', 'law-of-large-numbers']),
  c('conditional-expectation', '条件付き期待値', '部分 $\\sigma$ 加法族への射影', 'definition', 'math', ['expectation', 'sigma-algebra']),
  c('martingale', 'マルチンゲール', '条件付き期待値が現在値に等しい過程', 'definition', 'math', ['conditional-expectation']),

  // --- 情報理論 ---------------------------------------------------------
  //
  // Shannon の符号化定理は確率論から導かれる。経験則ではない。
  c('entropy', 'Shannon エントロピー', '$-\\sum p \\log p$。不確かさの量', 'definition', 'cs', ['expectation']),
  c('kl-divergence', 'KL 情報量', '二つの分布の隔たり。非負性は Jensen から', 'definition', 'cs', ['entropy']),
  c('mutual-information', '相互情報量', '片方を知ると他方の不確かさがどれだけ減るか', 'definition', 'cs', ['entropy', 'independence-probabilistic']),
  c('aep', '漸近等分割性', '典型列の個数が $2^{n H}$ に集中する', 'theorem', 'cs', ['entropy', 'law-of-large-numbers']),
  c('source-coding-theorem', '情報源符号化定理', '圧縮の限界はエントロピー', 'theorem', 'cs', ['aep']),
  c('channel-capacity', '通信路容量', '相互情報量の最大値', 'definition', 'cs', ['mutual-information']),
  c('channel-coding-theorem', '通信路符号化定理', '容量以下なら誤り率を任意に小さくできる', 'theorem', 'cs', ['channel-capacity', 'aep']),

  // --- 計算量理論 -------------------------------------------------------
  //
  // 依存が「還元」として明示される分野。A ≤ₚ B は requires そのもの。
  c('turing-machine', 'Turing 機械', '計算の形式的な定義', 'definition', 'cs', ['computability']),
  c('complexity-class', '計算量クラス', '資源で問題を分類する。P、NP、PSPACE', 'definition', 'cs', ['turing-machine']),
  c('polynomial-reduction', '多項式時間帰着', '$A \\le_p B$。B が解ければ A も解ける', 'definition', 'cs', ['complexity-class']),
  c('np-completeness', 'NP 完全性', 'NP の中で最も難しい問題', 'definition', 'cs', ['polynomial-reduction']),
  c('cook-levin', 'Cook--Levin の定理', 'SAT は NP 完全。還元の連鎖の出発点', 'theorem', 'cs', ['np-completeness']),
  c('karp-reductions', 'Karp の 21 問題', 'SAT からの還元で NP 完全性が伝播する', 'theorem', 'cs', ['cook-levin']),
  c('time-hierarchy', '時間階層定理', '時間を増やせば解ける問題が増える。対角化', 'theorem', 'cs', ['complexity-class', 'diagonal-lemma']),
  c('space-complexity', '空間計算量', 'PSPACE、Savitch の定理', 'definition', 'cs', ['complexity-class']),
  c('randomized-complexity', '確率的計算量', 'BPP。乱択を許すとどうなるか', 'definition', 'cs', ['complexity-class', 'probability-space']),

  // --- 暗号理論 ---------------------------------------------------------
  //
  // 安全性が「帰着」で定義される。依存が定理の主張に明示的に書かれている。
  c('one-way-function', '一方向性関数', '計算は易しく反転は難しい', 'definition', 'cs', ['complexity-class']),
  c('hardness-assumption', '計算量的仮定', 'DDH、RSA、格子問題。安全性の土台', 'definition', 'cs', ['one-way-function']),
  c('security-reduction', '安全性の帰着', '「仮定が破れないなら安全」の形で証明する', 'viewpoint', 'cs', ['hardness-assumption', 'polynomial-reduction']),
  c('semantic-security', '意味的安全性', '暗号文から平文の情報が漏れない', 'definition', 'cs', ['security-reduction', 'randomized-complexity']),
  c('public-key-encryption', '公開鍵暗号', '鍵を配らずに暗号化する', 'definition', 'cs', ['semantic-security']),
  c('zero-knowledge', 'ゼロ知識証明', '正しさだけを伝え、他は何も伝えない', 'definition', 'cs', ['security-reduction', 'np-completeness']),

  // --- 量子力学（線形代数から論理的に決まる部分） -----------------------
  //
  // 「観測量はエルミート作用素」という要請は、測定値が実数で確率が 1 に
  // 足りてほしいという要求をスペクトル定理に翻訳したもの。導出的な依存である。
  c('hilbert-space', 'Hilbert 空間', '完備な内積空間。無限次元を扱う', 'definition', 'math', ['inner-product', 'completeness']),
  c('quantum-state', '量子状態', 'Hilbert 空間の単位ベクトル', 'definition', 'physics', ['hilbert-space']),
  c('observable', '観測量', '自己随伴作用素。実固有値と正規直交固有基底が要る', 'definition', 'physics', ['quantum-state', 'spectral-theorem']),
  c('born-rule', 'Born 則', '固有状態への射影の 2 乗が確率', 'definition', 'physics', ['observable', 'probability-space']),
  c('uncertainty-relation', '不確定性関係', '交換しない観測量は同時に確定しない', 'theorem', 'physics', ['observable', 'lie-bracket']),
  c('composite-system', '合成系', '状態空間はテンソル積。分解できない状態が残る', 'definition', 'physics', ['quantum-state', 'tensor-product']),
  c('entanglement', '量子もつれ', '単純テンソルでない状態', 'definition', 'physics', ['composite-system']),
  c('quantum-channel', '量子通信路', '完全正値写像。古典の通信路の一般化', 'definition', 'cs', ['composite-system', 'channel-capacity']),

  // --- 解析 -------------------------------------------------------------
  //
  // mathlib の Mathlib.Geometry は外部依存の 76 本が Analysis に向いていた
  // （Topology 39、LinearAlgebra 11）。手で書いたグラフが解析を軽く見ていた
  // ので、ここを足す。滑らかさと収束の階層が、幾何のほぼ全体を支えている。
  c('metric-space', '距離空間', '距離から位相を入れる。近さを数で測る', 'definition', 'math', ['topology-basics']),
  c('completeness', '完備性', 'Cauchy 列が収束する。位相の性質ではない', 'definition', 'math', ['metric-space']),
  c('uniform-convergence', '一様収束', '各点収束より強い。極限が連続性を保つ', 'definition', 'math', ['metric-space']),
  c('banach-space', 'Banach 空間', '完備なノルム空間', 'definition', 'math', ['completeness', 'vector-space']),
  c('banach-fixed-point', '縮小写像の原理', '完備なら不動点が一意に存在する', 'theorem', 'math', ['banach-space']),
  c('function-space', '関数空間', '関数の集合をベクトル空間として扱う', 'definition', 'math', ['banach-space', 'uniform-convergence']),
  c('lp-space', '$L^p$ 空間', '可測関数の空間。完備になる（Riesz--Fischer）', 'definition', 'math', ['function-space', 'lebesgue-integral']),
  c('frechet-derivative', 'Fréchet 微分', '無限次元での最良の線形近似', 'definition', 'math', ['banach-space', 'multivariable-calculus']),
  c('smoothness-class', '滑らかさの階層', '$C^0$、$C^k$、$C^\\infty$、解析的。どこまで微分できるか', 'definition', 'math', ['multivariable-calculus']),
  c('inverse-function-theorem', '逆関数定理', '微分が可逆なら局所的に可逆。証明は縮小写像', 'theorem', 'math', ['banach-fixed-point', 'frechet-derivative']),
  c('implicit-function-theorem', '陰関数定理', '逆関数定理の言い換え。部分多様体を作る道具', 'theorem', 'math', ['inverse-function-theorem']),
  c('sard-theorem', 'Sard の定理', '臨界値は測度ゼロ。横断性の議論を支える', 'theorem', 'math', ['smoothness-class', 'measure']),
  c('distribution-theory', '超関数', '微分できない対象を、試験関数との組で扱う', 'definition', 'math', ['function-space', 'dual-space']),

  // --- 群の表現論 -------------------------------------------------------
  c('group-action', '群作用', '群が集合に作用する。軌道と固定部分群', 'definition', 'math', ['group']),
  c('representation', '表現', '群を線形写像として実現する', 'definition', 'math', ['group-action', 'linear-map']),
  c('irreducible-representation', '既約表現', 'それ以上分解できない表現', 'definition', 'math', ['representation', 'quotient-space']),
  c('schur-lemma', 'Schur の補題', '既約表現の間の準同型は $0$ かスカラー倍', 'theorem', 'math', ['irreducible-representation']),
  c('character-theory', '指標', '表現の跡。基底に依らないので分類に使える', 'definition', 'math', ['irreducible-representation', 'contraction']),
  c('orthogonality-relations', '指標の直交関係', '既約指標が直交基底をなす', 'theorem', 'math', ['character-theory', 'schur-lemma', 'inner-product']),

  // --- 分子対称性と選択則（化学のうち論理で決まる部分） ------------------
  //
  // 「この反応が起きる」は経験的だが、「この遷移は禁制である」は
  // 群論から導かれる。分野ではなくサブ領域で切る例。
  c('point-group', '点群', '分子を不変にする対称操作の群', 'definition', 'chemistry', ['group-action']),
  c('symmetry-adapted-basis', '対称性に適合した基底', '既約表現ごとに軌道を分類する', 'technique', 'chemistry', ['point-group', 'irreducible-representation']),
  c('molecular-orbital', '分子軌道', '原子軌道の線形結合。対称性が混ざり方を決める', 'definition', 'chemistry', ['symmetry-adapted-basis', 'observable']),
  c('selection-rule', '選択則', '遷移積分が対称性から恒等的に $0$ になる条件', 'theorem', 'chemistry', ['symmetry-adapted-basis', 'orthogonality-relations']),
  c('normal-modes', '基準振動', '振動を既約表現で分類する。赤外・Raman 活性', 'technique', 'chemistry', ['point-group', 'spectral-theorem']),

  // --- 形式意味論（言語学のうち論理で決まる部分） ------------------------
  //
  // 「どの統語理論が正しいか」は経験的だが、
  // 「この文の意味をどう組み上げるか」は型付きλ計算で決まる。
  c('lambda-calculus', 'λ 計算', '関数の適用と抽象だけで計算を書く', 'definition', 'cs', ['formalization']),
  c('simply-typed-lambda', '単純型付き λ 計算', '型を付けると停止性が保証される', 'definition', 'cs', ['lambda-calculus']),
  c('curry-howard', 'Curry--Howard 対応', '型は命題、プログラムは証明', 'theorem', 'cs', ['simply-typed-lambda', 'proof-system']),
  c('compositionality', '合成性', '全体の意味は部分の意味と組み方で決まる', 'viewpoint', 'linguistics', ['simply-typed-lambda']),
  c('montague-semantics', 'モンタギュー意味論', '自然文を型付き λ 項に翻訳する', 'technique', 'linguistics', ['compositionality', 'structure-semantics']),
  c('generalized-quantifier', '一般化量化子', '「すべての」「ほとんどの」を集合の集合として扱う', 'definition', 'linguistics', ['montague-semantics']),

  // --- ミクロ経済の一般均衡（経済学のうち論理で決まる部分） --------------
  //
  // 「人はこう行動する」は経験的だが、公理を認めた後の導出は論理的。
  // 均衡の存在は不動点定理そのものである。
  c('preference-relation', '選好関係', '完備で推移的な二項関係', 'definition', 'economics', ['relation-order']),
  c('utility-representation', '効用関数による表現', '選好を実数値関数で書けるための条件', 'theorem', 'economics', ['preference-relation', 'topology-basics']),
  c('demand-function', '需要関数', '予算制約の下での効用最大化の解', 'definition', 'economics', ['utility-representation']),
  c('brouwer-fixed-point', 'Brouwer の不動点定理', '球体の連続自己写像は不動点を持つ', 'theorem', 'math', ['topology-basics', 'homotopy']),
  c('kakutani-fixed-point', '角谷の不動点定理', '集合値写像への拡張', 'theorem', 'math', ['brouwer-fixed-point']),
  c('walras-equilibrium', '一般均衡の存在', '超過需要がゼロになる価格の存在', 'theorem', 'economics', ['demand-function', 'kakutani-fixed-point']),
  c('first-welfare-theorem', '厚生経済学の第一定理', '競争均衡は Pareto 効率的', 'theorem', 'economics', ['walras-equilibrium']),
  c('nash-equilibrium', 'Nash 均衡', '混合戦略なら必ず存在する', 'theorem', 'economics', ['kakutani-fixed-point', 'probability-space']),
  c('arrow-impossibility', 'Arrow の不可能性定理', '望ましい条件を全部満たす集約は独裁だけ', 'theorem', 'economics', ['preference-relation']),

  // --- 制御理論（工学のうち論理で決まる部分） ----------------------------
  c('state-space-model', '状態空間表現', '$\\dot{x} = A x + B u$。線形写像で系を書く', 'definition', 'engineering', ['linear-map', 'ode-existence']),
  c('matrix-exponential', '行列指数関数', '線形系の解。固有値が振る舞いを決める', 'technique', 'engineering', ['state-space-model', 'diagonalization', 'banach-space']),
  c('controllability', '可制御性', '任意の状態へ有限時間で移せるか。階数条件', 'theorem', 'engineering', ['state-space-model']),
  c('observability', '可観測性', '出力から状態を復元できるか。可制御性の双対', 'theorem', 'engineering', ['controllability', 'dual-map']),
  c('lyapunov-stability', 'Lyapunov 安定性', '減っていく関数を一つ見つければ安定', 'theorem', 'engineering', ['matrix-exponential', 'quadratic-form']),
  c('lqr', '最適レギュレータ', '二次形式の評価関数を最小化する。Riccati 方程式', 'technique', 'engineering', ['lyapunov-stability', 'controllability']),
  c('kalman-filter', 'Kalman フィルタ', '観測から状態を推定する。条件付き期待値の逐次計算', 'technique', 'engineering', ['observability', 'conditional-expectation']),

  // --- 経験的な依存しか無い分野の例 -------------------------------------
  //
  // 論理では決まらないが、載せられることを示すために置く。
  // requires は空で、empirical にだけ辺を張る。既定の経路探索には出てこない。
  c('pharmacology', '薬理学', '薬が体でどう働くか', 'viewpoint', 'medicine', [], ['biochemistry', 'physiology']),
  c('biochemistry', '生化学', '生体分子の反応', 'viewpoint', 'medicine', [], ['organic-chemistry']),
  c('physiology', '生理学', '臓器と系の働き', 'viewpoint', 'medicine', [], ['anatomy']),
  c('anatomy', '解剖学', '体の構造', 'viewpoint', 'medicine'),
  c('organic-chemistry', '有機化学', '炭素化合物の反応。規則より事例が多い', 'viewpoint', 'chemistry', [], ['molecular-orbital']),
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
  {
    id: 'incompleteness',
    label: '不完全性定理が読める',
    needs: ['incompleteness-theorem', 'tarski-undefinability'],
  },
  {
    id: 'independence',
    label: '連続体仮説の独立性が読める',
    needs: ['continuum-hypothesis'],
  },
  {
    id: 'analytical-mechanics',
    label: '解析力学が読める',
    needs: ['noether-theorem', 'canonical-formalism'],
  },
  {
    id: 'ab-effect',
    label: 'Aharonov--Bohm 効果が幾何として読める',
    needs: ['aharonov-bohm'],
  },
  {
    id: 'clt',
    label: '中心極限定理が測度論から読める',
    needs: ['central-limit-theorem'],
  },
  {
    id: 'shannon',
    label: 'Shannon の符号化定理が読める',
    needs: ['source-coding-theorem', 'channel-coding-theorem'],
  },
  {
    id: 'np-complete',
    label: 'NP 完全性が読める',
    needs: ['karp-reductions', 'time-hierarchy'],
  },
  {
    id: 'crypto',
    label: '公開鍵暗号の安全性証明が読める',
    needs: ['public-key-encryption', 'zero-knowledge'],
  },
  {
    id: 'quantum',
    label: '量子力学の公理が線形代数から読める',
    needs: ['born-rule', 'entanglement', 'uncertainty-relation'],
  },
  {
    id: 'selection-rules',
    label: '分子の選択則が群論から読める',
    needs: ['selection-rule', 'normal-modes'],
  },
  {
    id: 'formal-semantics',
    label: '自然言語の意味を型で組み上げられる',
    needs: ['montague-semantics', 'generalized-quantifier'],
  },
  {
    id: 'general-equilibrium',
    label: '一般均衡の存在と厚生定理が読める',
    needs: ['first-welfare-theorem', 'arrow-impossibility'],
  },
  {
    id: 'control',
    label: '線形系の制御が読める',
    needs: ['lqr', 'kalman-filter'],
  },
]
