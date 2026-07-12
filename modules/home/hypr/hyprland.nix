{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    portalPackage = null;
    systemd.variables = [ "--all" ];
  };

  imports = [
    ./autostart.nix
    ./binds.nix
    ./monitors.nix
    ./environments.nix
    ./general.nix
    ./rules.nix
  ];
}
