{
  description = "Hyprland on NixOs";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Remember to add inputs below as we add them
  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      hermes = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/hermes/hardware-configuration.nix
          ./hosts/hermes/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.raul = import ./home/default.nix;
          }
        ];
      };
    };
  };
}
