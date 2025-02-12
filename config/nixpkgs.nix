{ pkgs, lib, config, ... }:

{
  nixpkgs.overlays = [ (import ../overlays/xmage.nix)];
  nixpkgs.config.permittedInsecurePackages = [
                "adobe-reader-9.5.5"
  ];
}
