# Boucles en Bash

Les boucles permettent d’exécuter une ou plusieurs commandes plusieurs fois.

---

## 🔹 Boucle FOR

### Itération sur une liste :
```bash
for fruit in pomme banane cerise; do
  echo "Fruit : $fruit"
done
```

### Itération sur les fichiers d’un dossier :
```bash
for file in *.txt; do
  echo "Fichier trouvé : $file"
done
```

### Boucle numérique :
```bash
for i in {1..5}; do
  echo "Itération $i"
done
```

---

## 🔹 Boucle WHILE

Exécution tant qu’une condition est vraie.

```bash
count=1
while [ $count -le 5 ]; do
  echo "Compteur : $count"
  ((count++))
done
```

---

## 🔹 Boucle UNTIL

Exécution jusqu’à ce qu’une condition devienne vraie.

```bash
x=0
until [ $x -ge 3 ]; do
  echo "x vaut $x"
  ((x++))
done
```

---

## 🔹 Lire un fichier ligne par ligne

```bash
while read -r line; do
  echo "Ligne : $line"
done < fichier.txt
```

---

## 🔹 Commandes utiles

| Commande | Effet |
|-----------|--------|
| `break` | interrompt la boucle |
| `continue` | saute à l’itération suivante |

```bash
for i in {1..10}; do
  if (( i == 5 )); then
    continue  # saute l'affichage du 5
  fi
  echo "i = $i"
done
```

---

## ✅ Bonne pratique

Toujours utiliser `read -r` pour ne pas interpréter les `\` comme des caractères spéciaux.
