{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # --- ReMap Leader ---
        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        # --- Options ---
        opts = {
          tabstop = 2;
          softtabstop = 2;
          expandtab = true;
          shiftwidth = 2;
          autoindent = true;
        };

        # --- Fuzzy Finder ---
        telescope.enable = true;
        # filetree.neo-tree.enable = true;

        # --- Typing ---
        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        binds.whichKey.enable = true;

        # --- Enable Engines ---
        treesitter.enable = true;
        lsp = {
          enable = true;
          formatOnSave = true;
        };

        # --- Languages ---
        languages = {
          enableFormat = true;
          enableTreesitter = true;

          # Programming
          python.enable = true;
          rust.enable = true;
          # Web
          astro.enable = true;
          typescript.enable = true;
          # Shell
          fish.enable = true;
          bash.enable = true;
          # Configs and Text
          nix.enable = true;
          markdown.enable = true;
        };

        # --- Theme and UI ---
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };
        statusline.lualine.enable = true;
        visuals.nvim-web-devicons.enable = true;
        git.gitsigns.enable = true;
      };
    };
  };
}
