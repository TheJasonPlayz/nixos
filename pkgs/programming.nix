{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    nixd
    nil
    nixfmt-rfc-style
    pyenv
    fnm
  ];
}