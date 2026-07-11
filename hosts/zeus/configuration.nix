{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
    ./hardware-configuration.nix
    ../../modules/nixos/system/default.nix
    ../../modules/nixos/system/bootloader.nix
    ../../modules/nixos/system/audio.nix
    ../../modules/nixos/system/fonts.nix
    ../../modules/nixos/hardware/amdcpu.nix
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/desktop/default.nix
  ];

  # --- Networking ---
  networking.hostName = "zeus"; # Define your hostname.

  # --- User ---
  users.users."raul" = {
    isNormalUser = true; # set password with passwd
    description = "Raul Catalan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  system.stateVersion = "26.05";
}
