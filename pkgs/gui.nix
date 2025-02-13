{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [vews
    vesktop
    gparted
    anki-bin
    obsidian
  ];
}