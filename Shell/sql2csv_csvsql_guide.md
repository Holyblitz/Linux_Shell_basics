# Guide pratique : sql2csv et csvsql (csvkit + SQLite)

## 🧩 Introduction

`csvkit` inclut des outils puissants pour interagir directement avec des bases de données **SQLite**, **MySQL**, ou **PostgreSQL**, sans quitter le terminal.  
Deux commandes clés permettent de relier SQL et CSV :
- `sql2csv` : Exporte les résultats d'une requête SQL vers un fichier CSV.
- `csvsql` : Permet d'exécuter des requêtes SQL directement sur des fichiers CSV, ou de créer une base de données à partir de CSV.

---

## ⚙️ 1. sql2csv — Exporter une table SQL vers CSV

### ✅ Exemple de base

```bash
sql2csv --db "sqlite:///SpotifyDatabase.db"         --query "SELECT * FROM SpotifyMostRecentData"         > SpotifyMostRecentData.csv
```

### 💡 Détails :
- `--db` : Spécifie le moteur et le chemin de la base (`sqlite:///` pour SQLite, `postgresql://` pour PostgreSQL, etc.).  
- `--query` : Contient la requête SQL à exécuter.  
- `>` : Redirige la sortie dans un fichier CSV local.  

### 📦 Exemple avec variable shell
```bash
sqlquery_pull="SELECT * FROM SpotifyMostRecentData"
sql2csv --db "sqlite:///SpotifyDatabase.db" --query "$sqlquery_pull" > SpotifyMostRecentData.csv
```

---

## ⚙️ 2. csvsql — Travailler en SQL directement sur des CSV

### ✅ Exemple : interroger un CSV
```bash
csvsql --query "SELECT track_id, loudness FROM SpotifyMostRecentData WHERE loudness < -10" SpotifyMostRecentData.csv
```

### ✅ Exemple : fusionner deux CSV via SQL
```bash
csvsql --query "SELECT * FROM spring UNION ALL SELECT * FROM summer" spring.csv summer.csv
```

### ✅ Exemple : créer une table SQL à partir d’un CSV
```bash
csvsql --db "sqlite:///SpotifyDatabase.db" --insert SpotifyMostRecentData.csv
```
💬 Cela crée une table dans la base SQLite et y insère les données du CSV.

---

## ⚡ Bonnes pratiques

1. Toujours vérifier les en-têtes avec `csvcut -n` avant d’écrire des requêtes.  
2. Pour de gros fichiers, préférer SQLite (plus rapide que CSV brut).  
3. Les variables shell (`$sqlquery_pull`) sont utiles pour réutiliser des requêtes.  
4. Les triples `/` après `sqlite:` sont obligatoires dans le chemin (`sqlite:///file.db`).  

---

## 🧠 Astuce finale

Pour exécuter une requête complexe sans quitter le terminal :
```bash
sql2csv --db "sqlite:///SpotifyDatabase.db" --query "SELECT COUNT(*) AS total_tracks, AVG(loudness) AS avg_loudness FROM SpotifyMostRecentData" > summary.csv
```
➡️ Cela exporte directement une **synthèse agrégée** dans `summary.csv`.

---

**Auteur : Romain — Data Processing in Shell Notes (Datacamp Series)**  
**Compatibilité : Linux / macOS / WSL (Ubuntu / Debian)**  
