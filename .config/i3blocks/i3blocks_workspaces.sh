#!/bin/bash
# i3blocks_workspaces.sh
# Displays workspace names; focused workspaces are wrapped in brackets.
# Requires: i3-msg and jq

workspaces_json=$(i3-msg -t get_workspaces)
output=""
for ws in $(echo "$workspaces_json" | jq -r '.[] | @base64'); do
    _jq() {
        echo "${ws}" | base64 --decode | jq -r "${1}"
    }
    name=$(_jq '.name')
    focused=$(_jq '.focused')
    if [ "$focused" = "true" ]; then
        output+="[<span foreground=\"#1AFF00\">$name</span>] "
    else
        output+="<span foreground=\"#1AFF00\">$name</span> "
    fi
done

# Use printf (with no trailing newline) to output the final result.
printf "%s" "$output"
exit 0

