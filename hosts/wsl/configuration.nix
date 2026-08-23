{
  pkgs,
  lib,
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
    defaultUser = "raul";
  };

  # --- Networking ---
  # WSL2 shares the Windows host's network stack; NetworkManager isn't needed.
  networking.networkmanager.enable = lib.mkForce false;
  networking.hostName = "wsl"; # Define your hostname.

  # --- User ---
  users.users."raul" = {
    isNormalUser = true; # set password with passwd
    description = "Raul Catalan";
    extraGroups = [
      "docker"
    ];
    shell = pkgs.fish;
  };

  system.stateVersion = "26.05";
}
