#!/usr/bin/env bash
dir="$(dirname "$(realpath "$0")")"
printf '%s : %s\n' "$dir/AGENTS.md" "${XDG_CONFIG_HOME:-$HOME/.config}/opencode/AGENTS.md"
printf '%s : %s\n' "$dir/cli.json" "${XDG_CONFIG_HOME:-$HOME/.config}/opencode/cli.json"
printf '%s : %s\n' "$dir/opencode.jsonc" "${XDG_CONFIG_HOME:-$HOME/.config}/opencode/opencode.jsonc"
