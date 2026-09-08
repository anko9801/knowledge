import type { Concept } from './types.ts'
import { c } from './types.ts'

export const topology: readonly Concept[] = [
  // --- 位相 --------------------------------------------------------------
  //
  // 点集合位相だけだったところに、**代数トポロジーの土台**を足した。
  // `simply-connected` が在るのに `fundamental-group` が無い、という
  // 状態が続いていた ── 「単連結」は基本群が自明であることなのに、
  // その群が定義されていなかった。
  //
  // 軸は**「連続な情報を、離散な情報に落とす」**。
  // 連続変形で変わらないものだけを残すと、群が出る。
  // 群になったところで、代数の道具が全部使えるようになる。
  //
  // ここは低次元トポロジーの前提でもある。
  c('topology-basics', '位相の基礎', '開集合、連続、コンパクト、連結', 'definition', 'math'),
  c('homotopy', 'ホモトピー', '連続変形で移り合うこと。可縮性', 'definition', 'math', ['topology-basics', 'connectedness']),
  c('separation-axioms', '分離公理', 'Hausdorff、正則、正規。点をどこまで区別できるか', 'definition', 'math', ['topology-basics']),
  c('second-countable', '第二可算', '可算な基底を持つ。多様体の定義に入る', 'definition', 'math', ['topology-basics']),
  c('connectedness', '連結性', '二つの開集合に分けられない。弧状連結との差', 'definition', 'math', ['topology-basics']),
  c('simply-connected', '単連結', 'どの閉曲線も一点に縮められる。「穴が無い」を、穴を定義せずに言う', 'definition', 'math', ['homotopy']),

  // 基本群 ── 連続を離散に落とす
  c('fundamental-group', '基本群', '基点を通る閉曲線を、ホモトピーで同一視する。**繋ぐ操作が積になるので、群になる**', 'definition', 'math', ['homotopy', 'group']),
  c('simply-connected-means-trivial', '単連結とは、基本群が自明なことである', '**既に置いてあった「穴が無い」に、はじめて定義が付く。**穴の個数が群の大きさとして数えられる', 'theorem', 'math', ['fundamental-group', 'simply-connected']),
  c('basepoint-does-not-matter', '弧状連結なら、基点の取り方に依らない', '同型が基点を結ぶ道で決まる。**道の取り方には依るので、同型は自然ではない**', 'theorem', 'math', ['fundamental-group']),
  c('functoriality', '連続写像が、群の準同型を誘導する', '**位相の問題が代数の問題に翻訳される。**この対応が関手であることが、以降の全部を支える', 'theorem', 'math', ['fundamental-group', 'functor']),
  c('no-retraction-from-disk', '円板は円周へ retract できない', '**あれば群の準同型が矛盾する。**位相の主張が、群の計算一行で片付く', 'theorem', 'math', ['functoriality']),
  c('brouwer-from-fundamental-group', 'Brouwer の不動点定理が、そこから出る', '不動点が無いとすると retraction が作れてしまう。**2 次元の場合が、これで完全に証明できる**', 'theorem', 'math', ['no-retraction-from-disk', 'brouwer-fixed-point']),
  c('van-kampen', 'van Kampen の定理', '空間を二つに切って貼ると、基本群が融合積になる。**計算する道具**', 'theorem', 'math', ['fundamental-group', 'quotient-group']),
  c('every-group-is-a-fundamental-group', 'どんな群も、ある空間の基本群になる', '**制限が一つも無い。**だから「基本群で分類する」は、群の分類と同じだけ難しい', 'theorem', 'math', ['van-kampen']),
  c('higher-homotopy-is-abelian', '2 次以上のホモトピー群は可換になる', '**Eckmann–Hilton。**二通りの積が両立すると、可換で一致するしかない', 'theorem', 'math', ['fundamental-group', 'abelian-group']),
  c('higher-homotopy-is-hard', '可換なのに、計算が難しい', '**球面のホモトピー群すら分かっていない。**単純な空間の単純な不変量が、手に負えない', 'viewpoint', 'math', ['higher-homotopy-is-abelian']),

  // 被覆空間 ── 群と空間の対応
  c('covering-space', '被覆空間', '局所的には同じに見えるが、大域では何枚も重なっている', 'definition', 'math', ['fundamental-group']),
  c('path-lifting', '道は一意に持ち上がる', '**始点を決めれば、上での道が一つに決まる。**閉曲線が閉じるとは限らない', 'theorem', 'math', ['covering-space']),
  c('covering-correspondence', '被覆と部分群が一対一に対応する', '**Galois 対応とまったく同じ形。**普遍被覆が最大の拡大、被覆変換群が Galois 群にあたる', 'theorem', 'math', ['path-lifting', 'galois-correspondence']),
  c('universal-cover', '普遍被覆', '単連結な被覆。**一つに決まり、他の全部がそこから商として出る**', 'theorem', 'math', ['covering-correspondence']),
  c('winding-number-from-covering', '巻き数は、持ち上げの終点である', '**実数直線が円周を被覆していることだけから出る。**複素解析の巻き数と同じもの', 'theorem', 'math', ['path-lifting', 'winding-number']),
  c('degree-of-a-map', '写像度', '球面から球面への写像に、整数が一つ定まる。**連続変形で変わらない**', 'definition', 'math', ['functoriality', 'singular-homology']),
  c('hairy-ball', '偶数次元の球面には、消えないベクトル場が無い', '**Euler 標数が 0 でないから。**「風の吹かない点が必ず在る」', 'theorem', 'math', ['degree-of-a-map', 'euler-characteristic']),
  c('borsuk-ulam', 'Borsuk–Ulam の定理', '球面から同じ次元の空間への連続写像は、対蹠点で同じ値を取る。**気温と気圧が同じ地点が対で在る**', 'theorem', 'math', ['degree-of-a-map']),

  // 貼り合わせと、分類の始まり
  c('transversality-of-submanifolds', '横断性（部分多様体）', '接空間が合わせて全体を張る。**そのとき交わりの次元が $p + q - n$ になる。**熱力学の同名の概念とは別物', 'definition', 'math', ['manifold', 'sard-theorem']),
  c('generic-position', '一般の位置は、ほとんど至る所で取れる', '**Sard の定理から、横断的にする摂動が稠密に在る。**「一般の位置を仮定する」に根拠が付く', 'theorem', 'math', ['transversality-of-submanifolds']),
  c('cw-complex', 'CW 複体', '胞体を貼って空間を作る。**計算できる空間の族を、構成で定める**', 'definition', 'math', ['topology-basics', 'quotient-space']),
  c('euler-characteristic-is-homotopy-invariant', 'Euler 標数は貼り方に依らない', '**胞体の数え方を変えても同じ。**多面体公式が、その最初の例', 'theorem', 'math', ['cw-complex', 'euler-characteristic']),
  c('surface-classification', '閉曲面は、向き付け可能性と種数で尽きる', '**2 次元では分類が完全に終わる。**これが終わる最後の次元である', 'theorem', 'math', ['euler-characteristic-is-homotopy-invariant', 'orientability']),
  c('classification-ends-here', '3 次元以上では、この形の分類が無い', '**2 次元で終わったのは偶然ではなく、次元が低いから。**次元が上がると別の道具が要る', 'viewpoint', 'math', ['surface-classification']),
]
