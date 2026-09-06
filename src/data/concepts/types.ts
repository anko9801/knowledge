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
): Concept => ({ id, label, gist, kind, field, requires, empirical })
