/**
 * 依存グラフと、目標から逆算した読む順序。
 *
 * 前提には少なくとも二種類ある。
 *
 *   logical  その概念が無いと定義も証明も書けない。外せない
 *   notation その記法を借りているだけ。別の書き方をすれば要らない
 *
 * 大学のシラバスから吸い出せる「前提」はたいてい三つ目——教育的な慣習——で、
 * 遠回りの正体はそこにある。ここでは慣習を辺として持たない。
 * 持たないことが、このデータの値打ちになる。
 *
 * 節点は記事、辺は概念を介して張る。同じ概念を複数の記事が provide しうるので、
 * 「どの経路で到達するか」に選択が残る（AND/OR グラフ）。
 */

/** 記事 1 本。front matter の provides / requires / uses から作る。 */
export type Node = {
  /** `math/linear-algebra/2` のような、記事を一意に指す文字列。 */
  readonly id: string
  readonly title: string
  /** 読む手間。既定は 1（本数を数える）。文字数などを入れてもよい。 */
  readonly cost: number
  /** この記事を読むと使えるようになる概念。 */
  readonly provides: readonly string[]
  /** 論理的に要る概念。これが無いと本文が書けない。 */
  readonly requires: readonly string[]
  /** 記法として借りている概念。読まなくても筋は追える。 */
  readonly uses: readonly string[]
}

export type Plan = {
  /** 読む順。前提が先に来る。 */
  readonly order: readonly Node[]
  readonly cost: number
  /** 誰も provide していない概念。データの穴を表す。 */
  readonly missing: readonly string[]
  /** notation 辺を辿らなかったために外した概念。 */
  readonly deferred: readonly string[]
}

export type PlanOptions = {
  /** 記法の依存も満たしにいく。既定は false（論理的な依存だけ辿る）。 */
  readonly includeNotation?: boolean
  /** すでに理解している概念。ここから先だけを計画する。 */
  readonly known?: readonly string[]
}

/** 概念 → それを provide する記事たち。 */
const providerIndex = (nodes: readonly Node[]): Map<string, Node[]> => {
  const index = new Map<string, Node[]>()
  for (const node of nodes) {
    for (const concept of node.provides) {
      const list = index.get(concept)
      if (list) list.push(node)
      else index.set(concept, [node])
    }
  }
  return index
}

const depsOf = (node: Node, includeNotation: boolean): readonly string[] =>
  includeNotation ? [...node.requires, ...node.uses] : node.requires

/**
 * 必要な記事を選ぶ。
 *
 * 概念を 1 つ増やすたびに、それを provide する記事の依存がさらに増える。
 * 増えなくなるまで回す（不動点）。
 *
 * 概念に provider が複数あるときは重み付き集合被覆になり、厳密解は NP 困難である。
 * ここは貪欲法で、1 記事あたり「新たに満たせる概念の数 / コスト」が最大のものを取る。
 * 実データでは provider が 1 つしかない概念がほとんどなので、たいてい選択の余地は無い。
 */
const select = (
  nodes: readonly Node[],
  targets: readonly string[],
  options: PlanOptions,
): { chosen: Set<Node>; missing: Set<string>; deferred: Set<string> } => {
  const includeNotation = options.includeNotation ?? false
  const known = new Set(options.known ?? [])
  const providers = providerIndex(nodes)

  const chosen = new Set<Node>()
  const covered = new Set(known)
  const missing = new Set<string>()
  const deferred = new Set<string>()
  const needed = new Set(targets.filter((c) => !known.has(c)))

  for (;;) {
    const open = [...needed].filter((c) => !covered.has(c) && !missing.has(c))
    if (open.length === 0) break

    // provider の無い概念は、これ以上たどれない。穴として記録して打ち切る。
    const reachable = open.filter((c) => (providers.get(c)?.length ?? 0) > 0)
    for (const concept of open) {
      if (!reachable.includes(concept)) missing.add(concept)
    }
    if (reachable.length === 0) continue

    const candidates = new Set<Node>()
    for (const concept of reachable) {
      for (const node of providers.get(concept) ?? []) candidates.add(node)
    }

    let best: Node | undefined
    let bestScore = -Infinity
    for (const node of candidates) {
      if (chosen.has(node)) continue
      const gain = node.provides.filter((c) => reachable.includes(c)).length
      const score = gain / Math.max(node.cost, Number.EPSILON)
      // 同点は id で決める。入力の並び順で結果が変わらないようにする。
      if (score > bestScore || (score === bestScore && best !== undefined && node.id < best.id)) {
        best = node
        bestScore = score
      }
    }
    if (best === undefined) break

    chosen.add(best)
    for (const concept of best.provides) covered.add(concept)
    for (const concept of depsOf(best, includeNotation)) {
      if (!covered.has(concept)) needed.add(concept)
    }
    if (!includeNotation) {
      for (const concept of best.uses) {
        if (!covered.has(concept)) deferred.add(concept)
      }
    }
  }

  for (const concept of covered) deferred.delete(concept)
  return { chosen, missing, deferred }
}

/**
 * 選んだ記事を読む順に並べる。
 *
 * 記事 A が provide する概念を記事 B が requires するなら、A が先。
 * 循環があれば、それは依存の書き間違いなので、残りを id 順に足して先へ進む
 * （黙って落とさない）。
 */
const order = (chosen: readonly Node[], includeNotation: boolean): Node[] => {
  const inPlan = new Map<string, Node>()
  for (const node of chosen) {
    for (const concept of node.provides) inPlan.set(concept, node)
  }

  const remaining = new Set(chosen)
  const done = new Set<Node>()
  const sorted: Node[] = []

  while (remaining.size > 0) {
    const ready = [...remaining]
      .filter((node) =>
        depsOf(node, includeNotation).every((c) => {
          const provider = inPlan.get(c)
          return provider === undefined || provider === node || done.has(provider)
        }),
      )
      .sort((a, b) => (a.id < b.id ? -1 : 1))

    // 循環しているぶんは id 順で切る。順序は不正確になるが、記事は落とさない。
    const batch = ready.length > 0 ? ready : [...remaining].sort((a, b) => (a.id < b.id ? -1 : 1))
    for (const node of batch) {
      sorted.push(node)
      done.add(node)
      remaining.delete(node)
    }
  }

  return sorted
}

/** 目標の概念に到達するための、最小の読む順序。 */
export const planFor = (
  nodes: readonly Node[],
  targets: readonly string[],
  options: PlanOptions = {},
): Plan => {
  const { chosen, missing, deferred } = select(nodes, targets, options)
  const list = order([...chosen], options.includeNotation ?? false)
  return {
    order: list,
    cost: list.reduce((sum, node) => sum + node.cost, 0),
    missing: [...missing].sort(),
    deferred: [...deferred].sort(),
  }
}

/** 依存の循環。あれば front matter の書き間違いである。 */
export const findCycles = (nodes: readonly Node[]): readonly (readonly string[])[] => {
  const providers = providerIndex(nodes)
  const cycles: string[][] = []
  const state = new Map<string, 'visiting' | 'done'>()

  const walk = (node: Node, stack: string[]): void => {
    const mark = state.get(node.id)
    if (mark === 'done') return
    if (mark === 'visiting') {
      const start = stack.indexOf(node.id)
      cycles.push(stack.slice(start === -1 ? 0 : start))
      return
    }
    state.set(node.id, 'visiting')
    for (const concept of node.requires) {
      for (const provider of providers.get(concept) ?? []) {
        if (provider !== node) walk(provider, [...stack, node.id])
      }
    }
    state.set(node.id, 'done')
  }

  for (const node of [...nodes].sort((a, b) => (a.id < b.id ? -1 : 1))) walk(node, [])
  return cycles
}

/** provider の無い概念。データの穴の一覧。 */
export const danglingConcepts = (nodes: readonly Node[]): readonly string[] => {
  const providers = providerIndex(nodes)
  const wanted = new Set<string>()
  for (const node of nodes) {
    for (const concept of [...node.requires, ...node.uses]) {
      if (!providers.has(concept)) wanted.add(concept)
    }
  }
  return [...wanted].sort()
}
