import type { Concept } from './types.ts'
import { c } from './types.ts'

export const functionalAnalysis: readonly Concept[] = [
  // --- 関数解析 ----------------------------------------------------------------
  //
  // **量子力学が既にあるのに、その下が抜けていた。**
  // `spectral-theorem-unbounded` と `symmetric-vs-selfadjoint` は量子力学のために
  // 足したもので、そこへ至る道が無い。ここはその道である。
  //
  // 軸は**「有限次元の何が壊れるか」**。壊れる場所ごとに、
  // 何を仮定すれば直るかが定理になっている ──
  // 完備性を仮定すると Baire の三定理、凸性を仮定すると Hahn–Banach、
  // コンパクト性を仮定すると Fredholm。
  //
  // 名前の衝突: `open-mapping-theorem` は複素解析（正則写像が開写像）。
  // こちらは `open-mapping-banach`。
  c('infinite-dimension-breaks-things', '有限次元の何が壊れるか', '有界閉集合がコンパクトでなくなり、線形写像が連続とは限らなくなり、部分空間が閉とは限らなくなる。**以降は、どれを仮定で買い戻すかの話**', 'viewpoint', 'math', ['vector-space', 'metric-space']),
  c('riesz-compactness-fails', 'Riesz の補題', '単位球がコンパクトであることと、有限次元であることが同値。**無限次元では必ず失う**', 'theorem', 'math', ['infinite-dimension-breaks-things', 'banach-space']),
  c('bounded-equals-continuous', '有界と連続が同値', '線形写像に限れば、この二つは同じ。**線形性が効いていて、一般の写像では成り立たない**', 'theorem', 'math', ['operator-norm', 'banach-space']),
  c('discontinuous-linear-maps-exist', '不連続な線形写像がある', '選択公理を使えば作れる。**構成的には作れない**ので、目にすることはない', 'theorem', 'math', ['bounded-equals-continuous', 'axiom-of-choice']),

  // 完備性が買うもの ── Baire から三つ
  c('baire-category', 'Baire の範疇定理', '完備な空間は、内点を持たない閉集合の可算和では覆えない。**「ほとんど全部」を位相で言う道具**', 'theorem', 'math', ['completeness', 'topology-basics']),
  c('uniform-boundedness', '一様有界性原理', '各点で有界なら、一様に有界。**点ごとの情報が、全体の情報に化ける**', 'theorem', 'math', ['baire-category', 'bounded-equals-continuous']),
  c('open-mapping-banach', '開写像定理（Banach 空間）', '全射な有界線形写像は開写像。**複素解析の同名の定理とは別物**（あちらは正則写像）', 'theorem', 'math', ['baire-category', 'bounded-equals-continuous']),
  c('bounded-inverse', '逆写像も有界になる', '全単射なら逆も連続。**逆が在ることを言えば、連続性は無料で付いてくる**', 'theorem', 'math', ['open-mapping-banach']),
  c('closed-graph', '閉グラフ定理', 'グラフが閉なら連続。**連続性の証明が、極限の存在を仮定してよい形に弱まる**', 'theorem', 'math', ['open-mapping-banach']),
  c('three-theorems-need-completeness', '三つとも完備性が要る', 'どれも Baire を経由するので、**完備でない空間では全部偽**。反例が具体的に作れる', 'viewpoint', 'math', ['uniform-boundedness', 'closed-graph']),

  // 凸性が買うもの ── Hahn–Banach
  c('hahn-banach', 'Hahn–Banach の定理', '部分空間の上の汎関数が、ノルムを増やさずに全体へ延びる。**完備性も可分性も要らない**', 'theorem', 'math', ['banach-space', 'axiom-of-choice']),
  c('dual-space-is-big-enough', '双対空間が点を分ける', '異なる二点を区別する汎関数が必ず在る。**「外から見て同じなら同じ」が言えるようになる**', 'theorem', 'math', ['hahn-banach', 'dual-space']),
  c('hahn-banach-separation', '分離形の Hahn–Banach', '交わらない凸集合の間に超平面が入る。**有限次元の分離超平面の、無限次元版**', 'theorem', 'math', ['hahn-banach', 'separating-hyperplane']),
  c('hahn-banach-is-not-constructive', '延長は一意でない', '選択公理で作るので、**どう延ばしたかは言えない。**一意になるのは狭義凸な双対を持つときだけ', 'viewpoint', 'math', ['hahn-banach']),

  // 弱い位相
  c('weak-topology', '弱位相', '汎関数の値だけで収束を測る。**弱くすると、コンパクトな集合が増える**', 'definition', 'math', ['dual-space-is-big-enough', 'topology-basics']),
  c('banach-alaoglu', 'Banach–Alaoglu の定理', '双対の単位球は弱\\*位相でコンパクト。**Riesz で失ったコンパクト性を、位相を弱めて買い戻す**', 'theorem', 'math', ['weak-topology', 'riesz-compactness-fails']),
  c('reflexivity', '回帰性', '二重双対が自分に戻ること。$L^p$ は $1 < p < oo$ で戻り、$L^1$ と $L^oo$ は戻らない', 'definition', 'math', ['dual-space-is-big-enough', 'lp-space']),
  c('weak-limits-lose-mass', '弱収束は、質量を失うことがある', '各点で 0 に弱収束するのに、ノルムが 1 のままの列が作れる。**極限に至る途中で「逃げて」いる**', 'theorem', 'math', ['weak-topology']),
  c('direct-method', '変分法の直接法', '弱コンパクト性で極小化列から収束部分列を取り、弱下半連続性で極限が最小だと言う。**存在証明の型がここで決まる**', 'technique', 'math', ['banach-alaoglu', 'variational-principle']),

  // Hilbert 空間 ── 内積が買うもの
  c('projection-theorem', '射影定理', '閉凸集合への最短点が一意に在る。**Banach 空間では言えない**', 'theorem', 'math', ['hilbert-space', 'completeness']),
  c('riesz-representation', 'Riesz の表現定理', '汎関数がすべて内積で書ける。**Hilbert 空間は自分の双対と同一視できる**', 'theorem', 'math', ['projection-theorem']),
  c('orthonormal-basis-infinite', '正規直交基底', '可分なら可算個で足りる。**係数の二乗和が有限、という条件が付く**（Parseval）', 'theorem', 'math', ['riesz-representation', 'inner-product']),
  c('fourier-series-is-a-basis-expansion', 'Fourier 級数は基底展開である', '**三角関数が $L^2$ の正規直交基底になる、という一行。**収束は $L^2$ の意味で、各点収束は別の問題', 'viewpoint', 'math', ['orthonormal-basis-infinite', 'fourier-transform']),

  // 作用素 ── どこまで有限次元に似ているか
  c('operator-spectrum', 'スペクトル', '逆が有界に存在しない点の集合。**固有値だけでは足りない**ので、三つに分かれる', 'definition', 'math', ['bounded-equals-continuous', 'banach-space']),
  c('spectrum-is-not-eigenvalues', '固有値を一つも持たない作用素がある', '掛け算作用素がその例。**連続スペクトルは、有限次元には無かった現象**', 'theorem', 'math', ['operator-spectrum']),
  c('compact-operator', 'コンパクト作用素', '有界集合を、閉包がコンパクトな集合へ写す。**有限階作用素の極限として書ける**（Hilbert 空間では）', 'definition', 'math', ['riesz-compactness-fails', 'operator-spectrum']),
  c('riesz-schauder', 'Riesz–Schauder の理論', 'コンパクト作用素のスペクトルは、0 に集積する固有値の列に尽きる。**有限次元とほぼ同じに戻る**', 'theorem', 'math', ['compact-operator']),
  c('fredholm-alternative-functional', 'Fredholm の択一（コンパクト作用素）', '解が一意に在るか、斉次方程式に非自明解があるかのどちらか。**有限次元の階数の議論が、そのまま生きる**', 'theorem', 'math', ['riesz-schauder']),
  c('fredholm-index', '指数は摂動で動かない', '核と余核の次元の差が、コンパクトな摂動で変わらない。**離散的な不変量が、連続な変形の下で残る**', 'theorem', 'math', ['fredholm-alternative-functional', 'rank-nullity']),
  c('spectral-theorem-bounded-selfadjoint', 'スペクトル定理（有界自己共役）', '連続関数計算ができる。**固有基底の代わりに、スペクトル上の関数として作用素を扱う**', 'theorem', 'math', ['operator-spectrum', 'projection-theorem']),
  c('why-domains-matter', '定義域を書かないと、作用素が決まらない', '**掛け算も微分も、空間全体では定義できない。**非有界であることが、定義域を選ぶことを強いる', 'theorem', 'math', ['bounded-equals-continuous', 'unbounded-operator']),
  c('semigroup-generation', '半群と生成子', '強連続半群の生成子が、閉かつ稠密に定義される。**時間発展を作用素に翻訳する道具**', 'theorem', 'math', ['unbounded-operator', 'closed-graph']),
  c('hille-yosida', 'Hille–Yosida の定理', 'どんな作用素が半群を生むかが、レゾルベントの評価で完全に決まる', 'theorem', 'math', ['semigroup-generation', 'operator-spectrum']),
]
