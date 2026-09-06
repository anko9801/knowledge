import type { Concept } from './types.ts'
import { c } from './types.ts'

export const csMisc: readonly Concept[] = [
  // --- 時間の制約（外部入力、その 2） --------------------------------------------------
  //
  // 経済と呼びたくなるが、それだと分野（一般均衡、Arrow の定理）の名前になる。
  // 言いたいのは「一度書いて終わりではない」ことなので、時間と呼ぶ。
  //
  // 認知負荷で全部を説明しようとすると、ここが説明できずに潰れる。
  // 「変更に強い」は頭の容量の話ではない。変更が何回来るか、来たとき何箇所
  // 直すことになるか、という手間の話である。Winters「ソフトウェア工学とは
  // 時間で積分したプログラミング」、Beck『Tidy First?』の第 3 部がここ。
  //
  // 面白いことに、入口（変更は来る、費用は割り引かれる）だけが経験的で、
  // そこから先は論理で決まる。波及範囲は結合関係の推移閉包そのものである。
  c('change-over-time', '時間で積分する', '書き捨てなら何でもよい。保守が要るとき初めて設計が費用になる', 'viewpoint', 'cs'),
  c('coupling', '結合', 'ある変更に対して、片方を変えるともう片方も変えねばならない関係。変更ごとに決まる', 'definition', 'cs', ['relation-order'], ['change-over-time']),
  c('change-propagation', '変更の波及', '直す箇所は結合関係の推移閉包。閉路があると全体が 1 つになる', 'theorem', 'cs', ['coupling']),
  c('constantine-equivalence', 'Constantine の等式', 'ソフトウェアの費用は変更の費用に、それは大きな変更に、それは結合にほぼ等しい', 'viewpoint', 'cs', ['change-propagation']),
  c('decoupling-cost', '分離にも費用がある', '結合を減らす側にも費用の坂がある。どちらへ振り切っても高くつく', 'viewpoint', 'cs', ['constantine-equivalence']),
  c('control-vs-dependency', '流れと依存は別', 'A が B を呼ぶことと、A が B に依存することは、独立に決められる', 'viewpoint', 'cs', ['coupling']),
  c('dependency-inversion', '依存性逆転', 'インターフェースを呼ぶ側に置く。制御の向きはそのままで、依存だけ反せる', 'technique', 'cs', ['control-vs-dependency', 'information-hiding']),
  c('stable-dependency', '安定依存', '変わりやすい側が、変わりにくい側に依存する。層の数ではなく二者の相対関係', 'viewpoint', 'cs', ['change-propagation', 'dependency-inversion']),
  c('unidirectional-flow', '単方向フロー', '状態の更新経路から閉路を無くす。TEA と Redux。依存の向きとは別の話', 'technique', 'cs', ['control-vs-dependency'], ['cognitive-load']),
  // 経済の側は 1 本ではなく、逆を向く 2 本である。ここを 1 本に潰すと
  // 『Tidy First?』の題名に付いた疑問符が消える。Beck の答えは
  // 「Tidy first? Yes. Also no.」で、決着していないことが中身だった。
  c('discounting', '割引', '今日の 1 ドルは明日の 1 ドルより価値がある。早く稼ぎ、遅く払え', 'viewpoint', 'cs', ['change-over-time']),
  c('optionality', 'オプション価値', '不確かならモノより選択肢。先読みが外れるほど分離の価値が上がる', 'viewpoint', 'cs', ['change-over-time'], ['essential-accidental']),
  c('duplication-is-coupling', '重複は結合', '同じ判断が二箇所にあると、その判断を変える変更に関して結合する。消すのは字面ではなく関係', 'theorem', 'cs', ['coupling']),
  c('false-duplication', '偶然の一致', '一方だけが変わる変更があるなら結合していない。寄せると無かった関係を作る', 'viewpoint', 'cs', ['duplication-is-coupling']),
  c('implicit-coupling', '暗黙の結合', '型にも呼び出しにも現れない結合。書式の前提、列名の仮定、実行順序', 'viewpoint', 'cs', ['coupling']),
  c('unknown-unknowns', '何を知らないか分からない', 'どこを直せばよいか分からず、直しても足りたか分からない。三症状で最も厄介', 'viewpoint', 'cs', ['implicit-coupling']),
  c('complexity-weighting', '触る場所だけが効く', '複雑さは触る時間の割合で重み付く。見ない場所へ隔離すれば無くしたのとほぼ同じ', 'viewpoint', 'cs', ['change-over-time']),
  c('tidying-timing', '整頓は先か後か', '割引は後回しを、オプション価値は前倒しを支持する。費用の比較でしか決まらない', 'viewpoint', 'cs', ['discounting', 'optionality', 'decoupling-cost']),
  // 作る前の試作は、モノを買っているのではなく「作らない選択肢」を買っている。
  // だから価値がばらつきとともに上がり、読みの当たる領域では損になる。
  // 「常に試してから作れ」が成り立たない理由が、ここから出る。
  c('discovery-as-option', '試作は選択肢を買う', '作る前の試作は、モノではなく作らない選択肢を買っている。不確かさが大きいほど得', 'viewpoint', 'cs', ['optionality'], ['feedback-delay']),
  // 「試作するか」を 1 つの判断にすると、Cagan の 4 分割が消える。潰す
  // リスクは価値・使い勝手・実現可能性・事業成立で、確かめ方も別々。
  // 分布が違うので、まとめて値付けすると確実な側にも費用を払うことになる。
  c('four-risks', '潰すリスクは四つある', '欲しがるか、使えるか、作れるか、事業として成り立つか。分布も確かめ方も別', 'viewpoint', 'cs', ['discovery-as-option']),
  // --- プログラムの構成 ----------------------------------------------------------
  //
  // 「計算機の構成」の対。あちらは機械の制約から設計が決まり、こちらは
  // 人の制約から決まる。どちらも人工物（x86、Haskell）ではなく制約で切る。
  //
  // 認知は動機であって、中身は論理である。goto をやめる根拠は美学ではなく
  // 「進行状況を有限の座標で書けるか」で、Hoare 論理に落ちる。情報隠蔽は
  // 表現独立性に、参照透過性は Church--Rosser に、型検査は健全性定理に落ちる。
  // だから requires は論理側だけに張り、認知へは empirical で繋ぐ。
  c('essential-accidental', '本質的複雑性と偶有的複雑性', 'Brooks。減らせるのは後者だけ。ただし残りの何割が本質かは決着していない', 'viewpoint', 'cs', [], ['cognitive-load']),
  c('essential-state', '本質的な状態', '本質的なのは入力だけで、導出できる状態は偶有的。Tar Pit の判定基準', 'viewpoint', 'cs', ['essential-accidental', 'immutability']),
  c('hoare-logic', 'Hoare 論理', '事前条件と事後条件でプログラムの意味を書く', 'definition', 'cs', ['proof-system']),
  c('loop-invariant', 'ループ不変条件', '繰り返しの意味を 1 本の命題に畳む。頭をリセットしてよい点', 'technique', 'cs', ['hoare-logic']),

  c('structured-programming', '構造化プログラミング', '静的なテキスト位置から動的な進行状況を有限の座標で指せるようにする', 'viewpoint', 'cs', ['loop-invariant'], ['cognitive-load']),
  c('information-hiding', '情報隠蔽', 'モジュールは機能ではなく、隠す決定で切る。Parnas', 'viewpoint', 'cs', [], ['cognitive-load', 'chunking']),
  c('deep-module', '深いモジュール', '狭い口で大きな中身を隠す。口を覚える費用より隠した量が大きいかで測る', 'viewpoint', 'cs', ['information-hiding'], ['chunking']),
  // --- 美学が割れる場所 ----------------------------------------------------------
  //
  // 達人どうしが正面から食い違うのは、好みの差ではなく、置いている仮定の差
  // である。剥がすと四つしかない。読み手を誰と想定するか、先をどれだけ読める
  // と思うか、誤りを防ぐか直すか、一貫性を心に置くか界面に置くか。
  //
  // どれも上の制約と矛盾しない。同じ制約の下で、仮定が違えば逆の作法が出る。
  c('reader-model', '想定読み手', '読みやすさは読み手を指定しないと決まらない。熟達者はまとまりが大きい', 'viewpoint', 'cs', ['expertise-reversal', 'chunking']),
  c('worse-is-better', '単純さを先に置く', '単純・正しさ・一貫性・網羅性の順序を入れ替える。複雑さをどちらへ押すか', 'viewpoint', 'cs', ['optionality', 'load-tradeoff']),
  c('poka-yoke', 'ポカよけ', '起こせなくするか、必ず気づくか。誤りの責任を人から仕組みへ移す', 'viewpoint', 'cs', ['error-proneness', 'feedback-delay']),
  c('prevent-vs-recover', '防ぐか直すか', '冗長性と隔離があるなら、直す側が安くなる。無ければ成り立たない', 'viewpoint', 'cs', ['poka-yoke', 'illegal-states-unrepresentable', 'interleaving']),
  c('conceptual-integrity', '概念の一貫性', '寄せ集めより一組の考えで貫く。担い手を一人か少数の頭に置く', 'viewpoint', 'cs', ['essential-accidental']),
  c('coherence-in-interface', '一貫性を界面に置く', '繋ぎ方の規約に一貫性を持たせる。結合を消すのではなく一種類に揃える', 'viewpoint', 'cs', ['conceptual-integrity', 'coupling']),
  c('theory-building', 'プログラムは理論である', '成果物はコードではなく、書き手が持つ理論。コードは書き下せた部分だけ', 'viewpoint', 'cs', ['implicit-coupling'], ['chunking']),
  c('learning-asymmetry', '学習の非対称', 'まとまりが作れれば 2 回目以降が安くなる。作れなければ毎回同じだけかかる', 'theorem', 'cs', ['chunking', 'deep-module', 'expected-change-cost']),
  c('first-read-only', '実験は一回目しか測らない', '知らない人に断片を一度見せる形なので、n=1 の差しか出ない', 'viewpoint', 'cs', ['learning-asymmetry', 'absolute-vs-relative-prediction']),
  c('program-death', 'プログラムの死', '理論を持つ人が全員いなくなること。動き続けるが、意味のある変更はできない', 'viewpoint', 'cs', ['theory-building']),
  // 負債が帳簿に出ないのは、対応する資産も出ていないからである。広木は
  // 見える／見えない × プラス／マイナスの 4 象限を引き、技術的負債を
  // 「見えない × マイナス」に置いたうえで、それはシステムの複雑性の増加
  // そのものではなく、エンジニアと経営者の間の認識の差だと書いている。
  // 複雑性の話に読み替えると、この「差」が消える。
  c('invisible-asset', '見えない資産', '負債が帳簿に出ないのは、対応する資産（理論）も出ないから。差だけが問題になる', 'viewpoint', 'cs', ['theory-building'], ['change-over-time']),
  // 抱えられる量を超えたときの手は、人を足すことでも諦めることでもなく、
  // 扱う領域の数を絞って超過分を別の組へ移すこと。Skelton らの経験則は
  // 単純な領域なら 2〜3、複雑な領域なら 1 つ、混ぜない。
  c('domain-count-limit', '数えるなら、行数ではなく領域の数', '抱えられる量は行数では測れない。領域の数のほうが当たる。ただし目安の値は経験則', 'viewpoint', 'cs', ['relocation-not-reduction', 'invisible-asset']),
  // --- 理論が渡る条件 -----------------------------------------------------------
  //
  // 理論は人にしか宿らないので、人の間を渡るかどうかが組の能力を決める。
  // 組織論の言葉で書かれる領域だが、入口だけが経験的で、そこから先は算術である。
  //
  // 観測できるのは報告された数だけで、それは発生した数と報告率の積になる。
  // 1 本の式に未知数が 2 つあるので、片方を独立に測らないかぎり分離できない。
  // 心理的安全性の最初の研究が観察者を別に立てたのは、この分離のためだった。
  //
  // 「報告しやすい場を作れ」を経験則として置くと、ここが出てこない。効くのは
  // 場の良し悪しではなく、指標が積であることのほうである。
  c('observed-is-product', '報告の数は、二つのことで決まる', '起きた数と、上げた割合。見えるのは掛かった結果だけなので、どちらの差かは決まらない', 'viewpoint', 'cs', ['error-proneness']),
  c('reporting-cost', '報告の費用', '報告する側が損をするなら報告率が下がる。安全な組と黙る組は同じ数字を出す', 'viewpoint', 'cs', ['observed-is-product'], ['feedback-delay']),
  c('theory-transfer', '理論は問いでしか渡らない', '文書は予期できた問いにしか答えていない。残りは問える場でしか渡らない', 'viewpoint', 'cs', ['theory-building'], ['reporting-cost']),
  // 報告率を上げ下げする仕組みは、行動分析の「きっかけ→行動→みかえり」に
  // 落ちる。報告は行動なので、直後に何が起きるかで頻度が決まる。
  //
  // ここで止めると「罰しなければよい」になるが、石井は次の層を置いている。
  // 言語行動は体験の前に判断できるので、実際に罰された人がいなくても
  // 報告率は下がる。「うちは罰していない」が反証にならない理由がここ。
  c('behavior-consequence', '行動はみかえりで決まる', 'きっかけ→行動→みかえり。報告も行動なので、直後に何が起きるかで頻度が変わる', 'viewpoint', 'cognition', ['error-proneness']),
  c('rule-governed-behavior', '体験の前に、言葉で決まる', '罰を受けた人がいなくても、報告しないほうがよいと言葉で判断できれば報告は減る', 'viewpoint', 'cognition', ['behavior-consequence']),
  c('metric-suppresses-detection', '指標が検出を抑える', '気づく側を強くすると報告数は必ず増える。報告数で管理すると、気づく仕組みが削られる', 'viewpoint', 'cs', ['observed-is-product', 'poka-yoke']),
  // --- 減らすとは何か -----------------------------------------------------------
  //
  // どの流儀も「減らせ」と言い、何を数えるかだけが違う。そして力のある流儀ほど
  // 個数を数えない。単純さは絡まりの少なさで、深いモジュールは中身が大きい。
  // 分けすぎは口の数だけ増やして、隠せる量を増やさない。
  //
  // そして減らすには床がある。相手の多様さは、こちらの多様さでしか吸収できない。
  // 検査を足せば、足した分だけ系が複雑になる。だから減っているように見えるとき、
  // たいていどこかへ移っている。負荷の配分の一般形がここに来る。
  c('simplicity-is-not-fewness', '単純さは個数ではない', '撚り合わさっていないこと。一つしか無いこととは違う', 'viewpoint', 'cs', ['deep-module', 'chunking']),
  c('requisite-variety', '必要多様性', '相手の多様さは、こちらの多様さでしか吸収できない。減らすには床がある', 'theorem', 'cs', ['simplicity-is-not-fewness']),
  c('safeguard-complexity', '安全装置が事故を作る', '検査を足せば足した分だけ系が複雑になり、新しい故障の経路が生まれる', 'viewpoint', 'cs', ['requisite-variety', 'change-propagation']),
  c('relocation-not-reduction', '減らすのではなく移す', '減ったように見えるとき、たいていどこかへ移っている。まず移り先を見る', 'viewpoint', 'cs', ['safeguard-complexity', 'load-tradeoff']),
  c('truncated-maxim', '条件の落ちた格言', '格言は条件付きで、伝わる途中で条件が落ちる。伝わる形と正しい形が違う', 'viewpoint', 'cs', ['reader-model'], ['worse-is-better']),
  // --- 測られている数 -----------------------------------------------------------
  //
  // 仮定として使ってきた認知の制約には、実際に測られた数がある。入れると
  // いくつかの通説が数の上で成り立たなくなる。
  //
  // ばらつきが大きいので、絶対値の予測には使えない。比較には使える。同じ
  // 定数を両案に入れれば相殺するからで、Halstead が死んで KLM が生きた差が
  // そこにあった。どちらが速いかは言えて、何秒速いかは言えない。
  c('chunk-capacity-in-bits', 'チャンクの中身に上限は無い', '記憶範囲は個数で決まり情報量では決まらない。二進なら 9、英単語なら 5', 'theorem', 'cognition', ['working-memory-limit', 'chunking']),
  c('code-entropy', 'コードのエントロピー', '記号あたり 3〜4 ビット。英語の半分以下で、局所文脈 3〜4 記号で飽和する', 'definition', 'cs', ['entropy', 'chunk-capacity-in-bits']),
  c('comprehension-time-share', '読む時間の割合', '理解に 58〜70 パーセント、編集に 5 パーセント。上級者ほど理解が小さい', 'definition', 'cs', ['change-over-time']),
  c('resumption-lag', '中断からの復帰', '編集開始まで 10〜15 分。実験室で測る再開の遅れ 20 秒とは別の量', 'definition', 'cs', ['working-memory-limit', 'comprehension-time-share']),
  c('expertise-is-not-speed', '熟達は速さではない', '注視の回数で差が出て、1 回の長さでは出ない。見ない場所が決まること', 'viewpoint', 'cs', ['chunk-capacity-in-bits', 'expertise-reversal']),
  c('absolute-vs-relative-prediction', '比較には使え、予測には使うな', 'ばらつきが値と同程度ある。両案に同じ定数を入れれば相殺する', 'viewpoint', 'cs', ['code-entropy', 'expertise-is-not-speed']),
  c('representation-independence', '表現独立性', '実装を替えても外から区別できない。情報隠蔽の定理版', 'theorem', 'cs', ['information-hiding', 'parametricity']),
  c('immutability', '不変性', '値が書き換わらないなら、いま誰が指しているかを追わなくてよい', 'viewpoint', 'cs', [], ['cognitive-load']),
  c('referential-transparency', '参照透過性', '式を値で置き換えてよい。等式で推論できる', 'viewpoint', 'cs', ['church-rosser', 'immutability'], ['cognitive-load']),
  c('effect-typing', '作用の型付け', '読む必要のある範囲を型で宣言する。モナドと作用系', 'technique', 'cs', ['monad', 'referential-transparency']),
  c('minimal-reproduction', '最小再現', '不具合を系の一部だけで再現する。切り出せる大きさは結合が決める', 'technique', 'cs', ['referential-transparency', 'coupling'], ['feedback-delay']),
  c('type-soundness', '型の健全性', '型が付けば実行時に詰まらない。progress と preservation', 'theorem', 'cs', ['simply-typed-lambda'], ['error-proneness']),
  c('mechanized-checking', '検査の機械化', '人が頭で保っていた不変量を、機械に確かめさせる', 'viewpoint', 'cs', ['type-soundness', 'loop-invariant'], ['cognitive-load', 'feedback-delay']),

  // 検査器の取捨は、心理ではなく決定可能性が決めている。
  //
  // 「落ちない」は非自明な意味的性質なので、Rice の定理から決定不能。だから
  // 停止する検査器は必ず近似になり、どちらへ寄せるかしか選べない。健全性とは
  // 偽陰性を 0 にする側を選ぶことで、その代償に「正しいのに通らない」が必ず残る。
  // 妥協ではなく、曲線上のどこに立つかの選択である。
  //
  // 認知負荷はこの曲線のどこにも印を付けられない。だから動機にはなっても
  // 判定には使えない、という線がここで定理として引ける。
  c('checker-as-classifier', '検査器は分類器である', '通す・弾くの二値。偽陽性は「正しいのに通らない」、偽陰性は「落ちるのに通る」', 'viewpoint', 'cs', ['type-soundness', 'rice-theorem']),
  c('soundness-completeness-tradeoff', '健全性と完全性は両立しない', '停止する検査器は必ずどちらかを捨てる。Rice の定理の系', 'theorem', 'cs', ['checker-as-classifier']),
  c('deliberate-unsoundness', '意図的な不健全性', 'Java の共変配列、TypeScript の any。偽陽性を嫌って偽陰性を受け入れた点', 'viewpoint', 'cs', ['soundness-completeness-tradeoff'], ['cognitive-load']),
  c('types-as-redundancy', '型は冗長性である', '同じことを項と型で二度書き、食い違いを検出する。符号との類比は比喩に留まる', 'viewpoint', 'cs', ['type-soundness'], ['error-taxonomy']),
  c('load-tradeoff', '負荷の配分', '負荷は消えず移るだけ。GC は実行時へ、所有権は記述へ', 'viewpoint', 'cs', ['mechanized-checking'], ['essential-accidental']),
  c('cyclomatic-complexity', '循環的複雑度', '制御フローグラフの独立閉路数。グラフの量であって、認知の量ではない', 'definition', 'cs', ['structured-programming', 'connectedness']),

  // 制約を一本に畳めるか、という問いへの答えをここに置く。
  //
  // 畳める、と言いたくなる。期待変更費用に全部換算できるからである。読む時間も
  // 逃した欠陥の修正費用も計算資源も、割り引いて足せば同じ単位に載る。
  //
  // だが同じ物差しで測れることと、一つの原理から導けることは別である。換算率
  // ——読みにくさが何分に相当するか——は外から与えるしかなく、そこが実質を
  // 全部持っていく。上に載っているだけで、下を置き換えてはいない。「手間を最小に
  // せよ」からは、何をすればよいかが一つも出てこない。
  //
  // では外から与えるものは何本か。四つである。
  //
  //   機械  速い記憶ほど小さく、遠い
  //   保持  一度に持てる量が決まっている
  //   誤り  誤りは混じる。混じったものは遅く見つかるほど高くつく
  //   変更  一度書いて終わりではない。変更は来る
  //
  // 「人」を 1 本に潰して三つに数えたことがあるが、それだと保持と誤りが
  // 同居する。すべて覚えていられても混入する率は 0 にならないので別の事実で、
  // 実際この二つは逆を向くことがある（deliberate-unsoundness）。
  //
  // 分野の名前（物理、認知科学、経済学）を当てないこと。それぞれの分野が
  // 扱う対象ではあるが、ここで言いたいのは分野ではなく「何の限界か」である。
  // 物理と書くと、この repo では量子力学と解析力学のことになってしまう。
  //
  // 決定不能性（Rice、停止問題）はここに入らない。定理だからである。数学を
  // 仮定に含めた時点で出てくるので、外から与える必要がない。並べて数えたのが
  // 誤りだった。ただし効かないわけではなく、働き方が違う。下の二つに分ける。
  c('expected-change-cost', '手間の総量', '読む時間も、逃した欠陥の修正も、計算資源も、最後は同じ物差しで測れる', 'viewpoint', 'cs', ['tidying-timing', 'feedback-delay']),
  c('littles-law', 'Little の法則', '仕掛かり数 = 到着率 × 滞在時間。分布に何も仮定せずに成り立つ', 'theorem', 'cs', ['expectation']),
  c('utilization-nonlinearity', '稼働率と待ちの非線形', '待ちは $rho \\/ (1 - rho)$ で伸びる。$0.9$ で $9$ 倍、$0.95$ で $19$ 倍', 'theorem', 'cs', ['littles-law', 'probability-space']),
  c('variability-cost', 'ばらつきの費用', '待ちはばらつきの二乗平均に比例する。速くするのと、揃えるのは同じだけ効く', 'theorem', 'cs', ['utilization-nonlinearity', 'law-of-large-numbers']),
  c('irreducible-inputs', '動かせない前提', '機械・保持・誤り・変更の四つ。選んだものではないので、測って確かめられる', 'viewpoint', 'cs', ['expected-change-cost']),
  c('feasibility-vs-cost', '高くつくとできないは別', '四つの前提は釣り合いの問題、決定不能性は可否の問題。混ぜると判断を誤る', 'viewpoint', 'cs', ['irreducible-inputs', 'soundness-completeness-tradeoff']),
  c('binding-constraint', '効いている制約', '制約が 1 本しか効かない場所に判断は無い。逆を向いた二本があるときだけ要る', 'viewpoint', 'cs', ['feasibility-vs-cost', 'load-tradeoff']),
  // --- 関数型は三度導かれる --------------------------------------------------------
  //
  // 認知負荷だけで関数型を説明しようとすると弱くなる。「純粋にすると楽」も
  // 「純粋にすると辛い」も同じ理屈で言えてしまい、モナド変換子の N^2 問題や
  // 遅延評価のスペースリークを事前に予測できないからである。
  //
  // 実際には三つの制約が独立に同じ設計へ着く。そこが関数型の強みで、
  // 一本に還元すると、その強みの理由の方が消える。
  //
  //   人    不変性なら、いま誰が指しているかを追わなくてよい
  //   型    不正な状態を作れなくする。健全性とパラメトリシティ
  //   機械  共有可変状態が無ければ、データ競合も無い
  //
  // 型の側も「考えなくてよくなる」ので動機は人の側にある。ただし動機と判定は
  // 別で、健全性が成り立つかどうかを認知負荷から決めることはできない。
  // 逆を向く例があるので、そこは deliberate-unsoundness に置いてある。
  //
  // 時間の側（変更の波及）は情報隠蔽と安定依存に着き、関数型に固有ではない。
  // 純粋性でも代数的データ型でも直接には出てこない。そこは分けて置く。
  c('higher-order-function', '高階関数', 'map と fold は、ループの型に名前を付けたもの。チャンク化の具体形', 'definition', 'cs', ['lambda-calculus'], ['chunking']),
  c('mutable-state-as-goto', '可変状態は goto である', 'Backus 1978。構造化が制御フローで消したものを、データフローで消す', 'viewpoint', 'cs', ['structured-programming', 'referential-transparency'], ['cognitive-load']),
  c('exhaustiveness-checking', '網羅性検査', '場合分けの漏れを機械が見る。直和型があって初めて成り立つ', 'technique', 'cs', ['algebraic-data-type', 'mechanized-checking'], ['feedback-delay']),
  c('illegal-states-unrepresentable', '不正な状態を作れなくする', 'bool 3 つで 8 通りではなく、あり得る 4 通りだけを直和で書く', 'viewpoint', 'cs', ['exhaustiveness-checking', 'type-soundness'], ['error-proneness']),
  c('purity-and-concurrency', '純粋性と並行性', '共有可変状態が無ければ、データ競合も無い。認知ではなく機械の側の理由', 'theorem', 'cs', ['immutability', 'interleaving']),
  // --- 名前の付いた設計論 ---------------------------------------------------------
  //
  // クリーンアーキテクチャ、SOLID、パッケージ原則。扱いは programs/01 の表に
  // 一行ずつ入っていたが、概念になっていなかったので索引に出ず、検索から来た
  // 読者に届いていなかった。
  //
  // 載せるのは定理に落ちる側だけ。経験則（Conway、DORA、Brooks の法則、
  // COCOMO、Lehman、Cynefin、Dreyfus）は本文の例に回す。
  //
  // 名前が三つあって中身が一つのことがある。同心円（Clean）、ポート＆アダプタ
  // （ヘキサゴナル）、オニオンは、どれも依存性逆転と安定依存の系で、
  // 層をいくつに分けろとは一つも言っていない。
  c('acyclic-dependency', '依存に閉路を作らない', '閉路の中は推移閉包で一塊になる。切るのではなく向きを反す', 'theorem', 'cs', ['change-propagation', 'dependency-inversion']),
  c('dependency-metrics', '依存を数で測る', '不安定度と抽象度。グラフの量であって、良さの量ではない', 'definition', 'cs', ['acyclic-dependency', 'stable-dependency']),
  c('concentric-layers', '同心円は層の数を言っていない', '同心円もポート＆アダプタもオニオンも、主張は依存の向き一つだけ', 'viewpoint', 'cs', ['dependency-inversion', 'stable-dependency']),
  c('behavioral-subtyping', '置き換えてよいとはどういうことか', '事前条件は弱め、事後条件は強める。Liskov。Hoare 論理の言葉で書ける', 'theorem', 'cs', ['hoare-logic', 'subtyping']),
  c('behavior-preserving-transformation', '振る舞いを変えない変換', 'リファクタリングの定義。外から区別できないことが条件', 'definition', 'cs', ['representation-independence', 'referential-transparency']),
  c('coverage-limit', 'カバレッジで示せることの限界', 'テストは存在を示すが不在を示さない。Rice の定理の系', 'theorem', 'cs', ['rice-theorem', 'checker-as-classifier']),
  c('universal-scalability', '足すほど遅くなる領域', 'Amdahl に整合の項を足すと、台数を増やして遅くなる領域が出る', 'theorem', 'cs', ['amdahl-law', 'cache-coherence']),
  c('bottleneck-only', 'ボトルネックだけが効く', '効いていない所を速くしても全体は変わらない。制約理論と Amdahl は同じ形', 'theorem', 'cs', ['binding-constraint', 'utilization-nonlinearity']),
  c('error-budget', '誤差予算', '落ちない設計ではなく、落ちてよい量を先に決める。残高として配る', 'technique', 'cs', ['prevent-vs-recover', 'probability-space']),
  c('modularity-as-option', 'モジュールは選択肢である', '分けておくと、あとで片方だけ差し替えられる。値はばらつきで上がる', 'viewpoint', 'cs', ['optionality', 'information-hiding']),
  c('dependency-matrix', '依存を行列で書く', '結合関係を行列にすると、並べ替えで塊と閉路が見える', 'technique', 'cs', ['coupling', 'change-propagation']),
  c('read-write-separation', '読みと書きを分ける', '導出できる状態は偶有的なので、読み用の形を別に持てる', 'viewpoint', 'cs', ['essential-state', 'serializability']),
  c('idempotence', '冪等性', '二度届いても一度と同じ。再送を安全にする条件', 'definition', 'cs', ['serializability', 'crash-consistency']),
  c('patterns-count-language-gaps', 'パターンの数は言語で変わる', '多重ディスパッチや第一級関数があると、要らなくなるものがある', 'viewpoint', 'cs', ['higher-order-function', 'algebraic-data-type']),
]
