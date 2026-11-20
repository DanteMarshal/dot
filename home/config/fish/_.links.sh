#!/usr/bin/env bash
dir="$(dirname "$(realpath "$0")")"
printf '%s : %s\n' "$dir/config.fish" "${XDG_CONFIG_HOME:-$HOME/.config}/fish/config.fish"
for function_file in "$dir/functions/"*; do
  function_name="$(basename "$function_file")"
  printf '%s : %s\n' "$dir/functions/$function_name" "${XDG_CONFIG_HOME:-$HOME/.config}/fish/functions/$function_name"
done
