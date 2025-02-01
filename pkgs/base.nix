{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ parted ntfs3g libimobiledevice usbmuxd ];
}