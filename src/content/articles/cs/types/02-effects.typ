#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "作用を値にすると、合成の規則だけが残る",
  date: "2026-08-21",
  field: "cs",
  series: "types",
  order: 2,
  tags: ("型と計算",),
  summary: "入出力を入れると等式で推論できなくなる。作用を型に押し込むと救えるが、要求を書き下すと出てくるのは三つの法則だけである。それがモナドだった。そして積み重ねると壊れるので、分解する先まで追う。",
  provides: (
    "monad",
    "effect-typing",
    "referential-transparency",
    "monad-transformer",
    "algebraic-effects",
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

= 要求を書き下す

作用を型の中に押し込むことにする。
「$a$ を返すが、その過程で作用がある」を $T a$ と書く。

$upright("read") : T upright("String")$ とすれば、
$upright("read")$ そのものは#strong[ただの値]になる。読む「手順の記述」であって、
読む行為ではない。だから置き換えてよい。上の例の二つは、
#strong[違う記述]なので違って当たり前になる。

問題は、これを繋げるかどうかである。要求を三つ書き下す。

#definition[
  型構成子 $T$ が次を満たすことを要求する。

  #table(
    columns: (auto, 1fr),
    [作用の無い計算を作れる], [$upright("pure") : a arrow T a$],
    [結果を次へ渡せる], [$upright("bind") : T a arrow (a arrow T b) arrow T b$],
  )

  そして繋ぎ方が素直であること。
]<def:requirements>

「素直」を書き下すと、こうなる。

#definition[
  $upright("pure")$ と $upright("bind")$ が次の三つを満たすとき、$T$ を#strong[モナド]という。

  #table(
    columns: (auto, 1fr),
    [左単位], [$upright("bind") (upright("pure") space a) space f = f space a$],
    [右単位], [$upright("bind") space m space upright("pure") = m$],
    [結合], [$upright("bind") (upright("bind") space m space f) space g
              = upright("bind") space m space (lambda x. upright("bind") (f space x) space g)$],
  )
]<def:monad>

#strong[三つとも「余計なことをするな」と言っているだけ]である。
作用の無い計算を挟んでも何も起きない、が上二つ。
繋ぐ順のまとめ方を変えても結果が同じ、が三つ目。

#remark[
  三つ目が読みにくいのは、$upright("bind")$ が非対称な形をしているからである。
  繋ぐ操作を対称に書き直すと、見た目が変わる。
  $ (f >=> g) space x := upright("bind") (f space x) space g $
  として $a arrow T b$ の形の関数どうしを繋ぐことにすると、三つの法則は
  $ upright("pure") >=> f = f, quad
    f >=> upright("pure") = f, quad
    (f >=> g) >=> h = f >=> (g >=> h) $
  になる。#strong[単位元があって、結合的である。]それだけである。
]

#strong[モナドの定義は、要求から出てくる。]
「作用を値にして、繋げるようにしたい」と言った時点で、
残る自由度が単位元と結合律しか無い。

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
