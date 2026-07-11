{
  programs.noctalia-greeter = {
    enable = true;

    settings = {
      session = {
        default = "hyprland";
      };
      output = {
        name = "HDMI-A-1";
        layout = "HDMI-A-2:0,0; HDMI-A-1:1080,0";
      };
    };
  };
}
