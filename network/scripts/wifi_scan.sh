#!/usr/bin/env bash
set -euo pipefail

if command -v nmcli >/dev/null 2>&1; then
  nmcli dev wifi list
elif command -v iw >/dev/null 2>&1; then
  IFACE=$(iw dev | awk '/Interface/ {print $2; exit}')
  if [ -n "$IFACE" ]; then
    sudo iw dev "$IFACE" scan | egrep -i '(ssid|signal|freq)'
  else
    echo "Aucune interface Wi-Fi trouvée (iw)"
  fi
else
  echo "Ni nmcli ni iw trouvés. Installez l'un des deux."
  exit 2
fi