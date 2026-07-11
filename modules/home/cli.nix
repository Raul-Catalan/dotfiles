{ pkgs, ... }:
{
  # Sanity Check
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
      theme = "catppuccin_mocha";
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

  # Git and GH CLI
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

  # Fish Shell
  programs.fish = {
    enable = true;
    shellAbbrs = {
      la = "ls -a";
      zeus-update = "sudo nixos-rebuild switch --flake ~/dotfiles#zeus";
      ga = "git add .";
      gc = "git commit -m";
    };
    # Add notes backup
  };

  # Tmux
  programs.tmux = {
    enable = true;
    mouse = true;
    sensibleOnTop = true;

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
  };

  # Starship Prompt
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableInteractive = true;
    presets = [ "catppuccin-powerline" ];
  };

  # Yazi - TUI file manager
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
    plugins = {
      chmod = pkgs.yaziPlugins.chmod;
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "starship.yazi";
        rev = "159eaba5b5052bf78ff6cfbfe4e527b946818c82";
        sha256 = "sha256-I21to4cxlszRpsb58cvsmwX7VglQBSJC0rrsFIltzC8=";
      };
    };

    initLua = ''
      require("starship"):setup()
    '';
    keymap = {
      manager.prepend_keymap = [
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
      ];
    };
  };

  # nh cli tool for nixos
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/raul/dotfiles";
  };

  # tools and supporting packages
  home.packages = with pkgs; [
    nixfmt # Formatter for nix used in languages.toml
    nixd # Nix Language Server
    bat
    imagemagick
  ];
}
