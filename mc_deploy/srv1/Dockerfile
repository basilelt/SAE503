# srv1/Dockerfile
FROM itzg/minecraft-server

# Définir les variables d'environnement
ENV EULA=TRUE
ENV TYPE=PAPER
ENV ONLINE_MODE=FALSE
COPY ./config/paper-global.yml /config/paper-global.yml
# Définir le point de montage pour les volumes
VOLUME /data


# Commande par défaut pour démarrer le serveur Minecraft
CMD ["start"]