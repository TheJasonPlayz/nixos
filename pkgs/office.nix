{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libreoffice-qt6
  ];
}