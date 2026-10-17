#!/usr/bin/env bash
set -euo pipefail

common_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
samsung_dir="$(dirname "$common_dir")"

if [[ "$(basename "$common_dir")" != sm8550-common || "$(basename "$samsung_dir")" != samsung ]]; then
  echo "Place this repository at device/samsung/sm8550-common first." >&2
  exit 1
fi

for device in dm1q dm2q dm3q q5q; do
  link="$samsung_dir/$device"
  target="sm8550-common/devices/$device"
  if [[ -e "$link" || -L "$link" ]]; then
    if [[ ! -L "$link" || "$(readlink "$link")" != "$target" ]]; then
      echo "Refusing to replace existing device tree: $link" >&2
      exit 1
    fi
  else
    ln -s "$target" "$link"
  fi
done
