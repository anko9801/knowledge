#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "対称性が L を決める",
  date: "2026-08-17",
  field: "physics",
  series: "mechanics",
  order: 3,
  tags: ("解析力学",),
  summary: "要請した対称性の不変量を数え上げると、書ける L が尽きる。自由粒子はそれだけで決まる。そして対称性は保存量を生む。",
  provides: (
    "lagrangian",
    "noether-theorem",
  ),
)


= 作れる不変量が一つしかない

#link("/physics/mechanics/2")[第 2 回]で $S = integral L thin dif t$ の形までは決まった。
だが $L$ の中身は空のままである。ここを埋めるのが対称性で、
それは一行でこう書ける。

#strong[理論を書くとは、要請した対称性の不変量を数え上げることである。]

作用を出発点にすると、手続きが立つ。

+ 場（または座標）を決める
+ 要請する対称性を決める
+ #strong[その対称性のもとで不変なスカラーを、作れるだけ数え上げる]
+ 作用はそれらの線形結合。決まらずに残るのは係数だけ

3 が回るのは、作用がスカラーだからである。
以下、同じ手続きが三つの場面でそのまま動くのを見る。

== 自由粒子：作れる不変量が一つしかない

まずは、最後まで自分の手で追える例から。
必要なのは Newton 力学だけで、途中に知らない語は一つも出てこない。

#example[
  何も力を受けていない粒子を考える。要請するのは次の三つだけである。

  + #strong[時間の一様性]。いつ実験しても同じ結果になる。$L$ は $t$ を陽に含まない
  + #strong[空間の一様性]。どこで実験しても同じ結果になる。$L$ は位置 $bold(r)$ を含まない
  + #strong[空間の等方性]。どちらを向いていても同じ結果になる。$L$ は速度の向きに依らない

  材料は速度 $bold(v)$ だけになった。
  そして 3 より、$L$ は $bold(v)$ の向きを変えても値が変わってはいけない。
  向きを変えても動かない量を $bold(v)$ から作ると、大きさ $abs(bold(v))$ か、
  その関数しかない。つまり#strong[作れる不変量は $v^2$ ただ一つ]で、$L = L(v^2)$ が確定する。

  残るのは $L$ が $v^2$ のどんな関数か、である。
  ここで #strong[Galilei の相対性]——等速で動く実験室でも法則は同じ——を要求すると、
  $L = a v^2$ の形しか残らない。定数 $a$ を $m \/ 2$ と書けば
  $ L = frac(1, 2) m v^2 $
  であり、これは運動エネルギーそのものである。
  最後の一段の計算は、この回の後半で行う。
]

見てほしいのは結果ではなく、#strong[何をしたか]である。
力は一度も書いていない。書いたのは「何を変えても結果が変わらないか」だけで、
そこから $L$ が出た。そして質量は、対称性から決まらなかった係数として最後に現れた。
数え上げが尽きたあとに残るのは、いつもこの種の定数である。

同じ手続きが、標準模型でも一般相対論でもそのまま動く。
そちらは#link("/physics/mechanics/5")[第 5 回]で見る。今回はもう一つ、
この手続きにただで付いてくるものを見ておきたい。#strong[保存則]である。

対称性を課すと $L$ が決まる、というのがここまでだった。
それだけでなく、対称性は#strong[保存量そのもの]を生む。
エネルギーも運動量も角運動量も、理論を決めたあとに出てくる量であって、
理論を決める側ではない。これを定理にしたのが Noether の定理である。

= 対称性を定式化する

まず「変わらない」を式にする。

#definition[
  一般化座標の変換の一パラメータ族
  $ q^k arrow.long.bar Q^k (q, t; epsilon), quad Q^k (q, t; 0) = q^k $
  を考える。この変換のもとでラグランジアンが
  $ L(Q, dot(Q), t) = L(q, dot(q), t) $
  をすべての $epsilon$ について満たすとき、この族を $L$ の#strong[対称性]と呼ぶ。
  また
  $ X^k := lr(frac(partial Q^k, partial epsilon) |)_(epsilon = 0) $
  を対称性の#strong[生成子]と呼ぶ。
]<def:symmetry>

$epsilon$ は変換の「量」である。平行移動なら移動距離、回転なら回転角にあたる。
生成子 $X^k$ は、$epsilon$ を微小にしたときに座標がどちらへ動くかを表すベクトルである。

= Noether の定理

#theorem("Noether")[
  @def:symmetry の意味での対称性があるとき、Euler--Lagrange 方程式の解に沿って
  $ J := sum_k frac(partial L, partial dot(q)^k) X^k $
  は時間に依らず一定である。
]<thm:noether>

#proof[
  対称性の条件を $epsilon$ で微分して $epsilon = 0$ とおく。
  $ 0 = lr(frac(partial, partial epsilon) L(Q, dot(Q), t) |)_(epsilon = 0)
    = sum_k (frac(partial L, partial q^k) X^k + frac(partial L, partial dot(q)^k) dot(X)^k) $
  である（$dot(Q)$ の $epsilon$ 微分が $dot(X)$ になるのは、
  $partial \/ partial epsilon$ と $dif \/ dif t$ が交換するからである）。

  ここで、解に沿っては Euler--Lagrange 方程式
  $ frac(partial L, partial q^k) = frac(dif, dif t) (frac(partial L, partial dot(q)^k)) $
  が成り立つ。代入すると
  $ 0 = sum_k (frac(dif, dif t)(frac(partial L, partial dot(q)^k)) X^k
      + frac(partial L, partial dot(q)^k) dot(X)^k)
    = frac(dif, dif t) (sum_k frac(partial L, partial dot(q)^k) X^k) $
  となり、$J$ が保存する。
]

証明は実質三行である。やっていることは、
「対称性の条件」と「運動方程式」という二つの式を突き合わせて、
積の微分の形に組み直しただけである。

#remark[
  ラグランジアンの非一意性（#link("/physics/mechanics/2")[第 2 回]）で見たように、$L$ は全微分の分だけ変えても同じ運動を与える。
  したがって対称性の条件も
  $ L(Q, dot(Q), t) = L(q, dot(q), t) + epsilon frac(dif, dif t) F(q, t) + O(epsilon^2) $
  まで緩めてよい。この場合、保存量は
  $ J = sum_k frac(partial L, partial dot(q)^k) X^k - F $
  になる。証明は上とまったく同じで、右辺の余分な項が $F$ の時間微分として現れるだけである。
  この緩めた形は、後で Galilei 変換を扱うときに必要になる。
]

= 三つの保存則

具体的な変換を入れてみる。以下、$N$ 個の質点の系を直交座標で書き、

$ L = sum_i frac(1,2) m_i abs(dot(bold(r))_i)^2 - U(bold(r)_1, dots, bold(r)_N) $
とする。

#corollary("運動量保存")[
  $U$ が全体の平行移動で変わらないなら、全運動量
  $ bold(P) := sum_i m_i dot(bold(r))_i $
  は保存する。
]<cor:momentum>

#proof[
  $bold(r)_i arrow.bar bold(r)_i + epsilon bold(n)$（$bold(n)$ は定ベクトル）を考える。
  速度は変わらないので $T$ は不変、$U$ は仮定より不変である。生成子は $bold(X)_i = bold(n)$ なので
  $ J = sum_i m_i dot(bold(r))_i dot bold(n) = bold(P) dot bold(n) $
  が保存する。$bold(n)$ は任意なので $bold(P)$ の各成分が保存する。
]

#corollary("角運動量保存")[
  $U$ が全体の回転で変わらないなら、全角運動量
  $ bold(L) := sum_i m_i bold(r)_i times dot(bold(r))_i $
  は保存する。
]<cor:angular-momentum>

#proof[
  軸 $bold(n)$ まわりの微小回転は $bold(r)_i arrow.bar bold(r)_i + epsilon thin bold(n) times bold(r)_i$ である。
  生成子は $bold(X)_i = bold(n) times bold(r)_i$ なので
  $ J = sum_i m_i dot(bold(r))_i dot (bold(n) times bold(r)_i)
    = bold(n) dot sum_i m_i (bold(r)_i times dot(bold(r))_i) = bold(n) dot bold(L) $
  が保存する。スカラー三重積の順序を入れ替えただけである。
]

エネルギーだけは、@thm:noether の形に素直には収まらない。
座標の変換ではなく時間の変換に対応するからである。別に扱う。

#theorem("エネルギー保存")[
  $L$ が時間 $t$ を陽に含まないならば、
  $ E := sum_k frac(partial L, partial dot(q)^k) dot(q)^k - L $
  は保存する。
]<thm:energy>

#proof[
  解に沿って $L$ を時間微分する。
  $ frac(dif L, dif t) = sum_k (frac(partial L, partial q^k) dot(q)^k
    + frac(partial L, partial dot(q)^k) dot.double(q)^k) $
  であり（$partial L \/ partial t = 0$ を使った）、
  第一項に Euler--Lagrange 方程式を代入すると
  $ frac(dif L, dif t) = sum_k (frac(dif, dif t)(frac(partial L, partial dot(q)^k)) dot(q)^k
    + frac(partial L, partial dot(q)^k) dot.double(q)^k)
    = frac(dif, dif t) (sum_k frac(partial L, partial dot(q)^k) dot(q)^k) $
  である。移項すれば $dif E \/ dif t = 0$ となる。
]

#proposition[
  拘束が時間に依らず（$partial bold(r)_i \/ partial t = 0$）、
  $U$ が速度を含まないならば $E = T + U$ である。
]<prop:energy-is-T-plus-U>

#proof[
  仮定より
  $ bold(v)_i = sum_k frac(partial bold(r)_i, partial q^k) dot(q)^k $
  なので、$T$ は $dot(q)$ の二次同次式である。すなわち
  $ T = sum_(j k) a_(j k)(q) dot(q)^j dot(q)^k $
  の形で、Euler の同次関数定理より
  $ sum_k frac(partial T, partial dot(q)^k) dot(q)^k = 2 T $
  が成り立つ。$partial U \/ partial dot(q)^k = 0$ だから
  $ E = 2 T - (T - U) = T + U $
  である。
]

つまり「エネルギー $= T + U$」は定義ではなく、条件つきの結論である。
拘束が時間に依存して動く場合（回転する棒に通したビーズなど）、
保存するのは $E$ のほうであって $T + U$ ではない。
この区別は、後の回の Hamilton 形式で $E$ が主役になったときにも効いてくる。

#table(
  columns: (auto, 1fr),
  [空間の一様性], [運動量が保存する],
  [空間の等方性], [角運動量が保存する],
  [時間の一様性], [エネルギーが保存する],
)

三つの保存則が、三つの対称性の言い換えとして並んだ。
これが Noether の定理のいちばん有名な帰結である。

= 対称性からラグランジアンを決める

さらに踏み込むと、対称性は保存量を与えるだけでなく、
$L$ の形そのものを絞り込む。この回の前半で結論だけ書いた、
このシリーズの動機そのものにあたる部分である。

#example("自由粒子のラグランジアン")[
  慣性系にいる自由粒子を考える。要請するのは次の三つだけである。

  + 時間の一様性：$L$ は $t$ を陽に含まない
  + 空間の一様性：$L$ は位置 $bold(r)$ を含まない
  + 空間の等方性：$L$ は速度の向きに依らない

  1 と 2 より $L = L(bold(v))$、3 より $L$ は $abs(bold(v))^2$ のみの関数、
  つまり $L = L(v^2)$（$v^2 := abs(bold(v))^2$）となる。

  ここに Galilei 変換の要請を加える。速度 $bold(w)$ の慣性系へ移ると
  $bold(v) arrow.bar bold(v) + bold(w)$ だが、運動方程式は変わってはいけない。
  #link("/physics/mechanics/2")[第 2 回]より、$L$ は全微分の差までしか変わってよくない。

  $bold(w)$ が微小なら
  $ L((bold(v) + bold(w))^2) = L(v^2) + frac(partial L, partial v^2) thin 2 bold(v) dot bold(w) + O(w^2) $
  である。第二項が $bold(r)$ の全微分になるためには、
  $bold(v) = dif bold(r) \/ dif t$ の係数が定数でなければならない。
  すなわち $partial L \/ partial v^2$ は $v^2$ に依らない定数である。よって
  $ L = a v^2 $
  の形に決まる（定数項は全微分として捨ててよい）。$a =: m \/ 2$ と書けば
  $ L = frac(1,2) m v^2 $
  という見慣れた形になる。
]

この議論の来歴は Landau と Lifshitz の教科書で、力学を対称性から組み立てる筋書きの出発点になっている。
面白いのは、質量が「対称性から決まらなかった残りの定数」として現れる点である。
$a$ の値は理論からは出てこない。物質に固有の量として、外から与えるしかない。

#remark[
  同じ発想は現代物理の作法そのものになっている。
  場の理論では、要請する対称性（Lorentz 不変性、ゲージ対称性、繰り込み可能性）を並べると、
  書ける作用の形がほとんど決まってしまう。
  標準模型のラグランジアンも、対称性と場の内容を決めた時点でほぼ一意に定まる。

  「何を仮定したのか」を追う立場からすると、これは気持ちのよい構造である。
  仮定するのは対称性であって、方程式ではない。
]

= 対称性がなくても保存量はある

誤解を避けるために一つ書いておく。@thm:noether は
「対称性 $=>$ 保存量」であって、逆は一般に成り立たない。

Kepler 問題には、エネルギーと角運動量のほかに
Laplace--Runge--Lenz ベクトルという保存量がある。
これは座標の点変換としての対称性からは出てこない。
位相空間全体での変換（正準変換）まで許すと対称性として捉えられるようになるのだが、
そのためには後の回の枠組みが必要になる。

対称性と保存量の対応は、Lagrange 形式ではまだ片側だけである。
両者がきれいに一対一で対応するのは Hamilton 形式に移ってからで、
そこでは保存量そのものが変換の生成子になる。Hamilton 形式は後の回で扱う。

#check[
  @thm:noether が「対称性 $arrow.r.double$ 保存量」の片側しか言えないのは、
  定理の証明が弱いからではない。#strong[何を対称性と呼ぶかを、狭く決めていた]からである。
  どこを狭く取っていたか。
][
  #strong[座標だけを動かす変換]に限っていた。$q arrow q + epsilon delta q$ の形である。

  Laplace--Runge--Lenz ベクトルを生む変換は、この形に書けない。位置と運動量を
  混ぜて動かす必要がある。Lagrange 形式は速度を位置の従属物として扱うので、
  そういう変換を書く場所が無い。

  だから足りないのは定理ではなく#strong[変換を書ける舞台]のほうで、
  位相空間を対等な座標として扱う Hamilton 形式に移ると、保存量そのものが
  変換の生成子になって対応が一対一になる。

  「逆が言えない」と聞くと定理の限界に見えるが、実際には
  #strong[こちらが対称性の定義を絞っていた]という話だった。
]

次回はいったん力学へ戻り、ここまでの形式が Newton 力学を含むことを確かめる。
