# ビルドの仕組み

ここは**仕組みの説明**。docs は三つに分かれている。

| | 何が書いてあるか | いつ読むか |
| --- | --- | --- |
| build.md | 作り方。typst、Astro、フォント、踏んだ穴 | 仕組みを触るとき |
| [reader.md](reader.md) | 読み手に何を出すか。書き出しの型、文体、想起の問い | **記事を書く前** |
| [decisions.md](decisions.md) | セッションをまたぐ決めごとと、まだ決めていないこと | **連載の構成を変える前** |

`.typ` で書いて、Typst 0.15 の HTML export でビルド時に HTML 化し、Astro に流す。
同じソースから PDF も出せる。転送されるのは HTML と CSS、それにフォントが 4 本
（数学・黒板文字・本文の欧文・コードの等幅）。

JS は 5 つだけで、いずれも無くても読める補助にとどめてある。全文検索（最初の入力まで
索引を読まない）、目次のスクロール追従、サイドバーを現在地まで送る処理、読んだ記事の
記録（localStorage、端末内のみ）、コードを持ち出すボタン。骨格の開閉は `<details>` と
チェックボックスで、CSS だけで動く。

**コピーのボタンは JS が生やす。** 静的な HTML に置くと、JS が落ちた環境に
「押しても何も起きないボタン」が残る。クリップボードに触れないブラウザでも同じなので、
`navigator.clipboard` がある場合にだけ足している（`src/components/CodeCopy.astro`）。
無くても選択してコピーできる。

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

front matter を HTML から復元しない、というのが構成の要。メタデータを別経路で取るので、
見出し構造を変えてもビルドが巻き込まれない。

| ファイル | 役割 |
| --- | --- |
| `flake.nix` | typst 0.15 を unstable から取る devShell |
| `src/typst/template.typ` | `target()` で HTML / PDF を分岐する共有テンプレート |
| `src/typst/diagram.typ` | 図。HTML には `html.frame()` で SVG、PDF には `figure` |
| `src/lib/typst-cli.ts` | `typst compile` / `typst eval` の薄いラッパ |
| `src/lib/typst-html.ts` | 出力文書を body / head / lang に切り分ける |
| `src/lib/headings.ts` | 見出しに id を振り、目次用の一覧を取り出す |
| `src/lib/peek.ts` | 参照点に、指す先の主張を添える（飛ばずに読めるように） |
| `src/lib/shiki.ts` | コードの強調を Shiki で組み直す（ビルド時。明暗の二枚を焼く） |
| `src/lib/page-peek.ts` | 記事をまたぐリンクに、行き先の記事の中身を添える |
| `src/lib/neighbors.ts` | 概念グラフから、その回の前提と下流を引く（純関数） |
| `src/lib/concept-page.ts` | 概念の索引を組む。語で来た読者を記事へ送る（純関数） |
| `src/lib/typst-in-markdown.ts` | .md に漏れた Typst 記法を見つける（`npm test` が実ファイルに当てる） |
| `src/lib/nav.ts` | サイドバーの素材を Content Collection から集める |
| `src/lib/nav-scope.ts` | 今いる文脈に合わせて、出す範囲を絞る（純関数） |
| `src/lib/typst-loader.ts` | Astro Content Loader（digest でキャッシュ、`.typ` を watch） |
| `src/lib/pool.ts` | 同時実行数を絞って並べる（typst の起動を CPU 数まで） |
| `src/content.config.ts` | front matter の zod スキーマと、キャッシュを無効化する依存 |
| `src/layouts/*.astro` | ページの外枠と記事の外枠 |
| `src/components/Sidebar.astro` | 左の柱。サイト内の案内と検索 |
| `src/components/Toc.astro` | 右の柱。そのページの見出しとスクロール追従 |
| `src/styles/layout.css` | 3 段組の骨格と、幅に応じた畳み方 |
| `src/pages/` | 一覧 (`index.astro`) と記事 (`posts/[...slug].astro`) |
| `src/styles/global.css` | 見た目。和文組版の progressive enhancement もここ |
| `scripts/emit-math-css.mjs` | MathML 用 stylesheet を 1 度だけ回収 |
| `scripts/subset-math-font.sh` | 数学フォントを woff2 にサブセット |
| `scripts/subset-text-font.sh` | 本文の欧文（Latin Modern Roman） |
| `scripts/subset-mono-font.sh` | コードの等幅（Latin Modern Mono Light） |
| `scripts/subset-mathbb-font.sh` | 黒板文字だけ別書体から切り出す |
| `scripts/latex/preprocess.mjs` | LaTeX の区切り記号マクロを素の LaTeX に均す |
| `scripts/latex/repair-typst.mjs` | pandoc 出力を Typst 0.15 が通る形に直す |
| `scripts/latex/to-typst.mjs` | .tex を一括変換して `src/content/notes` に置く |

## 使い方

```sh
nix develop                 # typst 0.15.1 / node 24 / fonttools / Latin Modern / pandoc
npm install
npm run fonts               # src/fonts/*.woff2 を生成（初回のみ）
npm run dev                 # prebuild で typst-math.css も生成される
npm run build
npm run check               # astro check（型）
npm run verify              # check + test。CI もこれを通してから公開する
```

devShell の外で回すときは、typst 0.15 の場所とサブセット元フォントを環境変数で渡す。

```sh
TYPST_BIN=/path/to/typst-0.15.1/bin/typst npm run build
MATH_FONT=/path/to/latinmodern-math.otf npm run fonts
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

### PDF も配る

**`postbuild` が記事 86 本を PDF にして `dist` へ置く**（`scripts/emit-pdf.mjs`）。
URL は HTML と揃えてあり、`/math/measure/2.html` の隣に `/math/measure/2.pdf` が出る。
記事の日付の横に導線がある。

紙面の組み方は `template.typ` の `paged` 側が持っている。A4、柱、通し番号。
想起の問いは答えを開いた形で並ぶ（`<details>` が畳めないので）。

| | |
| --- | --- |
| 費用 | 1 本 0.2 秒、86 本で数秒。`dist` が 27M → 47M |
| 並列 | CPU 数 − 1 まで。typst の起動が支配的なので、並べるだけで縮む |
| 失敗 | 1 本落ちても止めない。HTML は読めるので、記録だけ残して先へ進む |

**和文フォントを `fc-list` に任せない。** CI には Noto Serif CJK が無いので、
任せると和文が豆腐のまま 86 本が出る。**PDF なので開くまで気づけない。**
`flake.nix` が `PDF_FONT_PATH` を渡し、`emit-pdf.mjs` が `--font-path` で
typst へ食わせる。HTML 側のフォントとは経路が別なので、片方だけ直しても直らない。

## 依存の版

| | 版 | 備考 |
| --- | --- | --- |
| typst | 0.15.1 | MathML export は 0.15 から。`flake.nix` が unstable から取る |
| Node | 24 | Astro 7 の要求は 22.12 以上。devShell と CI を揃えてある |
| Astro | 7 | Vite 8。zod は `astro:content` から外れたので `astro/zod` から取る |
| TypeScript | 6 | 7 にはまだ上げられない。`@astrojs/check` の peer が `^5 \|\| ^6` |
| pagefind | 1.5 | 全文検索の索引を postbuild で作る |

## ビルドにかかる時間

.typ 1 本につき typst を 2 回起動する（本文の HTML と front matter）。
互いに依存しないので、ファイル間もファイル内の 2 回も並べてある
（`src/lib/pool.ts`、同時実行は CPU 数 − 1 で頭打ち 8）。

```
初回（キャッシュなし）  71 本で 59 秒   ※直列だと 3 分 1 秒
2 回目以降              2 秒            変わった .typ だけ組み直す
```

キャッシュの実体は `node_modules/.astro/data-store.json`（約 10 MB）。
CI でもこれを持ち越すので、記事 1 本の修正で 3 分待たされることはない。
鍵には .typ とテンプレートに加えて **typst のバージョン**も混ぜてある。

## ページの骨格

どのページも 3 段組。左にサイト内の案内、中央に本文、右にそのページの見出し（目次）。
組み方は `src/styles/layout.css`、中身は `Sidebar.astro` と `Toc.astro` が持つ。

```
1250px 超   案内 | 本文 | 目次
1250px 以下  案内 | 本文（目次は本文の上に畳んで置く）
900px 以下   本文のみ（案内は ☰ で引き出す）
```

何をどこに出すかの判断は [reader.md](reader.md)「サイドバーに何を出すか」。

## 参照に中身を添える（実装）

なぜ添えるのか、触る端末にどう出すかは
[reader.md](reader.md)「参照の先を、その場に出す」。ここは作り方だけ置く。
入れるのは `src/lib/peek.ts`（同じ記事の中の主張）と `src/lib/page-peek.ts`
（記事をまたぐリンク）で、どちらもビルド時の純関数。テストがある。

### 踏んだ穴

**1. `<p>` の中に `<p>` を差し込むとパーサが外側を閉じる**

参照はたいてい段落の中にある。そこへ主張の `<p>` や `<ol>` をそのまま入れると、
HTML パーサが**外側の `<p>` をそこで閉じてしまう**。DOM が本文の途中で切れるので
崩れ方は派手だが、生成した HTML を目で読んでも気づけない。`peek.ts` が
`p` / `div` / `ol` / `ul` / `li` を `span` に均し、段組みは CSS の `display` で戻す。

**2. 複製した数式が式番号をずらす**

`.equation` は `counter-increment: equation` を持つ。複製をそのまま入れると
**本文の式番号が後ろまで全部ずれる**。`peek.ts` が `equation` クラスを外している。
同じ理由で `id` も落とす（同じ id が何度も出ると、リンク先が定まらない）。

**3. 参照点に合わせると右へはみ出す**

行末近くの参照でパネルが画面の外へ出て、横スクロールが生える（実測で最大 324px、
viewport 1000px のとき）。参照ではなく**本文の段に合わせる**ことで解決した。
`left` だけ指定して `top` は `auto` のままにすると、横は段の左端、縦は本来置かれる
はずだった位置（＝その行）になる。包含ブロックは `article { position: relative }`。
`max-width: 100%` が段の幅なので、はみ出しは構造的に起きない（3 つの幅で実測 0px）。

**4. 想起の問いを参照すると答えが漏れる**

`check` の中身には `<details>` が入っている。素通しすると、参照にホバーしただけで
答えが見える。`peek.ts` が `<details>` を落としている。

### 番号は、指される主張にだけ振る

`theorem.typ` の番号は**種類をまたいだ一本の通し番号**である。「定義 3 の次が定理 4」
なので、本文で番号だけ見ても指す先が一意に決まる。

ただし振るのは定義・定理・補題・命題・系・公理・前提だけで、**例と注意には振らない。**
312 個あるが `@ex:` も `@rem:` も本文に一つも無い。誰も指さない番号は、
「例 5」と書かれた側が指す先を探しに戻る手間だけを作る（`CLAUDE.md`「参照されない採番」）。

見出しからは番号だけを落とし、**種別は残す**。例なのか注意なのかは読む前に要る。
種別まで落とすのは想起の問いに題名を付けたときだけで、
そこは「問 (前回のふりかえり)」と書く用事が無い。

### 主張の錨は、位置に依らせない

Typst が主張に振る id は `loc-1`、`loc-2` と**出てきた順**である。上に定理を一つ
足すと、その下が全部ずれる。ページ内の `@` 参照は同じビルドで辻褄が合うので
問題ないが、**外から張ったリンクは黙って別の主張を指すようになる。**

そこで `<def:measure>` と書いたラベルのほうから、位置に依らない錨を別に出す
（`theorem.typ`、`it.at("label", default: none)` で取れる。`it.label` は
「figure does not have field」で落ちる）。

```html
<div class="statement statement-definition">
  <span id="def-measure" class="anchor"></span>
  ...
```

`:` は URL と CSS で扱いにくいので `-` に均す。全体で 1157 個。
`peek.ts` が複製から id を落とすので、重複は出ない（実測 0 件）。

Typst の `loc-N` はそのまま残してある。ページ内の `@` 参照はそちらを使う。

**錨を出すのは、コロンを含むラベルのときだけ。**
`<def:measure>` は `:` が id に使いにくいので Typst が `loc-N` を振り、
錨のほうが唯一の名前になる。ところが講義ノート由来の `<hilbert-corespondence>` は
**そのまま id になる**ので、錨を足すと 1 ページに同じ id が二つ並ぶ。
どちらへ飛ぶかがブラウザ任せになる（実測 2 ページ・4 件）。

なお `posts/category-diagram` には、いまも重複した id がある。
`html.frame()` が図ごとに `<symbol id="…">` を出すので、同じ字が複数の図に
出ると id がぶつかる。**id が字形から作られている**ので、`<use>` が最初の一つに
解決しても見た目は変わらない。無害と判断して残してある。

### 記事をまたぐときは、記事のほうを添える

`peek.ts` が添えられるのは**同じ記事の中の主張**だけである。`@def:measure` は
Typst が `<a href="#loc-5">` として出すので、指す先が特定できる。

ところが記事をまたぐリンクは `#link("/math/foundations/4")[土台 第 4 回]` と書く。
**指しているのは記事であって、定理ではない。** だから主張は添えられない。
添えられるのは記事のほう——連載名、第何回、題名、要約——になる（`page-peek.ts`）。

これで足りると判断したのは、Wikipedia の Page Previews が同じ形だからである。
リンクに記事の冒頭を添えて大規模に配り、ページビューが 3.0〜4.7% 落ち、
切った人は 0.02〜0.03% だった。**飛ばずに済ませた分**である。

定理単位まで届かせるには、参照側が定理を名指しする必要がある
（`#link("/math/foundations/4#def:completeness")`）。記事側の作業が数百リンク分
出るので、そこは別の判断になる。

**足す場所が `peek.ts` と違う。** あちらは loader（1 本ずつ処理する）で走るが、
記事をまたぐには全記事の情報が要る。だから `[order].astro` で、loader が組んだ
`rendered.html` に後から足している。

**添えた中身は、検索の索引から外す。** 同じ主張がページ内で何度も参照されると、
索引にも同じだけ入って重みが狂う（実測で索引の 19% が複製だった）。
抜粋にも、文脈から切れた複製が出る。`aria-hidden` は読み上げに、
`data-pagefind-ignore` は検索に、同じことを言っている。
**実体は同じページにあるので、落としても引けなくなるものは無い。**

**先に添えた主張は、いったん伏せてから書き換える。** 伏せずにやると、
添えた中身の中のリンクにさらに中身が添い、パネルの中にパネルが出る。

### 大きさ

中身は参照のたびに複製される。生の HTML は 1 ページ 1〜34% 増えるが、同じ塊の
繰り返しなので **gzip 後は 1〜14%** に収まる（上端は参照の多いプログラムの構成 第 1 回）。
主張が 598 か所、記事が 425 か所。
共有する仕組み（`popover` 属性など）に替えるほどの差ではない。

**この数は古びる。** 記事が増えるたびにずれるので、`npm run measure` で
測り直せるようにしてある（`npm run build` のあとに走らせる）。
docs の数を直すときは、まずそれを走らせること。

取っ手（`<input>` と `<label>`）は参照 1 つにつき約 146 バイト。いちばん参照の多い
ページ（プログラムの構成 第 1 回、参照 111 か所）で実測すると、
**生で +16.4 KB、gzip 後で +1.8 KB**（23.3 KB → 25.1 KB）だった。
属性が毎回同じなのでよく縮む。

## 図

言葉だけより、言葉と図の両方があるほうが強い。とくに位相・微分形式・Riemann 幾何は、
包含関係や刻み方の図が一枚あるかどうかで理解が変わる。

```typst
#import "/src/typst/diagram.typ": diagram, ink, ink-thin, ink-wash

#diagram(caption: [説明], 中身)
```

**`place` は HTML export で黙って落ちる。**`html.frame()` で囲まないと本文に何も
残らない（穴の 15）。`diagram` が `target()` で分けて、HTML には SVG、PDF には
`figure` を出す。番号は振らない——主張の通し番号（定義 3 の次が定理 4）を乱すため。

### 色は黒とその透明度だけ

`html.frame()` は**色を SVG に焼き込む**。地の色を書くとダークモードで消える。
そこで図は黒だけで描き、`global.css` が属性セレクタで `currentColor` に差し替える。

| Typst | SVG | 用途 |
| --- | --- | --- |
| `ink` | `#000000` | 主線。グラフ、軸 |
| `ink-thin` | `#00000066` | 補助線。刻み目 |
| `ink-wash` | `#0000001f` | 面。強調した帯 |
| `white` | `#ffffff` | 紙。穴を抜く、線を跨がせる（地の色に追従する） |

Typst は透明度を `stroke-opacity` ではなく**8 桁の色に畳んで**出すので、濃さごとに
セレクタが要る。濃さを増やすときは `global.css` の側も足すこと。足さないとその線
だけ黒のまま残り、ダークモードで消える。

### 大きさ

図の中の文字は**グリフのパスになる**。本文と同じ「テキストのまま読める」性質は
そこだけ失われるし、字数に比例して重くなる。だから**ラベルは図の中に置かず、
`caption` に出す**。測度と確率 第 2 回の図（2 面、折れ線・刻み目・帯・逆像）で
3.8 KB に収まっているのは、文字を一つも焼いていないからである。

いまは 1 枚だけ。本文で多用すると「重い」に戻るので、**その回の主題が図でしか
言えないとき**に限る。

## 検索と共有へ渡すもの

`postbuild` が三つ置く。どれも読者の目には入らないが、
**検索から 1 本だけ来る読者**へ届く経路になっている。

| | 何を | なぜ |
| --- | --- | --- |
| `<link rel="canonical">` | ページの正式な URL | 同じ中身が末尾スラッシュ有無・`index.html` 有無で複数の URL になる |
| `og:` と `twitter:card` | 題名・要約・URL | 貼られたリンクに、いまは URL しか出ない。画像は持たないので `summary` |
| `sitemap.xml` / `robots.txt` | 452 ページ | 概念のページ 300 枚は索引からしか辿れず、深い |

**PDF は sitemap に入れない。** 同じ中身が HTML 側にあるので、
検索結果に二つ並べても読者の選択肢が増えない。

依存は足していない（`scripts/emit-sitemap.mjs` が `dist` を歩く）。

## 記事 1 本の書き方

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

**中身の決めごとは [reader.md](reader.md) にある。** 書き出しの型、文体、
一人称の線、想起の問いの置き方。執筆計画は `npm run curriculum next 10` が
概念グラフから引く。

## 講義ノート（../lecture-notes からの移行）

LaTeX で書いていた講義ノート 44 本を Typst に変換し、`src/content/notes/` に置いた。
記事と同じ経路を通るので、HTML（MathML）も PDF も同じソースから出る。

```
../lecture-notes/**/*.tex
  ↓  scripts/latex/preprocess.mjs   区切り記号マクロを素の LaTeX に均す
  ↓  pandoc --from latex --to typst
  ↓  scripts/latex/repair-typst.mjs  Typst 0.15 が通る形に直す
src/content/notes/*.typ      ← 移行後の原本
  ↓  既存の typst-loader（記事と共通）
/notes, /notes/<id>
```

```sh
npm run notes    # 再変換（44 本で 15 分ほど）。画像も public/notes に配置する
npm test         # 前処理と見出し抽出のテスト
```

**再変換は `src/content/notes/*.typ` を上書きする。** 移行後に手で直したものは
消えるので、原本として育て始めたら `npm run notes` は流さないこと。

### 変換で踏んだもの

physics2 の `\ab` と ab.braket、physics(v1) の `\qty` は、引数を波括弧で囲まない
区切り記号構文を使う。pandoc はこれを解釈できず、数式ブロックごと生の TeX で残す。

```latex
\ab(\frac{a}{b})   \ab<r^2>   \qty(x)   \ket|psi>   \bra<psi|   \braket<a|b>
```

`preprocess.mjs` が対応する閉じ記号まで走査して `\left ... \right` に開く。
**`\ab<r^2>` は期待値 ⟨r²⟩ なので、素通しすると不等号になって意味が変わる。**
`\mqty` は区切り記号で行列の種類が決まる（`(` は pmatrix、`[` は bmatrix、`|` は
vmatrix）。`\vb` `\dd` `\pdv` `\dv` `\vdot` `\laplacian` なども素の LaTeX に均す。

展開器はソース自身が定義しているマクロには触らない。また定義の頭
（`\newcommand\mqty[1]` のような波括弧なしの形を含む）を退避してから処理する。
ここを守らないと定義名を書き換えてしまい、pandoc が文書ごと読めなくなる。

`repair-typst.mjs` は pandoc の出力を Typst 0.15 に合わせる。

- 記号名の変更: `planck.reduce`→`planck`、`angle.l/r`→`chevron.l/r`、
  `times.circle`→`times.o`、`sect`→`inter`
- 数式内で 1 文字ずつバラされた和文を立体テキストにまとめる（判定に `$` の
  対応付けは使わない。数式の内外を取り違えると本文まで引用符で包んでしまうため、
  「和文が空白で区切られている」という pandoc 特有の形を手掛かりにする）
- `f(r, s; t)` の `;` を逃がす（Typst の数式では `;` が行列の行区切り）
- 定義が失われた参照に見えない錨を張る、重複ラベルを 1 つに減らす
- 元の .tex に紛れた制御文字を落とす（PDF は通るが HTML export は止まる）

### 残っているもの

**生の TeX が読者に見えているものは、いま 0 件。** かつて 7 本のノートで
116 断片が素通しになっていた。数式は Typst に直し、変換できない図
（tikz / Feynman 図）は `#unconverted` で畳んである。畳んだ中身は
`npm test` の数え上げから外してあるので、**新しく漏れたものだけが引っかかる**。

定理環境は組み直せている（`repair-typst.mjs` が pandoc の `#block[...]` を
`#theorem` などに戻す）。実測で 871 個。「定理 1」という採番が文字列として
焼き付いたものは 0 件で、通し番号も相互参照も Typst 側が持っている。

自作マクロ 1193 個は pandoc が展開済み。`\RR` のような略記は消えている。

画像 1 点は元リポジトリに実体が無く、「（画像なし）」に置き換えてある。

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
豆腐になる。`npm run fonts` が以下の範囲でサブセットする（Latin Modern Math で 183KB）。
元フォントは `flake.nix` が `MATH_FONT` で渡すので、`fc-list` の結果に依存しない。
`ssty` / `dtls` は Typst の CSS が参照するので必ず残すこと。MATH テーブルが落ちると
組版の寸法が全部狂うため、スクリプトが生成後に MATH と主要コードポイントを検査する。

```
U+0370-03FF ギリシャ / U+2100-214F 文字様記号 / U+2190-21FF 矢印
U+2200-22FF 演算子   / U+27E6-27FF 括弧       / U+1D400-1D7FF 数式用英数字
```

**3.5. フォントを `public/` に置くとキャッシュが割れない**

`public/` の中身は名前のまま配られる。`_astro/` の CSS や JS には内容ハッシュが
付くのに、フォントだけ `/fonts/math.woff2` の固定名になっていた。中身を差し替えても
ブラウザは古いものを出し続ける。実際、数式フォントを入れ替えたときに読み手の側で
古い字形が残った。

`src/fonts/` に置いて Vite に処理させる。CSS の `url()` は自動で指紋付きに解決され、
`<link rel="preload">` は `?url` で取り込んだ値を使う。

```astro
import mathFont from '../fonts/math.woff2?url'
<link rel="preload" href={mathFont} as="font" type="font/woff2" crossorigin />
```

**4. 別行立て数式の CSS は `display: block math`**

長い数式を横スクロールで逃がそうとして `math[display="block"] { display: block }` と
書くと、MathML のレイアウトアルゴリズムが CSS の通常ブロックで上書きされ、分数・
根号・積分が縦に潰れる。`block math` と書くこと。HTML だけ見ても気づけないので、
数式まわりを触ったらブラウザで実物を見る。

**5. 見出しレベルが 1 つずれる。id は付かない**

`=` → `<h2>`、`==` → `<h3>`、`===` → `<h4>`（実測）。`<h1>` は文書タイトルぶん
空けてある。ページの `<h1>` は front matter の `title` から `PostLayout` が出す前提
なので、この構成では都合がいい。ただし `=` を 5 段重ねると `<h6>` で頭打ちになる。

id は振られないので、そのままでは目次からリンクする先が無い。`headings.ts` が
ビルド時に見出し文から id を作り（和文はそのまま残して約物だけ落とす）、
`render()` が返す `headings` に載せている。ラベル由来の id が既にあれば尊重する。

**6. `lang` の既定は `en`**

`#set text(lang: "ja")` を書かないと `<html lang="en">` になる。和文の
`text-spacing-trim`（約物詰め）や `word-break: auto-phrase` は lang に依存するので、
書き忘れるとこれらが黙って無効になる。`template.typ` が設定し、loader が検証して
ズレていれば警告する。

**7. nixpkgs stable の typst は 0.14.2**

MathML export は 0.15 から。`flake.nix` で typst だけ unstable（0.15.1）から取っている。

**8. `typst eval` にも `--features html` が要る**

メタデータを取るだけなので paged target で足りる、と考えると落とし穴になる。本文が
`html.frame()` のように `html` 名前空間へ触れていると、評価しただけで
`unknown variable: html` で失敗する。警告は stderr に出るが、読むのは stdout の
JSON だけなので実害はない。

**9. doctype と `<html>` の間に式を挟むと文書構造が消える**

Astro のテンプレートで `<!doctype html>` の直後に `{/* ... */}` を書くと、
文書がフラグメントとみなされ **`<html>` `<head>` `<body>` が一切出力されない**。
`<html lang="ja">` も消えるため、汎 CJK フォントが中国語字形を選び、
`text-spacing-trim` と `word-break: auto-phrase` も黙って無効になる。

HTML コメント（`<!-- -->`）は出力に漏れるので `{/* */}` に替えたくなるが、
この位置だけは駄目。説明は frontmatter の JS コメントに書く。

`<link>` の有無だけ見ていると気づけない。ビルド後に
`grep -o '<html[^>]*>' dist/**/*.html` で確かめること。

**10. 証明終わりの □ は 2 通りの形で出てくる**

Typst は証明の終わりの記号を、証明が本文で終わるときは最終段落の中に
インラインで、別行立て数式で終わるときは単独の段落として出す。
`display: block` を当てると前者が行を分けてしまうので、`float: right` で
両方とも右端に寄せる。浮かせたぶんは `.proof::after` で閉じる。

**11. テンプレートや typst を替えても本文に反映されない**

loader が本文の digest だけを見ていると、`src/typst/*.typ` を直しても
Content Collection のキャッシュが効いたままになる。証明の見出しを
`証明．` から `Proof.` に変えたのに出力が変わらない、という形で現れる。
`dependsOn: ['src/typst']` で共有ファイルの digest を混ぜてある。
キャッシュの実体は `node_modules/.astro`（`.astro` だけ消しても残る）。

同じ理由で、loader 側の後処理（見出しの id 付けなど）を直したときも古い HTML が
残る。`dependsOn` には `src/typst` に加えて `typst-html.ts` と `headings.ts` を
挙げてあり、これらを触ると全記事が組み直される。typst 自体を上げたときも同じ
問題が起きるので、`typst --version` の文字列も digest に混ぜてある。

**12. 数式フォントの名前に空白を入れると、圧縮で消える**

`font-family: 'Math Subset', math` と書くと、CSS の圧縮で引用符が外れて
`font-family: Math Subset, math` になる。すると先頭の識別子 `Math` が総称ファミリ
`math` と（大文字小文字を無視して）一致し、**宣言ごと無効**になる。数式は
ブラウザ既定のフォントに落ちるだけなので、豆腐にはならず字形が変わるだけ。
気づきにくい。名前は `MathSubset` のように 1 語にしておくこと。

Astro 5 は引用符を残していたが、7（Vite 8）は外す。上げたときに踏んだ。

```sh
# 効いているかは計算後の値で見る。'math' だけなら落ちている。
getComputedStyle(document.querySelector('math')).fontFamily
```

**13. `overline` は MathML export で黙って落ちる**

`$overline(X)$` はバーが出力されず、`$X$` と区別が付かなくなる。警告は出るが
`typst compile` は成功するので、警告を読まないと気づけない。標本平均のような
「バーで区別する」記法は、別の記号に置き換えること。`macron` も同様に落ちる。

同じ理由で、アクセント類は出力を確認してから使う。`hat` と `dot` は通る
（loader が合成用文字を間隔付き文字に置換している。`typst-html.ts` の
`useSpacingAccents`）。

**14. `@ラベル` はファイルをまたげない**

`@thm:foo` は同じ `.typ` の中しか解決しない。別の回の定理を指すと
`label does not exist in the document` でビルドが止まる。**連載を書くと必ず踏む。**

回避は `#link("/math/…")[第 N 回]` ＋ 平文。「@thm:levi-civita の公式」ではなく
「前回の Christoffel 記号の公式」と書く。番号での参照は諦めることになるが、
そもそも読者は別ページの「定理 4」を見に行けないので、実害は少ない。

**15. 存在しない記号・関数**

LaTeX や他の Typst 版の記憶で書くと落ちる。よく踏んだもの。

| 書きたいもの | 誤 | 正 |
| --- | --- | --- |
| ⊗ / ⊕ | `times.circle` / `plus.circle` | `times.o` / `plus.o` |
| ∖ | `setminus` | `without` |
| ℝ | `mathbb(R)` | `RR` |
| 広い空白 | `qquad` | `quad quad` |
| tr | `tr` | `upright("tr")` |
| ket / bra | `ket(psi)` | 無い。記事の先頭で `#let ket(x) = $lr(\| #x chevron.r)$` |

**15.5. 桁区切りの `{,}` は、波括弧ごと出る**

LaTeX の `3{,}148` をそのまま書くと、MathML export では波括弧が消えない。
`<mo>{</mo><mo>,</mo><mo>}</mo>` が出て、画面に `3{,}148` と見える。
警告は出ず、PDF 側では正しく見えるので、HTML を見ないと気づけない。

素の `$3,148$` も駄目で、カンマが演算子（`<mo>`）になり、
リストの区切りとして間隔が入る（`3, 148`）。

`","` と文字列で書く。`<mtext>` になって間隔が付かず、数字は `<mn>` のまま残る。

```typst
$3","148$      // 3,148   正しい
$3{,}148$      // 3{,}148  波括弧が見える
$3,148$        // 3, 148   カンマの後ろに間隔
```

**16. `abs()` の中のカンマは引数区切りになる**

`abs(chevron.l a, b chevron.r)` は `unexpected argument` で落ちる。
`abs()` は 1 引数の関数なので、カンマで切られる。`\,` でエスケープする。

```typst
$ abs(chevron.l phi_i\, psi chevron.r)^2 $
```

`norm()` も同じ。`[hat(A), hat(B)]` のような括弧の中のカンマも、
`abs()` に包むなら逃がすこと。

**17. 記事は 1 本ずつコンパイルして確かめる**

`npm run build` はキャッシュが効くので、いま書いたファイルのエラーを見落とす。

```sh
typst compile --format html --features html --root . <file> /dev/null
```

**警告も読む。** 13 番のように、コンパイルは成功して意味だけ壊れるものがある。

**18. HTML export は experimental**

`--features html` が要る。公式に production 非推奨で、未対応要素や show rule の穴を
たまに踏む。回避の show rule を書くか upstream にパッチを送る。`target()` だけは
0.15 からフラグ無しで使えるので、PDF ビルド側では `TYPST_FEATURES` を立てなくていい。

**19. `place` は SVG 島にならない。黙って落ちる**

HTML に写像できない精密レイアウト（`place`、回転）が自動で SVG として埋め込まれる、
というのは誤りだった。0.15.1 の実出力は `warning: place was ignored during HTML
export` を出し、**本文には何も残らない**。警告を読まなければ、図が消えたことに
気づけない。

図を出すには `html.frame()` で明示的に囲む。詳細は上の「図」を参照。
