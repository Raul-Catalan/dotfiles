{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/dotfiles/wallpapers/black-hole.png"
        "~/dotfiles/wallpapers/clouds-3.png"
        "~/dotfiles/wallpapers/pixel-earth-vertical.png"
      ];
      wallpaper = [
        {
          # Maybe create a script to load a new wallpaper, in the exec-once with hyprctl hyprpaper preload, wallpaper
          monitor = "HDMI-A-1";
          path = "~/dotfiles/wallpapers/clouds-3.png";
        }
        {
          monitor = "HDMI-A-2";
          path = "~/dotfiles/wallpapers/pixel-earth-vertical.png";
          fit_mode = "contain";
        }
      ];
    };
  };
}
