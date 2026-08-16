#!/bin/sh
# 数学フォントをサブセットして public/fonts/math.woff2 を作る。
#
# Typst は数式のイタリックを <mi>E</mi> ではなく U+1D438 のような
# Mathematical Alphanumeric Symbols の実コードポイントで出力する。
# このブロックを持つフォントを配らないと本文フォントでは豆腐になるので、
# これは任意の上乗せではなく必須の手順。
#
# 元フォントは devShell が MATH_FONT で渡す（nixpkgs の STIX Two Math）。
# シェルの外で走らせたときだけ、既知のパスと fc-list を順に探す。
set -eu

OUT_DIR="$(dirname "$0")/../public/fonts"
OUT="$OUT_DIR/math.woff2"

SRC="${MATH_FONT:-}"

if [ -z "$SRC" ]; then
  for candidate in \
    /usr/share/fonts/opentype/stix-two/STIXTwoMath-Regular.otf \
    /usr/share/fonts/opentype/STIXTwoMath-Regular.otf \
    /usr/share/texmf/fonts/opentype/public/tex-gyre-math/texgyrepagella-math.otf \
    /usr/share/texmf/fonts/opentype/public/lm-math/latinmodern-math.otf \
    /usr/share/fonts/truetype/noto/NotoSansMath-Regular.ttf
  do
    if [ -f "$candidate" ]; then
      SRC="$candidate"
      break
    fi
  done
fi

if [ -z "$SRC" ] && command -v fc-list >/dev/null 2>&1; then
  SRC=$(fc-list 2>/dev/null | grep -iE '(stix|pagella|latinmodern|xits)[^:]*math' | head -1 | cut -d: -f1 || true)
fi

if [ -z "$SRC" ] || [ ! -f "$SRC" ]; then
  echo "数学フォントが見つかりません。" >&2
  echo "  nix develop に入るか、MATH_FONT=/path/to/font.otf を指定してください。" >&2
  echo "  候補の探し方: fc-list | grep -i math" >&2
  exit 1
fi

if ! command -v pyftsubset >/dev/null 2>&1; then
  echo "pyftsubset がありません。nix develop に入ってください。" >&2
  exit 1
fi

# U+0370-03FF ギリシャ文字 / U+2100-214F 文字様記号 / U+2190-21FF 矢印
# U+2200-22FF 数学演算子 / U+27E6-27FF 各種括弧 / U+1D400-1D7FF 数式用英数字
RANGES='U+0020-007E,U+00B0-00B7,U+0370-03FF,U+2100-214F,U+2190-21FF,U+2200-22FF,U+2308-230B,U+27E6-27FF,U+2A00-2AFF,U+1D400-1D7FF'

mkdir -p "$OUT_DIR"

# ssty(上付き用字形) / dtls(ドットレス) は MathML 側の CSS が参照するので必ず残す。
# MATH テーブルが落ちると組版の寸法が全部狂うので、後段で存在を検査する。
pyftsubset "$SRC" \
  --unicodes="$RANGES" \
  --layout-features='+ssty,+dtls,+flac,+subs,+sups' \
  --flavor=woff2 \
  --output-file="$OUT"

python - "$OUT" <<'PY'
import sys
from fontTools.ttLib import TTFont

font = TTFont(sys.argv[1])
if "MATH" not in font:
    sys.exit("MATH テーブルが落ちました。組版の寸法が狂うのでサブセット条件を見直してください。")

cmap = font.getBestCmap()
missing = [f"U+{cp:04X}" for cp in (0x1D438, 0x1D713, 0x222B, 0x221A) if cp not in cmap]
if missing:
    sys.exit(f"必須のコードポイントが欠けています: {', '.join(missing)}")
PY

echo "生成: public/fonts/math.woff2 ($(wc -c <"$OUT") bytes) <- $(basename "$SRC")"
