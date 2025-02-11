#!/usr/bin/env bash

NIXOS_DIR=/etc/nixos/
COPY_DIR=$(pwd)
SCRIPT_DIR="$COPY_DIR/scripts"

read -p "To or from $NIXOS_DIR (anything else: to) (1: from)" direction
read -p "Switch? (n/anything else): " switch

if [[ "$direction" = "1" ]] then
  sudo rsync -ru --exclude=scripts/ "$NIXOS_DIR/" "$COPY_DIR" --delete
else
  sudo rsync -ru --exclude=scripts/ "$COPY_DIR/" "$NIXOS_DIR" --delete
fi

if [[ "$switch" != "n" ]] then
  echo -e "Host Selection:\n(1). PC\n(2). Laptop 1\n(3). Laptop 2"; read host;
  case $host in
    "1")
      HOST="pc"
      ;;
    "")
      HOST="pc"
      ;;
    "2")
      HOST="laptop1"
      ;;
    "3")
      HOST="laptop2"
      ;;
  esac
  sudo nixos-rebuild switch --flake "/etc/nixos#$HOST" "$@"
fi

# ./sage-jupyter.sh