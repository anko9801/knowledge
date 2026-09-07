import type { Concept } from './types.ts'
import { c } from './types.ts'

export const algebra: readonly Concept[] = [
  // --- 代数 --------------------------------------------------------------------
  //
  // **有限体と Galois の家はここ**（`docs/surveys.md`）。数論には置かない ──
  // 初等数論は Galois を一度も使わず、代数体も最初の六章は使わずに書ける。
  // 置き場所を数論にすると、数論を読む前に体論を全部読ませることになる。
  //
  // 符号（`linear-code`）も暗号（`public-key-encryption`）も、
  // 有限体が在って初めて前提が書ける。今まで両方とも**数学的な前提が
  // 一つも無いまま**置かれていた。
  c('group', '群', '結合的で単位元と逆元を持つ演算', 'definition', 'math'),
  c('symmetric-group', '対称群', '置換の群。符号', 'definition', 'math', ['group']),
  c('ring', '環', '足し算と掛け算。掛け算に逆元を要求しない', 'definition', 'math', ['group']),
  c('ideal', 'イデアル', '環の中で割り算をするための部分集合', 'definition', 'math', ['ring']),
  c('field', '体', '零でない元がすべて可逆な環。スカラーの住む場所', 'definition', 'math', ['ring']),
  c('polynomial-ring', '多項式環', '不定元を一つ足した環', 'definition', 'math', ['ring']),
  c('characteristic-polynomial', '固有多項式', 'det(A - λI)。固有値の定義に使う', 'definition', 'math', ['polynomial-ring', 'determinant']),
  c('abelian-group', 'アーベル群', '演算が可換な群。ここから先の分類が全部変わる', 'definition', 'math', ['group']),
  c('subgroup-coset', '部分群と剰余類', '部分群で割ると、大きさの等しい組に分かれる。**分かれることが先で、群になるかは後**', 'definition', 'math', ['group']),
  c('lagrange-theorem', 'Lagrange の定理', '部分群の位数は全体の位数を割る。剰余類が同じ大きさで重ならないことだけから出る', 'theorem', 'math', ['subgroup-coset']),
  c('normal-subgroup', '正規部分群', '剰余類の掛け算が代表の取り方に依らない条件。**割った先が群になるのは、このときだけ**', 'definition', 'math', ['subgroup-coset']),
  c('quotient-group', '商群', '正規部分群で割ってできる群', 'definition', 'math', ['normal-subgroup']),
  c('homomorphism-theorem', '準同型定理', '像が、核で割った商と同型。**「潰した分だけ小さくなる」が定理として書ける**', 'theorem', 'math', ['quotient-group']),
  c('abelian-structure-theorem', '有限生成アーベル群の構造定理', '巡回群の直和にただ一通りに分かれる。**分類が完全に終わる、数少ない例**', 'theorem', 'math', ['quotient-group', 'abelian-group']),
  c('cyclic-group', '巡回群', '一つの元で生成される群。同型を除いて位数だけで決まる', 'definition', 'math', ['abelian-group', 'lagrange-theorem']),
  c('sylow-theorems', 'Sylow の定理', '位数を割る素冪の部分群が必ず在り、個数が合同式で縛られる。**逆向きの Lagrange**', 'theorem', 'math', ['lagrange-theorem', 'group-action']),
  c('simple-group', '単純群', '正規部分群を持たない群。分解の行き止まり', 'definition', 'math', ['normal-subgroup']),
  c('jordan-holder', 'Jordan–Hölder の定理', '組成列の長さと単純因子は、取り方に依らない。**素因数分解と同じ形の一意性**', 'theorem', 'math', ['simple-group']),
  c('solvable-group', '可解群', 'アーベルな階段で単位元まで降りられる群', 'definition', 'math', ['jordan-holder']),

  // 環と可除性
  c('integral-domain', '整域', '零因子が無い環。約分ができる最小の条件', 'definition', 'math', ['ring']),
  c('euclidean-domain', 'Euclid 整域', '割り算に余りが定義できる環。**互除法が回る条件そのもの**', 'definition', 'math', ['integral-domain']),
  c('principal-ideal-domain', '単項イデアル整域', 'すべてのイデアルが一つの元で生成される', 'definition', 'math', ['euclidean-domain', 'ideal']),
  c('unique-factorization-domain', '一意分解整域', '既約元への分解が順序と単元を除いて一通り', 'definition', 'math', ['principal-ideal-domain']),
  c('ufd-hierarchy', '三つの条件は真に強さが違う', 'Euclid $arrow.r$ 単項 $arrow.r$ 一意分解。**どの矢印にも逆例がある**ので、どれを仮定したかを毎回言う必要がある', 'theorem', 'math', ['unique-factorization-domain']),
  c('gauss-lemma-polynomials', 'Gauss の補題', '一意分解整域上の多項式環も一意分解整域。**整数係数で既約なら、有理数係数でも既約**', 'theorem', 'math', ['unique-factorization-domain', 'polynomial-ring']),
  c('maximal-ideal-quotient-field', '極大イデアルで割ると体になる', '体を作る唯一の一般的な手口。有限体もここから出る', 'theorem', 'math', ['ideal', 'field']),

  // 体の拡大と Galois
  c('field-extension', '体の拡大', '大きい体を小さい体の上のベクトル空間と見る。**次数が線形代数の次元になる**', 'definition', 'math', ['field', 'vector-space']),
  c('tower-law', '次数の乗法性', '拡大を重ねると次数が掛かる。**作図不可能性はここだけで決まる**', 'theorem', 'math', ['field-extension']),
  c('algebraic-element', '代数的元と最小多項式', 'ある多項式の根になる元。最小多項式が一意に定まり、その次数が拡大の次数', 'definition', 'math', ['field-extension', 'polynomial-ring']),
  c('straightedge-compass-limit', '定規とコンパスで作れる数は 2 冪の拡大に限る', '角の三等分も立方倍積も、次数 3 が 2 冪を割らないことで終わる。**幾何の問題が整数の問題になる**', 'theorem', 'math', ['tower-law', 'algebraic-element']),
  c('splitting-field', '分解体', '多項式が一次因子に分かれるまで広げた体。同型を除いて一意', 'definition', 'math', ['algebraic-element']),
  c('galois-correspondence', 'Galois 対応', '中間体と部分群が、包含を逆にして一対一に対応する', 'theorem', 'math', ['splitting-field', 'subgroup-coset', 'normal-subgroup']),
  c('abel-ruffini', '五次方程式に根の公式は無い', '冪根で解けることと Galois 群が可解であることが同値。**5 次の対称群が可解でない**', 'theorem', 'math', ['galois-correspondence', 'solvable-group', 'symmetric-group']),
  c('impossibility-is-about-the-tool', 'できないのは方程式ではなく道具である', '五次方程式に解は在る。無いのは**冪根という道具で書く**方法。楕円モジュラー関数を許せば書ける', 'viewpoint', 'math', ['abel-ruffini']),

  // 有限体
  c('finite-field', '有限体', '位数は素数の冪に限り、その各位数にただ一つ在る。**存在も一意性も定理**', 'theorem', 'math', ['maximal-ideal-quotient-field', 'splitting-field']),
  c('frobenius-endomorphism', 'Frobenius 写像', '$p$ 乗が体の準同型になる。標数 $p$ でだけ起きる', 'theorem', 'math', ['finite-field']),
  c('finite-field-multiplicative-cyclic', '有限体の乗法群は巡回群', '生成元が一つ在る。**離散対数がそもそも定義できるのは、これのおかげ**', 'theorem', 'math', ['finite-field', 'cyclic-group']),
  c('discrete-log-assumption', '離散対数が難しいという仮定', '**定理ではない。**冪は速く計算でき、逆は速い方法が知られていない、というだけ', 'definition', 'math', ['finite-field-multiplicative-cyclic']),
]
