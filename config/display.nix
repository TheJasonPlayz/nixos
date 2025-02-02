{ config, lib, pkgs, ... }: 

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    # displayManager.setupCommands = [];
    desktopManager.plasma6.enable = true;
    desktopManager.plasma6.enableQt5Integration = true;
    xkb = {
      layout = "us,us,jp";
      variant = ",intl,";
    };
  };
}