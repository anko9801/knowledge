#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "光子とグルーオンを分けるのは掛ける順序だけ",
  date: "2026-09-02",
  field: "physics",
  series: "gauge-theory",
  order: 1,
  tags: ("ゲージ場の量子論",),
  summary: "懐中電灯を二本交差させても何も起きませんが、グルーオンは互いにぶつかります。この差は、各点で選べる量が数から行列に変わったことだけから出ます。微分を二つ並べて順を入れ替えると二次の項が残り、三点結合と四点結合と物質との結合が、同じ一つの定数で決まります。そして質量項が書けなくなります。",
  provides: (
    "non-abelian-gauge",
    "field-strength-covariant",
    "gauge-self-interaction",
    "gauge-forbids-mass",
  ),
)

= 懐中電灯を二本交差させても何も起きない

暗い部屋で懐中電灯を二本、光の筋が交わるように向けます。

#strong[何も起きません。] 交わったところが明るくなることも、筋が曲がることも、
跳ね返ることもない。光は光を素通りします。

陽子の中でも、力を伝えるものが飛び交っています。グルーオンと呼ばれます。

#strong[こちらは素通りしません。] グルーオン同士がぶつかって、別の向きへ飛びます。

#strong[力を伝えるものが、自分の伝える力を受けています。]

何を足すとこうなるのか、を出します。

#strong[足していません。] 電磁気で使ったのと同じ組み立てを、たった一つだけ
変えます。#strong[各点で選べる量を、数から行列に替える。] それだけです。

先に、この回で出ないものを言っておきます。#strong[どの行列を使うかは決まりません。]
自然が $S U(3)$ と $S U(2)$ を使っている理由は、この枠組みからは出ません。
そして書き下した式は、#strong[誰も解いていません。] 出るのは形だけです。

その形が、思ったより多くを決めます。

#link("/physics/renormalization/3")[くりこみ 第 3 回]で、結合の強さが
エネルギーとともに逆向きに走るには、#strong[力を伝える粒子自身が電荷を
持っていなければならない]というところまで来ていました。

#strong[その粒子を、ここで作ります。]

= 位相を各点で選び直すと余計な項が出る

電子の波動関数 $psi(x)$ について、測れるのは $abs(psi)^2$ です。#strong[位相は
測れません。]

だから位相を全体で一斉にずらしても、何も変わりません。$psi arrow.r e^(i alpha) psi$
としても $abs(psi)^2$ は動かない。

#strong[各点で別々にずらしてよい、と要求します。] $alpha$ を定数ではなく
$x$ の関数にします。

$ psi(x) arrow.r e^(i alpha(x)) psi(x) $

$abs(psi)^2$ は相変わらず動きません。#strong[微分のほうが動きます。]

$ partial_mu (e^(i alpha(x)) psi)
  = (partial_mu e^(i alpha(x))) psi + e^(i alpha(x)) partial_mu psi
  = e^(i alpha) (partial_mu psi + i (partial_mu alpha) psi) $

まとめて書くと

$ partial_mu psi arrow.r e^(i alpha) (partial_mu + i partial_mu alpha) psi $

です。$psi$ のほうは $e^(i alpha)$ が掛かるだけでした。#strong[微分には
$i partial_mu alpha$ が余計に付きます。]

余計な項を打ち消す相手を、外から持ってきます。場 $A_mu (x)$ を用意して、
微分を取り替えます。

#definition[
  定数 $g$ を一つ選んで
  $ D_mu = partial_mu - i g A_mu $
  と置いたものを#strong[共変微分]と呼ぶ。
]<def:covariant-derivative>

$A_mu$ の変換の仕方は、まだ決めていません。#strong[打ち消すように決めます。]

$ A_mu arrow.r A_mu + (1) / (g) partial_mu alpha $

これで確かめます。

$ D_mu psi
  &arrow.r (partial_mu - i g A_mu - i partial_mu alpha) (e^(i alpha) psi) \
  &= e^(i alpha) (partial_mu psi + i (partial_mu alpha) psi)
     - i g A_mu e^(i alpha) psi - i (partial_mu alpha) e^(i alpha) psi \
  &= e^(i alpha) (partial_mu psi + i (partial_mu alpha) psi
     - i g A_mu psi - i (partial_mu alpha) psi) \
  &= e^(i alpha) (partial_mu - i g A_mu) psi $

#strong[$i partial_mu alpha$ が二つ出て、消えました。] 残ったのは
$e^(i alpha) D_mu psi$ です。

$D_mu psi$ は、$psi$ とまったく同じ変換をします。だから $psi$ で書けた式は、
$partial_mu$ を $D_mu$ に替えるだけで不変になります。

出てきた $A_mu$ は、#link("/physics/mechanics/5")[解析力学 第 5 回]の
ゲージポテンシャルです。#strong[電磁場が要ることになりました。]
位相を各点で選び直したいと言っただけで、光が出てきています。

= 選べる量を数から行列に替える

ここまで、各点で掛けていたのは $e^(i alpha(x))$ という#strong[数]でした。

数は掛ける順序を気にしません。$e^(i alpha) e^(i beta) = e^(i beta) e^(i alpha)$ です。

#strong[行列に替えます。] $psi$ を $n$ 個の成分の組にして、各点で掛けるものを
$n times n$ の行列 $U(x)$ にします。

$ psi(x) arrow.r U(x) psi(x) $

$abs(psi)^2 = psi^dagger psi$ が動かないためには $U^dagger U = 1$ が要ります。
$n = 1$ に戻すと $U$ は $e^(i alpha)$ そのもので、前の節に戻る。

$A_mu$ も行列になります。@def:covariant-derivative の形はそのままで、
中身が $n times n$ の行列です。

$A_mu$ の変換の仕方を、#strong[前の節と同じ要求から決めます。]
$D_mu psi$ が $psi$ と同じ変換をしてほしい。つまり

$ D'_mu (U psi) = U (D_mu psi) $

です。左辺を開きます。

$ (partial_mu - i g A'_mu) (U psi)
  = (partial_mu U) psi + U partial_mu psi - i g A'_mu U psi $

右辺は

$ U (partial_mu - i g A_mu) psi = U partial_mu psi - i g U A_mu psi $

$U partial_mu psi$ が両辺にあるので落ちます。残りが、どんな $psi$ についても
等しくなければならない。

$ (partial_mu U) - i g A'_mu U = - i g U A_mu $

$A'_mu$ について解きます。$i g$ で割って

$ A'_mu U = U A_mu + (1) / (i g) (partial_mu U)
          = U A_mu - (i) / (g) (partial_mu U) $

右から $U^dagger$ を掛けます。

$ A'_mu = U A_mu U^dagger - (i) / (g) (partial_mu U) U^dagger $

#strong[第一項が新しい形です。] 数のときは $U A_mu U^dagger = A_mu U U^dagger = A_mu$
で、$A_mu$ 自身は動きませんでした。行列だと $U$ を通り抜けられないので、
$A_mu$ が回されます。

第二項が、前の節の $partial_mu alpha slash g$ に当たります。実際 $U = e^(i alpha)$ を
入れると $(partial_mu U) U^dagger = i partial_mu alpha$ なので

$ - (i) / (g) (i partial_mu alpha) = (1) / (g) partial_mu alpha $

となって、前の節の変換に戻ります。

$A_mu$ が行列になったということは、#strong[$A_mu A_nu$ と $A_nu A_mu$ が
違っていてよい]ということです。この一点だけが、以下すべての出どころです。

= 微分を二つ並べて順を入れ替えると差が残る

場の強さを作りたい。電磁気では $partial_mu A_nu - partial_nu A_mu$ でした。

これをそのまま行列で書くと、@def:covariant-derivative のときのような
気持ちのよい変換をしません。$partial_mu (U A_nu U^dagger)$ の微分が
$U$ にも当たるからです。

#strong[微分のほうを二つ並べます。]

$D_mu$ を二つ、順を入れ替えて引きます。ふつうの微分なら
$partial_mu partial_nu - partial_nu partial_mu = 0$ で、何も残りません。

$D_mu$ でやると残ります。$psi$ に当てて開きます。

$ D_mu D_nu psi
  &= (partial_mu - i g A_mu) (partial_nu psi - i g A_nu psi) \
  &= partial_mu partial_nu psi - i g partial_mu (A_nu psi)
     - i g A_mu partial_nu psi - g^2 A_mu A_nu psi \
  &= partial_mu partial_nu psi - i g (partial_mu A_nu) psi - i g A_nu partial_mu psi
     - i g A_mu partial_nu psi - g^2 A_mu A_nu psi $

$mu$ と $nu$ を入れ替えたものを引きます。項ごとに見ます。

#strong[微分が二つの項。] $partial_mu partial_nu psi - partial_nu partial_mu psi = 0$。
偏微分の順序は入れ替えられるので消えます。

#strong[$A$ と微分が一つずつの項。] 引く前に四つあります。

$ (- i g A_nu partial_mu psi - i g A_mu partial_nu psi)
  - (- i g A_mu partial_nu psi - i g A_nu partial_mu psi) = 0 $

#strong[交差した形で並んでいるので、そのまま消えます。] $A_mu partial_nu$ と
$A_nu partial_mu$ が両側に一つずつ出るからで、$A$ が行列でも順序は関係ありません。

#strong[$A$ を微分した項。] $- i g (partial_mu A_nu) psi + i g (partial_nu A_mu) psi$
で、$- i g (partial_mu A_nu - partial_nu A_mu) psi$ になります。

#strong[$A$ が二つの項。] $- g^2 A_mu A_nu psi + g^2 A_nu A_mu psi
= - g^2 [A_mu, A_nu] psi$。

#strong[ここだけが行列であることを使っています。] 数なら $A_mu A_nu = A_nu A_mu$ で
消えていました。

足します。

$ [D_mu, D_nu] psi = - i g (partial_mu A_nu - partial_nu A_mu) psi
  - g^2 [A_mu, A_nu] psi $

$psi$ が全部の項に右から掛かっているだけです。#strong[微分が一つも残っていません。]
微分を二つ並べたものの差が、掛け算になりました。

演算子として書いたものが、ただの掛け算に化ける。私はこの一行が好きです。

$- i g$ で括ります。$- g^2 = (- i g)(- i g) times (-1)$ に注意して、

$ [D_mu, D_nu] = - i g (partial_mu A_nu - partial_nu A_mu - i g [A_mu, A_nu]) $

括弧の中を確かめます。$- i g times (- i g [A_mu, A_nu]) = i^2 g^2 [A_mu, A_nu]
= - g^2 [A_mu, A_nu]$ で、合っています。

#theorem[
  $ F_(mu nu) = (i) / (g) [D_mu, D_nu]
    = partial_mu A_nu - partial_nu A_mu - i g [A_mu, A_nu] $
]<thm:field-strength>

前の二項が電磁気と同じ形です。#strong[三つめが新しい。]

@thm:field-strength で、数に戻すと $[A_mu, A_nu] = 0$ なので三つめが消えます。
#strong[電磁気の場の強さに戻ります。] 行列にしたことで、$A$ について二次の項が
一つ増えた。

= 場の強さそのものは測れない

@thm:field-strength が変換でどうなるかを見ます。

$D_mu$ の変換は、前の節の要求そのものです。$D'_mu (U psi) = U D_mu psi$ なので、
演算子としては

$ D'_mu = U D_mu U^dagger $

です。交換子に入れます。

$ [U D_mu U^dagger, U D_nu U^dagger]
  &= U D_mu U^dagger U D_nu U^dagger - U D_nu U^dagger U D_mu U^dagger \
  &= U D_mu D_nu U^dagger - U D_nu D_mu U^dagger \
  &= U [D_mu, D_nu] U^dagger $

#strong[間に挟まった $U^dagger U$ が $1$ になって落ちました。] 両端の
$U$ と $U^dagger$ は落ちません。

#theorem[
  $ F_(mu nu) arrow.r U F_(mu nu) U^dagger $
]<thm:covariant>

@thm:covariant は、#strong[$F_(mu nu)$ の値がゲージ変換で変わる]と言っています。
場所ごとに $U(x)$ を選び直せて、そのたびに $F$ の値が回る。

#strong[選び方はこちらの都合です。] 都合で変わる量は、測れません。

電磁気では違いました。$U$ が数なので

$ U F_(mu nu) U^dagger = F_(mu nu) U U^dagger = F_(mu nu) $

で、$F$ 自身が動きません。#strong[電場と磁場は測れます。]

#check("電磁気では場の強さが測れるのに、非可換だと測れないのはなぜか")[
  どちらも同じ @thm:covariant に従っています。
  #strong[何が違って、片方だけが測れる量になるのでしょうか。]
][
  #strong[$U$ を通り抜けられるかどうかだけです。]

  $U F U^dagger$ で $F$ が戻ってくるのは、$F$ と $U$ の順序を入れ替えて
  $U U^dagger = 1$ を作れるときです。数どうしなら、いつでも入れ替えられます。

  行列だと入れ替えられません。$U F U^dagger$ は $F$ とは別の行列です。

  だから測れるものを作るには、#strong[順序を入れ替えてよい形にするしかありません。]
  跡がそれです。
]

測れる量を作ります。@thm:covariant の下で戻ってくる組み合わせが要ります。

跡には、掛ける順序を回してよいという性質があります。$tr(X Y) = tr(Y X)$ です。

$ tr(F_(mu nu) F^(mu nu)) arrow.r
  tr(U F_(mu nu) U^dagger U F^(mu nu) U^dagger)
  = tr(U F_(mu nu) F^(mu nu) U^dagger) $

真ん中の $U^dagger U$ が消えました。あとは巡回性で、いちばん左の $U$ を
いちばん右へ回します。

$ tr(U F_(mu nu) F^(mu nu) U^dagger)
  = tr(F_(mu nu) F^(mu nu) U^dagger U)
  = tr(F_(mu nu) F^(mu nu)) $

#strong[戻りました。] 作用に書けます。

$ cal(L)_"ゲージ" = - (1) / (2) tr(F_(mu nu) F^(mu nu)) $

全体の係数は、可換の場合の $- (1 slash 4) F_(mu nu) F^(mu nu)$ に戻るように
選ぶだけです。#strong[これから見るのは三つの項どうしの比なので、
全体の係数は効きません。]

= 結合が三つ出て定数は一つしかない

@thm:field-strength を二つに分けます。

$ F_(mu nu) = f_(mu nu) + c_(mu nu) wide
  f_(mu nu) = partial_mu A_nu - partial_nu A_mu wide
  c_(mu nu) = - i g [A_mu, A_nu] $

$f$ が電磁気にもあった部分、$c$ が行列にしたことで増えた部分です。

跡の中に入れて展開します。

$ tr(F_(mu nu) F^(mu nu))
  = tr(f_(mu nu) f^(mu nu)) + tr(f_(mu nu) c^(mu nu))
  + tr(c_(mu nu) f^(mu nu)) + tr(c_(mu nu) c^(mu nu)) $

真ん中の二つは、巡回性で等しくなります。$tr(c_(mu nu) f^(mu nu))
= tr(f^(mu nu) c_(mu nu))$ で、$mu$ と $nu$ は和を取っているので
$tr(f_(mu nu) c^(mu nu))$ と同じものです。

$ tr(F_(mu nu) F^(mu nu))
  = tr(f_(mu nu) f^(mu nu)) + 2 tr(f_(mu nu) c^(mu nu))
  + tr(c_(mu nu) c^(mu nu)) $

三つを、$f$ と $c$ の中身に戻して書き下します。

$ tr(f_(mu nu) f^(mu nu)) = tr((partial_mu A_nu - partial_nu A_mu)
  (partial^mu A^nu - partial^nu A^mu)) $

$ 2 tr(f_(mu nu) c^(mu nu)) = - 2 i g thin
  tr((partial_mu A_nu - partial_nu A_mu) [A^mu, A^nu]) $

$ tr(c_(mu nu) c^(mu nu)) = (- i g)^2 thin tr([A_mu, A_nu] [A^mu, A^nu])
  = - g^2 thin tr([A_mu, A_nu] [A^mu, A^nu]) $

#strong[$A$ の個数と $g$ の冪が、式の上に見えています。] 一つめは $A$ が二つで
$g$ が付かない。二つめは $A$ が三つで $g$ が一つ。三つめは $A$ が四つで $g$ が二つ。

$A$ が二つの項は、波が伝わる部分です。$A$ が三つと四つの項は、
#strong[ゲージ場が自分とぶつかる部分]です。

物質との結合も数えます。@def:covariant-derivative を物質の項に入れると

$ accent(psi, macron) (i gamma^mu D_mu - m) psi
  = accent(psi, macron) (i gamma^mu partial_mu - m) psi
  + g thin accent(psi, macron) gamma^mu A_mu psi $

$i gamma^mu (- i g A_mu) = g gamma^mu A_mu$ からこうなります。$gamma^mu$ の
中身はここでは効きません。#strong[結合の強さが $g$ だ、というところだけ使います。]

四つ並べます。

#table(
  columns: (auto, auto, auto),
  [波が伝わる], [$A^2$], [$g^0$],
  [物質と結合する], [$accent(psi, macron) psi A$], [$g^1$],
  [三本でぶつかる], [$A^3$], [$g^1$],
  [四本でぶつかる], [$A^4$], [$g^2$],
)

#strong[定数が一つしかありません。] 三つの結合それぞれに係数を置きたくなりますが、
置く場所がない。@thm:field-strength を跡に入れて展開しただけなので、
出てきた比は展開の結果です。

#strong[比が予言になります。] 三本でぶつかる強さを一つ測れば、
四本でぶつかる強さはその二乗で決まっていて、直す余地がありません。
物質との結合も同じ $g$ です。

#strong[合わせ込めません。] 実験と食い違ったら、係数を直して逃げるのではなく、
行列にしたこと自体が間違っていたことになります。

電磁気では、この予言の中身が空です。$[A_mu, A_nu] = 0$ なので
$c_(mu nu) = 0$ で、三つめと四つめの行が消えます。#strong[光が光を素通りする]のは、
これです。冒頭の懐中電灯が交わっても何も起きないのは、
位相が数だったからでした。

そしてグルーオン同士がぶつかるのは、$A$ が三つと四つの項があるからです。
#strong[力を伝えるものが、自分の伝える力を受けています。]

#link("/physics/renormalization/3")[くりこみ 第 3 回]が要求していた粒子が、
これです。あちらは、結合が高いエネルギーで弱くなるには
#strong[力を伝える粒子が電荷を運んで広げる側にいる]必要がある、と言っていました。

#strong[その粒子は作りました。符号はまだ計算していません。]
$A^3$ と $A^4$ の項が輪に入ったときに、隠す側と広げる側のどちらが勝つかは、
#link("/physics/standard-model/2")[標準模型 第 2 回]で数えます。

= 質量項を書くと元に戻らない

$A_mu$ に質量を持たせたい。ふつうに書けば

$ m^2 thin tr(A_mu A^mu) $

です。#strong[書けるかどうかを確かめます。]

前の節で出した変換を入れます。長いので、$U$ の入った部分に名前を付けます。

$ A_mu arrow.r U A_mu U^dagger + Omega_mu wide
  Omega_mu = - (i) / (g) (partial_mu U) U^dagger $

$Omega_mu$ には $A$ が入っていません。#strong[$U$ の微分だけでできています。]

代入して展開します。

$ tr(A_mu A^mu) arrow.r
  &tr(U A_mu U^dagger thin U A^mu U^dagger)
  + tr(U A_mu U^dagger thin Omega^mu) \
  &+ tr(Omega_mu thin U A^mu U^dagger)
  + tr(Omega_mu Omega^mu) $

#strong[第一項。] 真ん中の $U^dagger U$ が $1$ になり、巡回性で両端の $U$ と
$U^dagger$ も落ちます。

$ tr(U A_mu U^dagger U A^mu U^dagger) = tr(U A_mu A^mu U^dagger)
  = tr(A_mu A^mu U^dagger U) = tr(A_mu A^mu) $

#strong[元に戻りました。] 前の節の $tr(F F)$ と同じ落ち方です。

#strong[真ん中の二項。] 巡回性で $tr(Omega_mu thin U A^mu U^dagger)
= tr(U A^mu U^dagger thin Omega_mu)$ となり、$mu$ は和を取っているので
第二項と同じものです。合わせて二倍。

#strong[第四項。] $A$ が一つも入っていません。落としようがない。

$ tr(A_mu A^mu) arrow.r tr(A_mu A^mu)
  + 2 tr(U A_mu U^dagger thin Omega^mu) + tr(Omega_mu Omega^mu) $

#theorem[
  ゲージ不変性のもとで、$m^2 tr(A_mu A^mu)$ は不変にならない。
  #strong[$m = 0$ 以外に逃げ道がない。]
]<thm:no-mass>

@thm:no-mass の理由は、残った二項の $A$ の次数です。元の項は $A$ について
二次で、余った二項は一次と零次です。#strong[次数が違うので、互いに打ち消せません。]
$m$ をどう選んでも、$m^2$ が三つ全部に同じように掛かるだけです。

可換の場合も同じです。$A_mu arrow.r A_mu + partial_mu alpha slash g$ を入れると

$ A_mu A^mu arrow.r A_mu A^mu + (2) / (g) A_mu partial^mu alpha
  + (1) / (g^2) (partial_mu alpha) (partial^mu alpha) $

で、やはり二次・一次・零次が並びます。#strong[消えません。]

#check("光子の質量がゼロなのは、測った結果でしょうか")[
  電子の質量は測れます。光子の質量も、測ろうと思えば測れます。
  #strong[それでも「ゼロである」の出どころは、測定ではありません。どこでしょうか。]
][
  #strong[@thm:no-mass です。]

  測定から出るのは#strong[上限]だけです。「ゼロより小さい」は測れないので、
  どれだけ精度を上げても「この値より軽い」までしか言えません。

  理論の側では、ゼロが選択肢の全部です。位相を各点で選び直せることを
  要請した時点で、質量項が書けなくなっている。

  だから、もし将来ゼロでない質量が測られたら、
  #strong[捨てるのは光子ではなくゲージ不変性のほうです。]
]

#strong[ここで困ります。] 弱い力を伝える $W$ と $Z$ には、質量があります。
$80$ GeV と $91$ GeV で、陽子のおよそ $86$ 倍と $97$ 倍。
軽くも小さくもありません。

@thm:no-mass はそれを禁じています。#strong[片方が間違っています。]

逃げ道は#link("/physics/gauge-theory/5")[第 5 回]にあります。あちらは
行き詰まりを二つ受けて、互いに埋めさせる回です。#strong[片方がこれです。]

= 群を選ぶ理由も解も出ていない

決まったものを数え直します。各点で掛ける行列を選ぶと、場の強さの形
（@thm:field-strength）、結合が何個出るか、結合定数の間の比、
質量項が書けないこと（@thm:no-mass）が全部決まりました。

#strong[途中で選べる余地はありませんでした。] 選んだのは最初の一回だけです。

その最初の一回が、決まっていません。

#strong[どの行列を使うかは出ていません。] 自然が使っているのは
$S U(3) times S U(2) times U(1)$ です。この回で出てきたものからは、
一文字も出ません。#strong[実験を見て、手で入れています。]

$S U(5)$ でも $S U(3) times S U(3)$ でも、ここまでの話は同じように通ります。
#strong[通ってしまうのが問題です。] 何が選ばれるかを決める仕掛けが、
この枠組みには入っていない。

もう一つ、#strong[書けただけです。]

$tr(F F)$ を書き下しました。$A$ について三次と四次の項があるので、
方程式が非線型です。#strong[解けていません。]

#strong[「難しい」ではありません。] $S U(3)$ の Yang--Mills 理論が数学的に
存在することと、いちばん軽い励起の質量が正であること
（質量ギャップ）を示す問題は、Clay 数学研究所が 2000 年に挙げた
七つの問題の一つとして、いまも解かれていません。

#remark[
  この理論が現実に合うことは、別に分かっています。格子の上に置いて
  数値で解く方法があり、陽子の質量が出ます。

  #strong[数値で出ることと、証明があることは別です。] ここで解けていないと
  言っているのは後者のほうです。
]

同じ場所に、もう一つ引っかかっています。冒頭に書いたグルーオンは、
#strong[単独では一度も見つかっていません。] 陽子の中にはいるのに、
取り出せない。

取り出せないことが $tr(F F)$ から出るのかどうかは、
#link("/physics/standard-model/3")[標準模型 第 3 回]で扱います。
#strong[答えは出ていません。] あちらでやるのは、
何を言えば「取り出せない」を言ったことになるかを決めるところまでです。

形は決まりました。#strong[中身は、まだ誰も見ていません。]
