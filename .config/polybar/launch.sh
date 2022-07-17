#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar -c ~/.config/polybar/config_styled --reload $1 &
	done
else
	polybar -c ~/.config/polybar/config_styled --reload $1 &
fi

echo "Bars launched..."
