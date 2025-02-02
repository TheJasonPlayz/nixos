{ config, lib, pkgs, ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/f1dd5b31-d987-4d01-a226-84c8c8fad884";
      fsType = "ext4";
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/05f07eec-5305-4006-9eee-1a5840592ea4";
      fsType = "xfs";
    };
    "/boot" = {
      device = "dev/disk/by-partuuid/c913de29-e9e7-4b88-bdfd-321cf6f50b31";
      fsType = "vfat";
    };
  };

  boot.supportedFilesystems = {
    xfs = true;
  };
  boot.loader = {
    timeout = 15;
    efi.canTouchEfiVariables = true;
  };
}