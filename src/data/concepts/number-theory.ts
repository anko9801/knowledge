import type { Concept } from './types.ts'
import { c } from './types.ts'

export const numberTheory: readonly Concept[] = [
  // --- 初等数論 ----------------------------------------------------------------
  //
  // **代数体とは別の連載である。**軸が違う ── こちらは $ZZ\/n ZZ$ の中で閉じ、
  // 向こうは整数環を取り替える。分ける根拠がそのまま `derivations` の一行になる。
  // **ここは Pell の無限解を連分数で作り、なぜ在るのかは言わない。**
  // 「なぜ在るか」（実二次体の単数の階数が 1）は代数体の側で出す。
  //
  // Galois は一度も使わない。使ったらこの連載は独立していない。
  c('divisibility', '整除', '余りが零であること。順序ではなく前順序で、**全順序ではない**', 'definition', 'math', ['relation-order']),
  c('division-algorithm', '除法の原理', '余りが割る数より小さく取れる。**整列性からしか出ない**ので、有理数では成り立たない', 'theorem', 'math', ['divisibility', 'well-order']),
  c('bezout-identity', 'Bézout の等式', '最大公約数が、二つの整数の整係数結合で書ける。**互除法の途中式がそのまま証明**', 'theorem', 'math', ['division-algorithm']),
  c('euclid-lemma', 'Euclid の補題', '素数が積を割るなら、どちらかを割る。**Bézout から出る。定義からは出ない**', 'theorem', 'math', ['bezout-identity']),
  c('fundamental-theorem-arithmetic', '素因数分解の一意性', '「明らか」ではない。**Euclid の補題を経由しないと証明できない**', 'theorem', 'math', ['euclid-lemma']),
  c('factorization-can-fail', '一意分解は整数の性質ではない', '$ZZ[sqrt(-5)]$ では $6$ が二通りに分かれる。**何を仮定していたのかが、壊れて初めて見える**', 'viewpoint', 'math', ['fundamental-theorem-arithmetic']),
  c('congruence', '合同', '割った余りで同一視する。環になるので、加減乗はそのまま持ち込める', 'definition', 'math', ['divisibility', 'quotient-group']),
  c('modular-inverse', '逆元が在る条件', '互いに素であることと可逆であることが同値。**割り算だけが条件付き**', 'theorem', 'math', ['congruence', 'bezout-identity']),
  c('crt', '中国剰余定理', '互いに素な法での連立は、積を法として一意に解ける。**環の同型として書くと一行**', 'theorem', 'math', ['congruence', 'modular-inverse']),
  c('euler-phi', 'Euler の $phi$ 関数', '可逆元の個数。中国剰余定理から乗法的だと出る', 'definition', 'math', ['crt', 'modular-inverse']),
  c('fermat-euler-theorem', 'Fermat–Euler の定理', '可逆元を $phi(n)$ 乗すると 1 に戻る。**Lagrange の定理の言い換えでしかない**', 'theorem', 'math', ['euler-phi', 'lagrange-theorem']),
  c('primitive-root', '原始根', '奇素数の冪とその二倍のときだけ在る。**在る $n$ が完全に分類されている**', 'theorem', 'math', ['fermat-euler-theorem', 'cyclic-group']),
  c('order-of-element', '位数と、それが割るもの', '元の位数は群の位数を割る。素数判定も暗号もここに乗る', 'definition', 'math', ['fermat-euler-theorem']),
  c('carmichael-numbers', 'Fermat 判定は素数判定ではない', '合成数なのに全部の底で通る数が無限に在る。**逆が偽であることが定理として証明されている**', 'theorem', 'math', ['fermat-euler-theorem']),
  c('miller-rabin-correctness', 'Miller–Rabin が Carmichael を抜ける理由', '平方根が $plus.minus 1$ しか無いことを追加で使う。**Fermat が使っていなかった構造を一つ足しただけ**', 'theorem', 'math', ['carmichael-numbers', 'primitive-root']),

  // 平方剰余
  c('quadratic-residue', '平方剰余', '平方数になる剰余類。奇素数では、ちょうど半分が平方剰余', 'definition', 'math', ['primitive-root']),
  c('euler-criterion', 'Euler の規準', '$(p-1)\\/2$ 乗が $plus.minus 1$ のどちらになるかで判定できる', 'theorem', 'math', ['quadratic-residue']),
  c('legendre-symbol', 'Legendre 記号', '判定を乗法的な記号に直す。**乗法的だから、法を素因数へ分解できる**', 'definition', 'math', ['euler-criterion']),
  c('quadratic-reciprocity', '平方剰余の相互法則', '$p$ が $q$ の平方剰余かと、$q$ が $p$ の平方剰余かが、二つの符号だけで結ばれる。**問い自体が別の問いに化ける**', 'theorem', 'math', ['legendre-symbol']),
  c('reciprocity-makes-it-computable', '相互法則は計算法である', '法を小さくしながら降りられるので、**因数分解をせずに判定できる**。互除法と同じ速さ', 'viewpoint', 'math', ['quadratic-reciprocity']),
  c('sum-of-two-squares', '二平方和定理', '$4k+1$ 型の素数がちょうど二つの平方の和になる。**平方剰余の存在から鳩の巣で出る**', 'theorem', 'math', ['quadratic-residue']),

  // 数の分布
  c('euclid-infinitude', '素数は無限に在る', '有限だと仮定して積に 1 を足す。**新しい素数を作るのではなく、漏れた素因数が在ると言うだけ**', 'theorem', 'math', ['fundamental-theorem-arithmetic']),
  c('euler-product', 'Euler 積', '素因数分解の一意性を、無限積の展開として書き直したもの', 'theorem', 'math', ['fundamental-theorem-arithmetic', 'power-series']),
  c('divergence-of-prime-reciprocals', '素数の逆数和は発散する', '**無限であることより強い。**平方数の逆数和は収束するので、素数は平方数より濃い', 'theorem', 'math', ['euler-product']),
  c('chebyshev-bounds', '素数の個数の上下界', '定数倍を除いて $x\\/log x$。**二項係数の素因数を数えるだけ**で出る', 'theorem', 'math', ['euclid-infinitude', 'euler-product']),
  c('pnt-needs-complex-analysis', '素数定理は初等的には出ない、と長く思われていた', '定数倍まではここで出るが、**定数が 1 だと言うには零点の位置が要る**。境界がここに在る', 'viewpoint', 'math', ['chebyshev-bounds']),
  c('dirichlet-theorem-ap', 'Dirichlet の算術級数定理', '互いに素な初項と公差の等差数列に素数が無限に在る。**証明は指標と $L$ 関数で、初等ではない**', 'theorem', 'math', ['chebyshev-bounds', 'character-theory']),

  // 連分数と Pell
  c('continued-fraction', '連分数展開', '互除法の商を並べたもの。**有理数なら必ず有限で止まる**', 'definition', 'math', ['bezout-identity']),
  c('best-approximation', '連分数の近似が最良である', '分母が同じ以下の分数のどれよりも近い。**近似の良さが順序として定まる**', 'theorem', 'math', ['continued-fraction']),
  c('quadratic-irrational-periodic', '二次無理数の展開は周期的', '逆も成り立つ。**周期性という見た目の性質と、二次方程式の根であることが同値**', 'theorem', 'math', ['continued-fraction']),
  c('pell-equation', 'Pell 方程式', '自明でない解が一つ在れば、そこから無限に作れる。**群になっている**', 'theorem', 'math', ['quadratic-irrational-periodic', 'best-approximation']),
  c('pell-existence-not-shown-here', '解が在ることは、ここでは言えない', '**作り方は連分数で出るが、在ることの理由は出ない。**それは代数体の側で、単数の階数として出る', 'viewpoint', 'math', ['pell-equation']),
]
