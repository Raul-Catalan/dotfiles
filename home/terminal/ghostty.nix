{ pkgs, ... }:
{
  # Ghostty config
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
    };
  };
}
