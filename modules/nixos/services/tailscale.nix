{ ... }:
{
  # Tailscale mesh VPN. This is how we reach the host, so there's no need to
  # expose anything else to the public network.
  services.tailscale = {
    enable = true;
    openFirewall = true; # opens UDP 41641 for the WireGuard tunnel

    # "none"   - plain node (default, what we use here)
    # "server" - advertise subnet routes and/or act as an exit node
    # "client" - use subnet routes / exit nodes advertised by others
    useRoutingFeatures = "none";

    # Declarative auth would set `authKeyFile` here, but that needs a secret on
    # disk (agenix/sops). For now we join the tailnet manually on first boot:
    #
    #   sudo tailscale up --ssh
    #
    # The --ssh flag enables Tailscale SSH so you can administer the box over
    # the tailnet without managing SSH keys.
  };

  # Trust the tailnet interface so services on this host are reachable from
  # other machines on your Tailscale network without extra firewall rules.
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
}
