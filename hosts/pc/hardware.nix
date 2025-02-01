{ config, lib, pkgs, ... }:

{
  /* GPU / Graphics */
  hardware.amdgpu = {
    opencl.enable = true;
    amdvlk.enable = true;
    initrd.enable = true;
  };
  hardware.graphics.enable32Bit = true;

  /* Audio */
  hardware.pulseaudio.enable = true;

  /* Peripherals */ 
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ "jasonw" ];

  /* Time */
  time.timeZone = "America/Denver";
}