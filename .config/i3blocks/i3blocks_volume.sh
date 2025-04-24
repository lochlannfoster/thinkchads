#!/bin/bash

# Get the first percentage value (usually front-left)
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n1 | tr -d '%')

# Clamp to max 100 for display
[ "$volume" -gt 100 ] && volume=100

# Get mute status
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$mute" = "yes" ]; then
    echo "<span foreground='#AD0012'>🔇 MUTED</span>"
else
    echo "<span foreground='#1AFF00'>🔊 ${volume}%</span>"
fi

