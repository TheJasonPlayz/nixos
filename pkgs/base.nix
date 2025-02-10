{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ jq unzip fd sbctl parted ntfs3g libimobiledevice usbmuxd git];
}