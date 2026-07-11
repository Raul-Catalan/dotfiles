{ pkgs, ... }:
{
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
}
