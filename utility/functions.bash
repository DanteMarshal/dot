# Usage: choice=$(prompt TEXT [EXPECTED]); uppercase marks the Enter default.
# Prints the zero-based choice index; prompts go to stderr.
prompt() {
  local text=$1 expected=${2-nY} default='' ch i
  for ((i = 0; i < ${#expected}; i++)); do
    ch=${expected:i:1}
    if [[ $ch == [[:upper:]] ]]; then
      default=${ch,,}
      break
    fi
  done
  expected=${expected,,}

  printf '%s' "$text" >&2
  for ((i = 0; i < ${#expected}; i++)); do
    if ((i == 0)); then
      printf ' (' >&2
    else
      printf ' / ' >&2
    fi
    ch=${expected:i:1}
    if [[ $ch == "$default" ]]; then
      ch=${ch^^}
    fi
    printf '%s' "$ch" >&2
  done
  if [[ -n $expected ]]; then
    printf ')' >&2
  fi

  while true; do
    if ! IFS= read -r -s -n 1 ch; then
      printf '\nERROR: Could not read a prompt response.\n' >&2
      return 1
    fi
    if [[ -z $ch && -n $default ]]; then
      ch=$default
    fi
    for ((i = 0; i < ${#expected}; i++)); do
      if [[ $ch == "${expected:i:1}" ]]; then
        printf '%s\n' "$i"
        return 0
      fi
    done
  done
}

# Usage: ensure_symlink [--sudo] [--optional] SOURCE DESTINATION
# Creates a relative symlink;
# - Declining an optional link succeeds, but declining replacement of an existing destination fails. Directories are never removed.
# - `--sudo` runs filesystem checks and commands through sudo; prompts stay local.
ensure_symlink() {
  local -a run=()
  local optional=false
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --sudo)
        run=(sudo)
        ;;
      --optional)
        optional=true
        ;;
      *)
        break
        ;;
    esac
    shift
  done
  local src=$1 dst=$2 target choice question parent
  if "${run[@]}" test -L "$dst" && "${run[@]}" test -e "$dst" && "${run[@]}" test "$dst" -ef "$src"; then
    printf 'Already Exists: %s --> %s\n' "$dst" "$src"
    return 0
  fi
  parent=$("${run[@]}" dirname -- "$dst") || return
  target=$("${run[@]}" realpath -m -s --relative-to="$parent" -- "$src") || return
  if [[ $optional == true ]]; then
    choice=$(prompt "Create Symlink '$target' at '$dst' --> '$src' ?") || return
    if [[ $choice == 0 ]]; then
      return 0
    fi
  fi

  if "${run[@]}" test -L "$dst" || "${run[@]}" test -e "$dst"; then
    if "${run[@]}" test -L "$dst" && ! "${run[@]}" test -e "$dst"; then
      question="Dangling link found at '$dst'; Remove ?"
    elif "${run[@]}" test -L "$dst"; then
      question="'$dst' exists and is a symlink but doesn't resolve to '$src'; Overwrite ?"
    else
      question="'$dst' exists and is not a symlink"
    fi
    choice=$(prompt "$question") || return
    if [[ $choice != 1 ]]; then
      printf "ERROR: Destination '%s' already exists; replacement declined.\n" "$dst" >&2
      return 1
    fi
    if "${run[@]}" test -L "$dst" && ! "${run[@]}" test -e "$dst"; then
      printf 'Removing dangling symlink: %s\n' "$dst"
    fi
    "${run[@]}" unlink -- "$dst" || return
  fi

  printf "Creating Symlink '%s' at '%s' --> '%s'\n" "$target" "$dst" "$src"
  "${run[@]}" mkdir -p -- "$parent" || return
  "${run[@]}" ln -sT -- "$target" "$dst"
}
