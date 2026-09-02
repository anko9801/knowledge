/**
 * 記事を書いている最中の、速い検査。
 *
 * `npm run verify` は astro check を通すので全ページを typst に掛け直す。
 * 1 本書き換えるたびに払うには重い。こちらは
 *
 *   - 変更した .typ だけを typst に通す
 *   - 記法と文体の lint（src/lib/*.test.ts）を回す
 *
 * だけをする。`nix develop` を経由しないので起動を払わない。
 *
 * **絞られるのは compile だけである。** lint は毎回リポジトリ全体を見る。
 * だから複数の記事を並列で書き換えているときは、**他人の欠けたファイルへの
 * リンク切れで落ちる。** 自分のファイルを引数で渡しても回避できない。
 * 落ちた行のパスを見て、自分のものかを確かめること。
 *
 *   node scripts/quick.mjs            変更した .typ を見る
 *   node scripts/quick.mjs path.typ   指定した .typ を見る
 *
 * **これは verify の代わりではない。** astro check が見る .astro と .ts の型、
 * PDF や sitemap の生成は見ていない。commit の前に verify を通すこと。
 */
import { execFile } from 'node:child_process'
import { existsSync, readFileSync, writeFileSync } from 'node:fs'
import { promisify } from 'node:util'

const run = promisify(execFile)
const root = process.cwd()
const cache = '.typst-bin'

/**
 * typst の場所を決める。
 *
 * PATH にあればそれ（nix develop の中で呼ばれた場合）。無ければ nix に一度だけ
 * 訊いて `.typst-bin` に控える。flake を更新すると store path が変わるので、
 * 控えが効かなくなったら引き直す。
 */
const findTypst = async () => {
  try {
    await run('typst', ['--version'])
    return 'typst'
  } catch {}

  if (existsSync(cache)) {
    const bin = readFileSync(cache, 'utf8').trim()
    try {
      await run(bin, ['--version'])
      return bin
    } catch {}
  }

  process.stderr.write('typst を nix に訊いています（初回だけ）\n')
  const { stdout } = await run('nix', [
    'develop',
    '--command',
    'sh',
    '-c',
    'command -v typst',
  ])
  // shellHook が版などを吐くので最終行だけ取る
  const bin = stdout.trim().split('\n').at(-1).trim()
  writeFileSync(cache, `${bin}\n`)
  return bin
}

const changedTyp = async () => {
  const { stdout } = await run('git', ['status', '--porcelain', '--', '*.typ'])
  return stdout
    .split('\n')
    .filter(Boolean)
    .map((l) => l.slice(3).trim())
    .filter((p) => p.endsWith('.typ') && existsSync(p))
}

const main = async () => {
  const started = Date.now()
  const given = process.argv.slice(2)
  const files = given.length ? given : await changedTyp()

  if (!files.length) {
    process.stderr.write('変更された .typ がありません\n')
  }

  const bin = await findTypst()
  let failed = false

  for (const file of files) {
    try {
      await run(
        bin,
        [
          'compile',
          file,
          '--format',
          'html',
          '--features',
          'html',
          '--root',
          root,
          '--input',
          'base=/knowledge/',
          '-',
        ],
        { maxBuffer: 64 * 1024 * 1024 },
      )
      process.stdout.write(`  ok   ${file}\n`)
    } catch (error) {
      failed = true
      process.stdout.write(`  NG   ${file}\n`)
      const detail = error instanceof Error ? error.message : String(error)
      // typst のエラーは stderr に出る。行番号の付いた行だけ拾う
      for (const line of detail.split('\n')) {
        if (/error:|┌─|│|\^/.test(line)) process.stdout.write(`       ${line}\n`)
      }
    }
  }

  // node --test にグロブを渡すと shell が要るので、先に展開しておく
  const tests = (await run('git', ['ls-files', 'src/lib/*.test.ts'])).stdout
    .split('\n')
    .filter(Boolean)

  const lint = await run('node', ['--test', ...tests], {
    maxBuffer: 16 * 1024 * 1024,
  }).catch((error) => error)

  const out = `${lint.stdout ?? ''}`
  const fail = Number(/^# fail (\d+)$/m.exec(out)?.[1] ?? out.match(/fail (\d+)/)?.[1] ?? 0)
  if (fail > 0) {
    failed = true
    process.stdout.write(`\n  lint に ${fail} 件\n`)
    for (const line of out.split('\n')) {
      if (/^✖|actual:|expected:/.test(line.trim())) {
        process.stdout.write(`       ${line.trim()}\n`)
      }
    }
  } else {
    process.stdout.write(`  ok   lint\n`)
  }

  const sec = ((Date.now() - started) / 1000).toFixed(2)
  process.stdout.write(`\n${failed ? 'NG' : 'ok'}  ${sec} 秒\n`)
  process.stdout.write('commit の前に npm run verify を通すこと\n')
  process.exit(failed ? 1 : 0)
}

main()
