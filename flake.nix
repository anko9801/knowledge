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

          # サブセット元の数学フォント。システムの fc-list に頼ると
          # 環境ごとに結果が変わるので、ここで固定する。
          mathFont = "${pkgs.stix-two}/share/fonts/opentype/STIXTwoMath-Regular.otf";
        in
        {
          default = pkgs.mkShell {
            packages = [
              typst
              pkgs.nodejs_22
              fontTooling
              # lecture-notes の .tex を Typst に変換する（scripts/latex/to-typst.mjs）
              pkgs.pandoc
            ];

            # HTML export は experimental なので明示的に有効化する。
            # target() だけは 0.15 からこのフラグ無しでも使えるため、
            # 同じソースの PDF ビルド側では不要。
            TYPST_FEATURES = "html";

            # scripts/subset-math-font.sh が読む。
            MATH_FONT = mathFont;

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
