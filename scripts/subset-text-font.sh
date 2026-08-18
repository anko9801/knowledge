#!/bin/sh
# 本文の欧文フォントをサブセットして public/fonts/text-{regular,bold}.woff2 を作る。
#
# 数式は STIX Two Math で組んでいるのに、地の文の欧文が和文フォント（明朝）の
# 欧文グリフだと、太さも骨格も揃わない。Gödel や Löwenheim のような固有名詞が
# 本文に頻出するので、ここが揃っていないと数式だけ浮いて見える。
#
# STIX Two Text は STIX Two Math と同じ設計なので、両者を並べると馴染む。
# 和文は CJK グリフを持たないぶん自動でフォールバックする。
set -eu

OUT_DIR="$(dirname "$0")/../public/fonts"

# 数式フォントと同じディレクトリに置かれている想定。MATH_FONT から辿る。
SRC_DIR="${TEXT_FONT_DIR:-}"

if [ -z "$SRC_DIR" ] && [ -n "${MATH_FONT:-}" ]; then
  SRC_DIR="$(dirname "$MATH_FONT")"
fi

if [ -z "$SRC_DIR" ] || [ ! -f "$SRC_DIR/STIXTwoText-Regular.otf" ]; then
  echo "STIX Two Text が見つかりません。" >&2
  echo "  nix develop に入るか、TEXT_FONT_DIR=/path/to/dir を指定してください。" >&2
  exit 1
fi

if ! command -v pyftsubset >/dev/null 2>&1; then
  echo "pyftsubset がありません。nix develop に入ってください。" >&2
  exit 1
fi

# U+0020-007E ASCII / U+00A0-024F ラテン拡張（ö ü é ő など固有名詞用）
# U+0300-036F 合成用ダイアクリティカル / U+2000-206F 一般句読点（ダッシュ・引用符）
RANGES='U+0020-007E,U+00A0-024F,U+0300-036F,U+2000-206F'

mkdir -p "$OUT_DIR"

subset() {
  src="$SRC_DIR/$1"
  out="$OUT_DIR/$2"

  pyftsubset "$src" \
    --unicodes="$RANGES" \
    --layout-features='+kern,+liga,+onum,+lnum' \
    --flavor=woff2 \
    --output-file="$out"

  echo "生成: public/fonts/$2 ($(wc -c <"$out") bytes) <- $1"
}

subset STIXTwoText-Regular.otf text-regular.woff2
subset STIXTwoText-Bold.otf text-bold.woff2
