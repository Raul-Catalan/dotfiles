{
  wayland.windowManager.hyprland = {
    /*
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
        };

        decoration.rounding = 10;
    */
    settings = {
      config = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
        };
        decoration = {
          rounding = 10;
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
        cursor = {
          no_hardware_cursors = 1;
        };
      };
    };
  };
}
