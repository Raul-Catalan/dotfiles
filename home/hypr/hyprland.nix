{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "lua";

  imports = [
    ./binds.nix
    ./monitors.nix
  ];

  /*
    TODO: Migrate to Lua, maybe once its better supported
    wayland.windowManager.hyprland.settings.bind = [
      (bind "SUPER + RETURN" (dsp.exec "ghostty"))
    ];
    https://www.reddit.com/r/NixOS/comments/1tg9cse/hyprland_hm_lua_config_migration/
  */

  wayland.windowManager.hyprland.settings = {
    /*
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

      # Auto Start

      cursor = {
        no_hardware_cursors = true;
      };
    */
  };
}
