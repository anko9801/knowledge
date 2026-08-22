/**
 * 書き出しが、続きものの段取りから始まっていないか。
 *
 * 隙間を開けるいちばん確実な形は、ありえないことを先に見せることである
 * （`docs/reader.md`「書き出しの型」）。ところが「前回、〜」で始めると、
 * 途中から入った読者は 2/10 の状態に置かれ、隙間が大きすぎて好奇心が立たない。
 *
 * かつて 17 本がこの形だった。直すのは手作業だが、**戻るのは一瞬**なので、
 * ここで止める。前回の話は、異常を出したあとで持ち出せばよい。
 */

import { strictEqual } from 'node:assert/strict'
import { readFileSync, readdirSync, statSync } from 'node:fs'
import { join } from 'node:path'
import { test } from 'node:test'

const ARTICLES = 'src/content/articles'

const typFiles = (dir: string): string[] =>
  readdirSync(dir).flatMap((name) => {
    const path = join(dir, name)
    if (statSync(path).isDirectory()) return typFiles(path)
    return name.endsWith('.typ') ? [path] : []
  })

/** 最初の `= 見出し` の直後の 1 行。 */
const firstLine = (source: string): string | undefined => {
  const heading = /^= .*$/m.exec(source)
  if (heading === null) return undefined
  return source.slice(heading.index + heading[0].length).trim().split('\n')[0]
}

// 「さて」まで拾う。段取りから入る言い回しは、だいたいこの形をしている。
const STAGING = /^\s*(#link\([^)]*\)\[前回\]|前回|前々回|ここまで|これまで|道具は|さて)/

test('記事が、続きものの段取りから始まっていない', () => {
  const staged = typFiles(ARTICLES).filter((path) => {
    const line = firstLine(readFileSync(path, 'utf8'))
    return line !== undefined && STAGING.test(line)
  })

  strictEqual(staged.join('\n'), '', `書き出しが段取りになっている:\n${staged.join('\n')}`)
})

test('Markdown の強調が、.typ に漏れていない', () => {
  // Typst の強調は `*text*` か `#strong[text]`。`**text**` と書くと
  // **空の強調が二つ**に読まれて、囲んだはずの文字が地の文に落ちる。
  // typst は warning を出すが `compile` は成功するので、読まないと気づけない。
  const leaked = typFiles(ARTICLES)
    .concat(typFiles('src/content/notes'))
    .flatMap((path) => {
      const lines = readFileSync(path, 'utf8').split('\n')
      return lines.flatMap((line, i) =>
        /\*\*[^*\n]+\*\*/.test(line) ? [`${path}:${i + 1}  ${line.trim().slice(0, 60)}`] : [],
      )
    })

  strictEqual(leaked.join('\n'), '')
})

test('桁区切りが、波括弧のまま出ていない', () => {
  // LaTeX の `3{,}148` は MathML export で波括弧が消えず、画面に
  // `3{,}148` と見える。素の `$3,148$` もカンマが演算子になって
  // `3, 148` と間隔が入る。正しいのは `$3","148$`。
  //
  // どちらも typst は何も言わず、PDF 側では正しく見えるので、
  // HTML を開かないと気づけない。実際 02-numbers.typ で配信されていた。
  const separators = typFiles(ARTICLES)
    .concat(typFiles('src/content/notes'))
    .flatMap((path) => {
      const lines = readFileSync(path, 'utf8').split('\n')
      return lines.flatMap((line, i) =>
        // 桁区切りの形だけを見る。3 桁が続かないカンマは binom(4,2) や
        // mat(0,1;1,0) や (x,y) の引数区切りなので、拾ってはいけない。
        /\d\{,\}\d|\$[^$\n]*\d,\d{3}(?!\d)[^$\n]*\$/.test(line)
          ? [`${path}:${i + 1}  ${line.trim().slice(0, 60)}`]
          : [],
      )
    })

  strictEqual(separators.join('\n'), '')
})

test('変換の傷が、講義ノートに残っていない', () => {
  // pandoc 経由の変換で二つ残る。生の LaTeX 命令と、行き先を失った (ref)。
  // どちらも読者にそのまま見えるが、typst は何も言わない。
  //
  // 図の LaTeX は #unconverted(...) の中に畳んであるので、そこは外して数える。
  const scars = typFiles('src/content/notes').flatMap((path) => {
    const source = readFileSync(path, 'utf8').replace(/#unconverted\("(?:[^"\\]|\\.)*"\)/g, '')
    const found = [
      ...[...source.matchAll(/\\\\[a-zA-Z]+/g)].map((m) => m[0]),
      ...[...source.matchAll(/\(ref\)/g)].map((m) => m[0]),
    ]
    return found.length > 0 ? [`${path}: ${[...new Set(found)].slice(0, 5).join(' ')}`] : []
  })

  strictEqual(scars.join('\n'), '')
})

test('講義ノートの題名が、ファイル名のままになっていない', () => {
  // .tex から題名を拾えないと、変換器はファイル名を入れる。
  // 一覧に condenced_matter_physics と並ぶ。
  const untitled = typFiles('src/content/notes').flatMap((path) => {
    const title = /title: "([^"]*)"/.exec(readFileSync(path, 'utf8'))?.[1] ?? ''
    return /[぀-ヿ一-鿿]/.test(title) ? [] : [`${path}: ${title}`]
  })

  strictEqual(untitled.join('\n'), '')
})

test('記事に、見出しが一つはある', () => {
  const headless = typFiles(ARTICLES).filter(
    (path) => firstLine(readFileSync(path, 'utf8')) === undefined,
  )

  strictEqual(headless.join('\n'), '')
})

test('HTML export で意味の変わる書き方が、本文に残っていない', () => {
  // どれも typst は warning しか出さない。compile は通るので、
  // ビルドを見ているだけでは気づけない。実測でこうなっていた。
  //
  //   scale     101 か所。大きくした括弧が**丸ごと消える**。
  //             \[ ... \] が外れて、和のかかる範囲が変わって見える
  //   overline   20 か所。上線が消えて**別の量になる**。
  //             反ニュートリノがニュートリノに、共役 z̄ が z に
  //
  // 直し方は scale を外す、overline を accent(x, macron) にする。
  const DROPPED: readonly (readonly [RegExp, string])[] = [
    [/#scale\(/, 'scale は中身ごと落ちる。外すこと'],
    [/(?<![A-Za-z-])overline\(/, 'overline は線が落ちる。accent(x, macron) にすること'],
  ]

  const found = typFiles(ARTICLES)
    .concat(typFiles('src/content/notes'))
    .flatMap((path) => {
      // 元の LaTeX を畳んだ中は変換の対象ではない。
      const source = readFileSync(path, 'utf8').replace(/#unconverted\("(?:[^"\\]|\\.)*"\)/g, '')
      return source
        .split('\n')
        .flatMap((line, i) =>
          DROPPED.flatMap(([pattern, why]) =>
            pattern.test(line) ? [`${path}:${i + 1}  ${why}`] : [],
          ),
        )
    })

  strictEqual(found.join('\n'), '')
})

test('align が、本文に残っていない', () => {
  // align は HTML export で**中身ごと**消える。typst は警告を出すが compile は
  // 成功するので、ビルドを通しただけでは気づけない。
  //
  // 実際 align(center)[#table(...)] が 41 か所あり、講義ノートの表 44 個のうち
  // 40 個が「説明だけがあって中身が無い figure」になっていた。
  // 中央寄せは CSS の仕事なので、Typst 側で書く必要がそもそも無い。
  //
  // place も同じく落ちるが、こちらは html.frame() で囲む形が確立している
  // （`docs/build.md`）ので、ここでは見ない。
  const dropped = typFiles(ARTICLES)
    .concat(typFiles('src/content/notes'))
    .flatMap((path) => {
      const lines = readFileSync(path, 'utf8').split('\n')
      return lines.flatMap((line, i) =>
        /(?<![A-Za-z-])align\(/.test(line)
          ? [`${path}:${i + 1}  ${line.trim().slice(0, 60)}`]
          : [],
      )
    })

  strictEqual(dropped.join('\n'), '')
})
