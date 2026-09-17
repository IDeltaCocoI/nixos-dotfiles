#!/usr/bin/env bash

if ! playerctl --player=spotify status &>/dev/null; then
    echo ""
    exit 0
fi

echo "$1"
