#!/usr/bin/env bash
set -euo pipefail

usage(){ echo "Usage: $0 -i <iface> [--up|--down]"; exit 1; }

IFACE=""
ACTION=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    -i) IFACE="$2"; shift 2;;
    --up|--down) ACTION="$1"; shift;;
    *) usage;;
  esac
done

[ -z "${IFACE:-}" ] && usage
[ -z "${ACTION:-}" ] && usage

if ! ip link show "$IFACE" >/dev/null 2>&1; then
  echo "Interface introuvable: $IFACE" >&2
  exit 2
fi

if [[ "$ACTION" == "--down" ]]; then
  sudo ip link set "$IFACE" down && echo "DOWN $IFACE"
elif [[ "$ACTION" == "--up" ]]; then
  sudo ip link set "$IFACE" up && echo "UP   $IFACE"
fi