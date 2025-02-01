{ config, lib, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    useDHCP = true;
    dhcpcd.enable = true;
  };

  services = {
    ssh.enable = true;
  };
}