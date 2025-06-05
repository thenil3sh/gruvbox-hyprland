#! /bin/bash

# Exit if slurp is already in use
if pgrep slurp > /dev/null; then
  notify-send "Can't screenshot" "Slurp appears to be in use" --icon=path-exclusion -t 3000
  exit 1;
fi

# If regional capture is requested
if [[ "$1" == "region" ]]; then
  icon="image-crop"
  region="-g $(slurp)" 
else
  icon="view-fullscreen"
fi \
|| notify-send "Selection Cancelled" "Screenshot wasn't taken" --icon=image-crop && exit 0;
# If selection cancleed ^

# Finally capture, screenshot
grim $region - | wl-copy && \
wl-paste > ~/Pictures/Screenshots/Screenshot-"$(date +%F_%T)".png && \
notify-send 'Screenshot takens' 'Image copied to clipboard' --icon=$icon -t 5000
