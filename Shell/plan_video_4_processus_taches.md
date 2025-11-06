
# 🐚 Shell – Processus et Tâches Système

## 1️⃣ Introduction

Aujourd’hui, on explore le cœur de Linux : **les processus et la gestion des tâches**.  
Chaque commande, chaque application correspond à un **processus**, avec un identifiant unique (PID).  
Comprendre comment les surveiller, les mettre en pause, ou les arrêter fait partie des compétences essentielles d’un utilisateur avancé.

---

## ⚙️ 2️⃣ Comprendre les processus

Un **processus** est une instance d’un programme en cours d’exécution.  
Chaque processus possède :  
- un **PID** (Process ID)  
- un **PPID** (Parent Process ID)

### Commandes de base :
```bash
ps
ps -ef
ps aux
```

---

## 📊 3️⃣ Surveiller les processus

### `top` — vue dynamique :
```bash
top
```
> Permet de surveiller l’utilisation du CPU et de la mémoire en temps réel.

### `htop` — version améliorée :
```bash
sudo apt install htop
htop
```
> Interface interactive pour trier, filtrer et tuer des processus plus facilement.

---

## 🧩 4️⃣ Avant-plan et arrière-plan

### Commandes clés :
```bash
sleep 30 &     # Lance en arrière-plan
jobs           # Liste des tâches
fg %1          # Ramène en avant-plan
bg %1          # Envoie en arrière-plan
kill %1        # Termine le job
```

> Le symbole `&` permet de continuer à utiliser le terminal pendant l’exécution du processus.

---

## 🔁 5️⃣ Gérer les processus

### Identifier un processus :
```bash
ps aux | grep firefox
```

### Terminer un processus :
```bash
kill <PID>
kill -9 <PID>  # Force la fermeture
```

### Modifier la priorité :
```bash
nice -n 10 ./script.sh
sudo renice -5 <PID>
```

> Plus la valeur du *nice* est basse, plus le processus est prioritaire.

---

## 🧱 6️⃣ Cas pratique : script de test

### Exemple de script `boucle.sh` :
```bash
#!/bin/bash
while true; do
  echo "Processus actif..."
  sleep 2
done
```

### Exécution :
```bash
bash boucle.sh &
ps aux | grep boucle
kill <PID>
```

---

## 🧠 7️⃣ Bonus : Signaux et États

| Signal | Nom | Description |
|---------|------|-------------|
| `1` | SIGHUP | Redémarre le processus |
| `9` | SIGKILL | Tue immédiatement |
| `15` | SIGTERM | Termine proprement |
| `19` | SIGSTOP | Met en pause |
| `18` | SIGCONT | Reprend |

### Commandes :
```bash
kill -STOP <PID>  # Met en pause
kill -CONT <PID>  # Reprend
```

---

## 🎬 8️⃣ Conclusion

Les processus sont la base de la gestion système sous Linux.  
Savoir les manipuler, les surveiller et les prioriser, c’est savoir **gérer la vie du système en direct**.

Prochaine étape : **le monitoring système complet (ressources CPU, RAM, réseau, disque)**.

---

© 2025 Romain — Linux Shell Basics  
📂 GitHub : [https://github.com/Holyblitz/Linux_Shell_basics](https://github.com/Holyblitz/Linux_Shell_basics)
