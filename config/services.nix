{ pkgs, lib, config, ... }:

{
  services = {
    openssh.enable = true;
    rsyncd.enable = true;
  };
  programs.direnv.enable = true;
}