{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ rsync rclone wget sops age jq unzip fd parted libimobiledevice usbmuxd git];
}