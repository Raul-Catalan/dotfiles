{...}: {
  imports = [
    ../modules/home/cli/default.nix
    ../modules/home/nixvim.nix
  ];

  home = {
    username = "raul";
    homeDirectory = "/home/raul";
    stateVersion = "26.05";
  };
}
