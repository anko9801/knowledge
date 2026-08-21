#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *
#import "/src/typst/code.typ": code

#show: post.with(
  title: "そのロックは、誰にも知らせない",
  date: "2026-08-21",
  field: "cs",
  series: "linux",
  order: 1,
  tags: ("Linux カーネル",),
  summary: "共有された表を読むのに、他の CPU へ一言も伝えない原語があります。書く側にはそれを締め出す手段が無く、消された要素はわざと次を指したまま残される。どこで安全が買われているのかを追っていくと、最後に排他そのものの居場所が変わります。",
  provides: (
    "read-copy-update",
    "quiescent-state",
    "grace-period",
    "guarantee-splitting",
    "optimistic-fallback",
  ),
)

= 展開しても、共有される語に何も書かない

`rcu_read_lock()` を、実際に展開してみましょう。
非プリエンプトの構成なら、三段で底に着きます。

#code("include/linux/rcupdate.h")[```c
static inline void __rcu_read_lock(void)
{
	preempt_disable();
}
```]

#code("include/linux/preempt.h — CONFIG_PREEMPT_COUNT が無いとき")[```c
#define preempt_disable()			barrier()
```]

#code("include/linux/compiler.h")[```c
# define barrier() __asm__ __volatile__("": : :"memory")
```]

いちばん下は空のアセンブリで、`"memory"` はコンパイラへの指示です。
つまり#strong[機械語が一つも出ません]。排他の原語が、です。

普通に配られている x86 のカーネルはプリエンプト可能なので、こちらではありません。
そちらの実装も見ておきましょう。

#code("kernel/rcu/tree_plugin.h")[```c
static void rcu_preempt_read_enter(void)
{
	WRITE_ONCE(current->rcu_read_lock_nesting,
		   READ_ONCE(current->rcu_read_lock_nesting) + 1);
}
```]

自分の `task_struct` の中の整数を $1$ 増やすだけ。原子操作でもバリアでもありません。
どちらの構成にも共通しているのは、#strong[他の CPU が読む語には一切触らない]ということです。

では書く側が読み手を止めているのかというと、これも違います。
同じヘッダの、`rcu_read_lock()` の定義のすぐ下にこう書いてあります。

#code("include/linux/rcupdate.h")[```c
/*
 * So where is rcu_write_lock()?  It does not exist, as there is no
 * way for writers to lock out RCU readers.  This is a feature, not
 * a bug -- this property is what provides RCU's performance benefits.
 */
```]

締め出す手段は無い、しかもそれは仕様であって欠陥ではない、と本人が書いています。

ここで自分の読み違いを疑うのが、まっとうな反応だと思います。
誰にも知らせない排他があって、締め出す側も存在しないなら、
名前のほうが嘘だということになりますから。

#strong[読み違いではありません。]名前も嘘ではありません。
以下、この安全がどこで買われているのかを見ていきます。

= 消す側が、消しきらない

読む側ばかり見ていても出てきません。先に、消す側を見たほうが早いです。
普通の削除と、こちらの削除を並べてみましょう。

#code("include/linux/list.h")[```c
static inline void list_del(struct list_head *entry)
{
	__list_del_entry(entry);
	entry->next = LIST_POISON1;
	entry->prev = LIST_POISON2;
}
```]

#code("include/linux/rculist.h")[```c
static inline void list_del_rcu(struct list_head *entry)
{
	__list_del_entry(entry);
	entry->prev = LIST_POISON2;
}
```]

差は $1$ 行です。#strong[前を潰して、次を潰していない。]

書き忘れだと思いたくなりますが、違います。
`list_del_rcu` の直上のコメントが、潰さない理由のほうを説明しているからです。

#code("include/linux/rculist.h")[```
 * In particular, it means that we can not poison the forward
 * pointers that may still be used for walking the list.
```]

消された要素は、#strong[消された後も次を指したままにされている]。
リストから外れているのに、そこから先へ歩ける。行儀の悪い話に見えますが、
これがあるおかげで、消される瞬間にたまたまその要素の上に居た読み手も、
何事もなかったように出口まで歩き切れます。

#strong[止める必要が無いように、消す側のほうが形を変えている。]
順序が逆なのです。

#proposition[
  外す操作は、読む側の排他を要求しない。
]<prop:removal>

#proof[
  外す操作が書き換えるのは前の要素の `next` で、これは 1 語である。
  語の書き込みは分割されないので、読み手が得るのは古い値か新しい値のどちらかになる。

  古い値を得た読み手は外れる前の並びを、新しい値を得た読み手は外れた後の並びを歩く。
  外された要素に入ってしまった読み手も、`next` が残されているので出口へ抜ける。
]

= 残るのは、いつ捨てるかだけ

これで危ないところが一つに絞れました。外した後の解放です。
外す前に `next` を読んだ読み手は、外された要素を指すポインタを持ったまま歩いています。

素直な答えは、読み手を数えることでしょう。
区間に入るとき増やし、出るとき減らし、$0$ になったら解放する。
誰でも最初に思いつきますし、そう書かれた実装も山ほどあります。

これが使えない理由は、一見すると性能の話に見えて、実は共有の話です。
木の中の文書に、そのままの言葉で書いてあります。

#code("Documentation/filesystems/path-lookup.rst")[```
Even when using locks that permit multiple concurrent readers, the
simple act of updating the count of the number of current readers can
impose an unwanted cost.  So the goal when reading a shared data
structure that no other process is changing is to avoid writing
anything to memory at all.  Take no locks, increment no counts, leave
no footprints.
```]

数える対象が共有されているほど、数える行為そのものが詰まります。
`/usr/bin/ls` を開くだけで根の項目を通りますから、その $1$ 語を全 CPU が奪い合う。
#strong[いちばん読まれるものが、いちばん詰まる。]よくできた罰です。

そこで、聞くのをやめます。
#strong[居るかどうかを読み手に聞かず、居ないほうを外から言う。]

= 一度でも通れば足りる

#definition[
  ある CPU が読み取り区間の中に居ないことが確実な点を、静穏状態と呼ぶ。
  文脈切り替え、ユーザ空間での実行、idle がこれに当たる。
]<def:qs>

一行目が効くには、読み手の側に約束が要ります。

#axiom[
  #strong[読み取り区間の中では眠らない。]
]<ax:no-sleep>

@ax:no-sleep を守る代わりに、読み手は前節の費用を免除されている。
そういう取引です。

そして記録の側は、拍子抜けするほど雑で構いません。非プリエンプト版の注釈です。

#code("kernel/rcu/tree_plugin.h")[```
 * Note a quiescent state for PREEMPTION=n.  Because we do not need to know
 * how many quiescent states passed, just if there was at least one since
 * the start of the grace period, this just sets a flag.
```]

#strong[何回通ったかは要らない。一度でも通ったかどうかだけでよい。]
だから記録は旗 $1$ 本で済みます。
合意のような重たい話を身構えていた方には、申し訳ないくらいの安さです。

#definition[
  外した時点より後に、すべての CPU がそれぞれ一度以上静穏状態を通ること。
  これを猶予期間と呼ぶ。
]<def:grace>

#theorem[
  猶予期間が過ぎたなら、外した要素を指す読み手は存在しない。
]<thm:grace>

#proof[
  読み手が要素への参照を得られるのは、読み取り区間の中だけである。

  外す前に始まった区間は、@ax:no-sleep より静穏状態をまたげない。
  その CPU が静穏状態を通った時点で、その区間はすでに終わっている。
  すべての CPU について通ったので、外す前に始まった区間はすべて終わった。

  外した後に始まった区間は、差し替え済みの `next` から歩き始めるので、
  外した要素に到達しない（@prop:removal）。

  どちらでもない区間は無い。
]

#example[三つの CPU で、いつ待ち終わるか][
  時刻を左から右へ取る。$R$ は読み取り区間、$Q$ は静穏状態を通った点とする。

  #table(
    columns: (auto, 1fr),
    [CPU 0], [外す前から $R$ が続いている。少し後に抜けて $Q$],
    [CPU 1], [外した直後に $Q$。その後で $R$ に入る],
    [CPU 2], [ずっと idle。#strong[常に $Q$ である]],
  )

  猶予期間が閉じるのは、#strong[三つとも $Q$ を通った時点]である。
  ここでは CPU 0 が最後になる。

  待たされているのは CPU 0 の区間だけで、CPU 1 が後から始めた $R$ は
  @prop:removal より外した要素に届かないので、待つ必要がない。
  CPU 2 は何もしていないのに条件を満たしている。

  #strong[何も走っていない CPU が、待ち時間を延ばさない]のが効いている。
  もし「全 CPU が新しく $R$ を一度通る」を条件にしていたら、
  idle の CPU が永遠に終わらせない。
]

あとは、解放を `synchronize_rcu()` で待ってから行うか、`call_rcu()` に預けて後で呼ばせるだけ。
#strong[読み手の費用は $0$ のまま、解放が安全になりました。]

#check[
  読む側が共有される語に何も書かないなら、
  書く側は「もう読み手がいない」をどうやって判断しているか。
][
  #strong[判断していない。]

  読み手を一人も見ていない。見ているのは CPU の側で、
  全 CPU がそれぞれ一度ずつ静穏状態（@def:qs）を通ったかどうかだけである。

  読み手が居たかどうかは、最後まで分からないままである。
  分からなくても @thm:grace が成り立つのは、
  @ax:no-sleep が「区間は静穏状態をまたげない」を保証しているからで、
  #strong[存在の否定を、通過の観測に置き換えている]。
]

= 保証されているのは、番地だけ

ここまでで、冒頭の異常は閉じました。ここから先が、この仕組みの本当の形です。

さきほどの文書は、名前の探索を `rcu_read_lock()` を握ったまま行う方式について、
こう続けています。

#code("Documentation/filesystems/path-lookup.rst")[```
The particular guarantee it provides is that the key data structures -
dentries, inodes, super_blocks, and mounts - will not be freed while
the lock is held.  They might be unlinked or invalidated in one way or
another, but the memory will not be repurposed so values in various
fields will still be meaningful.  This is the only guarantee that RCU
provides; everything else is done using seqlocks.
```]

ここまで読んで、これを「壊れたものを見せない仕組み」だと思っていたなら、
そこは直したほうがいいです。言っているのは、
#strong[番地が別の物に再利用されない]ことだけですから。
外されているかもしれない。無効になっているかもしれない。
中身は、読んでいる最中に変わりうる。

さんざん見てきた猶予期間が守っていたのは、値の正しさではなかったわけです。
では値の一貫性はどこで買っているのか。探索関数が、名前からしてそう名乗っています。

#code("fs/dcache.c")[```c
/**
 * __d_lookup_rcu - search for a dentry (racy, store-free)
 */
```]

中では、名前を比べる前後で版番号を確かめて、ずれていたらやり直します。

#code("fs/dcache.c")[```c
	/* we want a consistent (name,len) pair */
	if (read_seqcount_retry(&dentry->d_seq, seq)) {
		cpu_relax();
		goto seqretry;
	}
```]

同じ注釈が、この確認を段ごとに噛み合わせることまで書いています。

#code("fs/dcache.c")[```
 * Alternatively, __d_lookup_rcu may be called again to look up the child of
 * the returned dentry, so long as its parent's seqlock is checked after the
 * child is looked up. Thus, an interlocking stepping of sequence lock checks
 * is formed, giving integrity down the path walk.
```]

#theorem[
  ロックを外すと、正しさは一つの機構では買えなくなる。
]<thm:split>

@thm:split の中身は、上の二つがそのまま示しています。

#table(
  columns: (auto, auto, 1fr),
  [番地が生きていること], [猶予期間], [時間で買う。書く側が待つ],
  [値が一貫していること], [版番号の確認], [やり直しで買う。読む側が捨てて戻る],
)

一つのロックが与えていたのは、この二つを#strong[同時に]与えることでした。
外した瞬間に二つに割れて、別々の代償が付いたわけです。

そして割ったぶん、失敗しうる経路が増えます。
確認がずれ続けたら、あるいは眠る必要が出たら、そこで諦めることになる。

#definition[
  速い経路を試し、続けられないと分かった時点で、
  参照を数える確実な経路へ落ちる。落ちた後は戻らない。
]<def:fallback>

@def:fallback が、名前の探索の全体の形です。
同じ文書はこの方式を「足跡を残さずに軽く踊る」と書き、つまずいたら止まる、と続けています。
`filename_lookup()` は `LOOKUP_RCU` を立てて一度呼び、
`ECHILD` が返ったら旗を落としてもう一度呼ぶ。

#remark[
  落ち先が用意できない場面では、この方式は使えない。
  @thm:split で割れた片方が失敗したとき、
  #strong[戻る場所が無いと、失敗をどこにも渡せない]からである。

  費用が $0$ の同期は、その意味で無料ではない。
  #strong[遅くて確実な実装を、別に持っていることが前提になっている。]
]

= 何と交換したか

代償を並べます。どれも、上で買ったものの裏側です。

#strong[眠れない（@ax:no-sleep）。]
眠れる版もあります。その読み取り側を見てみましょう。

#code("kernel/rcu/srcutree.c")[```c
int __srcu_read_lock(struct srcu_struct *ssp)
{
	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);

	this_cpu_inc(scp->srcu_locks.counter);
	smp_mb(); /* B */  /* Avoid leaking the critical section. */
	return __srcu_ptr_to_ctr(ssp, scp);
}
```]

数えています。バリアも張っています。
#strong[眠る自由を買った瞬間に、読む側が払い始める]わけです。
静穏状態をまたげるようになると @thm:grace の証明が通らなくなるので、
居ないことを外から言えなくなり、結局は数えるしかない。請求書はちゃんと来ます。

#strong[書く側が待つ。]猶予期間は全 CPU が一巡するまでなので、ミリ秒の桁になります。
待っている間、外した要素は解放されずに居座る。
読みが書きを大きく上回るところでしか釣り合いません。

#strong[書くのが難しい。]正しさが @thm:split で二つに割れたので、
片方だけ守った書き方が通ってしまいます。
`Documentation/RCU/checklist.rst` という文書が木の中にあるのは、そのためです。

= 排他は、どこへ行ったのか

最後に、冒頭の言い方を一つ直させてください。

「排他していないのに正しい」と読めるように書いてきましたが、正確ではありません。
排他はしています。ただし、排他されているのは読み手ではない。#strong[解放のほうです。]

読み手どうしは、元から排他が要りません。書き手どうしは普通のロックで排他します——
`rcu_read_lock()` の下のコメントが「書き手が互いをどう避けるかに RCU は関知しない、
ただし避けること」とわざわざ書き添えているのは、そういう意味です。
残ったのは読み手と解放の間だけで、そこをロックではなく#strong[時間]で分けた。
それがこの仕組みの全体です。

@ax:no-sleep が読み手に課した約束は、その時間を測るための目盛りでした。
守られていれば @thm:grace が成り立ち、破られた瞬間に全部が崩れます。

費用が $0$ の同期というのは、結局のところ
#strong[払う側を読み手から書き手へ、空間から時間へ移した]という話でしかありません。
消えてはいないのです。

= 実物

引いた版は $7.2$（$2026$ 年 $8$ 月）です。

#table(
  columns: (auto, 1fr),
  [`include/linux/rcupdate.h`], [読み取り側の原語。`rcu_assign_pointer` と `rcu_dereference` もここ],
  [`include/linux/rculist.h`], [リスト操作。普通の `list.h` と並べて読むと差が出る],
  [`kernel/rcu/tree.c`], [猶予期間の本体。静穏状態を木で集める],
  [`kernel/rcu/tree_plugin.h`], [プリエンプト可否で分かれる実装],
  [`Documentation/filesystems/path-lookup.rst`], [使う側から見た説明。この回の引用の多くはここ],
)

読む順は、`rculist.h` を `list.h` と並べるところから始めるのがいいです。
$1$ 行の差に、上の全部が乗っています。
