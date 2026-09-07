import type { Concept } from './types.ts'
import { c } from './types.ts'

export const modelTheory: readonly Concept[] = [
  // --- モデル理論と証明論 ------------------------------------------------------
  //
  // **既存の `logic` は完全性・Löwenheim–Skolem・不完全性で止まっていた。**
  // `compactness-theorem` が孤立していて、それを使う場所が無い。
  //
  // 軸は二つあって、どちらも**「同じ定理を、何の道具と見るか」**である。
  //
  // モデル理論は**コンパクト性を道具として使う** ── 有限で成り立つことから
  // 無限での存在を作る。超準解析も、有限体からの移行原理も、全部これ。
  //
  // 証明論は**証明そのものを対象にする** ── 何を落とすと何が証明できなくなるか。
  // カット除去が「証明に無駄な回り道が要らない」を定理にし、
  // 順序数解析が「その理論の強さ」を一つの順序数で測る。
  //
  // 対角化補題は既にあり、Lawvere の不動点定理へ辺が張ってある。
  // **ここはその隣で、対角化を使わない側**。
  c('theory-and-model', '理論とモデル', '文の集合と、それを満たす構造。**同じ理論に、似ていない model が在ることが出発点**', 'definition', 'math', ['satisfaction', 'structure-semantics']),
  c('compactness-builds-things', 'コンパクト性は、作る道具である', '**有限部分が全部充足可能なら、全体も充足可能。**「有限で言えること」から「無限が在る」を作る', 'viewpoint', 'math', ['compactness-theorem', 'theory-and-model']),
  c('nonstandard-models-of-arithmetic', '算術に、標準でない model が在る', '**「$n$ より大きい」を無限個足してコンパクト性を当てるだけ。**無限大の自然数が在る model が出る', 'theorem', 'math', ['compactness-builds-things', 'nonstandard-model']),
  c('nonstandard-analysis', '超準解析', '**無限小が実在する体を作る。**Leibniz の書き方が、そのまま正当化される', 'technique', 'math', ['nonstandard-models-of-arithmetic', 'field-extension']),
  c('transfer-principle', '移行原理', '**一階で書ける命題は、標準と超準で真偽が一致する。**だから超準で証明して標準へ持ち帰れる', 'theorem', 'math', ['nonstandard-analysis']),
  c('what-transfer-does-not-cover', '一階で書けないものは、移らない', '**「有界な集合は上限を持つ」は集合を量化するので移らない。**どこまで持ち帰れるかが構文で決まる', 'viewpoint', 'math', ['transfer-principle']),
  c('elementary-equivalence', '初等同値', '同じ一階の文を満たすこと。**同型より弱い** ── 区別できない構造が、実際に非同型でありうる', 'definition', 'math', ['theory-and-model', 'lowenheim-skolem']),
  c('categoricity-in-power', '濃度における範疇性', 'ある濃度で model が一つしかないこと。**可算濃度と非可算濃度で、まったく事情が違う**', 'definition', 'math', ['elementary-equivalence']),
  c('los-vaught-test', 'Łoś–Vaught の判定法', '**範疇的で有限 model を持たないなら、理論は完全。**完全性が、model を数えるだけで言える', 'theorem', 'math', ['categoricity-in-power']),
  c('morley-theorem', 'Morley の定理', '**一つの非可算濃度で範疇的なら、全部の非可算濃度で範疇的。**濃度の選び方に依らない', 'theorem', 'math', ['categoricity-in-power', 'cardinal']),
  c('quantifier-elimination', '量化子消去', '全ての式が、量化子の無い式と同値になること。**決定可能性がここから出る**', 'technique', 'math', ['theory-and-model']),
  c('real-closed-fields-are-decidable', '実閉体は決定可能である', '**Tarski。**幾何の命題が機械的に判定できる ── 不完全性定理が効かない場所が在る', 'theorem', 'math', ['quantifier-elimination', 'incompleteness-theorem']),
  c('why-arithmetic-is-different', '算術だけが違う理由', '**掛け算と足し算が両方在ると、対角化が組める。**片方だけなら決定可能（Presburger）', 'viewpoint', 'math', ['real-closed-fields-are-decidable', 'diagonal-lemma']),
  c('ax-grothendieck', 'Ax–Grothendieck の定理', '**複素多項式写像は、単射なら全射。**有限体で自明なことを、コンパクト性で複素数へ移す', 'theorem', 'math', ['compactness-builds-things', 'finite-field']),
  c('model-theory-proves-algebra', '代数の定理が、論理から出る', '**Ax–Grothendieck も Hilbert の零点定理も、model 論の道具で証明できる。**分野の境が、証明の道具では消える', 'viewpoint', 'math', ['ax-grothendieck']),
  c('types-and-saturation', '型と飽和性', '実現しうる性質の集まりを、点のように扱う。**model の「大きさ」を、型を実現する能力で測る**', 'definition', 'math', ['elementary-equivalence', 'compactness-builds-things']),
  c('stability-dividing-line', '安定性という分水嶺', '**型の個数が抑えられるかどうかで、理論が二つに割れる。**片側では構造定理が立ち、反対側では立たない', 'viewpoint', 'math', ['types-and-saturation', 'morley-theorem']),

  // 証明論 ── 証明を対象にする
  c('proof-as-an-object', '証明を対象にする', '**「真である」ではなく「導ける」を数学の対象にする。**構文だけを見て、意味を見ない', 'viewpoint', 'math', ['proof-system', 'godel-numbering']),
  c('sequent-calculus', 'シークエント計算', '規則を、前提と結論の形だけで書く。**論理結合子ごとに導入と除去が対になる**', 'definition', 'math', ['proof-as-an-object']),
  c('cut-elimination', 'カット除去定理', '**補題を使う証明は、使わない証明に書き直せる。**遠回りが原理的に不要だと言っている', 'theorem', 'math', ['sequent-calculus']),
  c('subformula-property', '部分論理式性', 'カットが無い証明には、結論の部分式しか現れない。**証明の探索空間が有限になる**', 'theorem', 'math', ['cut-elimination']),
  c('consistency-from-cut-elimination', '無矛盾性が、そこから出る', '**矛盾を導く証明は、カットが無ければ存在しえない。**意味論を一つも使わずに無矛盾性が言える', 'theorem', 'math', ['subformula-property']),
  c('cut-elimination-blows-up', '書き直すと、証明が指数的に長くなる', '**「不要」と「短くできる」は別。**カットは論理的には要らないが、実用では要る', 'theorem', 'math', ['cut-elimination']),
  c('cut-is-composition', 'カット除去は、正規化と同じものである', '**Curry–Howard で、証明の書き直しがプログラムの計算にあたる。**カットが関数適用', 'viewpoint', 'math', ['cut-elimination', 'curry-howard', 'strong-normalization']),
  c('ordinal-analysis', '順序数解析', '**理論の強さを、一つの順序数で測る。**その理論が超限帰納法を証明できる範囲の上限', 'technique', 'math', ['consistency-from-cut-elimination', 'transfinite-induction']),
  c('gentzen-consistency', 'Gentzen の無矛盾性証明', '**算術の無矛盾性が、$epsilon_0$ までの超限帰納法から出る。**不完全性定理と矛盾しない ── 使った原理が算術の外に在る', 'theorem', 'math', ['ordinal-analysis', 'incompleteness-theorem']),
  c('what-consistency-proofs-buy', '無矛盾性の証明が、何を買っているか', '**「絶対に正しい」ではなく「この原理を認めれば」。**どこまで還元したかが成果物である', 'viewpoint', 'math', ['gentzen-consistency']),
  c('reverse-mathematics', '逆数学', '**定理から公理を導く。**どの定理にどれだけの強さが要るかを、五つの体系で測る', 'viewpoint', 'math', ['ordinal-analysis', 'proof-as-an-object']),
  c('most-theorems-need-little', 'ほとんどの定理は、弱い体系で足りる', '**中間値定理も Heine–Borel も、算術の少し上で証明できる。**強い公理が要る定理のほうが少ない', 'theorem', 'math', ['reverse-mathematics']),
]
