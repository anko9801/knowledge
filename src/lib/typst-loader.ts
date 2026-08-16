import type { Loader, LoaderContext } from 'astro/loaders'
import { readdir, readFile } from 'node:fs/promises'
import { basename, extname, join, relative } from 'node:path'
import { createHash } from 'node:crypto'

import { compileHtml, evalMetadata } from './typst-cli.ts'
import { extractStyles, splitDocument } from './typst-html.ts'

export type TypstLoaderOptions = {
  /** .typ を置くディレクトリ（プロジェクトルートからの相対パス）。 */
  readonly dir: string
  /** typst 実行ファイル。devShell 経由なら PATH 上の "typst" でよい。 */
  readonly bin?: string
  /** #set text(lang: ...) に期待する値。ズレたら警告する。 */
  readonly expectedLang?: string
}

type EntryResult = {
  readonly id: string
  readonly mathCss: string
}

const listTypstFiles = async (dir: string): Promise<readonly string[]> => {
  const entries = await readdir(dir, { withFileTypes: true })

  return entries
    .filter((entry) => entry.isFile() && extname(entry.name) === '.typ')
    .map((entry) => join(dir, entry.name))
    .sort()
}

const digest = (input: string): string =>
  createHash('sha256').update(input).digest('hex').slice(0, 16)

/**
 * .typ を Astro の Content Collection として読み込む。
 *
 * 1 記事につき typst を 2 回呼ぶ:
 *   compile --format html  -> 本文 HTML
 *   eval    query(<fm>)    -> front matter (JSON)
 *
 * front matter を HTML から復元しようとしない点が肝で、見出し構造の変更に
 * ビルドが巻き込まれない。digest を突き合わせて変更のないファイルは再利用する。
 */
export const typstLoader = (options: TypstLoaderOptions): Loader => {
  const { dir, bin = process.env.TYPST_BIN ?? 'typst', expectedLang } = options

  /** 1 ファイルをコンパイルしてストアに入れる。full load と watch の両方から使う。 */
  const ingest = async (
    file: string,
    context: LoaderContext,
    root: string,
  ): Promise<EntryResult> => {
    const { store, logger, parseData } = context
    const id = basename(file, '.typ')
    const typstOptions = { bin, root } as const

    const source = await readFile(file, 'utf8')
    const sourceDigest = digest(source)

    const cached = store.get(id)
    if (cached?.digest === sourceDigest) {
      const cachedCss = (cached.data as { readonly mathCss?: string }).mathCss ?? ''
      return { id, mathCss: cachedCss }
    }

    const html = await compileHtml(file, typstOptions)
    const raw = await evalMetadata(file, typstOptions)
    const { body, head, lang } = splitDocument(html, relative(root, file))

    if (expectedLang && lang !== expectedLang) {
      logger.warn(
        `${id}: <html lang="${lang}"> です。` +
          `#set text(lang: "${expectedLang}") を入れないと ` +
          `text-spacing-trim / word-break: auto-phrase が効きません。`,
      )
    }

    const data = await parseData({
      id,
      data: raw as Record<string, unknown>,
      filePath: file,
    })

    store.set({
      id,
      data,
      body,
      digest: sourceDigest,
      filePath: relative(root, file),
      rendered: { html: body },
    })

    logger.info(`${id} (${Buffer.byteLength(body)} bytes)`)

    return { id, mathCss: extractStyles(head) }
  }

  return {
    name: 'typst-loader',

    load: async (context: LoaderContext) => {
      const { store, logger, watcher, config } = context
      const root = config.root.pathname
      const absoluteDir = join(root, dir)

      const files = await listTypstFiles(absoluteDir)
      if (files.length === 0) {
        logger.warn(`${dir} に .typ が 1 つもありません`)
      }

      const results: EntryResult[] = []
      for (const file of files) {
        results.push(await ingest(file, context, root))
      }

      // 削除された .typ をストアから落とす。
      const live = new Set(results.map((result) => result.id))
      for (const key of store.keys()) {
        if (!live.has(key)) store.delete(key)
      }

      // 全記事の <head> CSS は同一のはずなので、食い違ったら前提が崩れている
      // （typst のバージョン混在など）。共有 CSS として配れなくなる。
      const variants = new Set(results.map((result) => result.mathCss).filter(Boolean))
      if (variants.size > 1) {
        logger.warn(
          `MathML stylesheet が ${variants.size} 種類ありました。` +
            `共有 CSS として配れないので typst のバージョンを揃えてください。`,
        )
      }

      if (!watcher) return

      watcher.add(absoluteDir)
      watcher.on('change', async (changed) => {
        if (extname(changed) !== '.typ' || !changed.startsWith(absoluteDir)) return

        try {
          await ingest(changed, context, root)
        } catch (error) {
          // dev サーバを落とさない。show rule の穴を踏んだときはここに出る。
          logger.error(error instanceof Error ? error.message : String(error))
        }
      })
    },
  }
}
