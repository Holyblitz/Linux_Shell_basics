# 🧩 Guide express — csvkit

## 🐍 Qu’est-ce que csvkit ?
`csvkit` est une suite d’outils en ligne de commande pour manipuler des fichiers **CSV, Excel, JSON ou SQL** comme un pro.
Il permet de faire en shell ce que tu ferais normalement en Python avec pandas : filtrer, trier, fusionner, convertir, etc.

---

## ⚙️ Installation et mise à jour

### Debian / Ubuntu :
```bash
pip install csvkit
pip install --upgrade csvkit  # mise à jour
```
### Vérification :
```bash
csvkit --version
```

---

## 🧰 Commandes principales

| Commande | Fonction principale | Exemple |
|-----------|--------------------|----------|
| **in2csv** | Convertir un fichier (Excel, JSON, etc.) en CSV | `in2csv data.xlsx > data.csv` |
| **csvcut** | Extraire certaines colonnes | `csvcut -c 1,3,5 data.csv` ou `csvcut -c "name","age" data.csv` |
| **csvgrep** | Filtrer des lignes selon un motif | `csvgrep -c "age" -m 30 data.csv` |
| **csvlook** | Afficher un CSV joliment dans le terminal | `csvlook data.csv` |
| **csvsort** | Trier les lignes selon une colonne | `csvsort -c "age" data.csv` |
| **csvstat** | Résumé statistique (type, moyenne, valeurs uniques…) | `csvstat data.csv` |
| **csvjoin** | Joindre deux CSV sur une clé commune | `csvjoin -c "id" file1.csv file2.csv > merged.csv` |
| **csvstack** | Empiler plusieurs CSV | `csvstack jan.csv feb.csv mar.csv > q1.csv` |
| **csvsql** | Exécuter une requête SQL sur un CSV | `csvsql --query "SELECT name, age FROM data WHERE age > 30" data.csv` |
| **csvclean** | Vérifier et corriger les erreurs de format | `csvclean bad.csv` |

---

## 📄 Commandes en détail

### 1️⃣ `in2csv` — conversion
```bash
in2csv SpotifyData.xlsx --sheet "Worksheet2_MusicAttributes" > SpotifyData.csv
```

### 2️⃣ `csvcut` — sélectionner des colonnes
Par position :
```bash
csvcut -c 1,3,5 Spotify_MusicAttributes.csv
```
Par nom :
```bash
csvcut -c "track_id","duration_ms","loudness" Spotify_MusicAttributes.csv
```
Lister les colonnes :
```bash
csvcut -n Spotify_MusicAttributes.csv
```

### 3️⃣ `csvgrep` — filtrer les lignes
```bash
csvgrep -c "artist" -m "The Beatles" songs.csv
csvgrep -i -c "genre" -m "Pop" songs.csv
```

### 4️⃣ `csvsort` — trier
```bash
csvsort -c "duration_ms" Spotify_MusicAttributes.csv
csvsort -c "duration_ms" -r Spotify_MusicAttributes.csv  # ordre décroissant
```

### 5️⃣ `csvstat` — statistiques
```bash
csvstat Spotify_MusicAttributes.csv
```

### 6️⃣ `csvjoin` — jointure
```bash
csvjoin -c "id" users.csv orders.csv > joined.csv
```

### 7️⃣ `csvstack` — concaténation
```bash
csvstack file1.csv file2.csv > all.csv
```

### 8️⃣ `csvsql` — SQL sur CSV
```bash
csvsql --query "SELECT track_id, loudness FROM Spotify_MusicAttributes WHERE loudness < -10" Spotify_MusicAttributes.csv
```

### 9️⃣ `csvclean` — nettoyage
```bash
csvclean bad_file.csv
```

---

## 🧠 Astuces
- Combine `csvkit` avec des pipes (`|`) :
  ```bash
  in2csv data.xlsx | csvgrep -c "genre" -m "Jazz" | csvlook
  ```
- `csvlook` est utile pour visualiser un CSV sans l’ouvrir ailleurs.
- `>` redirige la sortie vers un nouveau fichier.

---

## 🧩 Exemple complet
```bash
in2csv SpotifyData.xlsx --sheet "Worksheet2_MusicAttributes" | csvcut -c "track_id","duration_ms","loudness" | csvgrep -c "loudness" -r "^-1[0-9]" | csvsort -c "duration_ms" -r | csvlook
```

➡️ Convertit, filtre, trie et affiche joliment — tout ça sans quitter le terminal.
