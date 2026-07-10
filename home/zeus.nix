{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hypr/hyprland.nix
    ./terminal/shell.nix
    ./terminal/ghostty.nix
    ./desktop/noctalia.nix
  ];

  home.username = "raul";
  home.homeDirectory = "/home/raul";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    google-chrome
    vesktop # Discord
    zoom-us
    libnotify
    slack
    pavucontrol
  ];

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin Cursor";
    # Change: Light, Dark, Blue, Teal, Mauve were good
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 24;
  };

  home.sessionVariables = {
    # Tell Discord, VSCode, Spotify to use Wayland
    NIXOS_OZONE_WL = "1";
    # Ensure standard Wayland environment
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  # Part of cursor config
  gtk = {
    enable = true;
  };
}
