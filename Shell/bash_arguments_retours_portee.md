# Arguments, Valeurs de Retour et Portée en Bash

## 🧩 1. Les Arguments

Quand on appelle une fonction ou un script Bash, on peut lui passer des **arguments** accessibles via des variables positionnelles :

| Variable | Description |
|-----------|-------------|
| `$0` | Nom du script ou de la fonction |
| `$1`, `$2`, ... | Premier, deuxième argument, etc. |
| `$@` | Tous les arguments |
| `$#` | Nombre d’arguments reçus |

### Exemple
```bash
dire_bonjour() {
  echo "Bonjour $1 ! Tu es dans le dossier $2."
}

dire_bonjour "Romain" "/home/romain"
```
➡️ Résultat :
```
Bonjour Romain ! Tu es dans le dossier /home/romain.
```

💡 Pour itérer sur tous les arguments :
```bash
for arg in "$@"; do
  echo "Argument : $arg"
done
```

---

## ⚙️ 2. Les Valeurs de Retour

Une fonction Bash peut renvoyer une valeur de deux manières :

### a) Avec `echo` (pour capturer la sortie)
```bash
addition() {
  echo $(($1 + $2))
}

result=$(addition 3 7)
echo "Résultat : $result"
```
➡️ `echo` renvoie une valeur dans la **sortie standard (stdout)**.

### b) Avec `return` (code d’état)
```bash
verifier_nombre() {
  if [ $1 -gt 0 ]; then
    return 0   # succès
  else
    return 1   # échec
  fi
}

verifier_nombre -3
echo $?  # Affiche 1 → échec
```
💡 `$?` contient le **dernier code de retour** exécuté.

⚠️ `return` ne peut renvoyer qu’un **entier entre 0 et 255**.

---

## 🧠 3. La Portée des Variables

Toutes les variables Bash sont **globales** par défaut.

### Exemple
```bash
nom="Romain"

changer_nom() {
  nom="Jean"
}

changer_nom
echo "$nom"  # Jean → la variable globale a été modifiée
```

### Pour rendre une variable locale :
```bash
nom="Romain"

changer_nom() {
  local nom="Jean"
  echo "À l'intérieur : $nom"
}

changer_nom
echo "À l'extérieur : $nom"
```
➡️ Résultat :
```
À l'intérieur : Jean
À l'extérieur : Romain
```

Toujours utiliser `local` dans une fonction pour éviter d’écraser une variable globale.

---

## 🧱 4. Exemple Complet

```bash
#!/bin/bash

calculer_somme() {
  local total=$(( $1 + $2 ))
  echo $total
}

afficher_resultat() {
  local res=$(calculer_somme $1 $2)
  echo "La somme de $1 et $2 est $res"
}

afficher_resultat 3 7
```
➡️ Résultat :
```
La somme de 3 et 7 est 10
```

---

## 🔁 5. Résumé

| Élément | Description | Exemple |
|----------|--------------|----------|
| `$1`, `$@`, `$#` | Arguments passés | `ma_fonction "A" "B"` |
| `echo` | Retourne du texte (capturable) | `res=$(fonction)` |
| `return` | Retourne un code (0 = OK) | `return 1` |
| `$?` | Dernier code de retour | `echo $?` |
| `local` | Variable locale | `local var=42` |

---
**Auteur :** Romain  
**Fichier :** `bash_arguments_retours_portee.md`
