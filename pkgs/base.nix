{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [ pinentry-qt rsync rclone wget sops jq unzip fd parted libimobiledevice usbmuxd git];
}