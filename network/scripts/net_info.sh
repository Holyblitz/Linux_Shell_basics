#!/usr/bin/env bash
set -euo pipefail

color() { tput setaf "$1"; }
reset() { tput sgr0; }

echo "==== $(hostname) — Network Info ($(date '+%F %T')) ===="

echo
echo "$(color 6)[Interfaces]$(reset)"
ip -brief addr || ip addr

echo
echo "$(color 6)[Liens]$(reset)"
ip -brief link

echo
echo "$(color 6)[Route]$(reset)"
ip route || true

echo
echo "$(color 6)[DNS]$(reset)"
if command -v resolvectl >/dev/null 2>&1; then
  resolvectl status | sed -n '1,60p'
else
  cat /etc/resolv.conf || true
fi

echo
echo "$(color 6)[Ports ouverts]$(reset)"
if command -v ss >/dev/null 2>&1; then
  ss -tulpen | sed -n '1,60p'
elif command -v netstat >/dev/null 2>&1; then
  netstat -tulpen | sed -n '1,60p'
else
  echo "Ni ss ni netstat trouvés."
fi