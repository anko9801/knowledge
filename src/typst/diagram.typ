// 図。
//
// Typst の HTML export は place も line も**黙って落とす**（警告だけ出して本文には
// 何も残らない）。図を出すには html.frame() で SVG として埋め込むしかない。
// PDF 側はそのまま組めるので、target() で分ける。
//
// 色は**黒とその透明度だけ**を使う。SVG に色が焼き込まれるので、地の色を指定すると
// ダークモードで見えなくなる。黒は global.css が属性セレクタで currentColor に
// 差し替えるようにしてあり、そこで使える濃さがこの三つに限られる。
//
//   ink       #000000    主線。関数のグラフ、軸
//   ink-thin  #00000066  補助線。刻み目
//   ink-wash  #0000001f  面。強調した帯
//   white     #ffffff    紙。穴を抜く、線を跨がせる（地の色に追従する）
//
// 濃さを増やすときは global.css のセレクタも足すこと。足さないと、その線だけ
// 黒のまま残ってダークモードで消える。

#let ink = black
#let ink-thin = black.transparentize(60%)
#let ink-wash = black.transparentize(88%)

/// 図をひとつ置く。番号は振らない（主張の通し番号を乱さないため）。
#let diagram(body, caption: none) = context {
  if target() == "html" {
    html.elem("figure", attrs: (class: "diagram"), {
      html.frame(body)
      if caption != none {
        html.elem("figcaption", caption)
      }
    })
  } else {
    figure(body, caption: caption, numbering: none, supplement: none)
  }
}
