import { execFile } from 'node:child_process'
import { promisify } from 'node:util'

const run = promisify(execFile)

/**
 * typst の stderr から、本当に失敗した行だけを取り出す。
 *
 * HTML export は experimental 警告を毎回出すうえ、MathML に写せない要素
 * （overline など）があると warning を出す。これらでビルドを止めると
 * 1 箇所の表現の都合で文書全体が落ちるので、error: だけを失敗とみなす。
 */
export const significantStderr = (stderr: string): string => {
  const lines = stderr.split('\n')
  const errors: string[] = []
  let capturing = false

  for (const line of lines) {
    if (/^error:/.test(line)) {
      capturing = true
      errors.push(line)
      continue
    }
    if (/^(warning|hint):/.test(line)) {
      capturing = false
      continue
    }
    // エラー本文に続く位置情報の行だけを拾う。
    if (capturing && /^\s*[│┌─]/.test(line)) errors.push(line)
  }

  return errors.join('\n').trim()
}

/** MathML に写せなかった要素などの警告。ビルドは止めないが記録はしたい。 */
export const collectWarnings = (stderr: string): readonly string[] =>
  stderr
    .split('\n')
    .filter((line) => /^warning:/.test(line))
    .filter((line) => !/html export is under active development/.test(line))
    .map((line) => line.replace(/^warning:\s*/, ''))

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
 * HTML を正規表現で漁らずに済ませるための経路。
 *
 * --features html が要る点に注意。本文が html.frame() のように html 名前空間へ
 * 触れていると、評価だけでも「unknown variable: html」で落ちる。
 * 警告は stderr に出るが、ここが読むのは stdout の JSON だけなので害はない。
 */
export const evalMetadata = async (
  file: string,
  { bin, root }: TypstOptions,
): Promise<unknown> => {
  try {
    const { stdout } = await run(
      bin,
      [
        'eval',
        '--in',
        file,
        '--root',
        root,
        '--features',
        'html',
        '--format',
        'json',
        'query(<fm>).first().value',
      ],
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
