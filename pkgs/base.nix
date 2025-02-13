{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ rsync rclone wget sops gnupg jq unzip fd parted libimobiledevice usbmuxd git];
}