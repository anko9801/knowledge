#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "算術の形式化と対角化補題",
  date: "2026-08-17",
  field: "math",
  series: "logic",
  order: 9,
  tags: ("数理論理学",),
  summary: "論理式を数に置き換え、算術の中で算術について語らせる。自己言及を作る道具が対角化補題である。",
  provides: (
    "godel-numbering",
    "diagonal-lemma",
  ),
)

#let Fv = math.op("FV")
#let Prov = math.op("Prov")
#let Prf = math.op("Prf")

= 数の理論の中で、記号列を語る

前回で計算の定義が手に入った。残る仕事は、計算の話を#strong[算術の言語の中へ]持ち込むことである。

なぜそれが必要か。不完全性定理は「$upright("PA")$ には証明も反証もできない文がある」と言う。
その文を作るには、$upright("PA")$ の言語で
「……は $upright("PA")$ で証明できない」と述べなければならない。
ところが $upright("PA")$ の言語には $0$、$S$、$+$、$times$ しかない。
記号列も証明も語れない。

そこで、記号列に番号を振ってしまう。これが Gödel の符号化である。

= 算術の理論

先に足場を決める。強すぎない理論で不完全性が言えるほうが、定理として強い。

#definition[
  #strong[Robinson 算術] $upright("Q")$ を、次の有限個の公理からなる理論とする。
  $ & S x != 0, quad S x = S y arrow.r x = y, quad
      x != 0 arrow.r exists y med (x = S y) \
    & x + 0 = x, quad x + S y = S(x + y), quad
      x times 0 = 0, quad x times S y = x times y + x $
  #strong[Peano 算術] $upright("PA")$ は、これに帰納法の図式
  $ (phi.alt(0) and forall x med (phi.alt(x) arrow.r phi.alt(S x))) arrow.r forall x med phi.alt(x) $
  を（各論理式 $phi.alt$ について一本ずつ）加えたものである。
]<def:PA>

$upright("Q")$ は帰納法を持たないので、ずいぶん弱い。
$forall x med (0 + x = x)$ すら証明できない。
それでも不完全性定理には十分である、というのが後で効いてくる。

#definition[
  各自然数 $n$ に対し、数項 $bold(n)$ を
  $bold(0) := 0$、$bold(n+1) := S bold(n)$ と定める。
]<def:numeral>

数項は対象言語の項、$n$ はメタ言語の自然数である。
$bold(n)$ は「$n$ を指す名前」であって $n$ そのものではない。
この区別が今回いちばん間違えやすい場所になる。

= Gödel 符号化

#definition[
  各記号に番号を割り当て、記号列 $s_1 s_2 dots s_k$ に対し
  $ ⟦s_1 dots s_k⟧ := p_1^(a_1) dot p_2^(a_2) dots.c p_k^(a_k) $
  を対応させる（$p_i$ は $i$ 番目の素数、$a_i$ は $s_i$ の番号）。
  これを#strong[Gödel 数]と呼ぶ。
]<def:godel-number>

素因数分解の一意性から、Gödel 数から元の記号列が復元できる。
つまりこの対応は単射で、しかも復元手続きは機械的である。

証明も記号列の有限列なので、同じ要領で番号を振れる。
すると「$x$ は論理式の Gödel 数である」「$x$ は $y$ の証明の Gödel 数である」といった
述語が、自然数についての述語になる。

そしてこれらは、いずれも#strong[決定可能]である。
与えられた数を素因数分解して記号列に戻し、構文の規則を機械的に照合すればよい。

= 表現定理

決定可能な述語を、算術の論理式で書き表せるだろうか。書ける。これが Gödel の技術的な要である。

#definition[
  関係 $R subset.eq bb(N)^k$ が理論 $T$ で#strong[表現可能]であるとは、
  論理式 $phi.alt(x_1, dots, x_k)$ が存在して、任意の $arrow(n) in bb(N)^k$ について
  $ arrow(n) in R & quad => quad T tack.r phi.alt(bold(n_1), dots, bold(n_k)) \
    arrow(n) in.not R & quad => quad T tack.r not phi.alt(bold(n_1), dots, bold(n_k)) $
  が成り立つことをいう。
]<def:representable>

「真である」ではなく「証明できる」を要求しているところが要点である。
標準モデルで真なだけでは足りない。$T$ が実際に導けなければならない。

#theorem("表現定理")[
  決定可能な関係は $upright("Q")$ で表現可能である。
  同様に、計算可能な関数のグラフは $upright("Q")$ で表現可能である。
]<thm:representability>

#proof[
  完全な証明は長いので、要点を三段に分けて述べる。

  第一段。計算可能な関数は、基本関数（後者関数、射影、定数）から
  合成、原始再帰、最小化（$mu$ 作用素）で作られる関数として書ける。
  これは Turing 機械の動作を段階ごとに追う議論による。

  第二段。合成と最小化は、量化子と $+$、$times$ で素直に書ける。
  問題は原始再帰で、これは「途中の値を全部覚えておく」操作を必要とする。
  有限列を一つの数に押し込めなければならないが、それは Gödel 数と同じ手口でできる。
  実際には剰余を使う $beta$ 関数を用いるのが手軽である。
  $ beta(b, c, i) = b upright(" を ") (1 + (i+1) c) upright(" で割った余り") $
  という関数を使うと、任意の有限列を適当な $b, c$ の組で表せることが、
  中国剰余定理から従う。$+$、$times$、剰余だけで書けるので、算術の言語に収まる。

  第三段。こうして得た論理式が、$upright("Q")$ の弱い公理だけで
  必要な計算を実際に導けることを確かめる。
  ここは各段階で数項についての等式を潰していく作業で、
  帰納法が要らないのは、扱うのが具体的な数項に限られるからである。
]

#remark[
  第二段が「掛け算が入ると急に難しくなる」理由である。
  掛け算があると素因数分解や剰余が書けるので、
  有限列の符号化が論理式の中に作り込める。
  足し算だけの Presburger 算術ではこれができず、だから決定可能なままでいられる。

  符号化ができるということは、算術の言語が
  #strong[自分自身の構文を語れる]ということである。
  ここから先は、その自己言及能力をどう使うかの話になる。
]

= 証明可能性述語

道具が揃ったので、証明可能性を算術の言語で書く。

#definition[
  $T$ を帰納的に公理化できる理論とする。関係
  $ \{ ⟨m, n⟩ : m upright(" は ") T upright(" における Gödel 数 ") n upright(" の文の証明の Gödel 数") \} $
  は決定可能なので、@thm:representability より表現する論理式が取れる。
  それを $Prf_T (x, y)$ と書き、
  $ Prov_T (y) := exists x med Prf_T (x, y) $
  を#strong[証明可能性述語]と呼ぶ。
]<def:provability>

$Prov_T (bold(n))$ は「Gödel 数 $n$ の文は $T$ で証明可能である」と読める論理式である。
ただし、読めるだけであって、そう主張しているわけではない。
$Prov_T$ は $+$ と $times$ で書かれたただの論理式で、
それが証明可能性と対応しているのはメタ言語の側の事実である。

#proposition[
  $T supset.eq upright("Q")$ を帰納的に公理化できる理論とすると、
  $ T tack.r sigma quad => quad T tack.r Prov_T (⟦sigma⟧) $
]<prop:sigma1-completeness>

#proof[
  $T tack.r sigma$ とすると、実際の証明があり、その Gödel 数 $m$ が取れる。
  @thm:representability より $T tack.r Prf_T (bold(m), ⟦sigma⟧)$ であり、
  存在量化を付ければ結論が得られる。
]

逆向き、つまり $T tack.r Prov_T (⟦sigma⟧) => T tack.r sigma$ は自明ではない。
$T$ が嘘の証明の存在を主張してしまう可能性があるからで、
実際この向きは一般には成り立たない。この非対称性が第二不完全性定理で本質的になる。

= 対角化補題

最後に、自己言及を作る道具を用意する。これが今回の主役である。

#theorem("対角化補題")[
  $T supset.eq upright("Q")$ とする。任意の論理式 $psi(x)$ に対し、文 $sigma$ が存在して
  $ T tack.r sigma arrow.l.r psi(⟦sigma⟧) $
  が成り立つ。
]<thm:diagonal>

#proof[
  代入を行う関数を用意する。論理式 $theta(x)$ の Gödel 数 $n$ と数 $m$ に対し、
  $theta(bold(m))$ の Gödel 数を返す関数を $d(n, m)$ とする。
  これは記号列の操作なので計算可能であり、@thm:representability より
  $upright("Q")$ で表現できる。その論理式を $D(x, y, z)$ と書く
  （$z = d(x, y)$ を表現する）。

  ここで
  $ theta(x) := forall z med (D(x, x, z) arrow.r psi(z)) $
  とおき、$theta$ の Gödel 数を $k$ とする。そして
  $ sigma := theta(bold(k)) $
  と定める。

  $sigma$ の Gödel 数は $d(k, k)$ である。$D$ の表現性より
  $T tack.r D(bold(k), bold(k), ⟦sigma⟧)$ であり、
  さらに $d$ が関数であること（値が一意）も $upright("Q")$ で導けるので
  $ T tack.r forall z med (D(bold(k), bold(k), z) arrow.l.r z = ⟦sigma⟧) $
  が成り立つ。よって
  $ T tack.r sigma
    quad & <==>_(T) quad forall z med (D(bold(k), bold(k), z) arrow.r psi(z)) \
    quad & <==>_(T) quad psi(⟦sigma⟧) $
  すなわち $T tack.r sigma arrow.l.r psi(⟦sigma⟧)$ である。
]

何が起きたのかを整理しておく。$sigma$ は
「自分自身の Gödel 数について $psi$ が成り立つ」と述べる文である。
自分の名前を、自分の中に書き込むことに成功している。

トリックは $theta(x)$ に $x$ を#strong[二回]使ったところである。
一方は「どの論理式か」を指定するために、もう一方は「何を代入するか」を指定するために使う。
そこに同じ $k$ を入れると、対角線上で自己言及が生じる。

#remark[
  この構成は、計算機科学では不動点定理やクワイン（自分自身を出力するプログラム）として知られる。
  「自分のソースコードを持たないのに自分について語る」という芸当は、
  引用と代入を組み合わせれば実現できる、という一般的な現象である。

  #link("/math/logic/1")[第 1 回]で「日常言語の嘘つきのパラドクスは
  形式体系では起きない」と書いた。その理由がここで見える。
  対角化補題が作るのは $psi$ という#strong[すでに定義された]論理式についての自己言及であって、
  「真である」という述語そのものではない。
  「真である」を持ち込もうとすると破綻するのだが、それは次回の Tarski の定理の話になる。
]

材料はすべて揃った。$psi(x)$ に $not Prov_T (x)$ を入れれば、
「私は証明できない」と述べる文が手に入る。
次回はそれを使って、三つの定理を一気に証明する。
