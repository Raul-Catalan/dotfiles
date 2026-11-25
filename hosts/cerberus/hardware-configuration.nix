# ============================================================================
# PLACEHOLDER — DO NOT SHIP AS-IS.
#
# Replace this entire file with the one generated ON the cerberus VM:
#
#   sudo nixos-generate-config         # writes /etc/nixos/hardware-configuration.nix
#   # copy that file's contents over this one
#
# The UUIDs below are fake; they let the flake *evaluate* but the VM will not
# boot until the real filesystem/boot device UUIDs are in place. The shape
# below is typical for a single-disk UEFI Proxmox VM (virtio disk, ext4 root,
# FAT32 ESP at /boot).
# ============================================================================
{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "xhci_pci"
    "virtio_pci"
    "virtio_scsi"
    "sd_mod"
    "sr_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/00000000-0000-0000-0000-000000000000";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0000-0000";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
