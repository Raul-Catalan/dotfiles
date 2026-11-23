{
  description = "Rust dev environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      # Build-time dependencies (e.g., system tools, compilers)
      nativeBuildInputs = with pkgs; [
        # Core Rust toolchain
        rustc
        cargo
        rustfmt
        clippy
        rust-analyzer

        pkg-config
      ];

      # Runtime dependencies and libraries needed by crates (e.g., openssl, zlib)
      buildInputs = with pkgs; [
        # Common libraries used by many Rust projects
        openssl
      ];

      # Required for rust-analyzer LSP to find standard library source
      RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;

      shellHook = ''
        echo "Rust version: $(rustc --version)"
      '';
    };
  };
}
