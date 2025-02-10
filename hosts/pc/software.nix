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
    droidcam.enable = true;
    chromium.enable = true;
    # obs-studio.enableVirtualCamera = true;
  };

  services = {
    usbmuxd.enable = true;
    foundryvtt = {
      enable = true;
      hostName = "jasonw-pc";
      minifyStaticFiles = true;
      proxyPort = 443;
      proxySSL = true;
      upnp = true;
      package = inputs.foundryvtt.packages.${pkgs.system}.foundryvtt_12;
    };
  };
}