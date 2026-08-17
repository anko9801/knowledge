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
  }),
  schema: postSchema,
})

/**
 * lecture-notes から Typst に移行した講義ノート。
 * 記事と同じ経路（typst compile / typst eval）を通るので、front matter も同じ形。
 */
const notes = defineCollection({
  loader: typstLoader({
    dir: 'src/content/notes',
    expectedLang: 'ja',
    numberEquations: true,
  }),
  schema: postSchema,
})

export type Post = z.infer<typeof postSchema>

export const collections = { posts, notes }
