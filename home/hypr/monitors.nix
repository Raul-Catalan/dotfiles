{
  wayland.windowManager.hyprland = {
    settings = {
      /*
        monitor = [
          # VGA245
          "HDMI-A-2, 1920x1080@60, 0x0, 1, transform, 1"
          # VGA32AQL1A
          "HDMI-A-1, 2560x1440@144, 1080x0, 1"

          # Fallback
          ", preferred, auto, 1"
        ];
      */
      monitor = [
        {
          output = "HDMI-A-2";
          mode = "1920x1080@60";
          position = "0x0";
          scale = "1.0";
        }
        {
          output = "HDMI-A-1";
          mode = "2560x1440@144";
          position = "1080x0";
          scale = "1.0";
        }
      ];
    };
  };
}
