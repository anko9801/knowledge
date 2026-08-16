#import "/src/typst/template.typ": post
#import "/src/typst/theorem.typ": *

#show: post.with(title: "probe", date: "2026-08-17", tags: ("集合論",))

= 節

#definition[集合とは $x$ である。]

#theorem("Cantor")[
  任意の集合 $A$ に対し $A prec cal(P)(A)$。
]<thm:cantor>

#proof[
  対角線論法による。$f: A -> cal(P)(A)$ を任意に取る。
]

#thmref(<thm:cantor>, kind: "theorem") より従う。
