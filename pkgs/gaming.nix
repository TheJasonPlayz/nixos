{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    prismlauncher
    razergenie
    protonup-qt
    lutris
    heroic
    forge-mtg
    xmage
  ];
}