{ config, lib, pkgs, ... }: 

{
  services.desktopManager = {
    plasma6.enableQt5Integration = true;
    plasma6.enable = true;
  };
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.gdm.enable = true;
    xkb = {
      layout = "us,us,jp";
      variant = ",intl,";
    };
  };
}
