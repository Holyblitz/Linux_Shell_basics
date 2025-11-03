# Bash Network Admin Kit

Un kit minimaliste pour administrer le réseau sous Linux en **Bash** (Arch/Debian).
Contenu : fiches mémo + scripts sûrs (lecture/diagnostic) avec explications.

## Structure
- `docs/` : fiches mémo (commandes, SSH, firewall, logs)
- `scripts/` : scripts Bash prêts à l'emploi
- `quickstart.md` : guide rapide

## Utilisation rapide
```bash
cd scripts
chmod +x *.sh
# Exemples :
./net_info.sh
./ping_sweep.sh -n 192.168.1.0/24 -t 0.3
./port_scan.sh -h 192.168.1.10 -p 22,80,443
./iface_toggle.sh -i eth0 --down && ./iface_toggle.sh -i eth0 --up
./wifi_scan.sh   # si `nmcli` ou `iw` disponibles
```

> ⚠️ Certains scripts peuvent nécessiter `sudo` selon votre configuration.
> Tous les scripts tentent d'être *safe-by-default* (diagnostic et actions explicites seulement).