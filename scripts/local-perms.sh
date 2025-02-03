PWD=$(pwd)

find "$PWD" -type d | grep -v .git | xargs -L1 sudo chmod 755
find "$PWD" -type f | grep -v .git | xargs -L1 sudo chmod 666
find "$PWD" | grep -v .git | xargs -L1 sudo chown jasonw:users 