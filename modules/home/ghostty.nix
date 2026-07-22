{
  programs.kitty.enable = true; # Incase our hyprland config breaks
  # Ghostty config
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Dracula";
      font-family = "JetBrainsMono Nerd Font";
      term = "xterm-256color";
    };
  };
}
