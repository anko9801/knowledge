import { defineCollection, z } from 'astro:content'

import { typstLoader } from './lib/typst-loader.ts'

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
})

const posts = defineCollection({
  loader: typstLoader({
    dir: 'src/content/posts',
    expectedLang: 'ja',
    dependsOn: ['src/typst'],
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
    dependsOn: ['src/typst'],
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
    dependsOn: ['src/typst'],
    base: import.meta.env.BASE_URL.replace(/\/?$/, '/'),
  }),
  schema: postSchema,
})

export type Post = z.infer<typeof postSchema>
export type Article = z.infer<typeof articleSchema>

export const collections = { posts, articles, notes }
