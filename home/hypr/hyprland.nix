{ config, pkgs, ... }:
{

  imports = [
    ./binds.nix
  ];

  /*
    TODO: Migrate to Lua, maybe once its better supported
    wayland.windowManager.hyprland.configType = "lua";
    wayland.windowManager.hyprland.settings.bind = [
      (bind "SUPER + RETURN" (dsp.exec "ghostty"))
    ];
    https://www.reddit.com/r/NixOS/comments/1tg9cse/hyprland_hm_lua_config_migration/
  */

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "hyprlang";
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE,16"
      "HYPRCURSOR_SIZE,16"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
    };

    decoration.rounding = 10;

    exec-once = [
      # "waybar"
      # "hyprpaper"
      "systemctl --user start noctalia.service"
    ];

    monitor = [
      # VGA245
      "HDMI-A-2, 1920x1080@60, 0x0, 1, transform, 1"
      # VGA32AQL1A
      "HDMI-A-1, 2560x1440@144, 1080x0, 1"

      # Fallback
      ", preferred, auto, 1"
    ];

    cursor = {
      no_hardware_cursors = true;
    };
  };
}
