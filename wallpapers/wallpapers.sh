#!/bin/sh

IMG="hollow_knight.png"
SETTER="feh --bg-scale"
DIR="$HOME/nixos-dotfiles/wallpapers/"
CACHE="$HOME/.cache/current_wallpaper"

if [ "$IMG" != "" ]; then
    $SETTER "$DIR$IMG"
    exit 0
fi

OLD_IMAGE=""
if [ -f "$CACHE" ]; then
    OLD_IMAGE=$(cat "$CACHE")
fi

IMAGE="$OLD_IMAGE"
while [ "$IMAGE" = "$OLD_IMAGE" ]; do
    IMAGE=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)
done

$SETTER "$IMAGE"

echo "$IMAGE" > "$CACHE"

exit 0
