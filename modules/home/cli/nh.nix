{
  # nh cli tool for nixos
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/home/raul/dotfiles";
  };
}
