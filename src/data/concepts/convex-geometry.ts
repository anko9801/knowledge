import type { Concept } from './types.ts'
import { c } from './types.ts'

export const convexGeometry: readonly Concept[] = [
  // --- 凸幾何と離散幾何 --------------------------------------------------------
  //
  // **MSC 52 が指した空白。**`convex-set` と `separating-hyperplane` は
  // アルゴリズムのために置かれていて、凸性そのものから何が出るかが無かった。
  //
  // 軸は**「凸であることだけから、次元の数が出てくる」**。
  // Helly も Radon も Carathéodory も、結論に $n + 1$ か $n + 2$ が現れる。
  // **凸性が、次元を数える道具になっている。**
  //
  // 結びは Brunn--Minkowski で、そこから等周不等式が一行で出る。
  // **幾何の不等式が、体積の凹性という一つの主張に還元される。**
  c('convex-hull', '凸包', '含む最小の凸集合。**「囲む」という操作が、一つに決まる**', 'definition', 'math', ['convex-set']),
  c('caratheodory-theorem', 'Carathéodory の定理', '**$n$ 次元では、凸包の点が $n + 1$ 個の凸結合で書ける。**いくら点があっても、要るのはその数だけ', 'theorem', 'math', ['convex-hull']),
  c('radon-theorem', 'Radon の定理', '**$n + 2$ 個の点は、凸包が交わる二組に必ず分けられる**', 'theorem', 'math', ['convex-hull', 'rank-nullity']),
  c('helly-theorem', 'Helly の定理', '**$n + 1$ 個ずつが交わるなら、全部が交わる。**局所的な条件が大域に効く', 'theorem', 'math', ['radon-theorem']),
  c('dimension-appears-in-all-three', '三つとも、結論に次元が出る', '**凸性しか仮定していないのに、$n + 1$ や $n + 2$ という数が現れる。**凸性が次元を数えている', 'viewpoint', 'math', ['helly-theorem', 'caratheodory-theorem']),
  c('helly-gives-centerpoint', '中心点が必ず在る', '**どの半空間で切っても、点の $1\\/(n+1)$ 以上が残る点が存在する。**Helly の応用', 'theorem', 'math', ['helly-theorem']),
  c('ham-sandwich', 'ハムサンドイッチ定理', '**$n$ 個の測度を、一枚の超平面で同時に二等分できる。**証明は Borsuk–Ulam', 'theorem', 'math', ['helly-gives-centerpoint', 'brouwer-fixed-point']),
  c('kirchberger-theorem', '分離できるかも、有限個で判定できる', '**$n + 2$ 点ずつ分離できるなら、全体が分離できる。**Helly と同じ形', 'theorem', 'math', ['helly-theorem', 'separating-hyperplane']),

  // 多面体
  c('polytope-two-descriptions', '多面体には二つの書き方がある', '**頂点の凸包として書くか、不等式の共通部分として書くか。**同値だが、変換すると個数が指数的に増えうる', 'theorem', 'math', ['convex-hull', 'linear-program']),
  c('extreme-points', '端点', '他の二点の内分で書けない点。**線形計画の最適解が、必ずここに在る**', 'definition', 'math', ['polytope-two-descriptions']),
  c('krein-milman', 'Krein–Milman の定理', '**コンパクト凸集合は、端点の凸包の閉包に等しい。**無限次元でも成り立つ', 'theorem', 'math', ['extreme-points', 'banach-alaoglu']),
  c('birkhoff-von-neumann', '二重確率行列の端点は置換行列である', '**「平均を取る操作」の端点が、並べ替えに尽きる。**優越の証明がここに乗っている', 'theorem', 'math', ['extreme-points', 'hardy-littlewood-polya']),
  c('euler-relation-polytope', '多面体の面の数の関係', '**点 $-$ 辺 $+$ 面 $= 2$ が、任意の次元へ一般化する**（Euler–Poincaré）', 'theorem', 'math', ['polytope-two-descriptions', 'euler-characteristic']),
  c('upper-bound-theorem', '面の数には上限がある', '**頂点数を決めると、面の数の最大が決まる。**巡回多面体が達成する', 'theorem', 'math', ['euler-relation-polytope']),

  // 体積と、そこから出る不等式
  c('minkowski-sum', 'Minkowski 和', '二つの集合の点の和の全体。**「太らせる」操作が、和として書ける**', 'definition', 'math', ['convex-set']),
  c('brunn-minkowski', 'Brunn–Minkowski の不等式', '**体積の $1\\/n$ 乗が、Minkowski 和について凹。**凸体の体積が、この一つの性質に集約される', 'theorem', 'math', ['minkowski-sum', 'measure']),
  c('isoperimetric-from-brunn-minkowski', '等周不等式が、一行で出る', '**球に太らせる極限を取るだけ。**「同じ体積で表面積が最小なのは球」が、体積の凹性から出る', 'theorem', 'math', ['brunn-minkowski']),
  c('mixed-volumes', '混合体積', 'Minkowski 和の体積を展開した係数。**表面積も平均幅も、その特別な場合**', 'definition', 'math', ['brunn-minkowski']),
  c('alexandrov-fenchel', 'Alexandrov–Fenchel の不等式', '混合体積の間に不等式が立つ。**組合せ論の log 凹性の証明に使われる**', 'theorem', 'math', ['mixed-volumes']),
  c('john-ellipsoid', 'John の楕円体', '**任意の凸体に、$sqrt(n)$ 倍すれば覆える楕円体が在る。**凸体は「そこそこ丸い」', 'theorem', 'math', ['brunn-minkowski', 'quadratic-form']),
  c('concentration-on-the-sphere', '高次元の球面では、質量が赤道に集まる', '**関数が平均のまわりに集中する。**次元が上がるほど強くなる', 'theorem', 'math', ['isoperimetric-from-brunn-minkowski', 'concentration-inequality']),
  c('dvoretzky-theorem', 'Dvoretzky の定理', '**どんな凸体にも、ほぼ球に見える断面が在る。**次元を上げれば、いくらでも高次元の断面が取れる', 'theorem', 'math', ['concentration-on-the-sphere', 'john-ellipsoid']),
  c('high-dimensional-intuition-fails', '高次元の直感は当てにならない', '**立方体の体積のほとんどが角に在り、内接球の体積は 0 へ行く。**次元が上がると、量が別の場所へ移る', 'viewpoint', 'math', ['concentration-on-the-sphere']),

  // 格子と詰め込み
  c('sphere-packing-density', '球の詰め込み密度', '**空間の何割を埋められるか。**3 次元の答え（Kepler 予想）は計算機の助けが要った', 'definition', 'math', ['point-lattice', 'convex-hull']),
  c('packing-is-solved-in-few-dimensions', '解けている次元は、ごく少ない', '**1、2、3、8、24 次元だけ。**8 と 24 では、格子の特殊な対称性が効いている', 'theorem', 'math', ['sphere-packing-density']),
  c('packing-is-a-code', '詰め込みは符号である', '**球の中心が符号語で、最小距離が半径の 2 倍。**格子の問題と符号の問題が同じもの', 'viewpoint', 'math', ['packing-is-solved-in-few-dimensions', 'minimum-distance-decides']),
]
