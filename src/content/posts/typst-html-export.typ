#import "/src/typst/template.typ": post

#show: post.with(
  title: "Typst の HTML export でサイトを組む",
  date: "2026-08-16",
  tags: ("typst", "html", "build"),
  summary: "0.15 の MathML export を使って、ランタイム JS ゼロで数式を出す。",
)

= 何を解いたか

数式を含む文章を Web に載せるとき、これまでは数式ライブラリをクライアントに送るのが
当たり前だった。Typst 0.15 の MathML export はそれを不要にする。

= MathML で出る

インラインなら $E = m c^2$、別行立てならこう書く。

$ psi(x) = 1/sqrt(2 pi) integral_(-oo)^oo tilde(psi)(k) e^(i k x) dif k $

出力は `<math>` 要素そのもので、テキストとして選択できるしスクリーンリーダーも読む。
行列や場合分けも `<mtable>` に落ちる。

$ mat(1, 2; 3, 4) quad cases(a &= 1, b &= 2) $

== フォントだけが転送コスト

Typst は数式のイタリックを `<mi>E</mi>` ではなく U+1D400 台の実コードポイントで
出力する。この範囲を持つ数学フォントを 1 つ配る必要があり、それがこの構成の
ほぼ唯一の転送コストになる。

== 分担

構造と意味は Typst、見た目は CSS。この境界を守っている限り、同じソースから
PDF も出せる。
