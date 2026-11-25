#!/usr/bin/env bash
dir="$(dirname "$(realpath "$0")")"
printf '%s : %s\n' "$dir/keybindings.json" "${XDG_CONFIG_HOME:-$HOME/.config}/Code/User/keybindings.json"
