#import "/src/typst/template.typ": post

#show: post.with(
  title: "場の理論",
  date: "2026-08-16",
  tags: ("ノート",),
  summary: "note/quantum_field_theory.tex から変換",
)

= 量子力学
<量子力学>
"銀を"熱して飛ばした銀原子を不均一磁場に通す。
電子は原子をくるくる回っているので角運動量があり、磁束が出来上がっている。これをスピンと呼ぶ。
$z$ 方向と $x$ 方向の 2 種類通すことを考える。 $z$ 方向で
$S_z plus.minus$ が出てきて $S_z +$ を取り出し、$x$ 方向で

光の偏光について縦フィルターを通してから横フィルターを通しても光量ゼロなのに縦と横の間に斜め
45 度フィルターを通すと光が出てくる。

#block[
$cal(H)$ がヒルベルト空間であるとは、$H$
は複素内積空間であって、さらに内積によって誘導される距離関数に関して完備距離空間をなすことを言う。
$ chevron.l y \, x chevron.r & = chevron.l x \, y chevron.r^(\*)\
chevron.l a x_1 + b x_2 \, y chevron.r & = a chevron.l x_1 \, y chevron.r + b chevron.l x_2 \, y chevron.r\
chevron.l x \, x chevron.r & gt.eq 0 \, quad chevron.l x \, x chevron.r = 0 arrow.l.r.double x = 0 $

]
$cal(H)$ に内積が！ $cal(H)^(\*)$ $f : V arrow.r W$ $"Hom" \( V \, W \)$
$ \( \|a⟩ \, \|a⟩ \) = ⟨a mid(bar.v) a⟩\
a^(\*) ⟨a\| $ $V$ $V$ 関数との関係とは？

#block[
代数を構築す"るケ"ット空間

]
#block[
内"積ケ"ット空間のコベクトルとしてブラ空間がある。 双対空間 $V^(\*)$
コベクトル空間 $V^or = "Hom" \( V \, bb(R) \)$

]
無限次元ベクトル表現を持つ

= 場の理論
<場の理論>
#block[
いかなる粒子状態も粒子交換に関して位相を除いて不変である. 組み紐群

]
テンソルは定数
