# Quickstart

1. Décompressez le kit.
2. Rendez les scripts exécutables : `chmod +x scripts/*.sh`
3. Lancez `./net_info.sh` pour un diagnostic global.
4. Explorez les docs dans `docs/` pour les commandes détaillées.

## Dépendances possibles
- `ip`, `ss`, `ping`, `nc` (netcat), `awk`, `sed`, `grep`
- Optionnels : `nmcli` (NetworkManager), `iw`/`iwlist`, `nmap` (non requis), `ufw`/`nft`

## Bonnes pratiques
- Toujours tester en lecture (audit) avant d'agir.
- Versionnez vos scripts (git) et commentez vos changements.
- Conservez des logs (`tee`, `script`, `journalctl`).