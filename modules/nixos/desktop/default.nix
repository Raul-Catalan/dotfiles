{ inputs, pkgs, ... }:
{
  # Enable Fish for the OS
  programs.fish.enable = true;

  # Have to enable Hyprland at the OS Level
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # services.getty.autologinUser = "raul";
  # services.displayManager.ly.enable = true;
  programs.noctalia-greeter = {
    enable = true;
    greeter-args = "";
  };

  # Install Steam at the OS level
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Noctalia Requirements
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  security.polkit.enable = true;

  # ScreenSharing and Communicating between apps
  xdg.portal = {
    enable = true;
    # Add the Hyprland portal and the GTK portal (fallback for file choosers)
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
      common.default = "*";
    };
  };

  # Allow udev rule to edit keyboard in VIA
  hardware.keyboard.qmk.enable = true;
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="cb10", ATTRS{idProduct}=="1756", MODE="0666"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="cb10", ATTRS{idProduct}=="1756", TAG+="uaccess"
  '';

  # --- Keyring ---
  services.gnome.gnome-keyring.enable = true;
  # Enable Seahorse to manage the keyring securely
  programs.seahorse.enable = true;

  # Need to Enable this for VSCode to install stuff without breaking
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kitty
    wireplumber # Audio
    pavucontrol # Audio
    pamixer # Audio
    xdg-util # Google Chrome Opens Apps
  ];
}
