{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    kubectl
    helm
    k0sctl
    anki-sync-server
  ];
} 