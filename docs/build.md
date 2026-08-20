# ビルドの仕組み

`.typ` で書いて、Typst 0.15 の HTML export でビルド時に HTML 化し、Astro に流す。
同じソースから PDF も出せる。転送されるのは HTML と CSS、それに数学フォント 1 本。

JS は 4 つだけで、いずれも無くても読める補助にとどめてある。全文検索（最初の入力まで
索引を読まない）、目次のスクロール追従、サイドバーを現在地まで送る処理、読んだ記事の
記録（localStorage、端末内のみ）。骨格の開閉は `<details>` とチェックボックスで、
CSS だけで動く。

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
| `src/lib/typst-cli.ts` | `typst compile` / `typst eval` の薄いラッパ |
| `src/lib/typst-html.ts` | 出力文書を body / head / lang に切り分ける |
| `src/lib/headings.ts` | 見出しに id を振り、目次用の一覧を取り出す |
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
| `scripts/latex/preprocess.mjs` | LaTeX の区切り記号マクロを素の LaTeX に均す |
| `scripts/latex/repair-typst.mjs` | pandoc 出力を Typst 0.15 が通る形に直す |
| `scripts/latex/to-typst.mjs` | .tex を一括変換して `src/content/notes` に置く |

## 使い方

```sh
nix develop                 # typst 0.15.1 / node 24 / fonttools / Latin Modern / pandoc
npm install
npm run fonts               # public/fonts/math.woff2 を生成（初回のみ）
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

## サイドバーに何を出すか

全分野・全連載・講義ノート 44 本を常に開くと、目に入る項目が 80 を超える。読み手は
自分の居場所を見失い、まだ読んでいない量に圧倒される。そこで**今いる文脈だけを開く**。
判断は `src/lib/nav-scope.ts`（純関数、テストあり）、描画は `Sidebar.astro`。

| どこにいるか | 開くもの | 畳むもの |
| --- | --- | --- |
| 連載の記事 | その連載（全 12 回など） | 同じ分野のほかの連載、ほかの分野、講義ノート |
| 分野の目次 | その分野の連載（先頭だけ開く） | ほかの分野、講義ノート |
| 講義ノート | その群（ノート / レポート） | もう一方の群、分野 |
| 入口 | 何も開かない | すべて |

畳んだものは 1 クリックで開く。**選べる道は減らさない**。順番を決めてやると迷いは
減るが、自分で進み方を決めたい読み手の意欲は削がれる（Duolingo が経路を 1 本に
固定して長年の利用者から反発を受けた例がある）。

添える情報は 3 つだけ。

- **現在地の目盛り**「第 3 回 / 全 12 回」とバー。今いる連載にだけ出す。まだ手を
  付けていない連載に 0 % のバーを並べると、未読の一覧が借金の一覧に見えて逆効果。
- **続きから** 最後に読んだ記事へ 1 手で戻る。記録は端末の localStorage だけで、
  外へは出ない。無ければ枠ごと出ない。
- **入口** 何も読んでいない人にだけ「はじめて読むなら」を 1 行。道を 1 本示して、
  並んだ選択肢の前で立ち止まらせない。入口は `taxonomy.ts` の `start: true` で
  宣言する（1 つだけ）。

読んだ記事には ✓ が付く（localStorage）。連続記録や達成率のような、完了を急かす
仕掛けは置かない。

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

## 概念グラフと執筆計画

一次データは `src/data/concepts.ts` の**概念グラフ**である。記事があるかどうかとは
無関係に「何を理解するには何が要るか」だけを書く。記事はそこへの被覆でしかない。

**記事から生やしたグラフでは計画が立たない。** まだ書いていない領域がグラフに存在しない
ので、「次に何を書くべきか」を問えない。だから概念を先に置く。被覆されていない概念が
そのまま執筆キューになり、依存順に並ぶ。

```sh
npm run curriculum stats            # 概念数、被覆率、循環、ずれ
npm run curriculum goals            # 到達目標と、そこまでの残り本数
npm run curriculum plan stokes      # 依存順。記事の有無つき
npm run curriculum next 10          # 次に書くべき記事（下流の多い順）
npm run curriculum gaps             # 記事の無い概念すべて
npm run curriculum dump             # JSON
```

記事側の front matter は `provides` だけを見る。前提は概念グラフが持つので、
記事に書く必要がない。`requires` / `uses` も置けるが、いまは使っていない。

**辺は論理的な依存だけ。**「この順で教わるのが普通だから」という慣習は書かない。
シラバスから吸える前提はほとんど慣習で、遠回りの正体もそこにある。混ぜた時点で、
最短経路が既存のカリキュラムをなぞるだけのものになる。

`next` は「前提がすべて記事になっている」ものを先に出し、下流の概念数が多い順に並べる。
前提が揃っていないものを書いても、読者が読めないからである。

`stats` の `循環` は概念グラフの書き間違いを、
`グラフに無い概念を記事が名乗っている` は語彙のずれを検出する。どちらも 0 に保つこと。

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

pandoc の警告が 382 件ある。多くは複雑な数式ブロックで、生の TeX のまま .typ に
残っている。表示は崩れるので、気づいたら手で直す。

定理環境は環境として残らない。「定理 1」という採番が文字列として焼き付いており、
自動採番も相互参照も効かない。Typst の `#let theorem()` に置き換えるなら手作業。

自作マクロ 1193 個は pandoc が展開済み。`\RR` のような略記は消えている。

図（tikz / Feynman 図）は変換できない。画像 1 点は元リポジトリに実体が無く、
「（画像なし）」に置き換えてある。

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

**13. HTML export は experimental**

`--features html` が要る。公式に production 非推奨で、未対応要素や show rule の穴を
たまに踏む。回避の show rule を書くか upstream にパッチを送る。`target()` だけは
0.15 からフラグ無しで使えるので、PDF ビルド側では `TYPST_FEATURES` を立てなくていい。

HTML に写像できない精密レイアウト（`place`、回転、視覚配置目的の `grid`）は SVG 島
として埋め込まれる。図や cetz のプロットには適材適所だが、本文で多用すると「重い」に
戻るので、本文はフローに乗る書き方に寄せる。
