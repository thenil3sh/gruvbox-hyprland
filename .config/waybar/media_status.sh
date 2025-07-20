#!/bin/bash
playerctl metadata -F -f '{{title}};{{playerName}};{{status}}' | while IFS=';' read -r title name status; do
    if [[ ${#title} > 30 ]]; then
        title="${title:0:30}.."
    fi
    jq -n -c \
        --arg title "${title}" \
        --arg tooltip "$name" \
        --arg name "$name" \
        '{ "text": $title, "alt": $name, "tooltip": $name, "class": "", "percentage": "" }'
done
