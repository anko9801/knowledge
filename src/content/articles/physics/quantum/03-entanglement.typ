#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/layer.typ": layer

// Dirac 記法。Typst の数式に ket / bra は無いので、ここで作る。
#let ket(x) = $lr(| #x chevron.r)$
#let bra(x) = $lr(chevron.l #x |)$

#show: post.with(
  title: "分解できない状態がある",
  date: "2026-08-21",
  field: "physics",
  series: "quantum",
  order: 3,
  tags: ("量子力学",),
  summary: "系を二つ合わせると状態空間はテンソル積になる。そして次元が積になったぶんの行き場所が、組に分解できない状態だった。もつれは新しい仮定ではなく、線形代数の帰結である。",
  provides: (
    "composite-system",
    "entanglement",
  ),
)

#layer("L0 ＋ 計量", metric: true)[線形代数 第 3 回のテンソル積を、そのまま使う]

= 系を二つにする

系 $A$ の状態空間が $cal(H)_A$、系 $B$ が $cal(H)_B$ だとして、
合わせた系の状態空間は何か。

直和ではない。直和なら「$A$ にいるか $B$ にいるか」を表すことになり、
「両方が同時に存在する」を書けない。

#definition[
  合成系の状態空間は#strong[テンソル積] $cal(H)_A times.o cal(H)_B$ である。
]<def:composite>

#link("/math/linear-algebra/3")[線形代数 第 3 回]の言葉なら、
「$V$ と $W$ の両方を同時に指定する」ときの部屋である。
$dim (cal(H)_A times.o cal(H)_B) = dim cal(H)_A dot dim cal(H)_B$、次元は積になる。

なぜ積か。$A$ の基底が $abs(A)$ 個、$B$ が $abs(B)$ 個あるとき、
「$A$ が $i$ で $B$ が $j$」という状態が $abs(A) times abs(B)$ 通りあるからである。
そしてそれらの重ね合わせも状態でなければならない（前回の要求）。

= 分解できない元が残る

ここで、線形代数の事実がそのまま物理になる。

#proposition[
  $cal(H)_A times.o cal(H)_B$ の元のうち、$psi_A times.o psi_B$ の形に書けるもの
  （#strong[単純テンソル]）は、ごく一部でしかない。
]<prop:not-simple>

#link("/math/linear-algebra/3")[線形代数 第 3 回]で数えたとおりである。
単純テンソルの全体はスカラー倍の重複を除いて
$dim cal(H)_A + dim cal(H)_B - 1$ 次元ぶんしかないのに、
テンソル積は $dim cal(H)_A dot dim cal(H)_B$ 次元ある。

#strong[次元が積になったぶんの行き場所が、分解できない元だった。]

#definition[
  $psi = psi_A times.o psi_B$ と書けない状態を#strong[もつれた状態]と呼ぶ。
]<def:entangled>

#example[$2$ 準位系ふたつ][
  $cal(H)_A = cal(H)_B = CC^2$ とし、基底を $#ket($0$), #ket($1$)$ と書く。
  合成系は $4$ 次元で、基底は $#ket($00$), #ket($01$), #ket($10$), #ket($11$)$。

  $ #ket($Phi$) = frac(1, sqrt(2)) (#ket($00$) + #ket($11$)) $
  は分解できない。実際 $(a #ket($0$) + b #ket($1$)) times.o (c #ket($0$) + d #ket($1$))$ の
  係数行列は $mat(a c, a d; b c, b d)$ で行列式が $0$ だが、
  $#ket($Phi$)$ の係数行列は $frac(1,sqrt(2)) mat(1, 0; 0, 1)$ で行列式が $0$ でない。
]

#strong[もつれは、新しい仮定を置いた結果ではない。]
「合成系はテンソル積」と決めた時点で、自動的に存在してしまう。

= 部分系の状態が定まらない

もつれた状態では、$A$ だけの状態を聞いても答えがない。

$A$ だけに作用する観測量 $hat(O) times.o I$ の期待値を計算すると、
$B$ の自由度について和が取られる。その和を先に取ったものが

#definition[
  $ rho_A := upright("tr")_B (#ket($psi$) #bra($psi$)) $
  を#strong[縮約密度行列]と呼ぶ。$A$ に関するすべての測定の予測は、$rho_A$ で決まる。
]<def:reduced>

$psi$ が単純テンソルなら $rho_A$ は純粋状態（射影）になる。
もつれていると、$rho_A$ は混合状態になり、$upright("tr") rho_A^2 < 1$ である。

#example[上の状態の縮約][
  $ rho_A = frac(1, 2) mat(1, 0; 0, 1) $
  完全にランダムである。$A$ だけを測ると、$#ket($0$)$ と $#ket($1$)$ が $1\/2$ ずつ出る。

  #strong[全体は完全に決まっているのに、部分が決まっていない。]
  古典確率では起こりえない。同時分布が決まれば周辺分布も決まり、
  同時分布が「一点に集中」なら周辺分布も一点に集中するからである。
]

古典との差が、ここではっきりする。

#table(
  columns: (auto, 1fr),
  [古典], [全体の状態が決まれば、各部分の状態も決まる],
  [量子], [全体が純粋でも、部分が混合になりうる],
)

= 情報はどこにあるのか

$rho_A$ が混合になったぶん、情報が失われたように見える。だが全体は純粋である。
失われたのではなく、#strong[相関のほうに入っている]。

これを測る量が、#link("/math/measure/1")[測度と確率]で作った道具の系列にある。

#definition[
  $ S(rho) := -upright("tr")(rho log rho) $
  を#strong[von Neumann エントロピー]と呼ぶ。
  $S(rho_A)$ を、$A$ と $B$ の間の#strong[もつれエントロピー]という。
]<def:von-neumann>

$rho$ を対角化すれば、固有値を確率と見た Shannon エントロピーになる
（#link("/math/linear-algebra/7")[スペクトル定理]が効いている）。

上の $#ket($Phi$)$ では $S(rho_A) = log 2 = 1$ ビットで、これが最大値である。
#strong[$1$ ビットの情報が、$A$ でも $B$ でもなく「間」にある。]

#remark[
  もつれが「情報を瞬時に送る」ことにはならない。
  $A$ での測定は $rho_B$ を変えない（局所操作では縮約密度行列が変わらない）。
  相関が見えるのは、両方の結果を持ち寄って比べたときだけである。

  そして、その相関が古典確率で説明できないことは実験で確かめられている。
  Bell の不等式は、局所的な隠れた変数で書ける相関の上限を与え、
  量子力学の予測はそれを超える。Aspect ら（1982）以降、
  抜け穴を塞いだ実験が繰り返されている。
]

= 連載を閉じる

三回でやったことをたたむ。

#table(
  columns: (auto, 1fr),
  [重ね合わせ・確率・実数], [複素 Hilbert 空間、内積、$abs(c)^2$],
  [測定値が実数、確率が $1$], [自己随伴。スペクトル定理がそのまま答え],
  [同時測定と不確定性], [交換子。証明は Cauchy--Schwarz],
  [合成系], [テンソル積。分解できない元が残る],
  [もつれ], [新しい仮定ではなく、次元が積になったことの帰結],
)

#strong[この連載で使った数学は、線形代数だけである。]
Hilbert 空間、スペクトル定理、テンソル積。
どれも #link("/math/linear-algebra/1")[線形代数の連載]で、
物理を持ち出さずに組み立てたものだった。

公理が天下りに見えるのは、要求から公理への翻訳が省かれているからである。
翻訳を書けば、#strong[選択の余地はほとんど残らない]。

残したものを挙げておく。時間発展（Schrödinger 方程式）、
正準量子化（$[hat(x),hat(p)] = i planck$ の出どころ）、
そして測定で状態が変わることの扱い。
どれも「要求から翻訳する」という同じ手口が使えるが、
翻訳の元になる要求のほうが、まだ議論の的である。
