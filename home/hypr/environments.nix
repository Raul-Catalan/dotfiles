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
        "LIBVA_DRIVER_NAME"
        "nvidia"
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
        "GBM_BACKEND"
        "nvidia-drm"
      ];
    }
    {
      _args = [
        "__GLX_VENDOR_LIBRARY_NAME"
        "nvidia"
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
