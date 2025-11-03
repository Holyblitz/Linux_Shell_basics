# Pare-feu (UFW & nftables) — aperçu

## UFW (simple)
- État : `sudo ufw status verbose`
- Autoriser SSH : `sudo ufw allow 22/tcp`
- Interdire : `sudo ufw deny 22/tcp`
- Activer : `sudo ufw enable`  |  Désactiver : `sudo ufw disable`

## nftables (avancé)
- Lister : `sudo nft list ruleset`
- Fichier conf : `/etc/nftables.conf`
- Activer service : `sudo systemctl enable --now nftables`

> ⚠️ Toujours tester les règles sur une session alternative pour éviter de se *lock-out*.