{lib, ...}: let
  lua = lib.generators.mkLuaInline;
in {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
      ];
      on = [
        {
          _args = [
            "hyprland.start"
            (lua ''
              function()
                hl.exec_cmd("swaybg -c '282A36'")
              end
            '')
          ];
        }
        {
          _args = [
            "hyprland.start"
            (lua ''
              function()
                hl.exec_cmd("noctalia")
              end
            '')
          ];
        }
        {
          _args = [
            "hyprland.start"
            (lua ''
               function()
                hl.exec_cmd("google-chrome-stable --ozone-platform=wayland 'https://excalidraw.com'", { workspace = "6 silent"})
              end
            '')
          ];
        }
      ];
    };
  };
}
