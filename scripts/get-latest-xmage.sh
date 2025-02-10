#!/usr/bin/env bash

JSON=$(curl -s "https://api.github.com/repos/magefree/mage/releases/latest")
VER=$(echo "$JSON" | jq -r ".tag_name")
URL=$(echo "$JSON" | jq -r ".assets[0].browser_download_url")
OVERLAY_URL=$(echo "$URL" | sed "s_/_\\\/_gm" | sed "s/\./\\\./gm")
FILE=$(echo "$JSON" | jq -r ".assets[0].name")
SHA256=$(wget "$URL"; nix hash file "$FILE")
XMAGE_OVERLAY="./overlays/xmage.nix"

sed -i -E "s/(^\s\sversion\s=\s\")(.*)(\")/\1$VER\3/" $XMAGE_OVERLAY;
sed -i -E "s/(^\s\surl\s=\s\")(.*)(\")/\1$OVERLAY_URL\3/" $XMAGE_OVERLAY;
sed -i -E "s/(^\s{6}sha256\s=\s\")(.*)(\")/\1$SHA256\3/" $XMAGE_OVERLAY;