{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # Examples:
    # ../../modules/nixos/hardware/nvidia.nix
    # ../../hosts/common/default.nix
    ../../modules/nixos/system/bootloader.nix
    ../../modules/nixos/system/default.nix
    ../../modules/nixos/desktop/default.nix
  ];

  networking.hostName = "hermes"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # Maybe refactor this somewhere else?
  # dotfiles/users/raul/default.nix?
  # or dotfiles/hosts/common/users/raul/default.nix?
  users.users."raul" = {
    isNormalUser = true;
    description = "Raul Catalan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # NEED TO REMOVE ONCE WE INTERGRATE NOCTALIA LOGIN
  # Ly Display Manager as backup
  services.displayManager.ly.enable = true;

  system.stateVersion = "26.05";
}
