{pkgs, ...}: {
  imports = [
    ../modules/home/hypr/hyprland.nix
    ../modules/home/noctalia.nix
    ../modules/home/ghostty.nix
    ../modules/home/cli/default.nix
    ../modules/home/vscode.nix
    ../modules/home/nvf.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      config = {
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };
      };
    };
  };

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
      claude-code
      swaybg
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
      # Ensure standard Wayland Environment
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  gtk = {
    enable = true;
  };
}
