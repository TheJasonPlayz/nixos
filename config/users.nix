{ pkgs, lib, config, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "Jason Whitman";
    extraGroups = [ "networkmanager" "wheel" ]; 
  };
}