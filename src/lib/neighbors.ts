/**
 * 記事の前後を、概念グラフから引く。
 *
 * 連載の前後（第 2 回の次は第 3 回）は編集上の並びでしかない。読者が知りたいのは
 * 「この回を読むのに何が要るか」「この回はどこで効くか」で、それは概念グラフが
 * 持っている。記事は provides を名乗るだけなので、辺は概念側から取る。
 *
 * 前提は直接の requires だけを見る。推移的に遡ると集合論まで戻ってしまい、
 * 「この回の直前に要るもの」という問いに答えられなくなる。
 *
 * 概念単位のままだと同じ記事が何度も並ぶ（「確率空間」と「条件付き期待値」で
 * 第 3 回が 2 回出る）ので、記事ごとに畳んで、理由の概念を添える形にする。
 */

export type Concept = {
  readonly id: string
  readonly label: string
  readonly gist: string
  readonly requires: readonly string[]
}

/** 概念を被覆する記事。href の組み立ては呼び出し側の責任。 */
export type Article = {
  readonly key: string
  readonly title: string
  readonly href: string
  /** 連載の題名。「微分形式 第 3 回」の前半。 */
  readonly series: string
  /**
   * 連載の並び（taxonomy.ts の宣言順）。素朴なものから一般的なものへ並んでいる。
   * 同じ概念を複数の連載が扱うとき、どれへ送るかの判断に使う。
   */
  readonly rank: number
  readonly order: number
  readonly provides: readonly string[]
}

/** 記事へのリンク 1 本と、それが挙がってきた理由の概念。 */
export type Link = {
  readonly article: Article
  /** この記事が供給している（または必要としている）概念。並びは宣言順。 */
  readonly concepts: readonly Concept[]
}

/** 記事がまだ無い前提。読者には「ここに穴がある」とだけ伝える。 */
export type Gap = {
  readonly concept: Concept
}

export type Neighbors = {
  /** この回を読むのに要るもの。記事があるものと、まだ無いもの。 */
  readonly requires: readonly Link[]
  readonly gaps: readonly Gap[]
  /** この回を前提にしている回。記事があるものだけ。 */
  readonly unlocks: readonly Link[]
}

const indexConcepts = (concepts: readonly Concept[]): ReadonlyMap<string, Concept> =>
  new Map(concepts.map((concept) => [concept.id, concept]))

/**
 * 概念 id から、それを扱う記事すべてへ。
 *
 * 一つの概念に複数の家がある。Stokes の定理はベクトル解析（$RR^3$）と微分形式
 * （一般）の両方にあり、楔積は線形代数・ベクトル解析・微分形式の三つにある。
 * どれも間違いではなく、扱う一般性が違うだけなので、ここでは絞らない。
 */
const coverage = (articles: readonly Article[]): ReadonlyMap<string, Article[]> => {
  const map = new Map<string, Article[]>()
  for (const article of articles) {
    for (const id of article.provides) {
      const held = map.get(id)
      if (held === undefined) map.set(id, [article])
      else if (!held.some((other) => other.key === article.key)) held.push(article)
    }
  }
  return map
}

/**
 * 複数の家から一つを選ぶ。**読者にいちばん近い扱いへ送る。**
 *
 * 連載は taxonomy.ts に素朴なものから一般的なものへ並べてある。読者がいま
 * 微分形式にいるなら Stokes は微分形式の回へ、Riemann 幾何にいるなら手前で
 * いちばん近い微分形式の回へ送る。先へ送るのは、手前に一つも無いときだけ。
 */
const nearest = (candidates: readonly Article[], self: Article): Article => {
  const behind = candidates.filter((article) => article.rank <= self.rank)
  const pool = behind.length > 0 ? behind : candidates
  const gap = (article: Article) => Math.abs(article.rank - self.rank)

  return pool.reduce((best, article) => {
    if (gap(article) !== gap(best)) return gap(article) < gap(best) ? article : best
    return article.order < best.order ? article : best
  })
}

/** 概念の列を記事ごとに畳む。記事の並びは、最初に挙がってきた順を保つ。 */
const foldByArticle = (
  ids: readonly string[],
  byId: ReadonlyMap<string, Concept>,
  covers: ReadonlyMap<string, Article[]>,
  self: Article,
): readonly Link[] => {
  const buckets = new Map<string, { article: Article; concepts: Concept[] }>()
  for (const id of ids) {
    const homes = covers.get(id)
    const concept = byId.get(id)
    if (homes === undefined || concept === undefined) continue
    const article = nearest(homes, self)
    const bucket = buckets.get(article.key)
    if (bucket === undefined) buckets.set(article.key, { article, concepts: [concept] })
    else bucket.concepts.push(concept)
  }
  return [...buckets.values()]
}

/**
 * ある記事の前後を引く。
 *
 * `exclude` に挙げた記事は落とす。連載の前後ナビにすぐ上で出しているものを
 * ここでも並べると、同じリンクが二度出るだけになる。
 */
export const neighborsOf = (
  concepts: readonly Concept[],
  articles: readonly Article[],
  self: Article,
  exclude: readonly string[] = [],
): Neighbors => {
  const byId = indexConcepts(concepts)
  const covers = coverage(articles)
  const mine = new Set(self.provides)
  const skip = new Set([self.key, ...exclude])

  const dedupe = (ids: readonly string[]): readonly string[] => {
    const seen = new Set<string>()
    return ids.filter((id) => {
      // 自分が供給している概念は前提にも下流にも出さない。同じ回で片が付いている。
      if (mine.has(id) || seen.has(id)) return false
      seen.add(id)
      return true
    })
  }

  const required = dedupe(self.provides.flatMap((id) => byId.get(id)?.requires ?? []))

  const dependents = concepts
    .filter((concept) => concept.requires.some((dep) => mine.has(dep)))
    .map((concept) => concept.id)

  const drop = (link: Link) => !skip.has(link.article.key)

  return {
    requires: foldByArticle(required, byId, covers, self).filter(drop),
    gaps: required
      .filter((id) => !covers.has(id))
      .map((id) => byId.get(id))
      .filter((concept): concept is Concept => concept !== undefined)
      .map((concept) => ({ concept })),
    unlocks: foldByArticle(dedupe(dependents), byId, covers, self).filter(drop),
  }
}
