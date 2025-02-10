{ pkgs, lib, config, ... }:

{
  nixpkgs.overlays = [ (import ../overlays/xmage.nix)];
}