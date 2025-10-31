# 🧠 Les Fonctions en Bash

**Date :** 2025-10-30

---

## 🎯 Objectif
Comprendre comment créer, appeler et structurer des **fonctions en Bash**, afin de rendre ses scripts plus modulaires et réutilisables.

---

## 🧩 1. Définition d’une fonction Bash

Une fonction Bash peut être déclarée de deux manières :

```bash
# Syntaxe classique
function dire_bonjour {
  echo "Bonjour Romain !"
}

# Syntaxe simplifiée
dire_bonjour() {
  echo "Bonjour Romain !"
}
```

➡️ Pour exécuter la fonction :
```bash
dire_bonjour
```

---

## ⚙️ 2. Passage d’arguments

Les arguments sont transmis comme dans un script Bash classique :

```bash
saluer() {
  echo "Salut $1, tu es dans le dossier $2"
}

saluer "Romain" "/home/romain"
```

| Variable | Rôle |
|-----------|------|
| `$1`, `$2`, `$3` | Accès aux arguments |
| `$@` | Tous les arguments |
| `$#` | Nombre d’arguments reçus |

---

## 🔁 3. Retour d’une valeur

Deux manières :

### a) Afficher avec `echo` (valeur de sortie capturable)
```bash
addition() {
  echo $(($1 + $2))
}

resultat=$(addition 3 7)
echo "Le résultat est $resultat"
```

### b) Retourner un code d’état
```bash
verifier_nombre() {
  if [ $1 -gt 0 ]; then
    return 0   # Succès
  else
    return 1   # Erreur
  fi
}
```

---

## 🧠 4. Exemple complet

```bash
#!/bin/bash

verifier_fichier() {
  if [ -f "$1" ]; then
    echo "✅ Le fichier $1 existe."
  else
    echo "❌ Le fichier $1 n'existe pas."
  fi
}

verifier_fichier "/etc/passwd"
```

---

## 🧱 5. Organisation recommandée

Par convention :
- Les fonctions sont **déclarées en haut du script**
- Le code principal est ensuite exécuté en dessous

```bash
#!/bin/bash

backup_dossier() {
  cp -r "$1" "$2"
  echo "Backup de $1 vers $2 terminé."
}

backup_dossier "/home/romain/Documents" "/home/romain/Backups"
```

---

## 🧰 6. Fonctions + boucles = puissance 💪

```bash
deplacer_fichiers() {
  for file in "$1"/*; do
    mv "$file" "$2"
  done
}

deplacer_fichiers "downloads" "archives"
```

---

## 💬 Résumé

| Élément | Description | Exemple |
|----------|--------------|----------|
| `function nom { ... }` | Déclare une fonction | `function hello { echo hi; }` |
| `$1`, `$2`, `$@` | Arguments | `saluer "Romain"` |
| `return n` | Code de sortie | `return 1` |
| `echo` | Retourner une valeur | `echo "Hello"` |
| Appel | Exécuter la fonction | `hello` |

---

## 🧩 7. Mini-exercices

1. Crée une fonction `afficher_date` qui affiche la date et l’heure actuelles.
2. Crée une fonction `compter_fichiers` qui affiche le nombre de fichiers dans un dossier donné.
3. Crée une fonction `backup` qui copie tous les fichiers `.txt` d’un dossier vers un sous-dossier `backup/`.

---

## 🧭 8. Où écrire les fonctions ?

| Situation | Où écrire ? | Commande pour lancer |
|------------|-------------|----------------------|
| Test rapide | Terminal interactif | `ma_fonction arg1 arg2` |
| Script durable | Fichier `.sh` | `bash script.sh` ou `./script.sh` |

---

**Auteur :** Romain  
**Section :** Apprentissage Shell / Bash Basics
