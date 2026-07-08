{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../common/base.nix
    ../common/amdcpu.nix
    ../common/nvidia.nix
    ../common/audio.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # --- Networking ---
  networking.hostName = "zeus"; # Define your hostname.
  # Enable network manager
  networking.networkmanager.enable = true;

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

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # services.getty.autologinUser = "raul";
  services.displayManager.ly.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.fish.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    kitty
    git
    wireplumber # Audio
    pavucontrol # Audio
    pamixer # Audio
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # --- User ---
  users.users."raul" = {
    isNormalUser = true; # set password with passwd
    description = "Raul Catalan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # fish
    ];
    shell = pkgs.fish;
  };

  system.stateVersion = "26.05";
}
