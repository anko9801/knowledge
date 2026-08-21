#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "行列式は体積である",
  date: "2026-08-20",
  field: "math",
  series: "linear-algebra",
  order: 5,
  tags: ("線形代数",),
  summary: "Λⁿ が 1 次元である、という一行から行列式が出る。基底を一度も選ばずに定義できるので、基底に依らないことを確かめる必要すらない。置換の和も余因子展開も、基底を入れたあとの計算法にすぎない。",
  provides: (
    "determinant",
    "orientation",
    "signed-volume",
  ),
  requires: (
    "alternating-form",
    "binomial-dimension",
    "linear-map",
  ),
)

= 定義がおかしい

行列式の定義は、初めて見ると異様である。

$ det A = sum_(sigma in S_n) upright("sgn")(sigma) thin A_(1 sigma(1)) A_(2 sigma(2)) dots.c A_(n sigma(n)) $

$n!$ 個の項を、置換の符号を付けて足す。
なぜこの式なのか、なぜこれが「面積」や「体積」なのか、
なぜ $det(A B) = det A det B$ が成り立つのか。どれも式からは見えない。

余因子展開で定義する流儀もあるが、そちらは再帰の形が天下りで、
しかも「第 1 行で展開しても第 2 行で展開しても同じ値になる」ことを別に証明する羽目になる。

#link("/math/linear-algebra/4")[前回]の結果を使うと、この事情が消える。

#strong[$Lambda^n V^*$ は 1 次元である。それだけで行列式が定まる。]

= 一次元しかない、ということの威力

前回の定理に $k = n$ を入れる。

#proposition[
  $dim V = n$ のとき $dim Lambda^n V^* = binom(n, n) = 1$。
]<prop:top>

つまり、$n$ 本のベクトルを食う交代形式は、定数倍を除いて一つしかない。
「向き付けられた体積を測る道具」は本質的に一種類だ、と言っている。

ここに線形写像を作用させる。

#definition[
  線形写像 $f : V arrow V$ に対し、$omega in Lambda^n V^*$ の引き戻しを
  $ (f^* omega)(bold(v)_1, dots, bold(v)_n)
    := omega(f(bold(v)_1), dots, f(bold(v)_n)) $
  で定める。$f^* omega$ もまた交代 $n$ 形式である。
]<def:pullback>

$f^*$ は $Lambda^n V^*$ からそれ自身への線形写像である。
そして @prop:top より $Lambda^n V^*$ は 1 次元なので、
#strong[1 次元空間の上の線形写像は定数倍しかありえない]。

#definition[
  @def:pullback の $f^*$ が引き起こす定数倍の係数を $det f$ と書き、
  $f$ の#strong[行列式]と呼ぶ。すなわち、$0$ でない $omega in Lambda^n V^*$ について
  $ omega(f(bold(v)_1), dots, f(bold(v)_n)) = (det f) thin omega(bold(v)_1, dots, bold(v)_n) $
]<def:det>

この定義に、基底も内積も出てこない。
だから「行列式は基底に依らない」を証明する必要がない。
#strong[最初から基底に触れていない]のである。

#link("/math/linear-algebra/1")[第 1 回]で「跡や行列式は写像の性質」と書いたが、
行列式についてはもっと強く、基底を経由せずに定義できる量だった。

= 性質が一行で出る

#theorem[
  $ det(f compose g) = det f dot det g $
]<thm:multiplicative>

#proof[
  @def:det を二度使う。
  $ omega(f(g(bold(v)_1)), dots) = (det f) thin omega(g(bold(v)_1), dots)
    = (det f)(det g) thin omega(bold(v)_1, dots) $
]

証明が 1 行で終わる。成分で書くと $n!$ 個の項どうしの積を整理する話になり、
なぜ成り立つのかが見えなくなるが、@def:det の側では定数倍の合成でしかない。

#corollary[
  $f$ が可逆であることと $det f != 0$ は同値。また $det(f^(-1)) = 1 \/ det f$。
]<cor:invertible>

#proof[
  $f$ が可逆でないなら像の次元が $n$ 未満なので、
  $f(bold(v)_1), dots, f(bold(v)_n)$ は一次従属になり、交代性から
  @def:det の左辺は常に $0$。よって $det f = 0$。

  逆に可逆なら @thm:multiplicative を $f compose f^(-1) = upright("id")$ に当てて
  $det f dot det(f^(-1)) = 1$ を得る。
]

= 置換の和はどこから来たのか

冒頭の $n!$ 個の和は、@def:det を基底で書き下すと出てくる。

#proposition[
  基底 $(bold(e)_i)$ を取り、$f(bold(e)_j) = sum_i A^i{}_j bold(e)_i$ とすると
  $ det f = sum_(sigma in S_n) upright("sgn")(sigma) thin A^(sigma(1)){}_1 dots.c A^(sigma(n)){}_n $
]<prop:formula>

#proof[
  @def:det で $omega = e^1 and dots.c and e^n$、$bold(v)_j = bold(e)_j$ と取る。
  左辺は $omega(f(bold(e)_1), dots, f(bold(e)_n))$ で、
  各引数を $sum_i A^i{}_j bold(e)_i$ に展開して多重線形性で開く。

  項は各 $j$ について $i$ を一つずつ選ぶ選び方に対応するが、
  交代性により、同じ $i$ を二度選んだ項は $0$ になる。
  残るのは $j mapsto i$ が全単射になる場合、すなわち置換 $sigma$ の場合だけである。
  引数を標準の順序に並べ替えるのに $upright("sgn")(sigma)$ が出る。
]

つまり $n!$ も $upright("sgn")$ も、#strong[交代性から出てくる計算上の副産物]である。
定義に置いたものではない。余因子展開も同様で、
$omega$ を $e^1$ とそれ以外に分けて展開すれば出る。

= 体積である

@prop:top の「1 次元しかない」を、幾何の言葉に直しておく。

$0$ でない $omega in Lambda^n V^*$ を一つ選ぶことは、
「この $n$ 本のベクトルが張る平行体の体積を $1$ とする」と宣言することである。
$omega$ は定数倍を除いて一意なので、
#strong[体積の測り方は、基準を一つ決めれば残りが全部決まる]。

そのうえで @def:det は、$f$ が体積を何倍にするかを言っている。
$det f = 2$ なら、どんな平行体を取っても体積が $2$ 倍になる。

#example[ヤコビアンは後付けではなかった][
  #link("/math/vector-analysis/2")[ベクトル解析 第 2 回]で
  $ dif x and dif y = det J thin dif u and dif v $
  が楔積の反対称性から出ることを見た。あれは @prop:formula の $n = 2$ の場合を、
  座標変換の微分に当てただけである。

  重積分の変数変換で行列式が現れるのは、@def:det が体積の拡大率だからで、
  補正として持ち込んだのではない。
]

== 絶対値と向き

@def:det の値は負にもなる。$Lambda^n V^* without {0}$ は 1 次元から原点を抜いたものなので、
正の側と負の側の二つに分かれる。どちらを正と呼ぶかを決めることが#strong[向き付け]である。

$det f > 0$ の写像は向きを保ち、$det f < 0$ の写像は向きを裏返す。
鏡映の行列式が $-1$ になるのはこのためで、
#link("/math/vector-analysis/1")[ベクトル解析 第 1 回]で扱った擬ベクトルは、
この符号を拾ってしまう量のことだった。

重積分の公式に $abs(det J)$ と絶対値が付くのは、
向きを忘れて「体積は正」と決めたときの帳尻合わせである。
向きまで込めて積分する（微分形式で積分する）なら、絶対値は要らない。

#remark[
  跡についても同じ形の説明ができる。
  $det(upright("id") + t f) = 1 + t thin upright("tr") f + O(t^2)$ が成り立つので、
  跡は「体積の変化率」である。
  流体の $nabla dot bold(v)$ が体積の膨張率を表すのは、この事実の場の版にほかならない。
]

= ここまで、内積を一度も使っていない

@def:det も @thm:multiplicative も、$Lambda^n$ が 1 次元だという一点だけで出た。
長さも角度も定義していない空間で、体積の比が定まっている。

これは意外に見えるかもしれないが、考えてみれば当然である。
「$2$ 倍になった」は比なので、単位が要らない。
#strong[絶対的な体積には基準が要るが、比には要らない。]

次回、いよいよ内積を入れる。すると絶対的な長さが決まり、$V$ と $V^*$ の区別が消え、
行列式に「向き付き体積そのもの」としての意味が付く。
そして払う代償も、そこではっきりする。
