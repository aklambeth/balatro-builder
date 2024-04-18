#!/bin/sh
FILE=/mnt/gamefiles/Balatro.exe
if [ -f "$FILE" ]; then
    rm -r /usr/local/share/assets/gamefiles/balatro
    echo "unpacking $FILE"
    mkdir /usr/local/share/assets/gamefiles/balatro && cd /usr/local/share/assets/gamefiles/balatro && 7z x $FILE && chmod chmod -R a=rwx /usr/local/share/assets/gamefiles/balatro
else 
    echo "$FILE does not exist."
fi