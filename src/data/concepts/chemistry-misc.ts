import type { Concept } from './types.ts'
import { c } from './types.ts'

export const chemistryMisc: readonly Concept[] = [
  // --- 分子対称性と選択則（化学のうち論理で決まる部分） ------------------------------------------
  //
  // 「この反応が起きる」は経験的だが、「この遷移は禁制である」は
  // 群論から導かれる。分野ではなくサブ領域で切る例。
  //
  // **選択則と Woodward–Hoffmann は統合しない**（`docs/surveys.md`）。
  // 片方は Wigner の消滅積分定理で**一点の点群**、
  // 片方は非交差則で**経路全体で保たれる部分群**。
  // 「対称性が禁じる」に二つの意味がある、というのが結び。
  //
  // 有機反応機構は × だった。電子構造理論・軌道対称性・結晶の対称性が ◎。
  c('point-group', '点群', '分子を不変にする対称操作の群', 'definition', 'chemistry', ['group-action']),
  c('symmetry-adapted-basis', '対称性に適合した基底', '既約表現ごとに軌道を分類する', 'technique', 'chemistry', ['point-group', 'irreducible-representation']),
  c('molecular-orbital', '分子軌道', '原子軌道の線形結合。対称性が混ざり方を決める', 'definition', 'chemistry', ['symmetry-adapted-basis', 'observable']),
  c('selection-rule', '選択則', '遷移積分が対称性から恒等的に 0 になる条件', 'theorem', 'chemistry', ['symmetry-adapted-basis', 'orthogonality-relations']),
  c('normal-modes', '基準振動', '振動を既約表現で分類する。赤外・Raman 活性', 'technique', 'chemistry', ['point-group', 'spectral-theorem']),
  c('vanishing-integral-theorem', '消滅積分定理', '**被積分関数が全対称表現を含まなければ、積分は厳密に 0。**選択則の中身はこれ一つ', 'theorem', 'chemistry', ['selection-rule', 'orthogonality-relations']),
  c('symmetry-forbids-does-not-mean-never', '禁制は「起きない」ではない', '**仮定した対称性が厳密なときだけ 0 である。**振動が対称性を落とせば、弱く現れる', 'viewpoint', 'chemistry', ['vanishing-integral-theorem']),

  // 電子構造 ── どこまでが定理か
  c('born-oppenheimer', 'Born–Oppenheimer 近似', '核を止めて電子だけ解く。**質量比の 4 乗根が小さいことが根拠**で、縮退の近くでは壊れる', 'technique', 'chemistry', ['observable', 'unitary-time-evolution']),
  c('variational-bound', '変分法は上界しか出さない', '**どんな試行関数でも基底状態より上。**下界は別の議論が要る', 'theorem', 'chemistry', ['variational-principle', 'spectral-theorem']),
  c('slater-determinant', 'Slater 行列式', '反対称化を行列式で書く。**Pauli 原理が「同じ行が二つあると 0」になる**', 'definition', 'chemistry', ['symmetrization-postulate', 'determinant']),
  c('hartree-fock', 'Hartree–Fock', '一電子近似の中で最良の解。**残りが定義によって相関エネルギーになる**', 'technique', 'chemistry', ['slater-determinant', 'variational-bound']),
  c('correlation-is-defined-by-what-we-left-out', '相関エネルギーは、近似の残りである', '**物理的な量ではなく、どの近似を基準に取ったかで決まる。**定義が方法に依存している', 'viewpoint', 'chemistry', ['hartree-fock']),
  c('hohenberg-kohn', 'Hohenberg–Kohn の定理', '**基底状態の密度が、外場を一意に決める。**波動関数を捨てて密度だけにしてよい根拠', 'theorem', 'chemistry', ['born-oppenheimer', 'variational-bound']),
  c('levy-lieb-constrained-search', '制限付き探索', '汎関数を、密度を与える波動関数の中での最小として定義し直す。**存在が構成的に出る**', 'theorem', 'chemistry', ['hohenberg-kohn']),
  c('dft-functional-is-convex', '汎関数は凸解析の対象である', 'Lieb は外場と密度を Legendre 対にして定式化した。**分離超平面に着いた四人目**', 'viewpoint', 'chemistry', ['levy-lieb-constrained-search', 'convex-conjugate', 'separating-hyperplane']),
  c('exchange-correlation-is-unknown', '汎関数は在るが、形が分かっていない', '**存在定理と計算法の間が空いている。**近似の選択は経験で、そこが定理の外', 'viewpoint', 'chemistry', ['dft-functional-is-convex']),
  c('kohn-sham-orbitals-are-not-physical', 'Kohn–Sham 軌道は物理量ではない', '**同じ密度を出すための補助系の軌道。**エネルギー準位を実測と比べるのは、定理の外の使い方', 'viewpoint', 'chemistry', ['hohenberg-kohn', 'hartree-fock']),

  // 軌道対称性 ── 経路全体で保たれる部分群
  c('correlation-diagram', '相関図', '出発物と生成物の軌道を、対称性のラベルで結ぶ', 'technique', 'chemistry', ['symmetry-adapted-basis']),
  c('noncrossing-rule', '非交差則', '**同じ対称性の準位は交差できない。**交差しようとすると押し合って避ける', 'theorem', 'chemistry', ['correlation-diagram', 'spectral-theorem']),
  c('conserved-subgroup-along-the-path', '経路全体で保たれる部分群', '一点の点群ではなく、**反応の途中でずっと残る対称操作**だけを使う。ここが選択則と違う', 'definition', 'chemistry', ['correlation-diagram', 'point-group']),
  c('woodward-hoffmann', 'Woodward–Hoffmann 則', '占有軌道が非占有軌道と繋がるなら、その経路には障壁が立つ。**回り方が二つに割れる**', 'theorem', 'chemistry', ['noncrossing-rule', 'conserved-subgroup-along-the-path']),
  c('two-meanings-of-forbidden', '「対称性が禁じる」に二つの意味がある', '選択則は**積分が 0**、Woodward–Hoffmann は**障壁が高い**。前者は厳密、後者は程度の問題', 'viewpoint', 'chemistry', ['woodward-hoffmann', 'symmetry-forbids-does-not-mean-never']),

  // 結晶
  c('bravais-lattice', '結晶格子', '並進で自分に重なる点の集合。**順序論の束（`lattice`）とは無関係**', 'definition', 'chemistry', ['point-lattice', 'group-action']),
  c('crystal-restriction-again', '結晶で許される回転は 5 種類', '**格子と両立する回転が 2、3、4、6 次だけ**なので、分子で許された 5 次が結晶では消える', 'theorem', 'chemistry', ['bravais-lattice', 'crystallographic-restriction']),
  c('space-groups-230', '空間群は 230 個', '点群と並進を組み合わせると、三次元でちょうど 230。**分類が終わっている**', 'theorem', 'chemistry', ['crystal-restriction-again']),
  c('reciprocal-lattice', '逆格子', '格子の Fourier 変換。**回折で見えるのは、こちらの格子**', 'definition', 'chemistry', ['bravais-lattice', 'fourier-transform']),
  c('systematic-absences', '消滅則', '**在るはずの反射が消えることから、空間群が絞れる。**無いことが情報になる', 'theorem', 'chemistry', ['reciprocal-lattice', 'space-groups-230']),
  c('phase-problem', '位相問題', '**測れるのは強度だけで、位相が失われる。**構造が一意に決まらない理由がここに在る', 'viewpoint', 'chemistry', ['reciprocal-lattice', 'null-space-never-vanishes']),
  c('quasicrystals-break-the-assumption', '準結晶は仮定のほうを外した', '**5 次の対称が出るのは、並進周期性を要求しなかったから。**分類の前提が効いていた', 'theorem', 'chemistry', ['crystal-restriction-again', 'penrose-tiling-has-no-lattice']),
]
