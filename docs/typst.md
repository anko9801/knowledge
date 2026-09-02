# 記事の書き方（機械的なところ）

**判断の要らないものだけを置く。** 文体と構成は [writing.md](writing.md) と
[reader.md](reader.md)、やらかした記録は [CLAUDE.md](../CLAUDE.md)。

記事を書くたびに `src/typst/` と `src/lib/*.test.ts` を読み直していたので、
その分をここに畳んだ。**これを読めば、既存の記事を開かずに書ける。**

## 書く前に一度だけ叩く

```
node scripts/curriculum.mjs brief <field> <series> <order>
```

連載の趣旨、既にある回とその概念 id、**隣の回の分量**、
この回の概念が何を前提にしていてそれがどこにあるか、前提が後ろに来ている箇所。
**0.3 秒。これで既存記事を開かずに済む。**

分量は隣の回に合わせる。大きく外れたら理由を言えるようにしておく。

## 骨組み

```typst
#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "題名",
  date: "2026-09-02",
  field: "physics",          // physics / math / cs
  series: "quantum-field-theory",
  order: 10,
  tags: ("場の量子論",),      // 要素一つでも末尾のカンマが要る
  summary: "三〜四文。何を仮定して何が出るか。",
  provides: ("concept-id", "another-id"),
)

= 見出し

本文。
```

## 囲み

```typst
#definition[ … ]<def:name>
#theorem("Pauli、1940 年")[ … ]<thm:name>     引数は出典。省いてよい
#lemma[ … ]<lem:name>
#remark[ … ]                                  番号が付かない
#example[ … ]                                 番号が付かない

#check("問いの一行")[
  問いの本文。読者に考えさせる側。
][
  答え。
]
```

参照は `@def:name`、`@thm:name`。**同じ記事の中でしか張れない。**
よその回の定理は文章で指す（「前回の Wick の定理は」）。

使える囲みは `axiom` `given` `definition` `theorem` `lemma` `proposition`
`corollary` `example` `remark` と `check`（`src/typst/theorem.typ`）。

## 数式

別行立ては `$` の内側に空白を置く。インラインは置かない。

```typst
$ F_(mu nu) = partial_mu A_nu - partial_nu A_mu $     別行立て
$F_(mu nu)$ は                                        インライン
```

多行は `\` で改行、`&` で揃える。

```typst
$ A &= B + C \
    &= D $
```

### 詰まりやすいところ

| したいこと | 書き方 | 備考 |
| --- | --- | --- |
| バー付き | `accent(psi, macron)` | **`overline` は線が落ちる。** テストが止める |
| 添字をずらす | `T^a zws_b` | `{}` は空集合として描画される |
| 強調 | `#strong[...]` | **`**` は文字として出る。** テストが止める |
| 割り算 | `a slash b` または `(a) / (b)` | |
| 太字ベクトル | `bold(p)` | |
| 跡 | `tr(...)` | |
| ダランベルシアン | `square.stroked` | |
| 期待値・内積 | `chevron.l a, b chevron.r` | `ket` `bra` は**無い** |
| 絶対値 | `abs(x)` | **中にカンマを入れない。** 引数が割れる |
| 添字が語 | `m_"物"` | |

## リンク

```typst
#link("/physics/quantum-field-theory/7")[第 7 回]
#link("/math/vector-analysis/3")[ベクトル解析 第 3 回]
```

パスは `/<field>/<series>/<order>`。**実在する回しか張れない**（テストが止める）。
「前回」「次回」は**同じ連載の隣**を指すときだけ使う。

## 機械が止めるもの

`npm run quick`（1.9 秒）で回る。

| 止まるもの |
| --- |
| 題名と見出しで、主題の直後の読点（「重力は、座標を…」） |
| `overline`、`**`、`{}` の添字ずらし |
| 実在しない回へのリンク、連載をまたいだ「前回」 |
| まとめの表、連載を閉じる挨拶、ラベルだけの見出し |
| `provides` に無い概念 id |
| 書き出しが続きものの段取りから始まっている |

**式の正しさと事実は見ていない。** そこは自分で検算する。

## 検査

```
npm run quick                              変更した .typ だけ。1.9 秒
nix develop --command npm run verify       全部。10 秒。最後に一度
```
