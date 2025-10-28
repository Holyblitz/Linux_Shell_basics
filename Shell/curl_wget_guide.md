# Guide pratique : curl et wget (téléchargement et requêtes web)

## 🌐 Introduction
`curl` et `wget` sont deux outils indispensables pour interagir avec le web en ligne de commande.  
Ils permettent de télécharger des fichiers, envoyer des requêtes HTTP, et même interagir avec des API REST.

---

## ⚙️ 1. Télécharger des fichiers

### ✅ wget (simple et robuste)
```bash
wget https://example.com/fichier.zip
```
➡️ Télécharge `fichier.zip` dans le dossier courant.

### ✅ curl (plus flexible)
```bash
curl -O https://example.com/fichier.zip
```
- `-O` : conserve le nom original du fichier.
- `-o nouveau_nom.zip` : définit un nom de sortie.

---

## 🔁 2. Reprendre un téléchargement interrompu

```bash
wget -c https://example.com/fichier.zip
curl -C - -O https://example.com/fichier.zip
```

---

## 🧠 3. Interagir avec des API (HTTP)

### GET request (lecture)
```bash
curl https://api.github.com/users/romain
```

### POST request (envoi de données)
```bash
curl -X POST -H "Content-Type: application/json"      -d '{"nom":"Romain","langage":"Python"}'      https://api.example.com/utilisateurs
```

### Authentification (token)
```bash
curl -H "Authorization: Bearer MON_TOKEN_API" https://api.example.com/data
```

---

## 🧩 4. Télécharger plusieurs fichiers

### wget (liste de fichiers)
```bash
wget -i liste_urls.txt
```

### curl (boucle shell)
```bash
for url in $(cat liste_urls.txt); do
  curl -O "$url"
done
```

---

## ⚡ 5. Astuces avancées

| Action | curl | wget |
|--------|------|------|
| Télécharger silencieusement | `curl -s -O URL` | `wget -q URL` |
| Limiter la vitesse | `curl --limit-rate 500k -O URL` | `wget --limit-rate=500k URL` |
| Télécharger un site entier | ❌ | `wget -r -l 2 -k URL` |
| Vérifier un code HTTP | `curl -I URL` | ❌ |

---

## 🧠 Exemple complet
```bash
# Télécharger les données d'une API et les enregistrer localement
curl -s https://api.exemple.com/data.json -o data.json

# Vérifier le code de réponse
curl -I https://api.exemple.com/data.json
```

---

**Auteur : Romain — Data Processing in Shell (Datacamp Series)**  
**Compatibilité : Linux / macOS / WSL (Ubuntu / Debian)**
