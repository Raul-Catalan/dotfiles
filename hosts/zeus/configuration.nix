{
  inputs,
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
    ../../modules/nixos/system/nix-ld.nix
    ../../modules/nixos/hardware/amdcpu.nix
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/desktop/default.nix
    ../../modules/nixos/virtualisation/docker.nix
  ];

  # --- Networking ---
  networking.hostName = "zeus"; # Define your hostname.

  # --- User ---
  # Defined in modules/nixos/user.nix (shared); desktop groups (networkmanager,
  # wheel) are added by modules/nixos/desktop/default.nix.

  system.stateVersion = "26.05";
}
