#!/usr/bin/env bash
p_dot="$(dirname "$(realpath "$0")")"
source "$p_dot/utility/functions.bash" || exit

_normalize_link_path() {
  local ret="$1"
  ret="${ret#"${ret%%[![:space:]]*}"}"
  ret="${ret%"${ret##*[![:space:]]}"}"
  case "$ret" in
    \"*\"|\'*\') ret="${ret:1:${#ret}-2}" ;;
  esac
  printf "%s" "$ret"
}

_apply_links_from() {
  local links link src dst
  links=$(bash "$1") || return
  while IFS= read -r -u 3 link || [[ -n "$link" ]]; do
    [[ "$link" =~ ^[[:space:]]*$ ]] && continue
    if [[ "$link" != *:* ]]; then
      printf 'ERROR: Expected source : destination in %s: %s\n' "$1" "$link" >&2
      return 1
    fi
    IFS=: read -r src dst <<< "$link"
    src=$(_normalize_link_path "$src")
    dst=$(_normalize_link_path "$dst")
    if [[ -z "$src" || -z "$dst" ]]; then
      printf 'ERROR: Empty source or destination in %s: %s\n' "$1" "$link" >&2
      return 1
    fi
    ensure_symlink "$src" "$dst" || return
  done 3<<< "$links"
}

main() {
  local link_file
  while IFS= read -r -d '' -u 4 link_file; do
    _apply_links_from "$link_file" || return
  done 4< <(find "$p_dot" -type f -name "_.links.sh" -print0)
}

main "$@"
