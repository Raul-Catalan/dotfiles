{ username, ... }:
{
  # OpenSSH for remote administration. Primary access is expected to be over
  # Tailscale (incl. Tailscale SSH), but keeping a key-only sshd gives you a
  # fallback and works on the local network during bootstrap.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Add your public key(s) here so you can log in. Until Tailscale SSH is up,
  # use the Proxmox web console (noVNC) or local-network SSH with this key.
  users.users.${username}.openssh.authorizedKeys.keys = [
    # "ssh-ed25519 AAAA...your-key... raul@zeus"
  ];
}
