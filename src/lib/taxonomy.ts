/**
 * 分野とシリーズの定義。
 *
 * 記事側の front matter は field / series をスラッグで持つだけにして、
 * 題名や説明文はここに集約する。分野の見出しを直したいときに、
 * その分野の記事を全部書き換えなくて済む。
 */

export type Field = {
  /** URL の第 1 階層。`/math/...` */
  readonly slug: string
  readonly title: string
  /** 分野グリッドに出す 1 行紹介。 */
  readonly blurb: string
}

export type Series = {
  /** URL の第 2 階層。`/math/set-theory/...` */
  readonly slug: string
  readonly field: string
  readonly title: string
  readonly blurb: string
  /**
   * このサイトの入口。まだ何も読んでいない人には、ここの第 1 回だけを示す。
   * 道を 1 本に絞るのは、並んだ選択肢の前で立ち止まらせないため。1 つだけ立てる。
   */
  readonly start?: boolean
}

/** 並び順は宣言順。分野グリッドと分野目次はこの順に出る。 */
export const fields: readonly Field[] = [
  {
    slug: 'math',
    title: '数学',
    blurb: '集合論から始めて、代数・幾何・解析へ。定義がなぜその形なのかを毎回考える。',
  },
  {
    slug: 'physics',
    title: '物理',
    blurb: '力学・電磁気・量子・統計。式の導出よりも、何を仮定したのかを追う。',
  },
  {
    slug: 'cs',
    title: '計算機',
    blurb: '計算とは何か。アルゴリズム、計算量、型と論理。',
  },
]

export const series: readonly Series[] = [
  {
    slug: 'logic',
    field: 'math',
    title: '数理論理学',
    blurb:
      '証明そのものを数学の対象にする。完全性定理から Löwenheim–Skolem を経て、不完全性定理まで。全 10 回。',
  },
  {
    slug: 'mechanics',
    field: 'physics',
    title: '解析力学',
    blurb:
      'Newton の運動方程式を書き換える。変分原理から Noether の定理、正準形式を経て、量子化の入口まで。',
  },
  {
    slug: 'set-theory',
    field: 'math',
    title: '集合論',
    start: true,
    blurb:
      '素朴集合論の破綻から、順序数・基数・選択公理を経て、連続体仮説の独立性と記述集合論まで。全 12 回。',
  },
  {
    slug: 'vector-analysis',
    field: 'math',
    title: 'ベクトル解析',
    blurb:
      'grad・div・rot は一つの微分であり、三つの積分定理は一つの定理である。3 次元でしか成り立たない偶然を剥がして、微分形式まで。',
  },
]

export const findField = (slug: string): Field | undefined =>
  fields.find((field) => field.slug === slug)

export const findSeries = (field: string, slug: string): Series | undefined =>
  series.find((entry) => entry.field === field && entry.slug === slug)

export const seriesOf = (field: string): readonly Series[] =>
  series.filter((entry) => entry.field === field)

/** 入口に立てた連載。複数あっても先に宣言したものを使う。 */
export const startSeries = (): Series | undefined => series.find((entry) => entry.start === true)
