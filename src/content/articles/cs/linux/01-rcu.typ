#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(
  title: "そのロックは、誰にも知らせない",
  date: "2026-08-21",
  field: "cs",
  series: "linux",
  order: 1,
  tags: ("Linux カーネル",),
  summary: "共有された表を読むのに、他の CPU へ一言も伝えない原語がある。書く側にはそれを締め出す手段が無く、消された要素はわざと次を指したまま残される。どこで安全が買われているかを追うと、ロックを外した代わりに正しさが二つの機構に割れていることが出てくる。",
  provides: (
    "read-copy-update",
    "quiescent-state",
    "grace-period",
    "guarantee-splitting",
    "optimistic-fallback",
  ),
)

= 展開しても、共有される語に何も書かない

`rcu_read_lock()` を展開する。`include/linux/rcupdate.h` から始めて、
非プリエンプトの構成では二段で底に着く。

```c
/* include/linux/rcupdate.h */
static inline void __rcu_read_lock(void)
{
	preempt_disable();
}

/* include/linux/preempt.h, CONFIG_PREEMPT_COUNT が無いとき */
#define preempt_disable()			barrier()

/* include/linux/compiler.h */
# define barrier() __asm__ __volatile__("": : :"memory")
```

いちばん下は空のアセンブリで、`"memory"` はコンパイラへの指示である。
#strong[機械語が一つも出ない。]

普通に配られている x86 のカーネルはプリエンプト可能なので、こちらではない。
そちらの実装は `kernel/rcu/tree_plugin.h` にある。

```c
static void rcu_preempt_read_enter(void)
{
	WRITE_ONCE(current->rcu_read_lock_nesting,
		   READ_ONCE(current->rcu_read_lock_nesting) + 1);
}
```

自分の `task_struct` の中の整数を $1$ 増やす。原子操作ではない。
バリアも張らない。#strong[他の CPU が読む語には、どちらの構成でも触らない。]

同じヘッダの、`rcu_read_lock()` の定義のすぐ下に、こう書いてある。

```c
/*
 * So where is rcu_write_lock()?  It does not exist, as there is no
 * way for writers to lock out RCU readers.  This is a feature, not
 * a bug -- this property is what provides RCU's performance benefits.
 */
```

書く側が読み手を締め出す手段は無い、と本人が書いている。

ここで自分の読み違いを疑うのが普通だと思う。
排他の原語が誰にも知らせず、締め出す側も存在しないなら、
名前のほうが嘘だということになる。#strong[読み違いではない。]
名前も嘘ではない。以下、どこで安全が買われているかを見る。

= 消す側が、消しきらない

先に、消す側のコードを見たほうが早い。
`include/linux/list.h` の普通の削除と、`include/linux/rculist.h` の削除を並べる。

```c
static inline void list_del(struct list_head *entry)
{
	__list_del_entry(entry);
	entry->next = LIST_POISON1;
	entry->prev = LIST_POISON2;
}

static inline void list_del_rcu(struct list_head *entry)
{
	__list_del_entry(entry);
	entry->prev = LIST_POISON2;
}
```

差は $1$ 行である。#strong[前を潰して、次を潰していない。]

書き忘れではない。`list_del_rcu` の直上のコメントが、
潰さないことのほうを説明している。

```
 * In particular, it means that we can not poison the forward
 * pointers that may still be used for walking the list.
```

つまり、消された要素は#strong[消された後も次を指したままにされている]。
リストから外れたのに、そこから先へ歩ける。

これで冒頭の半分が説明できる。
走っている読み手は、たまたま消される瞬間に消される要素の上に居ても、
そのまま最後まで歩き切れる。#strong[止める必要が無いように、消す側が形を変えている。]

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

安全でないのは、外した後の解放である。
外す前に `next` を読んだ読み手は、外された要素を指すポインタを持ったまま歩いている。

素直な答えは、読み手を数えることである。区間に入るとき増やし、出るとき減らし、
$0$ になったら解放する。

これが使えない理由は、性能の話に見えて、実は共有の話である。
`Documentation/filesystems/path-lookup.rst` に、そのままの言葉で書いてある。

```
Even when using locks that permit multiple concurrent readers, the
simple act of updating the count of the number of current readers can
impose an unwanted cost.  So the goal when reading a shared data
structure that no other process is changing is to avoid writing
anything to memory at all.  Take no locks, increment no counts, leave
no footprints.
```

数える対象が共有されているほど、数える行為そのものが詰まる。
`/usr/bin/ls` を開くだけで根の項目を通るので、
その $1$ 語を全 CPU が奪い合うことになる。#strong[いちばん読まれるものが、いちばん詰まる。]

そこで、聞くのをやめる。#strong[居るかを読み手に聞かず、居ないほうを外から言う。]

= 一度でも通れば足りる

#definition[
  ある CPU が読み取り区間の中に居ないことが確実な点を、静穏状態と呼ぶ。
  文脈切り替え、ユーザ空間での実行、idle がこれに当たる。
]<def:qs>

一行目が効くには、読み手の側に約束が要る。

#axiom[
  #strong[読み取り区間の中では眠らない。]
]<ax:no-sleep>

@ax:no-sleep を守る代わりに、読み手は前節の費用を免除されている。
そして記録の側は、驚くほど雑でよい。
`kernel/rcu/tree_plugin.h` の、非プリエンプト版の注釈である。

```
 * Note a quiescent state for PREEMPTION=n.  Because we do not need to know
 * how many quiescent states passed, just if there was at least one since
 * the start of the grace period, this just sets a flag.
```

#strong[何回通ったかは要らない。一度でも通ったかどうかだけでよい。]
だから記録は旗 $1$ 本で済む。

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

だから解放は、`synchronize_rcu()` で待ってから行うか、
`call_rcu()` に預けて後で呼ばせる。
#strong[読み手の費用は $0$ のまま、解放が安全になった。]

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

ここまでで、冒頭の異常は閉じた。ここから先が、この仕組みの本当の形である。

さきほどの `path-lookup.rst` は、名前の探索を
`rcu_read_lock()` を握ったまま行う方式について、こう続けている。

```
The particular guarantee it provides is that the key data structures -
dentries, inodes, super_blocks, and mounts - will not be freed while
the lock is held.  They might be unlinked or invalidated in one way or
another, but the memory will not be repurposed so values in various
fields will still be meaningful.  This is the only guarantee that RCU
provides; everything else is done using seqlocks.
```

ここまで読んで、これが「壊れたものを見せない仕組み」だと思っていたなら、
そこは直したほうがいい。#strong[言っているのは、番地が別の物に再利用されないことだけである。]
外されているかもしれない。無効になっているかもしれない。
中身は、読んでいる最中に変わりうる。

だから値の一貫性は、別の仕掛けで買う。
`fs/dcache.c` の探索関数は、名前からしてそう名乗っている。

```c
/**
 * __d_lookup_rcu - search for a dentry (racy, store-free)
 */
```

中では、名前を比べる前後で版番号を確かめて、ずれていたらやり直す。

```c
	/* we want a consistent (name,len) pair */
	if (read_seqcount_retry(&dentry->d_seq, seq)) {
		cpu_relax();
		goto seqretry;
	}
```

同じ注釈が、この確認を段ごとに噛み合わせることまで書いている。

```
 * Alternatively, __d_lookup_rcu may be called again to look up the child of
 * the returned dentry, so long as its parent's seqlock is checked after the
 * child is looked up. Thus, an interlocking stepping of sequence lock checks
 * is formed, giving integrity down the path walk.
```

#theorem[
  ロックを外すと、正しさは一つの機構では買えなくなる。
]<thm:split>

@thm:split の中身は、上の二つがそのまま示している。

#table(
  columns: (auto, auto, 1fr),
  [番地が生きていること], [猶予期間], [時間で買う。書く側が待つ],
  [値が一貫していること], [版番号の確認], [やり直しで買う。読む側が捨てて戻る],
)

一つのロックが与えていたのは、この二つを#strong[同時に]与えることだった。
外した瞬間に二つに割れ、別々の代償が付いた。

そして割ったぶん、失敗しうる経路が増える。
確認がずれ続けたら、あるいは眠る必要が出たら、そこで諦めることになる。

#definition[
  速い経路を試し、続けられないと分かった時点で、
  参照を数える確実な経路へ落ちる。落ちた後は戻らない。
]<def:fallback>

@def:fallback が、名前の探索の全体の形である。
同じ文書が、この方式を「足跡を残さずに軽く踊る」と書き、
つまずいたら止まる、と続けている。
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

代償を並べる。どれも、上で買ったものの裏側である。

#strong[眠れない（@ax:no-sleep）。]
眠れる版もある。`kernel/rcu/srcutree.c` の読み取り側は、こうなっている。

```c
int __srcu_read_lock(struct srcu_struct *ssp)
{
	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);

	this_cpu_inc(scp->srcu_locks.counter);
	smp_mb(); /* B */  /* Avoid leaking the critical section. */
	return __srcu_ptr_to_ctr(ssp, scp);
}
```

数えている。バリアも張っている。
#strong[眠る自由を買った瞬間に、読む側が払い始める]——
静穏状態をまたげるようになると、@thm:grace の証明が通らなくなるので、
居ないことを外から言えなくなり、結局は数えるしかない。

#strong[書く側が待つ。]猶予期間は全 CPU が一巡するまでなので、ミリ秒の桁になる。
待っている間、外した要素は解放されずに居座る。
読みが書きを大きく上回るところでしか釣り合わない。

#strong[書くのが難しい。]正しさが @thm:split で二つに割れたので、
片方だけ守った書き方が通ってしまう。
`Documentation/RCU/checklist.rst` という文書が木の中にあるのは、そのためである。

= 実物

引いた版は $7.2$（$2026$ 年 $8$ 月）である。

#table(
  columns: (auto, 1fr),
  [`include/linux/rcupdate.h`], [読み取り側の原語。`rcu_assign_pointer` と `rcu_dereference` もここ],
  [`include/linux/rculist.h`], [リスト操作。普通の `list.h` と並べて読むと差が出る],
  [`kernel/rcu/tree.c`], [猶予期間の本体。静穏状態を木で集める],
  [`kernel/rcu/tree_plugin.h`], [プリエンプト可否で分かれる実装],
  [`Documentation/filesystems/path-lookup.rst`], [使う側から見た説明。この回の引用の多くはここ],
)

読む順は、`rculist.h` を `list.h` と並べるところから始めるのがいい。
$1$ 行の差に、上の全部が乗っている。
