/**
 * 概念グラフの上での計画。
 *
 * 一次データは概念（src/data/concepts.ts）である。記事はそこへの被覆でしかない。
 * だから「まだ書いていない領域」も同じグラフの上に乗り、執筆計画が立つ。
 * 記事から生やしたグラフでは、書いていない場所が存在しないので計画に使えない。
 *
 * 辺は論理的な依存だけを持つ。「この順で教わるのが普通」という慣習は入れない。
 */

export type Concept = {
  readonly id: string
  readonly label: string
  readonly gist: string
  readonly kind: string
  readonly field: string
  readonly requires: readonly string[]
}

/** 概念を被覆する記事。 */
export type Coverage = {
  readonly id: string
  readonly title: string
  readonly provides: readonly string[]
}

export type Step = {
  readonly concept: Concept
  /** この概念を扱っている記事。無ければ執筆待ち。 */
  readonly article?: Coverage
}

export type Plan = {
  /** 依存順。前提が先に来る。 */
  readonly steps: readonly Step[]
  /** 記事のある概念の数。 */
  readonly covered: number
  /** 記事の無い概念。これが執筆キューになる。 */
  readonly missing: readonly Concept[]
  /** 概念グラフに載っていない id。参照の書き間違い。 */
  readonly unknown: readonly string[]
}

const index = (concepts: readonly Concept[]): Map<string, Concept> =>
  new Map(concepts.map((concept) => [concept.id, concept]))

const coverageIndex = (articles: readonly Coverage[]): Map<string, Coverage> => {
  const map = new Map<string, Coverage>()
  for (const article of articles) {
    for (const id of article.provides) {
      // 同じ概念を複数の記事が扱うときは、先に宣言されたほうを採る。
      if (!map.has(id)) map.set(id, article)
    }
  }
  return map
}

/**
 * 目標から前提をすべて遡る。
 *
 * すでに知っている概念で打ち切る。そこから先を遡っても、読む必要が無いからである。
 * 後から差し引くのでは、要らない祖先まで計画に混ざる。
 */
export const closure = (
  concepts: readonly Concept[],
  targets: readonly string[],
  known: ReadonlySet<string> = new Set(),
): { ids: string[]; unknown: string[] } => {
  const byId = index(concepts)
  const seen = new Set<string>()
  const unknown = new Set<string>()
  const stack = targets.filter((id) => !known.has(id))

  while (stack.length > 0) {
    const id = stack.pop() as string
    if (seen.has(id) || unknown.has(id)) continue
    const concept = byId.get(id)
    if (concept === undefined) {
      unknown.add(id)
      continue
    }
    seen.add(id)
    stack.push(...concept.requires.filter((dep) => !known.has(dep)))
  }

  return { ids: [...seen], unknown: [...unknown].sort() }
}

/** 依存順に並べる。循環していれば id 順で切って、落とさずに返す。 */
const topological = (concepts: readonly Concept[], ids: readonly string[]): Concept[] => {
  const byId = index(concepts)
  const inScope = new Set(ids)
  const remaining = new Set(ids)
  const done = new Set<string>()
  const sorted: Concept[] = []

  while (remaining.size > 0) {
    const ready = [...remaining]
      .filter((id) =>
        (byId.get(id)?.requires ?? []).every((dep) => !inScope.has(dep) || done.has(dep)),
      )
      .sort()
    const batch = ready.length > 0 ? ready : [...remaining].sort()
    for (const id of batch) {
      const concept = byId.get(id)
      if (concept) sorted.push(concept)
      done.add(id)
      remaining.delete(id)
    }
  }

  return sorted
}

/** 目標に到達するための、概念の依存順と、記事の有無。 */
export const planFor = (
  concepts: readonly Concept[],
  articles: readonly Coverage[],
  targets: readonly string[],
  options: { readonly known?: readonly string[] } = {},
): Plan => {
  const known = new Set(options.known ?? [])
  const { ids, unknown } = closure(concepts, targets, known)
  const covers = coverageIndex(articles)

  const steps = topological(concepts, ids).map((concept) => ({
    concept,
    article: covers.get(concept.id),
  }))

  return {
    steps,
    covered: steps.filter((step) => step.article !== undefined).length,
    missing: steps.filter((step) => step.article === undefined).map((step) => step.concept),
    unknown,
  }
}

/**
 * 書く価値の順。
 *
 * ある概念を書くと、その下流にある概念がいくつ「前提が揃った」状態に近づくか。
 * ここでは素朴に、その概念を（推移的に）必要とする概念の数を数える。
 * 前提がまだ書かれていないものは、書いても読者が読めないので後ろへ回す。
 */
export type Leverage = {
  readonly concept: Concept
  /** これを必要とする概念の数（推移的）。 */
  readonly unlocks: number
  /** 前提がすべて記事になっているか。すぐ書けるか。 */
  readonly ready: boolean
}

export const backlog = (
  concepts: readonly Concept[],
  articles: readonly Coverage[],
): readonly Leverage[] => {
  const covers = coverageIndex(articles)
  const dependents = new Map<string, Set<string>>()
  for (const concept of concepts) dependents.set(concept.id, new Set())

  // 推移的な依存を、全概念について閉包を取って数える。概念数が小さいので素朴でよい。
  for (const concept of concepts) {
    const { ids } = closure(concepts, [concept.id])
    for (const id of ids) {
      if (id !== concept.id) dependents.get(id)?.add(concept.id)
    }
  }

  return concepts
    .filter((concept) => !covers.has(concept.id))
    .map((concept) => ({
      concept,
      unlocks: dependents.get(concept.id)?.size ?? 0,
      ready: concept.requires.every((dep) => covers.has(dep)),
    }))
    .sort((a, b) => {
      if (a.ready !== b.ready) return a.ready ? -1 : 1
      if (a.unlocks !== b.unlocks) return b.unlocks - a.unlocks
      return a.concept.id < b.concept.id ? -1 : 1
    })
}

/** 記事が名乗っているのに概念グラフに無いもの。データのずれを検出する。 */
export const drift = (
  concepts: readonly Concept[],
  articles: readonly Coverage[],
): readonly string[] => {
  const byId = index(concepts)
  const stray = new Set<string>()
  for (const article of articles) {
    for (const id of article.provides) {
      if (!byId.has(id)) stray.add(id)
    }
  }
  return [...stray].sort()
}

/** 依存の循環。あれば概念グラフの書き間違いである。 */
export const findCycles = (concepts: readonly Concept[]): readonly (readonly string[])[] => {
  const byId = index(concepts)
  const cycles: string[][] = []
  const state = new Map<string, 'visiting' | 'done'>()

  const walk = (id: string, stack: string[]): void => {
    const mark = state.get(id)
    if (mark === 'done') return
    if (mark === 'visiting') {
      const start = stack.indexOf(id)
      cycles.push(stack.slice(start === -1 ? 0 : start))
      return
    }
    state.set(id, 'visiting')
    for (const dep of byId.get(id)?.requires ?? []) {
      if (byId.has(dep)) walk(dep, [...stack, id])
    }
    state.set(id, 'done')
  }

  for (const concept of [...concepts].sort((a, b) => (a.id < b.id ? -1 : 1))) walk(concept.id, [])
  return cycles
}

/** requires に挙がっているのに、概念として定義されていない id。 */
export const danglingConcepts = (concepts: readonly Concept[]): readonly string[] => {
  const byId = index(concepts)
  const missing = new Set<string>()
  for (const concept of concepts) {
    for (const dep of concept.requires) {
      if (!byId.has(dep)) missing.add(dep)
    }
  }
  return [...missing].sort()
}
