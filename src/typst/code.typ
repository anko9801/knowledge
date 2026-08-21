// コードの塊と、その出どころ。
//
// 引用元をコードの中にコメントとして書くと、二つ損をする。引用した本人が
// 足したコメントなのか、元のソースに在ったコメントなのか区別が付かなくなり、
// 貼り付けたときに嘘の行が混ざる。だから出どころは中ではなく縁に置く。
//
//   #code("include/linux/rcupdate.h")[```c
//   static inline void __rcu_read_lock(void) { preempt_disable(); }
//   ```]
//
// 出どころが無いもの（その場限りの例）は file を省く。枠だけが付く。
//   #code[```c ... ```]
//
// html target には構造だけを出し、見た目は global.css に任せる。
// 強調の色は Typst がインラインで焼き込むので、src/lib/code.ts が
// クラスへ移し替えている。

#let code(..args) = {
  let pos = args.pos()
  let (file, body) = if pos.len() == 2 {
    (pos.at(0), pos.at(1))
  } else if pos.len() == 1 {
    (none, pos.at(0))
  } else {
    panic("code は 本文 だけ、または (出どころ, 本文) を取ります")
  }

  context {
    if target() == "html" {
      html.elem("div", attrs: (class: "code"), {
        if file != none {
          html.elem("div", attrs: (class: "code-file"), raw(file))
        }
        body
      })
    } else {
      block(width: 100%, breakable: false, {
        if file != none {
          text(size: 8pt, fill: luma(100), raw(file))
          v(-0.5em)
        }
        body
      })
    }
  }
}
