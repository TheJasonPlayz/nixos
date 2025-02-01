NIXOS_DIR=/etc/nixos/
COPY_DIR=$(pwd)
SCRIPT_DIR="$COPY_DIR/scripts"

read -p "To or from $NIXOS_DIR (anything else: to) (1: from)" direction
read -p "Switch? (n/anything else): " switch

if [[ "$direction" -eq 1 ]] then
  sudo rsync -rua --exclude=scripts/ "$NIXOS_DIR/" "$COPY_DIR"
else
  sudo rsync -rua --exclude=scripts/ "$COPY_DIR/" "$NIXOS_DIR"
fi

find "$COPY_DIR" -type d | xargs -L1 sudo chmod 777
find "$COPY_DIR" -type f | xargs -L1 sudo chmod 666
find "$COPY_DIR" | xargs -L1 sudo chown jasonw:users 

sudo chmod -R 666 ./*
sudo chown -R jasonw:users ./
sudo chmod -R 777 "$SCRIPT_DIR"

if [[ "$switch" != "n" ]] then
  sudo nixos-rebuild switch
fi

