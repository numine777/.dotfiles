#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
#
## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar top &
#polybar bottom &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
  done
else
  polybar --reload top &
  polybar --reload bottom &
fi

echo "Bars launched..."
