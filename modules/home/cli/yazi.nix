{ pkgs, ... }:
{
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
      plugin = {
        prepend_previewers = [
          {
            mime = "image/*";
            run = "mediainfo";
          }
          {
            mime = "video/*";
            run = "mediainfo";
          }
          {
            mime = "audio/*";
            run = "mediainfo";
          }
        ];
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
      mediainfo = pkgs.fetchFromGitHub {
        owner = "boydaihungst";
        repo = "mediainfo.yazi";
        rev = "master";
        hash = "sha256-s2/6ljln64oVbKVFTGbRdxB8x9ASCo7FKDvC65eyDWM=";
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
}
