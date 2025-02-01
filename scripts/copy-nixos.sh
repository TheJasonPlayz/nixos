NIXOS_DIR=/etc/nixos/
COPY_DIR=$(pwd)
SCRIPT_DIR="$COPY_DIR/scripts"

read -p "To or from $NIXOS_DIR (anything else: to) (1: from)" direction
read -p "Switch? (n/anything else): " switch

if [[ "$direction" -eq 1 ]] then
  sudo rsync -ru --exclude=scripts/ "$NIXOS_DIR/" "$COPY_DIR" --delete
else
  sudo rsync -ru --exclude=scripts/ "$COPY_DIR/" "$NIXOS_DIR" --delete
fi

if [[ "$switch" != "n" ]] then
  sudo nixos-rebuild switch
fi

