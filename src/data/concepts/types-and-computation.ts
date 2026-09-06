import type { Concept } from './types.ts'
import { c } from './types.ts'

export const typesAndComputation: readonly Concept[] = [
  // --- 型と計算 --------------------------------------------------------------
  //
  // 関数型言語はここに落ちる。Haskell も OCaml も処理系という人工物なので
  // 概念ではないが、その中身——評価戦略、型推論、代数的データ型——は
  // λ 計算の定理そのものである。言語仕様ではなく定理の側を概念に採る。
  c('lambda-calculus', 'λ 計算', '関数の適用と抽象だけで計算を書く', 'definition', 'cs', ['formalization']),
  c('church-rosser', 'Church–Rosser の定理', '簡約の順序を変えても行き着く先は一つ', 'theorem', 'cs', ['lambda-calculus']),
  c('evaluation-strategy', '評価戦略', '値呼びと名前呼び。答えは同じでも停止するかが違う', 'viewpoint', 'cs', ['church-rosser']),
  c('simply-typed-lambda', '単純型付き λ 計算', '型を付けると停止性が保証される', 'definition', 'cs', ['lambda-calculus']),
  c('strong-normalization', '強正規化', '型が付けば必ず停止する。だから万能ではなくなる', 'theorem', 'cs', ['simply-typed-lambda', 'halting-problem']),
  c('curry-howard', 'Curry–Howard 対応', '型は命題、プログラムは証明', 'theorem', 'cs', ['simply-typed-lambda', 'proof-system']),
  c('algebraic-data-type', '代数的データ型', '直和と直積。型は代数をなす', 'definition', 'cs', ['simply-typed-lambda']),
  c('polymorphism', '多相', 'System F。型を引数に取る', 'definition', 'cs', ['simply-typed-lambda']),
  c('subtyping', '部分型', '$S$ の値を $T$ の場所に置ける。関数にすると引数の向きが反る', 'definition', 'cs', ['simply-typed-lambda']),
  c('type-inference', '型推論', 'Hindley–Milner。単一化で型を復元する', 'technique', 'cs', ['polymorphism']),
  c('parametricity', 'パラメトリシティ', '型だけから定理が出る。自由定理', 'theorem', 'cs', ['polymorphism']),
  c('monad', 'モナド', '副作用を型に押し込む。合成の結合律だけが本体', 'definition', 'cs', ['algebraic-data-type', 'polymorphism']),
  c('applicative-vs-monad', '依存できるかどうか', '後の作用が前の結果に依るならモナド、依らないなら弱い方。弱いと形が先に分かる', 'theorem', 'cs', ['monad']),
  c('monad-transformer', 'モナド変換子', '作用を積み重ねる。$N$ 個に対して $N^2$ 個の実装が要る', 'technique', 'cs', ['monad']),
  c('algebraic-effects', '代数的作用', '作用を操作と等式に分解する。再開できる型付き例外', 'definition', 'cs', ['monad-transformer', 'effect-typing']),
]
