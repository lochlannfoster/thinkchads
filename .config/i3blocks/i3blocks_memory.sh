#!/bin/bash
# i3blocks_memory.sh
# Displays memory usage with custom colors.
# RAM used will be in #ad0012 and RAM free in #58b748.

read used free < <(free -m | awk '/^Mem:/ {print $3, $4}')
echo "<span foreground=\"#ad0012\">RAM used: ${used}MB</span> <span foreground=\"#58b748\">RAM free: ${free}MB</span>"
exit 0

