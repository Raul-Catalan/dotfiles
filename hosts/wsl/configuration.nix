{
  lib,
  username,
  ...
}: {
  imports = [
    ../../modules/nixos/system/default.nix
    ../../modules/nixos/system/nix-ld.nix
    ../../modules/nixos/virtualisation/docker.nix
  ];

  # Enable Fish for the OS (normally pulled in by the desktop module, which
  # this host doesn't import).
  programs.fish.enable = true;

  wsl = {
    enable = true;
    defaultUser = username;
  };

  # --- Networking ---
  # WSL2 shares the Windows host's network stack; NetworkManager isn't needed.
  networking.networkmanager.enable = lib.mkForce false;
  networking.hostName = "wsl"; # Define your hostname.

  # --- User ---
  # Defined in modules/nixos/user.nix (shared). WSL doesn't import the desktop
  # module, so the user keeps the minimal base group set (docker only).

  system.stateVersion = "26.05";
}
