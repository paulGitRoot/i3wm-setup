#!/bin/bash

# Get brightness (percentage)
brightness=$(brightnessctl get)
max=$(brightnessctl max)
percent=$((brightness * 100 / max))

# Clamp function (just in case)
if [ "$percent" -lt 1 ]; then percent=1; fi
if [ "$percent" -gt 100 ]; then percent=100; fi

# Icon logic
if [ "$percent" -ge 80 ]; then icon="󰃠"
elif [ "$percent" -ge 60 ]; then icon="󰃟"
elif [ "$percent" -ge 40 ]; then icon="󰃝"
elif [ "$percent" -ge 20 ]; then icon="󰃞"
else icon="󰃜"
fi

echo "$icon $percent%"
