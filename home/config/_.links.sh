#!/usr/bin/env bash
dir="$(dirname "$(realpath "$0")")"
printf '%s : %s\n' "$dir/kitty" "${XDG_CONFIG_HOME:-$HOME/.config}/kitty"
printf '%s : %s\n' "$dir/opencode" "${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
printf '%s : %s\n' "$dir/sway" "${XDG_CONFIG_HOME:-$HOME/.config}/sway"
