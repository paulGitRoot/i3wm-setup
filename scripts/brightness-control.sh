#!/bin/bash

ACTION=$1

# Get current values
current=$(brightnessctl get)
max=$(brightnessctl max)

# Convert to percentage
percent=$((current * 100 / max))

# Apply action
if [ "$ACTION" = "up" ]; then
    percent=$((percent + 2))
elif [ "$ACTION" = "down" ]; then
    percent=$((percent - 2))
fi

# 🔒 HARD LIMITS
if [ "$percent" -lt 1 ]; then
    percent=1
elif [ "$percent" -gt 100 ]; then
    percent=100
fi

# Apply brightness safely
brightnessctl set "${percent}%"
