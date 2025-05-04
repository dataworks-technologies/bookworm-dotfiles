#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Map monitors to bar names
declare -A monitor_bars=(
    ["DP-6"]="primary"
    ["DP-4"]="secondary-left"
    ["DP-0"]="secondary-right"
)

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    bar=${monitor_bars[$m]}
    if [ -n "$bar" ]; then
        MONITOR=$m polybar --reload "$bar" &
    else
        echo "Warning: No bar defined for monitor $m"
    fi
done
