/**
 * 概念の型と、書くときのヘルパ。
 *
 * データ本体は同じディレクトリの連載ごとのファイルにある。
 * 1 ファイルだったころは、複数の連載を並列で広げると必ずここで衝突した。
 *
 * ここが一次データである。記事があるかどうかとは無関係に、
 * 「何を理解するには何が要るか」だけを書く。
 *
 * 記事はこのグラフへの被覆にすぎない。被覆されていない概念が執筆待ちであり、
 * それを依存順に並べたものが執筆キューになる。
 * 記事から生やしたグラフでは、まだ書いていない領域が見えないので計画に使えない。
 *
 * 辺は論理的な依存だけ。「この順で教わるのが普通」という慣習は書かない。
 * 慣習を混ぜると、計画が既存のカリキュラムをなぞるだけのものになる。
 */

export type ConceptKind =
  /** 定義。何かを名指しできるようになる */
  | 'definition'
  /** 定理。証明を伴う主張 */
  | 'theorem'
  /** 技法。計算できるようになる */
  | 'technique'
  /** 見方。同じ対象の捉え直し */
  | 'viewpoint'

export type Concept = {
  readonly id: string
  readonly label: string
  /** 一行で何か。記事を書くときの主題になる。 */
  readonly gist: string
  readonly kind: ConceptKind
  readonly field: string
  /**
   * 論理的な依存。定義に現れるか、証明が引用する。文献で確かめられる。
   * 「この順で教わるのが普通」という慣習はここに書かない。
   */
  readonly requires: readonly string[]
  /**
   * 経験的な依存。分野の慣行として必要だが、論理的必然ではない。
   * requires と混ぜると最短経路が慣習で汚染されるので、別の辺にする。
   */
  readonly empirical?: readonly string[]
  /**
   * 同じものを指す、別の名前。
   *
   * **読者が持ってくるのはこちらの名前であることが多い。** 分野が違えば
   * 呼び方も違うし、教科書ごとに違う。「スペクトル表示」しか置いていないと、
   * Källén--Lehmann 表示で探しに来た読者に何も当たらない。
   *
   * 重複を一つに畳んだときは、**畳んだ側の名前をここへ移す。** 消さない。
   * 判定の仕方は docs/decisions.md「分野をまたぐ重複は、三つの型に分けて処理する」。
   */
  readonly aka?: readonly string[]
}

/**
 * 片方が仮定として置いたものを、もう片方が定理として出す関係。
 *
 * requires ではない。仮定を導く定理は、その仮定より**後**に来る。
 * 依存の辺として書くと循環するか、順序が逆さになる。
 *
 * 分野をまたぐので、概念の側ではなく `derivations.ts` にまとめて置く。
 * どちらのファイルが持つべきかが決まらないし、片側だけ直すと壊れる。
 */
export type Derivation = {
  /** 仮定として置いている側 */
  readonly assumed: string
  /** それを定理として出す側 */
  readonly derived: string
  /** 何が仮定から定理へ変わるのか。記事の結びに使う */
  readonly note: string
}

/** 到達したい地点。執筆計画はここから逆算する。 */
export type Goal = {
  readonly id: string
  readonly label: string
  readonly needs: readonly string[]
}

export const c = (
  id: string,
  label: string,
  gist: string,
  kind: ConceptKind,
  field: string,
  requires: readonly string[] = [],
  empirical: readonly string[] = [],
  // 位置引数はここで打ち止め。以降に足すものは名前で渡す。
  more: { readonly aka?: readonly string[] } = {},
): Concept => ({ id, label, gist, kind, field, requires, empirical, ...more })
