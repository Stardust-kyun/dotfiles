#!/bin/bash
if [[ $1 = "--full" ]]; then
maim -u | tee $HOME/Pictures/Screenshots/$(date +%F-%H%M%S)_maim.png | xclip -selection clipboard -t image/png && notify-send -i image-missing "Screenshot Taken" "Saved to \~/Pictures/Screenshots"
fi

if [[ $1 = "--part" ]]; then
maim -s -u | tee $HOME/Pictures/Screenshots/$(date +%F-%H%M%S)_maim.png | xclip -selection clipboard -t image/png && notify-send -i image-missing "Screenshot Taken" "Saved to \~/Pictures/Screenshots"
fi

# maim -u | xclip -selection clipboard -t image/png -i
