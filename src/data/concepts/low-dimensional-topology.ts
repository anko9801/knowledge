import type { Concept } from './types.ts'
import { c } from './types.ts'

export const lowDimensionalTopology: readonly Concept[] = [
  // --- 低次元トポロジー --------------------------------------------------------
  //
  // 軸は**「同じ問いを次元ごとに立てると、答えの形が次元で変わる」**。
  // 2 次元では分類が終わる。3 次元では幾何が決める。
  // 4 次元では位相と滑らかさが割れる。5 次元以上では手術が効いて、また終わる。
  //
  // **4 次元が例外である理由が、$2 + 2 < n$ という不等式一本で出る** ──
  // Whitney の円板を押しのけるのに、$p$ 次元と $q$ 次元の交わりが
  // $p + q - n$ 次元になることを使う。既存の `weyl-tensor`（$n <= 3$ で消える）、
  // `two-dimensional-cascade-reverses`、`where-mean-field-fails-is-known` と
  // 同じ棚に入る。
  //
  // 結び目の側は「何を要求すると計算できるか」と「何を区別できるか」の交換で、
  // **最後の回で三つが合流する** ── 第 2 回で計算した符号数と Alexander 多項式が、
  // そのまま 4 次元での障害になっている。
  c('knot-diagram', '結び目図式と Reidemeister 移動', '**三つの手で移り合う図式は同じ結び目。**不変量を作る問題が、有限個の規則の検証になる', 'definition', 'math', ['fundamental-group', 'homotopy']),
  c('tricoloring', '三彩色', '**三つの手で保たれる量を一つ作るだけで、三葉結び目がほどけないと言える**', 'theorem', 'math', ['knot-diagram']),
  c('finite-colorings-are-weak', '有限の色では、足りない', '**区別できない対がすぐ出る。**不変量の強さを測る、という問いがここで立つ', 'viewpoint', 'math', ['tricoloring']),
  c('seifert-surface', 'Seifert 曲面', '**どの結び目にも、向き付け可能な曲面が張れる。**種数が複雑さの尺度になる', 'theorem', 'math', ['knot-diagram', 'surface-classification', 'orientability']),
  c('seifert-matrix-gives-two-invariants', '行列一つから、二つの不変量が出る', '**Alexander 多項式は行列式、符号数は対称化した行列の符号数。**どちらも計算が閉じる', 'theorem', 'math', ['seifert-surface', 'signature', 'determinant']),
  c('alexander-does-not-detect', 'Alexander は自明結び目を検出しない', '**多項式が 1 なのに、ほどけない結び目が在る**（Kinoshita–Terasaka、Conway。どちらも 11 交点）', 'theorem', 'math', ['seifert-matrix-gives-two-invariants']),
  c('jones-polynomial', 'Jones 多項式', 'Kauffman 括弧を writhe で正規化する。**Alexander が区別しない鏡像を区別する** ── 三葉結び目はキラル', 'theorem', 'math', ['knot-diagram', 'alexander-does-not-detect']),
  c('jones-unknot-problem-is-open', 'Jones が自明結び目を検出するかは、未解決', '**24 交点までは反例が無い**（Tuzun–Sikora 2020）。絡み目では反例が在る', 'viewpoint', 'math', ['jones-polynomial']),
  c('khovanov-detects', 'Khovanov ホモロジーは検出する', '**多項式ではなく鎖複体を作ると、答えが出る**（Kronheimer–Mrowka）。強さを、計算の重さと交換している', 'theorem', 'math', ['jones-unknot-problem-is-open', 'singular-homology']),
  c('alternating-crossing-number', '交代図式なら、交点数が最小である', '**Jones 多項式の span がそのまま交点数。**百年開いていた予想が、不変量一つで落ちた', 'theorem', 'math', ['jones-polynomial']),

  // 2 次元と 3 次元 ── 幾何が決める
  c('uniformization-picks-a-geometry', 'Euler 標数の符号が、幾何を一つ選ぶ', '**曲率の総和が位相で決まっているので、定曲率を要求すると幾何が決まる**', 'theorem', 'math', ['surface-classification', 'gauss-bonnet', 'space-forms']),
  c('dehn-surgery', 'Dehn 手術', '**閉じた向き付け可能な 3 次元多様体は、全部これで作れる**（Lickorish–Wallace）', 'theorem', 'math', ['knot-diagram', 'manifold']),
  c('poincare-sphere-from-trefoil', '三葉結び目への手術が、Poincaré 球面を作る', '**ホモロジーが球面と同じなのに、基本群が位数 120。**ホモロジーでは足りない例', 'theorem', 'math', ['dehn-surgery', 'fundamental-group']),
  c('homotopy-equivalent-not-homeomorphic', 'ホモトピー同値でも、同相とは限らない', 'レンズ空間 $L(7,1)$ と $L(7,2)$。**ねじれの不変量を足してはじめて区別できる**', 'theorem', 'math', ['poincare-sphere-from-trefoil']),
  c('eight-geometries', '3 次元の幾何は、八つで尽きる', '**等方群の次元が 3、1、0 の場合を数えて $3 + 4 + 1 = 8$。**数え方まで見える分類', 'theorem', 'math', ['uniformization-picks-a-geometry', 'lie-group', 'group-action']),
  c('geometrization', '幾何化定理', '**どの 3 次元多様体も、切ると八つのどれかが入る片に分かれる。**Ricci flow が証明した', 'theorem', 'math', ['eight-geometries', 'ricci-flow']),
  c('poincare-conjecture-is-a-corollary', 'Poincaré 予想が、その系である', '**単連結なら球面。**百年の問題が、分類定理の一番易しい場合になる', 'theorem', 'math', ['geometrization', 'simply-connected-means-trivial']),
  c('mostow-rigidity', '双曲なら、体積が位相不変量になる', '**計量を動かす自由が無い。**幾何量が、そのまま位相を区別する数になる', 'theorem', 'math', ['eight-geometries', 'cartan-hadamard']),
  c('rigidity-fails-in-two-dimensions', '2 次元では、剛性が無い', '**種数 $g$ の曲面の計量は $6g - 6$ 次元ぶん動く。**次元が結論を変える、最初の例', 'viewpoint', 'math', ['mostow-rigidity', 'riemann-surface']),
  c('hyperbolic-volume-is-computable', '体積は、実際に計算できる', '**8 の字結び目の補空間は理想四面体二つに分かれる。**位相不変量が数値として出る', 'technique', 'math', ['mostow-rigidity']),

  // 4 次元 ── 位相と滑らかさが割れる
  c('whitney-trick-needs-five', 'Whitney の円板を押しのけるには、5 次元が要る', '**$2 + 2 < n$。**交わりの次元が $p + q - n$ になることから、この不等式が出る', 'theorem', 'math', ['manifold', 'transversality-of-submanifolds', 'generic-position']),
  c('surgery-works-above-four', 'だから 5 次元以上では、分類が進む', '**h 同境定理も一般化 Poincaré 予想も、$n >= 5$ でだけ言える。**高次元のほうが易しい', 'theorem', 'math', ['whitney-trick-needs-five']),
  c('intersection-form', '交叉形式', '4 次元多様体の二次元ホモロジーに、単模な対称双線形形式が乗る', 'definition', 'math', ['singular-homology', 'signature', 'quadratic-form']),
  c('freedman-topological-classification', '位相的には、そこで分類が終わる', '**単連結なら交叉形式でほぼ決まる**（Freedman）。滑らかさについては何も言っていない', 'theorem', 'math', ['intersection-form']),
  c('rokhlin-and-donaldson-cut-it-down', '滑らかにすると、足りなくなる', '**スピンなら符号数が 16 で割れ**（Rokhlin）、**正定値なら対角化できる**（Donaldson）', 'theorem', 'math', ['freedman-topological-classification', 'characteristic-class']),
  c('e8-manifold-is-not-smooth', '$E_8$ 多様体は、滑らかには存在しない', '**偶で符号数 8、$16$ は 8 を割らない。**算数はこの一行で終わる。位相的には在る', 'theorem', 'math', ['rokhlin-and-donaldson-cut-it-down']),
  c('exotic-r4', '$RR^4$ だけが、非可算個の滑らかな構造を持つ', '**他のどの $RR^n$ でも一意。**4 次元だけが例外であることの、いちばん強い形', 'theorem', 'math', ['e8-manifold-is-not-smooth']),
  c('slice-genus', '結び目を、4 次元の側から見る', '**$B^4$ の中で円板を張れるか。**符号数の半分が下から縛る', 'definition', 'math', ['seifert-matrix-gives-two-invariants', 'intersection-form']),
  c('conway-knot-is-not-slice', 'Conway 結び目は、位相的にはスライスで、滑らかにはスライスでない', '**第 2 回で計算した不変量が、そのまま 4 次元の障害になる。**ここで三つが合流する', 'theorem', 'math', ['slice-genus', 'exotic-r4', 'alexander-does-not-detect']),
  c('smooth-four-dimensional-poincare-is-open', '滑らかな 4 次元 Poincaré 予想は、未解決', '**$S^7$ の滑らかな構造は 28 個と数え上がっているのに、$S^4$ は数え上げが無い**', 'viewpoint', 'math', ['exotic-r4', 'poincare-conjecture-is-a-corollary']),
]
