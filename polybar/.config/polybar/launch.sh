#!/usr/bin/env sh
## add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar main -c ~/.config/polybar/config.ini &
polybar secondary -c ~/.config/polybar/config.ini &
