{
  /*
      env = [
        "XCURSOR_SIZE,16"
        "HYPRCURSOR_SIZE,16"
      ];
  */
  wayland.windowManager.hyprland.settings.env = [
    {
      _args = [
        "XCURSOR_SIZE"
        "24"
      ];
    }
    {
      _args = [
        "HYPRCURSOR_SIZE"
        "24"
      ];
    }
    {
      _args = [
        "XDG_SESSION_TYPE"
        "wayland"
      ];
    }
    {
      _args = [
        "NVD_BACKEND"
        "direct"
      ];
    }
    {
      _args = [
        "ELECTRON_OZONE_PLATFORM_HINT"
        "auto"
      ];
    }
  ];
}
