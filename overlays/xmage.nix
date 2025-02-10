let 
  version = "xmage_1.4.56V3";
  url = "https://github.com/magefree/mage/releases/download/xmage_1.4.56V3/mage-full_1.4.56-dev_2025-02-09_16-07.zip";
  installPhaseVer = pkgs: ver: pkgs.lib.substring 6 (builtins.stringLength version - 3) (builtins.replaceStrings ["b"] [""] version);
in 
final: prev: {
  xmage = prev.xmage.overrideAttrs (finalAttrs: prevAttrs: {
    inherit version;

    src = final.fetchurl {
      inherit url;
      sha256 = "";
    };


    installPhase = builtins.replaceStrings ["1.4.50"] [ (installPhaseVer final version) ] prevAttrs.installPhase;
  });
}
