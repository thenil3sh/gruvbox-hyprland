#!/usr/bin/bash

# variables
export hypr_config=$HOME/.config/hypr
scripts=$hypr_config/scripts

# waybar
"$scripts/waybar.sh" &

# wallpaper set to cloud.png

# effects
$scripts/rgb &

# polkit authentication agent 
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# other
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
