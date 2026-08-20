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
  c('vector-space', 'ベクトル空間', '足せてスカラー倍できる集合。基底と次元', 'definition', 'math', ['field']),
  c('linear-map', '線形写像', '和とスカラー倍を保つ写像', 'definition', 'math', ['vector-space']),
  c('quotient-space', '商空間', '部分空間で割る。同値類をベクトル空間にする', 'definition', 'math', ['vector-space']),
  c('multivariable-calculus', '多変数の微積分', '偏微分、連鎖律、重積分', 'technique', 'math', ['landau-notation']),
  c('topology-basics', '位相の基礎', '開集合、連続、コンパクト、連結', 'definition', 'math'),
  c('homotopy', 'ホモトピー', '連続変形で移り合うこと。可縮性', 'definition', 'math', ['topology-basics', 'connectedness']),
  c('group', '群', '結合的で単位元と逆元を持つ演算', 'definition', 'math'),
  c('symmetric-group', '対称群', '置換の群。符号', 'definition', 'math', ['group']),
  c('ode-existence', '常微分方程式の解の存在と一意性', '初期値を与えれば解が一意に決まる。証明は縮小写像', 'theorem', 'math', ['multivariable-calculus', 'banach-fixed-point']),

  // --- 線形代数 ---------------------------------------------------------
  c('basis-choice', '基底の選択', '基底は無数にあり、どれも同じ資格を持つ', 'viewpoint', 'math', ['vector-space']),
  c('matrix-representation', '行列表示', '写像＋基底の記録。写像そのものではない', 'viewpoint', 'math', ['linear-map', 'basis-choice']),
  c('change-of-basis', '基底変換', '$A \\mapsto P^{-1}AP$', 'technique', 'math', ['matrix-representation']),
  c('invariants-of-a-map', '写像の不変量', '基底を替えても動かないもの。跡、行列式、固有値', 'viewpoint', 'math', ['change-of-basis']),
  c('diagonalization', '対角化', '写像が最も簡単に見える基底を探す', 'technique', 'math', ['invariants-of-a-map', 'characteristic-polynomial']),
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
  c('binomial-dimension', 'k 次交代形式の次元', '交代形式の次元。$1,3,3,1$ の出どころ', 'theorem', 'math', ['alternating-form']),
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
  c('epsilon-delta-identity', 'ε-δ 恒等式', '$\\star\\star = 1$ の成分表示', 'theorem', 'math', ['levi-civita-symbol', 'hodge-star']),
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
  c('k-form', 'k 形式', '各点の交代形式を滑らかに並べたもの', 'definition', 'math', ['one-form', 'alternating-form', 'pullback']),
  c('exterior-derivative', '外微分', '四条件で一意に決まる。計量を使わない', 'definition', 'math', ['k-form', 'wedge-product']),
  c('dd-zero', 'd∘d = 0', '偏微分の順序交換。二つの恒等式の正体', 'theorem', 'math', ['exterior-derivative']),
  c('naturality-of-d', 'd の自然性', '$F^* d = d F^*$。座標に依らないことの強い形', 'theorem', 'math', ['exterior-derivative', 'pullback']),
  c('interior-product', '内部積', '次数を下げる操作 $\\iota_X$', 'definition', 'math', ['k-form', 'vector-field']),
  c('lie-derivative', 'Lie 微分', '流れに沿った変化。Cartan の公式', 'definition', 'math', ['interior-product', 'exterior-derivative', 'lie-bracket']),
  c('closed-vs-exact', '閉形式と完全形式', '完全なら閉。逆は領域の形に依る', 'definition', 'math', ['dd-zero']),
  c('form-basis', '形式の基底', '$dx^{i_1} \\wedge \\cdots$ が $\\Lambda^k$ を張る', 'theorem', 'math', ['k-form', 'binomial-dimension']),
  c('manifold', '多様体', '地図の貼り合わせ。1 枚では足りない', 'definition', 'math', ['topology-basics', 'tangent-space', 'smoothness-class', 'separation-axioms', 'second-countable']),
  c('atlas', 'アトラス', 'チャートの族と、滑らかな遷移関数', 'definition', 'math', ['manifold']),
  c('orientability', '向き付け可能性', '体積形式が大域的に取れるか。メビウスの帯', 'definition', 'math', ['manifold', 'orientation']),
  c('partition-of-unity', '1 の分割', '局所でできることを大域へ持ち上げる', 'technique', 'math', ['manifold', 'bump-function']),
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
  c('rice-theorem', 'Rice の定理', '非自明な意味的性質はすべて決定不能。停止問題の一般化', 'theorem', 'math', ['halting-problem']),
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
  c('constructible-universe', '構成可能宇宙 L', '定義できる集合だけを積み上げる', 'definition', 'math', ['cumulative-hierarchy', 'absoluteness']),
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
  c('sigma-algebra', 'σ 加法族', '測れる集合の族。可算合併で閉じる', 'definition', 'math', ['zfc-axioms']),
  c('measure', '測度', '$\\sigma$ 加法族の上の可算加法的な非負関数', 'definition', 'math', ['sigma-algebra']),
  c('lebesgue-integral', 'Lebesgue 積分', '単関数で近似して積分を定義する', 'definition', 'math', ['measure']),
  c('convergence-theorems', '収束定理', '単調収束・優収束。極限と積分を交換する', 'theorem', 'math', ['lebesgue-integral']),
  c('probability-space', '確率空間', '全測度が 1 の測度空間', 'definition', 'math', ['measure']),
  c('random-variable', '確率変数', '可測関数。値ではなく写像である', 'definition', 'math', ['probability-space']),
  c('expectation', '期待値', '確率測度による積分', 'definition', 'math', ['random-variable', 'lebesgue-integral']),
  c('independence-probabilistic', '独立性', '同時分布が積に分かれる', 'definition', 'math', ['random-variable']),
  c('law-of-large-numbers', '大数の法則', '標本平均が期待値に収束する', 'theorem', 'math', ['expectation', 'independence-probabilistic', 'convergence-theorems', 'concentration-inequality']),
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

  // --- 型と計算 ---------------------------------------------------------
  //
  // 関数型言語はここに落ちる。Haskell も OCaml も処理系という人工物なので
  // 概念ではないが、その中身——評価戦略、型推論、代数的データ型——は
  // λ 計算の定理そのものである。言語仕様ではなく定理の側を概念に採る。
  c('lambda-calculus', 'λ 計算', '関数の適用と抽象だけで計算を書く', 'definition', 'cs', ['formalization']),
  c('church-rosser', 'Church--Rosser の定理', '簡約の順序を変えても行き着く先は一つ', 'theorem', 'cs', ['lambda-calculus']),
  c('evaluation-strategy', '評価戦略', '値呼びと名前呼び。答えは同じでも停止するかが違う', 'viewpoint', 'cs', ['church-rosser']),
  c('simply-typed-lambda', '単純型付き λ 計算', '型を付けると停止性が保証される', 'definition', 'cs', ['lambda-calculus']),
  c('strong-normalization', '強正規化', '型が付けば必ず停止する。だから万能ではなくなる', 'theorem', 'cs', ['simply-typed-lambda', 'halting-problem']),
  c('curry-howard', 'Curry--Howard 対応', '型は命題、プログラムは証明', 'theorem', 'cs', ['simply-typed-lambda', 'proof-system']),
  c('algebraic-data-type', '代数的データ型', '直和と直積。型は代数をなす', 'definition', 'cs', ['simply-typed-lambda']),
  c('polymorphism', '多相', 'System F。型を引数に取る', 'definition', 'cs', ['simply-typed-lambda']),
  c('type-inference', '型推論', 'Hindley--Milner。単一化で型を復元する', 'technique', 'cs', ['polymorphism']),
  c('parametricity', 'パラメトリシティ', '型だけから定理が出る。自由定理', 'theorem', 'cs', ['polymorphism']),
  c('monad', 'モナド', '副作用を型に押し込む。合成の結合律だけが本体', 'definition', 'cs', ['algebraic-data-type', 'polymorphism']),
  c('monad-transformer', 'モナド変換子', '作用を積み重ねる。N 個に対して N^2 個の実装が要る', 'technique', 'cs', ['monad']),
  c('algebraic-effects', '代数的作用', '作用を操作と等式に分解する。再開できる型付き例外', 'definition', 'cs', ['monad-transformer', 'effect-typing']),

  // --- 意味論と圏論 -----------------------------------------------------
  //
  // λ 項に数学的な対象を割り当てようとすると、Sets では詰まる。D ≅ D^D を
  // 満たす集合が一点しかないからである。そこを回避した二つの道が、そのまま
  // 「型を付ける」と「集合をやめる」に対応する。歴史的な偶然ではなく、
  // 同じ 1 つの障害への二つの応答である。
  //
  // 圏論は数学側にも要る（ホモロジー、代数幾何の講義ノートが待っている）が、
  // ここでは Curry--Howard--Lambek まで通す最短の骨だけを置く。
  c('domain-theory', 'ドメイン理論', '$D ≅ D^D$ を満たす対象を作る。底を持つ完備半順序と最小不動点。Scott 1969', 'definition', 'math', ['relation-order', 'lambda-calculus']),
  c('denotational-semantics', '表示的意味論', 'プログラムに数学的対象を割り当てる。構文ではなく指す先で意味を決める', 'viewpoint', 'cs', ['domain-theory']),
  c('category', '圏', '対象と射、恒等射と結合律。中身を見ずに関係だけで話す', 'definition', 'math'),
  c('functor', '関手', '圏から圏への写像。恒等射と合成を保つ', 'definition', 'math', ['category']),
  c('adjunction', '随伴', '$\\mathrm{Hom}(F A, B) ≅ \\mathrm{Hom}(A, G B)$。自由と忘却の対', 'definition', 'math', ['functor']),
  c('cartesian-closed-category', 'デカルト閉圏', '終対象・積・指数対象を持つ。カリー化は積と冪の随伴', 'definition', 'math', ['adjunction']),
  c('curry-howard-lambek', 'Curry--Howard--Lambek 対応', '型付き λ 計算＝直観主義論理＝デカルト閉圏。三つは同じもの', 'theorem', 'cs', ['cartesian-closed-category', 'curry-howard']),

  // --- 認知の制約（プログラムの構成への外部入力、その 1） ----------------
  //
  // 実験結果であって定理ではない。requires は張らず、設計側からは empirical
  // でだけ参照する。既定の経路探索に出てこないのは正しい。「作業記憶は 4±1」
  // から「goto をやめろ」は導けないからである。
  //
  // それでも節点として置くのは、Dijkstra 1968 も Parnas 1972 も Brooks 1986 も、
  // 一次資料が明示的に認知の言葉で書かれているためである。事後の解釈ではない。
  //
  // ここは 1 本ではなく 2 本ある。容量（同時に何個置けるか）と誤り（人は間違え、
  // その間違いは遅く見つかるほど高くつく）は別の事実である。混ぜると、健全性の
  // 動機を容量で説明することになって外れる。型を付ける理由は「忘れるから」では
  // なく「間違えるから」で、実際、依存型は容量をはっきり食う方に倒れている。
  //
  // 誤りの側を認知負荷理論に求めても出てこない。CLT は誤り率を負荷の**指標**
  // として使うだけで、誤りをモデル化していない。誤りの分類は Reason と
  // Rasmussen と Norman、検査器の取捨は Rice の定理の側にある。分けて置く。
  c('working-memory-limit', '作業記憶の限界', '同時に保持できるチャンクは 4±1。Miller の 7±2 から Cowan へ', 'viewpoint', 'cognition'),
  c('chunking', 'チャンク化', '熟達は記憶容量ではなく、まとまりの認識で決まる。Chase--Simon のチェス実験', 'viewpoint', 'cognition', ['working-memory-limit']),
  c('cognitive-load', '認知負荷', '課題本来の負荷と、表現のせいで増えた負荷を分ける。Sweller', 'viewpoint', 'cognition', ['working-memory-limit']),
  c('element-interactivity', '要素間相互作用', 'CLT で唯一の量に近い概念。同時に噛み合う要素の数が本来の難しさを決める', 'definition', 'cognition', ['cognitive-load']),
  c('expertise-reversal', '熟達逆転効果', '初心者を助ける支援が、熟練者には妨げになる。負荷は読み手に相対的', 'theorem', 'cognition', ['chunking', 'cognitive-load']),
  c('simple-vs-easy', '単純と容易', 'Hickey。単純は要素間相互作用が少ないこと、容易は自分のスキーマに合うこと', 'viewpoint', 'cs', ['element-interactivity', 'expertise-reversal']),
  c('error-proneness', '人は間違える', '容量とは別の事実。無限に覚えられても、誤りの率は 0 にならない', 'viewpoint', 'cognition'),
  c('error-taxonomy', '誤りの分類', 'Rasmussen の技能・規則・知識、Reason の slip と mistake。CLT の外にある', 'definition', 'cognition', ['error-proneness']),
  c('feedback-delay', '発覚の遅れ', '同じ誤りでも、遅く見つかるほど直す費用が上がる。認知と経済の継ぎ目', 'viewpoint', 'cognition', ['error-proneness']),

  // --- 経済の制約（外部入力、その 2） ------------------------------------
  //
  // 認知負荷で全部を説明しようとすると、ここが説明できずに潰れる。
  // 「変更に強い」は頭の容量の話ではない。変更が何回来るか、来たとき何箇所
  // 直すことになるか、という費用の話である。Winters「ソフトウェア工学とは
  // 時間で積分したプログラミング」、Beck『Tidy First?』の第 3 部がここ。
  //
  // 面白いことに、入口（変更は来る、費用は割り引かれる）だけが経験的で、
  // そこから先は論理で決まる。波及範囲は結合関係の推移閉包そのものである。
  c('change-over-time', '時間で積分する', '書き捨てなら何でもよい。保守が要るとき初めて設計が費用になる', 'viewpoint', 'cs'),
  c('coupling', '結合', '片方を変えるともう片方も変えねばならない関係。Beck の定義', 'definition', 'cs', ['relation-order'], ['change-over-time']),
  c('change-propagation', '変更の波及', '直す箇所は結合関係の推移閉包。閉路があると全体が 1 つになる', 'theorem', 'cs', ['coupling']),
  c('stable-dependency', '安定依存', '変わりやすいものが、変わりにくいものに依存する向きに揃える', 'viewpoint', 'cs', ['change-propagation', 'information-hiding']),
  c('unidirectional-flow', '単方向フロー', '依存グラフの閉路を切る。TEA と Redux がしていること', 'technique', 'cs', ['change-propagation'], ['cognitive-load']),
  c('optionality', 'オプション価値', '今払って、後で選べる状態を買う。割引現在価値で釣り合いを見る', 'viewpoint', 'cs', ['change-over-time'], ['essential-accidental']),

  // --- プログラムの構成 -------------------------------------------------
  //
  // 「計算機の構成」の対。あちらは機械の制約から設計が決まり、こちらは
  // 人の制約から決まる。どちらも人工物（x86、Haskell）ではなく制約で切る。
  //
  // 認知は動機であって、中身は論理である。goto をやめる根拠は美学ではなく
  // 「進行状況を有限の座標で書けるか」で、Hoare 論理に落ちる。情報隠蔽は
  // 表現独立性に、参照透過性は Church--Rosser に、型検査は健全性定理に落ちる。
  // だから requires は論理側だけに張り、認知へは empirical で繋ぐ。
  c('essential-accidental', '本質的複雑性と偶有的複雑性', 'Brooks。減らせるのは後者だけで、銀の弾丸が無い理由もそこ', 'viewpoint', 'cs', [], ['cognitive-load']),
  c('hoare-logic', 'Hoare 論理', '事前条件と事後条件でプログラムの意味を書く', 'definition', 'cs', ['proof-system']),
  c('loop-invariant', 'ループ不変条件', '繰り返しの意味を 1 本の命題に畳む。頭をリセットしてよい点', 'technique', 'cs', ['hoare-logic']),
  c('structured-programming', '構造化プログラミング', '静的なテキスト位置から動的な進行状況を有限の座標で指せるようにする', 'viewpoint', 'cs', ['loop-invariant'], ['cognitive-load']),
  c('information-hiding', '情報隠蔽', 'モジュールは機能ではなく、隠す決定で切る。Parnas', 'viewpoint', 'cs', [], ['cognitive-load', 'chunking']),
  c('representation-independence', '表現独立性', '実装を替えても外から区別できない。情報隠蔽の定理版', 'theorem', 'cs', ['information-hiding', 'parametricity']),
  c('immutability', '不変性', '値が書き換わらないなら、いま誰が指しているかを追わなくてよい', 'viewpoint', 'cs', [], ['cognitive-load']),
  c('referential-transparency', '参照透過性', '式を値で置き換えてよい。等式で推論できる', 'viewpoint', 'cs', ['church-rosser', 'immutability'], ['cognitive-load']),
  c('effect-typing', '作用の型付け', '読む必要のある範囲を型で宣言する。モナドと作用系', 'technique', 'cs', ['monad', 'referential-transparency']),
  c('type-soundness', '型の健全性', '型が付けば実行時に詰まらない。progress と preservation', 'theorem', 'cs', ['simply-typed-lambda'], ['error-proneness']),
  c('mechanized-checking', '検査の機械化', '人が頭で保っていた不変量を、機械に確かめさせる', 'viewpoint', 'cs', ['type-soundness', 'loop-invariant'], ['cognitive-load', 'feedback-delay']),

  // 検査器の取捨は、心理ではなく決定可能性が決めている。
  //
  // 「落ちない」は非自明な意味的性質なので、Rice の定理から決定不能。だから
  // 停止する検査器は必ず近似になり、どちらへ寄せるかしか選べない。健全性とは
  // 偽陰性を 0 にする側を選ぶことで、その代償に「正しいのに通らない」が必ず残る。
  // 妥協ではなく、曲線上のどこに立つかの選択である。
  //
  // 認知負荷はこの曲線のどこにも印を付けられない。だから動機にはなっても
  // 判定には使えない、という線がここで定理として引ける。
  c('checker-as-classifier', '検査器は分類器である', '通す・弾くの二値。偽陽性は「正しいのに通らない」、偽陰性は「落ちるのに通る」', 'viewpoint', 'cs', ['type-soundness', 'rice-theorem']),
  c('soundness-completeness-tradeoff', '健全性と完全性は両立しない', '停止する検査器は必ずどちらかを捨てる。Rice の定理の系', 'theorem', 'cs', ['checker-as-classifier']),
  c('deliberate-unsoundness', '意図的な不健全性', 'Java の共変配列、TypeScript の any。偽陽性を嫌って偽陰性を受け入れた点', 'viewpoint', 'cs', ['soundness-completeness-tradeoff'], ['cognitive-load']),
  c('types-as-redundancy', '型は冗長性である', '同じことを項と型で二度書き、食い違いを検出する。符号との類比は比喩に留まる', 'viewpoint', 'cs', ['type-soundness'], ['error-taxonomy']),
  c('load-tradeoff', '負荷の配分', '負荷は消えず移るだけ。GC は実行時へ、所有権は記述へ', 'viewpoint', 'cs', ['mechanized-checking'], ['essential-accidental']),
  c('cyclomatic-complexity', '循環的複雑度', '制御フローグラフの独立閉路数。グラフの量であって、認知の量ではない', 'definition', 'cs', ['structured-programming', 'connectedness']),

  // 制約を一本に畳めるか、という問いへの答えをここに置く。
  //
  // 畳める、と言いたくなる。期待変更費用に全部換算できるからである。読む時間も
  // 逃した欠陥の修正費用も計算資源も、割り引いて足せば同じ単位に載る。
  //
  // だが同じ単位に載ることと、一つの原理から導けることは別である。換算率
  // （認知負荷 1 単位が何分か）は理論の外から与えるしかなく、そこが実質を
  // 全部持っていく。上位に載っているだけで、下位を置き換えてはいない。
  //
  // 畳めない理由の方が構造的である。制約の出所が独立だからで、Rice の定理から
  // 作業記憶の容量は出ないし、逆も出ない。独立な外部入力が複数ある系は、
  // 一本の原理には畳めない。好みではなく、そういう形をしている。
  c('expected-change-cost', '期待変更費用', '割り引いて足せば、認知も欠陥も性能も同じ単位に載る。共通の尺度ではある', 'viewpoint', 'cs', ['optionality', 'feedback-delay']),
  c('binding-constraint', '効いている制約', '制約が 1 本しか効かない場所に設計判断は無い。判断は衝突点にだけある', 'viewpoint', 'cs', ['expected-change-cost', 'load-tradeoff', 'soundness-completeness-tradeoff']),

  // --- 関数型は三度導かれる ---------------------------------------------
  //
  // 認知負荷だけで関数型を説明しようとすると弱くなる。「純粋にすると楽」も
  // 「純粋にすると辛い」も同じ理屈で言えてしまい、モナド変換子の N^2 問題や
  // 遅延評価のスペースリークを事前に予測できないからである。
  //
  // 実際には三つの制約が独立に同じ設計へ着く。そこが関数型の強みで、
  // 一本に還元すると、その強みの理由の方が消える。
  //
  //   人の制約   不変性なら、いま誰が指しているかを追わなくてよい
  //   論理の制約 不正な状態を型で作れなくする。健全性とパラメトリシティ
  //   機械の制約 共有可変状態が無ければ、データ競合も無い
  //
  // 論理の制約も「考えなくてよくなる」ので動機は認知側にある。ただし動機と
  // 判定は別で、健全性が成り立つかどうかを認知負荷から決めることはできない。
  // 逆を向く例があるので、そこは deliberate-unsoundness に置いてある。
  //
  // 経済の制約（変更の波及）は情報隠蔽と安定依存に着き、関数型に固有ではない。
  // 純粋性でも代数的データ型でも直接には出てこない。そこは分けて置く。
  c('higher-order-function', '高階関数', 'map と fold は、ループの型に名前を付けたもの。チャンク化の具体形', 'definition', 'cs', ['lambda-calculus'], ['chunking']),
  c('mutable-state-as-goto', '可変状態は goto である', 'Backus 1978。構造化が制御フローで消したものを、データフローで消す', 'viewpoint', 'cs', ['structured-programming', 'referential-transparency'], ['cognitive-load']),
  c('exhaustiveness-checking', '網羅性検査', '場合分けの漏れを機械が見る。直和型があって初めて成り立つ', 'technique', 'cs', ['algebraic-data-type', 'mechanized-checking'], ['feedback-delay']),
  c('illegal-states-unrepresentable', '不正な状態を作れなくする', 'bool 3 つで 8 通りではなく、あり得る 4 通りだけを直和で書く', 'viewpoint', 'cs', ['exhaustiveness-checking', 'type-soundness'], ['error-proneness']),
  c('purity-and-concurrency', '純粋性と並行性', '共有可変状態が無ければ、データ競合も無い。認知ではなく機械の側の理由', 'theorem', 'cs', ['immutability', 'interleaving']),

  // --- 計算機の構成 -----------------------------------------------------
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

  // --- 並行と分散 -------------------------------------------------------
  //
  // OS もカーネルも人工物だが、「なぜプロセスを分けるのか」「並行の正しさとは
  // 何か」は定理として言える。Linux は事例、相互排除と合意が概念である。
  c('interleaving', 'インタリーブ', '並行実行とは、逐次実行の交錯の全体である', 'definition', 'cs', ['turing-machine']),
  c('mutual-exclusion', '相互排除', '同時に入れない区間。共有メモリだけで作れる（Peterson）', 'theorem', 'cs', ['interleaving']),
  c('deadlock', 'デッドロック', '待ちのグラフに閉路ができること。Coffman の四条件', 'theorem', 'cs', ['mutual-exclusion', 'relation-order']),
  c('linearizability', '線形化可能性', '並行な履歴の正しさを、逐次の履歴に写せるかで定義する', 'definition', 'cs', ['interleaving']),
  c('memory-model', 'メモリモデル', '書き込みがどの順で見えてよいか。逐次一貫性は高くつく', 'definition', 'cs', ['linearizability']),
  c('consensus', '合意', '全員が同じ値を選ぶ。並行の難しさはここに集まる', 'definition', 'cs', ['linearizability']),
  c('consensus-number', '合意数', 'Herlihy の階層。CAS は無限、読み書きだけでは 2 に届かない', 'theorem', 'cs', ['consensus', 'mutual-exclusion']),
  c('flp-impossibility', 'FLP 不可能性', '非同期で 1 台落ちるなら、合意する手続きは存在しない', 'theorem', 'cs', ['consensus']),
  c('process-isolation', 'プロセス分離', '互いに壊せないことを要請すると、アドレス空間を分けることになる', 'viewpoint', 'cs', ['interleaving']),
  c('virtual-memory', '仮想記憶', '番地を写像にする。分離と多重化が同時に手に入る', 'technique', 'cs', ['process-isolation', 'memory-hierarchy']),
  c('crash-consistency', 'クラッシュ整合性', 'いつ落ちても壊れないこと。ログは順序の保証で買う', 'technique', 'cs', ['linearizability']),

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
  c('lp-space', 'L^p 空間', '可測関数の空間。完備になる（Riesz--Fischer）', 'definition', 'math', ['function-space', 'lebesgue-integral']),
  c('frechet-derivative', 'Fréchet 微分', '無限次元での最良の線形近似', 'definition', 'math', ['banach-space', 'multivariable-calculus']),
  c('smoothness-class', '滑らかさの階層', '$C^0$、$C^k$、$C^\\infty$、解析的。どこまで微分できるか', 'definition', 'math', ['multivariable-calculus']),
  c('inverse-function-theorem', '逆関数定理', '微分が可逆なら局所的に可逆。証明は縮小写像', 'theorem', 'math', ['banach-fixed-point', 'frechet-derivative']),
  c('implicit-function-theorem', '陰関数定理', '逆関数定理の言い換え。部分多様体を作る道具', 'theorem', 'math', ['inverse-function-theorem']),
  c('sard-theorem', 'Sard の定理', '臨界値は測度ゼロ。横断性の議論を支える', 'theorem', 'math', ['smoothness-class', 'measure']),
  c('distribution-theory', '超関数', '微分できない対象を、試験関数との組で扱う', 'definition', 'math', ['function-space', 'dual-space']),
  c('landau-notation', 'Landau 記号', '$o$ と $O$。微分の定義に使っている', 'definition', 'math', ['metric-space']),
  c('power-series', 'べき級数', '収束半径。項別微分してよい範囲', 'definition', 'math', ['uniform-convergence']),
  c('analytic-function', '解析関数', '各点で Taylor 級数が収束して一致する。$C^\\omega$', 'definition', 'math', ['power-series', 'smoothness-class']),
  c('identity-theorem', '一致の定理', '解析関数は一点の近傍で決まれば全体が決まる', 'theorem', 'math', ['analytic-function']),
  c('bump-function', '山形関数', '$C^\\infty$ でだけ作れる。1 の分割の材料', 'technique', 'math', ['smoothness-class', 'identity-theorem']),

  // --- 位相の続き（mathlib の Topology.Separation / Order / Connected） --
  c('separation-axioms', '分離公理', 'Hausdorff、正則、正規。点をどこまで区別できるか', 'definition', 'math', ['topology-basics']),
  c('second-countable', '第二可算', '可算な基底を持つ。多様体の定義に入る', 'definition', 'math', ['topology-basics']),
  c('connectedness', '連結性', '二つの開集合に分けられない。弧状連結との差', 'definition', 'math', ['topology-basics']),
  c('order-topology', '順序位相', '順序から位相を入れる。実数の位相の出どころ', 'definition', 'math', ['topology-basics', 'relation-order']),
  c('lattice', '束', '任意の二元に上限と下限がある順序集合', 'definition', 'math', ['relation-order']),

  // --- 代数の土台（mathlib の Algebra.Field / Polynomial、RingTheory） --
  c('ring', '環', '足し算と掛け算。掛け算に逆元を要求しない', 'definition', 'math', ['group']),
  c('ideal', 'イデアル', '環の中で割り算をするための部分集合', 'definition', 'math', ['ring']),
  c('field', '体', '零でない元がすべて可逆な環。スカラーの住む場所', 'definition', 'math', ['ring']),
  c('polynomial-ring', '多項式環', '不定元を一つ足した環', 'definition', 'math', ['ring']),
  c('characteristic-polynomial', '固有多項式', '$\\det(A - \\lambda I)$。固有値の定義に使う', 'definition', 'math', ['polynomial-ring', 'determinant']),

  // --- 確率の続き（mathlib の Probability.Distributions / Moments） ------
  c('distribution', '分布', '確率変数が誘導する測度。正規、Poisson、指数', 'definition', 'math', ['random-variable']),
  c('moments', 'モーメント', '平均、分散、高次の積率。分布を特徴づける', 'definition', 'math', ['expectation', 'distribution']),
  c('concentration-inequality', '集中不等式', 'Markov、Chebyshev、Hoeffding。ずれの確率を抑える', 'theorem', 'math', ['moments']),

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
  // λ 計算そのものは「型と計算」に置いてある。ここは言語学側の辺だけ。
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
    id: 'types',
    label: '型が命題であることが分かる',
    needs: ['curry-howard', 'parametricity', 'type-inference'],
  },
  {
    id: 'programs',
    label: 'プログラムの設計が三つの制約から読める',
    needs: ['representation-independence', 'referential-transparency', 'load-tradeoff', 'stable-dependency'],
  },
  {
    id: 'functional',
    label: '関数型が三つの制約から独立に導けると分かる',
    needs: ['mutable-state-as-goto', 'illegal-states-unrepresentable', 'purity-and-concurrency'],
  },
  {
    id: 'checking',
    label: '静的検査の限界が決定可能性から読める',
    needs: ['soundness-completeness-tradeoff', 'deliberate-unsoundness'],
  },
  {
    id: 'lambek',
    label: '型と論理と圏が同じものだと読める',
    needs: ['curry-howard-lambek', 'denotational-semantics'],
  },
  {
    id: 'architecture',
    label: '計算機の設計が制約から読める',
    needs: ['ilp-limit', 'virtual-memory', 'cache-coherence'],
  },
  {
    id: 'concurrency',
    label: '並行の正しさが定義できる',
    needs: ['flp-impossibility', 'consensus-number', 'memory-model'],
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
