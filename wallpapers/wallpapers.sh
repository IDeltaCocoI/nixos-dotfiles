#!/bin/sh

IMG="hollow_knight.png"
SETTER="feh --bg-scale"
DIR="$HOME/nixos-dotfiles/wallpapers/"
IMAGE=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

if [ "$IMG" != "" ]; then
    $SETTER "$DIR$IMG"
else
    $SETTER "$IMAGE"
fi

