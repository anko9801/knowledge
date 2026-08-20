#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "Newton 力学を含むこと",
  date: "2026-08-17",
  field: "physics",
  series: "mechanics",
  order: 4,
  tags: ("解析力学",),
  summary: "作用の側から出発した形式が、Newton 力学を含んでいることを確かめる。d'Alembert の原理は導出ではなく、橋を架けるための仮定である。",
)


= 答え合わせをする

ここまで、力を一度も使わずに形式を組み立ててきた。
要請から $S = integral L thin dif t$ の形が出て、停留を課すと Euler--Lagrange 方程式が出て、
対称性を課すと $L$ が決まった。

だが、それが#strong[本当に我々の知っている力学なのか]は、まだ確かめていない。
自由粒子で $L = frac(1,2) m v^2$ が出たのは良い兆候だが、1 例にすぎない。
拘束のある系、力の働く系でも一致するのか。今回はその答え合わせをする。

歴史の順序は逆で、Lagrange たちは Newton 力学の側からこの形式に到達した。
以下でたどるのもその道筋である。ただし位置づけは違う。
#strong[Newton から解析力学を導く]のではなく、
#strong[解析力学が Newton を含んでいることを確かめる]作業だと思ってほしい。

先に断っておくと、この橋渡しはただの言い換えではない。
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

そのうえで、答え合わせは済んだ。要請から組み立てた形式は、
拘束のある系でも力の働く系でも Newton 力学と一致する。
@ax:dalembert が要ったのは、両者を#strong[つなぐ]ためであって、
形式そのものを立てるためではない。第 2 回と第 3 回は、この仮定を一度も使っていない。

つまり、こういう位置関係になる。

#table(
  columns: (auto, 1fr),
  [第 2 回・第 3 回], [要請から $L$ と運動方程式を出す。力も @ax:dalembert も使わない],
  [今回], [その結果が Newton 力学を含むことの確認。橋を架けるのに @ax:dalembert が要る],
)

信用してよいことが分かったので、次回はこの形式を力学の外へ持ち出す。
標準模型と一般相対論で同じ手続きが動くこと、作用の差が干渉縞として測れること、
そして停留原理がどこから来たのか——古典力学の中に理由は無い——を扱う。
