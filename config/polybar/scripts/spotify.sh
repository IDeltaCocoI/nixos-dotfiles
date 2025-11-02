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

NEXT=""
PREV=""

ARTIST=$(playerctl --player=spotify metadata artist 2>/dev/null)
TITLE=$(playerctl --player=spotify metadata title 2>/dev/null | sed 's/ *(.*)//')

# DURATION_US=$(playerctl --player=spotify metadata mpris:length 2>/dev/null)
# POSITION_S=$(playerctl --player=spotify position 2>/dev/null)
# DURATION_S=$(awk -v d="$DURATION_US" 'BEGIN {printf "%.2f", d/1000000}')

# Barre de progression (commentée)
# BAR_LENGTH=5
# PROGRESS=$(awk -v pos="$POSITION_S" -v dur="$DURATION_S" -v len="$BAR_LENGTH" 'BEGIN {
#     filled=int(pos/dur*len)
#     empty=len-filled
#     if(filled>len) filled=len
#     bar=""
#     for(i=0;i<filled;i++) bar=bar "■"
#     for(i=0;i<empty;i++) bar=bar "□"
#     print bar
# })

# echo "  $ARTIST - $TITLE $PROGRESS  "
echo "$PREV $ICON $NEXT  "
