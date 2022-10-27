#!/usr/bin/bash

# Must have trailing '/'
SAVE_DIR="$HOME/Pictures"
CURRENT_TIME=$(date +"%B %d, %Y - %-I:%M:%S %p")
FILE_NAME="Screenshot on $CURRENT_TIME.png"

maim -s | tee "$SAVE_DIR/$FILE_NAME" | xclip -selection clipboard -t image/png 
notify-send "Took a screenshot" "$SAVE_DIR/$FILE_NAME" -a "scrot" -i "$SAVE_DIR/$FILE_NAME"
#meh "$SAVE_DIR/$FILE_NAME" & disown

