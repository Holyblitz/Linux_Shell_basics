# Guide pratique : cron (planification de tâches Linux)

## 🧩 Introduction
`cron` est un outil Linux permettant d’exécuter automatiquement des commandes ou scripts à intervalles réguliers.  
Les tâches planifiées sont définies dans le fichier **crontab** (CRON TABle).

---

## ⚙️ 1. Gérer la crontab

### 📋 Afficher la crontab actuelle
```bash
crontab -l
```

### ✍️ Éditer la crontab
```bash
crontab -e
```

### 🗑️ Supprimer la crontab
```bash
crontab -r
```

---

## 🕒 2. Syntaxe d’une tâche cron
Chaque ligne correspond à une tâche avec le format suivant :
```
# ┌──────── minute (0 - 59)
# │ ┌────── heure (0 - 23)
# │ │ ┌──── jour du mois (1 - 31)
# │ │ │ ┌── mois (1 - 12)
# │ │ │ │ ┌ jour de la semaine (0 - 7, 0 et 7 = dimanche)
# │ │ │ │ │
# * * * * * commande_à_exécuter
```

### ✅ Exemple :
Sauvegarde automatique chaque jour à 22h :
```bash
0 22 * * * /home/romain/scripts/backup.sh
```

---

## 🧠 3. Exemples utiles
- Exécuter un script chaque minute :
  ```bash
  * * * * * /home/romain/test.sh
  ```
- Nettoyer un dossier chaque dimanche à minuit :
  ```bash
  0 0 * * 0 rm -rf /tmp/*
  ```
- Lancer un script Python chaque jour à 9h :
  ```bash
  0 9 * * * /usr/bin/python3 /home/romain/scripts/update_data.py
  ```

---

## ⚡ 4. Bonnes pratiques
1. Toujours utiliser des **chemins absolus** dans les commandes cron.  
2. Tester d’abord ton script manuellement avant de l’ajouter à cron.  
3. Rediriger la sortie pour déboguer :
   ```bash
   0 22 * * * /home/romain/backup.sh >> /home/romain/logs/cron.log 2>&1
   ```
4. Vérifier les logs avec :
   ```bash
   grep CRON /var/log/syslog
   ```

---

## 🧩 5. Cron spécial : @keywords
| Mot-clé | Description | Exemple |
|----------|--------------|----------|
| `@reboot` | Au démarrage du système | `@reboot /home/romain/startup.sh` |
| `@daily` | Chaque jour (00:00) | `@daily backup.sh` |
| `@hourly` | Chaque heure | `@hourly logrotate` |
| `@weekly` | Chaque semaine | `@weekly cleanup.sh` |

---

**Auteur : Romain — Automatisation sous Linux (Datacamp Series)**  
**Compatibilité : Debian, Arch, Ubuntu, Mint**
