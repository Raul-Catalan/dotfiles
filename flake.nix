{
  description = "Hyprland on NixOs";
  inputs = {
    # unstable for latest kernal + nvidia
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # user/dotfile management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    /*
      # secret management (age-encrypted secrets in git)
      agenix = {
        url = "github:ryantm/agenix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    */

    # Noctalia
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs"; # this line is optional, prevents downloading two versions of nixpkgs but disables cache
    };

    # Noctalia Greeter
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # AMD CPU Microcode Updates
    ucodenix = {
      url = "github:e-tho/ucodenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Lenovo Thinkpad Carbon X1 11th gen
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Remember to add inputs below as we add them
  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        hermes = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/hermes/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.raul = import ./home/hermes.nix;
                backupFileExtension = "backup";
              };
            }
            nixos-hardware.nixosModules.lenovo-thinkpad-x1-11th-gen
          ];
        };
        zeus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/zeus/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.raul = import ./home/zeus.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };
      };
    };
}
