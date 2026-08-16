# knowledge

`.typ` で書いて、Typst 0.15 の HTML export でビルド時に HTML 化し、Astro に流す。
同じソースから PDF も出せる。**ランタイム JS はゼロ**で、転送されるのは HTML と
CSS、それに数学フォント 1 本だけ。

## パイプライン

```
src/content/posts/*.typ
  ├─ typst compile --format html --features html  →  <body> の中身
  └─ typst eval 'query(<fm>).first().value'       →  front matter (JSON)
        ↓  src/lib/typst-loader.ts (Astro Content Loader)
      Content Collection (zod で検証)
        ↓
      src/pages/posts/[...slug].astro  →  <Content />
```

front matter を HTML から復元しない、というのが構成の要。`typst eval` は paged
target のまま動くので `--features html` すら要らず、見出し構造を変えてもビルドが
巻き込まれない。

| ファイル | 役割 |
| --- | --- |
| `flake.nix` | typst 0.15 を unstable から取る devShell |
| `src/typst/template.typ` | `target()` で HTML / PDF を分岐する共有テンプレート |
| `src/lib/typst-cli.ts` | `typst compile` / `typst eval` の薄いラッパ |
| `src/lib/typst-html.ts` | 出力文書を body / head / lang に切り分ける |
| `src/lib/typst-loader.ts` | Astro Content Loader（digest でキャッシュ、`.typ` を watch） |
| `src/content.config.ts` | front matter の zod スキーマ |
| `src/layouts/*.astro` | ページの外枠と記事の外枠 |
| `src/pages/` | 一覧 (`index.astro`) と記事 (`posts/[...slug].astro`) |
| `src/styles/global.css` | 見た目。和文組版の progressive enhancement もここ |
| `scripts/emit-math-css.mjs` | MathML 用 stylesheet を 1 度だけ回収 |
| `scripts/subset-math-font.sh` | 数学フォントを woff2 にサブセット |

## 使い方

```sh
nix develop                 # typst 0.15.1 + node 22 + fonttools/brotli + STIX Two Math
npm install
npm run fonts               # public/fonts/math.woff2 を生成（初回のみ）
npm run dev                 # prebuild で typst-math.css も生成される
npm run build
npm run check               # astro check（型）
```

devShell の外で回すときは、typst 0.15 の場所とサブセット元フォントを環境変数で渡す。

```sh
TYPST_BIN=/path/to/typst-0.15.1/bin/typst npm run build
MATH_FONT=/path/to/STIXTwoMath-Regular.otf npm run fonts
```

Astro を通さず組版だけ見たいときは typst 単体でよい。live-reload の HTTP サーバが立つ
（ポートは既定で 3000–3005 の空き）。

```sh
typst watch src/content/posts/foo.typ --format html --features html --root .
```

PDF は同じソースからそのまま出る。

```sh
typst compile src/content/posts/foo.typ --root . foo.pdf
```

## 記事の書き方

```typst
#import "/src/typst/template.typ": post

#show: post.with(
  title: "記事タイトル",
  date: "2026-08-16",
  tags: ("typst", "html"),
  summary: "一覧と description に出る一行。",
)

= 最初の見出し
```

`template.typ` が `lang: "ja"` の設定と `<fm>` ラベル付き `#metadata` を面倒みる。
`draft: true` を渡すとビルド対象から外れる。

## 踏んだ穴（すべて typst 0.15.1 の実出力で確認済み）

**1. `<head>` の stylesheet を落とすと数式が崩れる**

Typst は MathML 用の CSS（1494 bytes）を**全ページの `<head>` に丸ごと**注入する。
body だけ抜き出す構成では必ず落ちる。かといってページ毎にインライン化すると記事数ぶん
重複するので、`emit-math-css.mjs` で 1 度だけ回収して `src/styles/typst-math.css`
として共有配布している。typst を上げたら再実行して差分を見ること。

**2. Astro の既定設定がその共有配布を台無しにする**

`build.inlineStylesheets` の既定は `'auto'` で、4kB 未満の CSS を**各ページに
インライン展開する**。1 で 1 度だけ回収した意味がここで消えるので、
`astro.config.mjs` で `'never'` にしてある。リクエストが 1 本増える代わりに、
全ページで同じ CSS を使い回してキャッシュが効く。

**3. 数学フォントの配布は必須（任意の上乗せではない）**

Typst は `<mi>E</mi>` ではなく U+1D438 (𝐸) のような Mathematical Alphanumeric
Symbols を**実コードポイントとして**出力する。このブロックを持たない本文フォントでは
豆腐になる。`npm run fonts` が以下の範囲でサブセットする（STIX Two Math で 182KB）。
元フォントは `flake.nix` が `MATH_FONT` で渡すので、`fc-list` の結果に依存しない。
`ssty` / `dtls` は Typst の CSS が参照するので必ず残すこと。MATH テーブルが落ちると
組版の寸法が全部狂うため、スクリプトが生成後に MATH と主要コードポイントを検査する。

```
U+0370-03FF ギリシャ / U+2100-214F 文字様記号 / U+2190-21FF 矢印
U+2200-22FF 演算子   / U+27E6-27FF 括弧       / U+1D400-1D7FF 数式用英数字
```

**4. 別行立て数式の CSS は `display: block math`**

長い数式を横スクロールで逃がそうとして `math[display="block"] { display: block }` と
書くと、MathML のレイアウトアルゴリズムが CSS の通常ブロックで上書きされ、分数・
根号・積分が縦に潰れる。`block math` と書くこと。HTML だけ見ても気づけないので、
数式まわりを触ったらブラウザで実物を見る。

**5. 見出しレベルが 1 つずれる**

`=` → `<h2>`、`==` → `<h3>`、`===` → `<h4>`（実測）。`<h1>` は文書タイトルぶん
空けてある。ページの `<h1>` は front matter の `title` から `PostLayout` が出す前提
なので、この構成では都合がいい。ただし `=` を 5 段重ねると `<h6>` で頭打ちになる。

**6. `lang` の既定は `en`**

`#set text(lang: "ja")` を書かないと `<html lang="en">` になる。和文の
`text-spacing-trim`（約物詰め）や `word-break: auto-phrase` は lang に依存するので、
書き忘れるとこれらが黙って無効になる。`template.typ` が設定し、loader が検証して
ズレていれば警告する。

**7. nixpkgs stable の typst は 0.14.2**

MathML export は 0.15 から。`flake.nix` で typst だけ unstable（0.15.1）から取っている。

**8. HTML export は experimental**

`--features html` が要る。公式に production 非推奨で、未対応要素や show rule の穴を
たまに踏む。回避の show rule を書くか upstream にパッチを送る。`target()` だけは
0.15 からフラグ無しで使えるので、PDF ビルド側では `TYPST_FEATURES` を立てなくていい。

HTML に写像できない精密レイアウト（`place`、回転、視覚配置目的の `grid`）は SVG 島
として埋め込まれる。図や cetz のプロットには適材適所だが、本文で多用すると「重い」に
戻るので、本文はフローに乗る書き方に寄せる。
