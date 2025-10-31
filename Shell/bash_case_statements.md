# Instructions CASE en Bash

L’instruction `case` simplifie le traitement de plusieurs conditions possibles.

---

## 🔹 Syntaxe de base

```bash
case "$variable" in
  motif1)
    # commandes si correspond à motif1
    ;;
  motif2)
    # commandes si correspond à motif2
    ;;
  *)
    # commandes par défaut (optionnel)
    ;;
esac
```

---

## 🔹 Exemple 1 : Menu utilisateur

```bash
echo "Choisissez une option :"
echo "1. Lister les fichiers"
echo "2. Voir la date"
read -r choix

case "$choix" in
  1)
    ls
    ;;
  2)
    date
    ;;
  *)
    echo "Option inconnue"
    ;;
esac
```

---

## 🔹 Exemple 2 : Fichier selon extension

```bash
fichier="rapport.csv"

case "$fichier" in
  *.txt)
    echo "Fichier texte"
    ;;
  *.csv)
    echo "Fichier CSV"
    ;;
  *.sh)
    echo "Script Bash"
    ;;
  *)
    echo "Type inconnu"
    ;;
esac
```

---

## ✅ Bonne pratique

Toujours terminer chaque bloc `case` par `;;` pour éviter que l’exécution continue dans les blocs suivants.
