#!/usr/bin/env bash

JSON=$(curl -s "https://api.github.com/repos/magefree/mage/releases/latest")
VER=$(echo "$JSON" | jq -r ".tag_name")
URL=$(echo "$JSON" | jq -r ".assets[0].browser_download_url")
XMAGE_OVERLAY="./overlays/xmage.nix"

sed -i -E "s/(\s\sversion\s=\s\")(.*)(\")/\1$VER\2/" $XMAGE_OVERLAY;
sed -i -E "s/(\s\surl\s=\s\")(.*)(\")/\1$URL\2/" $XMAGE_OVERLAY;    