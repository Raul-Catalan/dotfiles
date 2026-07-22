{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Dracula";
      };

      wallpaper = {
        enabled = false;
        fill_mode = "fit";
        fill_color = "#0D3644";
        transition_on_startup = true;
        per_monitor_directories = true;

        default.path = "~/dotfiles/wallpapers/black-hole.png";

        automation = {
          enabled = true;
          interval_seconds = 3600;
          order = "random";
        };

        monitor = {
          "HDMI-A-1" = {
            enabled = true;
            directory = "/home/raul/dotfiles/wallpapers/horizontal";
          };
        };

        monitor = {
          "HDMI-A-2" = {
            enabled = true;
            directory = "/home/raul/dotfiles/wallpapers/vertical";
          };
        };
        monitor = {
          "eDP-1" = {
            enabled = true;
            directory = "/home/raul/dotfiles/wallpapers/horizontal";
          };
        };
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
      weather = {
        enable = true;
        refresh_minutes = 30;
        unit = "imperial";
        effects = true;
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
          /*
          # Buggy Suspend
          suspend = {
            timeout = 1800;
            action = "lock_and_suspend";
          };
            custom = {
              timeout = 48;
              action = "command";
              command = "notify-send 'Idle' 'Going idle'";
              resume_command = "notify-send 'Idle' 'Back from idle'";
            };
          */
        };
      };

      plugins = {
        enabled = [
          "noctalia/notes"
        ];
        source = [
          {
            name = "official";
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            auto_update = true;
          }
        ];
      };

      systemd.enable = true; # launch_apps_as_systemd_services must be enabled
    };
  };
}
