{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # --- Re-Map Leader ---
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
          smartindent = true;
          conceallevel = 2;
          wrap = true; # Wrap long lines
          linebreak = true; # Wrap whole words instead of the middle
          spell = true; # Enable Spell checking
          spelllang = ["en_us"]; # Set English for Spell Checking
          foldenable = true; # Toggle Folding for blocks
          foldlevel = 99; # Forces all folds to be be OPEN when a file opens
          termguicolors = true; # Allows 24 bit colors instead of fallback 16
          scrolloff = 8; # Gives 8 lines of buffer between the cursor and screen
          clipboard = "unnamedplus";
        };

        # --- Fuzzy Finder ---
        telescope.enable = true;
        # filetree.neo-tree.enable = true;

        # --- Typing ---
        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            confirm = "<C-y>";
            next = "<C-n>";
            previous = "<C-p>";
          };
        };
        binds.whichKey.enable = true;

        # --- Markdown and Notes ---
        notes = {
          obsidian = {
            enable = true;
            setupOpts = {
              legacy_commands = false;
              workspaces = [
                {
                  name = "notes";
                  path = "~/notes";
                }
              ];
            };
          };
        };

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
          # Configuration and Text Files
          nix.enable = true;
          markdown = {
            enable = true;
            lsp = {
              enable = true;
              servers = ["marksman"];
            };
            extensions = {
              render-markdown-nvim = {
                enable = true;
              };
            };
          };
        };

        # --- Key Bindings ---
        keymaps = [
          # --- Highlights ---
          {
            key = "<esc>";
            mode = "n";
            action = "<cmd>nohlsearch<CR>";
            desc = "Clear search highlights";
          }
          # --- Obsidian ---
          {
            key = "<leader>on";
            mode = "n";
            action = "<cmd>Obsidian new<CR>";
            desc = "New Obsidian Note";
          }
          {
            key = "<leader>os";
            mode = "n";
            action = "<cmd>Obsidian search<CR>";
            desc = "Search Obsidian Notes";
          }
          {
            key = "<leader>od";
            mode = "n";
            action = "<cmd>Obsidian today<CR>";
            desc = "Open Daily Note";
          }
          {
            key = "<leader>ob";
            mode = "n";
            action = "<cmd>Obsidian backlinks<CR>";
            desc = "Show Note Backlinks";
          }
          {
            key = "<leader>of";
            mode = "n";
            action = "<cmd>Obsidian follow_link<CR>";
            desc = "Follow Obsidian Link";
          }
          {
            key = "<leader>ot";
            mode = "n";
            action = "<cmd>Obsidian template<CR>";
            desc = "Insert Obsidian Template";
          }
          # --- Render Markdown ---
          {
            key = "<leader>rm";
            mode = "n";
            action = "<cmd>RenderMarkdown toggle<CR>";
            desc = "Toggle Markdown Rendering";
          }
        ];

        # --- Theme and Interface ---
        theme = {
          enable = true;
          name = "dracula";
          style = "dark";
        };
        statusline.lualine.enable = true;
        visuals.nvim-web-devicons.enable = true;
        git.gitsigns.enable = true;
      };
    };
  };
}
