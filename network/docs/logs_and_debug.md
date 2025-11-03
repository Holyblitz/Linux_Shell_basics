# Logs & Debug réseau

- `journalctl -u NetworkManager --since '1 hour ago'`
- `journalctl -u systemd-networkd --since today`
- `journalctl -k | tail -n 100`
- `sudo tcpdump -i <iface> port 53` (capture DNS, nécessite `tcpdump` & sudo)
- `resolvectl query <nom>` / `resolvectl status` (systemd-resolved)

Astuce : `sudo script -f /var/log/net_diag.session` pour enregistrer une session de debug.