{ pkgs, lib, config, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "Jason Whitman";
    extraGroups = [ "networkmanager" "wheel" ]; 
    openssh.authorizedKeys.keyFiles = [ config.sops.secrets."ssh/id_ed25519_pub".path ];
  };
}