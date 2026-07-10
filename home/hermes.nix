# Keeping incase cp the zeus.nix file doesnt work, should delete once we have a hermes.nix file setup with the config.
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

  programs.git = {
    enable = true;
    settings = {

      user = {
        name = "Raul Catalan";
        email = "raulrcatalan@gmail.com";
      };

      core = {
        editor = "hx";
      };

      init = {
        defaultBranch = "main";
      };

      pull = {
        rebase = true;
      };

    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      config = {
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
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
