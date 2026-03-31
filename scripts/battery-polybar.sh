#!/bin/bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

# Vertical-style icons (better visual progression)
if [ "$battery" -ge 85 ]; then icon=""
elif [ "$battery" -ge 60 ]; then icon=""
elif [ "$battery" -ge 40 ]; then icon=""
elif [ "$battery" -ge 20 ]; then icon=""
else icon=""
fi

# Color logic
if [ "$battery" -ge 60 ]; then
    color="#00ff00"   # green
elif [ "$battery" -ge 25 ]; then
    color="#ff8800"   # orange (instead of yellow)
else
    color="#ff0000"   # red
fi

# Charging override
if [ "$status" = "Charging" ]; then
    icon=""
fi

echo "%{F$color}$icon $battery%%%{F-}"
