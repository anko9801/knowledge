{
  description = "Typst HTML export -> Astro static site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # stable の typst は 0.14.2 で MathML export (0.15) が入っていない。
    # typst だけ unstable から取り、他のツールチェインは stable に載せる。
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          typst = (import nixpkgs-unstable { inherit system; }).typst;

          # pyftsubset の --flavor=woff2 は brotli を同じ python 環境に要求する。
          # fonttools を単体で入れると "No module named brotli" で落ちる。
          fontTooling = pkgs.python3.withPackages (ps: with ps; [ fonttools brotli ]);

          # サブセット元のフォント。システムの fc-list に頼ると環境ごとに
          # 結果が変わるので、ここで固定する。
          #
          # Latin Modern は LaTeX が既定で使う Computer Modern。元の講義ノートが
          # LaTeX で組まれていたので、字形を揃えると見え方が変わらない。
          mathFont = "${pkgs.lmmath}/share/fonts/opentype/latinmodern-math.otf";

          # 黒板文字だけは New Computer Modern から借りる。Latin Modern の
          # \mathbb は全画が二重線になる中抜きで、セリフも無く、周りの字と
          # 揃わない。NewCM は伝統的な CM のそれを持つ。
          #
          # 数式フォントごと NewCM に替えると、pyftsubset が MATH テーブルを
          # 削り切れずに大きい異体字を落とす（∫ が 2.30em から 1.10em になり、
          # 根号の蓋・分数の位置・cases の波括弧も崩れる）。だから字だけ借りる。
          mathbbFont = "${pkgs.newcomputermodern}/share/fonts/opentype/public/NewCMMath-Regular.otf";
          textFontDir = "${pkgs.lmodern}/share/fonts/opentype/public/lm";
        in
        {
          default = pkgs.mkShell {
            packages = [
              typst
              pkgs.nodejs_24
              fontTooling
              # lecture-notes の .tex を Typst に変換する（scripts/latex/to-typst.mjs）
              pkgs.pandoc
              # ノートの図版を web 向けに縮小する
              pkgs.imagemagick
            ];

            # HTML export は experimental なので明示的に有効化する。
            # target() だけは 0.15 からこのフラグ無しでも使えるため、
            # 同じソースの PDF ビルド側では不要。
            TYPST_FEATURES = "html";

            # scripts/subset-math-font.sh と subset-text-font.sh が読む。
            MATH_FONT = mathFont;
            MATHBB_FONT = mathbbFont;
            TEXT_FONT_DIR = textFontDir;

            shellHook = ''
              echo "typst   $(typst --version | cut -d' ' -f2)"
              echo "node    $(node --version)"
              echo "subset  $(pyftsubset --help >/dev/null 2>&1 && echo ok || echo NG)"
              echo "math    $(basename "$MATH_FONT")"
              echo "pandoc  $(pandoc --version | head -1 | cut -d' ' -f2)"
            '';
          };
        });

      packages = forAllSystems (system: {
        typst = (import nixpkgs-unstable { inherit system; }).typst;
      });
    };
}
