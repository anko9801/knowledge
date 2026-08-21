#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/diagram.typ": diagram, ink, ink-thin, ink-wash

#show: post.with(
  title: "dx は微小量ではない",
  date: "2026-08-20",
  field: "math",
  series: "vector-analysis",
  order: 2,
  tags: ("ベクトル解析",),
  summary: "dx は無限に小さい数ではなく、ベクトルを入れると数を返す機械である。そう決めた瞬間に、線積分がパラメータに依らない理由も、重積分のヤコビアンも、勾配がベクトルでない理由も、まとめて出てくる。",
  provides: (
    "tangent-space",
    "cotangent-space",
    "one-form",
    "line-integral",
    "wedge-product",
    "k-form",
    "jacobian-from-wedge",
  ),
  requires: ("grad-div-curl",),
)

= 説明されない記号

微積分を習うと、最初のほうでこう書かされる。

$ dif f = frac(partial f, partial x) dif x + frac(partial f, partial y) dif y $

そして $dif x$ が何なのかは、たいてい説明されない。
「微小量」「無限小の変化」と呼ばれるが、それで済ませると困ることがある。

微小なら、いくら小さいのか。$0$ ではないのか。
$0$ でないなら実数のどれかのはずだが、どんな正の実数よりも小さい実数は存在しない。
$0$ だとすると、$dif x \/ dif x = 1$ が書けなくなる。

無限小の数を本当に導入する道はある（超準解析）。だが普通の微積分はそれをしない。
にもかかわらず $dif x$ は積分記号の中にも現れ、変数変換ではヤコビアンを連れてきて、
線積分では向きを持つ。ずいぶん働く「量」である。

正体はこうである。

#strong[$dif x$ は数ではない。ベクトルを入れると数を返す機械である。]

小さくもないし、大きくもない。そもそも大きさを持つ種類のものではなかった。
この記事は、そう決めると何が起きるかを見る。得られるのは三つある。

#table(
  columns: (auto, 1fr),
  [線積分], [なぜパラメータの取り方に依らないのか。なぜ弧長の線積分とは別物なのか],
  [勾配], [なぜ「ベクトル」と呼ぶと不正確なのか。単位を変えるだけで見える],
  [ヤコビアン], [重積分の変数変換で出てくる行列式が、後付けの補正ではないこと],
)

= 数ではなく機械である

まず、機械が食べるものを決める。

#definition[
  点 $p$ における#strong[接ベクトル]とは、$p$ を通る曲線の速度ベクトルのことである。
  座標 $x^1, dots, x^n$ を取れば $bold(v) = (v^1, dots, v^n)$ と成分で書ける。
  $p$ における接ベクトル全体を#strong[接空間]と呼び、$T_p$ と書く。
]<def:tangent>

速度ベクトル、つまり「その点でどちらへどれだけ動くか」である。位置ではない。

#definition[
  点 $p$ における#strong[$1$ 形式]とは、接空間上の線形写像
  $ omega : T_p arrow.long RR $
  のことである。各点に $1$ 形式を一つずつ滑らかに置いたものも、まとめて $1$ 形式と呼ぶ。
]<def:one-form>

そのうえで $dif x$ を定義する。

#definition[
  座標関数 $x^i$ に対し、$1$ 形式 $dif x^i$ を
  $ dif x^i (bold(v)) := v^i $
  で定める。すなわち $dif x^i$ は、ベクトルの第 $i$ 成分を読み取る機械である。
]<def:dx>

$dif x$ とは「$x$ 方向にどれだけ進んだかを教えろ」という命令だった、ということになる。
無限に小さいものではなく、質問である。

#remark[
  記号が $dif x$ である理由も、これで説明が付く。関数 $f$ に対して
  $ dif f (bold(v)) := bold(v) upright(" 方向への ") f upright(" の変化率") $
  と定めると、これは $bold(v)$ について線形なので $1$ 形式になる。
  この定義を、たまたま $f$ が座標関数 $x^i$ そのものである場合に当てはめると、
  返る値は $v^i$ である。@def:dx と一致する。
  $dif x$ は「$dif$ を $x$ に当てたもの」であって、記号の使い回しではない。
]

あとは連鎖律を書き下すだけで、冒頭の式が定理になる。

#proposition[
  $ dif f = sum_i frac(partial f, partial x^i) dif x^i $
]<prop:df>

#proof[
  両辺に任意の $bold(v)$ を入れる。左辺は $bold(v)$ 方向の変化率、すなわち
  $sum_i (partial f \/ partial x^i) v^i$ である。
  右辺に入れると @def:dx より $sum_i (partial f \/ partial x^i) v^i$ になる。一致する。
]

高校で「$dif f$ を $dif x$ で割る」と説明されたものは、割り算ではなかった。
$dif f$ という機械と $dif x$ という機械が、$1$ 次元では比例していて、その比が $f'$ である。

== 図に描くと矢印ではない

ベクトルは矢印で描く。では $1$ 形式はどう描くか。

$1$ 形式が返すのは数なので、値が等しい方向を集めると、平行な線（$3$ 次元なら平面）の族になる。
$omega = 3 dif x$ なら、線は $x$ 方向に密に並ぶ。$omega = dif x$ なら疎になる。
そして $omega(bold(v))$ は、#strong[矢印 $bold(v)$ が何本の線を横切ったか]である。

#table(
  columns: (auto, 1fr),
  [ベクトル], [矢印。長さと向きを持つ],
  [$1$ 形式], [等高線の束。#strong[混み具合]と向きを持つ],
)

$dif f$ の絵は、そのまま $f$ の等高線である。
勾配が大きい場所では線が混み、平らな場所では線が疎になる。
「勾配が急」とは、線が混んでいることだった。

#let W = 96pt
#let H = 66pt

// 同じ矢印。始点と終点を揃えておく。
#let arrow = {
  place(line(start: (8pt, H - 10pt), end: (W - 10pt, 12pt), stroke: 0.9pt + ink))
  place(line(start: (W - 10pt, 12pt), end: (W - 21pt, 15pt), stroke: 0.9pt + ink))
  place(line(start: (W - 10pt, 12pt), end: (W - 15pt, 24pt), stroke: 0.9pt + ink))
}

// 等高線の束。gap を変えると混み具合が変わる。
#let sheets(gap) = {
  let x = gap
  while x < W {
    place(dx: x, line(angle: 74deg, length: H, stroke: 0.5pt + ink-thin))
    x += gap
  }
}

#let sparse = box(width: W, height: H, { sheets(30pt); arrow })
#let dense = box(width: W, height: H, { sheets(10pt); arrow })

#diagram(
  caption: [
    左が $dif x$、右が $3 dif x$。#strong[矢印は同じ]で、変わったのは線の混み具合だけである。
    横切る本数——つまり $omega(bold(v))$ の値——は右が左の $3$ 倍になる。
    $1$ 形式の「大きさ」は矢印の長さではなく、この混み具合のほうである。
  ],
  grid(columns: (auto, 22pt, auto), sparse, [], dense),
)

この絵は後で効いてくるので、覚えておいてほしい。

= 勾配はベクトルではない

$nabla f$ を「ベクトル」と呼ぶのは、正確には誤りである。
理由は @prop:df に出ている。$dif f$ の成分は $partial f \/ partial x^i$ で、
これは座標を変えたときにベクトルと#strong[逆向きに]変換する。

抽象論に聞こえるので、単位を変えるだけの例で見る。

#example[温度計と物差し][
  まっすぐな棒の上で温度が変わっているとする。棒に沿って $1 upright("m")$ 進むと
  $5 upright("℃")$ 上がる。つまり
  $ frac(dif T, dif x) = 5 quad [upright("℃/m")] $
  ここで長さの単位をキロメートルに変える。$x' = x \/ 1000$ である。

  勾配の成分は
  $ frac(dif T, dif x') = 5000 quad [upright("℃/km")] $
  になり、$1000$ #strong[倍]になる。

  いっぽう「$1 upright("m")$ 進む」という変位ベクトルの成分は、
  $1$ から $0.001$ へ、$1000$ #strong[分の 1] になる。

  同じ単位変更で、片方は増え、片方は減った。
  この二つを同じ「ベクトル」という箱に入れてよいはずがない。
]

不変なのは、どちらの成分でもなく、組にして掛けたものである。

$ dif T (bold(v)) = 5 times 1 = 5000 times 0.001 = 5 quad [upright("℃")] $

$1$ 形式とベクトルを組ませて数にした瞬間に、単位の取り方が消える。
これが「機械とその入力」という見方の意味である。
自然に決まっているのは#strong[組にする操作]であって、それぞれの成分ではない。

== では $nabla f$ は何なのか

それでも $nabla f$ をベクトルとして扱えるのは、内積があるからである。
$1$ 形式 $dif f$ に対し、
$ chevron.l nabla f, bold(v) chevron.r = dif f (bold(v)) $
をすべての $bold(v)$ について満たすベクトル $nabla f$ を取る、という手続きを踏んでいる。
この手続きには内積、すなわち#strong[計量]が要る。

直交直線座標だけを使い、単位も変えない限り、この変換は成分を何も動かさない。
だから学部の計算では区別が見えない。見えないだけで、無いわけではなかった。

#check[
  $nabla f$ をベクトルとして扱う計算は、実際に正しい答えを出す。
  内積を取り、大きさを測り、他のベクトルと足す。どれも困らない。
  #strong[それでも「ベクトルではない」と言うのはなぜか。]
][
  #strong[ベクトルなのではなく、毎回ベクトルに直してから使っているからである。]

  $dif f$ は @prop:df の成分を持つ $1$ 形式で、座標を変えると
  変位ベクトルと#strong[逆向き]に変わる。上の例では片方が $1000$ 倍、
  もう片方が $1000$ 分の $1$ になった。

  それを $chevron.l nabla f, bold(v) chevron.r = dif f (bold(v))$ でベクトルへ移している。
  この一手には内積が要る。#strong[計量を使ったことが、書かれていないだけ]である。

  直交直線座標で単位を固定している限り、この一手は成分を何も動かさない。
  だから見えない。曲線座標では動くし、計量の無い空間では
  そもそもこの手が使えない——$dif f$ は定義できるのに $nabla f$ が作れない。
]

#remark[
  区別が実際に牙を剥くのは、直交でない座標を使うときである。
  結晶学では、実格子のベクトルと逆格子のベクトルという二種類が出てくる。
  あれは $1$ 形式とベクトルの区別そのもので、逆格子の基底が実格子の基底と
  「組ませると $delta_i^j$ になる」ように定められているのは、
  @def:dx の $dif x^i (bold(e)_j) = delta_j^i$ と同じ関係である。
  相対論で上付き添字と下付き添字を区別するのも、同じ理由による。
]

= 曲線に沿って積む

$1$ 形式を導入した見返りを受け取る。線積分がきれいに定義できる。

#definition[
  曲線 $C$ を $bold(gamma)(t)$、$t in [a, b]$ と表す。$1$ 形式 $omega$ の $C$ 上の積分を
  $ integral_C omega := integral_a^b omega_(bold(gamma)(t)) (dot(bold(gamma))(t)) thin dif t $
  で定める。
]<def:line-integral>

各時刻で、その点に置かれた機械に、その時刻の速度ベクトルを食わせて、出てきた数を積む。
それだけである。

#proposition[
  @def:line-integral の値は、曲線のパラメータの取り方に依らない
  （向きを保つ取り替えに限る）。
]<prop:reparam>

#proof[
  $t = t(s)$ と取り替える。速度は連鎖律で
  $dif bold(gamma) \/ dif s = dot(bold(gamma)) thin (dif t \/ dif s)$ になり、
  $omega$ は線形なので、出てくる数も $dif t \/ dif s$ 倍になる。
  いっぽう積分変数の取り替えで $dif s = (dif s \/ dif t) dif t$ が入る。
  両者が打ち消して、もとの積分に戻る。
]

線形性がそのまま効いている。$1$ 形式が「ベクトルに比例して答えを返す」ものだからこそ、
パラメータを速く走らせたぶんが積分側で相殺される。
#strong[曲線の上で自然に積分できるのは、ちょうど $1$ 形式である。]

== 弧長の線積分は別物である

教科書は二種類の積分を、どちらも「線積分」と呼ぶ。

#table(
  columns: (auto, 1fr),
  [$display(integral_C bold(A) dot dif bold(r))$], [$1$ 形式の積分。計量は要らない。向きを変えると符号が変わる],
  [$display(integral_C f thin dif s)$], [弧長による積分。#strong[長さを測る道具が要る]。向きを変えても値は変わらない],
)

$dif s$ を書くには、曲線の長さが決まっていなければならない。
長さは計量から来るので、後者は計量なしには定義できない。
針金の質量を求める積分がこちらである。

いっぽう $bold(A) dot dif bold(r)$ は、長さの概念がまったく無い空間でも書ける。
仕事も起電力も循環も、みなこちら側にある。
#link("/math/vector-analysis/1")[第 1 回]で「$dif$ には計量が入っていない」と書いたのは、
この違いのことである。

== 微積分学の基本定理が絵で見える

$1$ 形式を等高線の束として描く絵に戻る。

$dif f$ の絵は $f$ の等高線だった。そして $integral_C dif f$ は、
曲線 $C$ が横切った等高線の本数（向きを込めた符号付きの本数）である。

すると、$A$ から $B$ へどんな道を通ろうと、横切る本数は $f(B) - f(A)$ で決まる。
途中で戻れば、その分は逆向きに横切るので相殺する。

$ integral_C dif f = f(B) - f(A) $

これが勾配定理であり、$1$ 次元に落とせば微積分学の基本定理である。
証明ではないが、なぜ成り立つかはこの絵で尽きている。

= 向きを持たせる

次数を上げる。曲面の上で積分したいので、ベクトル 2 本を食う機械が要る。

面積は向きを持つ。$bold(u)$ と $bold(v)$ をこの順に並べたときと逆に並べたときで、
符号を変えたい。そうしないと、@prop:reparam のような「取り替えに依らない」性質が壊れる。

#definition[
  $2$ 形式とは、接ベクトル 2 個を受け取り、それぞれについて線形で、
  かつ入れ替えると符号が変わる写像である。
  $1$ 形式 $alpha, beta$ から $2$ 形式を作る操作を#strong[楔積]と呼び、
  $ (alpha and beta)(bold(u), bold(v)) := alpha(bold(u)) beta(bold(v)) - alpha(bold(v)) beta(bold(u)) $
  で定める。
]<def:wedge>

定義から
$ alpha and beta = - beta and alpha, quad alpha and alpha = 0 $
が出る。$k$ 形式も同様に、$k$ 個のベクトルを食って交代的に振る舞う写像として定める。

中身は見慣れたものである。

#example[$dif x and dif y$ は面積である][
  @def:wedge に @def:dx を入れると
  $ (dif x and dif y)(bold(u), bold(v)) = u^1 v^2 - u^2 v^1 $
  であり、これは $bold(u), bold(v)$ を $x y$ 平面に射影して作った平行四辺形の
  #strong[符号付き面積]、すなわち $2 times 2$ の行列式である。
]

反対称性は技巧ではない。#strong[面積が向きを持つという事実]がそのまま式になっている。
そして $dif x and dif x = 0$ は、同じ方向に潰れた平行四辺形の面積が $0$ だということである。

$3$ 次元では、$dif x and dif y$、$dif y and dif z$、$dif z and dif x$ の 3 つが $2$ 形式の基底になる。
$n$ 次元なら $binom(n, 2)$ 個。第 1 回で数えた $1, 3, 3, 1$ は、この数え上げだった。

= ヤコビアンは後付けではない

重積分の変数変換では、行列式が湧いて出る。

$ integral.double f thin dif x thin dif y = integral.double f thin abs(det J) thin dif u thin dif v $

初めて習ったとき、私はこれを面積要素の伸び縮みを補正する規則として暗記した。
楔積を入れると、暗記するものではなくなる。

#proposition[
  $x = x(u, v)$、$y = y(u, v)$ のとき
  $ dif x and dif y = det mat(
      partial x \/ partial u, partial x \/ partial v;
      partial y \/ partial u, partial y \/ partial v
    ) thin dif u and dif v $
]<prop:jacobian>

#proof[
  @prop:df より
  $ dif x = frac(partial x, partial u) dif u + frac(partial x, partial v) dif v, quad
    dif y = frac(partial y, partial u) dif u + frac(partial y, partial v) dif v $
  である。楔で掛けて展開すると、$dif u and dif u$ と $dif v and dif v$ の項は $0$ になり、
  $dif v and dif u = - dif u and dif v$ を使ってまとめれば
  $ (frac(partial x, partial u) frac(partial y, partial v)
     - frac(partial x, partial v) frac(partial y, partial u)) dif u and dif v $
  が残る。括弧の中はまさに行列式である。
]

ヤコビアンは、補正として外から持ち込んだものではなかった。
$and$ が反対称だという一行から、展開すれば自動的に落ちてくる。
行列式が「面積の拡大率」であることの証明にもなっている。

そして絶対値が付いていないことに注意してほしい。
向きまで込めれば、正しい変換則は符号付きである。
$abs(det J)$ と書くのは、向きを忘れて「面積は正」と決めたときの帳尻合わせにすぎない。

#remark[
  同じことが $3$ 次元の面積要素 $dif bold(S)$ にも起きている。
  あれはベクトルの顔をしているが、正体は $2$ 形式である。
  法線ベクトルの向きを右手系で決める、という規約が要るのは、そのためである。
  #link("/math/vector-analysis/1")[第 1 回]で磁場を擬ベクトルと呼んだ理由も同じで、
  $bold(B) dot dif bold(S)$ が最初から $2$ 形式だった。
]

= ここまでで得たもの

道具はそろった。

#table(
  columns: (auto, 1fr),
  [$dif x$], [微小量ではなく、成分を読む機械。$1$ 形式の基底],
  [$1$ 形式], [曲線の上で、計量なしに積分できるもの],
  [勾配], [本当は $1$ 形式。ベクトルに直すには計量が要る],
  [楔積 $and$], [向き付けられた面積・体積を作る。ヤコビアンはその帰結],
)

まだ足りないものが一つある。$dif$ である。
@prop:df で関数から $1$ 形式を作ったが、$1$ 形式から $2$ 形式を作る操作は定義していない。
それを定めれば rot と div が出てきて、第 1 回で予告した梯子

$ Lambda^0 attach(-->, t: dif) Lambda^1 attach(-->, t: dif) Lambda^2 attach(-->, t: dif) Lambda^3 $

が完成する。#link("/math/vector-analysis/3")[次回]はそこから始めて、
一般化された Stokes の定理を証明する。
