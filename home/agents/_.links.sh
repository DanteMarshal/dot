#!/usr/bin/env bash
dir="$(dirname "$(realpath "$0")")"
for skill in $(ls "$dir/skills"); do
  echo "$dir/skills/$skill : $HOME/.agents/skills/$skill"
done
