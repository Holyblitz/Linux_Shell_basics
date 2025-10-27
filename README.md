# Linux_Shell_basics

# 🐧 Linux Shell Guide Basic

> _Un guide de révision complet pour maîtriser les bases du terminal Linux_  
> Auteur : **Romain**  
> Distribution : Debian / Arch Linux  

---

## 🧭 Introduction

Le **shell Linux** permet d’interagir avec le système d’exploitation par des commandes textuelles.  
C’est un outil essentiel pour tout développeur, data analyst ou administrateur système.  

### Types de shells
- **bash** : le plus courant
- **zsh** : plus moderne, souvent utilisé avec Oh My Zsh
- **fish** : interactif et simple, mais moins scriptable

### Symboles clés
| Symbole | Signification |
|----------|----------------|
| `~` | répertoire personnel |
| `/` | racine du système |
| `..` | répertoire parent |
| `$` | variable |
| `|` | enchaîner les commandes |
| `>` | rediriger (écrase) |
| `>>` | rediriger (ajoute) |
| `<` | lire depuis un fichier |
| `#` | commentaire |

---

## 📂 1. Navigation & gestion des fichiers

| Commande | Description |
|-----------|-------------|
| `pwd` | afficher le répertoire courant |
| `ls` | lister les fichiers (`-l`, `-a`, `-la`) |
| `cd` | changer de répertoire |
| `mkdir` / `rmdir` | créer / supprimer un dossier vide |
| `touch` | créer un fichier vide |
| `cp` | copier (`-r`, `-i`, `-v`) |
| `mv` | déplacer ou renommer |
| `rm` | supprimer (`-r`, `-f`, `-rf`) |

---

## 📖 2. Lecture & affichage

| Commande | Description |
|-----------|-------------|
| `cat` | afficher le contenu complet |
| `less` | lire page par page |
| `head -n N` | afficher les N premières lignes |
| `tail -n N` | afficher les N dernières lignes |
| `tail -f` | suivre les logs en temps réel |

Dans `less` :
- `/mot` → chercher un mot
- `Espace` → avancer
- `b` → reculer
- `q` → quitter

---

## 🔍 3. Recherche & filtrage

### `grep` — rechercher un motif
| Option | Description |
|---------|--------------|
| `-i` | ignorer la casse |
| `-v` | inverser la recherche |
| `-n` | afficher les numéros de ligne |
| `-r` | recherche récursive |
| `-c` | compter les correspondances |
| `-w` | mot exact |
| `-h` | ne pas afficher le nom du fichier |

Exemples :

bash
grep "data" notes.txt
grep -v "Header" fichier.csv
grep -c "error" logs.txt
grep -r "python" ~/Documents/`

✂️ 4. Extraction & tri
Commande	Utilité
cut	extraire des colonnes (-d, -f)
sort	trier (-r, -n, -u)
uniq	supprimer les doublons
wc -l	compter les lignes

`cut -d ',' -f 2 fichier.csv | grep -v Header | sort -r
grep "2024" logs.txt | wc -l`

🔁 5. Redirections & pipes
Symbole	Description
>	redirige vers un fichier (écrase)
>>	ajoute à la fin du fichier
<	lit depuis un fichier
`	`
Exemples :
`ls > liste.txt
cat data.txt | grep "AI" | wc -l`

💬 6. echo (afficher du texte ou des variables)

`echo "Texte" > fichier.txt
echo "Autre ligne" >> fichier.txtecho "Bonjour"
echo $USER
echo "Résultat : $((2+3))"
echo -e "Ligne1\nLigne2"`

Redirection :

`echo "Texte" > fichier.txt
echo "Autre ligne" >> fichier.txt`

🌟 7. Wildcards (caractères génériques)
Caractère	Description	Exemple
`*	0 ou plusieurs caractères	ls s*csv
?	exactement un caractère	ls ?u*.csv
[ ]	liste de caractères	ls [sw]*.csv`

🔁 8. Variables & boucles
Variables

`fichier=seasonal/winter.csv
head -n 1 $fichier`

Boucles

`for file in seasonal/*.csv; do
    grep 2017-07 $file | tail -n 1
done`

📝 9. Éditeur nano

Action	Raccourci
Enregistrer	Ctrl + O
Quitter	Ctrl + X
Couper / Coller	Ctrl + K / Ctrl + U
Rechercher	Ctrl + W
Aller à une ligne	Ctrl + _

Créer un script:
`nano mon_script.sh
chmod +x mon_script.sh
./mon_script.sh`

⚙️ 10. Gestion du système (bases)
Commande	Description
whoami	afficher l’utilisateur
date	date et heure
uptime	temps d’activité
df -h	espace disque
du -sh	taille d’un dossier
ps, top	processus en cours
kill PID	tuer un processus
history, clear	historique / nettoyer l’écran

💡 11. Astuces terminal
Raccourci	Fonction
Ctrl + C	interrompre une commande
Ctrl + L	effacer l’écran
↑ / ↓	historique des commandes
!!	relancer la dernière commande
!grep	relancer la dernière commande commençant par “grep”
Tab	autocomplétion
Ctrl + A / Ctrl + E	début / fin de ligne
Ctrl + R	rechercher dans l’historique

🧩 12. Debian vs Arch Linux
Action	Debian/Ubuntu	Arch Linux
Mise à jour	sudo apt update && sudo apt upgrade	sudo pacman -Syu
Installer	sudo apt install nom	sudo pacman -S nom
Supprimer	sudo apt remove nom	sudo pacman -R nom
Supprimer + conf	sudo apt purge nom	sudo pacman -Rns nom

⚠️ 13. Commandes à ne jamais taper
Commande	Danger
rm -rf /	efface tout le système
`:(){ :	:& };:`
chmod -R 777 /	désactive la sécurité
mkfs sur le mauvais disque	efface un volume entier

📚 14. Annexes & ressources

man commande — manuel officiel

commande --help — aide rapide

tldr commande — résumé clair

Créer un alias :

alias ll='ls -la'

