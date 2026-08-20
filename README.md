# knowledge

数学と物理のノート。

**https://anko9801.github.io/knowledge/**

## 連載

- [数学](https://anko9801.github.io/knowledge/math) — 集合論 12 本、数理論理学 10 本、土台 6 本、線形代数 7 本、ベクトル解析 6 本、微分形式 7 本、Riemann 幾何 7 本
- [物理](https://anko9801.github.io/knowledge/physics) — 解析力学 5 本

幾何の連載は「仮定した構造」で分けてある。土台（ベクトル空間・微積分・位相）→
線形代数（1 点）→ ベクトル解析（$\mathbb{R}^3$、入口）→ 微分形式（計量なし）→
Riemann 幾何（計量あり）。各記事の冒頭に、その回が計量を使うかどうかを出している。

## 概念グラフ

記事とは別に、`src/data/concepts.ts` に**概念の依存グラフ**を置いてある。記事があるか
どうかとは無関係に「何を理解するには何が要るか」だけを書いたもので、記事はそこへの
被覆として扱う。だから、まだ書いていない領域も同じグラフに乗り、執筆計画が立つ。

```sh
npm run curriculum goals            # 到達目標と、そこまでの残り本数
npm run curriculum plan stokes      # 依存順。記事の有無つき
npm run curriculum next             # 次に書くべき記事（下流の多い順）
```

辺は論理的な依存だけで、「この順で教わるのが普通だから」という慣習は入れない。
詳細は [docs/build.md](docs/build.md)。

## 講義ノート

[講義ノート](https://anko9801.github.io/knowledge/notes)に、学生時代に LaTeX で
書いたものを 44 本置いてある。機械変換したままなので、組版が崩れているものや
書きかけで終わっているものが混じる。書き直したものから上の連載へ移していく。

## 書き方

本文は Typst で書く。数式は MathML として出るので、画像ではなくテキストのまま
読める。選択もコピーもページ内検索もできる。同じソースから PDF も出せる。

ビルドの詳細は [docs/build.md](docs/build.md)。
