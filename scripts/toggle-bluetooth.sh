#!/bin/bash

if pgrep -f "bluetui" > /dev/null; then
    pkill -f "bluetui"
else
    kitty -e bluetui &
fi
