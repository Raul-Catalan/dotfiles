{ pkgs, ... }:
{
  # Tmux
  programs.tmux = {
    enable = true;
    mouse = true;
    sensibleOnTop = true;

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
  };
}
