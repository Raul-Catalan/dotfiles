{
  username,
  ...
}: {
  imports = [
    ../modules/home/cli/default.nix
    ../modules/home/nixvim.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };
}
