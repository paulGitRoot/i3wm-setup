#!/bin/bash

battery_info=$(acpi -b)

# Extract battery level
battery_level=$(echo "$battery_info" | grep -o '[0-9]\+%' | tr -d '%')

# Check charging status
status=$(echo "$battery_info" | awk '{print $3}' | tr -d ',')

# Exit if cannot read battery
[ -z "$battery_level" ] && exit 0

# Exit if charging
if [[ "$status" == "Charging" ]]; then
    rm -f /tmp/battery_low_notified
    rm -f /tmp/battery_critical_notified
    exit 0
fi

# 🔴 Critical (≤5%)
if [ "$battery_level" -le 5 ]; then
    if [ ! -f /tmp/battery_critical_notified ]; then
        notify-send -u critical -i battery-caution \
        "Battery Critical" "Battery at ${battery_level}% ⚠️"
        touch /tmp/battery_critical_notified
    fi

# 🟠 Low (≤10%)
elif [ "$battery_level" -le 10 ]; then
    if [ ! -f /tmp/battery_low_notified ]; then
        notify-send -u normal -i battery-low \
        "Battery Low" "Battery at ${battery_level}% 🔋"
        touch /tmp/battery_low_notified
    fi

# Reset when battery goes back up
else
    rm -f /tmp/battery_low_notified
    rm -f /tmp/battery_critical_notified
fi
