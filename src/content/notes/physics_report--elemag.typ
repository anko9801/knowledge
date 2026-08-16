#import "/src/typst/template.typ": post

#show: post.with(
  title: "elemag",
  date: "2026-08-16",
  tags: ("レポート",),
  summary: "physics_report/elemag.tex から変換",
)

虚数単位は立体 $upright(i)$ で書くこととする.

= 直線偏光した基底による電磁波の展開
<直線偏光した基底による電磁波の展開>
位置 $bold(r)$, 時刻 $t$ において, 真空中に伝搬する電磁波の複素電場
$tilde(bold(E)) \( bold(r) \, t \)$, 複素磁場
$tilde(bold(B)) \( bold(r) \, t \)$ の一般解は次のように表される.
$ tilde(bold(E)) \( bold(r) \, t \) & = integral.triple_(bb(R)^3) d V \( bold(k) \) \( E_1 \( bold(k) \) upright(e)_1 \( bold(k) \) + E_2 \( bold(k) \) upright(e)_2 \( bold(k) \) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
tilde(bold(B)) \( bold(r) \, t \) & = integral.triple_(bb(R)^3) d V \( bold(k) \) \( B_1 \( bold(k) \) upright(e)_1 \( bold(k) \) + B_2 \( bold(k) \) upright(e)_2 \( bold(k) \) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) . $<tilde-E>
電磁波の分散関係 $omega \( bold(k) \)$ は光速度 $c$
を用いて次のように与えられる.
$ omega \( bold(k) \) = c \| bold(k) \| . $ また, 各
$bold(k) in bb(R)^3$ に対して,
$upright(e)_1 \( bold(k) \) \, upright(e)_2 \( bold(k) \) \, bold(k) \/ \| bold(k) \| in bb(R)^3$
は右手系の正規直交系を成す.

$ \| upright(e)_1 \( bold(k) \) \| = \| upright(e)_2 \( bold(k) \) \| & = lr(|frac(bold(k), \| bold(k) \|)|) = 1\
upright(e)_1 \( bold(k) \) dot.op upright(e)_2 \( bold(k) \) & = upright(e)_1 \( bold(k) \) dot.op frac(bold(k), \| bold(k) \|) = upright(e)_2 \( bold(k) \) dot.op frac(bold(k), \| bold(k) \|) = 0\
upright(e)_1 \( bold(k) \) times upright(e)_2 \( bold(k) \) & = frac(bold(k), \| bold(k) \|) . $

また, 各 $bold(k) in bb(R)^3$ に対して,
$E_1 \( bold(k) \) \, E_2 \( bold(k) \) in bb(C)$ と
$B_1 \( bold(k) \) \, B_2 \( bold(k) \) in bb(C)$ は, 電場
$tilde(bold(E)) \( bold(r) \, t \)$ と磁場
$tilde(bold(B)) \( bold(r) \, t \)$ の波数 $bold(k)$ のそれぞれ
$upright(e)_1 \( bold(k) \)$, $upright(e)_2 \( bold(k) \)$
方向の複素振幅である. これらは CGS Gauss 単位系では次の関係式を満たす.
$ B_1 \( bold(k) \) = - E_2 \( bold(k) \) \, B_2 \( bold(k) \) = E_1 \( bold(k) \) . $

また, $bold(k) \/ \| bold(k) \| = 0$ のとき電磁波が横波であることを表す.
このとき,
$tilde(bold(E)) \( bold(r) \, t \) \, tilde(bold(B)) \( bold(r) \, t \)$
の展開式 #link(<tilde-E>)[tilde-E] #link(<tilde-B>)[tilde-B]
は「電磁波に対する直線偏光をもつ基底による展開」と呼ばれる.
横波のときの基底は
$ upright(e)_1 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) \, upright(e)_2 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $
と書け, これらを「直線偏光を持つ基底」と呼ばれる.

なお, 物理的な電場 $bold(E) \( bold(r) \, t \)$, 磁場
$bold(B) \( bold(r) \, t \)$
はそれらの複素表現の実部を取ることで求められる.
$ bold(E) \( bold(r) \, t \) = Re tilde(bold(E)) \( bold(r) \, t \) \, bold(B) \( bold(r) \, t \) = Re tilde(bold(B)) \( bold(r) \, t \) $

#strong[Q 21B-1.] よって次のように電場の複素振幅の絶対値
$a_i \( bold(k) \)$ と偏角 $epsilon.alt_i \( bold(k) \)$ をおくと
$ E_i \( bold(k) \) = a_i \( bold(k) \) e^(upright(i) epsilon.alt_i \( bold(k) \)) \, a_i \( bold(k) \) gt.eq 0 \, epsilon.alt_i \( bold(k) \) in bb(R) quad \( bold(k) in bb(R)^3 \, i = 1 \, 2 \) $

次のように展開される.
$ bold(E) \( bold(r) \, t \) & = Re tilde(bold(E)) \( bold(r) \, t \)\
 & = Re integral.triple_(bb(R)^3) d V \( bold(k) \) \( E_1 \( bold(k) \) upright(e)_1 \( bold(k) \) + E_2 \( bold(k) \) upright(e)_2 \( bold(k) \) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) (Re \( E_1 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) \) upright(e)_1 \( bold(k) \) + Re \( E_2 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) \) upright(e)_2 \( bold(k) \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) (Re \( a_1 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt_1 \( bold(k) \) \)) \) upright(e)_1 \( bold(k) \) + Re \( a_2 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt_2 \( bold(k) \) \)) \) upright(e)_2 \( bold(k) \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) { a_1 \( bold(k) \) cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt_1 \( bold(k) \) \) upright(e)_1 \( bold(k) \) + a_2 \( bold(k) \) cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt_2 \( bold(k) \) \) upright(e)_2 \( bold(k) \) }\
bold(B) \( bold(r) \, t \) & = Re tilde(bold(B)) \( bold(r) \, t \)\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) (Re \( - E_2 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) \) upright(e)_1 \( bold(k) \) + Re \( E_1 \( bold(k) \) e^(i \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) \) upright(e)_2 \( bold(k) \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) { - a_2 \( bold(k) \) cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt_2 \( bold(k) \) \) upright(e)_1 \( bold(k) \) + a_1 \( bold(k) \) cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt_1 \( bold(k) \) \) upright(e)_2 \( bold(k) \) } & square.stroked $<E>

これより真空中を伝搬する電場 $bold(E) \( bold(r) \, t \)$ の表式 #link(<E>)[E]
が分かれば, 磁場 $bold(B) \( bold(r) \, t \)$ の表式 #link(<B>)[B] が分かる. \
#strong[Q 21B-2.] \
ここでは直線偏光の単色波について考える. 単色波 (monochromatic wave)
とは1つの振動数しか持たない波のことである. \
波数 $bold(k) in bb(R)^3$ で定まった電場の振動方向
$upright(e)_i \( bold(k) \)$ を持つ単色波のとき, 複素振幅を
$tilde(E) = a e^(upright(i) epsilon.alt)$ とおくと, 電場の複素表示
$tilde(bold(E)) \( bold(r) \, t \)$ は次の通りとなる.
$ tilde(bold(E)) \( bold(r) \, t \) = tilde(E) upright(e)_i \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $
これより物理的な電場は次のようになる.
$ bold(E) \( bold(r) \, t \) & = Re tilde(bold(E)) \( bold(r) \, t \)\
 & = Re (tilde(E) upright(e)_i \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)))\
 & = a upright(e)_i \( bold(k) \) Re cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt \) $
$bold(E) \( bold(r) \, t \)$ の $upright(e)_1 \, upright(e)_2$
方向の成分を $E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \)$
と書くとすると, $upright(e)_1 \, upright(e)_2$ 方向に進む場合について
$ mat(delim: "[", E_1; E_2) & = mat(delim: "[", a cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt \); 0) & \( i = 1 \)\
mat(delim: "[", E_1; E_2) & = mat(delim: "[", 0; a cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon.alt \)) & \( i = 2 \) $
となる. 位置 $bold(r)$ を固定し, 時間 $t$ を動かしたときに
$\( E_1 \, E_2 \)$ が作る軌跡の図形は Lissajous 図形と呼ばれている.
電場の振動方向が $upright(e)_1 \, upright(e)_2$ 方向に進むとき, 上式より
$ {(E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \)) : t in bb(R)} & = {(E_1 \, E_2) in bb(R)^2 : - a lt.eq E_1 lt.eq a and E_2 = 0} & \( i = 1 \)\
{(E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \)) : t in bb(R)} & = {(E_1 \, E_2) in bb(R)^2 : - a lt.eq E_2 lt.eq a and E_1 = 0} & \( i = 2 \) $
が成り立つ. \
このような単色波を直線偏光を持つという. また,
電場ベクトルの振動方向と電磁場の進行方向で定まる平面を電場の振動面という.

= 円偏光した基底による電磁波の展開
<円偏光した基底による電磁波の展開>
まず円偏光した基底を定義する.
$ upright(e)_(+) \( bold(k) \) & e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) \, & upright(e)_(-) \( bold(k) \) & e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) & \( bold(k) in bb(R)^3 \)\
upright(e)_(+) \( bold(k) \) & = 1 / sqrt(2) \( upright(e)_1 \( bold(k) \) + upright(i) upright(e)_2 \( bold(k) \) \) \, & upright(e)_(-) \( bold(k) \) & = 1 / sqrt(2) \( upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \) \) & \( bold(k) in bb(R)^3 \) $
このとき
$ upright(e)_plus.minus \( bold(k) \)^(\*) = upright(e)_minus.plus \( bold(k) \) $
が成り立つ.

#strong[Q 21B-3.] 各 $bold(k) in bb(R)^3$ に対して,
$upright(e)_(+) \( bold(k) \) \, upright(e)_(-) \( bold(k) \) \, bold(k) \/ \| bold(k) \| in bb(C)^3$
は正規直交基底を成す.

#block[
#emph[Proof.]
$ upright(e)_(+) \( bold(k) \)^(\*) dot.op upright(e)_(+) \( bold(k) \) & = 1 / 2 \( upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \) \) dot.op \( upright(e)_1 \( bold(k) \) + upright(i) upright(e)_2 \( bold(k) \) \)\
 & = 1 / 2 \( upright(e)_1 \( bold(k) \)^2 + upright(e)_2 \( bold(k) \)^2 \)\
 & = 1\
upright(e)_(-) \( bold(k) \)^(\*) dot.op upright(e)_(-) \( bold(k) \) & = 1 / 2 \( upright(e)_1 \( bold(k) \) + upright(i) upright(e)_2 \( bold(k) \) \) dot.op \( upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \) \)\
 & = 1 / 2 \( upright(e)_1 \( bold(k) \)^2 + upright(e)_2 \( bold(k) \)^2 \)\
 & = 1\
(frac(bold(k), \| bold(k) \|))^(\*) dot.op frac(bold(k), \| bold(k) \|) & = 1\
upright(e)_(+) \( bold(k) \)^(\*) dot.op upright(e)_(-) \( bold(k) \) & = 1 / 2 \( upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \) \) dot.op \( upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \) \)\
 & = 1 / 2 \( upright(e)_1 \( bold(k) \)^2 - upright(e)_2 \( bold(k) \)^2 - 2 upright(i) upright(e)_1 \( bold(k) \) dot.op upright(e)_2 \( bold(k) \) \)\
 & = 0\
upright(e)_(+) \( bold(k) \)^(\*) dot.op frac(bold(k), \| bold(k) \|) & = 1 / sqrt(2) \( upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \) \) dot.op frac(bold(k), \| bold(k) \|)\
 & = 0\
upright(e)_(-) \( bold(k) \)^(\*) dot.op frac(bold(k), \| bold(k) \|) & = 1 / sqrt(2) \( upright(e)_1 \( bold(k) \) + upright(i) upright(e)_2 \( bold(k) \) \) dot.op frac(bold(k), \| bold(k) \|)\
 & = 0 $ よりこれらは正規直交系となる.~

]
#strong[Q 21B-4.]
円偏光を持つ基底による電磁場の展開は次のように表される.
$ tilde(bold(E)) \( bold(r) \, t \) & = integral.triple_(bb(R)^3) d V \( bold(k) \) {E_(+) \( bold(k) \) upright(e)_(+) \( bold(k) \) + E_(-) \( bold(k) \) upright(e)_(-) \( bold(k) \)} e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
tilde(bold(B)) \( bold(r) \, t \) & = integral.triple_(bb(R)^3) d V \( bold(k) \) {B_(+) \( bold(k) \) upright(e)_(+) \( bold(k) \) + B_(-) \( bold(k) \) upright(e)_(-) \( bold(k) \)} e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $
ただし, 円偏光の複素振幅は次のように定義される.
$ E_(+) \( bold(k) \) & = 1 / sqrt(2) (E_1 \( bold(k) \) - upright(i) E_2 \( bold(k) \)) \, & E_(-) \( bold(k) \) & = 1 / sqrt(2) (E_1 \( bold(k) \) + upright(i) E_2 \( bold(k) \))\
B_(+) \( bold(k) \) & = 1 / sqrt(2) (B_1 \( bold(k) \) - upright(i) B_2 \( bold(k) \)) \, & B_(-) \( bold(k) \) & = 1 / sqrt(2) (B_1 \( bold(k) \) + upright(i) B_2 \( bold(k) \)) $

#block[
#emph[Proof.] $tilde(bold(E)) \( bold(r) \, t \)$ と
$tilde(bold(B)) \( bold(r) \, t \)$ の表示式 #link(<tilde-E>)[tilde-E], #link(<tilde-B>)[tilde-B]
より次のように式変形できる.
$ tilde(bold(E)) \( bold(r) \, t \) & = integral.triple_(bb(R)^3) d V \( bold(k) \) (E_1 \( bold(k) \) upright(e)_1 \( bold(k) \) + E_2 \( bold(k) \) upright(e)_2 \( bold(k) \)) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) \(1 / sqrt(2) (E_1 \( bold(k) \) - upright(i) E_2 \( bold(k) \)) dot.op 1 / sqrt(2) (upright(e)_1 \( bold(k) \) + upright(i) upright(e)_2 \( bold(k) \))\
 & + 1 / sqrt(2) (E_1 \( bold(k) \) + upright(i) E_2 \( bold(k) \)) dot.op 1 / sqrt(2) (upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \))\) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) {E_(+) \( bold(k) \) upright(e)_(+) \( bold(k) \) + E_(-) \( bold(k) \) upright(e)_(-) \( bold(k) \)} e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
tilde(bold(B)) \( bold(r) \, t \) & = integral.triple_(bb(R)^3) d V \( bold(k) \) \( B_1 \( bold(k) \) upright(e)_1 \( bold(k) \) + B_2 \( bold(k) \) upright(e)_2 \( bold(k) \) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) \(1 / sqrt(2) (B_1 \( bold(k) \) - upright(i) B_2 \( bold(k) \)) dot.op 1 / sqrt(2) (upright(e)_1 \( bold(k) \) + upright(i) upright(e)_2 \( bold(k) \))\
 & + 1 / sqrt(2) (B_1 \( bold(k) \) + upright(i) B_2 \( bold(k) \)) dot.op 1 / sqrt(2) (upright(e)_1 \( bold(k) \) - upright(i) upright(e)_2 \( bold(k) \))\) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = integral.triple_(bb(R)^3) d V \( bold(k) \) {B_(+) \( bold(k) \) upright(e)_(+) \( bold(k) \) + B_(-) \( bold(k) \) upright(e)_(-) \( bold(k) \)} e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $
これより示せた.~

]
#strong[Q 21B-5.] 波数 $bold(k) in bb(R)^3$ を持ち, 複素電場ベクトル
$tilde(bold(E)) \( bold(r) \, t \)$ がベクトル
$upright(e)_i \( bold(k) \)$ に比例している単色波を考える.
$ tilde(bold(E)) \( bold(r) \, t \) = tilde(E) upright(e)_i \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) quad \( i = + \, - \) $
このとき物理的な電場は複素振幅を $tilde(E) = a e^(upright(i) epsilon)$
とすると
$ bold(E) \( bold(r) \, t \) & = Re tilde(bold(E)) \( bold(r) \, t \)\
 & = Re (tilde(E) upright(e)_i \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)))\
 & = a Re (upright(e)_i \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon \)))\
 & = a / sqrt(2) {upright(e)_1 \( bold(k) \) cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon \) minus.plus upright(e)_2 \( bold(k) \) sin \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon \)} $
これより, $bold(E) \( bold(r) \, t \)$ の $upright(e)_1 \, upright(e)_2$
方向の成分を $E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \)$
と書くとすると, $upright(e)_plus.minus$ 方向に進む場合について
$ mat(delim: "[", E_1; E_2) = a / sqrt(2) mat(delim: "[", cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon \); minus.plus sin \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon \)) quad \( i = plus.minus \) . $<circle-E-vector>
となり, この軌跡である Lissajous 図形は次のように原点を中心とする半径
$a \/ sqrt(2)$ の円となる.
$ {(E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \)) : t in bb(R)} = {(E_1 \, E_2) in bb(R)^2 : E_1^2 + E_2^2 = a^2 / 2} quad \( i = plus.minus \) $
これよりこのときの電場は円偏光を持つという. また $i = +$ と $i = -$
については #link(<circle-E-vector>)[circle-E-vector] より $t$
が増加する方向を考えると次のように解釈できる.
$ i & = + arrow.l.r.double upright("「Lissajous 図形の円上を点 ") \( E_1 \, E_2 \) upright(" は左回りに周回する。」")\
i & = - arrow.l.r.double upright("「Lissajous 図形の円上を点 ") \( E_1 \, E_2 \) upright(" は右回りに周回する。」") $
また
$upright(e)_1 \( bold(k) \) times upright(e)_2 \( bold(k) \) = bold(k) \/ \| bold(k) \|$
より次のようにも解釈できる.
$ i & = + arrow.l.r.double upright("「やってくる光に向かって観測すると, 電場ベクトルは左回りに回転する。」")\
i & = - arrow.l.r.double upright("「やってくる光に向かって観測すると, 電場ベクトルは右回りに回転する。」") $
光の helicity という言葉を用いると
$ i & = + arrow.l.r.double upright("「円偏光の helicity は ") + 1 upright(" である。」")\
i & = - arrow.l.r.double upright("「円偏光の helicity は ") - 1 upright(" である。」") $
と説明する.

= 一般の偏光状態と偏光楕円
<一般の偏光状態と偏光楕円>
一般の偏光状態は複素係数 $tilde(E)_1 \, tilde(E)_2 in bb(C)$ を用いて
$ tilde(bold(E)) \( bold(r) \, t \) & = tilde(E)_1 upright(e)_1 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) + tilde(E)_2 upright(e)_2 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) $<tilde-E-def>
で与えられる.

#strong[Q 21B-6.] 物理的な電場 $bold(E) \( bold(r) \, t \)$ は複素振幅を
$tilde(E)_i = a_i e^(upright(i) epsilon_i) \, a_i gt.eq 0 \, epsilon_i in bb(R) quad \( i = 1 \, 2 \)$
とすると
$ bold(E) \( bold(r) \, t \) & = Re tilde(bold(E)) \( bold(r) \, t \)\
 & = Re (tilde(E)_1 upright(e)_1 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) + tilde(E)_2 upright(e)_2 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)))\
 & = a_1 upright(e)_1 \( bold(k) \) cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1 \) + a_2 upright(e)_2 \( bold(k) \) cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_2 \) $<E-def>
となる. これより, $bold(E) \( bold(r) \, t \)$ の
$upright(e)_1 \, upright(e)_2$ 方向の成分を
$E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \)$ と書くとすると,
$upright(e)_plus.minus$ 方向に進む場合について
$ mat(delim: "[", E_1; E_2) = mat(delim: "[", a_1 cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1 \); a_2 cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_2 \)) $<genral-E-vector>
となる.

#strong[Q 21B-7.] $epsilon = epsilon_2 - epsilon_1$ とおくと式
#link(<genral-E-vector>)[genral-E-vector] から Lissajous 図形は次のようになり,
それが楕円の方程式であることを示せ.
$ {\( E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \) \) : t in bb(R)} = {\( E_1 \, E_2 \) in bb(R)^2 : (E_1 / a_1)^2 + (E_2 / a_2)^2 - 2 cos epsilon E_1 / a_1 E_2 / a_2 = sin^2 epsilon} $

#block[
#emph[Proof.] 式の簡略化の為に
$A_1 = bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1 \, A_2 = bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_2$
とおくと $ sin^2 epsilon & = sin^2 \( A_2 - A_1 \)\
 & = (sin A_2 cos A_1 - cos A_2 sin A_1)^2\
 & = sin^2 A_2 cos^2 A_1 + sin^2 A_1 cos^2 A_2 - 2 cos A_1 cos A_2 sin A_1 sin A_2\
 & = \( 1 - cos^2 A_2 \) cos^2 A_1 + \( 1 - cos^2 A_1 \) cos^2 A_2 - 2 cos A_1 cos A_2 sin A_1 sin A_2\
 & = cos^2 A_1 + cos^2 A_2 - 2 (cos A_1 cos A_2 - sin A_1 sin A_2) cos A_1 cos A_2\
 & = cos^2 A_1 + cos^2 A_2 - 2 cos epsilon cos A_1 cos A_2 $ ここで式
#link(<genral-E-vector>)[genral-E-vector] より
$ sin^2 epsilon & = cos^2 A_1 + cos^2 A_2 - 2 cos epsilon cos A_1 cos A_2\
 & = (E_1 / a_1)^2 + (E_2 / a_2)^2 - 2 cos epsilon E_1 / a_1 E_2 / a_2 $
を得られる. よって時間 $t$ を動かした軌跡の任意の点 $\( E_1 \, E_2 \)$
を考えることで
$ {\( E_1 \( bold(r) \, t \) \, E_2 \( bold(r) \, t \) \) : t in bb(R)} = {\( E_1 \, E_2 \) in bb(R)^2 : (E_1 / a_1)^2 + (E_2 / a_2)^2 - 2 cos epsilon E_1 / a_1 E_2 / a_2 = sin^2 epsilon} $
となる.
そしてこれは式の形から二次曲線の中で回転移動させた楕円の方程式である.~

]
#strong[Q 21B-8.] 式 #link(<genral-E-vector>)[genral-E-vector] より
$ mat(delim: "[", E_1; E_2) = mat(delim: "[", a_1 cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1 \); a_2 cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1 + epsilon \)) $<E12-phase>
となるから「$E_2$ は $E_1$ より $epsilon$
だけ位相が遅れている。」または「$E_1$ は $E_2$ より $epsilon$
だけ位相が進んでいる。」といえる. \
#strong[Q 21B-9.]
$ (E_1 / a_1)^2 + (E_2 / a_2)^2 - 2 cos epsilon E_1 / a_1 E_2 / a_2 & = sin^2 epsilon $
を二次形式を用いて表すと
$ mat(delim: "[", E_1, E_2) mat(delim: "[", 1 / a_1^2, - frac(cos epsilon, a_1 a_2); - frac(cos epsilon, a_1 a_2), 1 / a_2^2) mat(delim: "[", E_1; E_2) & = sin^2 epsilon $
となる.
ここで対称行列において異なる固有ベクトルは直交するから直交行列で対角化できるから,
角度 $psi$ を上手く選ぶと, 座標系 $\( E_1 \, E_2 \)$ から角度 $psi$
だけ回転させた座標系 $\( xi \, eta \)$ では二次形式を標準化できる.

座標系 $\( xi \, eta \)$ は回転行列を用いて次のように表される.
$ mat(delim: "[", E_1; E_2) = mat(delim: "[", cos psi, - sin psi; sin psi, cos psi) mat(delim: "[", xi; eta) $<E12-xi-eta>
これより座標系 $\( xi \, eta \)$ での二次形式は次のようになる.
$ sin^2 epsilon & = mat(delim: "[", E_1, E_2) mat(delim: "[", 1 / a_1^2, - frac(cos epsilon, a_1 a_2); - frac(cos epsilon, a_1 a_2), 1 / a_2^2) mat(delim: "[", E_1; E_2)\
 & = mat(delim: "[", xi, eta) mat(delim: "[", cos psi, sin psi; - sin psi, cos psi) mat(delim: "[", 1 / a_1^2, - frac(cos epsilon, a_1 a_2); - frac(cos epsilon, a_1 a_2), 1 / a_2^2) mat(delim: "[", cos psi, - sin psi; sin psi, cos psi) mat(delim: "[", xi; eta)\
 & = mat(delim: "[", xi, eta) mat(delim: "[", 1 / 2 (1 / a_1^2 + 1 / a_2^2) + 1 / 2 (1 / a_1^2 - 1 / a_2^2) cos 2 psi - frac(cos epsilon, a_1 a_2) sin 2 psi, - 1 / 2 (1 / a_1^2 - 1 / a_2^2) sin 2 psi - frac(cos epsilon, a_1 a_2) cos 2 psi; - 1 / 2 (1 / a_1^2 - 1 / a_2^2) sin 2 psi - frac(cos epsilon, a_1 a_2) cos 2 psi, 1 / 2 (1 / a_1^2 + 1 / a_2^2) - 1 / 2 (1 / a_1^2 - 1 / a_2^2) cos 2 psi - frac(cos epsilon, a_1 a_2) sin 2 psi) mat(delim: "[", xi; eta) $<xi-eta>
これより二次形式を標準化するような角度 $psi$ の条件は
$  & - 1 / 2 (1 / a_1^2 - 1 / a_2^2) sin 2 psi - frac(cos epsilon, a_1 a_2) cos 2 psi = 0\
arrow.l.r.double & tan 2 psi = frac(2 a_1 a_2, a_1^2 - a_2^2) cos epsilon $<psi-condition>
である. 式変形すると
$ tan^2 2 psi = frac(1, cos^2 2 psi) - 1 & = frac(4 a_1^2 a_2^2, \( a_1^2 - a_2^2 \)^2) cos^2 epsilon\
\( a_1^2 - a_2^2 \)^2 sec 2 psi & = {\( a_1^2 - a_2^2 \)^2 + 4 a_1^2 a_2^2 cos^2 epsilon} cos 2 psi $
となる. このとき, $xi$ と $eta$ に対する方程式は
$ (xi / a_xi)^2 + (eta / a_eta)^2 = 1 $<eclipse> と書ける.
ここで用いられる係数 $a_xi \, a_eta$ については二次形式 #link(<xi-eta>)[xi-eta]
から次のような条件を満たす.
$ 1 / a_xi^2 & = frac(1, sin^2 epsilon) (1 / 2 (1 / a_1^2 + 1 / a_2^2) + 1 / 2 (1 / a_1^2 - 1 / a_2^2) cos 2 psi - frac(cos epsilon, a_1 a_2) sin 2 psi)\
 & = frac(1, sin^2 epsilon) (1 / 2 (1 / a_1^2 + 1 / a_2^2) + (1 / 2 (1 / a_1^2 - 1 / a_2^2) - frac(cos epsilon, a_1 a_2) tan 2 psi) cos 2 psi)\
 & = frac(1, sin^2 epsilon) (1 / 2 (1 / a_1^2 + 1 / a_2^2) + (1 / 2 (1 / a_1^2 - 1 / a_2^2) - frac(cos epsilon, a_1 a_2) frac(2 a_1 a_2, a_1^2 - a_2^2) cos epsilon) cos 2 psi)\
 & = frac(\( a_1^2 + a_2^2 \) \( a_1^2 - a_2^2 \) - {\( a_1^2 - a_2^2 \)^2 + 4 a_1^2 a_2^2 cos^2 epsilon} cos 2 psi, 2 a_1^2 a_2^2 \( a_1^2 - a_2^2 \) sin^2 epsilon)\
 & = frac(a_1^2 + a_2^2 - \( a_1^2 - a_2^2 \) sec 2 psi, 2 a_1^2 a_2^2 sin^2 epsilon)\
1 / a_eta^2 & = frac(1, sin^2 epsilon) (1 / 2 (1 / a_1^2 + 1 / a_2^2) - 1 / 2 (1 / a_1^2 - 1 / a_2^2) cos 2 psi - frac(cos epsilon, a_1 a_2) sin 2 psi)\
 & = frac(a_1^2 + a_2^2 + \( a_1^2 - a_2^2 \) sec 2 psi, 2 a_1^2 a_2^2 sin^2 epsilon) $
これらを整理して $a_xi \, a_eta$ の具体的でシンプルな表式を求める.
$ 1 / a_xi^2 + 1 / a_eta^2 & = frac(a_xi^2 + a_eta^2, a_xi^2 a_eta^2) = frac(a_1^2 + a_2^2, a_1^2 a_2^2 sin^2 epsilon)\
1 / a_xi^2 - 1 / a_eta^2 & = - frac(a_xi^2 - a_eta^2, a_xi^2 a_eta^2) = - frac(\( a_1^2 - a_2^2 \) sec 2 psi, a_1^2 a_2^2 sin^2 epsilon)\
1 / a_xi^2 dot.op 1 / a_eta^2 & = frac(1, a_xi^2 a_eta^2) = frac(\( a_1^2 + a_2^2 \)^2 - \( a_1^2 - a_2^2 \)^2 sec^2 2 psi, 4 a_1^4 a_2^4 sin^4 epsilon)\
 & = frac(\( a_1^2 + a_2^2 \)^2 - {\( a_1^2 - a_2^2 \)^2 + 4 a_1^2 a_2^2 cos^2 epsilon} cos 2 psi sec 2 psi, 4 a_1^4 a_2^4 sin^4 epsilon)\
 & = frac(1, a_1^2 a_2^2 sin^2 epsilon)\
a_xi^2 a_eta^2 & = a_1^2 a_2^2 sin^2 epsilon\
a_xi^2 + a_eta^2 & = (1 / a_xi^2 + 1 / a_eta^2) a_xi^2 a_eta^2 = a_1^2 + a_2^2\
a_xi^2 - a_eta^2 & = - (1 / a_xi^2 - 1 / a_eta^2) a_xi^2 a_eta^2 = \( a_1^2 - a_2^2 \) sec 2 psi\
 & = \( a_1^2 - a_2^2 \) frac(1, cos 2 psi)\
 & = \( a_1^2 - a_2^2 \) frac(cos^2 2 psi + sin^2 2 psi, cos 2 psi)\
 & = \( a_1^2 - a_2^2 \) \( cos 2 psi + sin 2 psi tan 2 psi \)\
 & = \( a_1^2 - a_2^2 \) cos 2 psi + 2 a_1 a_2 cos epsilon sin 2 psi\
a_xi^2 & = 1 / 2 (\( a_xi^2 + a_eta^2 \) + \( a_xi^2 - a_eta^2 \)) = 1 / 2 \( 1 + sec 2 psi \) a_1^2 + 1 / 2 \( 1 - sec 2 psi \) a_2^2\
 & = a_1^2 cos^2 psi + a_2^2 sin^2 psi + 2 a_1 a_2 cos epsilon cos psi sin psi\
a_eta^2 & = 1 / 2 (\( a_xi^2 + a_eta^2 \) - \( a_xi^2 - a_eta^2 \)) = 1 / 2 \( 1 - sec 2 psi \) a_1^2 + 1 / 2 \( 1 + sec 2 psi \) a_2^2\
 & = a_1^2 cos^2 psi + a_2^2 sin^2 psi - 2 a_1 a_2 cos epsilon cos psi sin psi $<axiaeta-a1a2>
このようにして
$ a_xi^2 & = a_1^2 cos^2 psi + a_2^2 sin^2 psi + 2 a_1 a_2 cos epsilon cos psi sin psi\
a_eta^2 & = a_1^2 cos^2 psi + a_2^2 sin^2 psi - 2 a_1 a_2 cos epsilon cos psi sin psi $
が求まる. \
#strong[Q 21B-10.] 条件式 #link(<psi-condition>)[psi-condition] において
$tan 2 psi = tan 2 (psi + pi / 2)$ より位相を $pi \/ 2$
ずらしたものも解となる. これより $psi$ が解ならば
$psi \, psi + pi \/ 2 \, psi + pi \, psi + 3 pi \/ 2$ は解となる.
これは楕円を $psi$ だけ回転させたときに $psi \, psi + pi$ と
$psi + pi \/ 2 \, psi + 3 pi \/ 2$ は主軸の方向は同じであり,
$psi + pi \/ 2 \, psi + 3 pi \/ 2$ は $psi$ の軸方向の状態と比べ,
長軸と短軸が反対となった状態となる. これより $psi in \[ 0 \, pi \)$
かつ長軸, 短軸は $xi \, eta$ 軸があてがわれると制限すると $psi$
は一意に決まる. \
#strong[Q 21B-11.] 楕円偏光の回転の向きは $E_1 \, E_2$ の位相差
$epsilon$ の正弦 $sin epsilon$ の正負が関係していること,
つまり次のような関係となることを示せ.
$ sin epsilon > 0 & arrow.l.r.double upright("「楕円偏光は左偏光である。」")\
sin epsilon < 0 & arrow.l.r.double upright("「楕円偏光は右偏光である。」") $

#block[
#emph[Proof.] まず, $xi \, eta$ は式 #link(<E12-xi-eta>)[E12-xi-eta] より $E_1 \, E_2$
を用いて次のように表される.
$ mat(delim: "[", xi; eta) = mat(delim: "[", cos psi, sin psi; - sin psi, cos psi) mat(delim: "[", E_1; E_2) $<xi-eta-E12>
また, 式 #link(<E12-phase>)[E12-phase] より $E_1 \, E_2$ は
$p = bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1$
を用いて次のように表される. $ E_1 & = a_1 cos p\
E_2 & = a_2 cos \( p + epsilon \) $<E1-p> これより $xi \, eta$ の表式
#link(<xi-eta-E12>)[xi-eta-E12] は三角関数の合成公式より $E_1 \, E_2$ の表式 #link(<E1-p>)[E1-p] #link(<E2-p>)[E2-p]
を用いて次のように表される. $ xi & = E_1 cos psi + E_2 sin psi\
 & = a_1 cos psi cos p + a_2 sin psi cos \( p + epsilon \)\
 & = a_1 cos psi cos p + a_2 sin psi \( cos p cos epsilon - sin p sin epsilon \)\
 & = \( med med a_1 cos psi + a_2 cos epsilon sin psi \) cos p - a_2 sin epsilon sin psi sin p\
 & = A_xi cos \( p + theta_xi \)\
eta & = - E_1 sin psi + E_2 cos psi\
 & = \( - a_1 sin psi + a_2 cos epsilon cos psi \) cos p - a_2 sin epsilon cos psi sin p\
 & = A_eta cos \( p + theta_eta \) $<xi> ただし, 振幅因子
$A_xi \, A_eta$ は次のように与える.
$ A_xi & = sqrt((med med a_1 cos psi + a_2 cos epsilon sin psi)^2 + \( a_2 sin epsilon sin psi \)^2)\
A_eta & = sqrt((- a_1 sin psi + a_2 cos epsilon cos psi)^2 + \( a_2 sin epsilon cos psi \)^2) $
また, 位相のずれ $theta_xi \, theta_eta$ は次のように定められる.
$ cos theta_xi & = frac(med med a_1 cos psi + a_2 cos epsilon sin psi, A_xi) \, quad sin theta_xi = frac(a_2 sin epsilon sin psi, A_xi)\
cos theta_eta & = frac(- a_1 sin psi + a_2 cos epsilon cos psi, A_xi) \, quad sin theta_eta = frac(a_2 sin epsilon cos psi, A_xi) $
ここで 振幅因子 $A_xi \, A_eta$ は式変形を行うことで次のように
$a_xi \, a_eta$ と一致する.
$ A_xi^2 & = (med med a_1 cos psi + a_2 cos epsilon sin psi)^2 + \( a_2 sin epsilon sin psi \)^2\
 & = a_1^2 cos^2 psi + a_2^2 sin^2 psi + 2 a_1 a_2 cos epsilon cos psi sin psi\
 & = a_xi^2\
A_eta^2 & = (- a_1 sin psi + a_2 cos epsilon cos psi)^2 + \( a_2 sin epsilon cos psi \)^2\
 & = a_eta^2 $ これは, 楕円の方程式 #link(<eclipse>)[eclipse] から $xi \, eta$ の振幅は
$a_xi \, a_eta$ であることが分かるので自明である.

次に位相差 $theta_eta - theta_xi$の表式を求める.
$ A_eta / A_xi e^(upright(i) \( theta_eta - theta_xi \)) & = frac(A_eta e^(upright(i) theta_eta), A_xi e^(upright(i) theta_xi))\
 & = frac(\( - a_1 sin psi + a_2 cos epsilon cos psi \) + upright(i) a_2 sin epsilon cos psi, \( quad a_1 cos psi + a_2 cos epsilon sin psi \) + upright(i) a_2 sin epsilon sin psi)\
 & = frac((\( - a_1 sin psi + a_2 cos epsilon cos psi \) + upright(i) a_2 sin epsilon cos psi) (\( a_1 cos psi + a_2 cos epsilon sin psi \) - upright(i) a_2 sin epsilon sin psi), \( a_1 cos psi + a_2 cos epsilon sin psi \)^2 + \( a_2 sin epsilon sin psi \)^2)\
 & = frac(upright(i) a_1 a_2 sin epsilon, \( a_1 cos psi + a_2 cos epsilon sin psi \)^2 + \( a_2 sin epsilon sin psi \)^2) $
これより, 絶対値と位相を考えると, 次のようになる.
$ A_eta / A_xi & = frac(a_1 a_2 \| sin epsilon \|, \( a_1 cos psi + a_2 cos epsilon sin psi \)^2 + \( a_2 sin epsilon sin psi \)^2)\
e^(upright(i) \( theta_eta - theta_xi \)) & = upright(s g n) \( sin epsilon \) upright(i) $
すると, 位相差 $theta_eta - theta_xi$ について
$ theta_eta - theta_xi & = cases(delim: "{", pi / 2 & \( sin epsilon > 0 \), frac(3 pi, 2) & \( sin epsilon < 0 \)) $
となるので $xi \, eta$ の表式 #link(<xi>)[xi] #link(<eta>)[eta] は次のようになる.
$ xi & = A_xi cos \( p + theta_xi \)\
eta & = A_eta cos \( p + theta_eta \)\
 & = minus.plus A_eta sin \( p + theta_xi \) #h(2em) \( sin epsilon gt.lt 0 \) $
よって, 次の式が確立される.
$ sin epsilon > 0 & arrow.l.r.double upright("「楕円偏光は左偏光である。」")\
sin epsilon < 0 & arrow.l.r.double upright("「楕円偏光は右偏光である。」") $~

]
#strong[Q 21B-12.]
光学では伝統的に楕円の形と偏光の回転の向きを記述するパラメータ $chi$
が用いられている. この問題では $chi$ について調べる.

まずパラメータ $chi in bb(R)$ は短軸 $a_eta$, 長軸 $a_xi$
を用いて次のように定義される. $ tan \| chi \| := a_eta / a_xi $
楕円の軸の長さを一意に決定させるには $\| chi \|$ の範囲は
$0 lt.eq \| chi \| lt.eq pi / 4$ である必要がある. このとき, 式
#link(<axiaeta-a1a2>)[axiaeta-a1a2], #link(label("a^2"))[a^2] と $a_xi \, a_eta \, a_1 \, a_2 > 0$
より
$ sin 2 \| chi \| & = 2 sin \| chi \| cos \| chi \| = 2 tan \| chi \| cos^2 \| chi \|\
 & = frac(2 tan \| chi \|, 1 + tan^2 \| chi \|)\
 & = frac(2 a_xi a_eta, a_xi^2 + a_eta^2)\
 & = frac(2 a_1 a_2, a_1^2 + a_2^2) \| sin epsilon \| $ となる.
この式を用いて $chi$ を次のように再定義する.
$ sin 2 chi & := - frac(2 a_1 a_2, a_1^2 + a_2^2) sin epsilon $<chi-def>
これは $chi$ の範囲が $- pi / 4 lt.eq chi lt.eq pi / 4$ を満たすとき,
元の定義の拡張となっている.
$ sin 2 chi = frac(2 tan chi, 1 + tan^2 chi) = & - frac(2 a_1 a_2, a_1^2 + a_2^2) sin epsilon\
= & plus.minus frac(2 a_1 a_2, a_1^2 + a_2^2) \| sin epsilon \| & \( sin epsilon lt.gt 0 \)\
= & plus.minus frac(2 a_xi a_eta, a_xi^2 + a_eta^2) = frac(2 (plus.minus a_eta / a_xi), 1 + (plus.minus a_eta / a_xi)^2)\
arrow.l.r.double & tan chi = plus.minus a_eta / a_xi & \( sin epsilon lt.gt 0 \)\
arrow.r.double.long & tan \| chi \| = a_eta / a_xi $ また,
次の対応が分かる.
$ chi gt.lt 0 arrow.l.r.double tan chi gt.lt 0 arrow.l.r.double sin epsilon lt.gt 0 arrow.l.r.double {upright("「楕円偏光は右偏光である。」")\
upright("「楕円偏光は左偏光である。」") $ これより
$- pi / 4 lt.eq chi lt.eq pi / 4$ という範囲のとき,
楕円偏光の形と偏光の回転の向きを一意に決定できる. \
#strong[Q 21B-13.]
この問題では楕円偏光の中でも円偏光はどのような条件の下で生じるのかを考える.
楕円偏光の方程式 #link(<eclipse>)[eclipse] は次のようであった.
$ (xi / a_xi)^2 + (eta / a_eta)^2 = 1 $ これより円偏光になる条件は
$a_xi = a_eta$ のときである. $a_1 \, a_2$ の楕円偏光の方程式より
$ upright("「楕円偏光は円偏光である。」") & arrow.l.r.double a_xi = a_eta arrow.l.r.double tan chi = plus.minus 1 arrow.l.r.double chi = plus.minus pi / 4\
 & arrow.l.r.double a_1 = a_2 and - frac(2 a_1 a_2, a_1^2 + a_2^2) sin epsilon = plus.minus 1\
 & arrow.l.r.double a_1 = a_2 and epsilon in pi (bb(Z) + 1 / 2) $ \
#strong[Q 21B-14.]
同様に直線偏光はどうのような条件の下で生じるのかを考える.
楕円偏光の方程式 #link(<eclipse>)[eclipse] と $chi$ の定義より直線偏光となる条件は
$a_eta = 0$ となる.
$ upright("「楕円偏光は直線偏光である。」") & arrow.l.r.double a_eta = 0 arrow.l.r.double tan chi = 0 arrow.l.r.double chi = 0\
 & arrow.l.r.double a_1 a_2 = 0 or epsilon in pi bb(Z) $
このとき振動面の角度 $psi$ は $epsilon = n pi quad \( n in bb(Z) \)$
とおくと式 #link(<psi-condition>)[psi-condition] より
$ tan 2 psi & = frac(2 tan psi, 1 + tan^2 psi) = frac(2 a_1 a_2, a_1^2 - a_2^2) cos epsilon = frac(2 (plus.minus a_2 / a_1), 1 + (plus.minus a_2 / a_1)^2) & (n "の偶奇")\
tan psi & = plus.minus a_2 / a_1 & (n "の偶奇")\
psi & = cases(delim: "{", alpha & \( n : "偶数" \), pi - alpha & \( n : "奇数" \)) $
となる. \
#strong[Q 21B-15.] 式 #link(<axi---aeta>)[axi---aeta] は次のようであった.
$ a_xi^2 - a_eta^2 & = frac(a_1^2 - a_2^2, cos 2 psi) $ $a_xi \, a_eta$
はそれぞれ長軸, 短軸の長さであるから左辺は正である.
よって次のようになる.
$ upright(s g n) \( a_1 - a_2 \) = upright(s g n) \( cos 2 psi \) $<sgn-psi>
\
#strong[Q 21B-16.] 式 #link(<psi-condition>)[psi-condition], #link(<chi-def>)[chi-def], #link(<sgn-psi>)[sgn-psi],
$- pi / 4 lt.eq chi lt.eq pi / 4$ より次の事がわかる.
$ cos^22 chi & = 1 - sin^22 chi = 1 - (frac(2 a_1 a_2, a_1^2 + a_2^2) sin epsilon)^2\
 & = (frac(a_1^2 - a_2^2, a_1^2 + a_2^2))^2 (1 - (frac(2 a_1 a_2, a_1^2 - a_2^2) cos^2 epsilon)^2)\
 & = (frac(a_1^2 - a_2^2, a_1^2 + a_2^2))^2 (1 - tan^22 psi)\
 & = (frac(a_1^2 - a_2^2, a_1^2 + a_2^2) frac(1, cos 2 psi))^2\
cos 2 chi & = frac(a_1^2 - a_2^2, a_1^2 + a_2^2) frac(1, cos 2 psi) gt.eq 0 $<cos-2chi>
\

= 位相のずれの規約: $epsilon$ と $delta$
<位相のずれの規約-varepsilon-と-delta>
$E_1 \, E_2$ を次の表式で表すことがある.
$ mat(delim: "[", E_1; E_2) & = mat(delim: "[", a_1 cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_1 \); a_2 cos \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_2 \))\
 & = mat(delim: "[", a_1 cos \( omega \( bold(k) \) t - bold(k) dot.op bold(r) + delta_1 \); a_2 cos \( omega \( bold(k) \) t - bold(k) dot.op bold(r) + delta_2 \))\
 & = mat(delim: "[", a_1 cos q; a_2 cos \( q + delta \)) $<E12-delta>
ただし
$delta_i = - epsilon_i \( i = 1 \, 2 \) \, q = omega \( bold(k) \) t - bold(k) dot.op bold(r) + delta_1 \, delta = delta_2 - delta_1$
とおく. すると $delta = - epsilon$ という関係が成り立つ. \
#strong[Q 21B-17.] 式 #link(<E12-delta>)[E12-delta] より場所 $bold(r)$ に留まり, 時間 $t$
の経過とともに, 電場ベクトルの波動を観測する立場から見て, 位相差 $delta$
について「$E_2$ は $E_1$ より $delta$
だけ位相が進んでいる。」つまり「$E_1$ は $E_2$ より $delta$
だけ位相が遅れている。」と言える.

同様に楕円偏光の向きについても次のようになる.
$ sin delta < 0 arrow.l.r.double sin epsilon > 0 arrow.l.r.double upright("「楕円偏光は左偏光である。」")\
sin delta > 0 arrow.l.r.double sin epsilon < 0 arrow.l.r.double upright("「楕円偏光は右偏光である。」") $

= Stokes パラメータ
<stokes-パラメータ>
#strong[Q 21B-18.] 波数 $bold(k) in bb(R)^3$ を持つ一般の単色波の電場は
#link(<E-def>)[E-def] 式より4つのパラメータ
$a_1 \, a_2 gt.eq 0 ; epsilon = - delta_1 \, epsilon = - delta in bb(R)$
によって記述される. これらは関係式
$tilde(E)_i = a_i e^(upright(i) epsilon_i)$ によって結びついている.
一般の単色波の電場の状態を記述する 4 個のパラメータは, 上手く用意すれば,
次のように異なる役割を持つ 3 個のグループに分けられる.

+ 時間の原点を指定する実パラメータ 1 個.場所 $bold(r) in bb(R)^3$
  に留まって観測するとします. 特定の時刻 $t in bb(R)$ において, 電場の 1
  成分と 2 成分で指定される点 $\( E_1 \, E_2 \)$ が Lissajous
  図形である偏光楕円上のどこにあるのかを,
  この実パラメータが指定します.このパラメータは $epsilon_1$ あるいは
  $delta_1$ に取ることができます.

+ 電場のスケールを指定する実パラメータ 1
  個.このパラメータを大きくすることは, $\( E_1 \, E_2 \)$ 面上の
  Lissajous 図形である偏光楕円の傾きと形を保って,
  楕円を相似に大きくすることに対応します.このパラメータは電場の強度
  $\| E \|^2 = a_1^2 + a_2^2$
  に取ることができます.これから見るよう後者の方が便利です.

+ 電場の偏光状態を指定する実パラメータ 2 個.電場の偏光状態は
  $\( E_1 \, E_2 \)$ 面上の Lissajous 図形である偏光楕円の傾きと形,
  加えて, 周回の向きにより記述されます.これを記述するパラメータは,
  偏光楕円の傾きを指定する角度 $psi$ と,
  偏光楕円の形と周回の向きを絶対値と符号で指定する角度 $chi$
  によって用意できます.

これらは互いに独立であることが明白であるから十分性は成り立つ.
必要性に関しては電場の定義となる実パラメータが4つと等しい数であることから成り立つ.
よってこれら4つのパラメータで電場を表現できる.

#strong[Q 21B-19.] 偏光状態のパラメータ $\( psi \, chi \)$
について次の事柄がわかっている.

+ パラメータ $psi$ は $0 lt.eq psi < pi$ の範囲の値を取る. $psi$ は
  $\( E_1 \, E_2 \)$ 面において $E_1$
  軸から計った偏光楕円の長軸の角度である.
  偏光楕円が円に縮退していない場合は, パラメータ $psi$
  の値は一意に定まる。偏光楕円が円に縮退している場合は, パラメータ $psi$
  の値は定まらない(どの値でもかまわない).

+ パラメータ $chi$ は $- pi / 4 lt.eq chi lt.eq pi / 4$の範囲の値を取る.
  偏光楕円の短半径 $a_eta$ と長半径 $a_xi$ を用いて
  $tan \| chi \| = a_eta \/ a_xi$ と書ける. $chi$ が正ならば右偏光,
  負ならば左偏光である. 特に $chi = plus.minus pi \/ 4$ が円偏光,
  $chi = 0$ が直線偏光である.

$psi = pi$ のとき $psi = 0$ と比べて,
軸の正の向きは逆であるが主軸の方向は同じなので偏光楕円の軌跡は等しく,
同一視できる. また, $chi = plus.minus pi / 4$ のとき,
偏光楕円が円に縮退している為,
楕円偏光の長軸の角度を変えても楕円偏光の軌跡は等しく, 同一視できる.
これより偏光楕円において同一視できる関係を $tilde.op$ とおくと,
次のように書ける.
$ \( psi = 0 \, chi \) & tilde.op \( psi = pi \, chi \) & \( - pi / 4 lt.eq chi lt.eq pi / 4 \)\
\( psi \, chi = pi / 4 \) & tilde.op \( psi' \, chi = pi / 4 \) & \( 0 lt.eq psi \, psi' lt.eq pi \)\
\( psi \, chi = - pi / 4 \) & tilde.op \( psi' \, chi = - pi / 4 \) & \( 0 lt.eq psi \, psi' lt.eq pi \) $
これより $psi$ を球面の経度, $chi$ を球面の緯度と捉えると $tilde.op$
による同値類は2次元球面 $S^2$ と同相になる. 例えば $chi = pi / 4$
は北極, $chi = 0$ は赤道, $chi = - pi / 4$ は南極と対応する. また,
$psi = 0 \, pi$ が Greenwich 子午線として同一視される.
$ {\( psi \, chi \) : 0 lt.eq psi lt.eq pi and - pi / 4 lt.eq chi lt.eq pi / 4} \/ tilde.op med tilde.equiv S^2 $
さらに電場の強度 $\| E \|^2$ のパラメータ空間は非負実数空間
$bb(R)_(gt.eq 0)$ であり, 電場の強度と偏光状態は独立である為,
電場の強度を半径と見なすことができる. よって強度と偏光のパラメータ空間は
3 次元実 Euclid 空間 $bb(R)^3$ と同相である.
$ bb(R)_(gt.eq 0) times S^2 tilde.equiv bb(R)^3 $
このことから強度と偏光状態のパラメータを 3 次元空間 $bb(R)^3$
上の点と対応させて考える. その点を極座標 $\( s_0 \, theta \, phi.alt \)$
で表すこととする. 上での対応させ方から次のように定義できる.
$ s_0 & = a_1^2 + a_2^2\
theta & = pi / 2 - 2 chi\
phi.alt & = 2 psi $ これより右手系の直交座標 $\( s_1 \, s_2 \, s_3 \)$
で表すと $ s_1 & = s_0 cos 2 psi cos 2 chi\
s_2 & = s_0 sin 2 psi cos 2 chi\
s_3 & = s_0 sin 2 chi $ である.
このようにして用意された電場の強度と偏光を記述する 4
つの実パラメータの組 $\( s_0 \, s_1 \, s_2 \, s_3 \)$
は「Stokesパラメータ」と呼ばれる. Stokesパラメータはパラメータ
$a_1 \, a_2 \, psi \, chi$ を用いて次のように表される.
$ s_0 & = a_1^2 + a_2^2\
s_1 & = s_0 cos 2 psi cos 2 chi\
s_2 & = s_0 sin 2 psi cos 2 chi\
s_3 & = s_0 sin 2 chi $<s1-def> このような状況を「完全偏光」と呼び,
より一般的な「部分偏光」をこれから考える. また完全偏光において関係式
$s_0^2 = s_1^2 + s_2^2 + s_3^2$ を満たす. このように点
$\( s_1 \, s_2 \, s_3 \)$ は原点を中心とする半径 $s_0$ の球面上にある.
この球面を「Poincaré 球面」と呼ぶ. \
#strong[Q 21B-22.]
上の定義を用いて表される次のベクトルを「Stokesベクトル」と呼ぶ.
$ bold(S) = mat(delim: "[", s_0; s_1; s_2; s_3) = mat(delim: "[", s_0, s_1, s_2, s_3)^top $
このとき具体的な例として以下のようなものがある.

<table:Stokes-Jones>

#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([偏光状態], [呼び名], [Stokesベクトル
      $bold(S)$], [Jonesベクトル $bold(J)$],),
    table.hline(),
    [直線偏光(水平)], [水平 $cal(P)$ 状態:
    LHP], [$mat(delim: "[", 1, 1, 0, 0)^top$], [$mat(delim: "[", 1, 0)^top$],
    [直線偏光(垂直)], [鉛直 $cal(P)$ 状態:
    LNP], [$mat(delim: "[", 1, - 1, 0, 0)^top$], [$mat(delim: "[", 0, 1)^top$],
    [直線偏光($+ 45$°)], [+45° の $cal(P)$ 状態:
    L+45P], [$mat(delim: "[", 1, 0, 1, 0)^top$], [$1 / sqrt(2) mat(delim: "[", 1, 1)^top$],
    [直線偏光($- 45$°)], [$- 45$° の $cal(P)$ 状態:
    L-45P], [$mat(delim: "[", 1, 0, - 1, 0)^top$], [$1 / sqrt(2) mat(delim: "[", 1, - 1)^top$],
    [円偏光(右回転)], [$cal(R)$ 状態:
    RCP], [$mat(delim: "[", 1, 0, 0, 1)^top$], [$1 / sqrt(2) mat(delim: "[", 1, upright(i))^top$],
    [円偏光(左回転)], [$cal(L)$ 状態:
    LCP], [$mat(delim: "[", 1, 0, 0, - 1)^top$], [$1 / sqrt(2) mat(delim: "[", 1, - upright(i))^top$],
  )]
  , caption: [重要な偏光状態の Stokes ベクトル]
  , kind: table
  )

] 
\

= Stokesパラメータの応用
<stokesパラメータの応用>
スピンの量子状態 $\|Psi⟩$ は2つの基底状態 $\|arrow.t⟩ \, \|arrow.b⟩$
の重ね合わせで与えられる.
$ \|Psi⟩ = c_1 \|arrow.t⟩ + c_2 \|arrow.b⟩ quad \( c_1 \, c_2 in bb(C) \) $
ここで次の $S^1$ gauge 変換に対し観測可能量の期待値は変化しない.
$ \|Psi⟩ mapsto \|Psi'⟩ = e^(upright(i) delta) \|Psi⟩ quad \( delta in bb(R) \) $
規格化条件と $S^1$ gauge 変換による同一視を課すと 2
つの実数パラメータにより指定でき, これは $S^2$
と同相であるという事実が知られている.
よってスピンの量子状態と光の偏光状態は $S^2$
と同相な物理量であることがわかる. 近年,
これらは量子計算の基礎的な資源と見なされている.

= Stokes パラメータの測定
<stokes-パラメータの測定>
Stokes パラメータ $s_0 \, s_1 \, s_2 \, s_3$
の最も重要な性質はこれらが直接的に観測可能な物理量であることである.
どのように測定可能なのかを学習する.

== Stokes パラメータの $a_1 \, a_2$ と $epsilon$ (あるいは $delta$) による表現
<stokes-パラメータの-a_1-a_2-と-varepsilon-あるいは-delta-による表現>
直線偏光と円偏光について以下のように定義していた.
$ tilde(bold(E)) \( bold(r) \, t \) & = tilde(E)_1 upright(e)_1 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) + tilde(E)_2 upright(e)_2 \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
 & = tilde(E)_(+) upright(e)_(+) \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) + tilde(E)_(-) upright(e)_(-) \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))\
tilde(E)_i & = a_i e^(upright(i) epsilon_i) \, a_i gt.eq 0 \, epsilon_i in bb(R) quad \( i = 1 \, 2 \, + \, - \) $<ET-line-def>
このとき次の等式が成り立つ.
$ tilde(E)_(+) & = 1 / sqrt(2) (tilde(E)_1 - upright(i) tilde(E)_2)\
tilde(E)_(-) & = 1 / sqrt(2) (tilde(E)_1 + upright(i) tilde(E)_2) $ \
#strong[Q 21B-23.]
このとき円偏光のパラメータを直線偏光のパラメータを用いて表すことを考える.
$ a_(+)^2 + a_(-)^2 & = \| tilde(E)_(+) \|^2 + \| tilde(E)_(+) \|^2\
 & = 1 / 2 (\| a_1 e^(upright(i) epsilon_1) - upright(i) a_2 e^(upright(i) epsilon_2) \|^2 + \| a_1 e^(upright(i) epsilon_1) + upright(i) a_2 e^(upright(i) epsilon_2) \|^2)\
 & = a_1^2 + a_2^2\
a_(+)^2 - a_(-)^2 & = \| tilde(E)_(+) \|^2 - \| tilde(E)_(+) \|^2\
 & = 1 / 2 (\| a_1 e^(upright(i) epsilon_1) - upright(i) a_2 e^(upright(i) epsilon_2) \|^2 - \| a_1 e^(upright(i) epsilon_1) + upright(i) a_2 e^(upright(i) epsilon_2) \|^2)\
 & = 2 a_1 a_2 sin \( epsilon_2 - epsilon_1 \)\
2 a_(+) a_(-) cos \( epsilon_(-) - epsilon_(+) \) & = Re \( 2 tilde(E)_(-) tilde(E)_(+)^(\*) \)\
 & = Re \( \( a_1^2 - a_2^2 \) + upright(i) \( 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \) \) \)\
 & = a_1^2 - a_2^2\
2 a_(+) a_(-) sin \( epsilon_(-) - epsilon_(+) \) & = Im \( 2 tilde(E)_(-) tilde(E)_(+)^(\*) \)\
 & = Im \( \( a_1^2 - a_2^2 \) + upright(i) \( 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \) \) \)\
 & = 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \) $

#strong[Q 21B-24.]
Stokesパラメータを直線偏光のパラメータで表現することを考える. 式
#link(<cos-2chi>)[cos-2chi], #link(<chi-def>)[chi-def] より $ s_0 & = a_1^2 + a_2^2\
s_1 & = s_0 cos 2 psi cos 2 chi\
 & = a_1^2 - a_2^2\
s_2 & = s_0 sin 2 psi cos 2 chi\
 & = s_0 cos 2 psi cos 2 chi dot.op tan 2 psi\
 & = 2 a_1 a_2 cos delta = 2 a_1 a_2 cos epsilon\
s_3 & = s_0 sin 2 chi\
 & = 2 a_1 a_2 sin delta = - 2 a_1 a_2 sin epsilon $

== 電場の通常の規約による複素表示 $tilde(E)$ を用いて
<電場の通常の規約による複素表示-tildee-を用いて>
#strong[Q 21B-25, Q 21B-26.] 電場の複素表示 $tilde(bold(E))$
と一般の楕円偏光の基底ベクトル
$upright(e)_i \, upright(e)_j in bb(C)^3 quad \( \( i \, j \) = \( 1 \, 2 \) \, \( + \, - \) \)$
の直交性より
$ upright(e)_i \( bold(k) \)^(\*) dot.op tilde(bold(E)) & = tilde(E)_i e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) = a_i e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t + epsilon_i \))\
(upright(e)_i \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) (upright(e)_j \( bold(k) \)^(\*) dot.op tilde(bold(E))) & = tilde(E)_i^(\*) tilde(E)_j = a_i a_j e^(upright(i) \( epsilon_j - epsilon_i \)) $<Ei-Ej>
となる. 特に直線偏光の基底ベクトル
$upright(e)_1 \, upright(e)_2 in bb(R)^3$ より,
$upright(e)_i = upright(e)_i^(\*) quad \( i = 1 \, 2 \)$ となる. \
#strong[Q 21B-27.] 式 #link(<Ei-Ej>)[Ei-Ej]
よりStokesパラメータは直線偏光のパラメータを用いて
$ s_0 & = a_1^2 + a_2^2 = lr(|upright(e)_1 \( bold(k) \) dot.op tilde(bold(E))|)^2 + lr(|upright(e)_2 \( bold(k) \) dot.op tilde(bold(E))|)^2\
s_1 & = a_1^2 - a_2^2 = lr(|upright(e)_1 \( bold(k) \) dot.op tilde(bold(E))|)^2 - lr(|upright(e)_2 \( bold(k) \) dot.op tilde(bold(E))|)^2\
s_2 & = 2 a_1 a_2 cos \( epsilon_2 - epsilon_1 \) = 2 Re {(upright(e)_1 \( bold(k) \) dot.op tilde(bold(E)))^(\*) (upright(e)_2 \( bold(k) \) dot.op tilde(bold(E)))}\
s_3 & = - 2 a_1 a_2 sin \( epsilon_2 - epsilon_1 \) = - 2 Im {(upright(e)_1 \( bold(k) \) dot.op tilde(bold(E)))^(\*) (upright(e)_2 \( bold(k) \) dot.op tilde(bold(E)))} $
と表される. \
#strong[Q 21B-28.] さらに Q 21B-23 より円偏光のパラメータを用いて
$ s_0 & = a_(+)^2 + a_(-)^2 = lr(|upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2 + lr(|upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2\
s_1 & = 2 a_(+) a_(-) cos \( epsilon_(-) - epsilon_(+) \) = 2 Re {(upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) (upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E)))}\
s_2 & = 2 a_(+) a_(-) sin \( epsilon_(-) - epsilon_(+) \) = 2 Im {(upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) (upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E)))}\
s_3 & = - (a_(+)^2 - a_(-)^2) = - {lr(|upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2 - lr(|upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2} $
と表される. これらの $s_3$
にマイナスが含まれているところが気に入らないらしく,
光学で使われる電場の複素表示を用いることで対称性のよい形にできることを次の節で示す.
\

== 電場の光学の規約による複素表示 $bold(cal(E))$ を用いて
<電場の光学の規約による複素表示-bmmathcale-を用いて>
電場の複素表示の複素共役 $bold(cal(E)) \( bold(r) \, t \)$ を定義する.
$ bold(cal(E)) \( bold(r) \, t \) = tilde(bold(E)) \( bold(r) \, t \)^(\*) $
これを「光学の流儀の複素表示」あるいは「新しい複素表示」と呼ぶこととする.
\
#strong[Q 21B-29, Q 21B-30.] 式 #link(<ET-line-def>)[ET-line-def], #link(<ET-circle-def>)[ET-circle-def]
に複素共役を取って新しい複素表示は次のように表される.
$ bold(cal(E)) \( bold(r) \, t \) & = cal(E)_1 upright(e)_1 \( bold(k) \) e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) + cal(E)_2 upright(e)_2 \( bold(k) \) e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \))\
cal(E)_i & = tilde(E)_i^(\*) = a_i e^(upright(i) delta_i) #h(2em) \( i = 1 \, 2 \)\
bold(cal(E)) \( bold(r) \, t \) & = cal(E)_(+) upright(e)_(+) \( bold(k) \) e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) + cal(E)_(-) upright(e)_(-) \( bold(k) \) e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \))\
cal(E)_plus.minus & = tilde(E)_minus.plus^(\*) = cal(A)_plus.minus e^(upright(i) delta_plus.minus) quad \( cal(A)_plus.minus = a_minus.plus \, delta_plus.minus = - epsilon_minus.plus \) $
円偏光において新しい複素振幅 $cal(E)_plus.minus$ と古い複素振幅
$tilde(E)_plus.minus$ は成分の添字の $+$ と $-$
が反転して結びついていることに注意すべきである. また,
これより次の式を導ける.
$ upright(e)_i \( bold(k) \) dot.op bold(cal(E)) & = cal(E)_i e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) = (tilde(E)_i e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)))^(\*) = (upright(e)_i \( bold(k) \) dot.op tilde(bold(E)))^(\*)\
upright(e)_plus.minus \( bold(k) \)^(\*) dot.op bold(cal(E)) & = cal(E)_plus.minus e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) = (tilde(E)_minus.plus e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)))^(\*) = (upright(e)_minus.plus \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) $<EC-ET-converter-12>
\
#strong[Q 21B-31.] また上式の考察より次のように偏光の向きも逆転する.
$ bold(cal(E)) \( bold(r) \, t \) = cal(E)_(+) upright(e)_(+) \( bold(k) \) e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) & arrow.l.r.double upright("「円偏光は右偏光である。」")\
 & arrow.l.r.double upright("「helicity が ") - 1 upright(" である。」")\
bold(cal(E)) \( bold(r) \, t \) = cal(E)_(-) upright(e)_(-) \( bold(k) \) e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) & arrow.l.r.double upright("「円偏光は左偏光である。」")\
 & arrow.l.r.double upright("「helicity が ") + 1 upright(" である。」") $
\
#strong[Q 21B-32.] 式 #link(<EC-ET-converter-12>)[EC-ET-converter-12] より Stokes パラメータは
$bold(cal(E))$ を用いて次のように表される.
$ s_0 & = lr(|upright(e)_1 \( bold(k) \) dot.op tilde(bold(E))|)^2 + lr(|upright(e)_2 \( bold(k) \) dot.op tilde(bold(E))|)^2 = \| upright(e)_1 \( bold(k) \) dot.op bold(cal(E)) \|^2 + \| upright(e)_2 \( bold(k) \) dot.op bold(cal(E)) \|^2\
s_1 & = lr(|upright(e)_1 \( bold(k) \) dot.op tilde(bold(E))|)^2 - lr(|upright(e)_2 \( bold(k) \) dot.op tilde(bold(E))|)^2 = \| upright(e)_1 \( bold(k) \) dot.op bold(cal(E)) \|^2 - \| upright(e)_2 \( bold(k) \) dot.op bold(cal(E)) \|^2\
s_2 & = 2 Re {(upright(e)_1 \( bold(k) \) dot.op tilde(bold(E)))^(\*) (upright(e)_2 \( bold(k) \) dot.op tilde(bold(E)))} = 2 Re {(upright(e)_1 \( bold(k) \) dot.op bold(cal(E)))^(\*) (upright(e)_2 \( bold(k) \) dot.op bold(cal(E)))}\
s_3 & = - 2 Im {(upright(e)_1 \( bold(k) \) dot.op tilde(bold(E)))^(\*) (upright(e)_2 \( bold(k) \) dot.op tilde(bold(E)))} = 2 Im {(upright(e)_1 \( bold(k) \) dot.op bold(cal(E)))^(\*) (upright(e)_2 \( bold(k) \) dot.op bold(cal(E)))} $
\
#strong[Q 21B-33.] 式 #link(label("EC-ET-converter-+-"))[EC-ET-converter-+-] より Stokes
パラメータは $bold(cal(E))$ を用いて次のように表される.
$ s_0 & = lr(|upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2 + lr(|upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2 = lr(|upright(e)_(+) \( bold(k) \)^(\*) dot.op bold(cal(E))|)^2 + lr(|upright(e)_(-) \( bold(k) \)^(\*) dot.op bold(cal(E))|)^2\
s_1 & = 2 Re {(upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) (upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E)))} = 2 Re {(upright(e)_(+) \( bold(k) \)^(\*) dot.op bold(cal(E)))^(\*) (upright(e)_(-) \( bold(k) \)^(\*) dot.op bold(cal(E)))}\
s_2 & = 2 Im {(upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E)))^(\*) (upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E)))} = 2 Im {(upright(e)_(+) \( bold(k) \)^(\*) dot.op bold(cal(E)))^(\*) (upright(e)_(-) \( bold(k) \)^(\*) dot.op bold(cal(E)))}\
s_3 & = - {lr(|upright(e)_(+) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2 - lr(|upright(e)_(-) \( bold(k) \)^(\*) dot.op tilde(bold(E))|)^2} = lr(|upright(e)_(+) \( bold(k) \)^(\*) dot.op bold(cal(E))|)^2 - lr(|upright(e)_(-) \( bold(k) \)^(\*) dot.op bold(cal(E))|)^2 $<s3-circle>

== 直線偏光子を用いると何が測定できるか？
<直線偏光子を用いると何が測定できるか>
まず一般的な楕円偏光の電場において, 次のように Jones ベクトル $bold(J)$
を定義する.
$ bold(J) & = mat(delim: "[", cal(E)_1; cal(E)_2) in bb(C)^2\
bold(cal(E)) \( bold(r) \, t \) & = mat(delim: "[", cal(E)_1 \( bold(r) \, t \); cal(E)_2 \( bold(r) \, t \)) = mat(delim: "[", cal(E)_1; cal(E)_2) e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) $

#strong[Q 21B-34.] このとき Stokes ベクトル $bold(S)$ を Jones ベクトル
$bold(J)$ を用いて次のように表される.
$ s_0 & = \| cal(E)_1 \|^2 + \| cal(E)_2 \|^2\
s_1 & = \| cal(E)_1 \|^2 - \| cal(E)_2 \|^2\
s_2 & = 2 Re \( cal(E)_1^(\*) cal(E)_2 \)\
s_3 & = 2 Im \( cal(E)_1^(\*) cal(E)_2 \) $

#strong[Q 21B-35.] また光の強度 $I$ について Jones ベクトル $bold(J)$
の絶対値の二乗に比例することが分かる.
$ I & = ⟨bold(E) \( bold(r) \, t \)⟩\
 & = ⟨{Re bold(cal(E)) \( bold(r) \, t \)}^2⟩\
 & = 1 / 2 ⟨lr(|bold(cal(E)) \( bold(r) \, t \)|)^2⟩\
 & = 1 / 2 \| bold(J) \|^2 $<Jones-strength>

#strong[Q 21B-36.] 以上の定義を用いて #link(<table:Stokes-Jones>)[table:Stokes-Jones] での Jones
ベクトルの正当性が分かる. \
任意の光学素子を取り上げると, Jones ベクトルの変換は表現論より行列
$M \( 2 \; bb(C) \)$ で書ける. これを Jones 行列と呼ぶ.
また素子の1つとして直線偏光子があり,
最も単純な直線偏光子は針金格子偏光子 (wire grid polarizer) でしょう.
電磁場の波よりもずっと細い直径を持つ直線状の伝導性の良い金属の針金を多数用意し,
それらを波長 $lambda$
よりずっと狭い間隔だけ離して等間隔に並行に板状に並べる.このような板状の物体が「針金格子偏光子」である.
\
#strong[Q 21B-37.]
すきまと並行な成分において定常波を作ることができない為,
電磁波を通さない. よって「針金格子偏光子の透過軸は,
針金が並べられた面内で, すきまと垂直な方向である」. \
#strong[Q 21B-38.] 1軸 $upright(e)_1 \( bold(k) \)$ から測った角度が
$theta$ であるときの直線偏光子の Jones 行列を
$T^(upright("直線偏光子")) \( theta \)$ とおく. このとき,
直線偏光子の定義より
$ T^(upright("直線偏光子")) \( 0 \) & = mat(delim: "[", 1, 0; 0, 0)\
T^(upright("直線偏光子")) (pi / 2) & = mat(delim: "[", 0, 0; 0, 1) $
となる. \
#strong[Q 21B-39.] Jones 行列が $T$ の光学素子 $d$ について角度 $theta$
だけ回転させた光学素子を $d \( theta \)$ として, その Jones 行列
$T \( theta \)$ について回転させた座標系で $T$
を適用していると考えられる為, 次のような関係式が成り立つ.
$ T \( theta \) = R \( theta \) T R \( - theta \) $

#strong[Q 21B-40.] 直線偏光子の Jones
行列について上での考察より次のようになる.
$ T^(upright("直線偏光子")) \( theta \) & = R \( theta \) T^(upright("直線偏光子")) \( 0 \) R \( - theta \)\
 & = mat(delim: "[", cos^2 theta, cos theta sin theta; sin theta cos theta, sin^2 theta) $
また次のように行列 $T^(upright("直線偏光子")) \( theta \)$
は射影演算子を表す行列であることが分かる.
$ {T^(upright("直線偏光子")) \( theta \)}^2 & = mat(delim: "[", cos^2 theta, cos theta sin theta; sin theta cos theta, sin^2 theta)\
 & = {T^(upright("直線偏光子")) \( theta \)}^dagger\
 & = T^(upright("直線偏光子")) \( theta \) $

#strong[Q 21B-41.] 水平状態 $bold(J) = \[ cal(E) \, 0 \]^t in bb(C)^2$
の光を直線偏光子 $T^(upright("直線偏光子")) \( theta \)$
に通したときの出力の光の強度 $I \( theta \)$ を考える. 式
#link(<Jones-strength>)[Jones-strength] より Jones ベクトルを用いて光の強度を表せられる.
$ I \( theta \) & = 1 / 2 lr(|T^(upright("直線偏光子")) \( theta \) mat(delim: "[", cal(E); 0)|)^2\
 & = 1 / 2 lr(|cal(E) mat(delim: "[", cos^2 theta; cos theta sin theta)|)^2\
 & = 1 / 2 \| cal(E) \|^2 cos^2 theta\
 & = I \( 0 \) cos^2 theta $ これを Malus の法則と呼ぶ. \
#strong[Q 21B-42.] 一般の偏光状態
$bold(J) = \[ cal(E)_1 \, cal(E)_2 \]^t in bb(C)^2$ の光を直線偏光子
$T^(upright("直線偏光子")) \( theta \)$ に通したときの出力の光の強度
$I \( theta \)$ を考える.
$ I \( theta \) & = 1 / 2 lr(|T^(upright("直線偏光子")) \( theta \) bold(J)|)^2\
 & = 1 / 2 bold(J)^dagger {T^(upright("直線偏光子")) \( theta \)}^dagger T^(upright("直線偏光子")) \( theta \) bold(J)\
 & = 1 / 2 bold(J)^dagger T^(upright("直線偏光子")) \( theta \) bold(J)\
 & = 1 / 2 (\| cal(E)_1 \|^2 cos^2 theta + \| cal(E)_2 \|^2 sin^2 theta + \( cal(E)_1^(\*) cal(E)_2 + cal(E)_1 cal(E)_2^(\*) \) cos theta sin theta)\
 & = 1 / 4 (\| cal(E)_1 \|^2 + \| cal(E)_2 \|^2) + 1 / 4 (\| cal(E)_1 \|^2 - \| cal(E)_2 \|^2) cos 2 theta + 1 / 2 Re \( cal(E)_1^(\*) cal(E)_2 \) sin 2 theta\
 & = 1 / 4 {s_0 + s_1 cos 2 theta + s_2 sin 2 theta}\
 & = 1 / 4 {s_0 + sqrt(s_1^2 + s_2^2) cos \( 2 theta - phi \)} $<I-s012>
ただし,
$ cos phi = s_1 / sqrt(s_1^2 + s_2^2) \, sin phi = s_2 / sqrt(s_1^2 + s_2^2) $
である. これらは次の極めて重要な事実を教えてくれている.
「与えられた単色光の Stokes パラメータのうちの 3 個 $s_0 \, s_1 \, s_2$
は, その光をいろいろな角度 $theta$
に傾けた直線偏光子に透過して強度を測定することによって決定できる.」 \
#strong[Q 21B-43.] 上の事実について具体式を考える. 式 #link(<I-s012>)[I-s012] より
$ I \( 0 \) & = s_0 + s_1\
I (pi / 4) & = s_0 + s_2\
I (pi / 2) & = s_0 - s_1\
I (frac(3 pi, 4)) & = s_0 - s_2 $ よって Stokes パラメータ
$s_0 \, s_1 \, s_2$ は次のように表される.
$ s_0 & = 2 {I \( 0 \) + I (pi / 2)}\
 & = 2 {I (pi / 4) + I (pi / 2)}\
s_1 & = 2 {I \( 0 \) - I (pi / 2)}\
s_2 & = 2 {I (pi / 4) - I (frac(3 pi, 4))} $ これらは次の意味を表す.
$ s_0 & prop \( upright("全強度") \)\
s_1 & prop \( upright("水平偏光成分の強度") \) - \( upright("鉛直偏光成分の強度") \)\
s_2 & prop \( + 45 upright("° 偏光成分の強度") \) - \( - 45 upright("° 偏光成分の強度") \) $

== $1 \/ 4$ 波長板も用いると何が測定できるか？
<波長板も用いると何が測定できるか>
式 #link(<s3-circle>)[s3-circle] より $s_3$ は次のような意味を持つ.
$ s_3 prop \( upright("右円偏光成分の強度") \) - \( upright("左円偏光成分の強度") \) $
これを測定するにはどうすればよいのか?
これは円偏光成分を直線偏光成分に変換できれば測定できる. この変換が
$1 \/ 4$ 波長板を用いて実行できることをここで学ぶ. \
遅相子 (wave retarder)
は直線偏光成分のうちの片方をもう片方に対して一定の位相だけ遅らせる変換を行い出力する光学素子である.
$ T^(upright("遅相子")) \( phi.alt \) = mat(delim: "[", e^(upright(i) phi.alt / 2), 0; 0, e^(- upright(i) phi.alt / 2)) $
この行列は位相を回転する操作を行うと次と同等となる.
$ mat(delim: "[", 1, 0; 0, e^(- upright(i) phi.alt)) $

#strong[Q 21B-44.] 遅相子に純粋に直線偏光した光を入れることを考える.
$ T^(upright("遅相子")) \( phi.alt \) mat(delim: "[", 1; 0) & = mat(delim: "[", e^(upright(i) phi.alt / 2); 0)\
T^(upright("遅相子")) \( phi.alt \) mat(delim: "[", 0; 1) & = mat(delim: "[", 0; e^(- upright(i) phi.alt / 2)) $
これらは回転する操作を行えば何も変化しないことが分かる. \
#strong[Q 21B-45.] $1 \/ 2$ 波長板の Jones 行列を次のように定義する.
$ T^(1 \/ 2 upright("波長板")) & = T^(upright("遅相子")) \( pi \) = mat(delim: "[", upright(i), 0; 0, - upright(i)) $
これに $+ 45$° 方向に直線偏光した光と $- 45$°
方向に直線偏光した光を通すと
$ T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; 1) & = upright(i) / sqrt(2) mat(delim: "[", 1; - 1)\
T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; - 1) & = upright(i) / sqrt(2) mat(delim: "[", 1; 1) $
となり, これは $1 \/ 2$ 波長板によって L+45P と L-45P は相互変換する. \
また 右円偏光した光と左円偏光した光を通すと
$ T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; upright(i)) & = upright(i) / sqrt(2) mat(delim: "[", 1; - upright(i))\
T^(1 \/ 2 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; - upright(i)) & = upright(i) / sqrt(2) mat(delim: "[", 1; upright(i)) $
となり, これは $1 \/ 2$ 波長板によって RCP と LCP は相互変換する. \
#strong[Q 21B-46.] $1 \/ 4$ 波長板の Jones 行列を次のように定義する.
$ T^(1 \/ 4 upright("波長板")) & = T^(upright("遅相子")) (pi / 2) = mat(delim: "[", e^(upright(i) pi / 4), 0; 0, e^(- upright(i) pi / 4)) = mat(delim: "[", frac(1 + upright(i), sqrt(2)), 0; 0, frac(1 - upright(i), sqrt(2))) $
これに L+45P, L-45P を通すとそれぞれ LCP, RCP へ変換されることが分かる.
$ T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; 1) & = frac(1 + upright(i), 2) mat(delim: "[", 1; - upright(i))\
T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; - 1) & = frac(1 + upright(i), 2) mat(delim: "[", 1; upright(i)) $
同様に RCP, LCP を通すとそれぞれ L+45P, L-45P へ変換されることが分かる.
$ T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; upright(i)) & = frac(1 + upright(i), 2) mat(delim: "[", 1; 1)\
T^(1 \/ 4 upright("波長板")) 1 / sqrt(2) mat(delim: "[", 1; - upright(i)) & = frac(1 + upright(i), 2) mat(delim: "[", 1; - 1) $
光学領域での $1 \/ 4$
波長板はサランラップを半ダースほど向きを揃えて重ねることにより自作できるらしい.
\
#strong[Q 21B-47.] 円偏光した光は $1 \/ 4$ 波長板により直線偏光に変換し,
その光強度を求めることで右偏光, 左偏光の光強度が求まる. 式 #link(<s3-circle>)[s3-circle]
より $s 3$ が求まる.

= 準単色光と部分偏光
<準単色光と部分偏光>
今まで単色光のときを考えていたが,
波数や角振動数に広がりを持つ場合を考える. 波数, スペクトル線の幅,
角振動数の広がり $Delta k \, Delta nu \, Delta omega$ とおく. \
#strong[Q 21B-48.] 波数 $bold(k) in bb(R)^3$ を中心にして, 広がり
$\| Delta bold(k) \| tilde.op Delta k = c^(- 1) Delta nu$
を持つ準単色光を考える. このとき電場の複素表示
$bold(cal(E)) \( bold(r) \, t \)$ は次のように Fourier 変換される.
$ bold(cal(E)) \( bold(r) \, t \) & = integral.triple_(\| bold(k)' - bold(k) \| lt.eq Delta k) d V \( bold(k)' \) {cal(E)_1 \( bold(k)' \) upright(e)_1 \( bold(k)' \) + cal(E)_2 \( bold(k)' \) upright(e)_2 \( bold(k)' \)} e^(upright(i) \( omega \( bold(k)' \) t - bold(k)' dot.op bold(r) \))\
 & = integral.triple_(\| delta bold(k) \| lt.eq Delta k) d V \( delta bold(k) \) {cal(E)_1 \( bold(k) + delta bold(k) \) upright(e)_1 \( bold(k) + delta bold(k) \) + cal(E)_2 \( bold(k) + delta bold(k) \) upright(e)_2 \( bold(k) + delta bold(k) \)} e^(upright(i) \( omega \( bold(k) + delta bold(k) \) t - \( bold(k) + delta bold(k) \) dot.op bold(r) \))\
 & = e^(upright(i) \( omega \( bold(k) \) t - bold(k) dot.op bold(r) \)) integral.triple_(\| delta bold(k) \| lt.eq Delta k) d V \( delta bold(k) \) {cal(E)_1 \( bold(k) + delta bold(k) \) upright(e)_1 \( bold(k) + delta bold(k) \) + cal(E)_2 \( bold(k) + delta bold(k) \) upright(e)_2 \( bold(k) + delta bold(k) \)} e^(upright(i) {\( omega \( bold(k) + delta bold(k) \) - omega \( bold(k) \) \) t - delta bold(k) dot.op bold(r)})\
 $<EC-fourier> ここでコヒーレンス時間 $t_c = Delta nu^(- 1)$
より十分短い時間間隔 $Delta t lt.double t_c$ のとき
$\( omega \( bold(k) + delta bold(k) \) - omega \( bold(k) \) \) Delta t tilde.op Delta nu t_c lt.double 1$
となるので式 #link(<EC-fourier>)[EC-fourier] は単色光と見なすことができる. \
#strong[Q 21B-49.]
コヒーレンス時間を超える時間スケールではコヒーレンス時間 $t_c$
程度の時間間毎ごとに定まる Stokes
パラメータの時間平均を取ることによって, 準単色波の Stokes パラメータ
$s_0 \, s_1 \, s_2 \, s_3$ を定義することが出来る. これより1,
2軸の複素振幅を
$a_1 e^(upright(i) delta_1) \, a_2 e^(upright(i) delta_2)$
とおくと平均値の線形性より
$ s_0 & = chevron.l a_1^2 chevron.r + chevron.l a_2^2 chevron.r\
s_1 & = chevron.l a_1^2 chevron.r - chevron.l a_2^2 chevron.r\
s_2 & = 2 chevron.l a_1 a_2 cos delta chevron.r\
s_3 & = 2 chevron.l a_1 a_2 sin delta chevron.r $ と書ける.
完全偏光において関係式 $s_0^2 = s_1^2 + s_2^2 + s_3^2$ を満たしていたが,
準単色波のとき
$ s_0^2 & = (chevron.l a_1^2 chevron.r + chevron.l a_2^2 chevron.r)^2\
 & = s_1^2 + 4 chevron.l a_1^2 chevron.r chevron.l a_2^2 chevron.r\
 & gt.eq s_1^2 + 4 chevron.l a_1 a_2 chevron.r^2\
 & = s_1^2 + 4 chevron.l a_1 a_2 chevron.r^2 chevron.l cos^2 delta + sin^2 delta chevron.r\
 & gt.eq s_1^2 + \( 2 chevron.l a_1 a_2 cos delta chevron.r \)^2 + \( 2 chevron.l a_1 a_2 sin delta chevron.r \)^2\
 & = s_1^2 + s_2^2 + s_3^2 $ このような不等式となるので新しいパラメータ
$p in \[ 0 \, 1 \]$ を用いて式 #link(<s1-def>)[s1-def] #link(<s2-def>)[s2-def] #link(<s3-def>)[s3-def] を修正する.
$ s_0 & = chevron.l a_1^2 chevron.r + chevron.l a_2^2 chevron.r\
s_1 & = p s_0 cos 2 psi cos 2 chi\
s_2 & = p s_0 sin 2 psi cos 2 chi\
s_3 & = p s_0 sin 2 chi $ パラメータ $p$ は準単色光の「偏光度」(degree
of polarization) と呼ばれる.

準単色光の偏光度 $p$ に関するいくつかの用語と重要な性質をまとめる.

+ $p = 1$ の光は「完全偏光」状態にあると言われます. また, $p = 0$
  の光は「まったく偏光していない」(completely unpolarized)
  あるいは「自然光」(natural light) と呼ばれます. それに対して, 一般の
  $0 lt.eq p lt.eq 1$ の光は「部分偏光」状態にあると言われます.

+ 本物の単色光は完全偏光状態 ($p = 1$) にあります.そして, 完全偏光状態
  ($p = 1$) は必ず単色光です. つまり,
  単色光と完全偏光状態はまったく同義です.

+ 部分偏光状態にある光の状態点は半径 $s_0$ の Poincaré
  球面の内部の点に対応します. Poincaré
  球面の表面の各点が完全偏光状態に対応します. Poincaré
  球面の中心の点がまったく偏光していない状態に対応します.

+ 太陽の光や白熱電球の光はまったく偏光していない状態 ($p = 0$)
  にあります. それに比べて, レーザーの光は完全偏光状態にごく近いです
  ($p approx 1$).

= helicity とは何か？
<helicity-とは何か>
== 電磁波の角運動量のスピン部分と軌道部分
<電磁波の角運動量のスピン部分と軌道部分>
#strong[Q 21B-50.] 電磁波の角運動量 $bold(L)$ は次のようであった.
$ bold(L) & = frac(1, 4 pi c) integral.triple_(bb(R)^3) d V \( bold(r) \) bold(r) times \( bold(E) times bold(B) \) $
中身の部分を $bold(B) = bold(nabla) times bold(A)$ を用いて展開すると
$ bold(r) times \( bold(E) times bold(B) \) & = bold(r) times \( bold(E) times \( bold(nabla) times bold(A) \) \)\
 & = bold(r) times \( bold(nabla) \( bold(E) dot.op bold(A) \) - \( bold(E) dot.op bold(nabla) \) bold(A) \)\
 & . . . upright("分からなかった")\
 & = bold(E) times bold(A) + bold(E)_j \( bold(r) times bold(nabla) \) A_j $
よって角運動量は次のように書ける.
$ bold(L) & = bold(L)_(s p i n) + bold(L)_(o r b i t) $ ただし
$ bold(L)_(s p i n) & = frac(1, 4 pi c) integral.triple_(bb(R)^3) d V \( bold(r) \) bold(E) times bold(A)\
bold(L)_(o r b i t) & = frac(1, 4 pi c) integral.triple_(bb(R)^3) d V \( bold(r) \) sum_(j = x \, y \, z) bold(E)_j \( bold(r) times bold(nabla) \) A_j $
である. \
#strong[Q 21B-51.] 円偏光の基底ベクトルの定義より,
$ upright(e)_plus.minus \( bold(k) \) times frac(bold(k), \| bold(k) \|) & = 1 / sqrt(2) (upright(e)_1 \( bold(k) \) plus.minus upright(i) upright(e)_2 \( bold(k) \)) times frac(bold(k), \| bold(k) \|)\
 & = 1 / sqrt(2) (- upright(e)_2 \( bold(k) \) plus.minus upright(i) upright(e)_1 \( bold(k) \))\
 & = plus.minus upright(i) upright(e)_plus.minus \( bold(k) \)\
upright(e)_plus.minus \( bold(k) \) times upright(e)_plus.minus \( bold(k) \) & = 0\
upright(e)_plus.minus \( bold(k) \) times upright(e)_minus.plus \( bold(k) \) & = 1 / sqrt(2) (upright(e)_1 \( bold(k) \) plus.minus upright(i) upright(e)_2 \( bold(k) \)) times 1 / sqrt(2) (upright(e)_1 \( bold(k) \) minus.plus upright(i) upright(e)_2 \( bold(k) \))\
 & = minus.plus upright(i) upright(e)_1 \( bold(k) \) times upright(e)_2 \( bold(k) \)\
 & = minus.plus upright(i) frac(bold(k), \| bold(k) \|) $ となる. \
#strong[Q 21B-52] 波数 $bold(k)$
について対称性が成り立つようにすることで矛盾なく次のように定義できる.
$ upright(e)_1 \( - bold(k) \) = upright(e)_2 \( bold(k) \) \, upright(e)_2 \( - bold(k) \) = upright(e)_1 \( bold(k) \) $
このとき次の式が導かれる.
$ upright(e)_plus.minus \( - bold(k) \) & = 1 / sqrt(2) (upright(e)_1 \( - bold(k) \) plus.minus upright(i) upright(e)_2 \( - bold(k) \))\
 & = 1 / sqrt(2) (upright(e)_2 \( bold(k) \) plus.minus upright(i) upright(e)_1 \( bold(k) \))\
 & = plus.minus upright(i) upright(e)_minus.plus \( bold(k) \) $

#strong[Q 21B-53] $bold(A)$ について Fourier 変換すると次のようになる.
$ bold(A) \( bold(r) \, t \) & = sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) {upright(e)_j \( bold(k) \) a_j \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) + upright(e)_j^(\*) \( bold(k) \) a_j^(\*) \( bold(k) \) e^(- upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))} $
このとき $bold(nabla) dot.op bold(A)$ について基底ベクトルの直交性より
$ bold(nabla) dot.op bold(A) & = sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) {upright(i) bold(k) dot.op upright(e)_j \( bold(k) \) a_j \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) - upright(i) bold(k) dot.op upright(e)_j^(\*) \( bold(k) \) a_j^(\*) \( bold(k) \) e^(- upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))}\
 & = 0 $ また電場 $bold(E)$ と磁場 $bold(B)$ について
$ bold(E) \( bold(r) \, t \) = - 1 / c frac(partial bold(A), partial t) & = 1 / c sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) upright(i) omega \( bold(k) \) {upright(e)_j \( bold(k) \) a_j \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) - upright(e)_j^(\*) \( bold(k) \) a_j^(\*) \( bold(k) \) e^(- upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))}\
 & = sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) upright(i) \| bold(k) \| {upright(e)_j \( bold(k) \) a_j \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) - upright(e)_j^(\*) \( bold(k) \) a_j^(\*) \( bold(k) \) e^(- upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))}\
bold(B) \( bold(r) \, t \) = bold(nabla) times bold(A) & = sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) \| bold(k) \| {j upright(e)_j \( bold(k) \) a_j \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) + j upright(e)_j^(\*) \( bold(k) \) a_j^(\*) \( bold(k) \) e^(- upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))} $
となる. \
#strong[Q 21B-54.] Diracのデルタ関数の公式より
$  & integral.triple_(bb(R)^3) d V \( bold(r) \) bold(E) \( bold(r) \, t \) times bold(A) \( bold(r) \, t \)\
= & integral.triple_(bb(R)^3) d V \( bold(r) \) (sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) {upright(e)_j \( bold(k) \) a_j \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) + upright(e)_j^(\*) \( bold(k) \) a_j^(\*) \( bold(k) \) e^(- upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))})\
times & (sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) upright(i) \| bold(k) \| {upright(e)_j \( bold(k) \) a_j \( bold(k) \) e^(upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \)) - upright(e)_j^(\*) \( bold(k) \) a_j^(\*) \( bold(k) \) e^(- upright(i) \( bold(k) dot.op bold(r) - omega \( bold(k) \) t \))})\
= & integral.triple_(bb(R)^3) d V \( bold(r) \) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) integral.triple_(bb(R)^3) frac(d V \( bold(k)' \), \( 2 pi \)^3) upright(i) \| bold(k) \| frac(bold(k), \| bold(k) \|)\
 & sum_(j = plus.minus) {2 j \( a_j \( bold(k) \) a_j^(\*) \( bold(k)' \) \) e^(j upright(i) \( \( bold(k) - bold(k)' \) dot.op bold(r) \)) + j a_j \( bold(k) \) a_j \( - bold(k)' \) e^(upright(i) \( j \( bold(k) + bold(k)' \) dot.op bold(r) - 2 omega \( bold(k) \) t \)) - j a_j^(\*) \( bold(k) \) a_j^(\*) \( - bold(k)' \) e^(- upright(i) \( j \( bold(k) + bold(k)' \) dot.op bold(r) - 2 omega \( bold(k) \) t \))}\
= & sum_(j = plus.minus) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) bold(k) {2 j \| a_j \( bold(k) \) \|^2 + upright(i) a_j \( bold(k) \) a_j \( - bold(k) \) e^(- 2 upright(i) omega \( bold(k) \) t) - upright(i) a_j^(\*) \( bold(k) \) a_j^(\*) \( - bold(k) \) e^(2 upright(i) omega \( bold(k) \) t)} $
これより, この時間平均は次のようになる.
$ ⟨integral.triple_(bb(R)^3) d V \( bold(r) \) bold(E) \( bold(r) \, t \) times bold(A) \( bold(r) \, t \)⟩ = 2 integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) bold(k) {\| a_(+) \( bold(k) \) \|^2 - \| a_(-) \( bold(k) \) \|^2} $
したがって角運動量のスピン成分 $bold(L)_(s p i n)$
の時間平均は次のようになる.
$ chevron.l bold(L)_(s p i n) chevron.r & = frac(1, 2 pi c) integral.triple_(bb(R)^3) frac(d V \( bold(k) \), \( 2 pi \)^3) bold(k) {\| a_(+) \( bold(k) \) \|^2 - \| a_(-) \( bold(k) \) \|^2} $

これより次のようなことを教えてくれる.

+ 電磁場の角運動量のスピン部分 $L_(s p i n)$ の時間平均
  $chevron.l bold(L)_(s p i n) chevron.r$ に対して、各 Fourier モード
  $\( k \, plus.minus \)$ は波数ベクトル $bold(k)$
  に重みづけをした形で寄与する。つまり、各 Fourier モードは縦波として
  $chevron.l bold(L)_(s p i n) chevron.r$ へ寄与する。

+ 波数 $bold(k)$ のモードの寄与する重みは、左円偏光の強度
  $\| a_(+) \( bold(k) \) \|^2$ から右円偏光の強度
  $\| a_(-) \( bold(k) \) \|^2$ を引いた差
  $\| a_(+) \( bold(k) \) \|^2 - \| a_(-) \( bold(k) \) \|^2$
  に比例する。

+ つまり、波数 $bold(k)$ の左円偏光のモードは方向
  $bold(k) \/ \| bold(k) \|$
  のスピン角運動量にプラスの寄与をする。一方、波数 $bold(k)$
  の右円偏光のモードは方向 $bold(k) \/ \| bold(k) \|$
  のスピン角運動量にマイナスの寄与をする。

+ (直線偏光ではなく)円偏光による分解が、電磁波の角運動量に直結している。

== 有限の広がりを持つ円偏光の近似的平面波の角運動量
<有限の広がりを持つ円偏光の近似的平面波の角運動量>
積分値が発散しないように波長 $lambda = 2 pi \/ k$ よりずっと大きな $L$
程度の有限の領域 $D subset.eq bb(R)^2$ だけで振幅がゼロでなく,
ほぼ一定であるような近似的平面波を考える. \
#strong[Q21B-55.] このとき円偏光の近似的平面波の電場の複素表示
$tilde(bold(E)) \( x \, y \, z \, t \)$ を次のように与える.
$ tilde(bold(E)) \( x \, y \, z \, t \) & = {f \( x \, y \) \( bold(e)_x plus.minus upright(i) bold(e)_y \) + g \( x \, y \) bold(e)_z} e^(upright(i) \( bold(k) z - omega t \)) $<def-ET-D>
また, 復号 $plus.minus$ により, 2つの円偏光を同時に考察する.
$ plus.minus arrow.l.r.double upright(h e l i c i t y) = plus.minus 1 arrow.l.r.double {"左円偏光"\
"右円偏光" $ このとき $f \( x \, y \) \, g \( x \, y \)$
にはMaxwellの方程式より次のような関係がある.
$ nabla dot.op tilde(bold(E)) \( x \, y \, z \, t \) & = frac(partial f \( x \, y \), partial x) plus.minus upright(i) frac(partial f \( x \, y \), partial y) - upright(i) k g \( x \, y \) = 0\
g \( x \, y \) & = upright(i) / k {frac(partial f \( x \, y \), partial x) plus.minus upright(i) frac(partial f \( x \, y \), partial y)} $
これより両辺を領域 D で積分すると近似によって
$ g tilde.op frac(1, k L) f $ となることがわかり, $L arrow.r oo$
で縦成分 $g$ は消える. \
#strong[Q 21B-56.] Coulomb ゲージよりベクトルポテンシャル
$tilde(bold(A))$ について次の式が成り立つ.
$ tilde(bold(E)) & = - 1 / c frac(partial tilde(bold(A)), partial t)\
tilde(bold(A)) & = - c integral tilde(bold(E)) d t = frac(c, upright(i) omega) tilde(bold(E)) $

#strong[Q 21B-57.] 同様に Coulomb ゲージより磁場 $tilde(bold(B))$
について次の式が成り立つ.
$ tilde(bold(B)) & = bold(nabla) times tilde(bold(A)) = frac(c, upright(i) omega) bold(nabla) times tilde(bold(E))\
 & = (plus.minus k f + frac(partial g, partial y) \, i k f - frac(partial g, partial x) \, plus.minus upright(i) frac(partial f, partial x) - frac(partial f, partial y)) e^(upright(i) \( k z - omega t \))\
 & tilde.op plus.minus k tilde(bold(E)) $ ただしオーダー
$O \( \( frac(1, k L) \)^2 \)$ の項は無視する近似を用いた. \
プリント間違っていそう. \
#strong[Q 21B-58.] 物理的な電場を $bold(E) = Re tilde(bold(E))$
とおくと上で議論したことから
$ bold(B) & = plus.minus k Im tilde(bold(E))\
bold(A) & = c / omega Im tilde(bold(E)) $<B-tilde-E> となる. \
#strong[Q 21B-59.] 関数 $f \( x \, y \)$ が円筒対称性を持つときを考える.
つまり $f \( x \, y \)$ は xy 平面の極座標 $\( rho \, phi \)$ として
$rho = sqrt(x^2 + y^2)$ のみの関数となる. このとき関数 $g \( x \, y \)$
は次のように表される.
$ g & = upright(i) / k (frac(partial f, partial rho) frac(partial rho, partial x) plus.minus upright(i) frac(partial f, partial rho) frac(partial rho, partial y))\
 & = upright(i) / k e^(plus.minus upright(i) phi) frac(upright(d) f, upright(d) rho) $<def-g>

#strong[Q 21B-60.] 角運動量のスピン部分 $bold(L)_(s p i n)$ を求める.
$ bold(E) times bold(A) & = c / omega Re tilde(bold(E)) times Im tilde(bold(E))\
 & = frac(c, 2 omega) Im (tilde(bold(E))^(\*) times tilde(bold(E)))\
 & = frac(c, 2 omega) Im ((minus.plus 2 upright(i) Re \( f^(\*) g \) \, - 2 upright(i) Im \( f^(\*) g \) \, plus.minus 2 upright(i) \| f \|^2))\
 & = frac(c, 2 omega) (minus.plus 2 Re \( f^(\*) g \) \, - 2 Im \( f^(\*) g \) \, plus.minus 2 \| f \|^2)\
Re \( f^(\*) g \) & = Re (f^(\*) (upright(i) / k e^(plus.minus upright(i) phi) frac(upright(d) f, upright(d) rho))) = 1 / k {minus.plus sin phi Re (f^(\*) frac(upright(d) f, upright(d) rho)) - cos phi Im (f^(\*) frac(upright(d) f, upright(d) rho))}\
Im \( f^(\*) g \) & = Im (f^(\*) (upright(i) / k e^(plus.minus upright(i) phi) frac(upright(d) f, upright(d) rho))) = 1 / k {cos phi Re (f^(\*) frac(upright(d) f, upright(d) rho)) minus.plus sin phi Im (f^(\*) frac(upright(d) f, upright(d) rho))} $
ここで $x y$ 面内では電磁波が実質的にゼロでない領域を内部に含み, $z$
方向には十分に長い体積 $V$ を取る. このとき $x y$
面内では円筒対称に近似的平面波となっているので相殺して十分小さくなる,
よって次のようになる.
$ bold(L)_(s p i n) & = frac(1, 4 pi c) integral.triple_V d V \( bold(r) \) bold(E) times bold(A)\
 & = plus.minus frac(1, 4 pi omega) (integral.triple_V d V \( bold(r) \) \| f \|^2) bold(e)_z $

#strong[Q 21B-61.] 角運動量の軌道部分 $bold(L)_(o r b i t)$ を求める.
Einsteinの縮約を用いて
$ E_j \( bold(r) times bold(nabla) \) A_j & = c / omega {Re \( tilde(E)_j \) \( bold(r) times bold(nabla) \) Im \( tilde(E)_j \)}\
 & = frac(c, 2 omega) {Im (tilde(E)_j \( bold(r) times bold(nabla) \) tilde(E)_j) + Im (tilde(E)_j^(\*) \( bold(r) times bold(nabla) \) tilde(E)_j)}\
tilde(E)_j \( bold(r) times bold(nabla) \) tilde(E)_j & = f mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), upright(i) k f) e^(2 upright(i) \( bold(k) z - omega t \)) + upright(i) f mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; upright(i) frac(partial f, partial y), upright(i) frac(partial f, partial y), - k f) e^(2 upright(i) \( bold(k) z - omega t \)) + g mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), upright(i) k g) e^(2 upright(i) \( bold(k) z - omega t \))\
 & = g mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), upright(i) k g) e^(2 upright(i) \( bold(k) z - omega t \))\
tilde(E)_j^(\*) \( bold(r) times bold(nabla) \) tilde(E)_j & = f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), upright(i) k f) - upright(i) f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; upright(i) frac(partial f, partial y), upright(i) frac(partial f, partial y), - k f) + g^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), upright(i) k g)\
 & = 2 f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), upright(i) k f) + g^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), upright(i) k g)\
g mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), upright(i) k g) & = upright(i) / k frac(upright(d) f, upright(d) rho) e^(plus.minus upright(i) phi) upright(i) / k [upright(i) k y frac(upright(d) f, upright(d) rho) e^(plus.minus upright(i) phi) - z {frac(partial, partial y) frac(upright(d) f, upright(d) rho) e^(plus.minus upright(i) phi)} \, z {frac(partial, partial x) frac(upright(d) f, upright(d) rho) e^(plus.minus upright(i) phi)} - upright(i) k x frac(upright(d) f, upright(d) rho) e^(plus.minus upright(i) phi) \, plus.minus upright(i) frac(upright(d) f, upright(d) rho) e^(plus.minus upright(i) phi)]^t\
 & = - 1 / k^2 frac(upright(d) f, upright(d) rho) e^(plus.minus 2 upright(i) phi) \[upright(i) k rho sin phi frac(upright(d) f, upright(d) rho) - z {sin phi frac(upright(d)^2 f, upright(d) rho^2) plus.minus frac(upright(i) cos phi, rho) frac(upright(d) f, upright(d) rho)} \,\
 & quad z {cos phi frac(upright(d)^2 f, upright(d) rho^2) minus.plus frac(upright(i) sin phi, rho) frac(upright(d) f, upright(d) rho)} - upright(i) k rho cos phi frac(upright(d) f, upright(d) rho) \, plus.minus upright(i) frac(upright(d) f, upright(d) rho)\]^t\
g^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial g, partial x), frac(partial g, partial y), upright(i) k g) & = 1 / k^2 (frac(upright(d) f, upright(d) rho))^(\*) \[upright(i) k rho sin phi frac(upright(d) f, upright(d) rho) - z {sin phi frac(upright(d)^2 f, upright(d) rho^2) plus.minus frac(upright(i) cos phi, rho) frac(upright(d) f, upright(d) rho)} \,\
 & quad z {cos phi frac(upright(d)^2 f, upright(d) rho^2) minus.plus frac(upright(i) sin phi, rho) frac(upright(d) f, upright(d) rho)} - upright(i) k rho cos phi frac(upright(d) f, upright(d) rho) \, plus.minus upright(i) frac(upright(d) f, upright(d) rho)\]^t\
f^(\*) mat(delim: bar.double, bold(e)_x, bold(e)_y, bold(e)_z; x, y, z; frac(partial f, partial x), frac(partial f, partial y), upright(i) k f) & = f^(\*) [upright(i) k y f - z frac(partial f, partial y) \, z frac(partial f, partial x) - upright(i) k x f \, x frac(partial f, partial y) - y frac(partial f, partial x)]^t\
 & = f^(\*) (upright(i) k rho f - z frac(upright(d) f, upright(d) rho)) [sin phi \, - cos phi \, 0]^t $
となる. これらを角運動量の軌道部分の定義式に代入して
$sin psi \, cos psi \, e^(upright(i) z)$
の依存性があるとき積分すると相殺されることから
$ bold(L)_(o r b i t) & = frac(1, 4 pi c) integral.triple_V d V \( bold(r) \) E_j \( bold(r) times nabla \) A_j\
 & = frac(1, 8 pi omega) integral.triple_V d V \( bold(r) \) {Im (tilde(E)_j \( bold(r) times bold(nabla) \) tilde(E)_j) + Im (tilde(E)_j^(\*) \( bold(r) times bold(nabla) \) tilde(E)_j)}\
 & = frac(1, 8 pi omega) integral.triple_V d V \( bold(r) \) {Im (plus.minus 1 / k^2 (frac(upright(d) f, upright(d) rho))^(\*) upright(i) frac(upright(d) f, upright(d) rho))}\
 & = plus.minus frac(1, 8 pi omega) 1 / k^2 (integral.triple_V d V \( bold(r) \) lr(|frac(upright(d) f, upright(d) rho)|)^2) bold(e)_z $
となる. \
#strong[Q 21B-62.] 以下は式を見る事で分かる.

+ 角運動量のスピン部分 $bold(L)_(s p i n)$ と軌道部分
  $bold(L)_(o r b i t)$ の両者ともに、電磁波の伝播方向 $+ z$
  に平行な成分しか持たない。

+ 軌道部分 $bold(L)_(o r b i t)$ はスピン部分 $bold(L)_(s p i n)$
  に比較して大きさが小さい。両者の大きさの比は小さいパラメータ
  $1 \/ \( k L \)$の 2 乗のスケールである:
  $ frac(\| bold(L)_(o r b i t) \|, \| bold(L)_(s p i n) \|) tilde.op (frac(1, k L))^2 $

+ よって、xy 平面内での電磁波の広がりを大きくする極限
  $1 \/ \( k L \) arrow.r 0$ において、角運動量の軌道部分
  $bold(L)_(o r b i t)$ はスピン部分 $bold(L)_(s p i n)$
  に比べて無視できるようになって、電磁波の全角運動量
  $bold(L) = bold(L)_(s p i n) + bold(L)_(o r b i t)$ はスピン部分
  $bold(L)_(s p i n)$ だけからなるようになる:
  $ bold(L) arrow.r bold(L)_(s p i n) = plus.minus frac(1, 4 pi omega) (integral.triple_V d V \( bold(r) \) \| f \|^2) bold(e)_z $<L-limit>

+ この結果を見る限り、「平面波の角運動量ベクトルの方向は、偏光状態が左円偏光ならば進行方向に平行であり、偏光状態が右円偏光ならば進行方向に反平行である。」と言える。

#strong[Q 21B-63.] CGSガウス単位系でのエネルギー密度の総和を考えると
$ U = frac(1, 8 pi) integral.triple_V d V \( bold(r) \) (lr(|bold(E)|)^2 + lr(|bold(B)|)^2) $
式 #link(<def-ET-D>)[def-ET-D], #link(<B-tilde-E>)[B-tilde-E], #link(<def-g>)[def-g] より
$ lr(|tilde(bold(E))|)^2 & = \| bold(E) \|^2 + \| bold(B) \|^2\
 & = 2 \| f \|^2 + \| g \|^2\
 & = 2 \| f \|^2 + 1 / k^2 lr(|frac(upright(d) f, upright(d) rho)|)^2 $
となるので $ U & = U_(s p i n) + U_(o r b i t)\
U_(s p i n) & = frac(1, 4 pi) integral.triple_V d V \( bold(r) \) \| f \|^2\
U_(o r b i t) & = frac(1, 8 k^2 pi) integral.triple_V d V \( bold(r) \) lr(|frac(upright(d) f, upright(d) rho)|)^2\
 $ 次の式より電磁場の広がりを十分大きくすると $U_(s p i n)$
が主要項となる.
$ U_(o r b i t) / U_(s p i n) & tilde.op (frac(1, k L))^2\
U & = U_(s p i n) #h(2em) (frac(1, k L) arrow.r 0) $<U-limit>

#strong[Q 21B-64.] 式 #link(<L-limit>)[L-limit], #link(<U-limit>)[U-limit] より次の式が導かれる.
$ L_z = plus.minus 1 / omega U $

#strong[Q 21B-65.] 電磁波を担う実体が光子 (photon) であることを認めると,
1個の光子のエネルギーは
$planck omega med \( omega = c \| bold(k) \| \)$, 運動量は
$planck bold(k)$ である事実が知られている. Q21B-64
の結果と対応原理を組み合わせて光子の角運動量の進行方向の成分が次のようにわかる.
$ upright("1個の光子の角運動量 ") bold(L) upright(" の ") bold(k) \/ \| bold(k) \| upright(" 方向の成分") = cases(delim: "{", + planck & "左円偏光状態", - planck & "右円偏光状態") $
このように helicity とは光子の角運動量の進行方向の成分を $planck$
単位で測った量である.


// 変換時に定義が失われた参照先。リンクを生かすための錨。
#metadata(none)#label("a^2")
#metadata(none)#label("EC-ET-converter-+-")
#metadata(none)<tilde-B>
#metadata(none)<B>
#metadata(none)<E2-p>
#metadata(none)<eta>
#metadata(none)<axi---aeta>
#metadata(none)<ET-circle-def>
#metadata(none)<s2-def>
#metadata(none)<s3-def>
