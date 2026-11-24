#!/bin/sh
set -eu

# These are the built-in analog card's ports, not USB or Bluetooth devices.
sink=alsa_output.pci-0000_00_1f.3.analog-stereo
source=alsa_input.pci-0000_00_1f.3.analog-stereo

case "${1:-}" in
  laptop)
    input=analog-input-internal-mic
    output=analog-output-speaker
    ;;
  speakers)
    input=analog-input-internal-mic
    output=analog-output-headphones
    ;;
  headset)
    input=analog-input-headset-mic
    output=analog-output-headphones
    ;;
  *)
    echo "Usage: $0 {laptop|speakers|headset}" >&2
    exit 1
    ;;
esac

pactl set-source-port "$source" "$input"
pactl set-sink-port "$sink" "$output"
