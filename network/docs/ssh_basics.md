# SSH — bases rapides

## Client
- `ssh user@hote` : connexion simple
- `ssh -p 2222 user@hote` : port non standard
- `ssh -i ~/.ssh/id_ed25519 user@hote` : clé spécifique
- `scp fichier user@hote:~/` : copie
- `rsync -avh --progress src/ user@hote:dst/` : synchro robuste

## Clés
- `ssh-keygen -t ed25519 -C "romain@host"`
- Ajouter la clé : `ssh-copy-id user@hote`

## Config (~/.ssh/config)
```
Host monserveur
  HostName 1.2.3.4
  User romain
  Port 22
  IdentityFile ~/.ssh/id_ed25519
```
Usage : `ssh monserveur`