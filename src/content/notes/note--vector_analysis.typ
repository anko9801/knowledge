#import "/src/typst/template.typ": post

#show: post.with(
  title: "ベクトル解析",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/vector_analysis.tex から変換",
)

= ベクトル空間
<ベクトル空間>
== ベクトルの定義
<ベクトルの定義>
#block[
同じ項で添字が重なる場合にはその添字について和を取る。

]
#block[
体 $K$ 上の加群を $K$
上のベクトル空間といい、ベクトル空間の元をベクトルという。
$bold(A) = A_i bold(e)_i = A_1 bold(e)_1 + A_2 bold(e)_2 + A_3 bold(e)_3$

]
#block[
ベクトル $bold(A) = A_i bold(e)_i \, bold(B) = B_j bold(e)_j$
における内積と外積を定義する。
$ bold(A) dot.op bold(B) & = A_i bold(e)_i dot.op B_j bold(e)_j = g_(i j) A_i B_j\
bold(A) times bold(B) & = \( A_2 B_3 - A_3 B_2 \) bold(e)_1 + \( A_3 B_1 - A_1 B_3 \) bold(e)_2 + \( A_1 B_2 - A_2 B_1 \) bold(e)_3 $

]
#block[
#strong[定理 1] (). \

内積と外積について Einstein の縮約記法を用いて次のように書ける。
$ bold(A) dot.op bold(B) & = A_i bold(e)_i dot.op B_j bold(e)_j = A_i B_i\
bold(A) times bold(B) & = bold(e)_i epsilon_(i j k) A_j B_k $

]
内積については自明。外積について次のように求められる。
$ \( bold(A) times bold(B) \)_1 & = epsilon_(1 j k) A_j B_k = A_2 B_3 - A_3 B_2\
\( bold(A) times bold(B) \)_2 & = epsilon_(2 j k) A_j B_k = A_3 B_1 - A_1 B_3\
\( bold(A) times bold(B) \)_3 & = epsilon_(3 j k) A_j B_k = A_1 B_2 - A_2 B_1 $
0◻

= ベクトル解析
<ベクトル解析>
#block[
$ delta_(i j) = cases(delim: "{", 1 & \( i = j \), 0 & \( i eq.not j \)) $

]
#block[
$epsilon_(mu_1 dots.h.c mu_k)$ は $mu_1 dots.h.c mu_k$ が順列のとき
$1 dots.h.c k$ の偶置換なら $1$、奇置換なら $- 1$
とする。順列ではないときは $0$ とする。 \$\$\\begin{aligned}
    \\varepsilon\_{\\mu\_1\\cdots\\mu\_k} & :=
    \\begin{dcases}
      \\mathop{\\mathrm{sgn}}\\begin{pmatrix}
            1     & \\cdots & k     \\\\
            \\mu\_1 & \\cdots & \\mu\_k
          \\end{pmatrix} & (\\mu\_1\\cdots\\mu\_k が順列のとき) \\\\
      0                         & (else)
    \\end{dcases} \\\\
                                   & =
    \\begin{dcases}
      1  & (\\mu\_1\\cdots\\mu\_k が偶置換のとき) \\\\
      -1 & (\\mu\_1\\cdots\\mu\_k が奇置換のとき) \\\\
      0  & (else)
    \\end{dcases}
  
\\end{aligned}\$\$

]
#block[
#strong[定理 2] (). \

$f_(i j) = f_(j i)$ と対称性があるとき $epsilon_(i j k) f_(i j) = 0$
となる。

]
$i \, j$ を交換しても等しいことから
$ epsilon_(i j k) f_(i j) = epsilon_(j i k) f_(j i) = - epsilon_(i j k) f_(i j) = 0 $
となる。 0◻

#block[
ベクトル $bold(A) = A_i bold(e)_i$ について勾配 $nabla bold(A)$ と発散
$nabla dot.op bold(A)$、回転 $nabla times bold(A)$
を次のように定義する。 $ nabla bold(A) & = bold(e)_i partial_i A_i\
nabla dot.op bold(A) & = partial_i A_i\
nabla times bold(A) & = bold(e)_i epsilon_(i j k) partial_j A_k $ ただし
$ partial_i = frac(partial, partial x^i) $

]
#block[
#strong[定理 3] (勾配・発散・回転の線形性). \

それぞれ線形性が成り立つ。 $ nabla \( f + g \) & = nabla f + nabla g\
nabla dot.op \( bold(A) + bold(B) \) & = nabla dot.op bold(A) + nabla dot.op bold(B)\
nabla times \( bold(A) + bold(B) \) & = nabla times bold(A) + nabla times bold(B) $

]
$ nabla \( f + g \) & = bold(e)_i partial_i \( f + g \)\
 & = bold(e)_i partial_i f + bold(e)_i partial_i g\
 & = nabla f + nabla g\
nabla dot.op \( bold(A) + bold(B) \) & = partial_i \( A_i + B_i \)\
 & = partial_i A_i + partial_i B_i\
 & = nabla dot.op bold(A) + nabla dot.op bold(B)\
nabla times \( bold(A) + bold(B) \) & = bold(e)_i epsilon_(i j k) partial_j \( A_k + B_k \)\
 & = bold(e)_i epsilon_(i j k) partial_j A_k + bold(e)_i epsilon_(i j k) partial_j B_k\
 & = nabla times bold(A) + nabla times bold(B) $ 0◻

#block[
#strong[定理 4] (スカラー倍の勾配・発散・回転). \

スカラー倍はそれぞれ次のようになる。
$ nabla \( f g \) & = f nabla g + g nabla f\
nabla dot.op \( f bold(A) \) & = f \( nabla dot.op bold(A) \) + bold(A) dot.op \( nabla f \)\
nabla times \( f bold(A) \) & = f \( nabla times bold(A) \) - bold(A) times \( nabla f \) $

]
$ nabla \( f g \) & = bold(e)_i partial_i \( f g \)\
 & = f bold(e)_i partial_i g + g bold(e)_i partial_i f\
 & = f nabla g + g nabla f\
nabla dot.op \( f bold(A) \) & = partial_i \( f A_i \)\
 & = f partial_i A_i + A_i partial_i f\
 & = f \( nabla dot.op bold(A) \) + bold(A) dot.op \( nabla f \)\
nabla times \( f bold(A) \) & = bold(e)_i epsilon_(i j k) partial_j \( f A_k \)\
 & = f bold(e)_i epsilon_(i j k) partial_j A_k + bold(e)_i epsilon_(i j k) A_k partial_j f\
 & = f bold(e)_i epsilon_(i j k) partial_j A_k - bold(e)_i epsilon_(i k j) A_k partial_j f\
 & = f \( nabla times bold(A) \) - bold(A) times \( nabla f \) $ 0◻

#block[
#strong[定理 5] (ベクトルの内積・外積の勾配・発散・回転). \

$ nabla \( bold(A) dot.op bold(B) \) & = bold(A) times \( nabla times bold(B) \) + bold(B) times \( nabla times bold(A) \) + \( bold(A) dot.op nabla \) bold(B) + \( bold(B) dot.op nabla \) bold(A)\
nabla dot.op \( bold(A) times bold(B) \) & = bold(B) dot.op \( nabla times bold(A) \) - bold(A) dot.op \( nabla times bold(B) \)\
nabla times \( bold(A) times bold(B) \) & = bold(A) \( nabla dot.op bold(B) \) - bold(B) \( nabla dot.op bold(A) \) + \( bold(B) dot.op nabla \) bold(A) - \( bold(A) dot.op nabla \) bold(B) $

]
$ nabla \( bold(A) dot.op bold(B) \) & = bold(e)_i partial_i \( A_j B_j \)\
 & = bold(e)_i \( \( A_j partial_i B_j + B_j partial_i A_j \) - \( A_j partial_j B_i + B_j partial_j A_i \) + \( A_j partial_j B_i + B_j partial_j A_i \) \)\
 & = bold(e)_i \( delta_(i l) delta_(j m) - delta_(i m) delta_(j l) \) \( A_j partial_l B_m + B_j partial_l A_m \) + bold(e)_i \( A_j partial_j B_i + B_j partial_j A_i \)\
 & = bold(e)_i epsilon_(k i j) epsilon_(k l m) \( A_j partial_l B_m + B_j partial_l A_m \) + bold(e)_i \( A_j partial_j B_i + B_j partial_j A_i \)\
 & = bold(e)_i epsilon_(i j k) A_j epsilon_(k l m) partial_l B_m + bold(e)_i epsilon_(i j k) B_j epsilon_(k l m) partial_l A_m + bold(e)_i A_j partial_j B_i + bold(e)_i B_j partial_j A_i\
 & = bold(A) times \( nabla times bold(B) \) + bold(B) times \( nabla times bold(A) \) + \( bold(A) dot.op nabla \) bold(B) + \( bold(B) dot.op nabla \) bold(A)\
nabla dot.op \( bold(A) times bold(B) \) & = partial_i \( epsilon_(i j k) A_j B_k \)\
 & = epsilon_(i j k) \( B_k partial_i A_j + A_j partial_i B_k \)\
 & = B_k epsilon_(k i j) partial_i A_j - A_j epsilon_(j i k) partial_i B_k\
 & = bold(B) dot.op \( nabla times bold(A) \) - bold(A) dot.op \( nabla times bold(B) \)\
nabla times \( bold(A) times bold(B) \) & = bold(e)_i epsilon_(i j k) partial_j epsilon_(k l m) A_l B_m\
 & = bold(e)_i epsilon_(k i j) epsilon_(k l m) \( B_m partial_j A_l + A_l partial_j B_m \)\
 & = bold(e)_i \( delta_(i l) delta_(j m) - delta_(i m) delta_(j l) \) \( B_m partial_j A_l + A_l partial_j B_m \)\
 & = bold(e)_i \( B_j partial_j A_i + A_i partial_j B_j \) - bold(e)_i \( B_i partial_j A_j + A_j partial_j B_i \)\
 & = bold(e)_i A_i partial_j B_j - bold(e)_i B_i partial_j A_j + bold(e)_i B_j partial_j A_i - bold(e)_i A_j partial_j B_i\
 & = bold(A) \( nabla dot.op bold(B) \) + bold(B) \( nabla dot.op bold(A) \) + \( bold(B) dot.op nabla \) bold(A) - \( bold(A) dot.op nabla \) bold(B) $
0◻

#block[
#strong[定理 6] (有名定理). \

$ nabla dot.op \( nabla times bold(A) \) & = 0\
nabla times \( nabla f \) & = bold(0)\
nabla times \( nabla times bold(A) \) & = nabla dot.op \( nabla bold(A) \) - nabla^2 bold(A) $

]
$ nabla dot.op \( nabla times bold(A) \) & = partial_i \( epsilon_(i j k) partial_j A_k \)\
 & = epsilon_(i j k) partial_i partial_j A_k = 0\
nabla times \( nabla f \) & = bold(e)_i epsilon_(i j k) partial_j partial_k f = 0\
nabla times \( nabla times bold(A) \) & = bold(e)_i epsilon_(i j k) partial_j \( epsilon_(k l m) partial_l A_m \)\
 & = bold(e)_i epsilon_(k i j) epsilon_(k l m) partial_j partial_l A_m\
 & = bold(e)_i \( delta_(i l) delta_(j m) - delta_(i m) delta_(j l) \) partial_j partial_l A_m\
 & = bold(e)_i partial_j partial_i A_j - bold(e)_i partial_j^2 A_i\
 & = nabla \( nabla dot.op bold(A) \) - nabla^2 bold(A) $ 0◻

#block[
#strong[定理 7] (Gauss の定理). \

$ integral_V nabla dot.op bold(A) upright(d) V & = integral.cont_(partial V) bold(A) dot.op upright(d) bold(S) $

]
