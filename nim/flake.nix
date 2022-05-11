{
  description = "project-name";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        app = pkgs.stdenv.mkDerivation rec {
          name = "project-name-${version}";
          version = "0.1.0";
          depsBuildBuild = [ pkgs.nim ];
          buildInputs = [ pkgs.pcre ];
          src = ./src;
          buildPhase = ''
            TMP=$(realpath .)
            nim compile \
              -d:release \
              --nimcache:$TMP \
              --out:project-name \
              ${src}/main.nim
          '';
          installPhase = ''
            install -Dt \
              $out/bin \
              project-name
          '';

          NIX_LDFLAGS = "-lpcre";

          meta = with pkgs.lib; {
            description = "project-description";
            homepage = "https://github.com/jwoudenberg/project-name";
            license = licenses.mit;
          };
        };

      in {
        defaultPackage = app;
        devShell = pkgs.mkShell { buildInputs = [ pkgs.nim ]; };
      });
}
