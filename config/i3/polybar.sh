#!/usr/bin/env bash

# Only for my laptop
sleep 1
polybar ghost &
if xrandr | grep -q "eDP-1 connected"; then
    polybar i3_bar_laptop
else
    polybar i3_bar
fi
