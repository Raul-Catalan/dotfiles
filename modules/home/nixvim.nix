{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    # --- Re-Map Leader ---
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # --- Options ---
    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Relative line numbers for easy motions
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      shiftwidth = 2;
      autoindent = true;
      smartindent = true;
      conceallevel = 0;
      wrap = true; # Wrap long lines
      linebreak = true; # Wrap whole words instead of the middle
      spell = true; # Enable Spell checking
      spelllang = "en_us"; # Set English for Spell Checking
      foldenable = true; # Toggle Folding for blocks
      foldlevel = 99; # Forces all folds to be OPEN when a file opens
      termguicolors = true; # Allows 24 bit colors instead of fallback 16
      scrolloff = 8; # Gives 8 lines of buffer between the cursor and screen
      clipboard = "unnamedplus";
    };

    # --- Theme ---
    colorschemes.dracula.enable = true;

    # --- Formatters used by conform (below) ---
    extraPackages = with pkgs; [
      alejandra # nix formatter
      ruff # python formatter/linter
      shfmt # shell formatter
    ];

    plugins = {
      # --- Syntax Engine ---
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      # --- Fuzzy Finder ---
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Find files";
          };
          "<leader>fg" = {
            action = "live_grep";
            options.desc = "Live grep";
          };
          "<leader>fb" = {
            action = "buffers";
            options.desc = "Find buffers";
          };
          "<leader>fh" = {
            action = "help_tags";
            options.desc = "Help tags";
          };
        };
      };

      # --- Git ---
      gitsigns.enable = true;

      # --- LSP ---
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true; # Nix
          pyright.enable = true; # Python
          ruff.enable = true; # Python lint/format
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          bashls.enable = true; # Shell
          marksman.enable = true; # Markdown
        };
      };

      # --- Format on Save (skips rust, matching old config) ---
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = ["alejandra"];
            python = ["ruff_format"];
            sh = ["shfmt"];
          };
          format_on_save = {
            __raw = ''
              function(bufnr)
                if vim.bo[bufnr].filetype == "rust" then
                  return
                end
                return { timeout_ms = 500, lsp_fallback = true }
              end
            '';
          };
        };
      };

      # --- Completion ---
      blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "default";
          sources.default = ["lsp" "path" "snippets" "buffer"];
          completion.documentation.auto_show = true;
        };
      };

      # --- Markdown Rendering ---
      render-markdown.enable = true;

      # --- Quality of Life ---
      which-key.enable = true;
      lualine.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
    };

    # --- Key Bindings ---
    keymaps = [
      {
        key = "<esc>";
        mode = "n";
        action = "<cmd>nohlsearch<CR>";
        options.desc = "Clear search highlights";
      }
      {
        key = "<leader>tf";
        mode = "n";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options.desc = "Open Floating Diagnostic";
      }
      {
        key = "<leader>rm";
        mode = "n";
        action = "<cmd>RenderMarkdown toggle<CR>";
        options.desc = "Toggle Markdown Rendering";
      }
    ];
  };
}
