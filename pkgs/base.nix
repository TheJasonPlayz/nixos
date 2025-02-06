{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ fd sbctl parted ntfs3g libimobiledevice usbmuxd git];
}