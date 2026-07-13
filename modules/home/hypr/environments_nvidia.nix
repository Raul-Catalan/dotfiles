{
  wayland.windowManager.hyprland.settings.env = [
    {
      _args = [
        "LIBVA_DRIVER_NAME"
        "nvidia"
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
  ];
}
