{ ... }:
{
  # This host runs inside a Proxmox (QEMU/KVM) virtual machine.
  #
  # The QEMU guest agent lets Proxmox report the VM's IP address and perform
  # graceful shutdown/reboot from the web UI. Remember to also tick
  # "QEMU Guest Agent" in the VM's Options tab in Proxmox.
  services.qemuGuest.enable = true;
}
