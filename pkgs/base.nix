{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ sbctl parted ntfs3g libimobiledevice usbmuxd git];
}