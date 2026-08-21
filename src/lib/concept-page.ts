/**
 * 概念から引く。
 *
 * 記事は連載として順に読む形で並んでいるが、検索から来る読者は
 * **語で来る。**「σ 加法族」を調べに来た人に、測度と確率 第 1 回の全文を
 * 渡すのは遠回りである。語から入って、その語が住んでいる場所へ送りたい。
 *
 * 出すのは 4 つだけ。何か（一行）、どこで読めるか、何が要るか、何に使うか。
 * **解説はここに書かない。** 記事が本体で、これは索引である。
 * グラフを主役にした先例（Metacademy）は、グラフ自体が商品だったので
 * 手入れが止まった時点で残るものが無かった。
 *
 * **記事のある概念だけを出す。** 記事の無い概念にページを与えても、読者は
 * そこから何もできない。それは執筆キューであって読者向けの情報ではない、
 * という既存の判断（`neighbors.ts` の下流と同じ）に揃える。
 */

export type Concept = {
  readonly id: string
  readonly label: string
  readonly gist: string
  readonly kind: string
  readonly field: string
  readonly requires: readonly string[]
}

/** 概念を扱っている記事。 */
export type Home = {
  readonly href: string
  /** 「測度と確率 第 1 回」。 */
  readonly where: string
  readonly title: string
}

/** 隣の概念。記事があるものだけ href を持つ。 */
export type Neighbor = {
  readonly concept: Concept
  readonly href?: string
}

export type ConceptPage = {
  readonly concept: Concept
  readonly home: Home
  /** これを理解するのに要るもの。 */
  readonly requires: readonly Neighbor[]
  /** これを使うもの。 */
  readonly usedBy: readonly Neighbor[]
}

const byLabel = (a: Neighbor, b: Neighbor): number =>
  a.concept.label.localeCompare(b.concept.label, 'ja')

/**
 * 記事のある概念について、索引に出す材料を組む。
 *
 * `homes` は概念 id から記事へ。記事の無い概念はここに載らないので、
 * そのまま「ページを作らない」判断に使える。
 */
export const conceptPages = (
  concepts: readonly Concept[],
  homes: ReadonlyMap<string, Home>,
): readonly ConceptPage[] => {
  const byId = new Map(concepts.map((concept) => [concept.id, concept]))

  // 逆向きの辺は一度だけ組む。概念ごとに全体を走ると 400 × 400 になる。
  const usedBy = new Map<string, Concept[]>()
  for (const concept of concepts) {
    for (const dep of concept.requires) {
      const list = usedBy.get(dep)
      if (list === undefined) usedBy.set(dep, [concept])
      else list.push(concept)
    }
  }

  const neighbor = (id: string): Neighbor | undefined => {
    const concept = byId.get(id)
    if (concept === undefined) return undefined
    const home = homes.get(id)
    return home === undefined ? { concept } : { concept, href: home.href }
  }

  const found = (list: readonly (Neighbor | undefined)[]): Neighbor[] =>
    list.filter((item): item is Neighbor => item !== undefined)

  return concepts
    .filter((concept) => homes.has(concept.id))
    .map((concept) => ({
      concept,
      home: homes.get(concept.id) as Home,
      requires: found(concept.requires.map(neighbor)).sort(byLabel),
      usedBy: found((usedBy.get(concept.id) ?? []).map((c) => neighbor(c.id))).sort(byLabel),
    }))
}
