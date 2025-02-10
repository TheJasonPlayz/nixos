{ pkgs, ... }:

let 
  majorVersion = "1.4.56";
  majorVersionRevision = "2";
  minorVersion = "dev_2025-02-08_17-37";
in 
(final: prev: 
  final.pkgs.xmage.overrideAttrs (finalAttrs: prevAttrs: {
    version = "${majorVersion}-${minorVersion}";

    src = pkgs.fetchurl {
      url = "https://github.com/magefree/mage/releases/download/xmage_${majorVersion}V${majorVersionRevision}/mage-full_${finalAttrs.version}.zip";
      sha256 = "sha256-g72hKCzmG/cn2q+10HP5uFxiERKLV/nDZ1RJKMKWr+0=";
    };
  })
)
