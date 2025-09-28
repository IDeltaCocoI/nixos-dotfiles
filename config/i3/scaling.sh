#!/usr/bin/env bash

# Only for my laptop
if xrandr | grep -q "eDP-1 connected"; then
  xrdb -merge <<< "Xft.dpi: 144"
  i3-msg restart
fi

