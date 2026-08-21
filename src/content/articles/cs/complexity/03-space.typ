#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "空間は使い回せる",
  date: "2026-08-21",
  field: "cs",
  series: "complexity",
  order: 3,
  tags: ("計算量理論",),
  summary: "時間は一度使ったら戻らないが、空間は消して書き直せる。この違いだけで、非決定性の扱いが時間と空間で正反対になる。乱択を許すとどうなるかも、同じ枠で測れる。",
  provides: (
    "space-complexity",
    "karp-reductions",
    "randomized-complexity",
  ),
)

= 当てずっぽうが、ただになる

非決定性 Turing 機械は、分岐のたびに正しいほうを当てられる機械である。
実在しない。$upright("P")$ と $upright("NP")$ が同じかどうかが未解決なのは、
時間で測るかぎり、この「当てられる」という反則が効いてしまうからである。

ところが#strong[空間で測ると、この反則が消える。]

$ upright("NPSPACE") = upright("PSPACE") $

当てずっぽうを許した機械と、許さない機械が、同じ問題を解く。
しかも証明は難しくない。二乗しか損をしない（Savitch）。

時間では $50$ 年以上決着していないことが、空間では一行で片づく。
#strong[同じ「非決定性」なのに、測る資源を替えただけで様子が変わる。]

理由は、資源そのものの性質にある。

#strong[時間は使い切りだが、空間は使い回せる。]

同じ升目を何度でも消して書き直せる。だから空間の側では、
「全部の可能性を順に試す」ことが安くできる。

#definition[
  + $upright("L")$：対数空間で解ける（入力は読み取り専用で数えない）
  + $upright("PSPACE")$：多項式空間で解ける
  + $upright("NL")$、$upright("NPSPACE")$：それぞれの非決定性版
]<def:space-classes>

= 非決定性が消える

時間の側では $upright("P") =^? upright("NP")$ が未解決だった。
空間の側では、対応する問いが#strong[解けている]。

#theorem("Savitch、1970 年")[
  $ upright("NSPACE")(f) subset upright("SPACE")(f^2) $
  とくに $upright("NPSPACE") = upright("PSPACE")$。
]<thm:savitch>

#proof[
  「状態 $u$ から $v$ へ $2^k$ ステップ以内で行けるか」を
  $ upright("REACH")(u, v, k) $
  と書き、中間点 $w$ を全部試して
  $ upright("REACH")(u, w, k-1) upright(" かつ ") upright("REACH")(w, v, k-1) $
  で再帰する。

  再帰の深さは $k$、各段で覚えるのは $w$ ひとつぶん。
  #strong[中間点を試すたびに、前の試行の記録は消してよい。]
  だから空間は深さ $times$ 一段ぶん $= O(f^2)$ で済む。
]

#strong[時間なら爆発するが、空間なら使い回せるので済む。]
これが時間と空間の差である。

#example[時間で同じことをすると][
  同じ再帰を時間で測ると、各段で $2$ 回呼ぶので $2^k$ 回になる。
  時間は使い回せないので、そのまま指数時間である。

  空間だけが節約できる。#strong[同じアルゴリズムが、資源によって評価が変わる。]
]

#check[
  @thm:savitch の証明は、中間点を全部試す再帰である。
  試す個数は指数的に多く、実際に時間で測れば指数時間になる。
  #strong[同じ手続きなのに、空間だけが多項式で済むのはなぜか。]
][
  #strong[時間は使い切りで、空間は使い回せるからである。]

  時間は消費したら戻らない。$2^k$ 回呼べば $2^k$ 歩ぶん進むしかなく、
  途中の呼び出しが終わっても、使った時間は返ってこない。

  空間は返ってくる。中間点 $w$ を一つ試し終えたら、その記録を消して
  次の $w$ に同じ升目を使える。#strong[同時に生きている必要があるのは、
  再帰の深さのぶんだけ]で、それは $k$ 段しかない。

  だから同じ木を歩いても、時間は葉の数を数え、空間は深さを数える。
  上の表で時間の側だけが未解決なのも、この非対称から来ている。
]

#theorem("Immerman--Szelepcsényi、1987 年")[
  $upright("NSPACE")(f) = upright("co-NSPACE")(f)$。とくに $upright("NL") = upright("co-NL")$。
]<thm:immerman>

時間の側では $upright("NP") =^? upright("co-NP")$ が未解決である。
#strong[空間では補集合を取っても変わらない。]やはり使い回せるからである。

#table(
  columns: (auto, auto, 1fr),
  [], [時間], [空間],
  [非決定性], [$upright("P") =^? upright("NP")$ 未解決], [$upright("PSPACE") = upright("NPSPACE")$ 解決],
  [補集合], [$upright("NP") =^? upright("co-NP")$ 未解決], [$upright("NL") = upright("co-NL")$ 解決],
  [階層定理], [成り立つ], [成り立つ],
)

#strong[時間の側だけが分かっていない。]
資源の性質が違うので、同じ問いでも難しさが違う。

= 乱択を許す

もう一つ資源を足す。硬貨を投げてよいことにする。

#definition[
  + $upright("BPP")$：多項式時間で、誤り確率 $1\/3$ 以下で判定できる
  + $upright("RP")$：片側だけ誤る版
  + $upright("ZPP")$：常に正しいが、期待時間が多項式
]<def:randomized>

誤り確率 $1\/3$ は緩く見えるが、
#strong[独立に何度も走らせて多数決を取れば、指数的に小さくできる]。
#link("/math/measure/4")[測度と確率 第 4 回]の集中不等式がそのまま効く。

$k$ 回の多数決で誤り確率が $2^(-Omega(k))$ になるので、
$1\/3$ でも $1\/2 - epsilon$ でも実質同じである。

#example[乱択が効く問題][
  多項式が恒等的に $0$ かを判定する問題は、
  展開すると項が指数的に増えるが、乱数を代入して $0$ になるか見るだけで
  高い確率で判定できる（Schwartz--Zippel）。

  素数判定も長らく乱択でしか多項式時間にならなかったが、
  $2002$ 年に決定的な多項式時間アルゴリズムが見つかった（AKS）。
]

$upright("P") subset upright("BPP") subset upright("PSPACE")$ は分かっている。
そして#strong[$upright("P") = upright("BPP")$ が予想されている]。

理由は、良い擬似乱数生成器が存在すれば乱数を置き換えられるからで、
そして「存在しない」ことのほうが難しい（回路計算量の下界が要る）。
#strong[乱数は本質的な資源ではないだろう、というのが現在の見方]である。

#remark[
  量子計算は別である。$upright("BQP")$ が $upright("BPP")$ に等しいとは思われていない。
  素因数分解が $upright("BQP")$ にある（Shor）ことが、その根拠になっている。

  #link("/physics/quantum/3")[量子力学 第 3 回]で見たとおり、
  合成系の状態空間は次元が積で増える。
  その大きさを計算資源として使えるかどうか、が争点である。
]

= 何が分かっているか

計算量理論の現状を並べておく。

#table(
  columns: (auto, 1fr),
  [分かっている], [階層定理（時間・空間）、Savitch、Immerman--Szelepcsényi、Cook--Levin],
  [分かっていない], [$upright("P") =^? upright("NP")$、$upright("NP") =^? upright("co-NP")$、$upright("P") =^? upright("PSPACE")$、$upright("L") =^? upright("P")$],
  [障害も分かっている], [相対化、自然な証明、代数化],
)

#strong[何が難しいのかは詳しく分かっている。]それでも解けていない。

= 連載を閉じる

#table(
  columns: (auto, 1fr),
  [計算量], [終わるかではなく、どれだけの資源で],
  [帰着], [難しさを移す。依存が主張として明示される],
  [NP 完全], [Cook--Levin から Karp の連鎖へ],
  [空間], [使い回せるので、非決定性が消える],
  [乱択], [多数決で誤りを潰せる。本質的な資源ではなさそう],
)

#link("/math/logic/8")[数理論理学 第 8 回]で
「決定できない問題がある」を示した。
その続きとして、#strong[決定できる問題の中にも階層がある]ことを見たことになる。

そして手口は最後まで同じだった。
対角化で階層を作り、帰着で難しさを移す。
どちらも#link("/math/set-theory/4")[Cantor]から続いている。
