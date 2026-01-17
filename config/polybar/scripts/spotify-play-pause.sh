#!/usr/bin/env bash

if ! playerctl --player=spotify status &>/dev/null; then
    echo ""
    exit 0
fi

STATUS=$(playerctl --player=spotify status 2>/dev/null)

if [ "$STATUS" = "Playing" ]; then
    ICON=""
else
    ICON=""
fi

echo " $ICON "
