import type { Loader, LoaderContext } from 'astro/loaders'
import { readdir, readFile } from 'node:fs/promises'
import { extname, join, relative, sep } from 'node:path'
import { createHash } from 'node:crypto'

import { compileHtml, evalMetadata } from './typst-cli.ts'
import {
  extractStyles,
  repairBinaryOperators,
  rewriteInternalLinks,
  splitDocument,
  useSpacingAccents,
  wrapBlockEquations,
} from './typst-html.ts'

export type TypstLoaderOptions = {
  /** .typ を置くディレクトリ（プロジェクトルートからの相対パス）。 */
  readonly dir: string
  /** typst 実行ファイル。devShell 経由なら PATH 上の "typst" でよい。 */
  readonly bin?: string
  /** #set text(lang: ...) に期待する値。ズレたら警告する。 */
  readonly expectedLang?: string
  /** 別行立て数式に通し番号を振る。参照が「式 1」と出る文書向け。 */
  readonly numberEquations?: boolean
  /**
   * 本文が #import する共有ファイルの置き場（プロジェクトルートからの相対）。
   *
   * digest に混ぜないと、テンプレートを直しても本文の digest が変わらず
   * キャッシュが効いたままになる。証明の見出しを変えたのに反映されない、
   * といった形で現れる。
   */
  readonly dependsOn?: readonly string[]
  /** サイトが載るパス。図版の src に前置きする。 */
  readonly base?: string
}

type EntryResult = {
  readonly id: string
  readonly mathCss: string
}

/**
 * dir 以下の .typ を再帰的に集める。
 * 分野やシリーズでディレクトリを切れるようにしてあるので、ここは掘る必要がある。
 */
const listTypstFiles = async (dir: string): Promise<readonly string[]> => {
  const entries = await readdir(dir, { withFileTypes: true })

  const nested = await Promise.all(
    entries.map(async (entry) => {
      const path = join(dir, entry.name)

      if (entry.isDirectory()) return listTypstFiles(path)
      return entry.isFile() && extname(entry.name) === '.typ' ? [path] : []
    }),
  )

  return nested.flat().sort()
}

/**
 * ファイルパスをエントリ ID にする。
 * `math/set-theory/03-ordinals.typ` -> `math/set-theory/03-ordinals`
 * ディレクトリ構造がそのまま ID に出るので、同じ題名の記事が別分野にあっても衝突しない。
 */
const entryId = (dirRoot: string, file: string): string =>
  relative(dirRoot, file).split(sep).join('/').replace(/\.typ$/, '')

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
  const {
    dir,
    bin = process.env.TYPST_BIN ?? 'typst',
    expectedLang,
    numberEquations = false,
    dependsOn = [],
    base = '/',
  } = options

  /** 1 ファイルをコンパイルしてストアに入れる。full load と watch の両方から使う。 */
  /**
   * 本文が #import する共有ファイルをまとめた digest。
   *
   * これを本文の digest に混ぜないと、テンプレートを直しても本文側の digest が
   * 変わらず、キャッシュが効いたままになる。証明の見出しを変えたのに
   * 反映されない、という形で現れる。
   */
  const dependencyDigest = async (root: string): Promise<string> => {
    const parts: string[] = []

    for (const relative of dependsOn) {
      const target = join(root, relative)
      const entries = await readdir(target, { withFileTypes: true }).catch(() => null)

      if (!entries) {
        parts.push(await readFile(target, 'utf8').catch(() => ''))
        continue
      }

      const files = entries
        .filter((entry) => entry.isFile())
        .sort((a, b) => a.name.localeCompare(b.name))

      for (const entry of files) {
        parts.push(await readFile(join(target, entry.name), 'utf8'))
      }
    }

    return digest(parts.join('\u0000'))
  }

  const ingest = async (
    file: string,
    context: LoaderContext,
    root: string,
    dirRoot: string,
    shared: string,
  ): Promise<EntryResult> => {
    const { store, logger, parseData } = context
    const id = entryId(dirRoot, file)
    const typstOptions = { bin, root, base } as const

    const source = await readFile(file, 'utf8')
    const sourceDigest = digest(`${shared}\u0000${source}`)

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

    // アクセントの置換は全記事に効かせる。合成用のままだと <mover> の点がずれる。
    const accented = repairBinaryOperators(useSpacingAccents(body))
    const numbered = numberEquations ? wrapBlockEquations(accented) : accented

    // 本文の #link("/math/…") はサイトのルート起点で書かれている。
    // base はビルド設定なので本文には焼き込まず、ここで補う。
    const rendered = rewriteInternalLinks(numbered, base)

    store.set({
      id,
      data,
      body: rendered,
      digest: sourceDigest,
      filePath: relative(root, file),
      rendered: { html: rendered },
    })

    logger.info(`${id} (${Buffer.byteLength(rendered)} bytes)`)

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

      const shared = await dependencyDigest(root)

      const results: EntryResult[] = []
      for (const file of files) {
        results.push(await ingest(file, context, root, absoluteDir, shared))
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

      const watched = (path: string): boolean =>
        extname(path) === '.typ' && path.startsWith(absoluteDir)

      const reingest = async (changed: string): Promise<void> => {
        if (!watched(changed)) return

        try {
          await ingest(changed, context, root, absoluteDir, await dependencyDigest(root))
        } catch (error) {
          // dev サーバを落とさない。show rule の穴を踏んだときはここに出る。
          logger.error(error instanceof Error ? error.message : String(error))
        }
      }

      watcher.add(absoluteDir)
      for (const relative of dependsOn) watcher.add(join(root, relative))

      // change だけ見ていると、執筆中に新しい記事を足しても 404 のままになる。
      watcher.on('change', reingest)
      watcher.on('add', reingest)
      watcher.on('unlink', (removed) => {
        if (!watched(removed)) return
        store.delete(entryId(absoluteDir, removed))
      })
    },
  }
}
