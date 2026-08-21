#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "自分に自分を適用できると、意味が付かなくなる",
  date: "2026-08-21",
  field: "cs",
  series: "types",
  order: 1,
  tags: ("型と計算",),
  summary: "関数の適用と抽象だけで計算を書くと、関数が自分自身を食える。すると意味を与える先の集合が一点に潰れる。この一つの障害への応答が二つあり、片方が型で、もう片方がドメイン理論だった。型の側から出るものを、この回で追う。",
  provides: (
    "lambda-calculus",
    "church-rosser",
    "evaluation-strategy",
    "simply-typed-lambda",
    "strong-normalization",
    "domain-theory",
    "denotational-semantics",
    "curry-howard",
    "polymorphism",
    "parametricity",
    "type-inference",
  ),
)

= 書けるものに、意味が付かない

関数を作ることと、関数に食わせること。道具はこの二つしかない。
変数まで数えて三つで、それ以上は何も足さない。

これで数も真偽値も対も書ける。計算する機械としては、もう足りている。

ところが、この記法で書いた式に#strong[意味]を与えようとすると、
#strong[割り当て先が一点しかなくなる]。
$0$ も、足し算も、止まらない計算も、全部が同じものを指すことになる。

新しい道具は要らない。#link("/math/set-theory/4")[Cantor の定理]だけで出る。

= 適用と抽象だけで、計算が書ける

#definition[
  #strong[λ 項]は次の三つだけで作る。

  #table(
    columns: (auto, auto, 1fr),
    [変数], [$x$], [名前],
    [抽象], [$lambda x. M$], [$x$ を受け取って $M$ を返す関数],
    [適用], [$M N$], [$M$ に $N$ を食わせる],
  )

  計算は一つの規則だけで進む。
  $ (lambda x. M) N arrow.r M[x := N] $
]<def:lambda>

数から書き下してみる。

#example[数を関数で書く][
  $n$ を「関数を $n$ 回繰り返す」と読む。
  $ 0 := lambda f. lambda x. x, quad
    1 := lambda f. lambda x. f x, quad
    2 := lambda f. lambda x. f (f x) $

  足し算は繰り返しを繋ぐだけになる。
  $ upright("add") := lambda m. lambda n. lambda f. lambda x. m f (n f x) $
]

#theorem("Church--Rosser")[
  簡約の順序を変えても、行き着く先は高々一つである。
  $M$ から二通りに簡約して $N_1$、$N_2$ が得られたなら、
  両方から到達できる $L$ がある。
]<thm:church-rosser>

#corollary[
  正規形があれば、それは一意である。
]<cor:unique-normal>

@thm:church-rosser が、#strong[式を値で置き換えてよい]ことの根拠である。
どこから簡約しても同じ所に着くので、順序を気にせず書き換えられる。

#remark[
  「高々一つ」であって「必ずある」ではない。
  $ (lambda x. x x)(lambda x. x x) arrow.r (lambda x. x x)(lambda x. x x) arrow.r dots.c $
  は、いくら簡約しても同じ形に戻る。#strong[止まらない項が書ける。]

  だから順序は答えの#strong[中身]には効かないが、
  #strong[答えが出るかどうか]には効く。
  引数を先に簡約する流儀は、止まらない引数を渡された時点で止まらなくなる。
  必要になるまで簡約しない流儀なら、使われない引数は評価されずに済む。
]

= 自己適用が、意味を潰す

@def:lambda には型が無い。だから#strong[何にでも何でも食わせられる]。

上に出てきた $lambda x. x x$ がそれで、自分自身を引数に取っている。
書けてしまう。では、この体系に#strong[意味]を与えるとどうなるか。

各項に何らかの対象を割り当てたい。項の集まりを $D$ と書く。
$lambda x. M$ は関数なので $D$ から $D$ への写像に対応し、
適用はその写像を使うことになる。

だが自己適用が書けるので、#strong[写像そのものも $D$ の要素でなければならない]。

#theorem[
  $abs(D) >= 2$ のとき、$D$ と $D$ から $D$ への写像全体との間に、
  一対一の対応は存在しない。
]<thm:no-model>

#proof[
  写像全体の濃度は $abs(D)^abs(D)$ である。
  $abs(D) >= 2$ なら
  $ abs(D)^abs(D) >= 2^abs(D) > abs(D) $
  で、最後の不等号は#link("/math/set-theory/4")[Cantor の定理]である。
  真に大きいので、一対一には対応しない。
]

#corollary[
  #strong[素朴に集合で意味を与えようとすると、$D$ は一点集合しかない。]
  すべての項が同じものを指すので、意味として使えない。
]<cor:collapse>

初めて読むと、証明は追えるのに納得できない。
いま動いている処理系は何なのか、と思う。

動いている。潰れたのは#strong[素朴に集合で意味を与えようとした側]であって、
計算の側ではない。$lambda$ 項は書き換え規則としては何も困っていなくて、
困るのは「この式は何を指しているのか」に答えようとしたときだけである。

そして#strong[応答は二つあった]。

#table(
  columns: (auto, 1fr),
  [型を付ける], [自己適用が書けないようにする。$1940$ 年],
  [集合をやめる], [写像を全部は取らない。$1969$ 年],
)

先に前者を追う。

= 型を付けると、自己適用が消える

#definition[
  型を次の二つで作る。基本型と、$sigma arrow tau$（$sigma$ を受けて $tau$ を返す）。

  項に型を割り当てる規則は三つである。
  変数はその型を持ち、$lambda x : sigma. M$ は $M : tau$ なら $sigma arrow tau$、
  $M : sigma arrow tau$ と $N : sigma$ から $M N : tau$。
]<def:stlc>

#proposition[
  $x x$ には型が付かない。
]<prop:no-self>

#proof[
  $x : sigma$ とする。適用の規則より、左の $x$ は $sigma arrow tau$ の形でなければならない。
  つまり $sigma = sigma arrow tau$ が要る。

  だが右辺は左辺より真に大きい構文木を持つので、有限の型として等しくなれない。
]

@prop:no-self が @cor:collapse の回避策である。
#strong[潰していた当の項が、書けなくなった。]

だが代償がある。

#theorem("強正規化")[
  型の付く項は、どの順序で簡約しても必ず止まる。
]<thm:sn>

#corollary[
  単純型付き λ 計算は#strong[万能ではない]。
  停止しない計算が書けないので、計算可能な関数の一部しか表現できない。
]<cor:not-universal>

#proof[
  停止性が保証されているので、
  #link("/math/logic/8#thm-halting")[停止問題]が決定不能な体系にはなりえない。
]

ここで自分の読み違いを疑うと思う。
型の付く言語で無限ループはいくらでも書けるのだから、
どこかを読み落としたのではないか、と。

読み落としてはいない。#strong[実際の言語は、@thm:sn を壊す仕掛けを別に足している。]
再帰を言語の側の機能として持ち込むと、@def:stlc の規則からは出てこない項が書ける。
無限ループが書けるのは、足したその仕掛けのおかげである。

#strong[表現力と、意味が付くことの取引になっている。]

#check[
  型を付けると自己適用が消え、そのぶん停止性が手に入った。
  では、なぜ実際の言語は再帰を足して、その停止性を捨てるのか。
][
  #strong[捨てないと、書きたいものが書けないからである。]

  @cor:not-universal より、型が付く項だけでは計算可能な関数を全部は書けない。
  止まらない可能性のある計算を書けるようにするには、@thm:sn を壊すしかない。

  これは#link("/cs/programs/1")[プログラムの構成]の言い方でいえば移し替えである。
  停止することを保証してもらう代わりに書けるものを減らすか、
  書けるものを増やす代わりに停止を自分で保証するか。
]

= 型が命題になる

型を付けた副産物として、思わぬ対応が出てくる。

#theorem("Curry--Howard")[
  型と命題、項と証明が、次のように一対一に対応する。

  #table(
    columns: (auto, 1fr),
    [$sigma arrow tau$], [$sigma$ ならば $tau$],
    [$sigma times tau$], [$sigma$ かつ $tau$],
    [$sigma + tau$], [$sigma$ または $tau$],
    [項が型を持つ], [その命題に証明がある],
    [簡約], [証明の余計な回り道を取り除くこと],
  )
]<thm:ch>

対応の要は、関数の適用と三段論法が同じ形をしていることである。
$sigma arrow tau$ と $sigma$ から $tau$ を得るのと、
「$sigma$ ならば $tau$」と $sigma$ から $tau$ を導くのは、書き下すと同じ規則になる。

#remark[
  この対応の下では、@thm:sn が#strong[証明を簡単にする手続きが必ず終わる]ことを意味する。
  そして @cor:not-universal は、#strong[止まらない証明は証明でない]と読める。

  再帰を無制限に足すと、$sigma$ が何であれ「証明」が作れてしまう。
  型の側で万能性を捨てているのは、論理の側では#strong[無矛盾性を守っている]ことになる。
]

= 型を引数に取る

$lambda x : sigma. x$ は $sigma$ ごとに別の項になる。同じことを何度も書きたくない。

#definition[
  型そのものを受け取れるようにする。
  $ upright("id") := Lambda alpha. lambda x : alpha. x
    quad : quad forall alpha. alpha arrow alpha $
]<def:system-f>

これで一つ書けば済む。そして#strong[思ったより多くのことが言えるようになる]。

#theorem("パラメトリシティ")[
  多相な項は、型引数の取り方によらず#strong[一様に振る舞う]。
  したがって、その型だけから成り立つ等式が導ける。
]<thm:parametricity>

#example[型だけで中身が決まる][
  $f : forall alpha. alpha arrow alpha$ を持つ項は、恒等関数しかない。

  $alpha$ について何も知らないので、$f$ は受け取った値を検査できない。
  作れる値も無い。#strong[返せるのは受け取ったものだけである。]

  同じ理屈で $forall alpha. alpha$ の項は存在しない。
  何も受け取らずに、何も知らない型の値を作ることはできない。
]

#corollary[
  実装を差し替えても、多相な利用者からは区別できない。
]<cor:repr-independence>

@cor:repr-independence が、#link("/cs/programs/1")[プログラムの構成]で
#strong[隠すことの定理版]として使ったものである。

#remark[
  ただし#strong[共有された可変参照があると成り立たない]。
  参照を通せば、外から中身の違いが観測できてしまう。

  純粋な設定でしか言えず、命令型では所有権のような追加の縛りが要る。
  #strong[隠したつもりが隠れていないことがある]のは、ここに理由がある。
]

= 型を書かなくても、復元できる

型を全部書くのは面倒である。書かなくても決まる場合がある。

#theorem("Hindley--Milner")[
  ある種の体系では、型注釈の無い項に対して
  #strong[最も一般的な型]が計算できる。存在すれば一意である。
]<thm:hm>

やり方は素直で、型を未知数と置いて、
適用のたびに等式を立て、#strong[単一化]で解く。

#example[等式を立てて解く][
  $lambda f. lambda x. f (f x)$ に型を付ける。

  $f : a$、$x : b$ と置く。$f x$ が要るので $a = b arrow c$。
  $f (f x)$ が要るので $c = b$。よって $a = b arrow b$ となり、全体は
  $ (b arrow b) arrow b arrow b $
  で、$b$ は何でもよい。#strong[最も一般的な型が一つ決まった。]
]

#remark[
  @def:system-f の全部を許すと、この計算はできなくなる。
  型推論が決定不能になるからである。

  だから実際の言語は#strong[$forall$ を先頭にしか置けない形]に制限している。
  推論できることと、書ける型の広さの取引で、ここでも移し替えが起きている。
]

= もう一つの応答

@cor:collapse への応答は、型のほかにもう一つあった。

#strong[写像を全部は取らない。]
$D$ に順序を入れて、順序を保つ写像だけを $D arrow D$ と数える。
すると @thm:no-model の濃度の議論が効かなくなる。

#definition[
  底を持ち、増大列の上限が必ず存在する順序集合を考える。
  その上の#strong[連続]な写像だけを取ると、
  $D_infinity tilde.eq [D_infinity arrow D_infinity]$ を満たすものが作れる。
]<def:domain>

底は#strong[止まらない計算]を表す。
連続性を課すのは、有限の情報から答えを近づけていく計算の性質に合わせるためで、
この条件のもとでは#strong[不動点が必ず取れる]。
再帰が意味を持つのは、そこである。

#remark[
  型を付ける道は#strong[書けるものを減らして]障害を避け、
  こちらは#strong[数える写像を減らして]避けている。

  同じ一つの障害への、二つの応答である。歴史の偶然で二つあるのではない。
]

= 次に何をするか

型が付いた。等式で推論できる（@thm:church-rosser）。
実装を隠せる（@cor:repr-independence）。

だが#strong[入出力ができない]。
画面に出す、ファイルを読む、乱数を引く。
どれも @thm:church-rosser を壊す。同じ式が違う値になってしまう。

#link("/cs/types/2")[次回]、作用を値として扱う方法を追う。
モナドがそこで出てくるが、#strong[出発点は「合成できること」だけ]である。
そしてモナドは積み重ねると壊れるので、その先まで行く。
