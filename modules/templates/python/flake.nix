{
  description = "Python 3 dev environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        (pkgs.python3.withPackages (
          python-pkgs: with python-pkgs; [
            requests
            pandas
            numpy
            #scikit-learn
          ]
        ))
        # cowsay
        # wget
        # any other nixpkgs
      ];

      shellHook = ''
        echo "$(python --version) dev env loaded."
      '';
    };
  };
}
