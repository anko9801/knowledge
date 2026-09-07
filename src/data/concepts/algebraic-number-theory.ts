import type { Concept } from './types.ts'
import { c } from './types.ts'

export const algebraicNumberTheory: readonly Concept[] = [
  // --- 代数体 ------------------------------------------------------------------
  //
  // 初等数論と分けた理由は「量が多いから」ではない。**軸が違う。**
  // 向こうは $ZZ$ の中で閉じ、こちらは**整数環を取り替える**。
  //
  // 取り替えると一意分解が壊れる。壊れた分をイデアルで測り直すと戻る ──
  // それが類数である。そして**壊れ方が有限だと言えるのが、この分野の芯**。
  //
  // ここが初等数論に返せるものが一つある。**Pell の解が在る理由**
  // （実二次体の単数の階数が 1）。向こうは作り方しか出せない。
  c('number-field', '代数体', '有理数体の有限次拡大。**ここから先、整数は選び直される**', 'definition', 'math', ['field-extension', 'algebraic-element']),
  c('ring-of-integers', '整数環', 'モニックな整係数多項式の根になる元の全体。**環になることが定理**で、定義から明らかではない', 'theorem', 'math', ['number-field', 'integral-domain']),
  c('integral-closure', '整閉性', '整数環の中で整な元は、もう中に在る。**選び直しが一度で止まる**', 'theorem', 'math', ['ring-of-integers']),
  c('trace-and-norm', 'トレースとノルム', '埋め込みの和と積。**代数体の元を有理数に落とす二つの写像**で、以降ほとんどの評価がこれで進む', 'definition', 'math', ['number-field', 'contraction']),
  c('discriminant-of-field', '判別式', '整基底の埋め込み行列の行列式の平方。**どの素数で枝分かれするかを丸ごと持つ**', 'definition', 'math', ['trace-and-norm']),
  c('minkowski-discriminant-bound', '有理数体以外の判別式は 1 でない', '判別式の絶対値に 1 より大きい下界が付く。**「$QQ$ の不分岐拡大は無い」の正確な言い方**', 'theorem', 'math', ['discriminant-of-field', 'minkowski-lattice-theorem']),

  // イデアルが分解を取り戻す
  c('ideal-multiplication', 'イデアルの積', '元の積ではなく、生成元の積で生成されるイデアル', 'definition', 'math', ['ideal', 'ring-of-integers']),
  c('dedekind-domain', 'Dedekind 環', 'Noether・整閉・零でない素イデアルが極大。**この三つだけで一意分解が戻る**', 'definition', 'math', ['integral-closure', 'ideal-multiplication']),
  c('unique-factorization-of-ideals', 'イデアルは素イデアルの積に一意に分解する', '**元では壊れたものが、イデアルでは壊れない。**数を捨てて集合を取ると戻る、という交換', 'theorem', 'math', ['dedekind-domain']),
  c('principal-iff-ufd', '単項イデアル整域であることと一意分解が同値', 'Dedekind 環の中では、この二つが一致する。**一般の環では一致しない**', 'theorem', 'math', ['unique-factorization-of-ideals', 'unique-factorization-domain']),
  c('splitting-of-primes', '素数の分解法則', '素数が上でどう割れるかは、分岐指数と剰余次数の組で決まり、**和が次数に等しい**', 'theorem', 'math', ['unique-factorization-of-ideals', 'trace-and-norm']),
  c('ramification-divides-discriminant', '分岐する素数は判別式を割る素数だけ', '**有限個しか分岐しない。**どこで壊れるかが一つの整数に収まる', 'theorem', 'math', ['splitting-of-primes', 'discriminant-of-field']),
  c('dedekind-factorization-criterion', '分解の判定は多項式の因数分解になる', '判別式を割らない素数では、最小多項式を法 $p$ で因数分解した形がそのまま分解の形', 'theorem', 'math', ['splitting-of-primes', 'finite-field']),
  c('reciprocity-as-splitting', '相互法則は分解法則である', '$p$ が二次体で分かれるかどうかが平方剰余の判定と同じもの。**初等数論の相互法則がここで説明される**', 'viewpoint', 'math', ['dedekind-factorization-criterion', 'quadratic-reciprocity']),

  // 格子から出る二つの有限性
  c('minkowski-lattice-theorem', 'Minkowski の格子点定理', '原点対称な凸体が十分大きければ、格子点を必ず含む。**鳩の巣を体積で言い直したもの**', 'theorem', 'math', ['point-lattice', 'convex-set', 'measure']),
  c('point-lattice', '点格子', '一次独立なベクトルの整数結合。**順序論の束（`lattice`）とは無関係**', 'definition', 'math', ['vector-space']),
  c('geometry-of-numbers', '代数を幾何に翻訳する', '整数環を埋め込むと実空間の格子になり、ノルムが体積になる。**以降の有限性は全部この翻訳が出す**', 'viewpoint', 'math', ['minkowski-lattice-theorem', 'ring-of-integers']),
  c('ideal-class-group', 'イデアル類群', '単項イデアルで割った商。**一意分解からのずれを群で測る**。単位元なら一意分解が成り立つ', 'definition', 'math', ['unique-factorization-of-ideals', 'quotient-group']),
  c('class-number-finiteness', '類数は有限である', 'Minkowski 限界以下のイデアルだけ調べれば済む。**「壊れ方は有限種類しかない」**', 'theorem', 'math', ['ideal-class-group', 'geometry-of-numbers']),
  c('class-number-is-computable', '類数は実際に計算できる', '限界が具体的な数なので、有限個の素イデアルの関係を調べれば終わる。**存在定理ではない**', 'technique', 'math', ['class-number-finiteness']),
  c('unit-group', '単数群', '整数環の可逆元。**$ZZ$ では $plus.minus 1$ だけだが、一般には無限になる**', 'definition', 'math', ['ring-of-integers', 'abelian-group']),
  c('dirichlet-unit-theorem', 'Dirichlet の単数定理', '単数群は有限巡回群と自由部分の積で、階数が実埋め込みと複素埋め込みの個数だけで決まる', 'theorem', 'math', ['unit-group', 'geometry-of-numbers', 'abelian-structure-theorem']),
  c('pell-solutions-are-units', 'Pell の解は実二次体の単数である', '実二次体の階数は 1。**基本単数が一つ在り、その冪が全部の解。**連分数が作っていたのはこれ', 'theorem', 'math', ['dirichlet-unit-theorem', 'pell-equation']),
  c('rank-explains-which-equations', '階数が、どの方程式が無限解を持つかを決める', '虚二次体は階数 0 なので単数が有限、だから対応する方程式の解も有限。**同じ定理が両方を出す**', 'viewpoint', 'math', ['dirichlet-unit-theorem']),

  // 局所と、その先
  c('p-adic-valuation', '$p$ 進付値', '素イデアルで何回割れるか。**距離の公理を満たす**が、三角不等式が強い形になる', 'definition', 'math', ['unique-factorization-of-ideals', 'metric-space']),
  c('product-formula', '積公式', '全ての付値をかけると 1 になる。**有限素点と無限素点を対等に扱う理由がここに在る**', 'theorem', 'math', ['p-adic-valuation', 'trace-and-norm']),
  c('local-field', '局所体', '付値で完備化した体。**一つの素点だけを見る**', 'definition', 'math', ['p-adic-valuation', 'banach-space']),
  c('hasse-minkowski', 'Hasse–Minkowski の定理', '二次形式が有理数で解を持つことと、全ての局所体で持つことが同値。**局所から大域が出る、数少ない例**', 'theorem', 'math', ['local-field', 'quadratic-form']),
  c('hasse-principle-fails', '局所大域原理は一般には成り立たない', '三次では反例が在る。**二次形式でだけ成り立つ**ことのほうが、定理の内容である', 'viewpoint', 'math', ['hasse-minkowski']),
  c('frobenius-element', 'Frobenius 元', '分岐しない素イデアルに、Galois 群の元が共役を除いて定まる。**素数が群の元になる**', 'definition', 'math', ['splitting-of-primes', 'galois-correspondence', 'frobenius-endomorphism']),
  c('chebotarev-density', 'Chebotarev の密度定理', 'Frobenius 元は共役類の大きさに比例した密度で現れる。**Dirichlet の定理を丸ごと含む**', 'theorem', 'math', ['frobenius-element', 'dirichlet-theorem-ap']),
]
