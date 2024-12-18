#!/bin/sh

# Set keyboard layout
setxkbmap gb

# Set background wallpaper
feh --bg-scale ~/Media/Wallpapers/micro.jpg

# Enable redshift for color temperature adjustment
redshift -O 5000 &

# Start Picom (compositor for transparency, etc.)
picom --config ~/.config/picom.conf &

# Run dwmblocks in the background
~/.dwmblocks/dwmblocks &

# Start dwm as the window manager
exec dwm
