import { deepStrictEqual, strictEqual } from 'node:assert/strict'
import { test } from 'node:test'

import { idHint, noteLabels, type Note } from './note-label.ts'

const note = (id: string, title: string, group = 'ノート'): Note => ({ id, title, group })

test('元ファイル名から、読める手掛かりを作る', () => {
  strictEqual(idHint('note--statistic_report'), 'statistic report')
  strictEqual(idHint('physics_report--debye'), 'debye')
})

test('題名が重ならなければ、何も添えない', () => {
  const labels = noteLabels([note('note--optics', '光学'), note('note--group', '群論')])
  deepStrictEqual([...labels.values()], ['光学', '群論'])
})

test('同じ群で重なったものにだけ添える', () => {
  const labels = noteLabels([
    note('note--statistics', '統計力学'),
    note('note--statistic_report', '統計力学'),
    note('note--optics', '光学'),
  ])
  strictEqual(labels.get('note--statistics'), '統計力学（statistics）')
  strictEqual(labels.get('note--statistic_report'), '統計力学（statistic report）')
  strictEqual(labels.get('note--optics'), '光学')
})

test('群が違えば添えない', () => {
  // すぐ上の見出しが「ノート」「レポート」と言っている。もう一度言わない。
  const labels = noteLabels([
    note('note--elemag', '電磁気学'),
    note('physics_report--elemag', '電磁気学', 'レポート'),
  ])
  deepStrictEqual([...labels.values()], ['電磁気学', '電磁気学'])
})
