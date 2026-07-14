{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        number = true;
        relativenumber = true;

        mapleader = " ";
        maplocalleader = " ";

        statusline.lualine.enable = true;
        telescope.enable = true;

        autocomplete.nvim-cmp.enable = true;
        treesitter.enable = true;

        # LSP and Languages
        lsp.enable = true;
        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "dark";
        };
      };
    };
  };
}
