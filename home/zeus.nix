{pkgs, ...}: {
  imports = [
    ../modules/home/hypr/hyprland.nix
    ../modules/home/hypr/environments_nvidia.nix
    ../modules/home/noctalia.nix
    ../modules/home/ghostty.nix
    ../modules/home/cli/default.nix
    ../modules/home/vscode.nix
    ../modules/home/nixvim.nix
    ../modules/home/anki.nix
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
      swaybg
    ];

    pointerCursor = {
      gtk.enable = true;
      name = "Simp1e-Solarized-Dark";
      package = pkgs.pkgs.simp1e-cursors;
      size = 24;
    };

    sessionVariables = {
      # Tell Discord, VSCode, Spotify to use Wayland
      NIXOS_OZONE_WL = "1";
      # Ensure standward Wayland environment
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";

      # For Save to work on chrome
      GTK_USE_PORTAL = "1";
    };
  };

  # Part of cursor config
  gtk = {
    enable = true;
  };
}
