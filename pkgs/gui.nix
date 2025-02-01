{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    libreoffice-qt6
    gparted
    vscodium
  ];
}