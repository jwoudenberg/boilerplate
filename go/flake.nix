{
  description = "project-name";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        app = pkgs.buildGoModule {
          name = "project-name";
          src = ./.;
          vendorSha256 = null;
        };

      in {
        defaultPackage = app;
        defaultApp = flake-utils.lib.mkApp { drv = app; };
        devShell = pkgs.mkShell { buildInputs = [ pkgs.go ]; };
      });
}
