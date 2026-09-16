#!/usr/bin/env bash

SCREEN="eDP-1"

CURRENT=$(xrandr --query | grep "^$SCREEN" | awk '{print $5}')

if [ "$CURRENT" = "inverted" ]; then
    xrandr --output "$SCREEN" --rotate normal
else
    xrandr --output "$SCREEN" --rotate inverted
fi
