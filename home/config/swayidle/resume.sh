#!/bin/sh

swaymsg "output * power on"
brightnessctl --device=asus::kbd_backlight --restore
