#!/bin/bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

# Icons
if [ "$battery" -ge 85 ]; then icon=""
elif [ "$battery" -ge 60 ]; then icon=""
elif [ "$battery" -ge 40 ]; then icon=""
elif [ "$battery" -ge 20 ]; then icon=""
else icon=""
fi

# ⚡ Charging override (highest priority)
if [ "$status" = "Charging" ]; then
    color="#a020f0"   # purple
    icon=""

# 🤍 Above 85% (not charging)
elif [ "$battery" -ge 85 ]; then
    color="#ffffff"   # white

# 🟢 Normal ranges
elif [ "$battery" -ge 60 ]; then
    color="#00ff00"   # green

# 🟠 Medium
elif [ "$battery" -ge 25 ]; then
    color="#ff8800"   # orange

# 🔴 Low
else
    color="#ff0000"   # red
fi

echo "%{F$color}$icon $battery%%{F-}"
