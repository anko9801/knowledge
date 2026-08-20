// 層バッジ。
//
// 幾何の連載は「どの構造を仮定したか」を軸にしている。読者が毎回それを意識できるよう、
// 記事の冒頭に「何を仮定したか」「計量を使うか」を一行で出す。
//
// 判断の材料になるのは計量の有無なので、そこだけ data 属性に出して CSS で色を変える。
// テンプレートと同じ方針で、html target には構造と意味だけを出す。

#let layer(tag, metric: false, body) = context {
  let mark = if metric [計量：使う] else [計量：使わない]

  if target() == "html" {
    html.elem(
      "div",
      attrs: (class: "layer", "data-metric": if metric { "yes" } else { "no" }),
      {
        html.elem("span", attrs: (class: "layer-tag"), tag)
        html.elem("span", attrs: (class: "layer-metric"), mark)
        html.elem("span", attrs: (class: "layer-note"), body)
      },
    )
  } else {
    block(
      width: 100%,
      inset: (left: 0.9em, y: 0.4em),
      stroke: (left: 1.5pt + luma(160)),
      text(size: 9pt, fill: luma(80))[#tag ／ #mark ／ #body],
    )
  }
}
