#!/bin/sh

if swaymsg -t get_outputs -r | grep -q '"power": true'; then
    "$HOME/.config/swayidle/timeout.sh"
else
    "$HOME/.config/swayidle/resume.sh"
fi