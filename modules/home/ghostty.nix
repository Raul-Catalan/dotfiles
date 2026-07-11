{ pkgs, ... }:
{
  programs.kitty.enable = true; # Incase our hyprland config breaks
  # Ghostty config
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
    };
  };
}
