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
      {
        match = {
          class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default"; # Bitwarden Popup
        };
        float = true;
      }
    ];
    workspace_rule = [
      {
        # Make Secondary Monitor Sliding Layout, WS 6 as the default
        workspace = "6";
        monitor = "desc:ASUSTek COMPUTER INC VG245 H1LMQS036332";
        layout = "scrolling";
        layout_opts = {
          direction = "down";
        };
        default = true;
      }
      {
        workspace = "special:scratchpad";
        on_created_empty = "ghostty";
      }
    ];
  };
}
