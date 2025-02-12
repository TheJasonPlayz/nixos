{ pkgs, lib, config, ... }:

{
  services = {
    openssh.enable = true;
    rsyncd.enable = true;
  };
}