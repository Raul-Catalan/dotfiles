let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
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
}
