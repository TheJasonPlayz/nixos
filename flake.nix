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
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
    inputs@{ nixpkgs, home-manager, flake-parts, ... }: 
    let
      system = "x86_64-linux";
      timeZone = "America/Denver";
      username = "jasonw";
      nixosSystem = nixpkgs.lib.nixosSystem;
      serverPkgs = [
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        # }
        ./pkgs/base.nix
        ./pkgs/k8s.nix
        # ./pkgs/gaming.nix
        # ./pkgs/gui.nix
        # ./pkgs/programming.nix
      ];
      laptopPkgs = [
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        # }
        ./pkgs/base.nix
        ./pkgs/k8s.nix
        ./pkgs/gaming.nix
        ./pkgs/gui.nix
        ./pkgs/programming.nix
      ];
      pcPkgs = [
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        # }
        ./pkgs/base.nix
        # ./pkgs/k8s.nix
        ./pkgs/gaming.nix
        ./pkgs/gui.nix
        ./pkgs/programming.nix
      ];  
    in {
      nixosConfigurations = {
        pc = nixosSystem {
          inherit system;
          modules = [
            ./config/audio.nix
            ./config/display.nix
            ./config/users.nix { inherit username; }
            ./hosts/pc/boot.nix
            ./hosts/pc/hardware.nix
            ./hosts/pc/software.nix
            pcPkgs
            ({pkgs, ...}: 
              {
                networking.hostName = "${username}-pc";
                time.timeZone = timeZone;
                # environment.systemPackages = with pkgs; [ nixd nixfmt-rfc-style vscodium git ];
                # home-manager.users.${username}.imports = {
                #   
                # }
              })
          ];
        };
        laptop1 = nixosSystem {
          inherit system;
          modules = [
            ./config/audio.nix
            ./config/display.nix
            ./config/users.nix { inherit username; }
            ./config/k8s.nix
            ./hosts/laptop/boot.nix
            ./hosts/laptop/hardware.nix
            ./hosts/laptop/software.nix
            laptopPkgs
            ({pkgs, ...}: {
                networking.hostName = "${username}-laptop1";
                time.timeZone = timeZone;
                # home-manager.users.${username}.imports = {
                #   
                # }
            })
          ];
        };
        laptop2 = nixosSystem {
          inherit system;
          modules = [
            ./config/users.nix { inherit username; }
            ./config/k8s.nix
            serverPkgs
            ./hosts/server/boot.nix
            ./hosts/server/hardware.nix
            ./hosts/server/software.nix
            ({pkgs, ...}: {
              networking.hostName = "${username}-laptop2";
              time.timeZone = timeZone;
              # home-manager.users.${username}.imports = {
              #   
              # }
            })
          ];
        };
      };
      };
}
