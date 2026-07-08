{
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "lua";

  imports = [
    ./autostart.nix
    ./binds.nix
    ./monitors.nix
    ./environments.nix
    ./general.nix
  ];
}
