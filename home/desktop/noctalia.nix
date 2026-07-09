{ inputs, ... }:
{
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
        default.path = "~/dotfiles/wallpapers/bars.jpg";
      };

      shell = {
        launch_apps_as_systemd_services = true;
        polkit_agent = true;
      };

      location = {
        address = "Phoenix, AZ";
      };

      nightlight = {
        enable = true;
        # 6500 default
        temperature_day = 6500;
        # 4500 Gentle Shift: if we do alot of gaming/coding at night
        # 3500 Classic Sweetspot: reduces eye strain
        # 2500 Deep Sleep: Very heavy amger/orange tint. Max sleep protection
        temperature_night = 2500;
      };

      systemd.enable = true; # launch_apps_as_systemd_services must be enabled
    };
  };
}
