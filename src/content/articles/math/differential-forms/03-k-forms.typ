#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

#show: post.with(
  title: "k 形式",
  date: "2026-08-20",
  field: "math",
  series: "differential-forms",
  order: 3,
  tags: ("微分形式",),
  summary: "各点の交代形式を滑らかに並べたものが k 形式である。楔積も引き戻しも点ごとの線形代数でしかない。そして引き戻しは楔積と交換するので、k 形式の世界は写像に対してまるごと閉じている。",
  provides: (
    "k-form",
    "wedge-product",
    "form-basis",
    "jacobian-from-wedge",
  ),
  requires: (
    "one-form",
    "alternating-form",
    "pullback",
  ),
)

#layer("L1 微分構造")[各点の線形代数を場に延ばすだけ。計量は要らない]

= 点ごとの線形代数を、場にする

材料はもう揃っている。

#link("/math/linear-algebra/4")[線形代数 第 4 回]で、
ベクトル空間 $V$ に対する交代 $k$ 形式の空間 $Lambda^k V^*$ を作った。
次元は $binom(n, k)$ で、楔積 $and$ が定義されていた。

#link("/math/differential-forms/1")[第 1 回]で、多様体の各点に接空間 $T_p$ を作った。
#link("/math/differential-forms/2")[第 2 回]で、その双対 $T_p^*$ を作った。

あとは組み合わせるだけである。

#definition[
  各点 $p$ に $Lambda^k T_p^*$ の元を滑らかに対応させたものを#strong[$k$ 形式]と呼び、
  その全体を $Omega^k (M)$ と書く。
]<def:k-form>

$k$ 形式は、各点で「接ベクトルを $k$ 本食って数を返し、入れ替えると符号が変わる」機械である。
座標を取れば
$ omega = sum_(i_1 < dots.c < i_k) omega_(i_1 dots.c i_k) (x) thin dif x^(i_1) and dots.c and dif x^(i_k) $
と一意に書ける。成分の個数は各点で $binom(n, k)$ 個。

新しい概念は何も入っていない。#strong[線形代数を各点に配っただけ]である。
以下、そのことを確認しながら、後で要る性質を三つ用意する。

= 用意その一：$0$ から $n$ まで

#proposition[
  $n$ 次元多様体上で
  $ Omega^0, Omega^1, dots, Omega^n $
  だけが $0$ でない。$k > n$ なら $Omega^k = 0$ である。
]<prop:range>

$Omega^0$ は関数の全体、$Omega^n$ は「各点で体積を測る機械」の全体である。
$binom(n,k)$ が $k > n$ で $0$ になる、というだけのことだが、
これが#strong[梯子が有限で閉じる]ことを保証する。

$n = 3$ で $1, 3, 3, 1$、$n = 4$ で $1, 4, 6, 4, 1$。
#link("/math/vector-analysis/1")[ベクトル解析 第 1 回]の数え上げは、
この命題の各点版だった。

= 用意その二：楔積

#definition[
  各点で#link("/math/linear-algebra/4")[線形代数 第 4 回]の楔積を取ることで、
  $ and : Omega^k times Omega^l arrow.long Omega^(k+l) $
  を定める。次の性質を持つ。
  $ alpha and beta = (-1)^(k l) beta and alpha, quad
    (alpha and beta) and gamma = alpha and (beta and gamma) $
]<def:wedge-field>

$1$ 形式どうしなら反交換で、$alpha and alpha = 0$。
偶数次のものは何とでも交換する。

符号の規則は覚えにくいが、根拠は一つしかない。
#strong[入れ替えると符号が変わる]という交代性を、次数のぶんだけ繰り返した結果である。
$k$ 個と $l$ 個をすれ違わせるのに $k l$ 回の入れ替えが要る。

#example[面積形式を二通りの座標で][
  平面の面積形式 $dif x and dif y$ を極座標で書く。
  $x = r cos theta$、$y = r sin theta$ より
  $ dif x = cos theta thin dif r - r sin theta thin dif theta, quad
    dif y = sin theta thin dif r + r cos theta thin dif theta $
  楔で掛けると、$dif r and dif r = dif theta and dif theta = 0$ から
  $ dif x and dif y = (r cos^2 theta + r sin^2 theta) thin dif r and dif theta
    = r thin dif r and dif theta $
  になる。

  極座標の面積要素に $r$ が付くことは、公式として覚えるものではない。
  $and$ が反対称であることの帰結である。
]

= 用意その三：引き戻しが全部を通り抜ける

前回、$1$ 形式が写像でいつでも引き戻せることを見た。$k$ 形式でも同じである。

#definition[
  滑らかな写像 $F : M arrow N$ と $omega in Omega^k (N)$ に対し
  $ (F^* omega)_p (X_1, dots, X_k)
    := omega_(F(p)) (dif F_p (X_1), dots, dif F_p (X_k)) $
]<def:pullback-k>

#theorem[
  $ F^*(alpha and beta) = F^* alpha and F^* beta, quad
    (G compose F)^* = F^* compose G^* $
]<thm:pullback-wedge>

#proof[
  第一式は、@def:pullback-k が各引数に $dif F_p$ を当てるだけの操作で、
  楔積の定義（引数を分けて交代和を取る）がその操作と可換だから成り立つ。
  第二式は $dif (G compose F) = dif G compose dif F$（連鎖律）から従う。
]

@thm:pullback-wedge は地味に見えるが、意味は大きい。

#strong[$k$ 形式の世界は、写像に対してまるごと閉じている。]
形式を作り、掛け合わせ、別の空間へ運ぶ。
どの順序でやっても同じ結果になる。

座標変換もこの枠に入るので、
「座標を替えたときに何が起きるか」を個別に検算する必要がなくなる。
上の極座標の計算も、$F^*$ が $and$ を通り抜けることの一例にすぎない。

#remark[
  ベクトル場の側には、この閉じ方が無い。前回見たとおり押し出しが一般には定義できないので、
  「$M$ 上のベクトル場から $N$ 上のベクトル場を作る」という操作自体が書けない。

  微分形式が幾何の共通語になっているのは、
  #strong[写像に対して行儀がよい]という、この一点が大きい。
]

= 実例で確かめる

#example[球面の面積形式][
  $S^2$ を極座標 $(theta, phi.alt)$ で覆い、
  $ sigma := sin theta thin dif theta and dif phi.alt $
  とおく。これは $S^2$ 上の $2$ 形式である。

  $RR^3$ の側で考えると、$sigma$ は包含写像による引き戻しとして得られる。
  $ iota^* (x thin dif y and dif z + y thin dif z and dif x + z thin dif x and dif y) = sigma $
  左辺の $2$ 形式は $RR^3$ 全体で定義されているが、
  $S^2$ の上へ引き戻すと角度だけの式になる。

  そして $integral_(S^2) sigma = 4 pi$。球の表面積である。
  積分の定義は#link("/math/differential-forms/6")[第 6 回]で与える。
]

#example[トーラス上の形式][
  トーラス $T^2 = S^1 times S^1$ を、角度 2 つの組 $(theta_1, theta_2)$ で表す。

  この上の $1$ 形式 $dif theta_1$、$dif theta_2$ は大域的に定義できる。
  ところが $theta_1$ という#strong[関数]は大域的に定義できない
  （$2 pi$ 進むと元に戻るので、一価にならない）。

  つまり $dif theta_1$ は「閉じているが完全でない」$1$ 形式である。
  こういう形式が存在するかどうかが、空間の穴の数を測る。
  #link("/math/differential-forms/7")[第 7 回]の主題である。
]

= 何がまだ無いか

ここまでで、各点の交代形式を場にした。掛け算もできる。写像で運べる。

まだ#strong[微分していない]。

$0$ 形式（関数）については $dif f$ を作った。
だが $1$ 形式を微分して $2$ 形式にする操作は、まだ定義していない。

次回それを定める。
条件を四つ課すと、そういう操作は#strong[一つしかない]ことが示せる。
天下りに見える外微分の定義が、実は選択の余地の無いものだった、という話になる。
