#!/usr/bin/env bash
dir="$(dirname "$(realpath "$0")")"
for skill in $(ls "$dir/skills"); do
  printf '%s : %s\n' "$dir/skills/$skill" "$HOME/.agents/skills/$skill"
done
