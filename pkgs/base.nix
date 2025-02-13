{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ rsync rclone wget sops gpg jq unzip fd parted libimobiledevice usbmuxd git];
}