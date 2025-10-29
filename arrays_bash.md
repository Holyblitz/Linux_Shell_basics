# 🧠 Les Tableaux (Arrays) en Bash

Les **tableaux** en Bash permettent de stocker plusieurs valeurs dans une seule variable.  
Ils sont très utilisés pour automatiser des scripts, traiter des fichiers ou manipuler des données structurées.

---

## 🔹 1. Déclarer un tableau

### Méthode simple :
```bash
fruits=("pomme" "banane" "orange")
```

### Accéder à un élément :
```bash
echo ${fruits[0]}   # Affiche "pomme"
echo ${fruits[1]}   # Affiche "banane"
```

### Ajouter un élément :
```bash
fruits+=("fraise")
```

### Afficher tout le tableau :
```bash
echo "${fruits[@]}"   # pomme banane orange fraise
```

### Afficher la longueur :
```bash
echo "${#fruits[@]}"  # 4
```

---

## 🔹 2. Parcourir un tableau

### Boucle simple :
```bash
for fruit in "${fruits[@]}"; do
  echo "$fruit"
done
```

Sortie :
```
pomme
banane
orange
fraise
```

---

## 🔹 3. Tableaux associatifs

Les **tableaux associatifs** utilisent des **clés textuelles** au lieu d’indices numériques.

### Déclaration :
```bash
declare -A capitales
capitales=(
  [France]="Paris"
  [Australie]="Sydney"
  [USA]="Washington"
)
```

### Accéder à un élément :
```bash
echo ${capitales[France]}   # Paris
```

### Ajouter un élément :
```bash
capitales[Italie]="Rome"
```

### Afficher toutes les valeurs :
```bash
echo "${capitales[@]}"   # Paris Sydney Washington Rome
```

### Afficher toutes les clés :
```bash
echo "${!capitales[@]}"  # France Australie USA Italie
```

### Boucle clé → valeur :
```bash
for pays in "${!capitales[@]}"; do
  echo "$pays → ${capitales[$pays]}"
done
```

Sortie :
```
France → Paris
Australie → Sydney
USA → Washington
Italie → Rome
```

---

## 🔹 4. Différence entre `-a` et `-A`

| Type              | Option `declare` | Type d’index | Exemple d’accès |
|-------------------|------------------|---------------|----------------|
| Tableau standard  | `-a`             | Numérique     | `${arr[0]}`    |
| Tableau associatif| `-A`             | Texte (clé)   | `${arr["clé"]}`|

---

## 🔹 5. Fonctions utiles et astuces

### Copier un tableau :
```bash
copy=("${fruits[@]}")
```

### Supprimer un élément :
```bash
unset 'fruits[1]'   # Supprime "banane"
```

### Réinitialiser un tableau :
```bash
fruits=()
```

### Tester si une clé existe :
```bash
if [[ -v capitales[France] ]]; then
  echo "Clé France présente !"
fi
```

---

## 🧩 6. Exemple complet

```bash
#!/bin/bash

# Déclaration
declare -A model_metrics=(
  [model_accuracy]=98
  [model_name]="knn"
  [model_f1]=0.82
)

# Boucle sur le tableau
for key in "${!model_metrics[@]}"; do
  echo "$key : ${model_metrics[$key]}"
done
```

Sortie :
```
model_accuracy : 98
model_name : knn
model_f1 : 0.82
```

---

## 🔹 Résumé rapide

| Commande | Description |
|-----------|--------------|
| `${array[@]}` | Toutes les valeurs |
| `${!array[@]}` | Toutes les clés |
| `${#array[@]}` | Taille du tableau |
| `declare -a` | Tableau indexé |
| `declare -A` | Tableau associatif |
| `unset 'array[i]'` | Supprime un élément |
| `array+=("valeur")` | Ajoute une valeur |

---

💡 **Astuce pratique** :  
Les tableaux associatifs sont parfaits pour organiser des **données structurées** dans un script (ex : modèles, villes, températures…).  
Ils remplacent souvent les CSV simples dans les petits projets Bash.
