#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "作用を値にすると、合成の規則だけが残る",
  date: "2026-08-21",
  field: "cs",
  series: "types",
  order: 2,
  tags: ("型と計算",),
  summary: "なぜモナドなのか。関数はいくらでもあるのに、この形が選ばれる理由がある。繋げてほしいとしか要求していないのに、書き下すと圏の定義になって自由度が残らない。そして弱い構造との差は、前の結果で次の作用が変わるかどうかだった。",
  provides: (
    "monad",
    "effect-typing",
    "referential-transparency",
    "monad-transformer",
    "algebraic-effects",
    "applicative-vs-monad",
  ),
)

= 入出力が、置き換えを壊す

#link("/cs/types/1")[前回]、簡約の順序を変えても行き着く先が変わらないことを見た。
だから式を値で置き換えてよい。

入出力を入れると、これが壊れる。

#example[同じ式が、違う値になる][
  端末から一行読む式を $upright("read")$ と書く。
  $ upright("let") space x = upright("read") space upright("in") space (x, x)
    quad "と" quad (upright("read"), upright("read")) $

  置き換えてよいなら、この二つは同じはずである。同じではない。
  左は一行読んで二回使い、右は#strong[二行読む]。
]

#definition[
  式をその値で置き換えてもプログラムの意味が変わらないとき、
  その式は#strong[参照透過]であるという。
]<def:transparent>

上の $upright("read")$ は参照透過でない。
そして#strong[置き換えができないと、前回の道具が全部使えなくなる]。
等式で推論できず、実装を差し替えても区別できないという保証も効かない。

だが入出力の無いプログラムには用がない。#strong[どうにかして両立させたい。]

= 繋ぎたい、しか要求していない

作用を型の中に押し込むことにする。
「$a$ を返すが、その過程で作用がある」を $T a$ と書く。

$upright("read") : T upright("String")$ とすれば、
$upright("read")$ そのものは#strong[ただの値]になる。読む「手順の記述」であって、
読む行為ではない。だから置き換えてよい。上の例の二つは、
#strong[違う記述]なので違って当たり前になる。

さて、要求は#strong[一つしかない]。

純粋な関数 $a arrow b$ は合成できる。だからプログラムが書ける。
作用が入ると関数は $a arrow T b$ の形になる。
#strong[この形どうしが繋がらなければ、一段しか書けない。]

#definition[
  次の二つを要求する。

  #table(
    columns: (auto, 1fr),
    [繋げる], [$f : a arrow T b$ と $g : b arrow T c$ から $f >=> g : a arrow T c$],
    [何もしない繋ぎ手がある], [$upright("pure") : a arrow T a$],
  )

  そして繋ぎ方が結合的で、$upright("pure")$ が単位元であること。
]<def:requirements>

#theorem[
  @def:requirements は、#strong[$a arrow T b$ の形の関数が圏をなす]と言っているのと同じである。
  したがって、要求から残る自由度は#strong[単位元と結合律の二つだけ]である。
]<thm:kleisli>

#proof[
  対象を型、$a$ から $b$ への射を $a arrow T b$ の形の関数とする。
  合成が $>=>$、恒等射が $upright("pure")$ である。
  圏の公理は結合律と単位律だけなので、@def:requirements とそのまま一致する。
]

#strong[ここが答えである。]
なぜこの構造なのかと言えば、#strong[繋げてほしいとしか言っていない]からである。
繋がることと、何もしない繋ぎ手があること。それを書き下すと圏の定義になり、
圏の公理は二つしかない。#strong[選ぶ余地が残っていない。]

#definition[
  この $>=>$ と $upright("pure")$ を持つ $T$ を#strong[モナド]という。

  実装では、次の形に持ち替えることが多い。
  $ upright("bind") : T a arrow (a arrow T b) arrow T b $
  $>=>$ とは相互に定義できるので、同じものである。
]<def:monad>

#remark[
  法則を $upright("bind")$ の形で書くと読みにくい。
  $ upright("bind") (upright("bind") space m space f) space g
    = upright("bind") space m space (lambda x. upright("bind") (f space x) space g) $
  これが結合律である。$>=>$ で書けば
  $ (f >=> g) >=> h = f >=> (g >=> h) $
  になる。#strong[非対称な形にしたせいで読みにくくなっているだけ]で、
  中身は結合律そのものである。
]

= もっと弱いものでは、なぜ足りないか

繋げればよいなら、もっと弱い構造でもよさそうに見える。
実際、弱いものが二つあって、どちらも使われている。並べると位置が分かる。

#table(
  columns: (auto, auto, 1fr),
  [], [持っている操作], [何ができるか],
  [関手], [$(a arrow b) arrow T a arrow T b$], [作用のある値に、純粋な関数を当てる],
  [適用可能関手], [$T (a arrow b) arrow T a arrow T b$], [作用を並べて、結果をまとめる],
  [モナド], [$a arrow T b$ を繋ぐ], [#strong[前の結果を見て、次に何をするか決める]],
)

#proposition[
  関手では、作用を二つ繋げない。
]<prop:functor-weak>

#proof[
  持っているのは $(a arrow b) arrow T a arrow T b$ だけである。
  $a arrow T b$ を当てると $T (T b)$ になり、
  #strong[外側の $T$ を潰す手立てが無い]。
]

#proposition[
  適用可能関手では、#strong[後の作用が前の結果に依存できない]。
]<prop:applicative-weak>

#proof[
  $T (a arrow b) arrow T a arrow T b$ の左側は $T (a arrow b)$ である。
  関数は $T$ の#strong[中]にあるが、返す型は $b$ であって $T b$ ではない。

  つまり#strong[関数は新しい作用を作れない]。
  作用は左右にあらかじめ置かれた分だけで、
  どちらの中身にも依存せずに決まっている。
]

#example[分岐が書けるかどうか][
  一行読んで、内容が `"y"` なら書き込み、そうでなければ何もしない。

  モナドなら書ける。$upright("read")$ の結果を受けた関数が、
  #strong[$T$ を返す]ので、そこで別の作用を選べる。

  適用可能関手では書けない。書き込む作用も、何もしない作用も、
  #strong[読む前に両方置いておくしかない]。
  条件で選ぶには、結果を見てから作用を決める必要がある。
]

#strong[これが「なぜモナドか」の答えである。]
繋げるだけなら弱い構造で足りる。
#strong[前の結果によって次の作用が変わる]ものを書きたければ、
返す型に $T$ が入っている必要があり、その時点で @def:requirements になる。

= 弱い方が良いこともある

@prop:applicative-weak は弱点に見えるが、#strong[裏返すと情報である]。

#proposition[
  適用可能関手で書かれた計算は、#strong[実行前に作用の形が分かる]。
]<prop:static-shape>

#proof[
  @prop:applicative-weak より、どの作用が起きるかは中身に依存しない。
  よって実行せずに読み取れる。
]

#corollary[
  独立した作用を#strong[まとめて実行できる]。
  問い合わせを束ねる、並べて走らせる、事前に解析する、といったことが可能になる。
]<cor:batch>

モナドではこれができない。
#strong[二つ目の要求は、一つ目の結果が返るまで分からない]からである。

#check[
  作用を扱うとき、いつモナドを使い、いつ適用可能関手で止めるべきか。
][
  #strong[依存が要るかどうかで決まる。]

  前の結果を見て次の作用を選ぶ必要があるなら、モナドしかない。
  @prop:applicative-weak より、弱い方では書けない。

  依存が要らないなら、弱い方を選ぶ。
  @cor:batch の恩恵が付いてくるからで、
  #strong[できることを減らすと、機械にできることが増える]。

  これは#link("/cs/programs/1")[プログラムの構成]の言い方でいえば、
  書ける範囲と機械が使える情報の取引である。
  強い構造を既定にすると、この取引が常に一方に倒れる。
]

= 何が表せるか

同じ形で、まったく違うものが書ける。

#table(
  columns: (auto, auto, 1fr),
  [$T a$], [作用], [$upright("bind")$ が何をするか],
  [$a + 1$], [失敗], [失敗していたら後続を飛ばす],
  [$a + e$], [誤りの理由], [理由を持ったまま飛ばす],
  [$upright("List") space a$], [複数の結果], [各結果に後続を当てて連結する],
  [$s arrow (a times s)$], [状態], [状態を通す],
  [$r arrow a$], [共有の設定], [同じ設定を配る],
)

#example[繋ぐ形が同じになる][
  失敗するかもしれない割り算を繋ぐ。
  $ upright("bind") (upright("div") space 100 space 2) space
    (lambda y. upright("div") space y space 5) $
  途中で失敗すれば後続は動かず、全体が失敗になる。

  同じ形で状態も書ける。読む・書く・読む・書く、を並べると、
  $upright("bind")$ が状態を裏で通してくれる。#strong[書く側は状態を持ち回らない。]
]

#remark[
  入れ子が深くなるので、糖衣構文が用意される。
  $ upright("do") space { x arrow.l m; space f space x } $
  は $upright("bind") space m space (lambda x. f space x)$ に戻る。

  #strong[代入に見えるが、代入ではない。]前の結果を次の関数の引数に入れている。
  戻して読むと、逐次に見えていたものが入れ子だったと分かる。
]

= 積み重ねると壊れる

ここまでは一つの作用の話だった。#strong[二つ要ると詰まる。]

#proposition[
  モナドは一般には合成できない。
  $T$ と $S$ がモナドでも、$T compose S$ がモナドになるとは限らない。
]<prop:no-compose>

#proof[
  $upright("bind")$ を作るには $T (S (T (S space a)))$ を $T (S space a)$ に潰す必要がある。
  内側の $S$ と外側の $T$ を入れ替える手立てが無いと、この潰し方が書けない。
  一般の $T$、$S$ にそんな手立ては無い。
]

対策として、片方をもう片方の上に載せる仕掛けを作る。
状態を任意のモナドの上に載せる版、誤りを載せる版、といった具合である。

#strong[これが数で効いてくる。]

#proposition[
  $N$ 種類の作用を任意の順で積めるようにするには、
  組み合わせごとの受け渡しが要るので、実装の数が $N$ に対して二乗で増える。
]<prop:n-squared>

さらに、積んだ段の下の方を触るには#strong[持ち上げる操作を何段も書く]ことになり、
段の深さがそのまま呼び出しの深さになる。

#remark[
  ここで#link("/cs/programs/1")[プログラムの構成]の言い方が効く。
  作用を型に押し込んだ時点で、費用は消えていない。
  #strong[実行時の混乱を、記述の複雑さへ移した]だけである。

  移した先が耐えられる大きさかどうかが、モナドで書くかの判断になる。
  作用が一つなら安く、増えると @prop:n-squared で高くつく。
]

= 分解する

@prop:n-squared の原因は、#strong[作用の記述と解釈が一体になっている]ことである。
$upright("bind")$ が「何をするか」と「どう実行するか」を同時に決めている。

分ける。

#definition[
  作用を#strong[操作の名前]の集まりとして宣言する。
  何をするかは書かず、$upright("get")$、$upright("put")$、$upright("read")$ のように名前と型だけ置く。

  プログラムは、使う操作の集まりを型に持つ。
  実行時に、その操作をどう解釈するかを与える#strong[ハンドラ]を外から当てる。
]<def:algebraic-effects>

操作を呼ぶと、#strong[そこで計算が中断してハンドラへ飛ぶ]。
ハンドラは残りの計算を受け取り、再開するかどうかを決める。

#strong[再開できる例外だと思えばよい。]
一度も再開しなければ普通の例外、一度再開すれば普通の関数呼び出し、
複数回再開すれば非決定計算になる。

#example[同じ仕掛けで、別の言語機能が出る][
  #table(
    columns: (auto, 1fr),
    [再開しない], [例外],
    [$1$ 回再開], [状態、入出力、共有設定],
    [複数回再開], [非決定計算、生成器],
    [後で再開], [非同期、軽量スレッド],
  )

  どれも @def:algebraic-effects の使い方の違いでしかない。
]

#proposition[
  作用の集まりは#strong[和で足せる]ので、@prop:n-squared が消える。
]<prop:no-n-squared>

#proof[
  積み重ねではなく、使う操作の名前の集まりを合併するだけである。
  合併は順序に依らないので、組み合わせごとの受け渡しが要らない。
  ハンドラは操作ごとに一つ書けば済み、$N$ 個で足りる。
]

#check[
  作用をモナドで扱う場合と、操作とハンドラに分ける場合を、
  #link("/cs/programs/1")[プログラムの構成]の言葉で比べよ。
][
  #strong[どちらも移し替えで、移し先が違う。]

  モナドは、実行時の作用を#strong[型の形]へ移す。
  作用が一つなら安いが、増えると @prop:n-squared で記述が膨らむ。

  分ける方は、作用を#strong[名前]へ移し、解釈をハンドラへ移す。
  足し算で済むので数には強いが、
  #strong[中断と再開を扱える処理系]が要る。土台の側に費用を移している。

  一つの作用しか要らない場所でハンドラの仕組みを持ち込むのは、
  払わなくてよい代金を払っていることになる。
]

= 導けなかったもの

#table(
  columns: (auto, 1fr),
  [どの作用を型に出すか], [@def:requirements は繋ぎ方を決めるだけ],
  [段の順番], [積む順で意味が変わる場合がある。法則からは決まらない],
  [ハンドラの費用], [中断と再開の実装に依る。処理系の話],
)

そして#strong[「モナドは自己関手の圏におけるモノイド対象である」は、
ここまでの説明になっていない]。
あれは @def:monad を別の言葉で言い直したもので、
なぜその形なのかは答えていない。

言い直しに意味が出るのは、#strong[同じ形が他所にも現れる]と分かったときである。
型と論理と圏が同じものだ、という対応がそれで、次の回で扱う。
