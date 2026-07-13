{ inputs, pkgs, ... }:
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
    ./hardware-configuration.nix
    ../../modules/nixos/system/default.nix
    ../../modules/nixos/system/bootloader.nix
    ../../modules/nixos/system/audio.nix
    ../../modules/nixos/system/fonts.nix
    ../../modules/nixos/system/nix-ld.nix
    ../../modules/nixos/desktop/default.nix
    ../../modules/nixos/virtualisation/docker.nix
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
      "docker"
    ];
    shell = pkgs.fish;
  };

  services.displayManager.ly.enable = true;
  system.stateVersion = "26.05";
}
