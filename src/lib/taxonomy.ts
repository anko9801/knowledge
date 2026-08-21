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
    blurb: '人工物ではなく、それを決めた制約で切る。x86 も Linux も概念ではなく事例である。',
  },
  {
    slug: 'chemistry',
    title: '化学',
    blurb: '経験則が本体の分野だが、対称性から決まる部分だけは論理で閉じる。そこだけを扱う。',
  },
  {
    slug: 'linguistics',
    title: '言語',
    blurb: 'どの文法理論が正しいかは経験的だが、意味をどう組み上げるかは型で決まる。',
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
    slug: 'quantum',
    field: 'physics',
    title: '量子力学',
    blurb:
      '公理を天下りで受け取らない。測定値が実数で、確率が 1 に足りてほしい。その要求を線形代数に翻訳すると、Hilbert 空間も自己随伴作用素も Born 則も出てくる。全 3 回。',
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
    slug: 'foundations',
    field: 'math',
    title: '土台',
    blurb:
      '幾何の連載が前提にしているもの。代数構造、ベクトル空間、微分、位相、完備性、滑らかさ。どれも「何を仮定すれば話が始まるか」だけを見る。全 6 回。',
  },
  {
    slug: 'groups',
    field: 'math',
    title: '群と表現',
    blurb:
      '対称性を測る道具としての群。連続な対称性は多様体になり、線形化すると括弧が残る。表現論を経て、各点に群を付けた束と、その曲率まで。全 4 回。',
  },
  {
    slug: 'measure',
    field: 'math',
    title: '測度と確率',
    blurb:
      '「測れる」を先に決めてから測る。Lebesgue 積分、確率空間、そして大数の法則と中心極限定理まで。確率論は測度論の言い換えである。全 4 回。',
  },
  {
    slug: 'linear-algebra',
    field: 'math',
    title: '線形代数',
    blurb:
      '基底を選ぶのをやめると、何が本当の構造だったかが見える。双対空間、テンソル、行列式は体積であること、そして内積を入れる代償。全 7 回。',
  },
  {
    slug: 'vector-analysis',
    field: 'math',
    title: 'ベクトル解析',
    blurb:
      'grad・div・rot は一つの微分であり、三つの積分定理は一つの定理である。3 次元でしか成り立たない偶然を剥がして、微分形式まで。全 6 回。',
  },
  {
    slug: 'differential-forms',
    field: 'math',
    title: '微分形式',
    blurb:
      '計量を使わずに微分と積分を作る。接ベクトルの定義から多様体、一般化された Stokes の定理、穴を数えるところ、そして位相の側との一致まで。全 8 回。',
  },
  {
    slug: 'riemannian-geometry',
    field: 'math',
    title: 'Riemann 幾何',
    blurb:
      '計量を入れる。テンソル解析の記法はここで出る。なぜ偏微分では足りないのか、接続・測地線・曲率、そして曲率が位相を縛ることまで。全 8 回。',
  },
  {
    slug: 'complexity',
    field: 'cs',
    title: '計算量理論',
    blurb:
      '「解けるか」の次は「現実的に解けるか」。Turing 機械から計算量クラス、多項式時間帰着を経て、Cook--Levin と Karp の還元の連鎖、そして空間と乱択まで。数理論理学の第 8 回の直接の続き。全 3 回。',
  },
  {
    slug: 'types',
    field: 'cs',
    title: '型と計算',
    blurb:
      '関数の適用と抽象だけで計算を書く。評価戦略、型推論、代数的データ型、そして型が命題でプログラムが証明であること。D と D→D が同型になる対象をどう作るか、という一つの障害から、型もドメイン理論も圏論も出てくる。全 8 回。',
  },
  {
    slug: 'programs',
    field: 'cs',
    title: 'プログラムの構成',
    blurb:
      '作法を数え上げても終わらないので、逆から行く。外から与えるものは機械・人の保持・人の誤り・変更の四つしかない。それを公理に置いて、goto をやめる理由も型を付ける理由も依存の向きも、そこから導く。導けなかったものは作法ではなく好みだと書く。導出が 1 回、実測との照合が 1 回。全 2 回。',
  },
  {
    slug: 'information',
    field: 'cs',
    title: '情報理論',
    blurb:
      '圧縮と通信の限界は、経験則ではなく確率論から出る。エントロピーから漸近等分割性、そして符号化定理 2 本まで。測度と確率の連載が前提。全 3 回。',
  },
  {
    slug: 'concurrency',
    field: 'cs',
    title: '並行と分散',
    blurb:
      '同時に動くものの「正しさ」を定義する。相互排除から線形化可能性、合意、そして FLP の不可能性まで。OS の三つの仕事（分離・並行・永続）も、要請から形が決まる。全 8 回。',
  },
  {
    slug: 'architecture',
    field: 'cs',
    title: '計算機の構成',
    blurb:
      '速い記憶は高い。依存のある命令は重ねられない。制約を先に置くと、メモリ階層もパイプラインも導かれる。x86 も ARM も、その解の一つでしかない。全 8 回。',
  },
  {
    slug: 'crypto',
    field: 'cs',
    title: '暗号理論',
    blurb:
      '「安全である」を帰着の言葉で定義する。一方向性関数から意味的安全性、公開鍵暗号、ゼロ知識証明まで。計算量理論が前提。全 6 回。',
  },
  {
    slug: 'symmetry',
    field: 'chemistry',
    title: '分子の対称性',
    blurb:
      '化学の大半は経験則だが、「この遷移は起きない」だけは群論から出る。点群、既約表現による分類、そして選択則まで。全 2 回。',
  },
  {
    slug: 'semantics',
    field: 'linguistics',
    title: '形式意味論',
    blurb:
      '文の意味を、部分の意味と組み方から計算する。型付き λ 計算で書くと、「すべての」のような語も関数として扱える。全 2 回。',
  },
]

export const findField = (slug: string): Field | undefined =>
  fields.find((field) => field.slug === slug)

export const findSeries = (field: string, slug: string): Series | undefined =>
  series.find((entry) => entry.field === field && entry.slug === slug)

/**
 * 連載の並び。宣言順がそのまま順位になる。
 *
 * 同じ概念を複数の連載が扱うとき（Stokes の定理はベクトル解析にも微分形式にも
 * ある）、読者をどちらへ送るかの判断に使う。**素朴な扱いから一般的な扱いへ**
 * 並べておくこと。宣言順を入れ替えると、記事ページの前提リンクの行き先が動く。
 */
export const seriesRank = (field: string, slug: string): number => {
  const at = series.findIndex((entry) => entry.field === field && entry.slug === slug)
  return at === -1 ? series.length : at
}

export const seriesOf = (field: string): readonly Series[] =>
  series.filter((entry) => entry.field === field)

/** 入口に立てた連載。複数あっても先に宣言したものを使う。 */
export const startSeries = (): Series | undefined => series.find((entry) => entry.start === true)
