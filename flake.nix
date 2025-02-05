{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";

      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
    inputs@{ nixpkgs, lanzaboote, sops-nix,... }: 
    let
      system = "x86_64-linux";
      timeZone = "America/Denver";
      nixosSystem = nixpkgs.lib.nixosSystem;
      serverPkgs = [
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        # }
        sops-nix.nixosModules.sops
        ./pkgs/base.nix
        ./pkgs/k8s.nix
        # ./pkgs/gaming.nix
        # ./pkgs/gui.nix
        # ./pkgs/programming.nix
        # ./pkgs/multimedia.nix
        # ./pkgs/office.nix
        # ./pkgs/school.nix
      ];
      laptopPkgs = [
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        # }
        sops-nix.nixosModules.sops
        ./pkgs/base.nix
        ./pkgs/k8s.nix
        ./pkgs/gaming.nix
        ./pkgs/gui.nix
        ./pkgs/programming.nix
        # ./pkgs/multimedia.nix
        # ./pkgs/office.nix
        # ./pkgs/school.nix
      ];
      pcPkgs = [
        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        # }
        sops-nix.nixosModules.sops
        ./pkgs/base.nix
        # ./pkgs/k8s.nix
        ./pkgs/gaming.nix
        ./pkgs/gui.nix
        ./pkgs/programming.nix
        ./pkgs/multimedia.nix
        ./pkgs/office.nix
        ./pkgs/school.nix
      ];  
    in {
      nixosConfigurations = {
        pc = nixosSystem {
          inherit system;
          modules = [
            lanzaboote.nixosModules.lanzaboote
            ./config/nixos.nix
            ./config/audio.nix
            ./config/display.nix
            ./config/users.nix 
            ./hosts/pc/boot.nix
            ./hosts/pc/hardware.nix
            ./hosts/pc/software.nix
            ({pkgs, ...}: 
              {
                networking.hostName = "jasonw-pc";
                time.timeZone = timeZone;
                # environment.systemPackages = with pkgs; [ nixd nixfmt-rfc-style vscodium git ];
                # home-manager.users.${username}.imports = {
                #   
                # }
                boot.loader.systemd-boot.enable = nixpkgs.lib.mkForce false;
                boot.lanzaboote = {
                  enable = true;
                  pkiBundle = "/etc/secureboot";
                };
              })
          ] ++ pcPkgs;
        };
        laptop1 = nixosSystem {
          inherit system;
          modules = [
            ./config/audio.nix
            ./config/display.nix
            ./config/users.nix 
            ./config/k8s.nix
            ./config/nixos.nix
            ./hosts/laptop/boot.nix
            ./hosts/laptop/hardware.nix
            ./hosts/laptop/software.nix
            ({pkgs, ...}: {
                networking.hostName = "jasonw-laptop1";
                time.timeZone = timeZone;
                # home-manager.users.${username}.imports = {
                #   
                # }
            })
          ] ++ laptopPkgs;
        };
        laptop2 = nixosSystem {
          inherit system;
          modules = [
            ./config/users.nix 
            ./config/nixos.nix
            ./hosts/server/boot.nix
            ./hosts/server/hardware.nix
            ./hosts/server/software.nix
            ({pkgs, ...}: {
              networking.hostName = "jasonw-laptop2";
              time.timeZone = timeZone;
              # home-manager.users.${username}.imports = {
              #   
              # }
            })
          ] ++ serverPkgs;
        };
      };
      };
}
