#!/bin/bash
# i3blocks_battery.sh
# Displays the battery percentage (using BAT1 in this example).

BAT_PATH="/sys/class/power_supply/BAT1"
if [ -f "$BAT_PATH/capacity" ]; then
    capacity=$(cat "$BAT_PATH/capacity")
    status=$(cat "$BAT_PATH/status")
    if [ "$status" = "Charging" ]; then
    echo "<span foreground=\"#CC00FF\">BAT: ${capacity}%</span>"
    else
        echo "<span foreground=\"#CC00FF\">BAT: ${capacity}%</span>"
    fi
else
    echo "<span foreground=\"#1AFF00\">BAT: N/A</span>"
fi
exit 0

