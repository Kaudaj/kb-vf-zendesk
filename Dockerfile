# Utilisation de l'image officielle Node.js. Remplacez "14" par la version souhaitée.
FROM node:18

# Création d'un répertoire pour l'application dans le conteneur Docker
WORKDIR /usr/src/app

# Copie des fichiers package.json et package-lock.json pour installer les dépendances de l'application
COPY package*.json ./

# Installation de pm2 globalement
RUN npm install pm2 -g

# Installation des dépendances de l'application
RUN npm install

# Copie du reste des fichiers de l'application dans le conteneur Docker
COPY . .

# Commande pour exécuter l'application
CMD ["pm2-runtime", "start", "ecosystem.config.cjs", "--env", "production"]
