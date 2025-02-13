{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    gparted
    anki-bin
    obsidian
  ];
}