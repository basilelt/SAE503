FROM itzg/mc-proxy

# Définir les variables d'environnement
ENV TYPE=VELOCITY
ENV DEBUG=false
ENV ENABLE_RCON=true

# Copier les fichiers de configuration
COPY config/velocity.toml /config/velocity.toml
COPY config/forwarding.secret /config/forwarding.secret

run chown -R 1000:1000 /config
RUN chmod -R 777 /config
# Définir le point de montage pour les volumes
VOLUME /server

# Exposer le port
EXPOSE 25577