{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    dorian
    gparted
    anki-bin
    obsidian
  ];
}