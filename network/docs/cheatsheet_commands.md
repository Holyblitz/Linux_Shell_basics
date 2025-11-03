# Commandes réseau utiles (cheat-sheet)

## Interfaces & IP
- `ip addr` / `ip a` : adresses IP
- `ip link` : interfaces & état UP/DOWN
- `ip route` : table de routage
- `hostname -I` : IP(s) locales
- `resolvectl status` (systemd-resolved) / `cat /etc/resolv.conf` : DNS

## Connexions & ports
- `ss -tulpen` : sockets TCP/UDP ouverts (processus)
- `ss -tp` : connexions TCP actives
- `nc -vz <hôte> <port>` : test d'ouverture de port
- `telnet <hôte> <port>` : test basique (si installé)

## Découverte & tests
- `ping -c 4 <hôte>` : reachabilité
- `traceroute <hôte>` / `tracepath <hôte>` : chemin réseau
- `arp -n` / `ip neigh` : voisins L2
- `dig <nom>` / `nslookup <nom>` : requêtes DNS

## Wi‑Fi
- `nmcli dev wifi list` : scan Wifi (NetworkManager)
- `iw dev` / `iw dev <iface> scan` : info/scan bas niveau (sudo)
- `wpa_cli status` : état wpa_supplicant

## Pare-feu
- `sudo nft list ruleset` : règles nftables
- `sudo ufw status verbose` : état UFW (si utilisé)

## Logs
- `journalctl -u NetworkManager --since=today`
- `journalctl -k` (messages noyau)
- `dmesg | grep -iE 'eth|wlan|link|mtu'`