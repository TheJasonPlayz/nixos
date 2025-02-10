let 
  version = "";
  url = "";
in 
final: prev: {
  xmage = prev.xmage.overrideAttrs (finalAttrs: prevAttrs: {
    version = "${majorVersion}-${minorVersion}";

    src = final.fetchurl {
      url = "https://github.com/magefree/mage/releases/download/xmage_${majorVersion}V${majorVersionRevision}/mage-full_${finalAttrs.version}.zip";
      sha256 = "sha256-g72hKCzmG/cn2q+10HP5uFxiERKLV/nDZ1RJKMKWr+0=";
    };

    installPhase = builtins.replaceStrings ["1.4.50"] [ majorVersion ] prevAttrs.installPhase;
  });
}
