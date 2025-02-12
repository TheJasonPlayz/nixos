{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ wget sops age jq unzip fd parted libimobiledevice usbmuxd git];
}