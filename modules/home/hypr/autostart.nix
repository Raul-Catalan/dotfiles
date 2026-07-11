{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [

      ];
      on = {
        _args = [
          "hyprland.start"
          (lua ''
            function()
              hl.exec_cmd("noctalia")
            end    
          '')
        ];
      };
    };
  };
}
