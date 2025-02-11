{ config, lib, pkgs, ... }:

{
  security.rtkit.enable = true;

  networking = {
    networkmanager.enable = true;
    dhcpcd.enable = true;
  };

  programs = {
    firefox.enable = true;
    steam.enable = true;
    # obs-studio.enableVirtualCamera = true;
  };

  services = {
    openssh.enable = true;
    blueman.enable = true;
  };
}
