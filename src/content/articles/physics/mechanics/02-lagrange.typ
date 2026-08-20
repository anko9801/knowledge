#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "Lagrange 方程式",
  date: "2026-08-17",
  field: "physics",
  series: "mechanics",
  order: 2,
  tags: ("解析力学",),
  summary: "拘束力が消える書き換え。ただし d'Alembert の原理という追加の仮定を一つ置く。",
)

= 答えを知っている相手から始める

#link("/physics/mechanics/1")[第 1 回]で、理論を書くとは対称性の不変量を数え上げることだ、と書いた。
ただし、その道具が信用できるかどうかは別問題である。
だから今回は、答えの分かっている場所——Newton 力学が正しいと分かっている範囲——で
$L$ を組み立て、出てくる運動方程式が見慣れたものと一致することを確かめる。

先に断っておくと、この書き換えはただの言い換えではない。
#strong[追加の仮定を一つ置く]。それが何かは、後で正確に述べる。

なお今回のゴールは $L$ を作るところまでで、$S$ はまだ出てこない。
$L$ が手に入った時点で運動方程式は書けてしまうので、
「なぜさらに時間で積むのか」という問いが残る。
その答え——座標にも時間の刻み方にも依らない形で法則を書こうとすると
$display(integral L thin dif t)$ の形しか残らない——は#link("/physics/mechanics/3")[第 3 回]で扱う。

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
  運動エネルギーと一般化力を
  $ T := sum_i frac(1, 2) m_i abs(bold(v)_i)^2, quad
    Q_k := sum_i bold(F)_i dot frac(partial bold(r)_i, partial q^k) $
  と定めると
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
  となる。最後の等号は
  $ T = sum_i frac(1,2) m_i bold(v)_i dot bold(v)_i $
  を微分しただけである。
  これで前半が示された。

  後半。$Q_k = - partial U \/ partial q^k$ であり、$U$ は $dot(q)$ を含まないので
  $partial U \/ partial dot(q)^k = 0$ である。よって $T$ を $L = T - U$ に置き換えてよい。
]

#definition[
  $L$ を#strong[ラグランジアン]と呼ぶ。
]<def:lagrangian>

#remark[
  $U$ が速度を含まない、という条件は少し緩められる。
  一般化力が $U(q, dot(q), t)$ を使って
  $ Q_k = frac(dif, dif t) (frac(partial U, partial dot(q)^k)) - frac(partial U, partial q^k) $
  と書ければ、同じ計算で $L = T - U$ の形が出る。
  この形が要るのは Lorentz 力である。$U = q phi.alt - q bold(v) dot bold(A)$ と取ると
  $ L = frac(1, 2) m abs(bold(v))^2 - q phi.alt + q bold(v) dot bold(A) $
  となり、Aharonov--Bohm の節で使った $L$ が出る。
]

使ったのは @ax:dalembert と、座標変換の微分の順序交換だけである。
それだけで、拘束力は最初の一行で消えた。
仮想変位に対して仕事をしないと仮定したのだから、
仮想変位と内積を取った時点で落ちるのは当然なのだが、うまい仕掛けだと思う。

#example("単振り子")[
  一般化座標を $theta$ 一つに取ると
  $ L = frac(1, 2) m ell^2 dot(theta)^2 + m g ell cos theta $
  であり、@thm:lagrange から
  $ dot.double(theta) = -(g \/ ell) sin theta $
  を得る。
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
