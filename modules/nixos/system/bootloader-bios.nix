{ pkgs, ... }:
{
  # Legacy BIOS / SeaBIOS boot (this Proxmox VM is not UEFI). systemd-boot
  # requires UEFI, so this host uses GRUB installed to the disk's MBR instead.
  # Counterpart to system/bootloader.nix (which is the UEFI / systemd-boot one).
  boot.loader.grub = {
    enable = true;
    # The whole DISK, not a partition. Verify on the VM with `lsblk`
    # (virtio_blk disks are /dev/vda; SATA/SCSI are /dev/sda).
    device = "/dev/vda";
  };

  # Use the latest kernel, matching the other hosts.
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
