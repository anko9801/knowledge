#!/bin/sh
# 黒板文字（\mathbb）だけを切り出す。
#
# 数式の本体は Latin Modern Math だが、その \mathbb は全画が二重線になる
# 中抜きで、セリフも無い。周りの Computer Modern と骨格が揃わず、
# ℝ や ℕ だけ針金のように浮く。伝統的な CM の \mathbb を持つ
# New Computer Modern から、その字だけ借りる。
#
# 数式フォントごと NewCM に替える手もあるが、pyftsubset が NewCM の
# MATH テーブルを削り切れず、大きい異体字が使われなくなる（∫ が 2.30em
# から 1.10em に縮み、根号の蓋・分数の位置・cases の波括弧も崩れる）。
# ここで切り出すのは素の字だけで MATH テーブルを使わないので、その影響が無い。
set -eu

SRC="${MATHBB_FONT:-}"
if [ -z "$SRC" ] || [ ! -f "$SRC" ]; then
  echo "MATHBB_FONT が指すファイルがありません。nix develop に入ってください。" >&2
  exit 1
fi

OUT=public/fonts/mathbb.woff2

# 二重線の英大文字・小文字・数字は 2 つのブロックに分かれている。
# Letterlike Symbols 側（ℂ ℍ ℕ ℙ ℚ ℝ ℤ と ℼ ℽ ℾ ℿ ⅀）に穴が空いていて、
# 残りが Mathematical Alphanumeric Symbols 側にある。両方を取る。
RANGES='U+2102,U+210D,U+2115,U+2119,U+211A,U+211D,U+2124,U+213C-2140,U+1D538-1D56B,U+1D7D8-1D7E1'

pyftsubset "$SRC" \
  --unicodes="$RANGES" \
  --flavor=woff2 \
  --output-file="$OUT"

python3 - "$OUT" <<'PY'
import sys
from fontTools.ttLib import TTFont

font = TTFont(sys.argv[1])
cmap = {}
for table in font['cmap'].tables:
    cmap.update(table.cmap)

# 本文で実際に使う字。欠けたら本体フォントに落ちて、そこだけ字形が変わる。
required = [0x211D, 0x2124, 0x2102, 0x2119, 0x2115, 0x211A, 0x1D538, 0x1D54B, 0x1D53D]
missing = [f'U+{cp:04X}' for cp in required if cp not in cmap]
if missing:
    sys.exit('黒板文字が欠けています: ' + ', '.join(missing))
print(f'  {len(cmap)} 字を収録')
PY

echo "生成: $OUT ($(wc -c < "$OUT") bytes) <- $(basename "$SRC")"
