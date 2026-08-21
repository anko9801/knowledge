#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "基数と濃度",
  date: "2026-08-17",
  field: "math",
  series: "set-theory",
  order: 4,
  tags: ("集合論",),
  summary: "無限の大きさを比べる。Cantor の対角線論法から基数算術、そして連続体仮説の入口まで。",
  provides: (
    "cardinal",
    "cantor-theorem",
  ),
)

#let otp = math.op("otp")
#let ran = math.op("ran")
#let ON = $upright(sans("On"))$
#let card(x) = $lr(|#x|)$

= 無限の大きさを比べたい

無限に大小はあるか。これは長いあいだ、まともに扱ってはいけない問いだった。
Galileo は、自然数と平方数が一対一に対応してしまうことに気づいて困惑している。
$1, 2, 3, dots$ と $1, 4, 9, dots$ は、明らかに後者のほうが「少ない」はずなのに、
きれいに対応がつく。だから無限には大小など考えられない、というのが当時の結論だった。

Cantor はここで発想を逆にした。対応がついてしまうなら、#strong[それを同じ大きさと呼べばよい]。
部分のほうが小さい、という有限での常識のほうを捨てるのである。

#definition[
  全単射 $f : A -> B$ が存在するとき $A approx B$ と書き、$A$ と $B$ は#strong[対等]であるという。
  単射 $f : A -> B$ が存在するとき $A prec.eq B$、
  $A prec.eq B$ かつ $A approx.not B$ のとき $A prec B$ と書く。
]<def:equinumerous>

$approx$ が反射的・対称的・推移的であることは、恒等写像・逆写像・合成から直ちに分かる。
同値関係のようなものだが、あくまで「ようなもの」である。
これはクラスの上の関係であって、商を取ろうとすると真のクラスが出てくる。この話は後でやる。

= Cantor--Schröder--Bernstein

$prec.eq$ が順序らしく振る舞うためには、$A prec.eq B$ かつ $B prec.eq A$ なら $A approx B$、
つまり反対称性が要る。有限なら当たり前だが、無限では自明ではない。
互いに単射があるからといって、その二つを組み合わせて全単射が作れるとは限らないように見える。

ところが、作れるのである。しかも選択公理を使わずに。

#theorem("Cantor--Schröder--Bernstein")[
  $A prec.eq B$ かつ $B prec.eq A$ ならば $A approx B$。
]<thm:csb>

#proof[
  単射 $f : A -> B$ と $g : B -> A$ を取る。$A$ の要素を、
  $g^(-1), f^(-1), g^(-1), dots$ と交互に遡っていくことを考える。
  遡れなくなったところがどちら側かで $A$ を分類したい。

  正確には次のようにする。$C_0 := A without g[B]$ とおき、
  $ C_(n+1) := g[f[C_n]], quad C := union.big_(n in bb(N)) C_n $
  と定める。$C$ は「$A$ 側で遡り止まる要素から出発して辿り着けるもの」の全体である。
  そして
  $ h(x) := cases(f(x) & quad (x in C), g^(-1)(x) & quad (x in.not C)) $
  と定める。$x in.not C$ のとき $x in.not C_0$、すなわち $x in g[B]$ なので、
  $g$ の単射性から $g^(-1)(x)$ はただ一つに定まる。よって $h$ は $A$ から $B$ への関数である。

  $h$ が単射であることを見る。$f$ も $g^(-1)$ も単射なので、
  問題になるのは $x in C$ と $y in.not C$ で $f(x) = g^(-1)(y)$ となる場合だけである。
  このとき $y = g(f(x))$ であり、$x in C_n$ なる $n$ を取れば
  $y in g[f[C_n]] = C_(n+1) subset.eq C$ となって $y in.not C$ に矛盾する。

  $h$ が全射であることを見る。$b in B$ を取る。$g(b) in C$ ならば $g(b) in C_(n+1)$ なる $n$ があり、
  $C_(n+1) = g[f[C_n]]$ と $g$ の単射性から $b = f(x)$ なる $x in C_n subset.eq C$ が存在する。
  よって $b = h(x)$。$g(b) in.not C$ ならば $h(g(b)) = g^(-1)(g(b)) = b$ である。

  よって $h$ は全単射であり、$A approx B$。
]

証明の要は、$A$ を二つの領域に分けて、片側では $f$ を、
もう片側では $g$ の逆を使う、というところである。
どこで境界を引くかが問題で、それを「遡り続けたときの行き先」で決めている。
選択公理を使っていない点も見逃せない。無限回の選択に見えるが、
$C$ は $f, g$ から一意に決まる集合として書けている。

= Cantor の定理

大小が比べられるようになったので、次は「もっと大きい無限はあるか」である。ある。しかも簡単に作れる。

#theorem("Cantor")[
  任意の集合 $A$ に対し $A prec cal(P)(A)$。
]<thm:cantor>

#proof[
  $x |-> \{x\}$ は $A$ から $cal(P)(A)$ への単射なので $A prec.eq cal(P)(A)$ である。
  $A approx cal(P)(A)$ を否定すればよい。

  全射 $f : A -> cal(P)(A)$ が存在したとする。
  $ D := \{x in A : x in.not f(x)\} $
  とおく。これは分出により $A$ の部分集合、すなわち $D in cal(P)(A)$ である。
  $f$ は全射だから $f(d) = D$ なる $d in A$ が存在する。ここで $d in D$ かどうかを問うと、
  $ d in D <=> d in.not f(d) = D $
  となって矛盾する。よって全射は存在せず、とくに全単射も存在しない。
]

見覚えのある形だろう。@thm:cantor の証明は Russell の逆理と同じ骨格をしている。
違うのは、Russell では体系が壊れたのに対し、ここでは
「$cal(P)(A)$ のほうが真に大きい」という有益な結論が出ているところだ。
同じ論法が、置かれる文脈次第で災難にも道具にもなる。

これで無限の大きさは一つではないことが分かった。
$bb(N) prec cal(P)(bb(N)) prec cal(P)(cal(P)(bb(N))) prec dots$ と、いくらでも大きくなる。

#definition[
  $A approx bb(N)$ のとき $A$ を#strong[可算無限]、
  高々可算とは有限または可算無限のことをいう。
]

#proposition[
  + 可算集合の可算和は可算である（選択公理を使う）。
  + $bb(Q)$ は可算である。
  + $bb(R)$ は非可算である。
]<prop:countable>

#proof[
  (1) 各 $A_n$ について全射 $f_n : bb(N) -> A_n$ を選び（ここで可算選択公理を使っている）、
  $⟨n, m⟩ |-> f_n (m)$ を考えると、$bb(N) times bb(N)$ から $union.big_n A_n$ への全射が得られる。
  $bb(N) times bb(N) approx bb(N)$ は、$⟨n, m⟩ |-> 2^n (2 m + 1) - 1$ が全単射であることから従う。

  (2) $bb(Q)$ の各元は既約分数として整数の対で表せるので $bb(Q) prec.eq bb(Z) times bb(Z) approx bb(N)$、
  逆に $bb(N) subset.eq bb(Q)$ だから @thm:csb より $bb(Q) approx bb(N)$。

  (3) 全射 $f : bb(N) -> bb(R)$ があったとして、$f(n)$ の小数展開の第 $n$ 位を見て、
  それと異なる数字（たとえば $4$ か $5$ のうち一致しないほう）を第 $n$ 位に持つ実数 $r$ を作る。
  $r$ はどの $f(n)$ とも第 $n$ 位で異なるので $r in.not ran f$ となり、全射性に矛盾する。
  $4$ と $5$ に限ったのは、$0.999 dots = 1.000 dots$ のような二重表現を避けるためである。
]

(1) にわざわざ「選択公理を使う」と書いたのは、意地悪ではない。
各 $A_n$ から番号づけを一つずつ選ぶ、というところで無限回の選択をしている。
$upright("ZF")$ だけでは「可算集合の可算和が非可算になる」モデルが作れてしまうのだ。
このあたりの話は #link("/math/set-theory/5")[第 5 回] でやる。

#check[
  @prop:countable の (2) と (3) を見比べてほしい。$QQ$ は可算で、$RR$ は非可算である。
  どちらも $RR$ の中で稠密に散らばっているのに、片方だけ数え上げられる。
  #strong[数え上げを妨げているのは何か。]
][
  稠密さではない。$QQ$ も稠密なのに数え上げられている。

  効いているのは#strong[有限の記述で名指しできるか]である。有理数は整数の対で
  書けるので、対を並べる順番を決めれば全部に番号が振れる。実数にはその手が無い。

  そして対角線論法は、番号を振ったと仮定した時点で
  「$n$ 番目と第 $n$ 位で違う数」を作れてしまう。$RR$ の非可算性は、
  実数が多いことではなく#strong[並べたそばから漏れが作れること]から出ている。

  同じ骨格が @thm:cantor にもある。あちらは「$f(x)$ に属さない $x$ を集める」で、
  こちらは「$n$ 桁目を変える」。どちらも、与えられた対応から外れる要素を
  一つ作って見せる論法である。
]

= 基数をどう定義するか

さて、ここからが本題である。「$A$ の大きさ」という#strong[もの]を定義したい。
素朴には、$A$ と対等な集合を全部集めて $card(A)$ と呼びたくなる。

だがこれは駄目である。$A != nothing$ なら、$A$ と対等な集合は真のクラスをなす。
どんな集合 $x$ を持ってきても、それを使って $A$ と対等な集合が作れてしまうからだ。
またしても同じ壁である。

回避の道は二つある。

一つ目は、代表元を選ぶ道である。#link("/math/set-theory/3")[第 3 回] で
順序数を作ったときと同じ発想で、同じ大きさの集合たちから代表を一つ選ぶ。
順序数は $in$ で整列されているので、「$A$ と対等な順序数のうち最小のもの」という選び方ができる。

ただし、これには $A$ が何らかの順序数と対等でなければならない。
つまり $A$ が整列可能でなければならず、それを保証するのが選択公理である。

#definition[
  自分より小さいどの順序数とも対等でない順序数を#strong[基数]と呼ぶ。
  $A$ が整列可能なとき、$A$ と対等な最小の順序数を $card(A)$ と書く。
]<def:cardinal>

有限順序数はすべて基数である。$omega$ も基数だが、$omega + 1$ は基数ではない。
$omega + 1 approx omega$ だからだ。
無限基数とは要するに「そこから新しい大きさが始まる順序数」のことである。

二つ目の道は、選択公理を使わずに済ませたい人のためのものだ。

#remark("Scott のトリック")[
  $A$ と対等な集合すべてではなく、そのうち#strong[階数が最小のものだけ]を集める。
  累積階層 $V_alpha$（#link("/math/set-theory/6")[第 6 回]）を使うと
  「最小の $alpha$ で $V_alpha$ に $A$ と対等な集合が現れるもの」が決まり、
  そこで切り取れば集合になる。これを $card(A)$ と定義してもよい。
  選択公理は要らないが、代わりに正則性公理が要る。
  うまい手だと思う。壁を壊すのではなく、壁の手前で刈り取っているわけだ。
]

以下では選択公理を仮定して、一つ目の道を採る。

= 大きい基数はいくらでもある

Cantor の定理から $cal(P)(A)$ は $A$ より大きいので、基数はいくらでも大きくなる。
だが実は、冪集合を使わなくても大きい基数が作れる。しかも選択公理なしで。

#theorem("Hartogs")[
  任意の集合 $A$ に対し、$alpha prec.eq A$ とならない順序数 $alpha$ が存在する。
  そのような最小の順序数を $h(A)$ と書くと、これは基数である。
]<thm:hartogs>

#proof[
  $W := \{⟨X, R⟩ : X subset.eq A and R subset.eq X times X and ⟨X, R⟩ upright("は整列順序")\}$ とおく。
  これは $cal(P)(A) times cal(P)(A times A)$ からの分出なので集合である。
  各 $⟨X, R⟩ in W$ にその順序型 $otp(X, R)$ を対応させると、
  置換公理よりその像 $H$ は順序数の集合になる。

  $H$ は推移的である。実際 $beta in otp(X, R) in H$ なら、$beta$ は $⟨X, R⟩$ のある切片の順序型であり、
  切片は $A$ の部分集合上の整列順序だから $beta in H$ である。
  順序数からなる推移的な集合は順序数なので、$H$ 自身が順序数である。

  $H in.not H$（正則性）だから、$H$ は $A$ に単射しない。もし単射 $H -> A$ があれば、
  その像に $H$ の順序をコピーして $A$ 上の整列順序が作れ、$H = otp(dots) in H$ となってしまうからだ。
  一方 $alpha < H$ なる $alpha$ はすべて $A$ に単射する。よって $H = h(A)$ である。

  最後に $H$ が基数であること。$H approx beta$ なる $beta < H$ があれば、
  $beta$ は $A$ に単射するので $H$ も $A$ に単射してしまい、矛盾する。
]

冪集合を一度も使っていないところが偉い。
$cal(P)(A)$ を経由して大きい集合を作ると、その大きさが $A$ とどう関係するのかが
まったく分からない（それが連続体仮説である）。
Hartogs の方法なら「$A$ より真に大きい基数」を、制御された形で確保できる。

#definition("アレフ")[
  $ aleph_0 := omega, quad aleph_(alpha + 1) := h(aleph_alpha), quad
    aleph_lambda := sup_(alpha < lambda) aleph_alpha quad (lambda upright("は極限")) $
]<def:aleph>

$aleph_(alpha+1)$ は $aleph_alpha$ の次に大きい基数である。
選択公理を仮定すれば、すべての無限基数はどれかの $aleph_alpha$ に一致する
（どんな集合も整列できるので、その大きさは順序数として現れる）。

= 基数算術

基数どうしの足し算・掛け算・冪を定義しよう。

#definition[
  $card(A) = kappa$、$card(B) = lambda$、$A inter B = nothing$ のとき
  $ kappa + lambda := card(A union B), quad
    kappa dot lambda := card(A times B), quad
    kappa^lambda := card({}^B A) $
  ここで ${}^B A$ は $B$ から $A$ への関数全体である。
]<def:card-arith>

順序数の算術と記号が同じなので、初学者は必ず混乱する。私も混乱した。
$omega + 1 != omega$ だが $aleph_0 + 1 = aleph_0$ である。
同じ $+$ に見えて、まったく別の演算なのだ。
どちらの意味で使っているかは文脈で判断するしかない。

有限の場合は普通の算術と一致する。問題は無限の場合で、これが拍子抜けするほど簡単になる。

#theorem("Hessenberg")[
  任意の無限基数 $kappa$ に対し $kappa dot kappa = kappa$。
]<thm:hessenberg>

#proof[
  $kappa times kappa$ に次の順序（Gödel の順序）を入れる。
  $ ⟨alpha, beta⟩ < ⟨gamma, delta⟩ :<=>
    cases(
      max(alpha, beta) < max(gamma, delta) & ,
      max(alpha, beta) = max(gamma, delta) upright("かつ") ⟨alpha, beta⟩ upright("が辞書式に小さい") & ,
    ) $
  まず最大値で比べ、それが同じなら辞書式で比べる、というだけのものである。
  これが整列順序になることは、$max$ の値と各成分がいずれも順序数として整列していることから従う。

  さて、主張が偽だとして、反例となる最小の無限基数を $kappa$ とする。
  すなわち任意の無限基数 $lambda < kappa$ に対し $lambda dot lambda = lambda$ が成り立つとしてよい
  （有限の場合は明らかである）。

  $kappa times kappa$ の上の Gödel 順序の順序型を $gamma$ とする。
  $kappa prec.eq kappa times kappa$ は明らかなので $gamma >= kappa$ である。
  もし $gamma > kappa$ なら、順序型 $kappa$ の切片が存在する。
  すなわちある $⟨alpha, beta⟩ in kappa times kappa$ があって、
  それより手前の部分の順序型が $kappa$ になる。

  ところが $xi := max(alpha, beta) < kappa$ とおくと、Gödel 順序の定義より
  この切片は $(xi + 1) times (xi + 1)$ に含まれている。
  $kappa$ は基数だから $card(xi + 1) < kappa$ であり、
  帰納法の仮定（$xi + 1$ が無限なら $card(xi+1) dot card(xi+1) = card(xi+1)$、有限なら自明）より
  $ card((xi + 1) times (xi + 1)) = card(xi + 1) < kappa $
  となる。切片の順序型が $kappa$ なら、その濃度も $kappa$ でなければならないから、これは矛盾である。

  よって $gamma = kappa$、すなわち $kappa times kappa approx kappa$ である。
]

この定理の帰結が強烈で、無限基数の足し算と掛け算は事実上消えてしまう。

#corollary[
  $kappa, lambda$ の少なくとも一方が無限ならば
  $ kappa + lambda = kappa dot lambda = max(kappa, lambda) quad (kappa, lambda != 0) $
]<cor:absorb>

#proof[
  $mu := max(kappa, lambda)$ とおく。
  $mu <= kappa + lambda <= mu + mu <= mu dot 2 <= mu dot mu = mu$、
  同様に $mu <= kappa dot lambda <= mu dot mu = mu$ である。
  @thm:csb（あるいは順序数としての反対称性）より、すべて等号になる。
]

つまり無限基数の世界では、足しても掛けても大きいほうに飲み込まれるだけである。
$aleph_0 + aleph_0 = aleph_0$、$aleph_0 dot aleph_0 = aleph_0$、
$aleph_1 + aleph_0 = aleph_1$。演算表を覚える必要すらない。

では、大きさが本当に増えるのはどこか。冪だけである。

#theorem[
  $ card(cal(P)(A)) = 2^(card(A)), quad kappa < 2^kappa $
]<thm:power>

#proof[
  部分集合 $X subset.eq A$ に特性関数 $chi_X : A -> \{0, 1\}$ を対応させると、
  $cal(P)(A)$ と ${}^A \{0, 1\}$ の間の全単射が得られる。よって前半が成り立つ。
  後半は @thm:cantor そのものである。
]

#definition("ベート数")[
  $ beth_0 := aleph_0, quad beth_(alpha + 1) := 2^(beth_alpha), quad
    beth_lambda := sup_(alpha < lambda) beth_alpha $
]<def:beth>

= 連続体仮説

ここで、当然の疑問が湧く。$2^(aleph_0)$ は $aleph$ の階段のどこにいるのか。

$2^(aleph_0) > aleph_0$ は Cantor の定理から分かる。
そして $aleph_1$ は $aleph_0$ の次の基数だった。ならば $2^(aleph_0) = aleph_1$ ではないか。
これが#strong[連続体仮説] $upright("CH")$ である。すべての $alpha$ について
$2^(aleph_alpha) = aleph_(alpha+1)$ を要求するものを一般連続体仮説 $upright("GCH")$ と呼ぶ。

Cantor はこれを証明しようとして、生涯うまくいかなかった。
Hilbert は 1900 年の講演で、これを 23 の問題の第一に置いた。
そして決着はというと、こうである。

- Gödel (1938)：$upright("ZFC")$ から $upright("CH")$ の否定は証明できない。
- Cohen (1963)：$upright("ZFC")$ から $upright("CH")$ も証明できない。

つまり $upright("CH")$ は $upright("ZFC")$ から独立である。
証明も反証もできない。頑張れば解けるという類の問題ではなかったのだ。

これは「まだ分かっていない」のとは違う。公理が足りない、ということが分かっている状態である。
$2^(aleph_0)$ の値は、$upright("ZFC")$ の範囲では $aleph_1$ かも知れないし $aleph_(17)$ かも知れない。
ただし何でもよいわけではなく、König の定理から
$ upright("cf")(2^(aleph_0)) > aleph_0 $
という制約はかかる。だから $2^(aleph_0) = aleph_omega$ はあり得ない。
共終数 $upright("cf")$ が何者かと、独立性がどうやって証明されたのかは、
#link("/math/set-theory/6")[第 6 回] で扱う。

順序数のときと同じで、基数もまた「作った本人が中身を把握しきれない」道具である。
冪集合の公理を書いた瞬間に、我々は自分の手に負えないものを呼び出してしまったのだ、
と言うこともできる。
