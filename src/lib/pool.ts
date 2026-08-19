/**
 * 並び順を保ったまま、同時実行数を絞って写す。
 *
 * .typ 1 本につき typst を 2 回起動する。71 本を直列に回すと 3 分かかるが、
 * 各ファイルは互いに独立なので、CPU の数だけ並べれば待ち時間はそのぶん縮む。
 * ただし無制限に走らせるとプロセスが 142 個立ち上がるので、上限を設ける。
 */
export const mapWithLimit = async <T, R>(
  items: readonly T[],
  limit: number,
  task: (item: T, index: number) => Promise<R>,
): Promise<R[]> => {
  const results = new Array<R>(items.length)
  const width = Math.max(1, Math.min(limit, items.length))
  let next = 0

  // 走者を width 人だけ立てて、それぞれが空いた仕事を順に取る。
  // 1 本でも失敗したら Promise.all が投げるので、失敗はそのまま伝わる。
  const worker = async (): Promise<void> => {
    while (next < items.length) {
      const index = next++
      results[index] = await task(items[index], index)
    }
  }

  await Promise.all(Array.from({ length: width }, worker))

  return results
}
