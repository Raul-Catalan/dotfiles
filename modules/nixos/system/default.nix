{ pkgs, ... }: {
  # Enable Flakes and Optimize the Store
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # --- Networking ---
  networking.networkmanager.enable = true;

  # --- Time & Locale ---
  time.timeZone = "America/Phoenix";

  # --- Packages ---
  # Packages we need at minimum, our 'survival packages' if you will
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    hx
    curl
    wget
    killall
    tree
  ];
}
