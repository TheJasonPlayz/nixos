{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = 
    inputs@{ self, nixpkgs, unstable, home-manager, flake-parts, }: 
    flake-parts.lib.mkFlake { inherit inputs; } {
      debug = true;

      systems = [ "x86_64-linux" ];

      perSystem = {config, ...}: { };

      flake = {
        nixosConfigurations = {
          nixos = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              (
                {pkgs, ...}: 
                {
                  networking.hostName = "jasonw-pc";
                  environment.systemPackages = with pkgs; [ nixd nixfmt-rfc-style vscodium git ];
                }
              )
              ./configuration.nix
              ./hardware.nix
            ];
          };
        };
      };
    };
}
