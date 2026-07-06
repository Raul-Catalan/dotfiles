{ config, pkgs, ... }:

{
  home.username = "raul";
  home.homeDirectory = "/home/raul";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use hyprland btw";
    };
  };

  # Helix Config
  programs.helix = {
    enable = true;

    # ~/.config/helix/config.toml
    settings = {
      theme = "dracula_at_night";
      editor = {
        # line-number = "relative";
        mouse = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };

    # ~/.config/helix/languages.toml
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
      ];

      language-server = {
        nixd = {
          command = "nixd";
        };
      };
    };
  };

  home.packages = with pkgs; [
    nixfmt # Formatter for nix used in languages.toml
    nixd # Nix Language Server
    gh
    google-chrome
  ];
}
