{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      {
        # Testing Rule
        match = {
          class = "^(kitty)$";
        };
        float = true;
        border_size = 10;
      }
      {
        match = {
          class = "^(steam)$";
          title = "negative:^(Steam)$";
        };
        float = true;
      }
    ];
  };
}
