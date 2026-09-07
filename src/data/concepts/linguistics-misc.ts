import type { Concept } from './types.ts'
import { c } from './types.ts'

export const linguisticsMisc: readonly Concept[] = [
  // --- 言語のうち、論理で決まる部分 ----------------------------------------------
  //
  // 「どの統語理論が正しいか」は経験的だが、
  // 「この文の意味をどう組み上げるか」は型付きλ計算で決まる。
  // λ 計算そのものは「型と計算」に置いてある。ここは言語学側の辺だけ。
  //
  // **測定を定理に変えているのは閉包性**（`docs/surveys.md`）。
  // スイスドイツ語で測れるのは有限個の文だが、正規集合を一つ掛けて
  // $a^m b^n c^m d^n$ を切り出すと、**文脈自由言語が交叉で閉じる**ことから
  // 無限の主張になる。有限の観測が、無限についての定理になる場所。
  c('compositionality', '合成性', '全体の意味は部分の意味と組み方で決まる', 'viewpoint', 'linguistics', ['simply-typed-lambda']),
  c('montague-semantics', 'モンタギュー意味論', '自然文を型付き λ 項に翻訳する', 'technique', 'linguistics', ['compositionality', 'structure-semantics']),
  c('generalized-quantifier', '一般化量化子', '「すべての」「ほとんどの」を集合の集合として扱う', 'definition', 'linguistics', ['montague-semantics']),

  // 統語 ── どの階層に入るか
  c('constituency', '構成素', '入れ替えや置き換えで、まとまって動く単位。**判定は操作で行う**', 'definition', 'linguistics', ['compositionality']),
  c('chomsky-hierarchy-placement', '自然言語がどの階層に入るか', '**正規言語では足りない**ことは早くに決着した。文脈自由で足りるかが長く争点だった', 'definition', 'linguistics', ['chomsky-hierarchy', 'finite-automaton']),
  c('pumping-lemma-argument', 'ポンプ補題は無限の主張である', '有限個の文を見て、**無限個について言い切る**。使えるのは、言語が閉包性を持つときだけ', 'technique', 'linguistics', ['chomsky-hierarchy-placement']),
  c('closure-under-intersection-with-regular', '正規集合との交叉で閉じる', '**この閉包性が、有限の観測を定理に変える。**言語全体ではなく、切り出した部分を調べればよくなる', 'theorem', 'linguistics', ['pumping-lemma-argument']),
  c('cross-serial-dependencies', '交差する依存', 'スイスドイツ語の $a^m b^n c^m d^n$。**入れ子ではなく交差するので、文脈自由に入らない**', 'theorem', 'linguistics', ['closure-under-intersection-with-regular']),
  c('mildly-context-sensitive', '弱文脈依存', '文脈自由の外だが、文脈依存ほど強くない帯。**多項式時間で解析でき、そこが要求になっている**', 'definition', 'linguistics', ['cross-serial-dependencies']),
  c('what-the-hierarchy-does-not-say', '階層は文法理論を決めない', '**同じ生成能力を持つ形式が複数ある。**どれが正しいかは、生成能力の外の証拠で決まる', 'viewpoint', 'linguistics', ['mildly-context-sensitive']),
  c('movement-as-a-dependency', '移動は長距離の依存である', '離れた二つの位置が結ばれる。**局所的な規則の繰り返しでは書けない**', 'definition', 'linguistics', ['constituency', 'cross-serial-dependencies']),
  c('island-constraints', '島の制約', '**取り出せない場所が在る。**どこから取れないかは統語構造だけで決まり、意味では決まらない', 'definition', 'linguistics', ['movement-as-a-dependency']),

  // 音韻 ── 制約の順序が形を決める
  c('phoneme-is-a-contrast', '音素は音ではなく対立である', '**同じ音が、言語によって別の音素にも同じ音素にもなる。**測っているのは区別のほう', 'definition', 'linguistics', ['relation-order']),
  c('distinctive-features', '弁別素性', '音素をさらに二値の素性に分ける。**規則が素性の上で簡潔に書ける、というのが根拠**', 'definition', 'linguistics', ['phoneme-is-a-contrast']),
  c('natural-class', '自然類', '**規則が言及する音の集まりが、素性の連言でちょうど書ける。**書けないなら素性の切り方が違う', 'theorem', 'linguistics', ['distinctive-features']),
  c('rule-ordering-matters', '規則の順序が出力を変える', '同じ規則の組でも、適用順で別の形になる。**順序そのものが理論の内容になる**', 'theorem', 'linguistics', ['natural-class']),
  c('constraint-ranking', '制約の順位付け', '規則を並べる代わりに、破ってよい順を決める。**同じ制約集合で、順位だけ変えると別の言語になる**', 'definition', 'linguistics', ['rule-ordering-matters']),
  c('factorial-typology', '順列が言語の型を数える', '**制約が $n$ 個なら、可能な言語は高々 $n!$ 個。**理論が予測する型の数が、有限で数えられる', 'theorem', 'linguistics', ['constraint-ranking']),
  c('typology-predicts-gaps', '予測される穴が、理論の検証になる', '**$n!$ の中に現れないはずの型が在り、それが見つかれば理論が反証される**', 'viewpoint', 'linguistics', ['factorial-typology']),
  c('finite-state-suffices-for-phonology', '音韻は有限状態で足りる', '**規則を合成しても正規言語の外へ出ない。**統語と音韻で、要る計算能力が違う', 'theorem', 'linguistics', ['rule-ordering-matters', 'finite-automaton']),

  // Brouwer は経済学のために置いていたが、あちらを落としても残す。
  // ホモロジーの到達点として正当なので、下流 0 の葉のままでよい。
]
