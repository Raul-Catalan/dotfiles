{ config, pkgs, ... }:

{
  imports = [
    ./hypr/hyprland.nix
    ./desktop/waybar.nix
    ./terminal/shell.nix
    ./terminal/ghostty.nix
  ];

  home.username = "raul";
  home.homeDirectory = "/home/raul";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    google-chrome
  ];

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin Cursor";
    # Change: Light, Dark, Blue, Teal, Mauve were good
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 24;
  };

  # Part of cursor config
  gtk = {
    enable = true;
  };
}
