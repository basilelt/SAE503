# docker/game-server/Dockerfile
FROM itzg/minecraft-server

# Define environment variables
ENV EULA=TRUE
ENV VERSION=1.20.4
ENV TYPE=PAPER
ENV ONLINE_MODE=FALSE
ENV CREATE_CONSOLE_IN_PIPE=true
ENV PLUGINS_FILE=/config/plugins/plugins.txt

# Copy configuration files from the common directory
COPY server/common/game-server-files/plugins/plugins.txt /config/plugins/plugins.txt
COPY server/common/game-server-files/paper-global.yml /config/paper-global.yml
COPY server/common/game-server-files/db_config/luckperms_config.yml /data/plugins/LuckPerms/config.yml
COPY server/common/game-server-files/db_config/plan_config.yml /data/plugins/Plan/config.yml
COPY server/common/game-server-files/db_config/sql.yml /data/plugins/LibertyBans/sql.yml
COPY server/common/game-server-files/db_config/sql.conf /data/plugins/BlueMap/storages/sql.conf
COPY plugin/compiled_code/paper /data/plugins
COPY server/common/game-server-files/rusty/private/private.key /plugins/rustyconnector-paper/metadata/private.key
COPY server/common/game-server-files/rusty/connectors.yml /plugins/rustyconnector-paper/connectors.yml
#COPY server/common/game-server-files/rusty/config.yml /plugins/rustyconnector-paper/config.yml


# Set volume mount point
VOLUME /data

RUN chown -R 1000:1000 /data && \
    chmod -R 755 /data

# Default command to start the Minecraft server
CMD ["start"]