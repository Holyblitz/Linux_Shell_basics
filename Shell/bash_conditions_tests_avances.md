# Conditions et Tests Avancés en Bash

## ✅ 1. Structure de base `if / elif / else`

```bash
if [ condition ]; then
  # code si vrai
elif [ autre_condition ]; then
  # code si la deuxième condition est vraie
else
  # code sinon
fi
```

### Exemple :
```bash
age=20

if [ "$age" -ge 18 ]; then
  echo "Majeur"
else
  echo "Mineur"
fi
```
➡️ Résultat : `Majeur`

---

## ⚙️ 2. Opérateurs de comparaison

### a) Pour les **nombres**
| Opérateur | Signification | Exemple |
|------------|----------------|----------|
| `-eq` | égal à | `[ "$a" -eq "$b" ]` |
| `-ne` | différent de | `[ "$a" -ne "$b" ]` |
| `-lt` | inférieur à | `[ "$a" -lt "$b" ]` |
| `-le` | inférieur ou égal | `[ "$a" -le "$b" ]` |
| `-gt` | supérieur à | `[ "$a" -gt "$b" ]` |
| `-ge` | supérieur ou égal | `[ "$a" -ge "$b" ]` |

💡 Exemple :
```bash
a=10
b=5

if [ "$a" -gt "$b" ]; then
  echo "$a est plus grand que $b"
fi
```

---

### b) Pour les **chaînes de caractères**
| Opérateur | Signification | Exemple |
|------------|----------------|----------|
| `=` | égal à | `[ "$a" = "$b" ]` |
| `!=` | différent | `[ "$a" != "$b" ]` |
| `-z` | chaîne vide | `[ -z "$a" ]` |
| `-n` | chaîne non vide | `[ -n "$a" ]` |

💡 Exemple :
```bash
nom="Romain"

if [ -n "$nom" ]; then
  echo "Nom défini"
fi
```

---

### c) Pour les **fichiers et dossiers**
| Test | Signification |
|-------|----------------|
| `-e` | le fichier existe |
| `-f` | c’est un fichier régulier |
| `-d` | c’est un dossier |
| `-r` | le fichier est lisible |
| `-w` | le fichier est modifiable |
| `-x` | le fichier est exécutable |

💡 Exemple :
```bash
if [ -d "/home/romain" ]; then
  echo "Dossier trouvé"
fi
```

---

## 🔗 3. Les opérateurs logiques

| Opérateur | Signification | Exemple |
|------------|----------------|----------|
| `&&` | ET logique | `[ "$a" -gt 0 ] && [ "$b" -gt 0 ]` |
| `||` | OU logique | `[ "$a" -eq 0 ] || [ "$b" -eq 0 ]` |
| `!` | NON logique | `[ ! -d "$rep" ]` |

💡 Exemple :
```bash
if [ "$age" -ge 18 ] && [ "$age" -lt 65 ]; then
  echo "Âge adulte actif"
fi
```

---

## 🧠 4. Les doubles crochets `[[ ]]`

`[[ ]]` est une version **améliorée** de `[ ]` :
- supporte `&&`, `||` sans quotes
- accepte les **regex** via `=~`
- évite des erreurs de syntaxe

💡 Exemple :
```bash
mot="bonjour"

if [[ $mot =~ bon ]]; then
  echo "Le mot contient 'bon'"
fi
```

---

## 🧱 5. Cas pratique complet

```bash
#!/bin/bash

verifier_utilisateur() {
  local user=$1
  if [ -z "$user" ]; then
    echo "Erreur : aucun utilisateur fourni."
    return 1
  elif [[ $user =~ ^root$ ]]; then
    echo "Bienvenue administrateur."
  else
    echo "Bonjour $user."
  fi
}

verifier_utilisateur "romain"
```

➡️ Résultat :
```
Bonjour romain.
```

---

## 🧾 6. Résumé rapide

| Type de test | Exemple | Description |
|---------------|----------|--------------|
| Numérique | `[ "$a" -gt "$b" ]` | supérieur |
| Chaîne | `[ -n "$a" ]` | non vide |
| Fichier | `[ -f "file.txt" ]` | existe et est un fichier |
| Logique | `[ "$a" -eq 1 ] && [ "$b" -eq 2 ]` | ET |
| Avancé | `[[ $mot =~ bon ]]` | correspondance partielle |

---

**Auteur :** Romain  
**Fichier :** `bash_conditions_tests_avances.md`
