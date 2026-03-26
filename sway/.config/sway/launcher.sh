#!/bin/bash
FOCUSED_OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
rofi -show drun -m "$FOCUSED_OUTPUT"
