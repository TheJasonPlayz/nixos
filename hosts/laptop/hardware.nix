{ config, lib, pkgs, ... }:

{
  /* GPU / Graphics */

  hardware.graphics.enable32Bit = true;

  /* Audio */
  hardware.pulseaudio.enable = true;

  /* Peripherals */ 

  /* Time */
  time.timeZone = "America/Denver";
}