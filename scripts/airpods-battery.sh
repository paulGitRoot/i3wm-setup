#!/bin/bash

# Try to extract battery info (may vary by device)
battery=$(bluetoothctl info | grep -i "Battery" | awk '{print $2}')

if [ -z "$battery" ]; then
    echo "AirPods: N/A"
else
    echo "AirPods: ${battery}%"
fi
