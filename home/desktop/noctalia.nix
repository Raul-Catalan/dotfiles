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
        screenshot = {
          save_to_file = true;
          directory = "~/screenshots";
          filename_pattern = "screenshot_%Y%m%d_%H%M%S";
          copy_to_clipboard = true;
        };
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

      idle = {
        pre_action_fade_seconds = 3.0;
        behavior = {
          lock = {
            timeout = 900;
            action = "lock";
            enabled = true;
          };
          screen-off = {
            timeout = 960;
            action = "screen_off";
            enabled = true;
          };
          suspend = {
            timeout = 1800;
            action = "lock_and_suspend";
          };
          /*
            custom = {
              timeout = 48;
              action = "command";
              command = "notify-send 'Idle' 'Going idle'";
              resume_command = "notify-send 'Idle' 'Back from idle'";
            };
          */
        };
      };

      systemd.enable = true; # launch_apps_as_systemd_services must be enabled
    };
  };
}
