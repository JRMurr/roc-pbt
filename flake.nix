{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    roc.url = "github:roc-lang/roc";
    roc2nix = {
      url = "github:JRMurr/roc2nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.roc.follows = "roc";
      inputs.flake-utils.follows = "flake-utils";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, roc, roc2nix, rust-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };

        rocPkgs = roc.packages.${system};
        rocFull = rocPkgs.full;
        rocLib = (roc2nix.lib.${system}).overrideToolchain rocFull;

        rustVersion = (pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml);
        rustPlatform = pkgs.makeRustPlatform {
          cargo = rustVersion;
          rustc = rustVersion;
        };

        rust-shell =
          (rustVersion.override { extensions = [ "rust-src" "rust-analyzer" ]; });

      in
      {
        formatter = pkgs.nixpkgs-fmt;

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs;
              [
                rocFull
                rust-shell
              ];

            shellHook = ''
              export ROC_LSP_PATH=${rocFull}/bin/roc_ls
            '';
          };
        };
      });
}
