{ pkgs, ... }: {
  # Enable Flakes and Optimize the Store
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # --- Optimize Space ---
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
    persistent = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # --- Networking ---
  networking.networkmanager.enable = true;

  # --- Time & Locale ---
  time.timeZone = "America/Phoenix";

  # --- Keyring ---
  services.gnome.gnome-keyring.enable = true;
  # Enable Seahorse to manage the keyring securely
  programs.seahorse.enable = true;

  # --- Packages ---
  # Packages we need at minimum, our 'survival packages' if you will
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    helix
    curl
    wget
    killall
    tree
  ];

}
