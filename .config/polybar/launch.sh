#!/usr/bin/env bash

killall -q polybar

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1 | sort -r); do
        MONITOR=$m polybar --reload example 2>&1 | tee -a /tmp/polybar-$m.log &
        disown
        echo "Polybar launched on monitor $m"
    done
else
    polybar --reload example 2>&1 | tee -a /tmp/polybar.log &
    disown
    echo "Polybar launched"
fi
