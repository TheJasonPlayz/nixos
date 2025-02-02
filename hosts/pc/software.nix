{ config, lib, pkgs, ... }:

{
  security.rtkit.enable = true;

  networking = {
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
    dhcpcd.enable = true;
  };

  programs = {
    firefox.enable = true;
    steam.enable = true;
    droidcam.enable = true;
    # obs-studio.enableVirtualCamera = true;
  };

  services = {
    openssh.enable = true;
  };
}