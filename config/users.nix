{ pkgs, lib, config, ... }:

{
  users.users.jasonw = {
    isNormalUser = true;
    description = "Jason Whitman";
    extraGroups = [ "networkmanager" "wheel" ]; 
  };
}