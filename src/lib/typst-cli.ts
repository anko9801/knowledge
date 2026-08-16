import { execFile } from 'node:child_process'
import { promisify } from 'node:util'

const run = promisify(execFile)

/**
 * HTML export が毎回 stderr に出す experimental 警告。
 * これをエラーと区別しないとビルドログが埋まる。
 */
const EXPERIMENTAL_NOTICE = /html export is under active development|^\s*=\s*hint:|^\s*$/

const isNoise = (line: string): boolean => EXPERIMENTAL_NOTICE.test(line)

/** stderr から experimental 警告だけを取り除いた残りを返す。 */
export const significantStderr = (stderr: string): string =>
  stderr
    .split('\n')
    .filter((line) => !isNoise(line))
    .join('\n')
    .trim()

export type TypstOptions = {
  readonly bin: string
  readonly root: string
}

/**
 * .typ を HTML 文書 1 つにコンパイルして文字列で返す。
 * 出力先に `-` を渡して stdout で受けるので中間ファイルを作らない。
 */
export const compileHtml = async (
  file: string,
  { bin, root }: TypstOptions,
): Promise<string> => {
  try {
    const { stdout, stderr } = await run(
      bin,
      ['compile', file, '--format', 'html', '--features', 'html', '--root', root, '-'],
      { maxBuffer: 64 * 1024 * 1024 },
    )

    const problems = significantStderr(stderr)
    if (problems) {
      throw new Error(problems)
    }

    return stdout
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw new Error(`Typst の HTML コンパイルに失敗しました (${file}):\n${detail}`)
  }
}

/**
 * `<fm>` ラベルを付けた #metadata を JSON として取り出す。
 *
 * HTML を正規表現で漁らずに済ませるための経路。paged target のまま評価するので
 * --features html は不要で、experimental 警告も出ない。
 */
export const evalMetadata = async (
  file: string,
  { bin, root }: TypstOptions,
): Promise<unknown> => {
  try {
    const { stdout } = await run(
      bin,
      ['eval', '--in', file, '--root', root, '--format', 'json', 'query(<fm>).first().value'],
      { maxBuffer: 4 * 1024 * 1024 },
    )

    return JSON.parse(stdout)
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw new Error(
      `front matter を取り出せませんでした (${file}). ` +
        `文書の先頭に #metadata((...))<fm> が必要です:\n${detail}`,
    )
  }
}
