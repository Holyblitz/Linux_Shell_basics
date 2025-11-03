#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 -h <host> -p <ports_csv>" >&2
  echo "Ex:   $0 -h 192.168.1.10 -p 22,80,443" >&2
  exit 1
}

HOST=""
PORTS=""
while getopts ":h:p:" opt; do
  case "$opt" in
    h) HOST="$OPTARG" ;;
    p) PORTS="$OPTARG" ;;
    *) usage ;;
  esac
done
[ -z "$HOST" ] && usage
[ -z "$PORTS" ] && usage

IFS=',' read -ra arr <<< "$PORTS"
if ! command -v nc >/dev/null 2>&1; then
  echo "nc (netcat) non trouvé. Installez-le." >&2
  exit 2
fi

for port in "${arr[@]}"; do
  if nc -z -w2 "$HOST" "$port" 2>/dev/null; then
    echo "OPEN   $HOST:$port"
  else
    echo "CLOSED $HOST:$port"
  fi
done