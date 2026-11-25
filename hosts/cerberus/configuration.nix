{username, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/system/default.nix

    # Boot: assumes the VM is UEFI (OVMF). systemd-boot requires UEFI. If your
    # VM was installed in legacy BIOS/SeaBIOS mode, swap this import for a GRUB
    # bootloader instead (check with `ls /sys/firmware/efi` on the VM: present
    # => UEFI).
    ../../modules/nixos/system/bootloader-bios.nix

    # Headless server bits
    ../../modules/nixos/virtualisation/proxmox-guest.nix
    ../../modules/nixos/services/openssh.nix
    ../../modules/nixos/services/tailscale.nix

    # Uncomment if this box should run containers:
    # ../../modules/nixos/virtualisation/docker.nix
  ];

  networking.hostName = "cerberus";

  # The shared user's login shell is fish (modules/nixos/user.nix), so enable it
  # at the OS level. On desktop hosts this comes from the desktop module; this
  # headless host enables it directly (same as WSL).
  programs.fish.enable = true;

  # User account lives in modules/nixos/user.nix (shared). This host does not
  # import the desktop module, so the user keeps the minimal base group set
  # (docker only) — like WSL.
  users.users.${username}.extraGroups = ["wheel"];

  # Set this to the NixOS release you installed from (check: `nixos-version`).
  # Keep it fixed afterwards; it is not a "latest" knob.
  system.stateVersion = "26.05";
}
