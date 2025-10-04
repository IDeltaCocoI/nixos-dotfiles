#!/bin/sh

while true; do
    SECONDS=0
    while [ $SECONDS -lt 3000 ];do
        if ! pgrep i3lock; then
            exit
        fi
    done
    killall i3lock
done
