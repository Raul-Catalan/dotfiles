{ pkgs, ... }:
{
  imports = [
    ../modules/home/hypr/hyprland.nix
    ../modules/home/hypr/environments_nvidia.nix
    ../modules/home/noctalia.nix
    ../modules/home/ghostty.nix
    ../modules/home/cli/default.nix
    ../modules/home/vscode.nix
    ../modules/home/nvf.nix
  ];

  home = {
    username = "raul";
    homeDirectory = "/home/raul";
    stateVersion = "26.05";

    packages = with pkgs; [
      google-chrome
      vesktop # Discord
      zoom-us
      libnotify
      slack
      pavucontrol
    ];

    pointerCursor = {
      gtk.enable = true;
      name = "Catppuccin Cursor";
      package = pkgs.catppuccin-cursors.mochaLight;
      size = 24;
    };

    sessionVariables = {
      # Tell Discord, VSCode, Spotify to use Wayland
      NIXOS_OZONE_WL = "1";
      # Ensure standward Wayland environment
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  # Part of cursor config
  gtk = {
    enable = true;
  };
}
