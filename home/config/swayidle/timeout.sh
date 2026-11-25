#!/bin/sh

brightnessctl --device=asus::kbd_backlight --save set 0
swaymsg "output * power off"
