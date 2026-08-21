#!/bin/sh
# コードの等幅フォントをサブセットして src/fonts/mono-{regular,bold}.woff2 を作る。
#
# 本文が Latin Modern Roman、数式が Latin Modern Math なのに、コードだけ
# ui-monospace（実体は環境依存の DejaVu Sans Mono など）に落ちていた。
# あちらは Computer Modern と骨格も太さも無関係なので、コードの塊だけが
# 別のサイトから貼られたように浮く。inline の `foo` は本文の行の中に出るぶん、
# もっと目立つ。
#
# Latin Modern Mono は同じ Computer Modern 系のタイプライタ体なので、
# 本文と数式の両方に馴染む。
#
# Light を採るのは、こちらにだけ本物の bold があるため。Regular 側は
# lmmono10-bold が無く、ブラウザに合成させると字が潰れる。
set -eu

OUT_DIR="$(dirname "$0")/../src/fonts"

# 本文の欧文と同じディレクトリに置かれている想定。
SRC_DIR="${TEXT_FONT_DIR:-}"

if [ -z "$SRC_DIR" ] && [ -n "${MATH_FONT:-}" ]; then
  SRC_DIR="$(dirname "$MATH_FONT")"
fi

if [ -z "$SRC_DIR" ] || [ ! -f "$SRC_DIR/lmmonolt10-regular.otf" ]; then
  echo "Latin Modern Mono が見つかりません。" >&2
  echo "  nix develop に入るか、TEXT_FONT_DIR=/path/to/dir を指定してください。" >&2
  exit 1
fi

if ! command -v pyftsubset >/dev/null 2>&1; then
  echo "pyftsubset がありません。nix develop に入ってください。" >&2
  exit 1
fi

# U+0020-007E ASCII。コードはほぼこれで足りる。
# U+00A0-024F ラテン拡張と U+2000-206F 一般句読点は、コードに混ざる
# 引用符やダッシュ、出どころの表示に出る和欧混植の受け皿。
RANGES='U+0020-007E,U+00A0-024F,U+2000-206F'

mkdir -p "$OUT_DIR"

subset() {
  src="$SRC_DIR/$1"
  out="$OUT_DIR/$2"

  # 等幅なので kern は要らない。liga はコード中の -> や != を勝手に繋ぐと
  # 元のソースと字面が変わるので、入れない。
  pyftsubset "$src" \
    --unicodes="$RANGES" \
    --layout-features='' \
    --flavor=woff2 \
    --output-file="$out"

  echo "生成: src/fonts/$2 ($(wc -c <"$out") bytes) <- $1"
}

subset lmmonolt10-regular.otf mono-regular.woff2
subset lmmonolt10-bold.otf mono-bold.woff2
