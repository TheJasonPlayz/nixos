{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    gparted
    anki-bin
    obsidian
    adobe-reader
  ];
}