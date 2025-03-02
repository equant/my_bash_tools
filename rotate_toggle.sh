#!/bin/bash

ROTATION=$(xrandr --verbose | grep "^DP-1 connected" | awk '{print $6}')

if [ "$ROTATION" = "normal" ]; then
  xrandr --output DP-1 --rotate left
else
  xrandr --output DP-1 --rotate normal
fi

