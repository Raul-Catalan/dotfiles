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
          # VGA245
          output = "desc:ASUSTek COMPUTER INC VG245 H1LMQS036332";
          mode = "1920x1080@60";
          position = "0x0";
          scale = "1.0";
          transform = 1;
        }
        {
          # VGA32AQL1A
          output = "desc:ASUSTek COMPUTER INC VG32AQL1A MBLMQS193396";
          mode = "2560x1440@144";
          position = "1080x0";
          scale = "1.0";
        }
        {
          # Thinkpad Built In Screen
          output = "desc:Chimei Innolux Corporation 0x1417";
          mode = "1920x1200@60";
          position = "auto";
          scale = "1.0";
        }
        {
          # Fallback/default
          output = "";
          mode = "preferred";
          position = "auto";
          scale = "1.0";
        }
      ];
    };
  };
}
