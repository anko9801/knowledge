# 分野調査の索引（2026-09-06〜07）

21 本の調査を並列で走らせた結果。**報告の全文は残っていない**（session の
scratchpad にしか無かった）。ここに残すのは、**次に同じ調査をしないために要る分**
だけである ── 判定と、その根拠と、確かめられなかったこと。

概念の一覧は残していない。**必要なら調査し直したほうが速い**（一次資料の URL は
下に書いた）。ここが持つのは、**もう一度考え直さなくてよい判断**である。

## 走らせ方（実測）

- **6〜8 本まで。** 20 本まで出すとセッションの上限に当たり、**全部落ちる**。
  二度踏んだ（12 本と 15 本が同時に消えた）。調査 agent は自分の子を持つので、
  8 本出すと実際には 15〜18 本になる
- **検索の予算もセッション単位で尽きる。** 4 本が「WebSearch の予算が尽きた」で
  終わった。**全文公開の URL を仕様に直接書く**と、本文まで取れる
- **無反応の監視（600 秒）でも落ちる。** 「40 分以内に返せ」「範囲が広いなら
  特に見るもの三つを優先し、残りは判定と一行だけ」を仕様に書くと収まった
- **目次だけでは足りない。** 最初の調査は全部目次で作られ、担当自身が
  「機構の説明は目次から演繹したものではなく、私が書いた」と断っていた。
  **`gist` こそが成果物なので、それが未検証では調査の意味が無い。**
  索引（著者が「名前の付いた概念だ」と判断したものだけが載る）と、
  全文公開の教科書を優先させると、`[本文]` の比率が跳ね上がった

## 判定

**◎ = 連載として立つ（10〜20 回書ける）。○ = 他の連載の数回。× = 導ける命題が少ない。**

### ◎

熱力学（52 概念案・7 回）、統計力学（87・15〜19）、非平衡、地球流体力学、
地球物理の逆問題、地震学、気候の平衡（**裏取りが弱い。下記**）、集団遺伝学、
疫学の因果推論、感染症数理、薬物動態、医用画像（**名前が違うかもしれない**）、
信号検出、心理測定、統語論、音韻論、社会選択、メカニズムデザイン、ゲーム理論、
形式人口学、投票と議席配分、社会ネットワーク（**条件付き**）、制御、移動現象論、
構造力学、量子情報、量子誤り訂正、偏微分方程式、凸解析と最適化、複素解析、
初等数論、代数体、グラフ理論と確率的方法、数値解析、力学系とカオス、
決定理論、形式認識論、認識論理と共有知識、音律、色彩、模様、電子構造理論、
軌道対称性と反応、結晶の対称性。

**横断（分野で切らない）**: 不動点定理。

### ×

双対性（横断として）、逆問題（単独）、心理学全体、社会心理学、計量経済学、
文学、観光学、地質学、有機反応機構、施工管理、HCI、ソフトウェア工学。

**× は「学ぶ価値がない」ではなく「この repo の軸に載らない」。**
◎ と ○ の境目は「支配方程式が保存則か対称性から出るか」で切った。

## もう一度考え直さなくてよい判断

### 家の決め方（`decisions.md` の三つの型を当てた結果）

- **投票理論は社会科学。** Arrow も中位投票者も Balinski--Young も Banzhaf も、
  **仮定が順序だけ**である。貨幣も予算制約も要らない。経済学側の社会選択は
  その上に可移転効用を載せている。線は「**貨幣が無い → 社会科学、
  支払いがある → 経済学**」
- **Legendre 変換の家は凸解析。** 「Legendre 変換」は `aka` へ。
  **物理の読者は全員 Legendre で探しに来て、凸解析の本には Fenchel としか
  書いていない**
- **Huygens（奇数次元でだけ鋭い）の家は偏微分方程式。** 波動方程式だけから出て、
  Maxwell 方程式は要らない。電磁気は引く側
- **有限体と Galois は `algebra`。** 数論には置かない。初等数論は Galois を
  一度も使わず、代数体も ch1〜6 は使わずに書ける
- **Neyman--Pearson は統計に 1 個だけ。** 医学は動作点の選び方、心理は
  「一つの正答率が二つの数に分かれる条件」。三つが同じものを挙げていた
- **エルゴード理論は三つに割る。** 「時間平均は必ず収束する」（Birkhoff、力学系）と
  「位相平均に等しい」（要請、統計力学）を一つの概念に潰すと、
  **`observable` を有限次元スペクトル定理に繋いでいたのと同じ失敗**になる
- **Liouville の定理の家は解析力学。** $omega$ が閉じていることだけから出る。
  ただし**複素解析の Liouville と名前が衝突する**

### 統合しないと決めたもの

- **選択則と Woodward--Hoffmann は機構が違う。** 片方は Wigner の消滅積分定理
  （一点の点群）、片方は非交差則（経路全体で保たれる部分群）。
  **「対称性が禁じる」に二つの意味がある**が連載の結びになる
- **Hall の定理と安定マッチングは無関係。** Gale--Shapley の設定はグラフが
  完全二部なので、Hall の条件は自明に成り立つ。中身は全部「安定性」の側にある。
  しかも Hall と König は既に `matching-duality` に畳まれている（`aka` を足すだけ）
- **Balinski--Young は Arrow の実例ではない。** 要求も結論も別
  （quota rule と人口単調性 対 全会一致と IIA）。**不可能性定理が二つある**
- **薬物動態は薬理学と切り口が違う。** 削除済みの薬理学は「何に効くか」で経験。
  薬物動態は「質量保存と一次速度論を仮定したとき濃度がどうなるか」で、
  線形 ODE を解いて出る。同じ形が二つ ── 生化学は × だが酵素反応速度論は ◎、
  生理学は × だが循環・呼吸の定量は ◎

### 数え方が分け方を決めた

- **数論は二本**（初等 12 回・代数体 11 回）。軸が違う（$ZZ\/n ZZ$ の中 対 $O_K$）。
  分ける根拠がそのまま `derivations` の一行になる ──
  **初等数論は Pell の無限解を連分数で作り、なぜ在るのかは言わない。
  代数体は実二次体の単数の階数が 1 であることから出す**
- **組合せ論とグラフ理論は一本。** 平面性・彩色（6 回）も極値・確率的方法（8 回）も
  単独では 10 に届かず、一本の軸で繋がる ──
  **「その形が入らない」ことは、入らない理由を一つ挙げて示す。
  理由が挙がらないときだけ確率が要る**
- **統計熱力学と反応速度論は合わせて一本。** 片方だけだと 6〜7 回

### 前回の削除が、今回の設計を決めた

- **`economics` の削除理由は「分野として立っていないのに `goals` があった」で、
  定理が無かったからではない。** 復元した 7 概念はどれも**定理名だけで、
  仮定が書かれていなかった**
- **角谷は戻さない。** Nash 自身が 1951 年 Annals 版で角谷版を捨てて Brouwer 版に
  書き直している（p.288、本文で確認）。角谷が要るのは需要が対応になる場合の
  Arrow--Debreu だけ
- **制御が前回立たなかったのは、第 14 章の手前で止まっていたから。**
  状態空間・可制御性・Kalman だけなら線形代数の応用で、軸が無い。
  軸は Bode の積分定理（**対数感度の面積が保存する**）の側にある
- **学習理論を外した理由は今回当たらない。** 「中核が数学で閉じる」は
  cs か math かの話で、統計として置けば理由が消える

## 発見

### 一つの定理が、五つの概念に散らばっていた

`cantor-theorem`（集合論）、`diagonal-lemma`（論理）、`tarski-undefinability`、
`halting-problem`、`time-hierarchy`（計算量）── **Lawvere の不動点定理の系である。**
デカルト閉圏で $f: A arrow B^A$ が点全射なら $q(a) = g(f(a)(a))$ が $g$ の不動点を作り、
対偶に $g = not$ を入れると Cantor、文の集合に入れると Tarski、停止判定に入れると
停止問題、対角化に入れると時間階層定理。**辺が一本も無い。**

### 同じ分解が二度出る

数値解析で、線形方程式の誤差は $kappa(A) times epsilon$（問題 × 算法）に分かれる。
常微分方程式では 剛性比 $times$ 安定性領域（問題 × 算法）。
**「悪い答えは問題のせいか算法のせいか」が定理で決まる。**

### Feigenbaum はくりこみ群である

倍加作用素の双曲的固定点で、単位円の外に出る固有値がちょうど一つ。
それが $delta = 4.6692...$。粗視化写像・固定点・線形化・relevant な方向の数・
余次元 = 調整すべき助変数の数、が Wilson の骨格と一字一句同じ。

### 有効ポテンシャルは凸である

$Gamma$ は $W[J]$ の Legendre 変換で、**共役は元が凸でなくても必ず凸**
（Boyd §3.3.1、本文で確認）。凸関数に狭義の二山は立たない。
**教科書が描く二つ谷の絵は、近似が壊れた跡である。**
統計力学の Maxwell 構成（凹包を取る）と同じ定理。

### 分離超平面に、四人が独立に着いた

経済学（無裁定 ⟺ 状態価格）、工学（塑性崩壊の下界定理）、
哲学（**Dutch book ── 整合性 ＝ 裁定不可能性 ＝ 確率測度の存在**）、
化学（Lieb による DFT の凸解析的定式化）。

### 12 が選ばれた理由は、五度だけでは出ない

連分数が出すのは $19\/12$、$65\/41$、$84\/53$（五度だけの答え）。
12 平均律の長三度は 13.7 セント高く、これは一次元の連分数からは出ない。
五度と長三度を基底に取ると純正律は $ZZ^2$ で、
$mat(4, -1; 12, 0)$ の行列式が 12 ── **二つのコンマを潰すと剰余類が 12 個できる。**

### 測定を定理に変えているのは閉包性

スイスドイツ語で測れるのは有限個の文だが、正規集合を一つ掛けて
$a^m b^n c^m d^n$ を切り出すと、文脈自由言語が交叉で閉じることから無限の主張になる。

### 非一意性は観測不足ではない

地球物理の逆問題で、$"span"{G_i}$ は $N$ 次元、模型空間は無限次元。
**零空間は必ず無限次元で、観測を増やしても消えない。**
そして「最小ノルム解」は結論ではなく、我々が足した仮定である。

## 足りない概念（複数の調査が独立に要求した）

`markov-chain`、`graph` とその周辺 5 個、`rank-nullity`、`convex-conjugate`、
`cartesian-closed`、`finite-field`、`kolmogorov-complexity`、`linear-code`、
`fisher-information`、`likelihood-ratio-test`。

**`public-key-encryption` の `requires` は `semantic-security` 一つだけで、
数学的な前提が一つも無い。**

## 名前の衝突

- **`lattice`** ── 順序論の束。結晶格子（`bravais-lattice`）、点格子
  （`point-lattice`）、純正律の格子が全部この名前を要求した。三人が指摘
- **`birkhoff-theorem`** ── 一般相対論（球対称真空解の一意性）に既にある。
  エルゴードのほうは `birkhoff-ergodic-theorem`
- **`liouville-theorem`** ── 解析力学と複素解析
- **`rounding`** ── 既存は LP の丸め。数値解析の丸めは `unit-roundoff`
- **`causal-structure`** ── 特殊相対論（光円錐）と因果推論の DAG

## 確かめられなかったもの（書く前に当たること）

- **'t Hooft 1979（Subnucl. Ser. 15, 943--982）は電子的に入手できないと確定。**
  著者自身のサイトに 70 本の PDF があるのに、これだけ無い。
  レノーマロンの記述は Beneke のレビューを出典にするか、紙を確保するか
- **Woodward--Hoffmann の原論文**（1965 JACS / 1969 Angew. Chem.）に当たれなかった。
  規則の文言は確認済みだが、1965 → 1969 の定式化の変遷は未確認
- **Lanford 1982**（Feigenbaum 固定点の計算機援用証明、Bull. AMS 6, 427--434）が 403
- **Balinski--Young の原典**（*Fair Representation*, 1982）。「4 者以上」の 4 と
  人口単調性の正確な定義が未確認
- **Backus--Gilbert の原典**（1968/1970）。Tarantola も Snieder も取れず、
  逆問題の 7 命題は全部**自分で導いたもの**
- **気候の複数平衡**。「アルベドが単調減少なら平衡が三つ」は**厳密には偽**で、
  「変化が十分急なら」が要る。その閾値を式で書けるか未確認。
  書けないなら `CLAUDE.md`「平文で言えることに記号を被せない」に触れる
- **日本の大学の課程表は 4 件とも取得失敗**（東大・京大がタイムアウトか 404、
  MEXT のコアカリも 404）。応用化学・建築・船舶海洋は未確認

## 出典（全文公開。次に調べるとき、ここから始める）

Åström--Murray *Feedback Systems* ／ Lienhard *A Heat Transfer Textbook* ／
Boyd--Vandenberghe *Convex Optimization* ／ Hernán--Robins *Causal Inference: What If* ／
Shalev-Shwartz--Ben-David *Understanding Machine Learning* ／
Diestel *Graph Theory* ／ Milne *Algebraic Number Theory* ／ Stein *Elementary Number Theory* ／
Teschl *ODE and Dynamical Systems* / *Mathematical Methods in QM* ／
Hunter *PDE notes* (UC Davis) ／ Carroll *Lecture Notes on GR* (gr-qc/9712019) ／
Townsend *Black Holes* (gr-qc/9707012) ／ Pols *Stellar Structure and Evolution* ／
Lieb--Yngvason (cond-mat/9708200) ／ Coop *Population and Quantitative Genetics* ／
Burke *The ABC of DFT* ／ Benson *Music: A Mathematical Offering* ／
Wandell *Foundations of Vision* ／ Easley--Kleinberg *Networks, Crowds, and Markets* ／
Preskill *Quantum Information* (preskill.caltech.edu/ph219) ／ Watrous *TQI* ／
Beck ほか *A First Course in Complex Analysis* ／ Ash--Novinger *Complex Variables* ／
Albano *Measurement Using R* ／ Sutton--Barto ／ Walkden *Ergodic Theory* ／
Higham の "What Is" 連載 ／ Trefethen *Six Myths* ／ Hairer *Geometric Numerical Integration* ／
Stanford Encyclopedia of Philosophy ／ Handbook of Computational Social Choice ／
Nisan ほか *Algorithmic Game Theory* ／ Jaynes 1957 ／ Nash 1951 ／
Aizenman--Duminil-Copin (1912.07973) ／ Clay の問題文（Yang--Mills, Navier--Stokes）
