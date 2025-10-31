# 🧠 Mini-guide AWK — Le couteau suisse du Shell

## 🔹 1. Structure générale

Une commande `awk` suit la structure suivante :

```bash
awk -F "séparateur" 'condition {action}' fichier
```

### Exemple simple :
```bash
awk -F "," '{print $2}' scores.csv
```
- `-F ","` → définit la **virgule** comme séparateur.  
- `$1`, `$2`, `$3`... → représentent les **champs** (colonnes).  
- `{print $2}` → affiche la **deuxième colonne**.

---

## 🔹 2. Variables intégrées importantes

| Variable | Signification |
|-----------|----------------|
| `NR` | Numéro de la ligne actuelle (record number) |
| `NF` | Nombre de champs dans la ligne |
| `$0` | Ligne entière |
| `$1`, `$2`, ... | Champs individuels (colonnes) |

---

## 🔹 3. Conditions et calculs

### Exemple : calculer la moyenne d'une colonne numérique
```bash
awk -F "," 'NR>1 {sum+=$2; count++} END {print "Moyenne:", sum/count}' scores.csv
```

**Explication :**
- `NR>1` → ignore la première ligne (en-tête).
- `sum+=$2` → ajoute la valeur de la 2ᵉ colonne à la somme.
- `count++` → compte le nombre de lignes.
- `END {print sum/count}` → affiche la moyenne après lecture du fichier.

---

## 🔹 4. Filtrage des données

Afficher uniquement les lignes où la note est supérieure à 80 :
```bash
awk -F "," '$2>80 {print $1, $2}' scores.csv
```
**Résultat :**
```
Bob 90
Charlie 85
Eve 88
```

---

## 🔹 5. Sauvegarder le résultat dans un fichier

```bash
awk -F "," '$2>80 {print $1, $2}' scores.csv > high_scores.txt
```

Cela enregistre le résultat dans `high_scores.txt`.

---

## 🔹 6. Bonus : plusieurs actions possibles

```bash
awk -F "," 'NR>1 {sum+=$2; if($2>80) print $1 " a une bonne note"} END {print "Moyenne:", sum/(NR-1)}' scores.csv
```

---

## ✅ Résumé rapide

| Concept | Commande | Description |
|----------|-----------|-------------|
| Séparateur | `-F ","` | Définit le délimiteur |
| Champ | `$1`, `$2` | Accès aux colonnes |
| Ligne | `$0` | Ligne complète |
| Condition | `$2 > 80` | Filtrer les valeurs |
| Calcul | `sum+=$2` | Additionner des valeurs |
| Sortie finale | `END {print sum/count}` | Exécuter après la fin du fichier |

---

**AWK = un mini langage de data processing intégré dans Linux.**
