#!/usr/bin/env bash

killall -q polybar

if type "xrandr"; then
    IFS=$'\n'
    for e in $(xrandr --query | grep " connected"); do
        m=$(cut -d" " -f1 <<<$e)

        p=""
        if [ "$m" == "DP-0" ]; then
            p="right"
        fi

        MONITOR=$m TRAY_POS=$p polybar --reload example 2>&1 | tee -a /tmp/polybar-$m.log &
        disown

        echo "Polybar launched on monitor $m"
    done
    unset IFS
else
    polybar --reload example 2>&1 | tee -a /tmp/polybar.log &
    disown
    echo "Polybar launched"
fi
