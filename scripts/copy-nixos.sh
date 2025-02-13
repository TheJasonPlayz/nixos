#!/usr/bin/env bash

NIXOS_DIR=/etc/nixos/
COPY_DIR=$(pwd)
SCRIPT_DIR="$COPY_DIR/scripts"
COMMIT_MESSAGE="Updates"

nix develop

python ./scripts/latest-xmage.py;
git pull; git add -A;

read -p "To or from $NIXOS_DIR (anything else: to) (1: from)" direction;
read -p "Switch? (n/anything else): " switch;

if [[ "$direction" = "1" ]] then
  sudo rsync -ru --exclude=scripts/ "$NIXOS_DIR/" "$COPY_DIR" --delete;
else
  sudo rsync -ru --exclude=scripts/ "$COPY_DIR/" "$NIXOS_DIR" --delete;
fi

if [[ "$switch" != "n" ]] then
  prefix="jasonw";
  host=$(hostnamectl hostname);
  case $host in
    "$prefix-pc")
      HOST="pc"
      ;;
    "$prefix-laptop")
      HOST="laptop"
      ;;
    "$prefix-server1")
      HOST="server1"
      ;;
  esac
  sudo nixos-rebuild switch --flake "/etc/nixos#$HOST" "$@";
fi

git commit -m "$COMMIT_MESSAGE"; git push;

# ./sage-jupyter.sh