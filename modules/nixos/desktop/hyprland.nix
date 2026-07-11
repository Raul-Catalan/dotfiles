{ pkgs, ... }:
{
  # Ly Display Manager as backup
  services.displayManager.ly.enable = true;

  # Have to enable Hyprland at the OS Level
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
