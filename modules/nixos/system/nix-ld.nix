{ pkgs, ... }:
{
  # --- Nix ld ---
  # We are setting this so we can run a complex project we need to work on that relys on pip
  # We should use uv for python packages, so maybe remove in the future when its not needed?
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
    # Add more packages if binaries fail to run
  ];
}
