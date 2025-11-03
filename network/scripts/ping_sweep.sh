#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 -n <CIDR|prefix.lan> [-t timeout_seconds]" >&2
  echo "Ex:   $0 -n 192.168.1.0/24 -t 0.3" >&2
  exit 1
}

NET=""
TO=0.2
while getopts ":n:t:" opt; do
  case "$opt" in
    n) NET="$OPTARG" ;;
    t) TO="$OPTARG" ;;
    *) usage ;;
  esac
done
[ -z "$NET" ] && usage

# Utilise nmap si dispo, sinon ping simple sur /24
if command -v nmap >/dev/null 2>&1; then
  nmap -sn --host-timeout 1s "$NET"
else
  # Attendu: préfixe style 192.168.1.0/24 ou 192.168.1
  if [[ "$NET" =~ ^([0-9]+\.[0-9]+\.[0-9]+) ]]; then
    base="${BASH_REMATCH[1]}"
    for i in $(seq 1 254); do
      ping -c 1 -W 1 "${base}.${i}" >/dev/null 2>&1 && echo "UP  ${base}.${i}" || true
    done
  else
    echo "Format sans nmap non supporté. Installez nmap ou passez un préfixe /24."
    exit 2
  fi
fi