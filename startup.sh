#!/bin/bash
# --- Launch xwinwrap wallpaper ---
sleep 2
xwinwrap -b -s -fs -st -sp -nf -fdt -- \
mpv -wid WID --loop --no-audio $HOME/Videos/AnimatedWallpapers/Windmills.mp4 &

# Wait a moment for xwinwrap to initialize
sleep 1

# --- Launch a tiny dummy window to trigger Cinnamon Desktop stacking ---
xterm -geometry 1x1+0+0 -e "sleep 0.1" >/dev/null 2>&1 &

# Optional: force Desktop focus just in case
wmctrl -a "Desktop" >/dev/null 2>&1
