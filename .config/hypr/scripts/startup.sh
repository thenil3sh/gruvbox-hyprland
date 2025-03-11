#!/usr/bin/bash

# variables
export hypr_config=$HOME/.config/hypr
scripts=$hypr_config/scripts

# waybar
"$scripts/waybar.sh" &

# wallpaper set to cloud.png
swww init && swww img $HOME/.config/hypr/wallpapers/home-sweet-home.jpg --transition-type center --transition-fps 60 --transition-speed 16

# effects
$scripts/rgb &

# other
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
