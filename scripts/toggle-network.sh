#!/bin/bash

if pgrep -f "impala-nm" > /dev/null; then
    pkill -f "impala-nm"
else
    kitty -e impala-nm &
fi
