{pkgs, ...}: {
  # Nerd Fonts
  # Maybe move this into a fonts.nix file in common
  fonts = {
    fontconfig.enable = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      inter
      paratype-pt-sans
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };
}
