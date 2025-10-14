#!/usr/bin/env bash

SETTER="feh --bg-scale"
DIR="$HOME/nixos-dotfiles/wallpapers"
IMAGE=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

$SETTER "$IMAGE"

