import { defineCollection } from 'astro:content'
// astro:content からの再輸出は Astro 7 で外れた。zod は astro/zod から取る。
import { z } from 'astro/zod'

import { typstLoader } from './lib/typst-loader.ts'

/**
 * 本文の HTML を左右するもの。digest に混ぜてキャッシュを無効化する。
 *
 * .typ とテンプレートだけを見ていると、後処理（見出しの id 付けなど）を
 * 直しても古い HTML が残る。目次が空のページが残る、という形で現れる。
 */
const DEPENDS_ON = ['src/typst', 'src/lib/typst-html.ts', 'src/lib/headings.ts'] as const

/**
 * .typ 側の #metadata((...))<fm> をここで検証する。
 * 型が合わなければビルドが止まるので、front matter の書き忘れが本番に出ない。
 */
const postSchema = z.object({
  title: z.string().min(1),
  date: z.coerce.date(),
  tags: z.array(z.string()).default([]),
  summary: z.string().optional(),
  draft: z.boolean().default(false),
  /**
   * 依存グラフの辺（src/lib/curriculum.ts）。
   *
   * requires は論理的な依存、uses は記法として借りているだけのもの。
   * 「この順で教わるのが普通」という慣習は書かない。慣習を辺に混ぜると、
   * 最短経路が既存のカリキュラムをなぞるだけのものになる。
   */
  provides: z.array(z.string()).default([]),
  requires: z.array(z.string()).default([]),
  uses: z.array(z.string()).default([]),
})

const posts = defineCollection({
  loader: typstLoader({
    dir: 'src/content/posts',
    expectedLang: 'ja',
    dependsOn: DEPENDS_ON,
    base: import.meta.env.BASE_URL.replace(/\/?$/, '/'),
  }),
  schema: postSchema,
})

/**
 * 分野ごとに書き下ろす解説記事。
 *
 * ファイルは src/content/articles/<field>/<series>/NN-slug.typ に置く。
 * ディレクトリは人が並べ替えやすいようにあるだけで、URL を決めるのは
 * この field / series / order の 3 つ。ファイルを移動しても URL は動かない。
 */
const articleSchema = postSchema.extend({
  field: z.string().min(1),
  series: z.string().min(1),
  order: z.number().int().min(1),
})

const articles = defineCollection({
  loader: typstLoader({
    dir: 'src/content/articles',
    expectedLang: 'ja',
    numberEquations: true,
    dependsOn: DEPENDS_ON,
    base: import.meta.env.BASE_URL.replace(/\/?$/, '/'),
  }),
  schema: articleSchema,
})

/**
 * lecture-notes から機械変換しただけの素材。
 * 組版が崩れたままのものが混じるので、分野目次には出さず /notes にまとめて置く。
 * 書き直したものは articles に移して昇格させる。
 */
const notes = defineCollection({
  loader: typstLoader({
    dir: 'src/content/notes',
    expectedLang: 'ja',
    numberEquations: true,
    dependsOn: DEPENDS_ON,
    base: import.meta.env.BASE_URL.replace(/\/?$/, '/'),
  }),
  schema: postSchema,
})

export type Post = z.infer<typeof postSchema>
export type Article = z.infer<typeof articleSchema>

export const collections = { posts, articles, notes }
