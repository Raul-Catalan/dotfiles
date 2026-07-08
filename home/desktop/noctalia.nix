{ inputs, ... }:
{
  home-manager.users.drfoobar = {
    imports = [
      inputs.noctalia.homeModules.default
    ];
    programs.noctalia = {
      enable = true;

      settings = {
        theme = {
          mode = "dark";
          source = "builtin";
          builtin = "Catppuccin";
        };

        wallpaper = {
          enabled = true;
          default.path = "~/dotfiles/wallpapers/clouds-3.jpg";
        };

        shell = {
          launch_apps_as_systemd_services = true;
        };
      };

      systemd.enable = true; # launch_apps_as_systemd_services must be enabled
    };
  };
}
