#!/bin/sh

# Set keyboard layout
setxkbmap gb

# Set background wallpaper
feh --bg-scale ~/Media/wallpapers/micro.jpg

# Start Picom (compositor for transparency, etc.)
picom --config ~/.config/picom.conf &

# Run dwmblocks in the background
~/.dwmblocks/dwmblocks &

# Enable redshift for color temperature adjustment
redshift -O 5000 &

# Start the notifications daemon
dunst &

# Start dwm as the window manager
exec dwm
