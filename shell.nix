{ pkgs, ... }:

pkgs.mkShell {
  packages = [
    (pkgs.python313.withPackages (python-pkgs: with python-pkgs; [
      requests
    ]))
  ];
}