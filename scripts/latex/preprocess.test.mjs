import { test } from 'node:test'
import assert from 'node:assert/strict'

import { expandAutoBrackets } from './preprocess.mjs'

const expand = (source) => expandAutoBrackets(source).text

test('丸括弧を left/right に開く', () => {
  assert.equal(expand(String.raw`\ab(x+y)`), String.raw`\left(x+y\right)`)
})

test('角括弧', () => {
  assert.equal(
    expand(String.raw`\ab[\bm{l}\cdot\bm{s}]`),
    String.raw`\left[\bm{l}\cdot\bm{s}\right]`,
  )
})

test('山括弧は期待値なので langle/rangle にする', () => {
  assert.equal(expand(String.raw`\ab<r^2>`), String.raw`\left\langle r^2\right\rangle `)
})

test('縦棒は絶対値', () => {
  assert.equal(expand(String.raw`\ab|x|`), String.raw`\left\lvert x\right\rvert `)
})

test('波括弧', () => {
  assert.equal(expand(String.raw`\ab\{a,b\}`), String.raw`\left\{a,b\right\}`)
})

test('中に分数があっても閉じを見失わない', () => {
  assert.equal(
    expand(String.raw`\ab(\frac{a}{b})`),
    String.raw`\left(\frac{a}{b}\right)`,
  )
})

test('入れ子', () => {
  assert.equal(expand(String.raw`\ab(\ab(x))`), String.raw`\left(\left(x\right)\right)`)
})

test('同じ行に複数あっても独立に処理する', () => {
  assert.equal(
    expand(String.raw`\ab(a) + \ab(b)`),
    String.raw`\left(a\right) + \left(b\right)`,
  )
})

test('波括弧の中の閉じ記号は数えない', () => {
  assert.equal(expand(String.raw`\ab({x)y})`), String.raw`\left({x)y}\right)`)
})

test('\\abs のような別マクロを巻き込まない', () => {
  assert.equal(expand(String.raw`\abs{x}`), String.raw`\abs{x}`)
})

test('区切り記号が続かない \\ab は触らない', () => {
  assert.equal(expand(String.raw`\ab x`), String.raw`\ab x`)
})

test('対応が取れない場合は書き換えずに件数だけ返す', () => {
  const result = expandAutoBrackets(String.raw`\ab(x`)
  assert.equal(result.text, String.raw`\ab(x`)
  assert.equal(result.unmatched, 1)
  assert.equal(result.expanded, 0)
})

test('入れ子の丸括弧が閉じきる', () => {
  assert.equal(
    expand(String.raw`\ab(\ab(1 - \frac{v}{V})M)`),
    String.raw`\left(\left(1 - \frac{v}{V}\right)M\right)`,
  )
})

test('展開件数を数える', () => {
  const result = expandAutoBrackets(String.raw`\ab(a)\ab[b]\ab<c>`)
  assert.equal(result.expanded, 3)
  assert.equal(result.unmatched, 0)
})

// --- braket ---

import { expandBrakets, preprocess } from './preprocess.mjs'

const braket = (source) => expandBrakets(source).text

test('\\ket|psi> を開く', () => {
  assert.equal(braket(String.raw`\ket|N>`), String.raw`\left\lvert N\right\rangle `)
})

test('\\bra<psi| を開く', () => {
  assert.equal(braket(String.raw`\bra<f|`), String.raw`\left\langle f\right\rvert `)
})

test('\\braket<a|b> は縦棒を仕切りにする', () => {
  assert.equal(
    braket(String.raw`\braket<a|b>`),
    String.raw`\left\langle a\middle\vert b\right\rangle `,
  )
})

test('\\braket<x> は仕切り無しの期待値', () => {
  assert.equal(braket(String.raw`\braket<x>`), String.raw`\left\langle x\right\rangle `)
})

test('bra と ket が連なる行列要素', () => {
  assert.equal(
    braket(String.raw`\bra<f|V\ket|i>`),
    String.raw`\left\langle f\right\rvert V\left\lvert i\right\rangle `,
  )
})

test('\\bra が \\braket を食わない', () => {
  assert.equal(
    braket(String.raw`\braket<a|b>`),
    String.raw`\left\langle a\middle\vert b\right\rangle `,
  )
})

test('波括弧形式の \\ket{} は触らない', () => {
  assert.equal(braket(String.raw`\ket{N}`), String.raw`\ket{N}`)
})

test('上付き添字を含む本体', () => {
  assert.equal(
    braket(String.raw`\ket|a^{(1)}>`),
    String.raw`\left\lvert a^{(1)}\right\rangle `,
  )
})

test('braket を先に開くので \\ab| の閉じを誤らない', () => {
  const result = preprocess(String.raw`\begin{document}$\ab|\braket<f|i>|^2$`)
  assert.match(result.text, /\\left\\lvert \\left\\langle f\\middle\\vert i\\right\\rangle \\right\\rvert/)
})

// --- mhchem ---

import { expandChemistry } from './preprocess.mjs'

const chem = (source) => expandChemistry(source).text

test('化学式の数字を下付きにする', () => {
  assert.equal(chem(String.raw`\ce{H2O}`), String.raw`\mathrm{H}_{2}\mathrm{O}`)
})

test('矢印を潰さない', () => {
  assert.match(chem(String.raw`\ce{CO2 -> C + O2}`), /\\rightarrow/)
  assert.doesNotMatch(chem(String.raw`\ce{CO2 -> C + O2}`), /mathrm\{rightarrow\}/)
})

test('電荷を上付きにする', () => {
  assert.equal(chem(String.raw`\ce{Ca^2+}`), String.raw`\mathrm{Ca}^{2+}`)
})

test('質量数の前置き上付きを保つ', () => {
  assert.equal(chem(String.raw`\ce{^{235}U}`), String.raw`^{235}\mathrm{U}`)
})
