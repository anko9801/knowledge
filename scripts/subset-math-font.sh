#!/bin/sh
# 数学フォントをサブセットして src/fonts/math.woff2 を作る。
#
# Typst は数式のイタリックを <mi>E</mi> ではなく U+1D438 のような
# Mathematical Alphanumeric Symbols の実コードポイントで出力する。
# このブロックを持つフォントを配らないと本文フォントでは豆腐になるので、
# これは任意の上乗せではなく必須の手順。
#
# 元フォントは devShell が MATH_FONT で渡す（nixpkgs の Latin Modern Math）。
# シェルの外で走らせたときだけ、既知のパスと fc-list を順に探す。
set -eu

OUT_DIR="$(dirname "$0")/../src/fonts"
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

# U+0020-007E ASCII（数字・括弧・等号・立体のラテン文字）
# U+00A0-00FF ラテン補助（× ÷ ° など）
# U+02B0-02FF 独立字形の修飾文字（˙ ˆ ˜ ¯ ˇ）。数式のアクセントはここを使う。
#             合成用（U+0300-036F）は送り幅が 0 で、ブラウザが <mover> の
#             中心を出せずに左へずれるため、loader が独立字形へ置き換える。
# U+0300-036F 合成用ダイアクリティカル（置換前の状態や本文の欧文名に要る）
# U+0370-03FF ギリシャ文字 / U+2000-206F 一般句読点（プライム・数式用スペース）
# U+20D0-20FF 合成用記号（ベクトルの矢印）/ U+2100-214F 文字様記号
# U+2190-21FF 矢印 / U+2200-22FF 数学演算子 / U+2308-230B 天井・床
# U+27C0-27FF 各種括弧 / U+2A00-2AFF 追加の演算子 / U+1D400-1D7FF 数式用英数字
#
# ここが CSS の unicode-range と食い違うと、範囲外の文字だけ本文フォントで
# 描かれて数式が不揃いになる。global.css 側では範囲を切らず、
# この一覧をカバレッジの唯一の情報源にしている。
RANGES='U+0020-007E,U+00A0-00FF,U+02B0-02FF,U+0300-036F,U+0370-03FF,U+2000-206F,U+20D0-20FF,U+2100-214F,U+2190-21FF,U+2200-22FF,U+2308-230B,U+27C0-27FF,U+2A00-2AFF,U+1D400-1D7FF'

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
# 0x0307 はドットアクセント。ここが欠けると q̇ の点だけ別フォントになる。
required = (0x1D438, 0x1D713, 0x222B, 0x221A, 0x02D9, 0x00A8, 0x0307, 0x2032, 0x0028, 0x0030)
missing = [f"U+{cp:04X}" for cp in required if cp not in cmap]
if missing:
    sys.exit(f"必須のコードポイントが欠けています: {', '.join(missing)}")
PY

echo "生成: src/fonts/math.woff2 ($(wc -c <"$OUT") bytes) <- $(basename "$SRC")"
