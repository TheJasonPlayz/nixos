{ inputs, pkgs, ... }:

{
  security.rtkit.enable = true;

  networking = {
    networkmanager.enable = true;
    dhcpcd.enable = true;
  };

  programs = {
    firefox.enable = true;
    steam.enable = true;
    # obs-studio.enableVirtualCamera = true;
  };

  services = {
    openssh.enable = true;
    foundryvtt = {
      enable = true;
      hostName = "jasonw-pc";
      minifyStaticFiles = true;
      proxyPort = 443;
      proxySSL = true;
      upnp = true;
      package = inputs.foundryvtt.packages.${pkgs.system}.foundryvtt_12;
    };
    blueman.enable = true;
    xrdp = {
      enable = true;
      openFirewall = true;
      defaultWindowManager = "startplasma-x11";
    };
  };
}
