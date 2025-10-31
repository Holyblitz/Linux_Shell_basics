# Conditions IF en Bash

Les conditions `if` permettent d’exécuter des blocs de code selon qu’une expression soit vraie ou fausse.

---

## 🔹 Structure de base

```bash
if [ condition ]; then
  # instructions si la condition est vraie
elif [ autre_condition ]; then
  # instructions si la première est fausse mais celle-ci vraie
else
  # instructions si aucune condition n’est vraie
fi
```

---

## 🔹 Comparaisons de base

### 🧮 Nombres
| Opérateur | Signification |
|------------|---------------|
| `-eq` | égal |
| `-ne` | différent |
| `-lt` | inférieur |
| `-le` | inférieur ou égal |
| `-gt` | supérieur |
| `-ge` | supérieur ou égal |

Exemple :
```bash
num=5
if [ "$num" -ge 10 ]; then
  echo "Nombre supérieur ou égal à 10"
else
  echo "Nombre inférieur à 10"
fi
```

---

### 📝 Chaînes de caractères
| Opérateur | Signification |
|------------|---------------|
| `=` | égal |
| `!=` | différent |
| `-z` | chaîne vide |
| `-n` | chaîne non vide |

```bash
name="Romain"
if [ -n "$name" ]; then
  echo "Nom défini : $name"
fi
```

---

### 📂 Fichiers
| Test | Vérifie si… |
|-------|--------------|
| `-e fichier` | le fichier existe |
| `-f fichier` | c’est un fichier ordinaire |
| `-d dossier` | c’est un dossier |
| `-r fichier` | lisible |
| `-w fichier` | modifiable |
| `-x fichier` | exécutable |

```bash
if [ -f "script.sh" ]; then
  echo "Le fichier script.sh existe"
fi
```

---

## ⚙️ Syntaxes alternatives

### Double crochets `[[ ]]`
Plus robuste pour les chaînes et expressions régulières.
```bash
if [[ "$name" == R* ]]; then
  echo "Le nom commence par R"
fi
```

### Parenthèses doubles `(( ))`
Pour les opérations arithmétiques.
```bash
if (( num % 2 == 0 )); then
  echo "Pair"
else
  echo "Impair"
fi
```

---

## ✅ Bonne pratique
Toujours entourer les variables de guillemets :
```bash
if [ -n "$var" ]; then ...
```
Cela évite les erreurs quand la variable est vide ou contient des espaces.
