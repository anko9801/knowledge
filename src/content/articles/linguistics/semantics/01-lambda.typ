#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "意味を計算する道具を用意する",
  date: "2026-08-21",
  field: "linguistics",
  series: "semantics",
  order: 1,
  tags: ("形式意味論",),
  summary: "文の意味を部分から組み上げたい。そのためには「まだ埋まっていない引数を持つ意味」を書ける記法が要る。λ 計算がそれで、型を付けると何と何が組めるかまで決まる。",
  provides: (
    "lambda-calculus",
    "simply-typed-lambda",
    "curry-howard",
  ),
)

= 「walks」に、歩く人はいない

「walks」の意味は何か。「歩く」という出来事ではない。
#strong[誰が歩くかが、まだ決まっていない]。
主語を受け取って初めて真偽が決まる。つまり意味そのものが#strong[関数]である。

なぜそこまで面倒な見方をするのか。
「太郎が walks」の意味が、「太郎」の意味と「walks」の意味から決まってほしいからである。
決まらないなら、有限個の語から無限の文を理解できることが説明できない。

この要求を#strong[合成性]と呼ぶ。#link("/linguistics/semantics/2")[次回]の主題である。

そして合成性を主張するには、道具が足りない。
「引数がまだ埋まっていない」状態を、そのまま書ける記法が要る。

= λ 計算

#definition[
  項を次の三つで作る。
  + 変数 $x$
  + 適用 $M N$（$M$ に $N$ を入れる）
  + 抽象 $lambda x. M$（$x$ を受け取って $M$ を返す関数）
]<def:lambda-term>

これだけである。数も真偽値も、組み込みでは無い。

計算規則も一つしかない。

#definition[
  $ (lambda x. M) N arrow.long.squiggly M[x := N] $
  （$M$ の中の $x$ を $N$ で置き換える）を#strong[$beta$ 簡約]と呼ぶ。
]<def:beta>

#strong[関数を作ることと、関数に値を入れること。この二つだけ]で計算になる。

#example[意味を関数として書く][
  「walks」の意味を
  $ lambda x. thin upright("walk")(x) $
  と書く。$x$ を受け取って真偽値を返す関数である。

  「太郎が walks」は適用
  $ (lambda x. thin upright("walk")(x))(upright("太郎"))
    arrow.long.squiggly upright("walk")(upright("太郎")) $
  になる。#strong[語を並べることが、関数適用になった。]
]

#remark[
  型を付けない λ 計算は、それだけで Turing 完全である。
  自然数も、真偽値も、再帰も、項として符号化できる。

  だが#strong[停止しない項が書ける]。
  $ (lambda x. x x)(lambda x. x x) arrow.long.squiggly (lambda x. x x)(lambda x. x x) $
  は永遠に簡約が続く。意味論の道具としては、これは困る。
  「この文の意味は計算が終わらない」では困るからである。
]

= 型を付ける

停止しない項を締め出す。方法は、#strong[何と何が組めるかを制限する]ことである。

#definition[
  基本型からはじめて、$sigma arrow tau$（$sigma$ を受け取って $tau$ を返す）で型を作る。
  項に型を割り当てる規則は二つ。
  $ frac(M : sigma arrow tau quad N : sigma, M N : tau) quad quad
    frac(x : sigma tack.r M : tau, lambda x. M : sigma arrow tau) $
]<def:typed-lambda>

左が適用、右が抽象である。
#strong[適用は、型が合うときだけできる。]

#theorem[
  型の付く項は、必ず有限回の簡約で停止する（強正規化）。
]<thm:normalization>

$(lambda x. x x)$ に型が付かないことが、証明の要点である。
$x$ を $x$ に適用するには、$x$ の型が $sigma arrow tau$ でも $sigma$ でもある必要があり、
そんな型は作れない。

#strong[型は「組めないものを組ませない」ための道具]である。
そして自然言語でも、まさにそれが要る。
「walks walks」が意味をなさないことを、型で説明したい。

= 型が命題になる

型付き λ 計算には、意味論とは別の顔がある。
これも後で効くので、触れておく。

@def:typed-lambda の規則を、型を命題と読み替えて眺めてみる。

$ frac(M : sigma arrow tau quad N : sigma, M N : tau) $

「$sigma$ ならば $tau$」と「$sigma$」から「$tau$」。#strong[三段論法である。]

$ frac(x : sigma tack.r M : tau, lambda x. M : sigma arrow tau) $

「$sigma$ を仮定して $tau$ が示せた」から「$sigma$ ならば $tau$」。
#strong[含意の導入である。]

#theorem("Curry--Howard 対応")[
  型付き λ 計算の型付け規則と、直観主義論理の自然演繹の推論規則は一致する。
  #strong[型は命題、項は証明、簡約は証明の正規化]である。
]<thm:curry-howard>

#link("/math/logic/4")[数理論理学 第 4 回]で証明体系を作ったが、
あれと同じものを、記号の側から見ていたことになる。

#table(
  columns: (auto, auto),
  [計算], [論理],
  [型 $sigma$], [命題 $sigma$],
  [項 $M : sigma$], [$sigma$ の証明],
  [$sigma arrow tau$], [$sigma arrow.r.double tau$],
  [$beta$ 簡約], [証明の正規化],
  [停止性], [カット除去],
)

#strong[プログラムを書くことと証明を書くことが、同じ作業である。]
定理証明支援系（Coq、Lean）は、この対応をそのまま実装したものになっている。

#check[
  @thm:curry-howard の表で、#strong[停止性]がカット除去に対応している。
  停止しないプログラムを書けてしまう言語では、
  この対応を通すと論理の側で何が起きるか。
][
  #strong[どんな命題でも証明できてしまう。]

  停止しない項が書けるなら、任意の型 $sigma$ について
  $ f = lambda x. f thin x $
  のような、自分を呼び続ける項が作れる。これは $sigma$ の「証明」を名乗るが、
  正規化しない。論理の側では、内容の無い証明で任意の命題が示せることになり、
  体系が壊れる。

  だから証明支援系は#strong[停止することを型で保証する]方向へ進む。
  Coq や Lean が素朴な再帰を許さず、構造的再帰や整礎再帰しか書かせないのは、
  この対応を保つためである。

  逆に言えば、普通のプログラミング言語が停止しない関数を書けるのは、
  #strong[論理として使う気が無い]からでもある。
]

#remark[
  対応するのは#strong[直観主義]論理であって、古典論理ではない。
  排中律 $sigma or not sigma$ に対応する項が、単純型付き λ 計算には無い。

  古典論理まで含めるには継続（call/cc）を足す必要がある。
  「証明から計算を取り出す」という観点では、
  この差が「構成的に示せるか」の差にそのまま対応している。
]

= 次に何が要るか

道具はそろった。

#table(
  columns: (auto, 1fr),
  [λ 抽象], [引数が埋まっていない意味を書ける],
  [適用], [語を並べることが、関数適用になる],
  [型], [組めないものを組ませない。停止性も保証される],
  [Curry--Howard], [型は命題、項は証明],
)

だが、まだ#strong[自然言語に一度も触れていない]。

次回、型を自然言語の側に割り当てる。
「太郎」は何型か、「歩く」は何型か、そして
「すべての学生」のような、名詞に見えて名詞でないものをどう扱うか。

そこで#strong[「すべての」が関数である]という、
最初は奇妙に見える結論が出る。
