![logotype](app/assets/images/logo.png)
# Easyway
Easyway est une application pour aider les familles à trouver des lieux de sortie adaptés aux bébés et aux enfants en bas âge.

## Contexte
Cette application a été développé en 2 semaines par une équipe de 4 étudiants, dans le cadre de la formation "Concepteur développeur Web" de l'établissement de formation "Le Wagon".

## Fonctionnalités
- Recommandations d'activités et transports adaptés
- Recherche d'une activité suivant sa localisation et ses critères (accessibilité, services, type de lieu, etc)
- Application participative où les utilisateurs peuvent :
  - ajouter des activités
  - noter les activités

## Configuration
- Rails 7.1.5
- Ruby 3.3.5
- Postgresql 1.1
- JS Stimulus
- HTML / CSS
- Clé API Cloudinary nécessaire
- Clé API Mapbox nécessaire

## Installation sur un serveur en local
Récupérer en local les sources du projet.

Depuis un terminal, lancer les commandes suivantes :
```
#=> installation des gems
bundle install

#=> création de la base de données
rails db:create

#=> création des tables
rails db:migrate

#=> création de données dans les tables
rails db:seed

#=> création d'un fichier environnement enregistré en local uniquement
touch .env
echo '.env*' >> .gitignore
```
Renseigner des clés API de Cloudinary et de Mapbox dans le fichier .env

Depuis le terminal, lancer la commande suivante :
```
#=> lancement d'un serveur en local
rails s
```
Ensuite ouvrir le serveur local dans un navigateur avec l'addresse indiquée dans le terminal.
