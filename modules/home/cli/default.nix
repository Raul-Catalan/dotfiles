{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./helix.nix
    ./git.nix
    ./github.nix
    ./fish.nix
    ./tmux.nix
    ./starship.nix
    ./yazi.nix
    ./nh.nix
  ];

  # tools and supporting packages
  home.packages = with pkgs; [
    nixfmt # Formatter for nix used in languages.toml
    nixd # Nix Language Server
    bat # Better Cat
    imagemagick # To CLI edit images
  ];
}
