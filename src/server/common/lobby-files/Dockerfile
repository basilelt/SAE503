# docker/lobby/Dockerfile
FROM itzg/minecraft-server

# Define environment variables
ENV FORCE_WORLD_COPY=false
ENV EULA=TRUE
ENV VERSION=1.20.4
ENV TYPE=PAPER
ENV ONLINE_MODE=FALSE
ENV PLUGINS_FILE=/config/plugins/plugins.txt
ENV WORLD=/data/world/

# Copy configuration files from the common directory
COPY server/common/lobby-files/plugins/plugins.txt /config/plugins/plugins.txt
COPY server/common/lobby-files/paper-global.yml /config/paper-global.yml
COPY server/common/lobby-files/db_config/luckperms_config.yml /data/plugins/LuckPerms/config.yml
COPY server/common/lobby-files/db_config/plan_config.yml /data/plugins/Plan/config.yml
COPY server/common/lobby-files/db_config/sql.yml /data/plugins/LibertyBans/sql.yml
COPY server/common/lobby-files/db_config/sql.conf /data/plugins/BlueMap/storages/sql.conf
COPY plugin/compiled_code/paper /data/plugins

# Copy the world data
COPY server/common/lobby-files/mapLobby/Natural-Lobby /data/world

# Set volume mount point
VOLUME /data

WORKDIR /data

RUN chown -R 1000:1000 /data
RUN chmod -R 777 /data

# Default command to start the Minecraft server
CMD ["start"]