{ inputs, pkgs, ... }:

{
  security.rtkit.enable = true;

  networking = {
    networkmanager.enable = true;
    dhcpcd.enable = true;
    extraHosts = ''
      10.0.0.4 mage-server
    '';
  };

  programs = {
    firefox.enable = true;
    steam.enable = true;
    droidcam.enable = true;
    chromium.enable = true;
    gnupg = {
      agent = {
        enable = true;
        pinentryFlavor = "qt";
        enableSSHSupport = true;
      };
    };
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
    # onedrive.enable = true;
  };
}