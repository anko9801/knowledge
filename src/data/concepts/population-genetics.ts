import type { Concept } from './types.ts'
import { c } from './types.ts'

export const populationGenetics: readonly Concept[] = [
  // --- 生命の数理 ----------------------------------------------------------------
  //
  // **有限の集団に、無作為に交配することだけを仮定すると、頻度の動きが完全に決まる。**
  // 何を足すかではなく、**何を落とすか（無限集団）**で分野が割れる。
  //
  // 集団サイズが途中で**消える** ── それが中立説の全部である。
  //
  // 生化学は経験則なので採らないが、**酵素反応速度論は切り口が違う**
  // （擬定常状態近似から双曲線が導ける）。薬理学と薬物動態の関係と同じ形。
  c('allele-frequency', '対立遺伝子頻度', '遺伝子型ではなく複製を数える。状態空間が単体から区間に落ちる', 'definition', 'biology', ['probability-space']),
  c('random-mating', '無作為交配', '配偶子が独立に対合する。この要請が Hardy–Weinberg の全部である', 'definition', 'biology', ['independence-probabilistic', 'allele-frequency']),
  c('hardy-weinberg', 'Hardy–Weinberg の法則', '無限集団で 1 世代で到達し、以後動かない。**平衡点ではなく平衡曲線である**', 'theorem', 'biology', ['random-mating']),
  c('sex-linked-convergence', '性染色体では 1 世代で到達しない', '雌雄の頻度差が符号を変えながら半減する。全体頻度は保存される', 'theorem', 'biology', ['hardy-weinberg']),
  c('inbreeding-coefficient', '近交係数', '2 本の複製が同祖である確率。頻度を動かさずヘテロ接合体だけを減らす', 'definition', 'biology', ['hardy-weinberg', 'expectation']),
  c('wahlund-effect', 'Wahlund 効果', '構造のある集団をまとめて測ると、**必ず**ヘテロ接合体が足りなく見える。不足量は部分集団間の分散に等しい', 'theorem', 'biology', ['inbreeding-coefficient', 'moments']),
  c('f-statistics', '$F$ 統計量', '「分散のうち集団間の取り分」。分散分解そのもので、生物学的な仮定を含まない', 'definition', 'biology', ['wahlund-effect']),

  // 一遺伝子座の選択
  c('marginal-fitness', '周辺適応度', 'ある対立遺伝子が出会う相手の平均', 'definition', 'biology', ['hardy-weinberg', 'expectation']),
  c('mean-fitness-gradient', '選択は平均適応度の勾配上昇である', '定数適応度・一遺伝子座なら、平均適応度が単調増加する Lyapunov 関数になる', 'theorem', 'biology', ['marginal-fitness']),
  c('overdominance-polymorphism', '超優性による多型の維持', 'ヘテロ接合体が最も適応度が高いと内部平衡が安定になる。劣性有利なら同じ点が不安定', 'theorem', 'biology', ['mean-fitness-gradient']),
  c('mutation-selection-balance', '突然変異–選択平衡', '有害対立遺伝子は消えず、突然変異率と選択係数の比で決まる高さに留まる。**集団サイズに依らない**', 'theorem', 'biology', ['mean-fitness-gradient']),

  // 有限集団 ── 山
  c('wright-fisher-model', 'Wright–Fisher 模型', '毎世代あたり直す二項分布の Markov 連鎖。有限性の効果が全部入る', 'definition', 'biology', ['markov-chain', 'hardy-weinberg', 'distribution']),
  c('exchangeability-genetic', '交換可能性（複製）', '複製に区別が無い。中立性の正確な言い方で、対称群の作用で不変ということ', 'definition', 'biology', ['wright-fisher-model', 'group-action']),
  c('neutral-fixation-probability', '中立な変異の固定確率は、いまの頻度に等しい', '頻度が有界マルチンゲールで吸収状態が両端だけ。**任意停止定理の一行**', 'theorem', 'biology', ['wright-fisher-model', 'martingale']),
  c('heterozygosity-decay', 'ヘテロ接合度の減衰', '毎世代一定の割合で減る。**多様性の寿命が集団サイズの二倍の世代だと決まる**', 'theorem', 'biology', ['wright-fisher-model']),
  c('effective-population-size', '有効集団サイズ', '実在の集団を Wright–Fisher に読み替える助変数。**定義が複数あり、一致しない**', 'definition', 'biology', ['heterozygosity-decay']),
  c('mutation-drift-balance', '突然変異と浮動の釣り合い', '集団サイズは突然変異率との積でしか効かない', 'theorem', 'biology', ['heterozygosity-decay']),
  c('branching-process-survival', '有利な変異もたいてい失われる', '生存確率が選択係数の二倍ほど。選択係数が 1% なら 98% が消える', 'theorem', 'biology', ['markov-chain', 'expectation']),
  c('diffusion-approximation', '拡散近似', '集団サイズを大きくし、選択と時間をそれで測ると、離散連鎖が一次元拡散に収束する', 'technique', 'biology', ['wright-fisher-model', 'central-limit-theorem']),
  c('kimura-fixation-probability', '選択があるときの固定確率', '中立の極限で頻度に戻り、強い選択の極限で分岐過程の値に戻る', 'theorem', 'biology', ['diffusion-approximation', 'neutral-fixation-probability']),
  c('nearly-neutral-threshold', 'ほぼ中立の帯', '選択が浮動に隠れて見えない帯がある。**中立かどうかは選択係数単独では決まらない**', 'viewpoint', 'biology', ['kimura-fixation-probability']),
  c('neutral-substitution-rate', '中立置換速度は突然変異率に等しい', '**集団サイズが約分で消える。**これが分子時計の中身', 'theorem', 'biology', ['neutral-fixation-probability']),

  // 合祖
  c('coalescent-process', '合祖過程', '時間を集団サイズで測ると、合祖率が系統の対の数になる。**模型から助変数が消える**', 'definition', 'biology', ['wright-fisher-model', 'exchangeability-genetic', 'distribution'], [], { aka: ['Kingman の合祖過程'] }),
  c('tmrca-expectation', '共通祖先までの時間', '標本をいくら増やしても、ある上限を超えない。木の全長に調和数が出る', 'theorem', 'biology', ['coalescent-process']),
  c('watterson-estimator', '分離部位数から多様度を測る', '木の全長に突然変異を撒くだけで出る', 'technique', 'biology', ['tmrca-expectation', 'mutation-drift-balance']),
  c('site-frequency-spectrum', '部位頻度スペクトル', '変異が何本の系統に乗っているかの分布。中立なら形が決まる', 'definition', 'biology', ['coalescent-process']),
  c('tajima-d', '二つの推定量の差が検定になる', '中立でのみ一致する。**ずれが選択か人口変動の証拠になる**', 'technique', 'biology', ['watterson-estimator', 'site-frequency-spectrum']),

  // 形質、血縁、ゲーム
  c('price-equation', 'Price 方程式', '**定義から出る恒等式**で、生物学的な仮定を一つも含まない', 'theorem', 'biology', ['expectation', 'moments']),
  c('hamiltons-rule', 'Hamilton 則', 'Price 方程式の共分散項を血縁度で書き直したもの。血縁度の定義の取り方で内容が変わる', 'theorem', 'biology', ['price-equation', 'inbreeding-coefficient']),
  c('breeders-equation', '育種家の式', '選抜差のうち遺伝する取り分だけが次世代に残る。回帰係数ひとつで書ける', 'theorem', 'biology', ['price-equation']),
  c('ess-biology', '進化的に安定な戦略', '侵入を許さない戦略。混合 ESS は闘争の損得比で決まる', 'definition', 'biology', ['mean-fitness-gradient', 'evolutionarily-stable']),

  // 分子進化と系統
  c('jukes-cantor-distance', '多重置換の補正と、その限界', '観測される差がある値で発散する。**飽和した先では距離が識別できない**', 'theorem', 'biology', ['markov-chain', 'diagonalization']),
  c('four-point-condition', '四点条件から木が一意に決まる', '三つの和のうち大きい二つが等しく、差が内部枝長の二倍', 'theorem', 'biology', ['metric-space', 'jukes-cantor-distance']),
  c('felsenstein-pruning', '木の上の動的計画法', '祖先状態の指数個の和が線形に潰れる。**木であること（閉路が無いこと）だけを使う**', 'technique', 'biology', ['optimal-substructure', 'jukes-cantor-distance']),

  // 生態と反応
  c('lotka-volterra-invariant', 'Lotka–Volterra の不変量', '軌道上で一定な量があるので閉軌道になる。中立安定で極限閉軌道は無い', 'theorem', 'biology', ['ode-existence']),
  c('volterra-principle', '両方を一様に間引くと、餌が増えて捕食者が減る', '時間平均が助変数だけで決まることから直接出る。**殺虫剤が害虫を増やす**', 'theorem', 'biology', ['lotka-volterra-invariant']),
  c('competitive-exclusion', '競争排除則', '制限資源の数を超えて平衡共存できない。**方程式が未知数に載らない、という線形代数の話**', 'theorem', 'biology', ['linear-map', 'ode-existence']),
  c('quasi-steady-state', '擬定常状態近似', '速い変数を代数方程式に潰す。**妥当条件を言わないと近似が正当化されない**', 'technique', 'biology', ['ode-existence']),
  c('michaelis-menten', 'Michaelis–Menten 式', '**中間体が一つなら、飽和曲線は双曲線に決まる。**Hill 係数が 1 を超えたら中間体が一つではない', 'theorem', 'biology', ['quasi-steady-state']),
  c('helix-coil-transition', 'ヘリックス–コイル転移', '**転送行列で 1 次元 Ising と同型になる。**だから「相転移」に見えて相転移ではない', 'theorem', 'biology', ['transfer-matrix', 'one-dimension-no-transition']),
  c('hopfield-capacity', 'Hopfield 網の容量', '覚えられる型の数が素子数に比例する。比例定数が計算で出る', 'theorem', 'biology', ['spectral-theorem', 'concentration-inequality']),
]
