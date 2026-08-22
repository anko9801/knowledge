#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "順序数と超限帰納法",
  date: "2026-08-17",
  field: "math",
  series: "set-theory",
  order: 3,
  tags: ("集合論",),
  summary: "整列順序に目盛りを打つ。von Neumann の妙案、超限再帰、そして Cantor 標準形まで。",
  provides: (
    "ordinal",
    "transfinite-induction",
  ),
)

#let pred = math.op("pred")
#let otp = math.op("otp")
#let ON = $upright(sans("On"))$

= 目盛りを集合で作る

#link("/math/set-theory/2")[第 2 回] の比較定理により、
整列順序たちは同型を除いて一列に並ぶことが分かった。
ならばその列に目盛りを打ちたい。「この整列順序の形は $alpha$ である」と言えるようにしたいのだ。

素朴に考えれば、目盛りとは同型類のことである。同じ形の整列順序を全部集めて、
それを一つの目盛りとみなす。ところが、これは駄目である。同型類は真のクラスになってしまう。
またこの壁か、と言いたくなるが、集合論をやっていると本当によく出くわす壁だ。

そこで von Neumann が出した答えが実に見事だった。同型類を作る代わりに、
各類から代表元を一つずつ選ぶ。しかも、次のような都合のよい代表を選ぶのである。

$ 0 := nothing, quad 1 := \{0\}, quad 2 := \{0, 1\}, quad 3 := \{0, 1, 2\}, quad dots $

$n$ という集合の中身は、$n$ より小さい数の全体になっている。
そして順序はというと、$in$ そのものである。$2 in 3$ だから $2 < 3$ だ。

順序を別に用意しなくていい、というのがこの定義の恐ろしく賢いところである。
目盛り自身が、自分より小さい目盛りを全部要素として抱えている。
初めて見たときは、うまくやったものだと唸った。

この性質を公理的に取り出そう。

#definition[
  集合 $x$ の任意の要素が同時に $x$ の部分集合でもあるとき、すなわち
  $forall y in x med (y subset.eq x)$ のとき、$x$ は#strong[推移的]であるという。
  同じことだが $union.big x subset.eq x$ と書いてもよい。
]<def:transitive>

「要素が部分集合でもある」というのは、慣れるまで気持ちが悪い。
$3 = \{0, 1, 2\}$ で $2 = \{0, 1\}$ だから、確かに $2 in 3$ かつ $2 subset.eq 3$ である。
要素と部分集合の区別が崩れているようで不安になるが、崩しているのはこの定義のほうで、
そういう集合だけを相手にすると宣言している、というだけの話だ。

#check[
  集合論はここまで、$in$ と $subset.eq$ を厳しく区別してきた。
  混ぜると内包原理のときのように体系が壊れる。
  @def:transitive はその区別を崩している。#strong[壊れないのか。]
][
  #strong[区別を捨てたのではなく、両方が成り立つ集合に限って話している。]

  $in$ と $subset.eq$ は相変わらず別の関係である。
  推移的であるとは「この集合では、要素であるものが部分集合でもある」という
  #strong[条件]であって、二つの関係を同じものだと言っているのではない。
  条件を満たさない集合はいくらでもある（$\{\{0\}\}$ は推移的でない）。

  そして限ったことが利益になっている。$3 = \{0, 1, 2\}$ のように
  自分より小さいものを全部抱えていれば、#strong[順序を別に用意しなくてよい]。
  $2 < 3$ を $2 in 3$ で済ませられる。

  目盛りを作るのに同型類を使えなかった（真のクラスになる）ので、
  代表元を選ぶ必要があった。@def:transitive は、
  #strong[選ぶ代表を都合のよいものに絞る条件]である。
]

#definition("von Neumann の順序数")[
  推移的な集合 $alpha$ であって、$in$ が $alpha$ 上の整列順序になっているものを
  #strong[順序数]と呼ぶ。順序数全体のクラスを $ON$ と書き、
  $alpha < beta :<=> alpha in beta$ と定める。
]<def:ordinal>

正則性公理があるおかげで、$in$ の非反射性と整礎性は最初から保証されている。
だから実際に確認すべきなのは、推移性と $in$ による三分律くらいのものである。

= 順序数の基本性質

これから示す五つは、以後ずっと使う。長いが、一度通しておく価値がある。

#theorem[
  + $alpha$ が順序数で $y in alpha$ ならば、$y$ も順序数であって $y = pred(alpha, y, in)$。
  + $alpha, beta$ が順序数で $alpha tilde.equiv beta$ ならば $alpha = beta$。
  + $alpha, beta$ が順序数なら、$alpha in beta$、$beta in alpha$、$alpha = beta$ のちょうど一つが成り立つ。
  + $alpha, beta, gamma$ が順序数で $alpha in beta in gamma$ ならば $alpha in gamma$。
  + 順序数からなる空でない集合 $C$ には $in$-最小元がある。
]<thm:ord-basic>

#proof[
  (1) $alpha$ は推移的だから $y subset.eq alpha$ であり、$in$ は $alpha$ 上で整列順序なので、
  その部分集合 $y$ の上でも整列順序である。$y$ の推移性を見よう。$z in w in y$ とすると、
  $w in alpha$ より $w subset.eq alpha$ だから $z in alpha$ である。
  $alpha$ 上で $in$ は推移律を満たすので $z in w$ と $w in y$ から $z in y$。
  よって $y$ は順序数。また $y subset.eq alpha$ より
  $pred(alpha, y, in) = \{z in alpha : z in y\} = y$ となる。

  (2) $f : alpha -> beta$ を同型とし、$f$ が恒等写像でないと仮定する。
  $\{x in alpha : f(x) != x\}$ の $in$-最小元を $x$ とすると、$x$ より小さい要素の上で $f$ は恒等である。
  同型は切片を切片に写すので、(1) を使って
  $ f(x) = f[pred(alpha, x, in)] = pred(beta, f(x), in) = x $
  となり、$f(x) != x$ に矛盾する。よって $f$ は恒等写像で $alpha = beta$。

  (3) まず $alpha inter beta$ が順序数であることに注意する
  （推移的集合の共通部分は推移的で、整列性は部分集合に遺伝する）。
  $gamma := alpha inter beta$ とおき、$gamma != alpha$ かつ $gamma != beta$ と仮定しよう。
  $gamma subset.eq alpha$ かつ $gamma != alpha$ だから、(1) より $gamma$ は $alpha$ の真の切片、
  つまり $gamma in alpha$ である。同様に $gamma in beta$。
  すると $gamma in alpha inter beta = gamma$ となって $gamma in gamma$、正則性に反する。
  よって $gamma = alpha$ か $gamma = beta$、すなわち $alpha subset.eq beta$ か $beta subset.eq alpha$ である。
  真の包含は (1) より $in$ を意味するので、三つのうち少なくとも一つが成り立つ。
  二つ同時に成り立てば $in$ の循環ができて正則性に反するので、排他性も従う。

  (4) $gamma$ が推移的である、というそのままの主張である。

  (5) $gamma in C$ を任意に取る。$gamma inter C = nothing$ なら、(3) より $gamma$ 自身が $in$-最小元である。
  そうでなければ $gamma inter C$ は $gamma$ の空でない部分集合だから、$gamma$ の整列性より
  $in$-最小元 $delta$ を持つ。(3) と $gamma$ の推移性から、$delta$ は $C$ 全体の $in$-最小元になる。
]

(3) と (5) を合わせると、$ON$ は $in$ で整列されていることになる。
ならば $ON$ 自身が順序数ではないのか、と思うだろう。私も思った。実はそこに罠がある。

#theorem("Burali-Forti の逆理")[
  $ON$ は集合ではない。
]<thm:burali-forti>

#proof[
  $ON$ が集合だと仮定する。@thm:ord-basic (1) より $ON$ は推移的であり、
  (3)(5) より $in$ で整列されている。よって $ON$ は順序数の定義を満たすので $ON in ON$ となるが、
  これは正則性（$x in.not x$）に反する。
]

歴史的にはこれは逆理として発見された。Cantor も Burali-Forti も、
これで頭を抱えたわけである。ところが公理を整えた後では、
「$ON$ は真のクラスでした」という定理が一つ増えるだけで終わる。
危機が定理に格下げされる瞬間が、私はこの分野で一番好きだ。

#proposition[
  順序数からなる集合 $A$ に対して $union.big A$ は順序数であり、$A$ の上限 $sup A$ になる。
]<prop:sup>

#proof[
  推移的集合の和集合は推移的であり、要素はすべて順序数だから
  @thm:ord-basic (3)(5) より $in$ で整列されている。よって $union.big A$ は順序数である。
  各 $alpha in A$ に対し $alpha subset.eq union.big A$ すなわち $alpha <= union.big A$ なので上界であり、
  $beta < union.big A$ なる $beta$ はある $alpha in A$ に属するから上界にはなれない。
  よって最小の上界である。
]

ここで $alpha <= beta$ は $alpha in beta$ または $alpha = beta$ の意味だが、
これは $alpha subset.eq beta$ と同値になる。
#strong[順序数の $<$ は $in$、$<=$ は $subset.eq$]。この辞書はこの先ずっと使うので、覚えておいてほしい。
上限が和集合というのも、慣れると気持ちがよい。

= 表現定理

準備が整ったので、当初の目的を果たそう。

#theorem("整列順序の表現")[
  任意の整列順序 $⟨A, R⟩$ に対し、$⟨A, R⟩ tilde.equiv alpha$ となる順序数 $alpha$ が
  ただ一つ存在する。これを $⟨A, R⟩$ の#strong[順序型]と呼び $otp(A, R)$ と書く。
]<thm:representation>

#proof[
  一意性は @thm:ord-basic (2) から従うので、存在を示す。
  $ B := \{a in A : exists alpha in ON med (⟨pred(A, a, R), R⟩ tilde.equiv alpha)\} $
  とおく。すなわち「手前の部分がすでに順序数で表せている」ような $a$ を集めたものである。
  一意性より各 $a in B$ に対応する順序数はただ一つなので、置換公理により
  $ C := \{alpha : exists a in B med (⟨pred(A, a, R), R⟩ tilde.equiv alpha)\} $
  は集合であり、$f : a |-> alpha$ は $B$ から $C$ への全単射になる。
  定義から $f$ は順序を保つ。

  $B$ は $A$ の切片である。実際 $a in B$ かつ $b R a$ なら、
  $pred(A, a, R)$ を表す順序数の切片を取れば $b$ に対応する順序数が得られる。

  ここで $B != A$ と仮定すると、$B = pred(A, a, R)$ なる $a in A$ が存在する。
  いま作った $f$ は $⟨pred(A, a, R), R⟩ tilde.equiv C$ を与えている。
  そして $C$ は順序数の集合であり、推移的でもある
  （$alpha in C$ の要素は、より手前の切片の順序型としてやはり $C$ に属する）。
  よって $C$ は順序数であり、$a$ 自身が $B$ の条件を満たしてしまう。
  これは $B = pred(A, a, R)$、すなわち $a in.not B$ に矛盾する。

  よって $B = A$ であり、$f$ が $⟨A, R⟩ tilde.equiv C$ を与える。
]

これで、整列順序の分類が順序数の比較に還元された。
形を比べたければ順序数を比べればよい。長さを測る物差しが手に入ったわけだ。

なお、この証明では置換公理が本質的に効いている。
$B$ の各点に順序数を対応させたものを「集めて一つの集合にする」ところである。
置換なしでは、この当たり前に見える一歩が踏めない。

= 後続と極限

#definition[
  $alpha^+ := alpha union \{alpha\}$ を $alpha$ の#strong[後続]と呼び、$alpha + 1$ とも書く。
  $alpha = beta^+$ なる $beta$ が存在するとき $alpha$ を#strong[後続順序数]、
  $alpha != 0$ かつ後続でない順序数を#strong[極限順序数]と呼ぶ。
]<def:succ>

#proposition[
  $alpha$ が順序数なら $alpha^+$ も順序数であり、$alpha < beta$ なる順序数のうち最小のものである。
  また $alpha$ が極限順序数であることと $alpha = sup alpha = union.big alpha$ は同値である。
]

#proof[
  推移性と整列性は定義から直接確かめられる。$alpha < beta$ とすると $alpha in beta$ であり、
  $beta$ は推移的だから $alpha subset.eq beta$、よって $alpha^+ = alpha union \{alpha\} subset.eq beta$、
  すなわち $alpha^+ <= beta$ である。
  後半は、$union.big alpha$ が $alpha$ の要素全体の上限であること（@prop:sup）と、
  $alpha = gamma^+$ のとき $union.big alpha = gamma < alpha$ となることから従う。
]

#definition[
  $omega$ を最小の極限順序数とし、その要素を#strong[自然数]と呼ぶ。
]<def:omega>

$omega$ の存在は無限公理から来る。無限公理が与える集合 $x$
（$nothing in x$ で後続について閉じている）から、
「順序数であって、自分自身もその要素もすべて $0$ か後続順序数であるもの」を分出すればよい。
それが $omega$、つまり我々の知っている自然数全体である。
自然数を定義するのに、こんなに遠回りをしたことになる。

#theorem("順序数の帰納法")[
  順序数のクラス $C subset.eq ON$ が次の三つを満たすならば $C = ON$ である。
  + $0 in C$
  + $alpha in C => alpha^+ in C$
  + 極限順序数 $lambda$ について、$forall alpha < lambda med (alpha in C)$ ならば $lambda in C$
]<thm:ord-induction>

#proof[
  $C != ON$ と仮定すると $ON without C$ は空でない。
  $beta in ON without C$ を一つ取り、$beta^+ inter (ON without C)$ を考えると、
  これは空でない順序数の集合なので @thm:ord-basic (5) より $in$-最小元 $alpha$ を持つ。
  この $alpha$ は $ON without C$ 全体の最小元でもある。
  すると $alpha$ 未満の順序数はすべて $C$ に属することになるが、
  $alpha = 0$、後続、極限のいずれの場合でも仮定 1--3 から $alpha in C$ が出てしまい、矛盾。
]

$0$ と後続と極限。この三分割は、この先あらゆる場面で顔を出す。
定義するときも、証明するときも、まずこの三つに場合分けする。
超限的な議論の型のようなものだと思ってよい。

= 超限再帰

帰納法が証明の道具なら、再帰は定義の道具である。
「$alpha$ での値を、それ未満での値たちから決める」という形で関数を定義したい。
有限の場合なら誰も疑問に思わないが、超限の場合はちゃんと正当化が要る。

#theorem("超限再帰")[
  クラス関数 $G : V -> V$ が与えられたとき、
  $ forall alpha in ON med (F(alpha) = G(F|_alpha)) $
  を満たすクラス関数 $F : ON -> V$ がただ一つ存在する。
]<thm:recursion>

#proof[
  「ある順序数 $delta$ を定義域とする関数 $f$ であって、任意の $alpha < delta$ に対し
  $f(alpha) = G(f|_alpha)$ を満たすもの」を#emph[近似]と呼ぶことにする。

  まず、二つの近似は共通の定義域の上で一致する。
  一致しない点があれば最小のもの $alpha$ が取れるが、それより下では一致しているので
  $f|_alpha = g|_alpha$ であり、$f(alpha) = G(f|_alpha) = G(g|_alpha) = g(alpha)$ となって矛盾する。

  次に、各 $delta$ に対し定義域 $delta$ の近似が存在することを @thm:ord-induction で示す。
  $delta = 0$ なら空関数がそれである。$delta = gamma^+$ なら、定義域 $gamma$ の近似 $f$ に
  $f(gamma) := G(f)$ を付け足せばよい。$delta$ が極限なら、
  各 $gamma < delta$ の近似（一意性よりただ一つ）を全部集めて和を取ればよい。

  そこで $F(alpha) := f(alpha)$（$f$ は定義域 $alpha^+$ の近似）と定めれば、
  一致性より値は $f$ の取り方によらず、条件を満たす。
  一意性も、最小の反例を取る同じ議論から従う。
]

極限段階の「全部集めて和を取る」ところが、実は一番危ない。
$delta$ の各点に近似を対応させたクラス関数の像が集合でなければ、集めることができないからだ。
ここで置換公理が効いている。置換のない体系では、超限再帰は $omega$ を超えたあたりで止まってしまう。

公理を並べていた段階では、置換は地味な公理に見えたのではないだろうか。
だが実際に使ってみると、超限の議論はほぼ置換で支えられていることが分かる。

= 順序数の算術

超限再帰の最初の応用が算術である。

#definition[
  $ alpha + 0 & = alpha, quad & alpha + beta^+ & = (alpha + beta)^+, quad
    & alpha + lambda & = sup_(beta < lambda) (alpha + beta) \
    alpha dot 0 & = 0, quad & alpha dot beta^+ & = alpha dot beta + alpha, quad
    & alpha dot lambda & = sup_(beta < lambda) (alpha dot beta) \
    alpha^0 & = 1, quad & alpha^(beta^+) & = alpha^beta dot alpha, quad
    & alpha^lambda & = sup_(beta < lambda) alpha^beta $
  ここで $lambda$ は極限順序数、冪の場合は $alpha > 0$ とする。
]<def:ord-arith>

右側の引数について再帰している、という点に注目してほしい。
順序的に言えば、$alpha + beta$ は「$alpha$ の後ろに $beta$ を並べた」整列順序の順序型、
$alpha dot beta$ は「$alpha$ を $beta$ 回並べた」順序型である。

さて、この算術は我々の常識をあっさり裏切る。

#example[
  $ 1 + omega = sup_(n < omega) (1 + n) = omega != omega + 1 $
  $ 2 dot omega = sup_(n < omega) (2 dot n) = omega != omega dot 2 = omega + omega $
  加法も乗法も可換ではないのである。
]

なぜこうなるかは、並べ方で考えると腑に落ちる。
$1 + omega$ は「先頭に一つ置いてから、その後ろに自然数を全部並べた」ものだ。
これは全体として見れば、ただの自然数の並びと同じ形である。先頭の一つは飲み込まれてしまう。
$omega + 1$ のほうは、自然数を全部並べた#strong[後ろ]に一つ置く。
この最後の一つは、どの自然数よりも後ろにいて、決して飲み込まれない。

左から足したものは極限に飲まれ、右から足したものは末尾に残る。
順序数の算術に慣れるコツは、この非対称性を毎回思い出すことである。

#proposition[
  + 加法と乗法は結合的で、左分配律 $alpha dot (beta + gamma) = alpha dot beta + alpha dot gamma$ が成り立つ。
  + 右の引数については狭義単調である。すなわち $beta < gamma => alpha + beta < alpha + gamma$、
    また $alpha > 0$ なら $beta < gamma => alpha dot beta < alpha dot gamma$。
  + 左の引数については単調だが、狭義ではない。$beta <= gamma => beta + alpha <= gamma + alpha$。
]<prop:arith>

#proof[
  いずれも $gamma$ についての @thm:ord-induction による。
  たとえば (2) の加法の場合を書いておく。$beta < gamma$ とする。
  $gamma = beta^+$ なら $alpha + gamma = (alpha + beta)^+ > alpha + beta$。
  $gamma$ が極限なら $beta^+ < gamma$ なので
  $ alpha + gamma = sup_(delta < gamma) (alpha + delta) >= alpha + beta^+ > alpha + beta $
  である。
  (3) が狭義でないことは、$1 < 2$ でありながら $1 + omega = 2 + omega = omega$ となることから分かる。
]

右と左で扱いが違うのは気持ちが悪いが、これは定義が右の引数について再帰しているせいである。
定義を眺めていれば、そうなるべくしてなっていると分かる。

#theorem("減法と除法")[
  $alpha <= beta$ ならば $alpha + xi = beta$ なる順序数 $xi$ がただ一つ存在する。
  また $alpha > 0$ ならば、任意の $beta$ に対して
  $beta = alpha dot xi + rho$ かつ $rho < alpha$ なる $xi, rho$ がただ一組存在する。
]<thm:division>

#proof[
  前半。$xi := otp(\{eta : alpha <= eta < beta\}, in)$ とおく。
  $beta$ の並びを $alpha$ 未満の部分とそれ以降に切って並べ直しただけなので、$alpha + xi = beta$ である。
  一意性は @prop:arith (2) の狭義単調性から従う。

  後半。$alpha dot xi <= beta$ となる $xi$ の全体を考える。$alpha >= 1$ より
  $xi <= alpha dot xi <= beta$ なので、この全体は $beta^+$ に含まれる集合であり、
  @prop:sup より上限を持つ。上限もこの条件を満たすので、これを最大元 $xi$ とすると
  $ alpha dot xi <= beta < alpha dot xi^+ = alpha dot xi + alpha $
  である。前半より $alpha dot xi + rho = beta$ なる $rho$ がただ一つ取れ、
  上の不等式と狭義単調性から $rho < alpha$ が従う。
]

これで割り算ができるようになった。割り算ができれば、位取り記数法が作れる。

#theorem("Cantor 標準形")[
  任意の順序数 $alpha > 0$ は
  $ alpha = omega^(beta_1) dot c_1 + omega^(beta_2) dot c_2 + dots.c + omega^(beta_k) dot c_k $
  の形にただ一通りに書ける。ここで $k >= 1$、$beta_1 > beta_2 > dots.c > beta_k$ は順序数、
  各 $c_i$ は $0$ でない自然数である。
]<thm:cnf>

#proof[
  存在を $alpha$ についての帰納法で示す。$beta <= omega^beta$ なので
  $omega^beta <= alpha$ を満たす $beta$ の全体は $alpha^+$ に含まれる集合であり、最大元 $beta_1$ を持つ。
  @thm:division を $omega^(beta_1)$ で使って
  $ alpha = omega^(beta_1) dot c + rho, quad rho < omega^(beta_1) $
  と書く。ここで $c < omega$ である。実際 $c >= omega$ とすると
  $omega^(beta_1) dot omega = omega^(beta_1 + 1) <= alpha$ となり、$beta_1$ の最大性に反する。
  また $rho < alpha$ だから帰納法の仮定より $rho$ は標準形を持ち、
  $rho < omega^(beta_1)$ よりその指数はすべて $beta_1$ 未満である。連結すれば $alpha$ の標準形になる。

  一意性を見る。$c < omega$ かつ $beta < beta'$ なら
  $omega^beta dot c < omega^(beta + 1) <= omega^(beta')$ なので、
  先頭項の指数が大きいほうが必ず大きい。よって二つの表示があれば先頭の指数は一致し、
  さらに @thm:division の一意性から係数も一致する。
  先頭を消して残りに同じ議論を繰り返せば、全体が一致する。
]

要するに $omega$ を底とする位取り記数法である。有限の桁数で書けるところが嬉しい。

#remark[
  ただし、指数の位置にもまた順序数が現れる。ということは、
  $alpha = omega^alpha$ を満たす順序数があってもおかしくない。実際ある。最小のものが
  $ epsilon_0 = sup \{omega, omega^omega, omega^(omega^omega), dots\} $
  で、ここから先は Cantor 標準形がありがたみを失う（自分自身を指数に含んでしまうからだ）。
  この $epsilon_0$ は Peano 算術の証明論的順序数として知られていて、
  Gentzen は $epsilon_0$ までの超限帰納法を使って Peano 算術の無矛盾性を証明した。
  順序数がこんなところで効いてくるとは、最初は思わないだろう。
]

= 順序数では大きさを測れない

最後に、大事な注意をしておきたい。順序数は#strong[順番]の目盛りであって、
#strong[大きさ]の目盛りではない。

$omega$ と $omega + 1$ と $omega dot 2$ と $omega^omega$ は、順序数としては全部違う。
ところが集合としての大きさを比べると、全部同じである。どれも可算集合だ。
$omega + 1$ は末尾に一つ足しただけなので、番号を一つずつずらせば $omega$ と一対一に対応する。

つまり、並べ方を変えただけで順序数はいくらでも増えるが、大きさは増えない。
大きさを測りたければ、順序数のうち「新しい大きさが始まるところ」だけを拾わなければならない。
それが基数であり、#link("/math/set-theory/4")[第 4 回] の主題である。
