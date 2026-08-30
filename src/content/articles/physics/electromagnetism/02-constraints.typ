#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "四本のうち二本は時間発展の式ではない",
  date: "2026-09-02",
  field: "physics",
  series: "electromagnetism",
  order: 2,
  tags: ("電磁気",),
  summary: "Maxwell 方程式のうち二本には、時間微分が入っていません。次の瞬間を教えてくれない式です。それは最初の一瞬に課される条件で、そのあと自動的に保たれます。保たれる条件を書き下すと、電荷保存が出てきます。",
  provides: (
    "constraint-vs-evolution",
    "constraint-preservation",
    "two-polarizations",
  ),
)

= 時間微分の無い式が二本ある

Maxwell 方程式を、成分で四本並べます。

#table(
  columns: (auto, 1fr),
  [$nabla dot bold(E) = rho slash epsilon_0$], [時間微分が無い],
  [$nabla dot bold(B) = 0$], [時間微分が無い],
  [$partial_t bold(E) = c^2 nabla times bold(B) - bold(j) slash epsilon_0$], [$bold(E)$ の次の瞬間を与える],
  [$partial_t bold(B) = - nabla times bold(E)$], [$bold(B)$ の次の瞬間を与える],
)

#strong[上の二本には、時間微分が入っていません。]

微分方程式を解くというのは、いまの状態から次の瞬間を出すことです。
#strong[上の二本は、次の瞬間を教えてくれません。]

では何をしているのか。

#definition[
  時間微分を含まず、各時刻の状態そのものに課される式を#strong[拘束]と呼ぶ。
  時間微分を含み、次の瞬間を与える式を#strong[発展方程式]と呼ぶ。
]<def:constraint>

@def:constraint で分けると、Maxwell 方程式は#strong[拘束が二本、発展が二本]です。

= 最初に課せば、あとは自動で保たれる

拘束が二本あるので、勝手な初期状態を置けません。

$t = 0$ で $nabla dot bold(E) = rho slash epsilon_0$ を満たすように用意します。
#strong[次の瞬間には、どうなるでしょうか。]

発展方程式で $bold(E)$ が動きます。動いた先で、拘束がまだ成り立っているとは限りません。

#strong[確かめます。] 拘束のずれを時間で微分します。

$ partial_t (nabla dot bold(E) - rho slash epsilon_0)
  = nabla dot (partial_t bold(E)) - (partial_t rho) / epsilon_0 $

右辺の第一項に、発展方程式を入れます。

$ nabla dot (c^2 nabla times bold(B) - bold(j) slash epsilon_0)
  = - (nabla dot bold(j)) / epsilon_0 $

$nabla dot (nabla times bold(B)) = 0$ なので、第一項が消えました。まとめると

$ partial_t (nabla dot bold(E) - rho slash epsilon_0)
  = - (1) / epsilon_0 (nabla dot bold(j) + partial_t rho) $

#theorem[
  拘束が時間とともに保たれるのは、
  $ partial_t rho + nabla dot bold(j) = 0 $
  が成り立つときに限る。
]<thm:preservation>

#strong[電荷保存です。]

#link("/math/vector-analysis/3")[ベクトル解析 第 3 回]で、電荷保存が
$dif dif = 0$ の系として出ていました。#strong[同じ事実です。] ただし読み方が違います。

あちらは「ただで出る」。こちらは#strong[「これが成り立たないと理論が壊れる」]です。

#strong[電荷が保存しない世界では、Maxwell 方程式に解がありません。]
初期条件を満たすように用意しても、次の瞬間には拘束が破れています。

= 拘束は情報を運ばない

@def:constraint の拘束が、何を意味するかを見ます。

$nabla dot bold(E) = rho slash epsilon_0$ を、遠くの電荷について読みます。
電荷を動かすと、その瞬間に遠くの $bold(E)$ の発散が変わるように見えます。

#strong[光より速く伝わっているように見えます。]

#check("拘束は因果律を破るか")[
  拘束は、各時刻の状態全体に課される式です。#strong[空間全体を一度に縛ります。]
  それなのに影響が光より速く伝わらないのは、なぜでしょうか。
][
  #strong[拘束は、独立に選べる量を減らしているだけだからです。]

  電荷を動かすと、拘束が言うのは「$bold(E)$ の発散がこう変わっている」です。
  #strong[$bold(E)$ そのものがどう変わるかは、言っていません。]

  実際に $bold(E)$ を決めるのは発展方程式で、そちらは時間微分を含みます。
  #strong[有限の速さで伝わります。]

  つまり、遠くで測っても何も変わりません。変わったことが伝わるのは、
  波が届いてからです。

  #link("/physics/gauge-theory/2")[ゲージ場の量子論 第 2 回]と同じ形です。
  あそこでも、拘束が余分な自由度を落としていました。
  #strong[拘束が縛っているのは、状態の数え方であって、状態そのものではありません。]
]

= 数えると二つ残る

自由度を数えます。

#link("/math/vector-analysis/3")[ベクトル解析 第 3 回]で、
ポテンシャル $A$ から $F = dif A$ として場を作りました。$A$ の成分は四つ。

そこから引きます。

#table(
  columns: (auto, auto, 1fr),
  [$A$ の成分], [$4$], [],
  [ゲージの自由], [$-1$], [$A arrow.r A + dif lambda$ で場が変わらない],
  [時間成分], [$-1$], [作用に $partial_t A_0$ が入らないので、発展しない],
  [残り], [$2$], [],
)

#theorem[
  電磁場の独立な自由度は $2$ である。
]<thm:two>

#strong[光の偏光が二つなのは、これです。] 横波が二通りで、縦波が無い。

@thm:two は、質量が無いことに寄りかかっています。
#link("/physics/gauge-theory/5")[ゲージ場の量子論 第 5 回]で、
質量を持つと縦波が加わって三つになると出ました。

#strong[偏光の数を数えることが、質量を測ることになっています。]

= 拘束の形が次元を縛っている

拘束の一本目を、点電荷について解きます。

$nabla dot bold(E) = rho slash epsilon_0$ を球面で積分すると、
球面を通る流れの総量が電荷で決まる。#strong[面積が $4 pi r^2$ なので]

$ E prop (1) / (r^2) $

#strong[指数が空間の次元から出ています。] 空間が $d$ 次元なら
球面の面積が $r^(d-1)$ なので、$E prop 1 slash r^(d-1)$。

$3$ 次元だから $2$ 乗です。#strong[測って合わせた数ではありません。]

だから、指数がずれていないかを測ると、#strong[空間が $3$ 次元であることと、
光子に質量が無いことを同時に試している]ことになります。

質量があれば $e^(-m r) slash r^2$ になり、遠くで急に落ちます。
#strong[実験は落ちないほうを支持しています。]

= 拘束を残したまま解けるとは限らない

@thm:preservation は、電荷保存があれば拘束が保たれると言っています。

#strong[数値で解くと、そのとおりになりません。]

計算機で電磁場を追うと、丸め誤差が入ります。誤差が拘束を破り、
#strong[破れが時間とともに増えていくことがあります。]

@thm:preservation は、拘束のずれの時間微分がゼロだと言っているだけです。
#strong[ずれが増えないとは言っていません。] ずれが自分自身を増やす形になっていると、
指数関数的に育ちます。

一般相対論で深刻になります。あちらも拘束と発展に分かれる形をしていて、
#strong[拘束の破れが解を壊すのが長く問題でした。]

書き方を変えて、ずれが減衰する形に組み直す。それで
#link("/physics/general-relativity/5")[重力波]の計算ができるようになりました。

#strong[方程式が正しいことと、解けることは違います。] @thm:preservation は
連続の世界の主張で、#strong[近似して解く側では、別に手当てが要ります。]
