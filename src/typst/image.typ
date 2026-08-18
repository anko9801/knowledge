// 図版の出し方を出力先で分ける。
//
// Typst の HTML export は image() を base64 の data URI として埋め込む。
// 写真が数枚あるだけでページが 10MB を超え、キャッシュも遅延読み込みも効かない。
// html target のときは <img> を出して、実体は public/ から配信する。
//
// paged target では従来どおり image() を使う。PDF には実体が要るため。

/// コンパイル時のパスから、配信時の URL を作る。
///
/// public/ 以下がサイトのルートに載るので、その分を落とす。
/// GitHub Pages のようにサイトがサブパスに載る場合は、ビルド時入力
/// `--input base=/knowledge/` で前置きを受け取る。
#let _base = sys.inputs.at("base", default: "/")

#let _web-path(path) = {
  let rooted = if path.starts-with("/public/") {
    path.slice("/public/".len())
  } else if path.starts-with("/") {
    path.slice(1)
  } else {
    path
  }
  _base + rooted
}

/// #image と同じ場所で使える。名前付き引数はそのまま渡す。
#let web-image(path, alt: none, ..args) = context {
  if target() == "html" {
    html.elem(
      "img",
      attrs: (
        src: _web-path(path),
        loading: "lazy",
        decoding: "async",
        alt: if alt == none { "" } else { alt },
      ),
    )
  } else {
    image(path, ..args)
  }
}
