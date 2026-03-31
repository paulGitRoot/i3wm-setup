#!/bin/bash

battery_level=$(acpi -b | grep -o '[0-9]\+%' | tr -d '%')

if [ -z "$battery_level" ]; then
    exit 0
fi

if [ "$battery_level" -le 5 ]; then
    notify-send "Battery Critical" "Battery at ${battery_level}% ⚠️" -u critical
elif [ "$battery_level" -le 10 ]; then
    notify-send "Battery Low" "Battery at ${battery_level}% 🔋" -u normal
fi
