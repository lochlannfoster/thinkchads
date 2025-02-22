#!/bin/bash
# i3blocks_wireless.sh
# Displays wireless connection information.
# Ensure the interface name (wlp3s0) is correct.

iface="wlp3s0"
link_info=$(/usr/sbin/iw dev "$iface" link 2>/dev/null)
if [ -z "$link_info" ]; then
    echo "<span foreground=\"#1AFF00\">WiFi: Disconnected</span>"
else
    essid=$(echo "$link_info" | awk -F ': ' '/SSID/ {print $2}')
    signal=$(echo "$link_info" | awk -F ': ' '/signal/ {print int($2)}')
    echo "<span foreground=\"#1AFF00\">WiFi: $essid (${signal}%)</span>"
fi
exit 0

