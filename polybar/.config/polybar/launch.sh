#!/usr/bin/env sh
## add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar across monitors
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -r basedbar -c ~/.config/polybar/config.ini &
    done
else
    polybar -r basedbar -c ~/.config/polybar/config.ini &
fi
