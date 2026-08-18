#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "力では書けない理論がある",
  date: "2026-08-17",
  field: "physics",
  series: "mechanics",
  order: 1,
  tags: ("解析力学",),
  summary: "解析力学は Newton 力学を解くための近道ではない。理論そのものを書き下すための言語である。",
)

= 正直なところ、要らない

解析力学の教科書はたいてい、こう始まる。座標変換が楽になる、拘束力を消せる、と。

だが、これで納得できるだろうか。私は学生のとき納得できなかった。
極座標の運動方程式は一度導いて覚えればいいし、振り子の張力は後から計算すればいい。
その程度の便利さのために、新しい形式を丸ごと覚える気にはならない。

先に結論を書いてしまう。#strong[質点や剛体を解くだけなら、解析力学はほぼ要らない。]
工学の現場で Newton--Euler 法が現役なのも、そのためである。
便利さを売りにする限り、この形式は「不要では」と言われて仕方がない。

では、なぜ物理を続けると必ずこれをやらされるのか。
理由は、解く道具としてではなく、#strong[理論を書く言語]として必要になるからである。
先にその話をする。

= 力が存在しない理論がある

一般相対論では、重力は力ではない。

自由落下する物体には、何の力もかかっていない。加速度計を積んで落としても、
針はゼロを指したままである。曲がった時空の中を、まっすぐ進んでいるだけだからだ。
そのまっすぐさを表すのが測地線で、これは
$ delta integral dif s = 0 $
という停留条件で決まる。$bold(F) = m bold(a)$ の $bold(F)$ に何を入れるか、という問いは
そもそも意味を持たない。

理論の側もそうである。Einstein 方程式は、力を組み立てて得られたものではなく、
作用
$ S = frac(1, 2 kappa) integral R sqrt(-g) dif^4 x $
を計量について変分して出てくる。$R$ は時空の曲がり具合を測る量で、
「これ以外に書きようがない」という理由で選ばれている。

つまり、力を出発点に置くと入口すら見つからない理論が実在する。
そして入口になっているのは、いつも作用である。

= 力では足りない現象がある

電磁気なら力が書けるではないか、と思うかも知れない。確かに
$ bold(F) = q (bold(E) + bold(v) times bold(B)) $
がある。ところが、これでは説明できない実験がある。

細長いソレノイドに電流を流すと、磁場はコイルの内側だけに閉じ込められ、外側では
$bold(B) = bold(0)$ になる。ここで、電子をコイルの左右に分けて通し、後ろで干渉させる。
電子はどちらの経路でも磁場をまったく感じていない。$bold(F) = bold(0)$ である。

それなのに、電流を流すと干渉縞がずれる。Aharonov--Bohm 効果である。

何が効いているのか。ベクトルポテンシャル $bold(A)$ である。
$bold(B) = nabla times bold(A)$ なので、$bold(B) = bold(0)$ の領域でも $bold(A) != bold(0)$ でありうる。
そして電子の位相が
$ frac(q, ℏ) integral.cont bold(A) dot dif bold(l) = frac(q Phi, ℏ) $
だけずれる。$Phi$ はコイルを貫く磁束である。

力の言葉には $bold(A)$ に対応するものが無い。いっぽうラグランジアンには最初から入っている。
$ L = frac(1, 2) m abs(bold(v))^2 - q phi.alt + q bold(v) dot bold(A) $
この $L$ から正準運動量を作ると
$ bold(p) = frac(partial L, partial bold(v)) = m bold(v) + q bold(A) $
となり、量子力学で波動関数の位相を運ぶのはこちらである。

観測できる量が $bold(E)$ と $bold(B)$ だけで書けない、という事実は、
どの量を基本に置くべきかを教えている。力ではない。

= 理論を作る手続きがない

三つ目が、いちばん効く。

新しい理論を書きたいとする。素粒子の新しい相互作用でも、
未知の場でもよい。力を出発点にすると、何を書けばいいのか分からない。
候補を絞る原理が無いからである。

作用を出発点にすると、話が変わる。要請する対称性を並べると、
書ける作用がほとんど決まってしまうのだ。

#example[
  慣性系の自由粒子を考える。要請するのは次の三つだけである。

  + 時間の一様性：$L$ は $t$ を陽に含まない
  + 空間の一様性：$L$ は位置を含まない
  + 空間の等方性：$L$ は速度の向きに依らない

  これだけで $L = L(v^2)$ に絞られ、さらに Galilei 変換で運動方程式が変わらないことを
  要求すると、$L = a v^2$ の形しか残らない。
  定数 $a$ を $m \/ 2$ と書けば、見慣れた $L = frac(1,2) m v^2$ である。
  導出は#link("/physics/mechanics/3")[第 3 回]で行う。
]

対称性を決めれば理論が決まる。この手続きが、現代物理の作法そのものになっている。
標準模型のラグランジアンも、ゲージ対称性と場の内容を決めた時点でほぼ一意に定まる。
質量や結合定数のような「対称性から決まらなかった残り」だけが、実験から入る。

力の言葉には、この手続きが存在しない。

#remark[
  さらに言えば、量子化できるのはラグランジアンかハミルトニアンであって、力ではない。
  経路積分では、あらゆる経路について $e^(i S \/ ℏ)$ を足し上げる。
  正準量子化では、Poisson 括弧を交換子に置き換える。
  どちらの道でも、入口に置かれるのは作用である。

  つまり古典力学を書き換えておくことは、量子力学へ進むための前処理でもある。
  この話は#link("/physics/mechanics/2")[第 2 回]で少し、最終回で正面から扱う。
]

= それでも力学から始める

というわけで、解析力学の目的は「振り子を早く解くこと」ではない。
理論を書くための文法を手に入れることである。

ただし文法は、答えの分かっている場所で確かめておかないと信用できない。
だから最初は、Newton 力学と一致することが分かっている範囲で組み立てる。
以下はその作業になる。

先に断っておくと、この書き換えはただの言い換えではない。
#strong[追加の仮定を一つ置く]。それが何かは、後で正確に述べる。

= 一般化座標

まず、座標の自由を確保する。

#definition[
  系の配置が $n$ 個の変数 $q^1, dots, q^n$ で一意に決まるとき、
  これを#strong[一般化座標]と呼び、$n$ を#strong[自由度]という。
  各質点の位置は
  $ bold(r)_i = bold(r)_i (q^1, dots, q^n, t) $
  という形に書けるものとする。
]<def:generalized-coordinates>

角度でも長さでも、面積でも何でもよい。位置を決められれば座標である。
振り子なら $theta$ 一つで足りるので、自由度は $1$ である。
糸の長さが変わらないという条件を、座標の選び方の中に吸収してしまったことになる。

#definition[
  座標の間の関係が $f(bold(r)_1, dots, bold(r)_N, t) = 0$ の形で書ける拘束を
  #strong[ホロノミック拘束]と呼ぶ。
]<def:holonomic>

ホロノミックなら、拘束の数だけ変数を減らして一般化座標に移れる。
糸の長さが一定（$abs(bold(r)) = ell$）はホロノミックである。
転がる球のように速度に条件が付く場合は非ホロノミックで、こちらは扱いが厄介なので今回は触れない。

= 仮想変位と d'Alembert の原理

#definition[
  時刻を止めたまま、拘束を破らないように系を微小に動かすことを#strong[仮想変位]と呼び、
  $delta bold(r)_i$ と書く。$t$ を固定するので
  $ delta bold(r)_i = sum_(k=1)^n frac(partial bold(r)_i, partial q^k) delta q^k $
  であり、$partial bold(r)_i \/ partial t$ の項は現れない。
]<def:virtual-displacement>

実際の運動 $dif bold(r)_i$ とは違うものである。仮想変位は「もし別の配置にしたら」という仮定の移動で、
時間が経つわけではない。区別のために $delta$ を使う。

そして、ここが先ほど予告した追加の仮定である。

#axiom("d'Alembert の原理")[
  拘束力は仮想変位に対して仕事をしない。すなわち、
  拘束力を除いた力を $bold(F)_i$ とすると
  $ sum_i (bold(F)_i - m_i dot.double(bold(r))_i) dot delta bold(r)_i = 0 $
  が任意の仮想変位について成り立つ。
]<ax:dalembert>

これは Newton の法則から出てくるものではない。
滑らかな面の垂直抗力は面に垂直で変位は面に沿うから仕事をしない、
剛体の内力は対で打ち消す、といった個別の事情を一般化した仮定である。

つまり解析力学は Newton 力学の言い換えではない。
拘束力の性質について一つ約束を置いたぶんだけ、強い前提の上に立っている。
その代わりに、拘束力が方程式から消える。

= Lagrange 方程式

@ax:dalembert から出発する。$delta bold(r)_i$ を一般化座標で書き換えるだけで目的地に着く。

#lemma[
  $bold(v)_i := dot(bold(r))_i$ とすると
  $ frac(partial bold(v)_i, partial dot(q)^k) = frac(partial bold(r)_i, partial q^k),
    quad
    frac(dif, dif t) (frac(partial bold(r)_i, partial q^k)) = frac(partial bold(v)_i, partial q^k) $
]<lem:commute>

#proof[
  $bold(r)_i = bold(r)_i (q, t)$ を時間微分すると
  $ bold(v)_i = sum_k frac(partial bold(r)_i, partial q^k) dot(q)^k + frac(partial bold(r)_i, partial t) $
  である。右辺で $dot(q)^k$ に依存するのは第一項だけで、係数は $dot(q)$ を含まないので、
  $dot(q)^k$ で偏微分すれば第一の等式が出る。

  第二の等式は、両辺がともに
  $ sum_j frac(partial^2 bold(r)_i, partial q^j partial q^k) dot(q)^j
    + frac(partial^2 bold(r)_i, partial t partial q^k) $
  に等しいことから従う。偏微分の順序交換ができる、と言っているだけである。
]

#theorem("Lagrange の運動方程式")[
  運動エネルギーを $T := sum_i frac(1, 2) m_i abs(bold(v)_i)^2$、
  一般化力を $Q_k := sum_i bold(F)_i dot frac(partial bold(r)_i, partial q^k)$ とすると
  $ frac(dif, dif t) (frac(partial T, partial dot(q)^k)) - frac(partial T, partial q^k) = Q_k
    quad (k = 1, dots, n) $
  が成り立つ。さらに $bold(F)_i$ がポテンシャル $U(q, t)$ から導かれるなら、
  $L := T - U$ とおいて
  $ frac(dif, dif t) (frac(partial L, partial dot(q)^k)) - frac(partial L, partial q^k) = 0 $
]<thm:lagrange>

#proof[
  @ax:dalembert に @def:virtual-displacement を代入すると
  $ sum_k (Q_k - sum_i m_i dot.double(bold(r))_i dot frac(partial bold(r)_i, partial q^k)) delta q^k = 0 $
  となる。一般化座標は独立に動かせるので、各 $delta q^k$ の係数が $0$ でなければならない。

  第二項を書き換える。積の微分から
  $ sum_i m_i dot.double(bold(r))_i dot frac(partial bold(r)_i, partial q^k)
    = frac(dif, dif t) (sum_i m_i bold(v)_i dot frac(partial bold(r)_i, partial q^k))
      - sum_i m_i bold(v)_i dot frac(dif, dif t)(frac(partial bold(r)_i, partial q^k)) $
  である。@lem:commute を両方の項に使うと
  $ = frac(dif, dif t) (sum_i m_i bold(v)_i dot frac(partial bold(v)_i, partial dot(q)^k))
      - sum_i m_i bold(v)_i dot frac(partial bold(v)_i, partial q^k)
    = frac(dif, dif t) (frac(partial T, partial dot(q)^k)) - frac(partial T, partial q^k) $
  となる。最後の等号は $T = sum_i frac(1,2) m_i bold(v)_i dot bold(v)_i$ を微分しただけである。
  これで前半が示された。

  後半。$Q_k = - partial U \/ partial q^k$ であり、$U$ は $dot(q)$ を含まないので
  $partial U \/ partial dot(q)^k = 0$ である。よって $T$ を $L = T - U$ に置き換えてよい。
]

#definition[
  $L$ を#strong[ラグランジアン]と呼ぶ。
]<def:lagrangian>

使ったのは @ax:dalembert と、座標変換の微分の順序交換だけである。
それだけで、拘束力は最初の一行で消えた。
仮想変位に対して仕事をしないと仮定したのだから、
仮想変位と内積を取った時点で落ちるのは当然なのだが、うまい仕掛けだと思う。

#example("単振り子")[
  一般化座標を $theta$ 一つに取ると
  $ L = frac(1, 2) m ell^2 dot(theta)^2 + m g ell cos theta $
  であり、@thm:lagrange から $dot.double(theta) = -(g \/ ell) sin theta$ を得る。
  糸の張力は一度も登場しない。知りたければ、あとで $bold(r)$ に戻って計算すればよい。

  ……という計算の軽さが、冒頭で「弱い」と言った売り文句である。
  実際これは便利だが、便利なだけだ。
]

= 何を失ったか

得たものだけ並べるのは公平でないので、失ったものも書いておく。

#table(
  columns: (auto, 1fr),
  [仮定が増えた], [@ax:dalembert は Newton の法則から出ない。追加の前提である],
  [散逸が苦手], [摩擦のような速度に依存する力は $L$ に素直に入らない。Rayleigh の散逸関数のような接ぎ木が要る],
  [非ホロノミック拘束が苦手], [転がり拘束などは、この枠組みからはみ出す],
)

解析力学は Newton 力学の上位互換ではない。目的が違う道具である。
そして今回の時点では、まだ「$bold(F) = m bold(a)$ の書き換え」の域を出ていない。
力を出発点にしない、という当初の目的も果たせていない。

次回、順序を逆にする。運動方程式を導く原理のほうを理論の出発点に据えると、
力が主役から降りて、$L$ という一つの関数がすべてを決めるようになる。
そこで初めて、この形式が一般相対論や場の理論に届く形になる。
