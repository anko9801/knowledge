import type { Concept } from './types.ts'
import { c } from './types.ts'

export const arts: readonly Concept[] = [
  // --- 音・色・模様 ------------------------------------------------------------
  //
  // 文学は × だった。◎ は三つ ── **音律・色彩・模様**。
  // 共通しているのは、**好みではなく、格子と群が答えを決めている**こと。
  //
  // **12 が選ばれた理由は、五度だけでは出ない**（`docs/surveys.md`）。
  // 連分数が出すのは $19\/12$、$65\/41$、$84\/53$。12 平均律の長三度は
  // 13.7 セント高く、これは一次元の連分数からは出ない。五度と長三度を基底に
  // 取ると純正律は $ZZ^2$ で、**二つのコンマを潰すと剰余類が 12 個できる。**
  c('pitch-is-logarithmic', '音高は周波数の対数である', '**同じ音程が、周波数では比、音高では差になる。**以降が全部加法群の話になる', 'definition', 'math', ['abelian-group']),
  c('just-intervals-are-a-lattice', '純正音程は格子をなす', '五度と長三度を基底に取ると $ZZ^2$。**素因数 3 と 5 の指数が座標**', 'theorem', 'math', ['pitch-is-logarithmic', 'point-lattice']),
  c('comma', 'コンマ', '一周したのに戻らない差。**Pythagoras コンマとシントニックコンマの二つ**', 'definition', 'math', ['just-intervals-are-a-lattice']),
  c('continued-fraction-gives-41-and-53', '五度だけなら 12 は出ない', '連分数が出すのは $19\\/12$、$65\\/41$、$84\\/53$。**12 が最良近似の列に一度は出るが、41 と 53 のほうが良い**', 'theorem', 'math', ['comma', 'continued-fraction']),
  c('two-commas-give-twelve', '二つのコンマを潰すと 12 になる', '$mat(4, -1; 12, 0)$ の行列式が 12。**剰余類の個数がそのまま音の個数**', 'theorem', 'math', ['continued-fraction-gives-41-and-53', 'quotient-group', 'determinant']),
  c('equal-temperament-is-a-quotient', '平均律は商群である', '格子をコンマの生成する部分群で割ったもの。**「近似」ではなく、潰す関係を選んだ結果**', 'viewpoint', 'math', ['two-commas-give-twelve', 'homomorphism-theorem']),
  c('which-comma-you-kill-decides', 'どのコンマを潰すかで、律が決まる', 'シントニックだけを潰せば中全音律、両方潰せば 12 平均律。**選択が一つ増えるごとに音律が一つ決まる**', 'theorem', 'math', ['equal-temperament-is-a-quotient']),
  c('beats-are-not-perception', 'うなりは知覚ではない', '**二つの正弦波の和が積に書けるだけの、三角関数の恒等式。**調律が耳ではなく計算でできる理由', 'theorem', 'math', ['fourier-transform']),
  c('consonance-has-two-explanations', '協和には二つの説明がある', '整数比で説明する側と、部分音のうなりで説明する側。**予測が食い違う場所が在り、そこが実験になる**', 'viewpoint', 'math', ['beats-are-not-perception', 'just-intervals-are-a-lattice']),

  // 色
  c('trichromacy-is-a-projection', '色は三次元に潰れている', '光は無限次元のスペクトルだが、**受容器が三つしかないので像が三次元**。零空間が条件等色', 'theorem', 'math', ['rank-nullity', 'linear-map']),
  c('metamerism-is-a-null-space', '条件等色は零空間である', '**違うスペクトルが同じ色に見えるのは、錯覚ではなく線形代数。**光源を変えると一致が崩れる', 'theorem', 'math', ['trichromacy-is-a-projection']),
  c('color-matching-functions', '等色関数', '三つの原色でどんな色が作れるかを測る。**負の値が出るのは、原色の選び方の問題**', 'definition', 'math', ['trichromacy-is-a-projection']),
  c('no-three-real-primaries-suffice', '実在の三原色では全部の色を作れない', '**錐体の応答が重なっているので、円錐の外に出られない。**XYZ の原色が実在しない理由', 'theorem', 'math', ['color-matching-functions', 'convex-set']),
  c('chromaticity-is-a-projective-space', '色度図は射影である', '明るさで割ると二次元。**混色が直線になるのは、射影が線分を保つから**', 'theorem', 'math', ['color-matching-functions', 'convex-set']),
  c('gamut-is-a-convex-hull', '色域は凸包である', '原色の凸包しか出せない。**原色を増やすと広がるが、円錐全体は覆えない**', 'theorem', 'math', ['chromaticity-is-a-projective-space', 'no-three-real-primaries-suffice']),
  c('perceptual-distance-is-not-euclidean', '色の隔たりは Euclid 距離ではない', '**等しく見える差が、図の上では場所によって大きさが違う。**計量が定数でない', 'viewpoint', 'math', ['chromaticity-is-a-projective-space', 'riemannian-metric']),

  // 模様
  c('symmetry-group-of-a-pattern', '模様の対称群', '模様を自分に重ねる合同変換の全体。**模様を、群一つに翻訳する**', 'definition', 'math', ['group-action', 'point-lattice']),
  c('crystallographic-restriction', '結晶学的制限', '**格子と両立する回転は 2、3、4、6 次だけ。**5 次が無いのは、正五角形が平面を埋めないからではなく、整数行列の跡が整数だから', 'theorem', 'math', ['symmetry-group-of-a-pattern', 'contraction']),
  c('seventeen-wallpaper-groups', '平面の模様は 17 種類しかない', '**分類が完全に終わっている。**どんな壁紙も、この 17 のどれかである', 'theorem', 'math', ['crystallographic-restriction']),
  c('seven-frieze-groups', '帯の模様は 7 種類', '一方向だけの並進なら 7 つ。**次元を落とすと数が減る**', 'theorem', 'math', ['seventeen-wallpaper-groups']),
  c('classification-is-not-enumeration', '分類は、作り方を教えない', '**17 種類だと分かっても、目の前の模様がどれかは別の判定が要る。**判定は不変量で行う', 'viewpoint', 'math', ['seventeen-wallpaper-groups']),
  c('penrose-tiling-has-no-lattice', '非周期タイル張りは、この分類の外に在る', '**並進対称性が無いので群が違う。**5 次の対称が現れるのは、制限が効く前提を外したから', 'theorem', 'math', ['crystallographic-restriction']),
  c('hyperbolic-tilings-are-infinite', '負曲率では、種類が無限になる', '**平面で 17 に止まったのは、平坦だったからである。**曲率が分類の有限性を作っていた', 'theorem', 'math', ['seventeen-wallpaper-groups', 'gauss-bonnet']),
  c('self-similarity-is-a-different-symmetry', '自己相似は合同変換ではない', '大きさを変える写像を許すと別の群になる。**同じ「対称」という語が、二つの違うものを指している**', 'viewpoint', 'math', ['symmetry-group-of-a-pattern', 'hausdorff-dimension']),
]
